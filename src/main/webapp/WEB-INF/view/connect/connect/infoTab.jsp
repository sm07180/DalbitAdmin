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
                    <li><a href="#visitor" role="tab" data-toggle="tab" id="tab_coVisitorDetail">방문자 분석</a></li>
                    <li><a href="#user" role="tab" data-toggle="tab" id="tab_coUserDetail">접속자 분석</a></li>
                    <li><a href="#pageView" role="tab" data-toggle="tab" id="tab_coPageViewDetail">페이지 뷰</a></li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane fade in active" id="total"><jsp:include page="total.jsp"/></div>      <!-- 총계 -->
                    <div class="tab-pane fade" id="visitor"><jsp:include page="visitor.jsp"/></div>    <!-- 방문자 분석 -->
                    <div class="tab-pane fade" id="user"><jsp:include page="user.jsp"/></div>    <!-- 접속자 분석 -->
                    <div class="tab-pane fade" id="pageView"><jsp:include page="pageView.jsp"/></div>    <!-- 페이지뷰 -->
                </div>
            </div>
        </div>
    </div>
    <!-- /#page-wrapper -->
</div>
<!-- /#wrapper -->