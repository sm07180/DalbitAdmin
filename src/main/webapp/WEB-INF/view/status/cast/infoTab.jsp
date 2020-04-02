<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
</style>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="row col-lg-12 form-inline" style="padding-top: 2px; padding-bottom: 0px;">
            <div class="widget-content">
                <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist" id="tablist_con">
                    <li class="active"><a href="#total" role="tab" data-toggle="tab">총계</a></li>
                    <li><a href="#cast" role="tab" data-toggle="tab" id="tab_castDetail">캐스트 건</a></li>
                    <li><a href="#dj" role="tab" data-toggle="tab" id="tab_djDetail">DJ</a></li>
                    <li><a href="#viewCnt" role="tab" data-toggle="tab" id="tab_viewCntDetail">조회수</a></li>
                    <li><a href="#gift" role="tab" data-toggle="tab" id="tab_giftmDetail">선물</a></li>
                    <li><a href="#giftHistory" role="tab" data-toggle="tab" id="tab_giftHistoryDetail">선물 내역</a></li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane fade in active" id="total"><jsp:include page="total.jsp"/></div>       <!-- 총계 -->
                    <div class="tab-pane fade" id="cast"><jsp:include page="cast.jsp"/></div>                   <!-- 캐스트 건 -->
                    <div class="tab-pane fade" id="dj"><jsp:include page="dj.jsp"/></div>                       <!-- DJ -->
                    <div class="tab-pane fade" id="viewCnt"><jsp:include page="viewCnt.jsp"/></div>             <!-- 조회수 -->
                    <div class="tab-pane fade" id="gift"><jsp:include page="gift.jsp"/></div>                   <!-- 선물 -->
                    <div class="tab-pane fade" id="giftHistory"><jsp:include page="giftHistory.jsp"/></div>     <!-- 선물 내역 -->
                </div>
            </div>
        </div>
    </div>
    <!-- /#page-wrapper -->
</div>
<!-- /#wrapper -->