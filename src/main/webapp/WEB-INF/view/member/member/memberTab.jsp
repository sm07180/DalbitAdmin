
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String memNo = request.getParameter("memNo");
%>
<style>
</style>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="row col-lg-12 form-inline" style="padding-top: 2px; padding-bottom: 0px;">
            <div class="widget-content">
                <ul class="nav nav-tabs" role="tablist">
                    <li class="active"><a href="#infoDetail" role="tab" data-toggle="tab">상세정보</a></li>
                    <li><a href="#broadDetail" role="tab" data-toggle="tab" id="tab_broadDetail">방송내역</a></li>
                    <li><a href="#listenDetail" role="tab" data-toggle="tab" id="tab_listenDetail">청취내역</a></li>
                    <li><a href="#payDetail" role="tab" data-toggle="tab" id="tab_payDetail">결제/취소내역</a></li>
                    <li><a href="#exchangeDetail" role="tab" data-toggle="tab" id="tab_exchangeDetail">환전내역</a></li>
                    <li><a href="#giftDetail" role="tab" data-toggle="tab" id="tab_giftDetail">선물/교환내역</a></li>
                    <li><a href="#mystarDetail" role="tab" data-toggle="tab" id="tab_mystarDetail">마이스타/팬</a></li>
                    <li><a href="#noticeDetail" role="tab" data-toggle="tab" id="tab_noticeDetail">회원공지관리</a></li>
                    <li><a href="#fanbordDetail" role="tab" data-toggle="tab" id="tab_fanbordDetail">팬보드관리</a></li>
                    <li><a href="#banDetail" role="tab" data-toggle="tab" id="tab_banDetail">금지어관리</a></li>
                    <li><a href="#receiptDetail" role="tab" data-toggle="tab" id="tab_receiptDetail">신고내역</a></li>
                    <li><a href="#questionDetail" role="tab" data-toggle="tab" id="tab_questionDetail">문의내역</a></li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane fade in active" id="infoDetail"><jsp:include page="mamberInfo.jsp"/></div>
                    <div class="tab-pane fade" id="broadDetail"><jsp:include page="../broadcast/list.jsp"/></div>
                    <div class="tab-pane fade" id="listenDetail"><jsp:include page="../listen/list.jsp"/></div>
                    <div class="tab-pane fade" id="payDetail"><jsp:include page="../pay/list.jsp"/></div>
                    <div class="tab-pane fade" id="exchangeDetail"></div>
                    <div class="tab-pane fade" id="giftDetail"></div>
                    <div class="tab-pane fade" id="mystarDetail"></div>
                    <div class="tab-pane fade" id="noticeDetail"></div>
                    <div class="tab-pane fade" id="fanbordDetail"></div>
                    <div class="tab-pane fade" id="banDetail"></div>
                    <div class="tab-pane fade" id="receiptDetail"></div>
                    <div class="tab-pane fade" id="questionDetail"></div>
                </div>
            </div>
        </div>
    </div>
    <!-- /#page-wrapper -->
</div>
<!-- /#wrapper -->

<script>
    $(document).ready(function() {

        <!-- 텝 시작 -->
        // $('#infoDetail').click(function() { getHistoryDetail(this.id); }); 		//   방송내역 텝
        $('#tab_broadDetail').click(function() { tab_id = this.id; getHistoryDetail(this.id); }); 		//   방송내역 텝
        $('#tab_listenDetail').click(function() { tab_id = this.id; getHistoryDetail(this.id); });		//   청취내역 텝
        $('#tab_payDetail').click(function() { tab_id = this.id; getHistoryDetail(this.id); });		    //   결제/취소내역 텝
        $('#tab_exchangeDetail').click(function() { tab_id = this.id; getHistoryDetail(this.id); });	//   환전내역 텝
        $('#tab_giftDetail').click(function() { tab_id = this.id; getHistoryDetail(this.id); });		//   선물/교환내역 텝
        $('#tab_mystarDetail').click(function() { tab_id = this.id; getHistoryDetail(this.id); });		//   마이스타/팬 텝
        $('#tab_noticeDetail').click(function() { tab_id = this.id; getHistoryDetail(this.id); }); 		//   회원공지관리 텝
        $('#tab_fanbordDetail').click(function() { tab_id = this.id; getHistoryDetail(this.id); });     //   팬보드관리 텝
        $('#tab_banDetail').click(function() { tab_id = this.id; getHistoryDetail(this.id); });         //   금지어관리 텝
        $('#tab_receiptDetail').click(function() { tab_id = this.id; getHistoryDetail(this.id); });     //   신고내역 텝
        $('#tab_questionDetail').click(function() { tab_id = this.id; getHistoryDetail(this.id); });	//   문의내역 텝
        <!-- 텝 끝 -->
    });

</script>