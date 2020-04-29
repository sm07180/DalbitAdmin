<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="container-fluid">

            <!-- serachBox -->
            <div class="row col-lg-12 form-inline">
                <div class="widget widget-table searchBoxArea">
                    <div class="widget-header searchBoxRow">
                        <h3 class="title"><i class="fa fa-search"></i> 회원 검색</h3>
                        <div>
                            <span name="searchType" id="searchType"></span>
                            <span name="question_type" id="question_type"></span>
                            <span name="platform" id="platform"></span>
                            <span name="browser" id="browser"></span>
                            <label><input type="text" class="form-control" id="txt_search"></label>
                            <button type="submit" class="btn btn-success" id="bt_search">검색</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- //serachBox -->
            <!-- DATA TABLE -->
            <div class="row col-lg-12 form-inline">
                <div class="widget widget-table">
                    <div class="widget-header">
                        <h3><i class="fa fa-desktop"></i> 1:1 문의</h3>
                        <div class="btn-group widget-header-toolbar">
                            <a href="#" title="열기/닫기" class="btn-borderless btn-toggle-expand">
                                <i class="fa fa-chevron-up" id="_searchToggleIcon"></i>
                            </a>
                        </div>
                    </div>
                    <span id="question_summaryArea"></span>
                    <div class="widget-content">
                        <table id="list_info" class="table table-sorting table-hover table-bordered">
                            <thead>
                            </thead>
                            <tbody id="tableBody">
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!-- DATA TABLE END -->
            <!-- TAB -->
            <div class="no-padding mb15">
                <jsp:include page="questionTab.jsp"></jsp:include>
            </div>
            <!-- TAB END -->
        </div>
    </div>
</div>

<script type="text/javascript" src="/js/code/customer/customerCodeList.js"></script>
<script type="text/javascript" src="/js/code/customer/questionCodeList.js"></script>

<script>
    $(document).ready(function() {

        ui.checkBoxInit('list_info');

        $('input[id="txt_search"]').keydown(function(e) {
            if (e.keyCode === 13) {
                getUserInfo();
            };
        });
        <!-- 버튼 -->
        $('#bt_search').click( function() {       //검색
            getUserInfo();
        });
        <!-- 버튼 끝 -->
    });
    $("#searchType").html(util.getCommonCodeSelect(-1, searchType));
    $("#question_type").html(util.getCommonCodeSelect(-1, question_type));
    $("#platform").html(util.getCommonCodeSelect(-1, search_platform));
    $("#browser").html(util.getCommonCodeSelect(-1, search_browser));

    $('#one_title').html("ㆍ회원의 1:1문의 내용을 확인하고, 답변 및 처리할 수 있습니다. 신중히 확인 한 후 답변바랍니다.");

    var tmp_searchText;
    var tmp_searchType;
    var tmp_slctType = null;
    var tmp_question_type = null;
    var tmp_platform = null;
    var tmp_browser = null;

    var dtList_info;
    var dtList_info_data = function ( data ) {
        data.searchText = $('#txt_search').val();
        data.searchType = tmp_searchType;
        data.slctType = tmp_question_type;
        data.slctPlatform = tmp_platform;
        data.slctBrowser = tmp_browser;
    };
    dtList_info = new DalbitDataTable($("#list_info"), dtList_info_data, questionDataTableSource.questList);
    dtList_info.useCheckBox(true);
    dtList_info.useIndex(true);
    dtList_info.createDataTable(qusetion_summary_table);

    function getUserInfo(){                 // 검색
        /* 엑셀저장을 위해 조회조건 임시저장 */
        tmp_searchType = $("select[name='searchType']").val();
        tmp_searchText = $('#txt_search').val();
        tmp_question_type = $("select[name='question_type']").val();
        tmp_platform = $("select[name='platform']").val();
        tmp_browser = $("select[name='browser']").val();
        dtList_info.reload(qusetion_summary_table);

        /*검색결과 영역이 접혀 있을 시 열기*/
        ui.toggleSearchList();
    }

    function qusetion_summary_table(json){
        // console.log(json);
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

    function getQuestDetail(index){
        $('#tab_customerQuestion').addClass("show");
        var data = dtList_info.getDataRow(index);
        var obj = new Object();
        obj.qnaIdx = data.qnaIdx;
        obj.answer = data.answer;
        util.getAjaxData("type", "/rest/customer/question/detail",obj, quest_detail_success);
    }

    /*=============엑셀==================*/
    $('#excelDownBtn').on('click', function(){
        var formElement = document.querySelector("form");
        var formData = new FormData(formElement);

        formData.append("searchText", tmp_searchText);
        formData.append("searchType", tmp_searchType);
        formData.append("slctType", tmp_question_type);
        formData.append("slctPlatform", tmp_platform);
        formData.append("slctBrowser", tmp_browser);
        // util.excelDownload($(this), "/rest/member/member/listExcel", formData, fn_success_excel)
    });

    function fn_success_excel(){
        console.log("fn_success_excel");
    }

    $(document).on('click', '#list_info .dt-body-center input[type="checkbox"]', function(){
        if($(this).prop('checked')){
            $(this).parent().parent().find('.getQuestDetail').click();
        }else{
            $('#tab_customerQuestion').removeClass("show");
        }
    });

    /*==================================*/
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