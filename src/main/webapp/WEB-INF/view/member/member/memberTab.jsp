
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
</style>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="row col-lg-12 form-inline" style="padding-top: 2px; padding-bottom: 0px;">
            <div class="widget-content">
                <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist">
                    <li class="active"><a href="#infoDetail" role="tab" data-toggle="tab">상세정보</a></li>
                    <li><a href="#broadDetail" role="tab" data-toggle="tab" id="tab_broadDetail" onclick="getHistory_tmp(this.id);">방송내역</a></li>
                    <li><a href="#listenDetail" role="tab" data-toggle="tab" id="tab_listenDetail" onclick="getHistory_tmp(this.id);">청취내역</a></li>
                    <li><a href="#payDetail" role="tab" data-toggle="tab" id="tab_payDetail" onclick="getHistory_tmp(this.id);">결제/취소내역</a></li>
                    <li><a href="#exchangeDetail" role="tab" data-toggle="tab" id="tab_exchangeDetail" onclick="getHistory_tmp(this.id);">환전내역</a></li>
                    <li><a href="#giftDetail" role="tab" data-toggle="tab" id="tab_giftDetail" onclick="getHistory_tmp(this.id);">선물/교환내역</a></li>
                    <li><a href="#mystarDetail" role="tab" data-toggle="tab" id="tab_mystarDetail" onclick="getHistory_tmp(this.id);">마이스타/팬</a></li>
                    <li><a href="#noticeDetail" role="tab" data-toggle="tab" id="tab_noticeDetail" onclick="getHistory_tmp(this.id);">회원공지관리</a></li>
                    <li><a href="#fanbordDetail" role="tab" data-toggle="tab" id="tab_fanbordDetail" onclick="getHistory_tmp(this.id);">팬보드관리</a></li>
                    <li><a href="#banDetail" role="tab" data-toggle="tab" id="tab_banDetail" onclick="getHistory_tmp(this.id);">금지어관리</a></li>
                    <li><a href="#receiptDetail" role="tab" data-toggle="tab" id="tab_receiptDetail" onclick="getHistory_tmp(this.id);">신고내역</a></li>
                    <li><a href="#questionDetail" role="tab" data-toggle="tab" id="tab_questionDetail" onclick="getHistory_tmp(this.id);">문의내역</a></li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane fade in active" id="infoDetail"><jsp:include page="mamberInfo.jsp"/></div>     <!-- 상세 -->
                    <div class="tab-pane fade" id="broadDetail"><jsp:include page="../broadcast/list.jsp"/></div>       <!-- 방송 -->
                    <div class="tab-pane fade" id="listenDetail"><jsp:include page="../listen/list.jsp"/></div>         <!-- 청취 -->
                    <div class="tab-pane fade" id="payDetail"><jsp:include page="../pay/list.jsp"/></div>               <!-- 결제 -->
                    <div class="tab-pane fade" id="exchangeDetail"><jsp:include page="../exchange/list.jsp"/></div>     <!-- 환전 -->
                    <div class="tab-pane fade" id="giftDetail"><jsp:include page="../gift/list.jsp"/></div>             <!-- 선물 -->
                    <div class="tab-pane fade" id="mystarDetail"><jsp:include page="../myStar/list.jsp"/></div>         <!-- 마이스타 -->
                    <div class="tab-pane fade" id="noticeDetail"><jsp:include page="../notice/list.jsp"/></div>         <!-- 공지 -->
                    <div class="tab-pane fade" id="fanbordDetail"><jsp:include page="../fanbord/list.jsp"/></div>       <!-- 팬보드 -->
                    <div class="tab-pane fade" id="banDetail"><jsp:include page="../ban/list.jsp"/></div>               <!-- 금지어 -->
                    <div class="tab-pane fade" id="receiptDetail"><jsp:include page="../receipt/list.jsp"/></div>       <!-- 신고 -->
                    <div class="tab-pane fade" id="questionDetail"><jsp:include page="../question/list.jsp"/></div>     <!-- 문의 -->
                </div>
            </div>
        </div>
    </div>
    <!-- /#page-wrapper -->
</div>
<!-- /#wrapper -->

<script>
    $(document).ready(function() {
    });

    function getHistory_tmp(tmp){
        console.log("tmp : " + tmp);
        if(tmp.indexOf("_") > 0){       // userid 클릭시 _ 없이 호출
            tmp = tmp.split("_");
            tmp = tmp[1];
        }
        tab_id = tmp;
        getHistoryDetail(tmp);
    }
</script>