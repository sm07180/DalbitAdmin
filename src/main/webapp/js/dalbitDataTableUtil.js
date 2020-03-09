/**
 * ========= DataTale 작성 순서 ===========
 * 1. DataTable을 사용할 <table> 작성
 * 2. Ajax에서 사용할 Data를 작성 (function 으로 작성 하여야 데이터 갱신 됨)
 *   ex.)
 *      var dataTableAjaxData = function ( data ) {
            data.search = $('#txt_search').val()
            data.date = $('input[name="radio_date"]:checked').val()
            data.gubun = $("select[name='selectGubun']").val()
            data.checkDate = $("input:checkbox[id='check_dateSel']").is(":checked")
            data.stDate = $('#txt_startSel').val()
            data.edDate = $('#txt_endSel').val()
        };
 * 3. DataTable를 사용하기 위한 DataTableSource 작성  (/js/dataTableSource/dataTableSource.js 참고)
 * 4. DataTable 초기화
 *  ex.) datTable_1 = new DalbitDataTable($("#적용할 테이블 ID"), Ajax에 사용할 Data 변수 (2번), DataTableSource (3번));
 * 5. DataTable 옵션 적용 ( CheckBox(default False), Index(default False), rowClick Event 등등)
 * 6. DataTable Create
 *  ex.) datTable_1.createDataTable() -> 테이블 생성 or datTable_1.createDataTable(afterFn)  -> 테이블 생성 후 afterFn 함수 호출
 *
 *  ========= DataTale 옵션 ===========
 *  1. DataTable 재호출
 *  ex.) dataTable_1.reload()
 *  2. 기존 DataTable의 DataSource 변경 - 기존 테이블에서 내용이 전체 바뀔 경우 사용
 *  ex.) dataTable_1.changeReload(url, data, columnsInfo, initFn);
 *
 **/


