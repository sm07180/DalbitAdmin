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
                    <li><a href="#entry" role="tab" data-toggle="tab" id="tab_entryDetail">응모자 현황</a></li>
                    <li><a href="#platform" role="tab" data-toggle="tab" id="tab_platformDetail">플랫폼별 응모현황</a></li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane fade in active" id="total"><jsp:include page="total.jsp"/></div>       <!-- 총계 -->
                    <div class="tab-pane fade" id="entry"><jsp:include page="entry.jsp"/></div>         <!-- 장애유형 -->
                    <div class="tab-pane fade" id="platform"><jsp:include page="platform.jsp"/></div>           <!-- 플랫폼별 -->
                </div>
            </div>
        </div>
    </div>
    <!-- /#page-wrapper -->
</div>
<!-- /#wrapper -->