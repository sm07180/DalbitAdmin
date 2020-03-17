<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>

<div id="wrapper">
    <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist">
        <li><a href="#eventDetail" role="tab" data-toggle="tab" id="tab_eventDetail">이벤트 상세정보</a></li>
        <li><a href="#eventReport" role="tab" data-toggle="tab" id="tab_eventReport">응모자/당첨자</a></li>
    </ul>
    <div class="tab-content">
        <div class="tab-pane fade" id="eventDetail"><jsp:include page="/WEB-INF/view/content/event/eventDetail.jsp"/></div>     <!-- 상세 -->
        <div class="tab-pane fade" id="eventReport"><jsp:include page="/WEB-INF/view/content/event/eventReport.jsp"/></div>     <!-- 응모자/당첨자 -->
    </div>
</div>

<script>
    $(document).ready(function() {
    });
</script>