function DalbitDataTable(dom, param, columnsInfo, searchForm) {
    this.dom = dom;
    this.columnsInfo = columnsInfo;
    var url = this.columnsInfo.url;
    var dataSource = this.columnsInfo;
    var dom = this.dom;
    var columnsInfo = this.columnsInfo;
    var _searchForm = searchForm;

    //초기화
    this.initDataTableSource();

    this.dataTableSource = {
        dom: '<"dataTable-top"<"top-left pull-left dataTable-div"<"comments">><"top-right pull-right dataTable-div">>rt<"dataTable-footer"<"footer-left pull-left dataTable-div"i><"footer-right pull-right dataTable-div">p>',
        destroy: true,                                                                   //테이블 파괴가능
        pageLength: 5,                                                                  // 한 페이지에 기본으로 보여줄 항목 수
        bPaginate: true,                                                                // 페이징 처리 여부.
        bLengthChange: true,                                                        //  페이지 표시 건수 변동 기능 사용 여부
        lengthMenu : [ [ 5, 10, 20, 30, 40 ], [ 5, 10, 20, 30, 40 ] ],                  // "bLengthChange" 리스트 항목을 구성할 옵션
        bAutoWidth: false,                                                            // 자동 Width 계산 여부
        processing: false,                                                              // Process 바 출력 여부
        ordering: true,                                                                 // 정렬 사용 여부
        serverSide: true,                                                             // 서버에서 정렬한 데이터 그대로 사용할지 여부 (false : 서버에서 정렬한 데이터도 client에서 다시 재정렬)
        searching: false,                                                               // 서칭 기능 사용 여부
        pagingType: "full_numbers",
        deferLoading: 0,
        bStateSave: true,
        ajax : {
            'url':url,
            'type':"POST",
            'data': param,
            // 'dataSrc': "data"
            'dataFilter': function(data){
                var json = jQuery.parseJSON(data);
                dalbitLog("[dataFilter]");
                //dalbitLog(json);

                var totalCnt = isEmpty(json.pagingVo) ? 0 : json.pagingVo.totalCnt;
                var data = json.data;

                json.recordsTotal = totalCnt;
                json.recordsFiltered = totalCnt;
                json.data = data;

                return JSON.stringify( json ); // return JSON string
            }
        },
        fnServerParams: function ( aoData ) {
            dalbitLog("[fnServerParams]");

            aoData.pageNo = aoData.start / aoData.length + 1;
            aoData.pageStart = aoData.start;
            aoData.pageCnt = aoData.length;

            if(aoData.order.length > 0){
                aoData.orderColumnIdx = aoData.order[0]["column"];
                aoData.orderDir = aoData.order[0]["dir"];
                aoData.tableColumnName = aoData.columns[aoData.orderColumnIdx]["data"];
                aoData[aoData.columns[aoData.orderColumnIdx]["name"]] = convertSort(aoData.order[0]["dir"]);
            }

            //검색조건 data에 추가.
            if(!isEmpty(_searchForm)){
                var formArray = _searchForm.serializeArray();
                for (var i = 0; i < formArray.length; i++){
                    aoData[formArray[i]['name']] = formArray[i]['value'];
                }
            }


            dalbitLog(aoData);
        },
        fnPreDrawCallback: function(oSettings){
            dalbitLog("[fnPreDrawCallback]");

            // 최초 Order 저장
            $(oSettings.aoColumns).each(function () {
                if(isEmpty(this.initSortable)){
                    this.initSortable = this.bSortable;
                }
            });
        },
        fnDrawCallback: function(oSettings){
            dalbitLog("[fnDrawCallback]");
            $('.dataTables_paginate > .pagination').addClass('borderless');

            // 조회 데이터 없을 경우
            if(isEmpty(oSettings.fnRecordsTotal()) || oSettings.fnRecordsTotal() <= 0){
                // Header Ordering 이미지 제거
                $(oSettings.aoHeader[0]).each(function(){
                    var header = $(this.cell);
                    header.prop("class", "");
                });
                // Header Ordering Event 제거
                $(oSettings.aoColumns).each(function () {
                    this.bSortable = false;
                });

                // Paging 비노출
                dom.parent("div").find(".pagination").remove();
                // Total Cnt 비노출
                dom.parent("div").find(".dataTables_info").hide();
            }else{
                // Header Ordering Event 재설정
                $(oSettings.aoColumns).each(function () {
                    this.bSortable = this.initSortable;
                });

                // Total Cnt 노출
                dom.parent("div").find(".dataTables_info").show();
            }
        },
        fnInitComplete: function(oSettings){
            dalbitLog("[fnInitComplete]");
            // Comments 설정
            var comments = isEmpty(columnsInfo.comments) ? "" : columnsInfo.comments;
            dom.parent("div").find(".comments").html(comments);
        },
        columnDefs: [
            {
                'targets': [0,1],
                'searchable': false,
                'orderable': false,
            },
            {
                'targets': 0,
                'className': 'dt-body-center',
                'render': function (data, type, full, meta) {
                    return '<input type="checkbox" name="id[]" value="' + $('<div/>').text(data).html() + '">';
                }
        }],
        columns : [
            {"title": "<input type=\"checkbox\" name=\"select_all\" value=\"1\" id=\""+ this.dom.prop("id") +"-select-all\" />" ,"data": null, "width": "20px"},
            {"title": "No.", "data": "rowNum", "width": "20px", "defaultContent": "-", 'render' : function(data, type, row, meta, a, b){
                    var totalCnt = isEmpty(meta.settings.json.pagingVo.totalCnt) ? 0 : meta.settings.json.pagingVo.totalCnt;
                    return totalCnt - data + 1;
                }
            },
        ],
        order: [[ 2, 'asc' ]]
    }

    var columnDefs = columnsInfo.columnDefs;
    var columns = columnsInfo.columns;

    if(!isEmpty(columnDefs)){
        this.dataTableSource.columnDefs = this.dataTableSource.columnDefs.concat(columnDefs);
    }

    if(!isEmpty(columns)){
        this.dataTableSource.columns = this.dataTableSource.columns.concat(columns);
    }
}








