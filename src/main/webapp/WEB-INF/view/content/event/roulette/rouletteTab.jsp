<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="url" value="${requestScope['javax.servlet.forward.request_uri']}" />
<c:set var="param" value="${requestScope['javax.servlet.forward.query_string']}" />
<c:set var="param_menu" value="${param.menu}" />

<div id="headerTab">
    <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist">
        <li class="${url eq '/content/event/roulette/calendar' ? 'active' : ''}">
            <a href="/content/event/roulette/calendar">이벤트현황</a>
        </li>
       <%-- <li class="${url eq '/content/event/roulette/bonusList' ? 'active' : ''}">
            <a href="/content/event/roulette/bonusList">보너스</a>
        </li>--%>
        <li class="${url eq '/content/event/roulette/list' ? 'active' : ''}">
            <a href="/content/event/roulette/list">참여자목록</a>
        </li>
        <li class="${url eq '/content/event/roulette/giftManage' ? 'active' : ''}">
            <a href="/content/event/roulette/giftManage">선물지급관리</a>
        </li>
    </ul>
</div>

