<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="cfn" uri="/WEB-INF/tld/comFunction.tld" %>
<c:set var="dummyData"><%= java.lang.Math.round(java.lang.Math.random() * 1000000) %></c:set>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="container-fluid">
            <!-- serachBox -->
            <form id="searchForm">
                <div class="row col-lg-12 form-inline no-padding">
                    <%--<input type="hidden" name="pageStart" id="pageStart">
                    <input type="hidden" name="pageCnt" id="pageCnt">--%>
                    <div class="widget widget-table searchBoxArea">
                        <div class="widget-header searchBoxRow">
                            <h3 class="title"><i class="fa fa-search"></i> 교환내역 검색</h3>
                            <div>
                                <span id="searchFormRadio"></span>

                                <div class="input-group date" id="rangeDatepicker">
                                    <label for="displayDate" class="input-group-addon">
                                        <span><i class="fa fa-calendar"></i></span>
                                    </label>
                                    <input type="text" name="displayDate" id="displayDate" class="form-control" />
                                </div>

                                <input type="hidden" name="startDate" id="startDate">
                                <input type="hidden" name="endDate" id="endDate" />

                                <%--<input name="startDate" id="startDate">--%>
                                <%--<input name="endDate" id="endDate" />--%>


                                <label><input type="text" class="form-control" id="search_value" name="search_value"></label>
                                <button type="button" class="btn btn-success" id="bt_search">검색</button>
                                <a href="javascript://" class="_prevSearch">[이전]</a>
                                <a href="javascript://" class="_todaySearch">[오늘]</a>
                                <a href="javascript://" class="_nextSearch">[다음]</a>

                                <%--<button type="button" class="btn btn-primary" id="bt_search_special">600달 이상 보유 회원</button>--%>
                                <label class="control-inline fancy-checkbox custom-color-green">
                                    <input type="checkbox" name="search_testId" id="search_testId" value="1" checked="true">
                                    <span>테스트 아이디 제외</span>
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            <!-- //serachBox -->
            <div class="row widget-content col-md-6 no-padding">
                <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist">
                    <li><a href="/money/resource/info?tabType=0">시간대별</a></li>
                    <li><a href="/money/resource/info?tabType=1">월간별</a></li>
                    <li><a href="/money/resource/info?tabType=2">연간별</a></li>
                    <li><a href="/money/resource/info?tabType=3">회원Data</a></li>
                    <li><a href="/money/resource/info?tabType=4">달 구매내역</a></li>
                    <li><a href="/money/resource/info?tabType=5">달 사용내역</a></li>
                    <li class="active"><a href="#change" >교환내역</a></li>
                    <li><a href="/status/exchange/info" id="tab_exchangeList" title="환전내역으로 이동합니다.">환전내역</a></li>
                </ul>
            </div>
            <div class="col-lg-5 pull-right no-padding" id="div_changeSummary" style="margin-right: 13px;">
                <span id="change_summaryArea"></span>
            </div>
            <div class="col-lg-5 pull-right no-padding" id="div_autoChangeSummary" style="margin-right: 13px;display: none">
                <span id="autoChange_summaryArea"></span>
            </div>
            <div class="tab-content">
                <div class="tab-pane fade in active" id="change" >
                        <div class="row widget-content col-md-6 no-padding mt10">
                            <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist">
                                <li class="active"><a href="#changeList" role="tab" data-toggle="tab" id="tab_changeList" onclick="tab_changeListClick(this.id)">교환내역</a></li>
                                <li><a href="#changeAuto" role="tab" data-toggle="tab" id="tab_changeAuto" onclick="tab_changeListClick(this.id)"> 자동교환 설정내역</a></li>
                            </ul>
                        </div>
                    <div class="tab-content no-padding">
                        <div class="tab-pane fade in active" id="changeList" >
                            <jsp:include page="changeList.jsp"/>
                        </div>
                        <div class="tab-pane fade" id="changeAuto" >
                            <jsp:include page="changeAutoList.jsp"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#detailView" id="showModal" style="display:none;">레이어팝업오픈버튼</button>

<div class="modal fade" id="detailView" tabindex="-1" role="dialog" aria-labelledby="detailViewLabel" aria-hidden="true"></div>

<form name="excelForm" id="excelForm"></form>

