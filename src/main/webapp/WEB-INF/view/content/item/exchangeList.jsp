
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dummyData"><%= java.lang.Math.round(java.lang.Math.random() * 1000000) %></c:set>

<div id="main-header">
    <div id="page-wrapper">
        <!-- DATA TABLE -->
        <div class="row col-lg-12 form-inline mb10">
            <div class="widget widget-table">
                <div class="widget-header">
                    <h3><i class="fa fa-desktop"></i> 검색결과</h3>
                </div>
                <div class="widget-content">
                    <table id="list_info" class="table table-sorting table-hover table-bordered">
                        <thead>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <!-- DATA TABLE END -->
    </div>
</div>

<script src="../../../js/lib/jquery.table2excel.js"></script>
<script type="text/javascript" src="/js/code/content/contentCodeList.js?${dummyData}"></script>

<script>
    $(document).ready(function() {
        fnc_exchangeList.init();
    });

var fnc_exchangeList = {};

//=------------------------------ Init / Event--------------------------------------------
    fnc_exchangeList.targetId= "exchangeList";

    fnc_exchangeList.init= function() {
        fnc_exchangeList.target = $("#"+fnc_exchangeList.targetId);
        fnc_exchangeList.targetDataTableId = "list_info_"+fnc_exchangeList.targetId;
        fnc_exchangeList.target.find("#list_info").attr("id", fnc_exchangeList.targetDataTableId);
        fnc_exchangeList.targetDataTable = fnc_exchangeList.target.find("#"+fnc_exchangeList.targetDataTableId);
        fnc_exchangeList.divDataTable = fnc_exchangeList.targetDataTable.parent("div");


        fnc_exchangeList.initDataTable();
    };


    fnc_exchangeList.dtList_info ="";
    fnc_exchangeList.initDataTable= function(){
        //=---------- Main DataTable ----------
        var dtList_info_data = function ( data ) {
        };

        fnc_exchangeList.dtList_info = new DalbitDataTable(fnc_exchangeList.targetDataTable, dtList_info_data, ItemDataTableSource.exchange, $("#searchForm"));
        fnc_exchangeList.dtList_info.useCheckBox(true);
        fnc_exchangeList.dtList_info.useIndex(true);
        fnc_exchangeList.dtList_info.createDataTable(this.initSummary);

        //---------- Main DataTable ----------=

        fnc_exchangeList.initDataTableButton();
        fnc_exchangeList.initEvent();
    };

    fnc_exchangeList.initSummary= function(json) {
        //------------- 우측 상단 통계 -----------------------------------
        var template = $('#tmp_exchangeListStatisticsFrm').html();
        var templateScript = Handlebars.compile(template);
        var context = json.summary;
        var html=templateScript(context);

        fnc_exchangeList.divDataTable = fnc_exchangeList.targetDataTable.parent("div");
        fnc_exchangeList.target.find("#div_summary").remove();
        fnc_exchangeList.divDataTable.find(".top-right").prepend(html);
    };


    // DataTable Button
    fnc_exchangeList.initDataTableButton= function() {
        var delBtn = '<input type="button" value="선택 삭제" class="btn btn-danger btn-sm" id="btn_delete" style="margin-right: 3px;"/>'
        var addBtn = '<input type="button" value="등록" class="btn btn-success btn-sm" id="btn_insert" style="margin-left: 3px;"/>'
        var excelBtn = '<button class="btn btn-default print-btn btn-sm" type="button" style="margin-left: 3px;"><i class="fa fa-print"></i>Excel Down</button>'
        var changeItemBtn = '<input type="button" value="네이티브 전송" class="btn btn-success btn-sm" id="btn_changeItem" style="margin-left: 3px;"/>'

        fnc_exchangeList.divDataTable.find(".footer-left").append(delBtn);
        fnc_exchangeList.divDataTable.find(".top-right").append(addBtn);
        // fnc_exchangeList.divDataTable.find(".footer-right").append(changeItemBtn);
    };



    fnc_exchangeList.initEvent= function(){
        fnc_exchangeList.target.find("#btn_insert").on("click", function () { //등록
            fnc_exchangeList.insertEvent();
        })

        fnc_exchangeList.target.find("#btn_delete").on("click", function () { //삭제
            fnc_exchangeList.deleteEvent();
        })

        // Detail 선택 이벤트
        fnc_exchangeList.target.on('click', '._getNoticeDetail', function(){
            var code = $(this).data('idx');
            var data = fnc_exchangeList.dtList_info.getDataRow(code);

            fnc_exchangeList.updateData(data);
        });

        // CheckBox 이벤트
        fnc_exchangeList.target.find('tbody').on('change', 'input[type="checkbox"]', function () {
            if($(this).prop('checked')){
                $(this).parent().parent().find('._getNoticeDetail').click();
            }
        });
    };


