<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="widget-content hide" id="tab_memberQuestion">
    <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist">
        <li class="active"><a href="#one" role="tab" data-toggle="tab"> 1:1문의 </a></li> <%-- href 수정 --%>
        <%--<li><a href="#call" role="tab" data-toggle="tab"> 전화문의 </a></li>--%>
     </ul>
    <div class="tab-content">
        <div class="tab-pane fade in active" id="one"><jsp:include page="../../customer/question/one.jsp"/></div> <%-- 1:1문의 --%>
        <%--<div class="tab-pane fade" id="call"><jsp:include page="../../customer/email/call.jsp"/></div> &lt;%&ndash; 전화문의 &ndash;%&gt;--%>
    </div>
</div>

<script>
    $(document).ready(function() {
    });
</script>