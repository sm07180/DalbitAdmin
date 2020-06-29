<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dummyData"><%= java.lang.Math.round(java.lang.Math.random() * 1000000) %></c:set>

<div id="wrapper">
    <div id="page-wrapper">
        <div id="container-fluid">
            <!-- searchBox -->
            <div class="row col-lg-12 form-inline">
                <div class="widget-header searchBoxRow">
                        <label><input type="text" class="form-control" name="searchText" id="searchText" placeholder="검색어를 입력해주세요."></label>
                </div>
            </div>
            <!-- // searchBox -->

            <!-- error log table-->
            <div class="row col-lg-12 form-inline">
                <div class="widget widget-table">
                    <div class="widget-content">
                        <table class="table table-bordered table-summary" id="Summary">
                            <thead>
                            <tr>
                                <th>총 : <span id="total">0</span> 건 </th>
                            </tr>
                            </thead>
                            <tbody id="summaryDataTable">
                            </tbody>
                        </table>
                        <table id="loginHistoryList" class="table table-sorting table-hover table-bordered datatable" style="table-layout: fixed;word-break: break-word;">
                            <colgroup>
                                <col width="4%"/><col width="4%"/><col width="7%"/><col width="4%"/><col width="6%"/><col width="10%"/>
                                <col width="20%"/><col width="4%"/><col width="4%"/><col width="4%"/><col width="4%"/>
                            </colgroup>

                            <thead>
                            <th>번호</th>
                            <th>로그인 일시</th>
                            <th>회원</th>
                            <th>성별</th>
                            <th>ip</th>
                            <th>device uuid</th>
                            <th>device token</th>
                            <th>OS구분</th>
                            <th>브라우저정보</th>
                            <th>앱버전</th>
                            <th>location</th>
                            </thead>
                            <tbody id="tableBody">
                            </tbody>
                        </table>
                        </table>
                    </div>
                </div>
                <div class="dataTables_paginate paging_full_numbers" id="list_info_paginate"></div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="/js/code/member/memberCodeList.js?${dummyData}"></script>
<script type="text/javascript">
    var loginHistoryPagingInfo = new PAGING_INFO(0, 1, 500);

    $(document).ready(function() {
        init();
    });

    $('input[id="searchText"]').keydown(function(e) {
        if (e.keyCode === 13) {
            loginHistoryPagingInfo.pageNo = 1;
            getLoginHistoryList();
        };
    });

    $('#bt_search').click( function() {       //검색
        loginHistoryPagingInfo.pageNo = 1;
        getLoginHistoryList();
    });

    function init() {
        $("#osTypeArea").html(util.getCommonCodeSelect(-1, loginHistoryOsType));
        $("#searchTypeArea").html(util.getCommonCodeSelect(-1, loginHistorySearchType));


        $('#txt_startSel').datepicker("setDate", new Date());
        $('#txt_endSel').datepicker("setDate", new Date());

        $('#txt_startSel').datepicker().on('dp.change',function(e){
            $(this).html($(this).val());
        });
        $('#txt_endSel').datepicker().on('dp.change',function(e){
            $(this).html($(this).val());
        });
    }

    function getLoginHistoryList(){
        $("#pageStart").val(loginHistoryPagingInfo.pageNo);
        $("#pageCnt").val(loginHistoryPagingInfo.pageCnt);
        var data = {};
        data.txt_startSel = $("#startDate").val();
        data.txt_endSel = $("#endDate").val();
        data.searchText = $("#searchText").val();
        data.pageStart = loginHistoryPagingInfo.pageNo;
        data.pageCnt = loginHistoryPagingInfo.pageCnt;

        util.getAjaxData("errorList", "/rest/member/member/login/history", data, fn_success);
    }

    function fn_success(dst_id, response) {
        var template = $('#tmp_loginHistoryList').html();
        var templateScript = Handlebars.compile(template);
        var context = response.data;
        var html = templateScript(context);

        $("#tableBody").html(html);

        $("#total").html(response.data.loginHistCnt);

        loginHistoryPagingInfo.totalCnt = response.data.loginHistCnt;
        console.log(loginHistoryPagingInfo);
        util.renderPagingNavigation("list_info_paginate", loginHistoryPagingInfo);

        if(response.data.length == 0) {
            $("#list_info_paginate").hide();
        } else {
            $("#list_info_paginate").show();
        }

    }

    function handlebarsPaging(targetId, pagingInfo){
        loginHistoryPagingInfo = pagingInfo;
        getLoginHistoryList();
    }

</script>

<script id="tmp_loginHistoryList" type="text/x-handlebars-template">
    {{#each this.loginHistList}}
    <tr>
        <td>{{indexDesc ../loginHistCnt rowNum}}</td>
        <td>{{last_upd_date}}</td>
        <td>
            {{mem_no}}<br/>
            <a href="javascript://" class="_openMemberPop" data-memNo="{{this.mem_no}}">{{mem_nick}}</a>
        </td>
        <td>{{{sexIcon mem_sex}}}</td>
        <td>{{ip}}</td>
        <td style="text-align:left">{{device_uuid}}</td>
        <td style="text-align:left">{{device_token}}</td>
        <td>{{{getCommonCodeLabel os_type 'loginHistoryOsType'}}}</td>
        <td>{{browser}}</td>
        <td>{{app_version}}</td>
        <td>{{location}}</td>
    </tr>
    {{else}}
    <tr>
        <td colspan="10">{{isEmptyData}}</td>
    </tr>
    {{/each}}
</script>