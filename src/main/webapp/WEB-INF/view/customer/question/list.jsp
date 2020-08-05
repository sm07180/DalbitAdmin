<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="container-fluid no-padding">
            <!-- serachBox -->
            <form id="searchForm">
                <div class="row col-lg-12 form-inline">
                    <div class="widget widget-table searchBoxArea">
                        <div class="widget-header searchBoxRow">
                            <h3 class="title"><i class="fa fa-search"></i> 회원 검색</h3>
                            <div>
                                <span name="question_searchType" id="question_searchType"></span>
                                <span name="question_selbox_type" id="question_selbox_type"></span>
                                <label><input type="text" class="form-control" id="txt_search"></label>
                                <button type="button" class="btn btn-success" id="bt_search">검색</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            <!-- //serachBox -->
            <div class="row col-lg-12 form-inline" style="padding-top: 2px; padding-bottom: 15px;">
                <div class="widget-content">
                    <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist" id="tablist_con">
                        <li><a href="/status/question/info?tabType=1" id="tab_totalDetail">총계</a></li>
                        <li><a href="/status/question/info?tabType=2" id="tab_typeDetail">유형별</a></li>
                        <li><a href="/status/question/info?tabType=3" id="tab_platformDetail">플랫폼별</a></li>
                        <li><a href="/status/question/info?tabType=4" id="tab_untreatedDetail">미처리</a></li>
                        <li class="active"><a href="" >1:1문의내역</a></li>
                    </ul>
                </div>
            </div>
            <!-- DATA TABLE -->
            <div class="row col-lg-12 form-inline">
                <div class="widget widget-table">
                    <div class="widget-header">
                        <h3><i class="fa fa-desktop"></i> 1:1 문의</h3>
                    </div>
                    <span id="question_summaryArea"></span>
                    <div class="widget-content" id="main_table">
                        <table id="list_info" class="table table-sorting table-hover table-bordered ">
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
            <div class="no-padding mb15" id="tab_qna">
                <jsp:include page="questionTab.jsp"></jsp:include>
            </div>
            <!-- TAB END -->
        </div>
    </div>
</div>

<script type="text/javascript" src="/js/code/customer/customerCodeList.js?${dummyData}"></script>
<script type="text/javascript" src="/js/code/customer/questionCodeList.js?${dummyData}"></script>

