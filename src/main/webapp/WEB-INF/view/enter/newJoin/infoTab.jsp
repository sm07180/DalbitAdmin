<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="row col-lg-12 form-inline" style="padding-top: 2px; padding-bottom: 0px;">
            <div class="widget-content">
                <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist" id="tablist_con">
                    <li class="active"><a href="#live" role="tab" data-toggle="tab" id="tab_live">실시간</a></li>
                    <li><a href="#calendar" role="tab" data-toggle="tab" id="tab_calendar">일자별</a></li>
                    <li><a href="#month" role="tab" data-toggle="tab" id="tab_month">월간별</a></li>
                    <li><a href="#platAge" role="tab" data-toggle="tab" id="tab_platformAge">플랫폼(연령별)</a></li>
                    <li><a href="#platGender" role="tab" data-toggle="tab" id="tab_platformGender">플랫폼(성별)</a></li>
                    <li><a href="/member/join/list" id="tab_joMemberAllDetail" title="회원검색으로 이동합니다.">가입/탈퇴회원 내역</a></li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane fade in active" id="live"><jsp:include page="live.jsp"/></div>       <!-- 실시간 -->
                    <div class="tab-pane fade" id="calendar"><jsp:include page="calendar.jsp"/></div>         <!-- 일자별 -->
                    <div class="tab-pane fade" id="month"><jsp:include page="month.jsp"/></div>               <!-- 월간별 -->
                    <div class="tab-pane fade" id="platAge"><jsp:include page="platform_age.jsp"/></div>        <!-- 플랫폼(연령별) -->
                    <div class="tab-pane fade" id="platGender"><jsp:include page="platform_gender.jsp"/></div>  <!-- 플랫폼(성별) -->
                </div>
            </div>
        </div>
    </div>
    <!-- /#page-wrapper -->
</div>
<!-- /#wrapper -->

<script type="text/javascript">

    var tabId;
    $("#tablist_con li a").on('click', function(){

        tabId = $(this).prop('id');

        if(tabId == 'tab_live'){
            slctType = "0";
            me = 0;
        }else if(tabId == 'tab_calendar' || tabId == 'tab_month' || tabId == 'tab_platformAge' || tabId == 'tab_platformGender') {
            slctType = "1";
            me = 1;
        }

        radioChange();

        $("#searchForm").show();
        if(tabId == 'tab_live'){
           getLive();
        }else if(tabId == 'tab_calendar') {
           $("#searchForm").hide();
           getCalendar();
        }else if(tabId == 'tab_month') {
           getMonthList();
        }else if(tabId == 'tab_platformAge') {
           getPlatformAgeList();
        }else if(tabId == 'tab_platformGender') {
           getWithdrawList();
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