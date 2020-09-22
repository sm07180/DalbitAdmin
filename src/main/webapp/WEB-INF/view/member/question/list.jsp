<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dummyData"><%= java.lang.Math.round(java.lang.Math.random() * 1000000) %></c:set>

<div class="col-lg-12 no-padding">
    <div class="widget widget-table" id="main_table">
        <span id="question_summaryArea"></span>
        <div class="widget-content">
            <table id="list_info_detail" class="table table-sorting table-hover table-bordered datatable">
                <thead id="tableTop_detail"></thead>
                <tbody id="tableBody_detail"></tbody>
            </table>
        </div>
    </div>
</div>
<div class="col-md-12 no-padding">
    <jsp:include page="questionTab.jsp"></jsp:include>
</div>

<script type="text/javascript" src="/js/code/customer/customerCodeList.js?${dummyData}"></script>
<script type="text/javascript" src="/js/code/customer/questionCodeList.js?${dummyData}"></script>

<script>
    $(document).ready(function() {
    });

    var tmp_slctPlatform = null;
    var tmp_slctState = -1;
    var storageTimer;
    function getHistory_questionDetail(tmp) {     // 상세보기
        if(tmp.indexOf("_") > 0){ tmp = tmp.split("_"); tmp = tmp[1]; }
        var dtList_info_detail_data = function (data) {
            data.searchText = memNo;
            data.searchType = 1;
            data.slctPlatform = tmp_slctPlatform;
            data.slctState = tmp_slctState;
        };
        dtList_info_detail = new DalbitDataTable($("#"+tmp).find("#list_info_detail"), dtList_info_detail_data, questionDataTableSource.memDetail_questList);
        dtList_info_detail.useCheckBox(false);
        dtList_info_detail.useIndex(true);
        dtList_info_detail.setPageLength(50);
        dtList_info_detail.createDataTable();

        initDataTableTop_select_quest(tmp);         // 상탄 selectBox
    }
    function initDataTableTop_select_quest(tmp){
        var topTable = '';
        topTable += '<span name="question_platform" id="question_platform" onchange="sel_change_question();"></span>';


        $("#"+tmp).find("#main_table").find(".top-left").addClass("no-padding").append(topTable);
        // $("#search_question_top").html(util.getCommonCodeSelect(-1, question));
        $("#question_platform").html(util.getCommonCodeSelect(-1, question_platform));

        //summary
        var obj = new Object();
        obj.mem_no = memNo;
        util.getAjaxData("summary", "/rest/customer/question/questionCount_target", obj, question_fn_success, fn_fail);

    }

    function sel_change_question(){
        tmp_slctPlatform = $("select[name='platform']").val();
        dtList_info_detail.reload();
    }

    function question_fn_success(dst_id, response) {
        dalbitLog(response);
        var template = $("#question_tableSummary").html();
        var templateScript = Handlebars.compile(template);
        var data = {
            header : question_summary
            , content : response.data
        }
        var html = templateScript(data);
        $("#question_summaryArea").html(html);

        clearInterval(storageTimer);
    }

    var qnaIdx;
    var answer;
    function getQuestDetail(index){
        $("#tab_memberQuestion").addClass('show');
        var data = dtList_info_detail.getDataRow(index);
        var obj ={};
        obj.qnaIdx = data.qnaIdx;
        obj.answer = data.answer;
        obj.rowNum = data.rowNum;
        util.getAjaxData("type", "/rest/customer/question/detail",obj, quest_detail_success);
        // dtList_info_detail.reload();
    }

    $('#one_title').html("ㆍ회원의 1:1문의 내용을 확인하고, 답변 및 처리할 수 있습니다. 신중히 확인 한 후 답변바랍니다.");
    // $('#call_title').html("ㆍ전화문의 시 정보를 등록하고 처리 한 정보입니다.<br>ㆍ전화문의 시 회원이 문의 한 내용을 최대한 자세히 작성해 주세요.");
    // $('#mail_title').html("ㆍ회원의 메일 문의 내용을 확인하고, 답변 및 처리할 수 있습니다. 신중히 확인 한 후 답변바랍니다.");

</script>


<script id="question_tableSummary" type="text/x-handlebars-template">
    <table class="table table-bordered table-summary pull-right">
        <thead>
        <tr>
            {{#each this.header}}
            <th>{{this.code}}</th>
            {{/each}}
        </tr>
        </thead>
        <tbody id="summaryDataTable">
        <td>{{#equal length '0'}}0{{/equal}}{{content.qnaCnt}}건</td>
        <td>{{#equal length '0'}}0{{/equal}}{{content.type1Cnt}}건</td>
        <td>{{#equal length '0'}}0{{/equal}}{{content.type2Cnt}}건</td>
        <td>{{#equal length '0'}}0{{/equal}}{{content.type3Cnt}}건</td>
        <td>{{#equal length '0'}}0{{/equal}}{{content.type4Cnt}}건</td>
        <td>{{#equal length '0'}}0{{/equal}}{{content.type5Cnt}}건</td>
        <td>{{#equal length '0'}}0{{/equal}}{{content.type6Cnt}}건</td>
        <td>{{#equal length '0'}}0{{/equal}}{{content.type7Cnt}}건</td>
        <td>{{#equal length '0'}}0{{/equal}}{{content.type99Cnt}}건</td>
        </tbody>
    </table>
</script>