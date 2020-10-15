<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="row col-lg-12 form-inline" style="padding-top: 2px; padding-bottom: 0px;">
            <div class="widget-content">
                <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist" id="tablist_con">
                    <li class="active"><a href="#calendar" role="tab" data-toggle="tab" id="tab_calendar">일자별</a></li>
                    <li><a href="#time" role="tab" data-toggle="tab" id="tab_time">시간대별</a></li>
                    <li><a href="#month" role="tab" data-toggle="tab" id="tab_month">월간별</a></li>
                    <li><a href="/member/join/list?toptabType=1" id="tab_memberJoin" title="회원검색으로 이동합니다.">가입 회원내역</a></li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane fade in active" id="calendar"><jsp:include page="calendar.jsp"/></div>         <!-- 일자별 -->
                    <div class="tab-pane fade" id="time"><jsp:include page="time.jsp"/></div>       <!-- 실시간 -->
                    <div class="tab-pane fade" id="month"><jsp:include page="month.jsp"/></div>               <!-- 월간별 -->
                </div>
            </div>
        </div>
    </div>
    <!-- /#page-wrapper -->
</div>
<!-- /#wrapper -->

<script type="text/javascript">
    var tabId;

    var sDate;
    var eDate;
    var beforeSDate;
    var beforeEDate;

    $("#tablist_con li a").on('click', function(){

        tabId = $(this).prop('id');

        if(tabId == 'tab_time'){
            slctType = "0";
            me = 0;
        }else if(tabId == 'tab_calendar' || tabId == 'tab_month') {
            slctType = "1";
            me = 1;
        }

        radioChange();

        if(tabId == 'tab_time'){
           getTime();
        }else if(tabId == 'tab_calendar') {
           getCalendar();
        }else if(tabId == 'tab_month') {
           getMonthList();
        }

        $(".searchDate").html($("#onedayDate").val());
    });

    $("#bt_search").on('click', function(){
        if($('input[name="slctType"]:first').prop('checked')){
            $("._searchDate").html($("#startDate").val()+ " (" + toDay + ")");
        }

        $("#tablist_con li.active a").click();
    });
</script>