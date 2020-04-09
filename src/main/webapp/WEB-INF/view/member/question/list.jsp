<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<script type="text/javascript" src="/js/code/customer/customerCodeList.js"></script>
<script type="text/javascript" src="/js/code/customer/questionCodeList.js"></script>

<script>
    $(document).ready(function() {
    });

    function getHistory_questionDetail(tmp) {     // 상세보기
        if(tmp.indexOf("_") > 0){ tmp = tmp.split("_"); tmp = tmp[1]; }
        var source = MemberDataTableSource[tmp];
        var dtList_info_detail_data = function (data) {
            data.searchText = memNo;
            data.searchType = 1;
            data.slctType = -1;
        }
        dtList_info_detail = new DalbitDataTable($("#"+tmp).find("#list_info_detail"), dtList_info_detail_data, source);
        dtList_info_detail.useCheckBox(false);
        dtList_info_detail.useIndex(true);
        dtList_info_detail.createDataTable(qusetion_summary_table);

        initDataTableTop_select_quest(tmp);         // 상탄 selectBox
    }
    function initDataTableTop_select_quest(tmp){
        var topTable = '<span name="search_question_top" id="search_question_top" onchange="sel_change()"></span>' +
            '<span name="search_question_type_top" id="search_question_type_top" onchange="sel_change()"></span>' +
            '<span name="search_platform_top" id="search_platform_top" onchange="sel_change()"></span>' +
            '<span name="search_browser_top" id="search_browser_top" onchange="sel_change()"></span>'
        ;
        $("#"+tmp).find("#main_table").find(".top-left").addClass("no-padding").append(topTable);
        $("#search_question_top").html(util.getCommonCodeSelect(-1, question));
        $("#search_question_type_top").html(util.getCommonCodeSelect(-1, question_type));
        $("#search_platform_top").html(util.getCommonCodeSelect(-1, platform));
        $("#search_browser_top").html(util.getCommonCodeSelect(-1, browser));

    }

    function qusetion_summary_table(json){
        var template = $("#question_tableSummary").html();
        var templateScript = Handlebars.compile(template);
        var data = {
            header : question_summary
            , content : json.summary
            , length : json.recordsTotal
        }
        var html = templateScript(data);
        $("#question_summaryArea").html(html);
    }

    function getQuestDetail(qnaIdx){
        $('#tab_list').addClass("show");
        var obj = new Object();
        obj.qnaIdx = qnaIdx;
        obj.answer = "";
        util.getAjaxData("type", "/rest/customer/question/detail",obj, quest_detail_success);
    }

    $('#one_title').html("ㆍ회원의 1:1문의 내용을 확인하고, 답변 및 처리할 수 있습니다. 신중히 확인 한 후 답변바랍니다.");
    $('#call_title').html("ㆍ전화문의 시 정보를 등록하고 처리 한 정보입니다.<br>ㆍ전화문의 시 회원이 문의 한 내용을 최대한 자세히 작성해 주세요.");
    $('#mail_title').html("ㆍ회원의 메일 문의 내용을 확인하고, 답변 및 처리할 수 있습니다. 신중히 확인 한 후 답변바랍니다.");

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
        <td>{{#equal length '0'}}0{{/equal}}{{content.totalQna}}건</td>
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