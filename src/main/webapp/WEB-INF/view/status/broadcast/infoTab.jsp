<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
</style>

<div class="row col-lg-12 form-inline" style="padding-top: 2px; padding-bottom: 0px;">
    <div class="widget-content">
        <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist" id="tablist_con">
            <li class="active"><a href="#total" role="tab" data-toggle="tab" id="tab_total">총계</a></li>
            <li><a href="#platform" role="tab" data-toggle="tab" id="tab_platformDetail">플랫폼</a></li>
            <li><a href="#airOpen" role="tab" data-toggle="tab" id="tab_airOpenDetail">방송개설</a></li>
            <li><a href="#airTime" role="tab" data-toggle="tab" id="tab_airtimeDetail">방송시간</a></li>
            <li><a href="#dj" role="tab" data-toggle="tab" id="tab_djDetail">DJ</a></li>
            <li><a href="#listener" role="tab" data-toggle="tab" id="tab_listenerDetail">청취자</a></li>
            <%--<li><a href="#guest" role="tab" data-toggle="tab" id="tab_guestDetail">게스트</a></li>--%>
            <li><a href="#gift" role="tab" data-toggle="tab" id="tab_giftDetail">선물</a></li>
            <li><a href="#giftHistory" role="tab" data-toggle="tab" id="tab_giftHistoryDetail">선물내역</a></li>
        </ul>
        <div class="tab-content">
            <div class="tab-pane fade in active" id="total"><jsp:include page="total.jsp"/></div>       <!-- 총계 -->
            <div class="tab-pane fade" id="platform"><jsp:include page="platform.jsp"/></div>               <!-- 플랫폼 -->
            <div class="tab-pane fade" id="airOpen"><jsp:include page="airOpen.jsp"/></div>  <!-- 방송개설 -->
            <div class="tab-pane fade" id="airTime"><jsp:include page="airTime.jsp"/></div>        <!-- 방송시간 -->
            <div class="tab-pane fade" id="dj"><jsp:include page="dj.jsp"/></div>      <!-- DJ -->
            <div class="tab-pane fade" id="listener"><jsp:include page="listener.jsp"/></div>        <!-- 청취자 -->
            <%--<div class="tab-pane fade" id="guest"><jsp:include page="guest.jsp"/></div>        <!-- 게스트 -->--%>
            <div class="tab-pane fade" id="gift"><jsp:include page="gift.jsp"/></div>        <!-- 선물 -->
            <div class="tab-pane fade" id="giftHistory"><jsp:include page="giftHistory.jsp"/></div>        <!-- 선물내역 -->
        </div>
    </div>
</div>

<script type="text/javascript">
    $("#tablist_con li a").on('click', function(){

        var tabId = $(this).prop('id');
        if(tabId == 'tab_total'){
            getTotalList();
        }else if(tabId == 'tab_platformDetail'){
            getPlatformList();
        }else if(tabId == 'tab_airOpenDetail'){
            getAirOpenList();
        }else if(tabId == 'tab_airtimeDetail'){
            getAirTimelList();
        }else if(tabId == 'tab_djDetail'){
            broadcastDj();
        }else if(tabId == 'tab_listenerDetail') {
            broadcastListener();
        }else if(tabId == 'tab_guestDetail') {
        }else if(tabId == 'tab_giftDetail') {
            broadcastGift();
        }else if(tabId == 'tab_giftHistoryDetail') {
            getGiftHistoryList();
        }

        $(".searchDate").html($("#onedayDate").val());
    });

    $("#bt_search").on('click', function(){

        if($('input[name="slctType"]:first').prop('checked')){
            $("._searchDate").html($("#startDate").val());
        }

        $("#tablist_con li.active a").click();
    });
</script>