/* === Init =================================================================*/

    // 데이터 초기화
    DalbitDataTable.prototype.initDataTableSource = function(){
        // 체크박스 사용
        this.isUseCheckbox = false;
        // 넘버링 사용 여부
        this.isUseIndex = false

        // ClickEvent Function
        this.arrayClickEvent = {};
        // DataTable 존재여부
        this.g_DataTable = null;
    }

    DalbitDataTable.prototype.initDataTable = function(){
        var parent = this.dom.parent("div");
        this.dom.empty();
        if(this.dom.prop("id")+"_wrapper" == parent.prop("id")){
            parent.empty();
            parent.append(this.dom);
        }

        this.destroy();
    }

    // Create DataTable
    DalbitDataTable.prototype.createDataTable = function (initFn) {
        //초기화
        this.initDataTable();

        this.dataTableSource.ajax.complete = function (response) {
            dalbitLog("[complete]");

            if(!isEmpty(response.responseJSON)){
                dalbitLog(response.responseJSON);
            }

            // 완료 후 처리 함수
            if(!isEmpty(initFn)){
                initFn();
            }
        };

        this.g_DataTable = this.dom.DataTable(this.dataTableSource);

        this.g_DataTable.column(0).visible(this.isUseCheckbox);
        this.g_DataTable.column(1).visible(this.isUseIndex);

        this.initEvent();
    }


    // Init Event
    DalbitDataTable.prototype.initEvent =  function (){
        var allCheckBox = $("#" + this.dom.prop("id") + "-select-all");
        // var g_DataTable = this.dom.DataTable();
        var g_DataTable = this.g_DataTable;
        var dom = this.dom;

        // Row Click Event
        var arrayClickEvent = this.arrayClickEvent;
        this.dom.children('tbody').on('click', 'td', function () {
            var idxColumn = $(this).index();
            var idxViewRow = $(this).parent("tr").index();
            var idxRealRow = g_DataTable.row($(this).parent("tr")).index();
            var data = g_DataTable.row($(this).parent("tr")).data();


            if(!isEmpty(arrayClickEvent[idxColumn])){
                arrayClickEvent[idxColumn](data, idxViewRow, idxColumn, idxRealRow);
                return;
            }

            if(!isEmpty(arrayClickEvent["-1"])){
                arrayClickEvent["-1"](data, idxViewRow, idxColumn, idxRealRow);
                return;
            }
        });

        // 상단 CheckBox 전체 선택 Event
        allCheckBox.on('click', function () {
            var rows = dom.DataTable().rows({ 'search': 'applied' }).nodes();
            $('input[type="checkbox"]', rows).prop('checked', this.checked);
        });

        // 전체 선택 이후 하위 CheckBox 해제 시 상단 CheckBox UI 변경 Event
        this.dom.children('tbody').on('change', 'input[type="checkbox"]', function () {
            if (!this.checked) {
                var el = allCheckBox.get(0);

                if (el && el.checked && ('indeterminate' in el)) {
                    el.indeterminate = true;
                }
            }

            //하나만 선택
            // $('input[type="checkbox"]').not(this).prop("checked", false);
        });
    }






/* === Option =================================================================*/

    // DataTable Reload / Ajax 재호출
    DalbitDataTable.prototype.reload = function () {
        this.dom.DataTable().ajax.reload();
    }

    // DataTable Reload / Url, Data, Columns 초기화 후 Reload (기존 테이블 변경  시 사용)
    DalbitDataTable.prototype.changeReload = function (url, data, columnsInfo, initFn){
        this.initDataTable();

        if(!isEmpty(url)) {
            this.dataTableSource.ajax.url = url;
        }

        if(!isEmpty(data)) {
            this.dataTableSource.ajax.data = data;
        }

        var infoUrl = columnsInfo.url;
        var columnDefs = columnsInfo.columnDefs;
        var columns = columnsInfo.columns;
        this.columnsInfo = columnsInfo;

        if(!isEmpty(infoUrl)){
            this.dataTableSource.ajax.url = infoUrl;
        }

        if(!isEmpty(columnDefs)) {
            if(!isEmpty(this.dataTableSource.columnDefs)){
                this.dataTableSource.columnDefs = this.dataTableSource.columnDefs.slice(0,2);
                this.dataTableSource.columnDefs = this.dataTableSource.columnDefs.concat(columnDefs);
            }

            if(!isEmpty(this.dataTableSource.aoColumnDefs)){
                this.dataTableSource.aoColumnDefs = this.dataTableSource.aoColumnDefs.slice(0,2);
                this.dataTableSource.aoColumnDefs = this.dataTableSource.aoColumnDefs.concat(columnDefs);
            }
        }

        if(!isEmpty(columns)) {
            if(!isEmpty(this.dataTableSource.columns)){
                this.dataTableSource.columns = this.dataTableSource.columns.slice(0,2);
                this.dataTableSource.columns = this.dataTableSource.columns.concat(columns);
            }

            if(!isEmpty(this.dataTableSource.aoColumns)){
                this.dataTableSource.aoColumns = this.dataTableSource.aoColumns.slice(0,2);
                this.dataTableSource.aoColumns = this.dataTableSource.aoColumns.concat(columns);
            }
        }

        this.createDataTable(initFn);
        // this.dom.DataTable().ajax.reload();
    }

    // DataTable 제거
    DalbitDataTable.prototype.destroy = function(){
        if(this.g_DataTable != null){
            this.dom.DataTable().destroy();
            this.g_DataTable = null
        }
    }

    // DataTable 최초 생성시 데이터 로드 여부
    DalbitDataTable.prototype.useInitReload = function(isUse){
        if(isUse){
            delete this.dataTableSource.deferLoading;
        }else{
            this.dataTableSource.deferLoading = 0;
        }
    }

    // Table만 보여짐
    DalbitDataTable.prototype.onlyTableView = function(){
        this.dataTableSource.dom = "t";
    }

    // 정렬사용여부
    DalbitDataTable.prototype.useOrdering = function(isUse){
        if(isEmpty(isUse)){return false;}
        this.dataTableSource.ordering = isUse;
    }




