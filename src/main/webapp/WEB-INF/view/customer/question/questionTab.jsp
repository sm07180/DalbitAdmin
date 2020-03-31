<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="widget-content hide" id="tab_list">
    <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist">
        <li class="active"><a href="#one" role="tab" data-toggle="tab"> 1:1문의 </a></li>
     </ul>
    <div class="tab-content">
        <div class="tab-pane fade in active" id="one"><jsp:include page="one.jsp"/></div> <%-- 1:1 문의 --%>
    </div>
</div>