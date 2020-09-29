
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
</style>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="widget-content">
            <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist" id="tablist_con">
                <li class="active"><a href="#time" role="tab" data-toggle="tab" id="tab_time">시간대별</a></li>
                <li><a href="#calendar" role="tab" data-toggle="tab" id="tab_calendar">일자별</a></li>
                <li><a href="#day" role="tab" data-toggle="tab" id="tab_day">월간별</a></li>
                <li><a href="#year" role="tab" data-toggle="tab" id="tab_year">연간별</a></li>

                <%--<li><a href="#age" role="tab" data-toggle="tab" id="tab_loAgeDetail">연령대별</a></li>--%>
                <%--<li><a href="#loginHistory" role="tab" data-toggle="tab" id="tab_loginHistory">주제별 청취현황</a></li>--%>
            </ul>
            <div class="tab-content">
                <div class="tab-pane fade in active" id="time"><jsp:include page="time.jsp"/></div>      <!-- 시간대별 중복 -->
                <div class="tab-pane fade" id="calendar"><jsp:include page="calendar.jsp"/></div>      <!-- 일자별 -->
                <div class="tab-pane fade" id="day"><jsp:include page="day.jsp"/></div>      <!-- 월간별 -->
                <div class="tab-pane fade" id="year"><jsp:include page="year.jsp"/></div>      <!-- 연간별 -->

                <%--<div class="tab-pane fade" id="age"><jsp:include page="age.jsp"/></div>             <!-- 연령대별 -->--%>
                <%--<div class="tab-pane fade" id="browserType"><jsp:include page="browser.jsp"/></div>         <!-- 브라우저별 -->--%>
                <%--<div class="tab-pane fade" id="loginHistory"><jsp:include page="loginHistory.jsp"/></div>         <!-- 브라우저별 -->--%>
            </div>
        </div>
    </div>
    <!-- /#page-wrapper -->
</div>
<!-- /#wrapper -->

<script type="text/javascript">

    var tabId = "tab_time";
    $("#tablist_con li a").on('click', function(){
        tabId = $(this).prop('id');
        if(tabId == 'tab_time'){
            slctType = "0";
            me = 0;
            $(".searchDate").html($("#onedayDate").val() + " (" + toDay + ")");
        }else if(tabId == 'tab_day') {
            slctType = "1";
            me = 1;
        }else if(tabId == 'tab_year'){
            slctType = "2";
            me = 2;
        }
        radioChange();

        $("#searchForm").show();
        console.log("---------------");
        console.log(tabId);
        if(tabId == 'tab_time'){
            getTimeList();
        }else if(tabId == 'tab_day') {
            getDayList();
        }else if(tabId == 'tab_year') {
            getYearList();
        }else if(tabId == 'tab_calendar'){
            $("#searchForm").hide();
            getCalendarInfo();
        }

    });

    $("#bt_search").on('click', function(){
        searchClick = true;
        if(tabId == 'tab_time'){
            getTimeList();
        }else if(tabId == 'tab_day') {
            getDayList();
        }else if(tabId == 'tab_year') {
            getYearList();
        }
    });
</script>