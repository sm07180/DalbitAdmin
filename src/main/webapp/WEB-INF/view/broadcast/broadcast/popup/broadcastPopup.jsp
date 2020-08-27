<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String in_roomNo = request.getParameter("roomNo");
    String in_type = request.getParameter("type");
%>

<div class="col-md-12 no-padding">
    <div class="widget-content">
        <div class="tab-pane fade in active" id="memberDetail"><jsp:include page="../broadcastTab.jsp"/></div>     <!-- 상세 -->
    </div>
</div>
<!-- 이미지 원본 크기 -->
<div id="imageFullSize"></div>

<script>
    $(document).ready(function() {
    });

    init();

    var type;
    function init() {
        console.log("1");
        var roomNo =  <%=in_roomNo%>;
        type =  <%=in_type%>;

        if(!common.isEmpty(type)){
            $('.nav-tabs li:eq(' + Number(type) + ') a').tab('show');
        }
        getBroadCast_info_popup(roomNo);

    }
</script>