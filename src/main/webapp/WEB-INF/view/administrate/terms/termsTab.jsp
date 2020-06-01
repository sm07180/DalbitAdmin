<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="widget-content hide" id="tab_termsTab">
    <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist">
        <li class="active mt10"><a href="#terms" role="tab" data-toggle="tab"> 약관 상세 </a></li>
     </ul>
    <div class="tab-content">
        <div class="tab-pane fade in active" id="terms"><jsp:include page="detail.jsp"/></div> <%-- 1:1 문의 --%>
    </div>
</div>