<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String in_roomNo = request.getParameter("roomNo");
%>

<div class="col-md-12 no-padding">
    <div class="widget-content">
        <div class="widget-content">
            <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist" id="tablist_con">
                <li class="active"><a href="#storyDetail" role="tab" data-toggle="tab" id="tab_storyDetail">사연내역</a></li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane fade in active" id="storyDetail"><jsp:include page="../../story/list.jsp"/></div>               <!-- 사연 -->
            </div>
        </div>
    </div>
</div>


<script>
    var room_no;
    $(document).ready(function() {
        room_no = <%=in_roomNo%>;

        getBroadHistory_story("storyDetail");
    });
</script>