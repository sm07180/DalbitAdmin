<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>

<div id="wrapper">
    <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist">
        <li><a href="#pushMsgList" role="tab" data-toggle="tab" id="tab_pushMsgList">푸시 메세지</a></li>
        <%--<li><a href="#pushClosedEventList" role="tab" data-toggle="tab" id="tab_pushClosedEventList" onclick="init_pushClosedEventList(this.id.split('_')[1]);">마감된 이벤트</a></li>--%>
    </ul>
    <div class="tab-content">
        <div class="tab-pane fade" id="pushMsgList"><jsp:include page="/WEB-INF/view/content/push/pushMsgList.jsp"/></div>     <!-- 상세 -->
        <%--<div class="tab-pane fade" id="pushClosedEventList"><jsp:include page="/WEB-INF/view/content/push/pushClosedEventList.jsp"/></div>       <!-- 방송 -->--%>
    </div>
</div>

<script>
    $(document).ready(function() {
    });
</script>