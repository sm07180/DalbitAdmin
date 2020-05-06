<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="container-fluid">
            <!-- serachBox -->
            <form id="searchForm">
                <div class="row col-lg-12 form-inline">
                    <div class="widget widget-table searchBoxArea">
                        <div class="widget-header searchBoxRow">
                            <h3 class="title"><i class="fa fa-search"></i> 테스트아이디 검색</h3>
                            <div>
                                <span id="search_searchType_aria"></span>

                                <label><input type="text" class="form-control" name="searchText" id="searchText" placeholder="검색할 정보를 입력하세요"></label>
                                <button type="button" class="btn btn-success" id="bt_search">검색</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            <!-- //serachBox -->
            <div class="row col-lg-12 form-inline" id="insertBtnDiv">
                <label id="faq_title">
                    ㆍ테스트 아이디를 등록 관리하는 페이지입니다.<br />
                    ㆍ테스트 아이디 등록 시 어떤 사람의 관계를 이용한 아이디인지 꼭!!입력해주세요.
                </label>
            </div>

            <div class="row col-lg-12 form-inline">
                <div class="widget widget-table searchBoxArea">
                    <div class="widget-header searchBoxRow">
                        <h3 class="title">등록</h3>
                        <div>
                            <span id="relationArea"></span>
                            <span id="userInfoArea"></span>
                            <label>
                                <input type="text" class="form-control" name="userInfoValue" id="userInfoValue" style="width:250px;" placeholder="등록하실 테스트 정보를 입력하세요.">
                            </label>
                            <button type="button" class="btn btn-danger" id="bt_insert">등록</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- DATA TABLE -->
            <div class="row">

                <!-- 테스트 계정 현황 -->
                <div class="col-lg-3">
                    <div class="widget widget-table mb10">
                        <div class="widget-header">
                            <h3><i class="fa fa-table"></i> 테스트 계정 현황</h3>
                            <div class="btn-group widget-header-toolbar">
                                <a href="#" title="Expand/Collapse" class="btn-borderless btn-toggle-expand"><i class="fa fa-chevron-up"></i></a>
                            </div>
                        </div>
                        <div class="widget-content mt10">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>직원명 <span id="summaryTotalArea_mem"></span></th>
                                        <th>총 <span id="summaryTotalArea">0</span>개</th>
                                    </tr>
                                </thead>
                                <tbody id="summaryArea"></tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <!-- //테스트 계정 현황 -->

                <!-- 검색결과 -->
                <div class="col-lg-9">
                    <div class="widget widget-table">
                        <div class="widget-header">
                            <h3><i class="fa fa-desktop"></i> 검색결과</h3>
                            <div class="btn-group widget-header-toolbar">
                                <a href="#" title="열기/닫기" class="btn-borderless btn-toggle-expand">
                                    <i class="fa fa-chevron-up" id="_searchToggleIcon"></i>
                                </a>
                            </div>
                        </div>
                        <div class="widget-content mt10">
                            <table id="list_info" class="table table-sorting table-hover table-bordered">
                                <thead>
                                    <tr>
                                        <th><input type="checkbox" id="allChk" /></th>
                                        <th>No</th>
                                        <th>사번</th>
                                        <th>직원명</th>
                                        <th>관계</th>
                                        <th>회원번호</th>
                                        <th>User ID</th>
                                        <th>User 닉네임</th>
                                        <th>연락처</th>
                                        <th>레벨/등급</th>
                                        <th>최근로그인</th>
                                        <th>상태</th>
                                    </tr>
                                </thead>
                                <tbody id="tableBody">
                                </tbody>
                            </table>
                        </div>
                        <div class="widget-footer">
                            <span>
                                <button class="btn btn-default" type="button" id="bt_delete">선택삭제</button>
                            </span>
                            <%--<span>
                                <button class="btn btn-default print-btn pull-right" type="button" id="excelDownBtn"><i class="fa fa-print"></i>Excel Down</button>
                            </span>--%>
                        </div>
                    </div>
                </div>
                <!-- //검색결과 -->
            </div>
            <!-- #DataTable -->

            <form id="faqForm"></form>
        </div>
    </div>
</div>

