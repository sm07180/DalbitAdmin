
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
</style>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="widget-content">
            <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist" id="tablist_con">
                <li><a href="#timeOver" role="tab" data-toggle="tab" id="tab_timeOver">시간대별(중복)</a></li>
                <li class="active"><a href="#timeNonOver" role="tab" data-toggle="tab" id="tab_timeNonOver">시간대별(비중복)</a></li>
                <li><a href="#calendar" role="tab" data-toggle="tab" id="tab_calendar">일자별</a></li>
                <li><a href="#monthNonOver" role="tab" data-toggle="tab" id="tab_monthNonOver">월간별(비중복)</a></li>
                <li><a href="#yearNonOver" role="tab" data-toggle="tab" id="tab_yearNonOver">연간별(비중복)</a></li>
                <li><a href="#age" role="tab" data-toggle="tab" id="tab_loAgeDetail">연령대별(비중복)</a></li>
                <li><a href="#browserType" role="tab" data-toggle="tab" id="tab_loBrowserDetail">브라우저별</a></li>
                <li><a href="#loginHistory" role="tab" data-toggle="tab" id="tab_loginHistory">접속로그</a></li>
            </ul>
            <div class="tab-content  col-md-10">
                <div class="tab-pane fade" id="timeOver"><jsp:include page="timeOver.jsp"/></div>      <!-- 시간대별 중복 -->
                <div class="tab-pane fade in active" id="timeNonOver"><jsp:include page="timeNonOver.jsp"/></div>      <!-- 시간대별 비중복 -->
                <div class="tab-pane fade" id="calendar"><jsp:include page="calendar.jsp"/></div>      <!-- 일자별 -->
                <div class="tab-pane fade" id="monthNonOver"><jsp:include page="monthNonOver.jsp"/></div>      <!-- 월간별 비중복 -->
                <div class="tab-pane fade" id="yearNonOver"><jsp:include page="yearNonOver.jsp"/></div>      <!-- 연간별 비중복 -->
                <div class="tab-pane fade" id="age"><jsp:include page="age.jsp"/></div>             <!-- 연령대별 -->
                <div class="tab-pane fade" id="browserType"><jsp:include page="browser.jsp"/></div>         <!-- 브라우저별 -->
                <div class="tab-pane fade" id="loginHistory"><jsp:include page="loginHistory.jsp"/></div>         <!-- 브라우저별 -->
            </div>
        </div>
    </div>
    <!-- /#page-wrapper -->
</div>
<!-- /#wrapper -->

<script type="text/javascript">

    var tabId = "tab_timeNonOver";
    $("#tablist_con li a").on('click', function(){
        tabId = $(this).prop('id');
        if(tabId == 'tab_timeNonOver' || tabId == 'tab_loginHistory' || tabId == 'tab_timeOver'){
            slctType = 0;
            me = 0;
            $(".searchDate").html($("#onedayDate").val() + " (" + toDay + ")");
        }else if(tabId == 'tab_monthNonOver' || tabId == 'tab_loAgeDetail' || tabId == 'tab_loBrowserDetail') {
            slctType = 1;
            me = 1;
        }else if(tabId == 'tab_yearNonOver'){
            slctType = 2;
            me = 2;
        }
        radioChange();

        if(tabId != 'tab_loginHistory') {
            $("#searchText").addClass('hide');
        }else{
            $("#searchText").removeClass('hide');
        }

        $("#searchForm").show();
        if(tabId == 'tab_timeOver'){
            getTimeOver();
        }else if(tabId == 'tab_timeNonOver') {
            getTimeNonOver();
        }else if(tabId == 'tab_monthNonOver') {
            getMonthNonOver();
        }else if(tabId == 'tab_yearNonOver') {
            getYearNonOver();
        }else if(tabId == 'tab_loAgeDetail') {
            getAgeNonOver();
        }else if(tabId == 'tab_loBrowserDetail') {
            getBrowserList();
        }else if(tabId == 'tab_loginHistory') {
            getLoginHistoryList();
        }else if(tabId == 'tab_calendar'){
            $("#searchForm").hide();
            getCalendarInfo();
        }

    });

    $("#bt_search").on('click', function(){
        searchClick = true;
        if(tabId == 'tab_timeOver'){
            getTimeOver();
        }else if(tabId == 'tab_timeNonOver'){
            getTimeNonOver();
        }else if(tabId == 'tab_monthNonOver') {
            getMonthNonOver();
        }else if(tabId == 'tab_timeNonOver') {
            getCalendar();
        }else if(tabId == 'tab_yearNonOver') {
            getYearNonOver();
        }else if(tabId == 'tab_loAgeDetail') {
            getAgeNonOver();
        }else if(tabId == 'tab_loBrowserDetail') {
            getBrowserList();
        }else if(tabId == 'tab_loginHistory') {
            getLoginHistoryList();
        }
    });
</script>