<script type="text/javascript" src="/js/lib/jquery.table2excel.js"></script>
<script type="text/javascript" src="/js/code/money/exchangeCodeList.js?${dummyData}"></script>
<script type="text/javascript" src="/js/code/member/memberCodeList.js?${dummyData}"></script>
<script type="text/javascript" src="/js/handlebars/moneyHelper.js?${dummyData}"></script>
<script type="text/javascript">
    var dateTime = new Date();
    dateTime = moment(dateTime).format("YYYY.MM.DD");
    setTimeDate(dateTime);

    var sDate;
    var eDate;
    var _searchFormRadio ="";
    var orderType=0;
    var changeTabId = "tab_changeList";
    $(function(){
        $("#searchFormRadio").html(util.getCommonCodeRadio(2, searchFormRadio));

        $("#displayDate").statsDaterangepicker(
            function(start, end, t1) {
                $("#startDate").val(start.format('YYYY.MM.DD'));
                $("#endDate").val(end.format('YYYY.MM.DD'));
            }
        );
        if(changeTabId == "tab_changeList") {
            getList();
        }else{
            getAutoList();
        }
    });

    $(document).on('change', 'input[name="searchFormRadio"]', function(){
        radioChange();
    });

    function radioChange(){
        _searchFormRadio = $('input[name="searchFormRadio"]:checked').val();
        if(_searchFormRadio == 2){
            setTimeDate(dateTime);
        }
        setStartDay();
    }

    $(document).on('click', '._prevSearch', function(){
        searchDate('prev');
    });

    $(document).on('click', '._nextSearch', function(){
        searchDate('next');
    });

    $(document).on('click', '._todaySearch', function(){
        $("input:radio[name='searchFormRadio']:radio[value='2']").prop('checked', true);
        _searchFormRadio = $('input[name="searchFormRadio"]:checked').val();
        setTimeDate(dateTime);
        setStartDay();
    });

    function setTimeDate(dateTime){
        itemPagingInfo.pageNo = 1;
        $("#startDate").val(dateTime);
        $("#endDate").val(dateTime);
        $("#displayDate").val(dateTime + " - " + dateTime);
    }

    function searchDate(dateType){
        if(dateType == 'prev'){
            setDay(-1);
        }else if(dateType == 'next'){
            setDay(1);
        }
    }

    function setDay(days){
        $("#startDate").val(moment($("#startDate").val()).add('days', days).format('YYYY.MM.DD'));
        $("#endDate").val(moment($("#endDate").val()).add('days', days).format('YYYY.MM.DD'));

        $("#displayDate").val($("#startDate").val() + " - " + $("#endDate").val());

        if(changeTabId == "tab_changeList") {
            getList();
        }else{
            getAutoList();
        }
    }
    function setStartDay(){
        var date = new Date();
        $("#endDate").val(dateTime);

        if(_searchFormRadio == 1) {     // 일주일 전
            sDate = new Date(Date.parse(date) - 7 * 1000 * 60 * 60 * 24);           // 일주일 전
            sDate = date.getFullYear() +"."+ common.lpad(sDate.getMonth() + 1,2,"0") +"."+ common.lpad(sDate.getDate()+1,2,"0");      // 일주일전
            $("#startDate").val(sDate);
        }else if(_searchFormRadio == 0) {       // 한달전
            var setMonthDate;
            var cal = common.lpad(date.getMonth(),2,"0") + "." + common.lpad(new Date(date.getFullYear(), date.getMonth(), 0).getDate(),2,"0");

            if(common.lpad(date.getMonth(),2,"0") +"."+ common.lpad(date.getDate(),2,"0") > cal) {
                setMonthDate = cal;
            } else {
                setMonthDate = common.lpad(date.getMonth(),2,"0") +"."+ common.lpad(date.getDate(),2,"0");
            }

            sDate = date.getFullYear() + "." + setMonthDate;
            $('#startDate').val(sDate);
        }
        $("#displayDate").val($("#startDate").val() + " - " + $("#endDate").val());

        if(changeTabId == "tab_changeList") {
            getList();
        }else{
            getAutoList();
        }
    }

    function getParameter(){
        return data = {
            searchText : $("#search_value").val()
            , searchType : ""
            , innerType : $('input[name="search_testId"]').prop('checked') ? 1 : 0
            , startDate : $("#startDate").val()
            , endDate : $("#endDate").val()
            , orderType : orderType
            , pageNo : itemPagingInfo.pageNo
            , pageCnt : itemPagingInfo.pageCnt
            , autoType : $("#changeAutoSetting").val()
        };
    }

    function getList(){
        console.log(getParameter());
        util.getAjaxData("select", "/rest/money/item/list", getParameter(), fn_succ_list);
    }

    function getAutoList(){
        console.log(getParameter());
        util.getAjaxData("select", "/rest/money/item/autoList", getParameter(), fn_succ_autoList);
    }

    $('#bt_search').on('click', function(){
        if(changeTabId == "tab_changeList") {
            itemPagingInfo.pageNo = 1;
            getList();
        }else{
            autoChangePagingInfo.pageNo = 1;
            getAutoList();
        }
    });

    $('input[id="search_value"]').on('keydown', function(e) {    // textBox 처리
        if(e.keyCode == 13) {
            if(changeTabId == "tab_changeList") {
                itemPagingInfo.pageNo = 1;
                getList();
            }else{
                autoChangePagingInfo.pageNo = 1;
                getAutoList();
            }
        };
    });

    $('._tab').on('click', function(){
        $('._tab').removeClass('active');
        $(this).addClass('active');

        if(changeTabId == "tab_changeList") {
            itemPagingInfo.pageNo = 1;
            getList();
        }else{
            autoChangePagingInfo.pageNo = 1;
            getAutoList();
        }
    });

    $('input[name="search_testId"]').on('change', function(){
        if(changeTabId == "tab_changeList") {
            itemPagingInfo.pageNo = 1;
            getList();
        }else{
            autoChangePagingInfo.pageNo = 1;
            getAutoList();
        }
    });

    function tab_changeListClick(tmp){
        changeTabId = tmp;
        if(changeTabId == "tab_changeList"){
            $("#div_changeSummary").show();
            $("#div_autoChangeSummary").hide();
            getList();
        }else if(changeTabId == "tab_changeAuto"){
            $("#div_changeSummary").hide();
            $("#div_autoChangeSummary").show();
            getAutoList();
        }
    }

    function handlebarsPaging(targetId, pagingInfo){
        console.log(targetId);
        if(targetId == "list_info_paginate_top"){
            itemPagingInfo = pagingInfo;
            getList();
        }else{
            autoChangePagingInfo = pagingInfo;
            getAutoList();
        }
    }


</script>
