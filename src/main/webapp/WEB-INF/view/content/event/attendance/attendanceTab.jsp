<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="url" value="${requestScope['javax.servlet.forward.request_uri']}" />
<c:set var="param" value="${requestScope['javax.servlet.forward.query_string']}" />
<c:set var="param_menu" value="${param.menu}" />

<div id="headerTab">
    <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist">
        <li class="${url eq '/content/event/attendance/calendar' ? 'active' : ''}">
            <a href="/content/event/attendance/calendar">출석체크</a>
        </li>
        <li class="${url eq '/content/event/attendance/bonusList' ? 'active' : ''}">
            <a href="/content/event/attendance/bonusList">보너스</a>
        </li>
        <li class="${url eq '/content/event/attendance/list' ? 'active' : ''}">
            <a href="/content/event/attendance/list">참여자목록</a>
        </li>
        <li class="${url eq '/content/event/attendance/giftconList' ? 'active' : ''}">
            <a href="/content/event/attendance/giftconList">기프티콘</a>
        </li>
    </ul>
</div>

