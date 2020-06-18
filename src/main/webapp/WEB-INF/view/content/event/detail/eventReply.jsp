
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="main-header">
    <!-- DATA TABLE -->
    <div class="row col-lg-12 form-inline">
        <div class="widget widget-table" id="eventReplyDataTable">
            <span id="event_summaryArea"></span>
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

<form id="noticeForm"></form>

<script src="../../../js/lib/jquery.table2excel.js"></script>
<script type="text/javascript" src="/js/code/content/contentCodeList.js?${dummyData}"></script>

<script>
    $(document).ready(function() {

    });

    var fnc_eventReply = {};

//=------------------------------ Init / Event--------------------------------------------
    fnc_eventReply.targetId= "eventReply";

    fnc_eventReply.init= function() {
        fnc_eventReply.target = $("#"+fnc_eventReply.targetId);
        fnc_eventReply.targetDataTableId = "list_info_"+fnc_eventReply.targetId;
        fnc_eventReply.target.find("#list_info").attr("id", fnc_eventReply.targetDataTableId);
        fnc_eventReply.targetDataTable = fnc_eventReply.target.find("#"+fnc_eventReply.targetDataTableId);
        fnc_eventReply.divDataTable = fnc_eventReply.targetDataTable.parent("div");

        /** 선택된 데이터 정보 조회  */
        if(!common.isEmpty(getSelectDataInfo())){
            console.log(getSelectDataInfo());
            fnc_eventReply.dataKey = getSelectDataInfo().dataKey;
            fnc_eventReply.data = getSelectDataInfo().data;
        }else{
            fnc_eventReply.dataKey = null;
            fnc_eventReply.data = null;
        }

        fnc_eventReply.initDataTable();
        fnc_eventReply.initEvent();
        // this.getEventReplySubData();

        var scrollPosition = $("#tab_"+fnc_eventReply.targetId).offset();
        util.scrollPostion(scrollPosition.top);
    };


    fnc_eventReply.dtList_info= "";
    fnc_eventReply.initDataTable= function(){
        //=---------- Main DataTable ----------
        var dtList_info_data = function ( data ) {
            console.log("event_idx : " + common.isEmpty(fnc_eventReply.data)?"-1":fnc_eventReply.data.idx);
            data.event_idx = common.isEmpty(fnc_eventReply.data)?"-1":fnc_eventReply.data.idx;
            // data.pageCnt = 20;
            // data.length = 20;
        };
        console.log(dtList_info_data)
        fnc_eventReply.dtList_info = new DalbitDataTable(fnc_eventReply.targetDataTable, dtList_info_data, EventDataTableSource.reply);
        fnc_eventReply.dtList_info.useCheckBox(true);
        fnc_eventReply.dtList_info.useIndex(true);
        fnc_eventReply.dtList_info.setPageLength(20);
        fnc_eventReply.dtList_info.createDataTable();

        fnc_eventReply.initDataTableButton();
        //---------- Main DataTable ----------=
    };


    fnc_eventReply.order= 0;
    fnc_eventReply.reportData= "";
    fnc_eventReply.initSummary= function(json) {
        dalbitLog(json);
    };


    // DataTable Button
    fnc_eventReply.initDataTableButton= function() {
        var deleteReplyBtn = '<input type="button" value="선택삭제" class="btn btn-danger btn-sm" id="btn_reply_delete" style="margin-left: 3px;"/>'
        // var insertNoticeBtn = '<input type="button" value="바로 공지하기" class="btn btn-success btn-sm" id="btn_insertNotice" style="margin-left: 3px;"/>'
        // // var winnerDelBtn = '<input type="button" value="당첨취소" class="btn btn-danger btn-sm" id="btn_winnerDel" style="margin-left: 3px;"/>'
        // var excelBtn = '<button class="btn btn-default print-btn btn-sm" type="button" style="margin-left: 3px;"><i class="fa fa-print"></i>Excel Down</button>'
        //
        //
        fnc_eventReply.divDataTable = fnc_eventReply.targetDataTable.parent("div");
        //
        fnc_eventReply.divDataTable.find(".footer-left").append(deleteReplyBtn);
        // fnc_eventReply.divDataTable.find(".footer-left").append(insertNoticeBtn);
        // // this.divDataTable.find(".footer-right").append(winnerDelBtn);
        // fnc_eventReply.divDataTable.find(".footer-right").append(excelBtn);
    };

    fnc_eventReply.initEvent= function(){
        fnc_eventReply.target.find("#btn_reply_delete").on("click", function () { //선택삭제
            fnc_eventReply.deleteReplyEvent();
        });
    };

//=------------------------------ Option --------------------------------------------
    //선택삭제
    fnc_eventReply.checkDatas= "";
    fnc_eventReply.deleteReplyEvent=function() {
        fnc_eventReply.checkDatas = fnc_eventReply.dtList_info.getCheckedData();
        if(fnc_eventReply.checkDatas.length <= 0){
            alert("삭제할 댓글을 선택해주세요.");
            return false;
        }
        if(confirm(fnc_eventReply.checkDatas.length +'건을 삭제하시겠습니까?')) {
            for (var i = 0; i < fnc_eventReply.checkDatas.length; i++) {
                util.getAjaxData(fnc_eventReply.targetId, "/rest/content/event/reply/delete", fnc_eventReply.checkDatas[i], fnc_eventReply.event_reply_delete_success, fnc_eventReply.event_fail);
            }
        }
    };

    fnc_eventReply.event_reply_delete_success= function(dst_id, response){
        if(response.result == "fail"){
            return false;
        }
        fnc_eventReply.dtList_info.reload();
    };
    fnc_eventReply.event_fail= function(dst_id, data){
        console.log(data.message);
        // fnc_eventReply.dtList_info.reload(fnc_eventReply.initSummary);
    };


    // object를 키 이름으로 정렬하여 반환

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