//=------------------------------ Option --------------------------------------------

    // 등록
    fnc_exchangeList.insertEvent= function() {
        //등록을 위한 데이터 초기화
        initSelectDataInfo();

        $("#tab_exchangeDetail").click();
        ui.unCheck(fnc_exchangeList.targetDataTableId);
    };

    // 삭제
    fnc_exchangeList.deleteEvent= function() {
        var checkDatas = fnc_exchangeList.dtList_info.getCheckedData();

        if(checkDatas.length <= 0){
            alert("삭제할 정보를 선택해주세요.");
            return false;
        }

        if(confirm("선택하신 " + checkDatas.length + "건의 정보를 삭제 하시겠습니까?")){

            var itemCodes = "";
            for(var idx=0; idx < checkDatas.length; idx++){
                var dataInfo = checkDatas[idx];
                if(common.isEmpty(dataInfo.item_code)){
                    dalbitLog("[delete] Item code does not exist. : ");
                    dalbitLog(dataInfo);
                    continue;
                }

                itemCodes += "," + dataInfo.item_code;
            }
            itemCodes = itemCodes.substring(1);

            var data = new Object();
            data.item_code = itemCodes;

            util.getAjaxData(fnc_exchangeList.targetId, "/rest/content/item/exchange/delete",data, fnc_exchangeList.fn_delete_success, fnc_exchangeList.fn_fail);
        };
    };

    // 수정
    fnc_exchangeList.updateData= function(data) {
        // 정보전달을 위한 값 셋팅
        setSelectDataInfo("data", data);

        var selectTabId = "exchangeDetail";
        console.log($("#contentTab").find(".active"))
        if(fnc_exchangeList.target.find("#contentTab").find(".active").length != 0){
            selectTabId = $("#contentTab").find(".active").find("a").prop("id").split("_")[1];
        }
        console.log(selectTabId)
        var targetFnc = eval("fnc_"+selectTabId);

        // targetFnc.updateDetail();
        $("#tab_" + selectTabId).click();
    };

    // 삭제 성공 시
    fnc_exchangeList.fn_delete_success= function(dst_id, data, dst_params){
        alert(data.message);

        // reload
        fnc_exchangeList.selectMainList();

        //상단 이동
        $('html').animate({scrollTop : 0}, 100);
        $("#"+fnc_exchangeDetail.formId).empty();
    };


    // Ajax 실패
    fnc_exchangeList.fn_fail= function(data, textStatus, jqXHR){
        alert(data.message);

        console.log(data, textStatus, jqXHR);
    };


    // 검색
    fnc_exchangeList.selectMainList= function(isResetPaging){
        /* 엑셀저장을 위해 조회조건 임시저장 */
        // tmp_search = $('#txt_search').val();
        // tmp_gubun = $("select[name='selectGubun']").val();

        fnc_exchangeList.dtList_info.reload(this.initSummary, isResetPaging);
    };

        // /*=---------- 엑셀 ----------*/
        // $('#excelDownBtn').on('click', function(){
        //     var formElement = document.querySelector("form");
        //     var formData = new FormData(formElement);
        //
        //     formData.append("search", tmp_search);
        //     formData.append("date", tmp_date);
        //     formData.append("gubun", tmp_gubun);
        //     formData.append("checkDate", tmp_checkDate);
        //     formData.append("stDate", tmp_stDate);
        //     formData.append("edDate", tmp_edDate);
        //     /*formData.append("test003", "test003");*/
        //     excelDownload($(this), "/rest/member/member/listExcel", formData, fn_success_excel, fn_fail_excel)
        // });

        // $("#excelBtn").on("click", function () {
        //     $("#list_info").table2excel({
        //         exclude: ".noExl",
        //         name: "Excel Document Name",
        //         filename: "report" +'.xls', //확장자를 여기서 붙여줘야한다.
        //         fileext: ".xls",
        //         exclude_img: true,
        //         exclude_links: true,
        //         exclude_inputs: true
        //     });
        // });
        //
        // function fn_success_excel(){
        //     console.log("fn_success_excel");
        // }
        //
        // function fn_fail_excel(){
        //     console.log("fn_fail_excel");
        // }
        /*----------- 엑셀 ---------=*/
</script>



<!-- =------------------ Handlebars ---------------------------------- -->
<script id="tmp_exchangeListStatisticsFrm" type="text/x-handlebars-template">

    <div id="div_summary" style="float:left">
        <table class="table table-sorting table-hover table-bordered dataTable no-footer" style="width:400px;">
            <tbody>
            <tr class="align-middle">
                <th class="no-padding no-margin" colspan="3">게시중 아이템</th>
                <th class="no-padding no-margin" colspan="1" rowspan="2">누적 구매현황</th>
            </tr>
            <tr>
                <th class="no-padding no-margin">PC</th>
                <th class="no-padding no-margin">Android</th>
                <th class="no-padding no-margin">IOS</th>
            </tr>
            <tr>
                <td class="no-padding no-margin" style="text-align:center;">{{pcCnt}}건</td>
                <td class="no-padding no-margin" style="text-align:center;">{{androidCnt}}건</td>
                <td class="no-padding no-margin" style="text-align:center;">{{iosCnt}}건</td>
                <td class="no-padding no-margin" style="text-align:center;">{{totalPurchaseCnt}}건</td>
            </tr>
            </tbody>
        </table>
    </div>
</script>