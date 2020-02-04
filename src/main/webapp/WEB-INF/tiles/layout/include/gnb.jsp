<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="url" value="${requestScope['javax.servlet.forward.request_uri']}" />

<ul class="nav nav-pills nav-pills-custom-minimal custom-minimal-bottom" role="tablist">
    <li class="${fn:startsWith(url, '/dashboard/') ? 'active' : ''}">
        <a href="/dashboard" aria-expanded="true"><i class="fa fa-home"></i> Main</a>
    </li>

    <li class="">
        <a href="#followers" aria-expanded="false"><i class="fa fa-bar-chart"></i> 분석</a>
    </li>

    <li class="">
        <a href="#following" aria-expanded="false"><i class="fa fa-line-chart"></i> 현황분석</a>
    </li>

    <li class="${fn:startsWith(url, '/member/') ? 'active' : ''}">
        <a href="/member/member/list" aria-expanded="false"><i class="fa fa-user"></i> 회원관리</a>
    </li>

    <li class="${fn:startsWith(url, '/broadcast/') ? 'active' : ''}">
        <a href="/broadcast/broadcast/list" aria-expanded="false"><i class="fa fa-microphone"></i>방송관리</a>
    </li>

    <li class="${fn:startsWith(url, '/manage/') ? 'active' : ''}">
        <a href="/manage/recommend/list" aria-expanded="false"><i class="fa fa-desktop"></i> 사이트관리</a>
    </li>

    <li class="">
        <a href="#following" aria-expanded="false"><i class="fa fa-phone"></i> 고객센터관리</a>
    </li>

    <li class="">
        <a href="#following" aria-expanded="false"><i class="fa fa-key"></i> 권한관리</a>
    </li>

    <li class="">
        <a href="#following" aria-expanded="false"><i class="fa fa-bullhorn"></i> 광고관리</a>
    </li>
</ul>