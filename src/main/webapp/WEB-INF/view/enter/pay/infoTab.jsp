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
                    <li><a href="#member" role="tab" data-toggle="tab" id="tab_memberDetail">결제 회원별</a></li>
                    <li><a href="#way" role="tab" data-toggle="tab" id="tab_wayDetail">결제 수단별</a></li>
                    <li><a href="#product" role="tab" data-toggle="tab" id="tab_productDetail">결제 상품별</a></li>
                    <li><a href="#history" role="tab" data-toggle="tab" id="tab_historyDetail">결제 내역</a></li>
                    <li><a href="#cancel" role="tab" data-toggle="tab" id="tab_cancelDetail">졀제 취소</a></li>
                    <li><a href="#exchange" role="tab" data-toggle="tab" id="tab_exchangeDetail">환불</a></li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane fade in active" id="total"><jsp:include page="total.jsp"/></div>              <!-- 총계 -->
                    <div class="tab-pane fade" id="member"><jsp:include page="member.jsp"/></div>            <!-- 결제 회원별 -->
                    <div class="tab-pane fade" id="way"><jsp:include page="way.jsp"/></div>                  <!-- 결제 수단별 -->
                    <div class="tab-pane fade" id="product"><jsp:include page="product.jsp"/></div>          <!-- 결제 상품별 -->
                    <div class="tab-pane fade" id="history"><jsp:include page="history.jsp"/></div>          <!-- 결제 내역 -->
                    <div class="tab-pane fade" id="cancel"><jsp:include page="cancel.jsp"/></div>            <!-- 결제 취소 -->
                    <div class="tab-pane fade" id="exchange"><jsp:include page="exchange.jsp"/></div>        <!-- 환불 -->
                </div>
            </div>
        </div>
    </div>
    <!-- /#page-wrapper -->
</div>
<!-- /#wrapper -->