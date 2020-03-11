<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>

<div id="wrapper">
    <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist">
        <li><a href="#pushMsgList" role="tab" data-toggle="tab" id="tab_pushMsgList">배너 상세정보</a></li>
    </ul>
    <div class="tab-content">
        <div class="tab-pane fade" id="pushMsgList"><jsp:include page="/WEB-INF/view/content/banner/bannerDetail.jsp"/></div>     <!-- 상세 -->
    </div>
</div>

<script>
    $(document).ready(function() {
    });
</script>