<script type="text/javascript" src="/js/lib/jquery.table2excel.js"></script>
<script type="text/javascript" src="/js/code/administrate/adminCodeList.js"></script>
<script type="text/javascript" src="/js/code/customer/customerCodeList.js"></script>
<script type="text/javascript" src="/js/handlebars/administrateHelper.js"></script>
<script>
    $(document).ready(function() {
        init();
    });

    function init(){

        $('#search_searchType_aria').html(util.getCommonCodeSelect(-1, testId_searchType));

        $("#relationArea").html(util.getCommonCodeSelect(-1, testId_relation));
        $("#userInfoArea").html(util.getCommonCodeSelect(-1, testId_userInfo));

        getSummary();
        getList();
    }

    function getSummary(){
        util.getAjaxData("summary", "/rest/administrate/testId/summary", null, fn_summary_success);
    }

    function fn_summary_success(dst_id, response){
        dalbitLog(response);

        if(response.result == 'success'){
            var totalCnt = 0;
            response.data.forEach(function(summary){
                totalCnt += summary.cnt;
            });
            $("#summaryTotalArea").html(totalCnt);
            $("#summaryTotalArea_mem").html("(" + response.data.length + "명)");

            var template = $('#tmp_summary').html();
            var templateScript = Handlebars.compile(template);
            var context = response.data;
            var html=templateScript(context);
            $("#summaryArea").html(html);
        }else{
            $("#summaryTotalArea_mem").html("(0명)");
        }
    }

    $('input[id="searchText"]').keydown(function() {
        if (event.keyCode === 13) {
            getList();
        };
    });

    $("#bt_search").on('click', function(){
       getList();
    });

    function getList(){
        util.getAjaxData("summary", "/rest/administrate/testId/list", $("#searchForm").serialize(), fn_list_success);
    }

    function fn_list_success(dst_id, response){
        dalbitLog(response);
        if(response.result == 'success'){
            var template = $('#tmp_list').html();
            var templateScript = Handlebars.compile(template);
            var context = response.data;
            var html=templateScript(context);
            $("#tableBody").html(html);

        }
    }

    $("#bt_insert").on('click', function(){
        var relation = $("#relation");
        if(common.isEmpty(relation.val())){
            alert('관계를 선택해주세요.');
            relation.focus();
            return false;
        }

        var userInfo = $("#userInfo");
        if(common.isEmpty(userInfo.val())){
            alert('회원정보를 선택해주세요.');
            userInfo.focus();
            return false;
        }

        var userInfoValue = $("#userInfoValue");
        if(common.isEmpty(userInfoValue.val())){
            alert('검색어를 입력해주세요.');
            userInfoValue.focus();
            return false;
        }

        var data = {
            relation : relation.val()
            , userInfo : userInfo.val()
            , userInfoValue : userInfoValue.val()
        }
        util.getAjaxData("summary", "/rest/administrate/testId/insert", data, fn_insert_success);
    });

    function fn_insert_success(dst_id, response){
        dalbitLog(response);
        alert(response.message);

        if(response.result == 'success'){
            getSummary();
            getList();
        }
    }

    $('#allChk').on('click', function(){
        if($(this).prop('checked')){
            $('._chk').prop('checked', 'checked');
        }else{
            $('._chk').removeAttr('checked');
        }
    });

    $('#bt_delete').on('click', function(){
        var checkeds = $("#tableBody").find('._chk:checked');
        if(0 == checkeds.length){
            alert('삭제할 테스트 아이디를 선택해주세요.');
            return false;
        }

        if(confirm(checkeds.length +'건을 삭제하시겠습니까?')){
            var memNos = [];
            checkeds.each(function(){
                memNos.push($(this).data('memno'));
            });

            var data = {
                memNos : JSON.stringify(memNos)
            }
            util.getAjaxData("delete", "/rest/administrate/testId/delete", data, fn_insert_success);
        }
    });

    $(document).on('click', '._empName', function(){
        var empName = $(this);
        $("#searchType option[value=1]").prop('selected', 'selected');
        $("#searchText").val(empName.text());
        $("#bt_search").click();
        ui.topScroll();
    });

</script>

<script id="tmp_summary" type="text/x-handlebars-template">
    {{#each this}}
        <tr>
            <td><a href="javascript://" class="_empName" title="'{{emp_name}}'(으)로 검색">{{emp_name}}</td>
            <td>{{cnt}}개</td>
        </tr>
    {{else}}
        <tr>
            <td colspan="2">{{isEmptyData}}</td>
        </tr>
    {{/each}}
</script>

<script id="tmp_list" type="text/x-handlebars-template">
    {{#each this as |user|}}
        <tr>
            <td><input type="checkbox" class="_chk" data-memno="{{user.mem_no}}" /></td>
            <td>{{index @index}}</td>
            <td>{{user.emp_no}}</td>
            <td>{{user.emp_name}}</td>
            <td>{{relationName user.relation}}</td>
            <td>{{user.mem_no}}</td>
            <td><a href="javascript://" class="_openMemberPop" data-memNo="{{user.mem_no}}">{{user.mem_userId}}</a></td>
            <td>{{user.mem_nick}}</td>
            <td>{{user.mem_phone}}</td>
            <td>{{user.level}} / {{user.grade}}</td>
            <td>{{user.lastLoginDatetime}}</td>
            <td>{{stateName user.mem_state}}</td>
        </tr>
    {{else}}
        <tr>
            <td colspan="12">{{isEmptyData}}</td>
        </tr>
    {{/each}}
</script>