
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
</style>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="widget-content">
            <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist" id="tablist_con">
                <li class="active"><a href="#timeNonOver" role="tab" data-toggle="tab" id="tab_timeNonOver" onclick="tab_click();">시간대별(비중복)</a></li>
                <li><a href="#monthNonOver" role="tab" data-toggle="tab" id="tab_monthNonOver">월간별(비중복)</a></li>
                <li><a href="#yearNonOver" role="tab" data-toggle="tab" id="tab_yearNonOver">년간별(비중복)</a></li>
                <li><a href="#age" role="tab" data-toggle="tab" id="tab_loAgeDetail">연령대별(비중복)</a></li>
                <li><a href="#browserType" role="tab" data-toggle="tab" id="tab_loBrowserDetail">브라우저별</a></li>
            </ul>
            <div class="tab-content  col-md-9">
                <div class="tab-pane fade in active" id="timeNonOver"><jsp:include page="timeNonOver.jsp"/></div>      <!-- 시간대별 비중복 -->
                <div class="tab-pane fade" id="monthNonOver"><jsp:include page="monthNonOver.jsp"/></div>      <!-- 월간별 비중복 -->
                <div class="tab-pane fade" id="yearNonOver"><jsp:include page="yearNonOver.jsp"/></div>      <!-- 년간별 비중복 -->
                <div class="tab-pane fade" id="age"><jsp:include page="age.jsp"/></div>             <!-- 연령대별 -->
                <div class="tab-pane fade" id="browserType"><jsp:include page="browser.jsp"/></div>         <!-- 브라우저별 -->
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
        var bStartDate;
        var bEndDate;

        var obj = {};
        obj.slctType = slctType;
        obj.startDate = $("#startDate").val();
        obj.endDate = $("#endDate").val();

        var bStartDate = $("#startDate").val();
        var syyyy = bStartDate.substr(0,4);
        var smm = bStartDate.substr(5,2);
        var sdd = bStartDate.substr(8,2);

        var bStartDate = $("#endDate").val();
        var eyyyy = bStartDate.substr(0,4);
        var emm = bStartDate.substr(5,2);
        var edd = bStartDate.substr(8,2);

        if(slctType == 1){
            bStartDate = new Date(syyyy, smm-1, sdd);
            bEndDate = new Date(eyyyy, emm-1, edd);
            obj.bStartDate = bStartDate.getFullYear() + "." + common.lpad(bStartDate.getMonth(),2,0) + "." + common.lpad(bStartDate.getDay(),2,0);
            obj.bEndDate = bEndDate.getFullYear() + "." + common.lpad(bEndDate.getMonth(),2,0) + "." + common.lpad(bEndDate.getDay(),2,0);
        }else if(slctType == 2){
            bStartDate = new Date(syyyy-1, smm, sdd) ;
            bEndDate = new Date(eyyyy-1, emm, edd);
            obj.bStartDate = bStartDate.getFullYear() + "." + common.lpad(bStartDate.getMonth(),2,0) + "." + common.lpad(bStartDate.getDay(),2,0);
            obj.bEndDate = bEndDate.getFullYear() + "." + common.lpad(bEndDate.getMonth(),2,0) + "." + common.lpad(bEndDate.getDay(),2,0);
        }
        if(tabId == 'tab_timeNonOver'){
            slctType = "0";
            me = 0;
        }else if(tabId == 'tab_monthNonOver' || tabId == 'tab_loAgeDetail' || tabId == 'tab_loBrowserDetail') {
            slctType = "1";
            me = 1;
        }else if(tabId == 'tab_yearNonOver'){
            slctType = "2";
            me = 2;
        }
        radioChange();
        if(tabId == 'tab_timeNonOver'){
            getTimeNonOver();
        }else if(tabId == 'tab_monthNonOver') {
            getMonthNonOver();
        }else if(tabId == 'tab_yearNonOver') {
            getYearNonOver();
        }else if(tabId == 'tab_loAgeDetail') {
            getAgeNonOver();
        }else if(tabId == 'tab_loBrowserDetail') {
            getBrowserList();
        }
        $(".searchDate").html($("#onedayDate").val() + " (" + toDay + ")");
    });

    $("#bt_search").on('click', function(){
        searchClick = true;

        if(tabId == 'tab_timeNonOver'){
            getTimeNonOver();
        }else if(tabId == 'tab_monthNonOver') {
            getMonthNonOver();
        }else if(tabId == 'tab_yearNonOver') {
            getYearNonOver();
        }else if(tabId == 'tab_loAgeDetail') {
            getAgeNonOver();
        }else if(tabId == 'tab_loBrowserDetail') {
            getBrowserList();
        }

    });
</script>