<script>
    $(document).ready(function() {

        // ui.checkBoxInit('list_info');

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
    $("#question_searchType").html(util.getCommonCodeSelect(-1, question_searchType));
    $("#question_selbox_type").html(util.getCommonCodeSelect(-1, question_selbox_type));

    $('#one_title').html("ㆍ회원의 1:1문의 내용을 확인하고, 답변 및 처리할 수 있습니다. 신중히 확인 한 후 답변바랍니다.");

    var tmp_searchText;
    var tmp_searchType= -1;
    var tmp_slctState =-1;
    var tmp_slctMember =-1;
    var tmp_slctPlatform = null;

    var dtList_info;
    var dtList_info_data = function ( data ) {
        data.searchText = $('#txt_search').val();
        data.searchType = tmp_searchType;
        data.slctState = tmp_slctState;
        data.slctPlatform = tmp_slctPlatform;
        data.slctMember = tmp_slctMember;
    };
    dtList_info = new DalbitDataTable($("#list_info"), dtList_info_data, questionDataTableSource.questList);
    dtList_info.useCheckBox(true);
    dtList_info.useIndex(true);
    dtList_info.createDataTable(question_summary_table);

    var questionDelBtn = '<input type="button" value="선택삭제" class="btn btn-danger btn-sm" id="btn_questionDelBtn" style="margin-right: 3px;"/>';
    $("#main_table").find(".footer-left").append(questionDelBtn);

    var excel = '<button class="btn btn-default btn-sm print-btn pull-right" type="button" id="excelDownBtn"><i class="fa fa-print"></i>Excel Down</button>';
    $("#main_table").find(".footer-right").append(excel);

    questionDelEventInit();
    initDataTableTop_select_question();
    getUserInfo();
    function getUserInfo(){                 // 검색
        /* 엑셀저장을 위해 조회조건 임시저장 */
        tmp_searchText = $('#txt_search').val();
        dtList_info.reload(question_summary_table);

        /*검색결과 영역이 접혀 있을 시 열기*/
        ui.toggleSearchList();

        $('#tab_customerQuestion').removeClass("show");
    }

    function question_summary_table(json){
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

    function initDataTableTop_select_question(){
        var topTable = '<br/><br/><span name="question_status" id="question_status" onchange="question_status_change()"></span>' +
                                '<span name="question_mem_state" id="question_mem_state" onchange="question_status_change()"></span>' +
                                '<span name="question_platform" id="question_platform" onchange="question_status_change()"></span>';
        $("#main_table").find(".top-left").addClass("no-padding").append(topTable);
        $("#question_status").html(util.getCommonCodeSelect(-1, question_status));
        $("#question_mem_state").html(util.getCommonCodeSelect(-1, question_mem_state));
        $("#question_platform").html(util.getCommonCodeSelect(-1, question_platform));
    }
    function question_status_change(){
        tmp_slctMember = $("#question_mem_state").find("#question_mem_state option:selected").val();
        tmp_slctState = $("#question_status").find("#question_status option:selected").val();
        tmp_slctPlatform = $('#platform').val();
        dtList_info.reload(question_summary_table);
    }

    $("#question_searchType").find("select").change( function() {
        $("#question_selbox_type").find("select").val(-1);
        tmp_searchType = $("#question_searchType").find("select").val();
    });

    $("#question_selbox_type").find("select").change( function() {
        $("#question_searchType").find("select").val(-1);
        tmp_searchType = $("#question_selbox_type").find("select").val();
    });

    var qnaIdx;
    var answer;
    var rowNum;
    function getQuestDetail(index){
        $("#tab_qna").removeClass("hide");
        var data = dtList_info.getDataRow(index);
        var obj ={};
        obj.qnaIdx = data.qnaIdx;
        obj.answer = data.answer;
        obj.rowNum = data.rowNum;

        qnaIdx = data.qnaIdx;
        answer = data.answer;
        rowNum = data.rowNum;

        util.getAjaxData("type", "/rest/customer/question/detail",obj, quest_detail_success);
    }

    /*=============엑셀==================*/
    $('#excelDownBtn').on('click', function(){
        var formElement = document.querySelector("form");
        var formData = new FormData(formElement);
        formData.append("slctState", -1);
        util.excelDownload($(this), "/rest/customer/question/listExcel", formData, fn_success_excel,fn_fail_excel);

    });

    function fn_success_excel(){
        console.log("fn_success_excel");
    }
    function fn_fail_excel(){
        console.log("fn_fail_excel");
    }

    // $(document).on('click', '#list_info .dt-body-center input[type="checkbox"]', function(){
    //     if($(this).prop('checked')){
    //         $(this).parent().parent().find('.getQuestDetail').click();
    //     }else{
    //         $('#tab_customerQuestion').removeClass("show");
    //     }
    // });

    function questionDelEventInit(){
        $("#btn_questionDelBtn").on("click", function () { //선택삭제
            if (confirm("선택한 1:1문의를 삭제하시겠습니까?")) {
                questionDelData();
            }
        });
    }
    function questionDelData(){
        var checkDatas = dtList_info.getCheckedData();
        if(checkDatas.length <= 0){
            alert("삭제할 사연을 선택해 주십시오");
            return;
        }
        var tmp_sw = true;
        // 1:1 문의 삭제 상태 체크

        for(var i=0;i<checkDatas.length;i++){
            if(checkDatas[i].state == 1){
                tmp_sw = false;
                break;
            }
        }
        if(!tmp_sw){
            if (confirm("처리완료 건이 있습니다. 삭제 하시겠습니까?")) {
                tmp_sw = true;
            }
        }
        if(tmp_sw){
            var data = new Object();
            data.delList = checkDatas;
            util.getAjaxData("delete", "/rest/customer/question/delete",data, questionDel_success);
        }else{
            return;
        }
    }

    function questionDel_success(dst_id, response) {
        dtList_info.reload();

        $("#tab_qna").addClass("hide");
    }

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