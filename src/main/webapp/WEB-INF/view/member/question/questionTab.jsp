<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String memNo = request.getParameter("memNo");
%>
<style>

</style>

<div class="row col-lg-12 form-inline" style="padding-top: 2px; padding-bottom: 0px;">
    <div class="widget-content">
        <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist">
            <li class="active"><a href="#one" role="tab" data-toggle="tab"> 1:1문의 </a></li>
            <li><a href="#call" role="tab" data-toggle="tab"> 전화문의 </a></li>
            <li><a href="#mail" role="tab" data-toggle="tab"> 메일문의 </a></li>
         </ul>
        <div class="row col-lg-12 form-inline" style="padding-top: 2px; padding-bottom: 0px;">
            <div class="tab-content">
                <div class="tab-pane fade in active" id="one"><jsp:include page="../../customer/question/one.jsp"/></div> <%-- 1:1 문의 --%>
                <div class="tab-pane fade" id="call"><jsp:include page="../../customer/email/call.jsp"/></div> <%-- 전화문의 --%>
                <div class="tab-pane fade" id="mail"><jsp:include page="../../customer/email/email.jsp"/></div> <%-- 메일문의 --%>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function() {
    });
</script>