<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dummyData"><%= java.lang.Math.round(java.lang.Math.random() * 1000000) %></c:set>
<%
    String in_tabType = request.getParameter("tabType");
%>

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

                                <label class="control-inline fancy-radio custom-color-green">
                                    <input type="radio" name="slctDateType" value='1' checked="checked" />
                                    <span><i></i>접수일시</span>
                                </label>
                                <label class="control-inline fancy-radio custom-color-green">
                                    <input type="radio" name="slctDateType" value='2' />
                                    <span><i></i>처리일시</span>
                                </label>

                                <div class="input-group date" id="rangeDatepicker">
                                    <label for="displayDate" class="input-group-addon">
                                        <span><i class="fa fa-calendar"></i></span>
                                    </label>
                                    <input type="text" name="displayDate" id="displayDate" class="form-control" />
                                </div>

                                <input type="hidden" name="startDate" id="startDate" />
                                <input type="hidden" name="endDate" id="endDate" />
                                <%--<input name="startDate" id="startDate" />--%>
                                <%--<input name="endDate" id="endDate" />--%>

                                <label><input type="text" class="form-control" id="txt_search"></label>
                                <button type="button" class="btn btn-success" id="bt_search">검색</button>
                                <a href="javascript://" class="_prevSearch">[이전]</a>
                                <a href="javascript://" class="_todaySearch">[오늘]</a>
                                <a href="javascript://" class="_nextSearch">[다음]</a>
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
                        <li><a href="" role="tab" data-toggle="tab" onclick="tab_questionClick(1)" >(회원)1:1문의내역</a></li>
                        <li><a href="" role="tab" data-toggle="tab" onclick="tab_questionClick(2)">(비회원)1:1문의내역</a></li>
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
                    <span id="question_summaryArea2"></span>
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
    var tabType = <%=in_tabType%>;

    var dateTime = new Date();
    dateTime = moment(dateTime).format("YYYY.MM.DD");
    var week = ['일', '월', '화', '수', '목', '금', '토'];
    var toDay = week[moment(new Date()).day()];
    setTimeDate(dateTime);

    $(document).ready(function() {

        $("#displayDate").statsDaterangepicker(
            function(start, end, t1) {
                $("#startDate").val(start.format('YYYY.MM.DD'));
                $("#endDate").val(end.format('YYYY.MM.DD'));
            }
        );

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


        $("#question_summaryArea").hide();
        $("#question_summaryArea2").hide();
        if(!common.isEmpty(tabType)){
            if(tabType == 1){
                $('.nav-tabs li:eq(4) a').tab('show');
                $("#question_summaryArea").show();
            }else if(tabType == 2){
                $('.nav-tabs li:eq(5) a').tab('show');
                $("#question_summaryArea2").show();
            }
        }else{
            $('.nav-tabs li:eq(4) a').tab('show');
            $("#question_summaryArea").show();
        }
    });
    $("#question_searchType").html(util.getCommonCodeSelect(-1, question_searchType));
    $("#question_selbox_type").html(util.getCommonCodeSelect(-1, question_selbox_type));

    $('#one_title').html("ㆍ회원의 1:1문의 내용을 확인하고, 답변 및 처리할 수 있습니다. 신중히 확인 한 후 답변바랍니다.");

    var tmp_searchText;
    var tmp_searchType= -1;
    var tmp_slctState =-1;
    var tmp_slctMember =-1;
    var tmp_slctPlatform = null;

    if(!common.isEmpty(tabType)){
        tmp_slctMember = tabType;
    }

    var dtList_info;
    var dtList_info_data = function ( data ) {
        data.searchText = $('#txt_search').val();
        data.searchType = tmp_searchType;
        data.slctState = tmp_slctState;
        data.slctPlatform = tmp_slctPlatform;
        data.slctMember = tmp_slctMember;
        data.startDate = $("#startDate").val();
        data.endDate = $("#endDate").val();
        data.slctDateType = $('input:radio[name="slctDateType"]:checked').val();
    };

    dtList_info = new DalbitDataTable($("#list_info"), dtList_info_data, questionDataTableSource.questList);
    dtList_info.useCheckBox(true);
    dtList_info.useIndex(true);
    dtList_info.createDataTable(question_summary_table);

    var questionDelBtn = '<input type="button" value="선택삭제" class="btn btn-danger btn-sm" id="btn_questionDelBtn" style="margin-right: 3px;"/>';
    $("#main_table").find(".footer-left").append(questionDelBtn);

    var excel = '<button class="btn btn-default btn-sm print-btn pull-right" type="button" id="excelDownBtn"><i class="fa fa-print"></i>Excel Down</button>';
    $("#main_table").find(".footer-right").append(excel);

    function setTimeDate(dateTime){
        $("#startDate").val(dateTime);
        $("#endDate").val(dateTime);
    }

    $(document).on('click', '._prevSearch', function(){
        searchDate('prev');
    });

    $(document).on('click', '._nextSearch', function(){
        searchDate('next');
    });
    $(document).on('click', '._todaySearch', function(){
        searchDate();
    });

    function searchDate(dateType){
        if(common.isEmpty(dateType)){
            $("#startDate").val(moment(new Date()).format('YYYY.MM.01'));
            $("#endDate").val(moment(moment(new Date()).format('YYYY.MM.01')).add('months', 1).add('days', -1).format('YYYY.MM.DD'));
            $("#displayDate").val($("#startDate").val() + ' - ' + $("#endDate").val());
            getUserInfo();
        }else if(dateType == 'prev'){
            setDay(-1);
        }else if(dateType == 'next'){
            setDay(1);
        }
    }

    function setDay(days){
        $("#startDate").val(moment($("#startDate").val()).add('days', days).format('YYYY.MM.DD'));
        $("#endDate").val(moment($("#endDate").val()).add('days', days).format('YYYY.MM.DD'));
        $("#displayDate").val($("#startDate").val() + " - " + $("#endDate").val());
        getUserInfo();
    }

    // function setMonth(months){
    //     $("#startDate").val(moment($("#startDate").val()).add('months', months).format('YYYY.MM.01'));
    //     $("#endDate").val(moment($("#startDate").val()).add('months', 1).add('days', -1).format('YYYY.MM.DD'));
    //     $("#displayDate").val($("#startDate").val() + " - " + $("#endDate").val());
    //     getUserInfo();
    // }

    questionDelEventInit();
    initDataTableTop_select_question();
    // getUserInfo();
    function getUserInfo(){                 // 검색
        /* 엑셀저장을 위해 조회조건 임시저장 */
        tmp_searchText = $('#txt_search').val();
        dtList_info.reload(question_summary_table);

        /*검색결과 영역이 접혀 있을 시 열기*/
        ui.toggleSearchList();

        $('#tab_customerQuestion').removeClass("show");
    }

    function question_summary_table(json){
        var template = $("#question_tableSummary").html();
        var templateScript = Handlebars.compile(template);
        var data = {
            content : json.summary
            , length : json.recordsTotal
        }
        var html = templateScript(data);
        $("#question_summaryArea").html(html);

        var template = $("#question_tableSummary2").html();
        var templateScript = Handlebars.compile(template);
        var data = {
            content : json.summary
            , length : json.recordsTotal
        }
        var html = templateScript(data);
        $("#question_summaryArea2").html(html);
    }

    function initDataTableTop_select_question(){
        var topTable = '<br/><br/><span name="question_status" id="question_status" onchange="question_status_change()"></span>' +
                                // '<span name="question_mem_state" id="question_mem_state" onchange="question_status_change()"></span>' +
                                '<span name="question_platform" id="question_platform" onchange="question_status_change()"></span>';
        $("#main_table").find(".top-left").addClass("no-padding").append(topTable);
        $("#question_status").html(util.getCommonCodeSelect(-1, question_status));
        // $("#question_mem_state").html(util.getCommonCodeSelect(-1, question_mem_state));
        $("#question_platform").html(util.getCommonCodeSelect(-1, question_platform));
    }
    function question_status_change(){
        // tmp_slctMember = $("#question_mem_state").find("#question_mem_state option:selected").val();
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

    function tab_questionClick(tmp){
        tmp_slctMember = tmp;
        if(tmp == 1){
            $("#question_summaryArea").show();
            $("#question_summaryArea2").hide();
        }else{
            $("#question_summaryArea").hide();
            $("#question_summaryArea2").show();
        }
        dtList_info.reload();
        $("#tab_qna").addClass("hide");
    }

    /*==================================*/
</script>

<script id="question_tableSummary" type="text/x-handlebars-template">
    <table class="table table-bordered table-summary pull-right" style="width: 710px">
        <tr>
            <th rowspan="2">회원</th>
            <th>문의 총계</th>
            <th>회원정보</th>
            <th>방송정보</th>
            <th>청취하기</th>
            <th>결제</th>
            <th>건의하기</th>
            <th>장애/버그</th>
            <th>선물/아이템</th>
            <th>기타</th>
        </tr>
        <tr>
            <td>{{#equal length '0'}}0{{/equal}}{{content.totalQna}}건</td>
            <td>{{#equal length '0'}}0{{/equal}}{{content.type1Cnt}}건</td>
            <td>{{#equal length '0'}}0{{/equal}}{{content.type2Cnt}}건</td>
            <td>{{#equal length '0'}}0{{/equal}}{{content.type3Cnt}}건</td>
            <td>{{#equal length '0'}}0{{/equal}}{{content.type4Cnt}}건</td>
            <td>{{#equal length '0'}}0{{/equal}}{{content.type5Cnt}}건</td>
            <td>{{#equal length '0'}}0{{/equal}}{{content.type6Cnt}}건</td>
            <td>{{#equal length '0'}}0{{/equal}}{{content.type7Cnt}}건</td>
            <td>{{#equal length '0'}}0{{/equal}}{{content.type99Cnt}}건</td>
        </tr>
    </table>
</script>

<script id="question_tableSummary2" type="text/x-handlebars-template">
    <table class="table table-bordered table-summary pull-right" style="width: 710px">
        <tr>
            <th rowspan="2">비회원</th>
            <th>문의 총계</th>
            <th>회원정보</th>
            <th>방송정보</th>
            <th>청취하기</th>
            <th>결제</th>
            <th>건의하기</th>
            <th>장애/버그</th>
            <th>선물/아이템</th>
            <th>기타</th>
        </tr>
        <tr>
            <td>{{#equal length '0'}}0{{/equal}}{{content.no_totalQna}}건</td>
            <td>{{#equal length '0'}}0{{/equal}}{{content.no_type1Cnt}}건</td>
            <td>{{#equal length '0'}}0{{/equal}}{{content.no_type2Cnt}}건</td>
            <td>{{#equal length '0'}}0{{/equal}}{{content.no_type3Cnt}}건</td>
            <td>{{#equal length '0'}}0{{/equal}}{{content.no_type4Cnt}}건</td>
            <td>{{#equal length '0'}}0{{/equal}}{{content.no_type5Cnt}}건</td>
            <td>{{#equal length '0'}}0{{/equal}}{{content.no_type6Cnt}}건</td>
            <td>{{#equal length '0'}}0{{/equal}}{{content.no_type7Cnt}}건</td>
            <td>{{#equal length '0'}}0{{/equal}}{{content.no_type99Cnt}}건</td>
        </tr>
    </table>
</script>