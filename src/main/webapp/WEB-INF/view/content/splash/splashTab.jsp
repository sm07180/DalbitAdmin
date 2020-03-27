<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>

<div id="wrapper">
    <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist">
        <li><a href="#splashList" role="tab" data-toggle="tab" id="tab_splashList">스플래시 메세지</a></li>
    </ul>
    <div class="tab-content">
        <div class="tab-pane fade" id="splashList"><jsp:include page="/WEB-INF/view/content/splash/splashDetail.jsp"/></div>     <!-- 상세 -->
    </div>
</div>

<script>
    $(document).ready(function() {
    });
</script>