/* === Getter =================================================================*/

    /* DataTable Source  */
    DalbitDataTable.prototype.getSource = function () {
        return this.dataTableSource;
    };

    /* getData(Array) from CheckBox  */
    DalbitDataTable.prototype.getCheckedData = function (){
        var arrayData = new Array;
        var dom = this.dom;

        this.dom.children('tbody').find('input[type="checkbox"]').each(function () {
            if (this.checked) {
                var data = dom.DataTable().row($(this).parent("td").parent("tr")).data();
                arrayData.push(data);
            }
        });

        return arrayData;
    }

    /* get Row Idx Data  */
    DalbitDataTable.prototype.getDataRow = function (idxRow) {
        dalbitLog(this.dom.DataTable().row(idxRow).data());
        return this.dom.DataTable().row(idxRow).data();
    }

    /* get Rows Size  */
    DalbitDataTable.prototype.getRowSize = function(){
        dalbitLog(this.dom.DataTable().row()[0].length);
        return this.dom.DataTable().row()[0].length;
    }





/* === Setter =================================================================*/

    /* DataTable Source  */
    DalbitDataTable.prototype.setSource = function (dataTableSource) {
        this.dataTableSource = dataTableSource;
    };

    /* set Ajax URL  */
    DalbitDataTable.prototype.setURL = function (url) {
        this.dataTableSource.ajax.url = url;
    }

    /* set Use CheckBox  */
    DalbitDataTable.prototype.useCheckBox = function (isUse) {
        this.isUseCheckbox = isUse;
    }

    /* set Use Index  */
    DalbitDataTable.prototype.useIndex = function (isUse) {
        this.isUseIndex = isUse;
    }

    DalbitDataTable.prototype.setPageLength = function(pageLength){
        this.dataTableSource.pageLength = pageLength;
    }

    /* set Search Visible */
    DalbitDataTable.prototype.useSearch = function (isUse) {
        this.dataTableSource.searching = isUse;
    }

    /* set Row Click Event 함수 지정, 이벤트 column 지정 */
    DalbitDataTable.prototype.setEventClick = function (eventFnc, column) {
        if(isEmpty(eventFnc)){
            dalbitLog("[DalbitDataTable.prototype.setEventClick] eventFnc is Null!!");
            return;
        }

        var inputEvent = this.arrayClickEvent;

        if(!isEmpty(column)){
            var arrayColumn = column.toString().split(",");

            for(var idx=0; idx < arrayColumn.length; idx++){
                inputEvent[(arrayColumn[idx])] = eventFnc;
            }
        }else{
            inputEvent["-1"] = eventFnc;
        }

        this.arrayClickEvent = inputEvent;
    }

    DalbitDataTable.prototype.setOrder = function (columnIdx, orderDir) {
        dalbitLog("[Order] columnidx:" + columnIdx + " / orderDir :" + orderDir)
        if(isEmpty(orderDir)){orderDir = "desc"}
        this.dataTableSource.order = [[ columnIdx, orderDir ]] ;
    }