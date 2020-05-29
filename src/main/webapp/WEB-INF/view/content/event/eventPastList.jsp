
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="main-header">
    <div id="page-wrapper">
        <!-- DATA TABLE -->
        <div class="row col-lg-12 form-inline">
            <div class="widget widget-table" id="pastEventDataTable">
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
        fnc_pastEventList.init();
    });

    var fnc_pastEventList = {}

    //=------------------------------ Init / Event--------------------------------------------
    fnc_pastEventList.targetId= "pastEventList";

    fnc_pastEventList.init= function() {
        fnc_pastEventList.target = $("#"+fnc_pastEventList.targetId);
        fnc_pastEventList.targetDataTableId = "list_info_"+fnc_pastEventList.targetId;
        fnc_pastEventList.target.find("#list_info").attr("id", fnc_pastEventList.targetDataTableId);
        fnc_pastEventList.targetDataTable = fnc_pastEventList.target.find("#"+fnc_pastEventList.targetDataTableId);
        fnc_pastEventList.divDataTable = fnc_pastEventList.targetDataTable.parent("div");

        fnc_pastEventList.initDataTable();
        fnc_pastEventList.initEvent();
    };


    fnc_pastEventList.dtList_info= "",
    fnc_pastEventList.initDataTable= function(){
        //=---------- Main DataTable ----------
        var dtList_info_data = function ( data ) {
            data.searchText = $('#txt_search').val();                        // 검색명
            data.search_event = $("select[name='search_event']").val()
            data.state = 1;
        };
        fnc_pastEventList.dtList_info = new DalbitDataTable(fnc_pastEventList.targetDataTable, dtList_info_data, EventDataTableSource.endEvent);
        fnc_pastEventList.dtList_info.useCheckBox(true);
        fnc_pastEventList.dtList_info.useIndex(true);
        fnc_pastEventList.dtList_info.createDataTable();
        fnc_pastEventList.initDataTableButton();
        //---------- Main DataTable ----------=
    };


    // DataTable Button
    fnc_pastEventList.initDataTableButton= function() {
        var delBtn = '<input type="button" value="선택 삭제" class="btn btn-danger btn-sm" id="btn_delete" style="margin-right: 3px;"/>'
        var addBtn = '<input type="button" value="등록" class="btn btn-success btn-sm" id="btn_insert" style="margin-left: 3px;"/>'
        var excelBtn = '<button class="btn btn-default print-btn btn-sm" type="button" style="margin-left: 3px;"><i class="fa fa-print"></i>Excel Down</button>'

        fnc_pastEventList.divDataTable.find(".footer-left").append(delBtn);
        fnc_pastEventList.divDataTable.find(".top-right").append(addBtn);
        fnc_pastEventList.divDataTable.find(".footer-right").append(excelBtn);
    };



    fnc_pastEventList.initEvent= function(){
        fnc_pastEventList.target.find("#btn_insert").on("click", function () { //등록
            fnc_pastEventList.insertEvent();
        });

        fnc_pastEventList.target.find("#btn_delete").on("click", function () { //삭제
            fnc_eventList.deleteEvent("pastList");
        });

        // CheckBox 이벤트
        fnc_pastEventList.target.find('tbody').on('change', 'input[type="checkbox"]', function () {
            if($(this).prop('checked')){
                $(this).parent().parent().find('.getEventDetail').click();
            }
        });
    };


    //=------------------------------ Option --------------------------------------------

    // 등록
    fnc_pastEventList.insertEvent= function() {
        dalbitLog('insertEvent')
        initSelectDataInfo();

        $('#div_eventTabList').removeClass("hide");
        // fnc_eventDetail.insertEventDetail();
        $("#tab_eventDetail").click();

        fnc_pastEventList.target.find('.dt-body-center input[type="checkbox"]').prop('checked', false);

    };

    fnc_pastEventList.getEventDetail_info= function(index){
        $('#div_eventTabList').removeClass("hide");
        var data = this.dtList_info.getDataRow(index);
        setSelectDataInfo("data", data);
        // fnc_eventDetail.updateEventDetail(data);
        event_idx = data.idx;
        $("#tab_eventDetail").click();
    };

    // 검색
    fnc_pastEventList.selectMainList= function(isResetPaging){
        fnc_pastEventList.dtList_info.reload(null, isResetPaging);
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

    /*function eventPastList_fullSize(url) {     // 이미지 full size
        $("#eventPastList_fullSize").html(util.imageFullSize("eventPastListFullSize",url));
        $('#eventPastListFullSize').modal('show');
    }

    function modal_close(){
        $("#eventPastListFullSize").modal('hide');
        $("#eventDetailFullSize").modal('hide');
        $("#eventListFullSize").modal('hide');
    }*/

</script>