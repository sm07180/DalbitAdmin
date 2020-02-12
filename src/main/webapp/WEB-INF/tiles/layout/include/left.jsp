<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="url" value="${requestScope['javax.servlet.forward.request_uri']}" />

<!-- left sidebar -->
<div id="left-sidebar" class="left-sidebar ">
    <!-- main-nav -->
    <div class="sidebar-scroll">
        <nav class="main-nav">
            <ul class="main-menu">

                <c:if test="${fn:startsWith(url, '/member/')}">
                    <li class="active"><a href="#" class="js-sub-menu-toggle"><i class="fa fa-navicon"></i><span class="text">회원정보</span>
                        <i class="toggle-icon fa fa-angle-down"></i></a>
                        <ul class="sub-menu open">
                            <li class="active"><a href="/member/member/list"><i class="fa fa-search"></i><span class="text">회원검색</span></a></li>
                        </ul>
                    </li>
                    <li class="active"><a href="#" class="js-sub-menu-toggle"><i class="fa fa-navicon"></i><span class="text">방송/청취기록</span>
                        <i class="toggle-icon fa fa-angle-down"></i></a>
                        <ul class="sub-menu open">
                            <li><a href="/member/broadcast/list"><i class="fa fa-microphone"></i><span class="text">방송기록</span></a></li>
                            <li><a href="/member/listen/list"><i class="fa fa-headphones"></i><span class="text">청취기록</span></a></li>
                        </ul>
                    </li>
                    <li class="active"><a href="#" class="js-sub-menu-toggle"><i class="fa fa-navicon"></i><span class="text">개인결제</span>
                        <i class="toggle-icon fa fa-angle-down"></i></a>
                        <ul class="sub-menu open">
                            <li><a href="/member/pay/list"><i class="fa fa-cc-visa"></i><span class="text">결제/환불내역</span></a></li>
                            <li><a href="/member/gift/list"><i class="fa fa-gift"></i><span class="text">선물내역</span></a></li>
                            <li><a href="/member/exchange/list"><i class="fa fa-krw"></i><span class="text">환전내역</span></a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="/member/myStar/list"><i class="fa fa-star"></i><span class="text">MyStar</span></a>
                    </li>
                    <li>
                        <a href="/member/fan/list"><i class="fa fa-moon-o"></i><span class="text">Fan</span></a>
                    </li>
                    <li>
                        <a href="/member/notice/list"><i class="fa fa-bullhorn"></i><span class="text">개별/방송 중 공지</span></a>
                    </li>
                    <li>
                        <a href="/member/receipt/list"><i class="fa fa-comments-o"></i><span class="text">신고/1:1문의</span></a>
                    </li>
                    <li>
                        <a href="/member/connect/list"><i class="fa fa-sign-in"></i><span class="text">회원접속 기록</span></a>
                    </li>
                </c:if>

                <c:if test="${fn:startsWith(url, '/broadcast/')}">
                    <li class="active"><a href="#" class="js-sub-menu-toggle"><i class="fa fa-navicon"></i><span class="text">방송정보</span>
                        <i class="toggle-icon fa fa-angle-down"></i></a>
                        <ul class="sub-menu open">
                            <li class="active"><a href="/broadcast/broadcast/list"><i class="fa fa-search"></i><span class="text">방송검색</span></a></li>
                        </ul>
                    </li>

                    <li>
                        <a href="/broadcast/member/list"><i class="fa fa-users"></i><span class="text">청취자/매니저/강퇴자 관리</span></a>
                    </li>
                    <li>
                        <a href="/broadcast/fan/list"><i class="fa fa-briefcase"></i><span class="text">팬랭킹관리</span></a>
                    </li>
                    <li>
                        <a href="/broadcast/story/list"><i class="fa fa-envelope-o"></i><span class="text">사연내역</span></a>
                    </li>
                    <li>
                        <a href="/broadcast/chat/list"><i class="fa fa-comment-o"></i><span class="text">채팅내역</span></a>
                    </li>
                    <li>
                        <a href="/broadcast/like/list"><i class="fa fa-thumbs-o-up"></i><span class="text">받은 좋아요</span></a>
                    </li>
                    <li>
                        <a href="/broadcast/ban/list"><i class="fa fa-ban"></i><span class="text">금지어등록정보</span></a>
                    </li>
                    <li>
                        <a href="/broadcast/connect/list"><i class="fa fa-plug"></i><span class="text">방송 접속 환경</span></a>
                    </li>
                </c:if>

                <c:if test="${fn:startsWith(url, '/administrate/')}">
                    <li class="active">
                        <a href="/administrate/recommend/list"><i class="fa fa-user"></i><span class="text">추천 DJ/인기DJ</span></a>
                    </li>

                    <li>
                        <a href="/administrate/star/list"><i class="fa fa-list-ol"></i><span class="text">DJ랭킹/Fan랭킹</span></a>
                    </li>

                    <li class="active"><a href="#" class="js-sub-menu-toggle"><i class="fa fa-microphone"></i><span class="text">실시간 Live</span>
                        <i class="toggle-icon fa fa-angle-down"></i></a>
                        <ul class="sub-menu open">
                            <li><a href="/administrate/live/recommend/list"><i class="fa fa-star"></i><span class="text">추천DJ</span></a></li>
                        </ul>
                        <ul class="sub-menu open">
                            <li><a href="/administrate/live/pop/list"><i class="fa fa-fire"></i><span class="text">인기DJ</span></a></li>
                        </ul>
                        <ul class="sub-menu open">
                            <li><a href="/administrate/live/new/list"><i class="fa fa-plus-square-o"></i><span class="text">신입DJ</span></a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="/administrate/cast/list"><i class="fa fa-fire"></i><span class="text">인기캐스트</span></a>
                    </li>
                    <li>
                        <a href="/administrate/banner/list"><i class="fa fa-flag"></i><span class="text">이벤트/배너</span></a>
                    </li>
                    <li>
                        <a href="/administrate/broadcast/list"><i class="fa fa-picture-o"></i><span class="text">프로필/방송방 배경</span></a>
                    </li>
                    <li>
                        <a href="/administrate/broadcast/list"><i class="fa fa-comment-o"></i><span class="text">시스템 메시지</span></a>
                    </li>
                    <li>
                        <a href="page-projects.html"><i class="fa fa-comment"></i><span class="text">스플래시 메시지</span></a>
                    </li>
                    <li>
                        <a href="page-projects.html"><i class="fa fa-ban"></i><span class="text">사이트 금지어 관리</span></a>
                    </li>
                    <li>
                        <a href="page-projects.html"><i class="fa fa-headphones"></i><span class="text">방송주제 관리</span></a>
                    </li>
                    <li>
                        <a href="page-projects.html"><i class="fa fa-maxcdn"></i><span class="text">미션</span></a>
                    </li>
                </c:if>

                <c:if test="${fn:startsWith(url, '/customer/')}">
                    <li>
                        <a href="page-projects.html"><i class="fa fa-bell-o"></i><span class="text">사이트 공지</span></a>
                    </li>

                    <li>
                        <a href="page-projects.html"><i class="fa fa-krw"></i><span class="text">결제 환불/환전 처리</span></a>
                    </li>

                    <li>
                        <a href="page-projects.html"><i class="fa fa-dot-circle-o"></i><span class="text">신고</span></a>
                    </li>

                    <li>
                        <a href="page-projects.html"><i class="fa fa-phone"></i><span class="text">1:1문의/전화문의</span></a>
                    </li>

                    <li>
                        <a href="page-projects.html"><i class="fa fa-envelope-o"></i><span class="text">제휴 메일</span></a>
                    </li>

                    <li>
                        <a href="page-projects.html"><i class="fa fa-question"></i><span class="text">FAQ</span></a>
                    </li>
                </c:if>
            </ul>
        </nav>
        <!-- /main-nav -->
    </div>
</div>
<!-- end left sidebar -->