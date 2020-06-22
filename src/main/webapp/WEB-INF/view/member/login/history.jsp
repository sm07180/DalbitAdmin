<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="wrapper">
    <div id="page-wrapper">
        <div id="container-fluid">
            <h3>log - 회원 로그인이력</h3>
            <!-- searchBox -->
            <form id="searchForm">
                <div class="row col-lg-12 form-inline">
                    <div class="widget widget-table searchBoxArea">
                        <div class="widget-header searchBoxRow">
                            <h3 class="title"><i class="fa fa-search"></i> 검색조건</h3>
                            <input type="hidden" name="pageStart" id="pageStart">
                            <input type="hidden" name="pageCnt" id="pageCnt">
                            <div>
                                <div class="input-group date" id="date_startSel">
                                    <input type="text" class="form-control " id="txt_startSel" name="txt_startSel"><span class="input-group-addon"><i class="glyphicon glyphicon-calendar" id="i_startSel"></i></span>
                                </div>
                                <label>~</label>
                                <div class="input-group date" id="date_endSel">
                                    <input type="text" class="form-control" id="txt_endSel" name="txt_endSel"><span class="input-group-addon"><i class="glyphicon glyphicon-calendar" id="i_endSel"></i></span>
                                </div>
                                <span id="osTypeArea"></span>
                                <span id="searchTypeArea"></span>
                                <label><input type="text" class="form-control" name="searchText" id="searchText" placeholder="검색어를 입력해주세요."></label>
                                <button type="button" class="btn btn-success" id="bt_search">검색</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
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
                                <col width="2%"/>
                                <col width="4%"/>
                                <col width="3%"/>
                                <col width="5%"/>
                                <col width="20%"/>
                                <col width="2%"/>
                                <col width="3%"/>
                                <col width="3%"/>
                                <col width="4%"/>
                                <col width="5%"/>
                            </colgroup>

                            <thead>
                                <th>번호</th>
                                <th>회원번호</th>
                                <th>OS구분</th>
                                <th>device uuid</th>
                                <th>device token</th>
                                <th>앱버전</th>
                                <th>브라우저정보</th>
                                <th>location</th>
                                <th>ip</th>
                                <th>로그인 일시</th>
                            </thead>
                            <tbody id="tableBody">
                            </tbody>
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

    function compare() {
        var startDate = $('#txt_startSel').val();
        var startDateArr = startDate.split('.');
        var endDate = $('#txt_endSel').val();
        var endDateArr = endDate.split('.');

        var startDateCompare = new Date(startDateArr[0], parseInt(startDateArr[1])-1, startDateArr[2]);
        var endDateCompare = new Date(endDateArr[0], parseInt(endDateArr[1])-1, endDateArr[2]);

        if(startDateCompare.getTime() > endDateCompare.getTime()) {
            alert('시작날짜와 종료날짜를 확인해주세요');
        }
    }

    $('input[id="searchText"]').keydown(function(e) {
        if (e.keyCode === 13) {
            compare();
            loginHistoryPagingInfo.pageNo = 1;
            getLoginHistoryList();
        };
    });

    $('#bt_search').click( function() {       //검색
        compare();
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
        util.getAjaxData("errorList", "/rest/member/member/login/history", $('#searchForm').serialize(), fn_success);
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
        <td><a href="javascript://" class="_openMemberPop" data-memNo="{{this.mem_no}}">{{mem_no}}</a></td>
        <td>{{{getCommonCodeLabel os_type 'loginHistoryOsType'}}}</td>
        <td style="text-align:left">{{device_uuid}}</td>
        <td style="text-align:left">{{device_token}}</td>
        <td>{{app_version}}</td>
        <td>{{browser}}</td>
        <td>{{location}}</td>
        <td>{{ip}}</td>
        <td>{{last_upd_date}}</td>
    </tr>
    {{else}}
    <tr>
        <td colspan="10">{{isEmptyData}}</td>
    </tr>
    {{/each}}
</script>