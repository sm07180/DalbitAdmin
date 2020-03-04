
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
                    <li><a href="#listenDetail" role="tab" data-toggle="tab" id="tab_listenDetail" onclick="getBroadHistory_listen(this.id);">청취자관리</a></li>
                    <li><a href="#chattingDetail" role="tab" data-toggle="tab" id="tab_chattingDetail" onclick="getBroadHistory_chatting(this.id);">채팅내역</a></li>
                    <li><a href="#likeDetail" role="tab" data-toggle="tab" id="tab_likeDetail" onclick="getBroadHistory_like(this.id);">좋아요 내역</a></li>
                    <li><a href="#giftDetail" role="tab" data-toggle="tab" id="tab_giftDetail" onclick="getBroadHistory_gift(this.id);">선물내역</a></li>
                    <li><a href="#storyDetail" role="tab" data-toggle="tab" id="tab_storyDetail" onclick="getBroadHistory_story(this.id);">사연내역</a></li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane fade in active" id="infoDetail"><jsp:include page="broadcastInfo.jsp"/></div>      <!-- 상세 -->
                    <%--<div class="tab-pane fade" id="listenDetail"><jsp:include page="../listen/list.jsp"/></div>             <!-- 청취자 -->--%>
                    <%--<div class="tab-pane fade" id="chattingDetail"><jsp:include page="../chatting/list.jsp"/></div>         <!-- 채팅 -->--%>
                    <div class="tab-pane fade" id="likeDetail"><jsp:include page="../like/list.jsp"/></div>                 <!-- 좋아요 -->
                    <%--<div class="tab-pane fade" id="giftDetail"><jsp:include page="../gift/list.jsp"/></div>                 <!-- 선물 -->--%>
                    <div class="tab-pane fade" id="storyDetail"><jsp:include page="../story/list.jsp"/></div>               <!-- 사연 -->
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

    var dtList_info_detail;
</script>