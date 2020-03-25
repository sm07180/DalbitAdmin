<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="url" value="${requestScope['javax.servlet.forward.request_uri']}" />
<c:set var="param" value="${requestScope['javax.servlet.forward.query_string']}" />
<c:set var="param_menu" value="${param.menu}" />

<%--${session.setAttribute("InforexMenuInfo", InforexMenuInfo)}--%>

<!-- left sidebar -->
<div id="left-sidebar" class="left-sidebar ">
    <!-- main-nav -->
    <div class="sidebar-scroll" style="overflow:auto; height: 100%">
        <nav class="main-nav">
            <ul class="main-menu">
                <li class="page ${url.equals('/main') ? 'active': ''}">
                    <a href="/main">
                        <i class="fa fa-home"></i><span class="text">메인</span>
                    </a>
                </li>

                <c:forEach var="menu" items='${sessionScope.InforexMenuInfo}'>
                    <c:if test="${menu.depth eq 1}">
                        <li>
                            <a href="javascript://" class="js-sub-menu-toggle">
                                <span class="text">${menu.name}</span>
                                <i class="toggle-icon fa fa-angle-left"></i>
                            </a>
                            <c:forEach var="menu2" items='${sessionScope.InforexMenuInfo}'>
                                <c:if test="${menu2.depth eq 2 && menu.id eq menu2.id}">
                                    <ul class="sub-menu">
                                        <li>
                                            <a href="${menu2.url}" target="_blank" class="_inforex">
                                                <span class="text">${menu2.name}</span>
                                            </a>
                                        </li>
                                    </ul>
                                </c:if>
                            </c:forEach>
                        </li>
                    </c:if>
                </c:forEach>

                <li class="${fn:startsWith(url, '/미정/') ? 'active': ''}">
                    <a href="javascript://" class="js-sub-menu-toggle">
                        <i class="fa fa-user"></i><span class="text">접속현황</span>
                        <i class="toggle-icon fa fa-angle-${fn:startsWith(url, '/미정/') ? 'down': 'left'}"></i>
                    </a>
                    <ul class="sub-menu" style="${fn:startsWith(url, '/미정/') ? 'display:block;': ''}">
                        <li>
                            <a href="javascript://" class="_commingSoon">
                                <i class="fa fa-search"></i><span class="text">로그인 현황</span>
                            </a>
                        </li>
                        <li>
                            <a href="javascript://" class="_commingSoon">
                                <i class="fa fa-search"></i><span class="text">현재 접속자</span>
                            </a>
                        </li>
                        <li>
                            <a href="javascript://" class="_commingSoon">
                                <i class="fa fa-search"></i><span class="text">접속현황</span>
                            </a>
                        </li>
                    </ul>
                </li>

                <li class="${fn:startsWith(url, '/미정/') ? 'active': ''}">
                    <a href="javascript://" class="js-sub-menu-toggle">
                        <i class="fa fa-user"></i><span class="text">가입/결제현황</span>
                        <i class="toggle-icon fa fa-angle-${fn:startsWith(url, '/미정/') ? 'down': 'left'}"></i>
                    </a>
                    <ul class="sub-menu" style="${fn:startsWith(url, '/미정/') ? 'display:block;': ''}">
                        <li>
                            <a href="javascript://" class="_commingSoon">
                                <i class="fa fa-search"></i><span class="text">회원가입</span>
                            </a>
                        </li>
                        <li>
                            <a href="javascript://" class="_commingSoon">
                                <i class="fa fa-search"></i><span class="text">결제/환불</span>
                            </a>
                        </li>
                        <li>
                            <a href="javascript://" class="_commingSoon">
                                <i class="fa fa-search"></i><span class="text">환전</span>
                            </a>
                        </li>
                    </ul>
                </li>


                <li class="${fn:contains(url, '/미정/') ? 'active': ''}">
                    <a href="javascript://" class="js-sub-menu-toggle">
                        <i class="fa fa-line-chart"></i><span class="text">현황분석</span>
                        <i class="toggle-icon fa fa-angle-left"></i>
                    </a>
                    <ul class="sub-menu">
                        <li>
                            <a href="javascript://" class="_commingSoon">
                                <i class="fa fa-caret-square-o-down"></i><span class="text">방송</span>
                            </a>
                        </li>
                        <li>
                            <a href="javascript://" class="_commingSoon">
                                <i class="fa fa-cloud-download"></i></i><span class="text">캐스트</span>
                            </a>
                        </li>
                        <li>
                            <a href="javascript://" class="_commingSoon">
                                <i class="fa fa-user"></i><span class="text">결제/환전</span>
                            </a>
                        </li>
                        <li>
                            <a href="javascript://" class="_commingSoon">
                                <i class="fa fa-microphone"></i><span class="text">결제취소/환불</span>
                            </a>
                        </li>
                        <li>
                            <a href="javascript://" class="_commingSoon">
                                <i class="fa fa-headphones"></i><span class="text">아이템</span>
                            </a>
                        </li>
                        <li>
                            <a href="javascript://" class="_commingSoon">
                                <i class="fa fa-krw"></i><span class="text">1:1 문의</span>
                            </a>
                        </li>
                        <li>
                            <a href="javascript://" class="_commingSoon">
                                <i class="fa fa-times"></i><span class="text">시스템장애</span>
                            </a>
                        </li>
                        <li>
                            <a href="javascript://" class="_commingSoon">
                                <i class="fa fa-suitcase"></i><span class="text">이벤트</span>
                            </a>
                        </li>
                    </ul>
                </li>

                <li class="${fn:startsWith(url, '/broadcast/') ? 'active': ''}">
                    <a href="javascript://" class="js-sub-menu-toggle">
                        <i class="fa fa-microphone"></i><span class="text">생방송관리</span>
                        <i class="toggle-icon fa fa-angle-${fn:startsWith(url, '/broadcast/') ? 'down': 'left'}"></i>
                    </a>
                    <ul class="sub-menu" style="${fn:startsWith(url, '/broadcast/') ? 'display:block;': ''}">
                        <li class="${fn:contains(url, '/broadcast/live/list') ? 'active': ''}">
                            <a href="/broadcast/live/list">
                                <i class="fa fa-microphone"></i><span class="text">실시간 최신 생방송</span>
                            </a>
                        </li>
                        <li class="${fn:contains(url, '/broadcast/broadcast/list') ? 'active': ''}">
                            <a href="/broadcast/broadcast/list">
                                <i class="fa fa-search"></i><span class="text">생방송 검색</span>
                            </a>
                        </li>
                    </ul>
                </li>

                <li class="${fn:startsWith(url, '/cast/') ? 'active': ''}">
                    <a href="javascript://" class="js-sub-menu-toggle">
                        <i class="fa fa-headphones"></i><span class="text">캐스트관리</span>
                        <i class="toggle-icon fa fa-angle-${fn:startsWith(url, '/cast/') ? 'down': 'left'}"></i>
                    </a>
                    <ul class="sub-menu" style="${fn:startsWith(url, '/cast/') ? 'display:block;': ''}">
                        <li>
                            <a href="javascript://" class="_commingSoon">
                                <i class="fa fa-search"></i><span class="text">캐스트 검색</span>
                            </a>
                        </li>
                    </ul>
                </li>

                <li class="${fn:startsWith(url, '/member/') ? 'active': ''}">
                    <a href="javascript://" class="js-sub-menu-toggle">
                        <i class="fa fa-user"></i><span class="text">회원검색</span>
                        <i class="toggle-icon fa fa-angle-${fn:startsWith(url, '/member/') ? 'down': 'left'}"></i>
                    </a>
                    <ul class="sub-menu" style="${fn:startsWith(url, '/member/') ? 'display:block;': ''}">
                        <li class="${fn:contains(url, '/member/member/list') ? 'active': ''}">
                            <a href="/member/member/list">
                                <i class="fa fa-search"></i><span class="text">회원검색</span>
                            </a>
                        </li>
                    </ul>
                </li>

                <li class="${fn:startsWith(url, '/customer/') ? 'active': ''}">
                    <a href="javascript://" class="js-sub-menu-toggle">
                        <i class="fa fa-question"></i><span class="text">고객센터관리</span>
                        <i class="toggle-icon fa fa-angle-${fn:startsWith(url, '/customer/') ? 'down': 'left'}"></i>
                    </a>
                    <ul class="sub-menu" style="${fn:startsWith(url, '/customer/') ? 'display:block;': ''}">
                        <li class="${fn:contains(url, '/customer/declaration/list') ? 'active': ''}">
                            <a href="/customer/declaration/list">
                                <i class="fa fa-dot-circle-o"></i><span class="text">신고센터</span>
                            </a>
                        </li>
                        <li class="${fn:contains(url, '/customer/question/list') ? 'active': ''}">
                            <a href="/customer/question/list">
                                <i class="fa fa-search"></i><span class="text">1:1문의</span>
                            </a>
                        </li>
                        <li class="${fn:contains(url, '/customer/email/list') ? 'active': ''}">
                            <a href="/customer/email/list">
                                <i class="fa fa-envelope-o"></i><span class="text">기타문의(전화/이메일)</span>
                            </a>
                        </li>
                        <li class="${fn:contains(url, '/customer/paycancel/list') ? 'active': ''}">
                            <%--<a href="/customer/paycancel/list">--%>
                            <a href="javascript://" class="_commingSoon">
                                <i class="fa fa-krw"></i><span class="text">결제취소</span>
                            </a>
                        </li>
                        <li class="${fn:contains(url, '/customer/exchange/list') ? 'active': ''}">
                            <%--<a href="/customer/exchange/list">--%>
                            <a href="javascript://" class="_commingSoon">
                                <i class="fa fa-krw"></i><span class="text">환불신청</span>
                            </a>
                        </li>

                        <li class="${fn:contains(url, '/customer/exchange/list') ? 'active': ''}">
                            <a href="javascript://" class="_commingSoon">
                                <i class="fa fa-krw"></i><span class="text">문자 발송내역</span>
                            </a>
                        </li>

                        <li class="${fn:contains(url, '/customer/exchange/list') ? 'active': ''}">
                            <a href="javascript://" class="_commingSoon">
                                <i class="fa fa-krw"></i><span class="text">프로필/방송방 배경</span>
                            </a>
                        </li>
                    </ul>
                </li>

                <li class="${fn:startsWith(url, '/exchange/') ? 'active': ''}">
                    <a href="javascript://" class="js-sub-menu-toggle">
                        <i class="fa fa-krw"></i><span class="text">환전관리</span>
                        <i class="toggle-icon fa fa-angle-${fn:startsWith(url, '/exchange/') ? 'down': 'left'}"></i>
                    </a>
                    <ul class="sub-menu" style="${fn:startsWith(url, '/exchange/') ? 'display:block;': ''}">
                        <li class="${fn:contains(url, '/exchange/exchange/list') ? 'active': ''}">
                            <%--<a href="/exchange/exchange/list">--%>
                            <a href="javascript://" class="_commingSoon">
                                <i class="fa fa-krw"></i><span class="text">미처리</span>
                            </a>
                        </li>
                        <li class="${fn:contains(url, '/exchange/history/list') ? 'active': ''}">
                            <%--<a href="/exchange/history/list">--%>
                            <a href="javascript://" class="_commingSoon">
                                <i class="fa fa-search"></i><span class="text">환전완료</span>
                            </a>
                        </li>
                    </ul>
                </li>

                <li class="${fn:startsWith(url, '/menu/') ? 'active': ''}">
                    <a href="javascript://" class="js-sub-menu-toggle">
                        <i class="fa fa-th-list"></i><span class="text">메뉴별현황</span>
                        <i class="toggle-icon fa fa-angle-${fn:startsWith(url, '/menu/') ? 'down': 'left'}"></i>
                    </a>
                    <ul class="sub-menu" style="${fn:startsWith(url, '/menu/') ? 'display:block;': ''}">
                        <li class="${fn:contains(url, '/menu/special/list') ? 'active': ''}">
                            <%--<a href="/menu/special/list">--%>
                            <a href="javascript://" class="_commingSoon">
                                <i class="fa fa-thumbs-o-up"></i><span class="text">스페셜 DJ</span>
                            </a>
                        </li>
                        <li class="${fn:contains(url, '/menu/rank/djRankList') ? 'active': ''}">
                            <%--<a href="/menu/rank/djRankList">--%>
                            <a href="javascript://" class="_commingSoon">
                                <i class="fa fa-list-alt"></i><span class="text">DJ랭킹/팬랭킹</span>
                            </a>
                        </li>
                        <li class="${fn:contains(url, '/menu/live/list') ? 'active': ''}">
                            <%--<a href="/menu/live/list">--%>
                            <a href="javascript://" class="_commingSoon">
                                <i class="fa fa-microphone"></i><span class="text">실시간 Live</span>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="${fn:startsWith(url, '/content/') ? 'active': ''}">
                    <a href="javascript://" class="js-sub-menu-toggle">
                        <i class="fa fa-dot-circle-o"></i><span class="text">컨텐츠운영</span>
                        <i class="toggle-icon fa fa-angle-${fn:startsWith(url, '/content/') ? 'down': 'left'}"></i>
                    </a>
                    <ul class="sub-menu" style="${fn:startsWith(url, '/content/') ? 'display:block;': ''}">
                        <li>
                            <a href="javascript://" class="_commingSoon">
                                <i class="fa fa-moon-o"></i><span class="text">아이템관리</span>
                            </a>
                        </li>
                        <li>
                            <%--<a href="/content/event/list">--%>
                            <a href="javascript://" class="_commingSoon">
                                <i class="fa fa-gift"></i><span class="text">이벤트관리</span>
                            </a>
                        </li>
                        <li>
                            <%--<a href="/content/banner/list">--%>
                            <a href="javascript://" class="_commingSoon">
                                <i class="fa fa-server"></i><span class="text">배너관리</span>
                            </a>
                        </li>
                        <li>
                            <a href="/content/notice/list">
                                <i class="fa fa-bullhorn"></i><span class="text">사이트공지</span>
                            </a>
                        </li>
                        <li>
                            <%--<a href="/content/push/list">--%>
                            <a href="javascript://" class="_commingSoon">
                                <i class="fa fa-envelope-o"></i><span class="text">푸시 메시지</span>
                            </a>
                        </li>
                        <li>
                            <a href="javascript://" class="_commingSoon">
                                <i class="fa fa-envelope-o"></i><span class="text">스플래시 메시지</span>
                            </a>
                        </li>
                        <li>
                            <a href="javascript://" class="_commingSoon">
                                <i class="fa fa-ban"></i><span class="text">사이트 금지어</span>
                            </a>
                        </li>
                        <li>
                            <a href="javascript://" class="_commingSoon">
                                <i class="fa fa-search"></i><span class="text">방송주제</span>
                            </a>
                        </li>
                    </ul>
                </li>

                <li class="${fn:startsWith(url, '/administrate/') ? 'active': ''}">
                    <a href="javascript://" class="js-sub-menu-toggle">
                        <i class="fa fa-wrench"></i><span class="text">어드민관리</span>
                        <i class="toggle-icon fa fa-angle-${fn:startsWith(url, '/administrate/') ? 'down': 'left'}"></i>
                    </a>
                    <ul class="sub-menu" style="${fn:startsWith(url, '/administrate/') ? 'display:block;': ''}">
                        <li>
                            <a href="javascript://" class="_commingSoon">
                                <i class="fa fa-list"></i><span class="text">어드민 카테고리</span>
                            </a>
                        </li>
                        <li>
                            <a href="javascript://" class="_commingSoon">
                                <i class="fa fa-shield"></i><span class="text">권한관리</span>
                            </a>
                        </li>
                        <li>
                            <a href="javascript://" class="_commingSoon">
                                <i class="fa fa-pencil-square-o"></i><span class="text">정보수정내역</span>
                            </a>
                        </li>
                        <li>
                            <a href="javascript://" class="_commingSoon">
                                <i class="fa fa-search"></i><span class="text">테스트아이디</span>
                            </a>
                        </li>
                        <li>
                            <a href="javascript://" class="_commingSoon">
                                <i class="fa fa-map-marker"></i><span class="text">방송가이드관리</span>
                            </a>
                        </li>
                        <li>
                            <a href="/administrate/faq/list">
                                <i class="fa fa-question-circle"></i><span class="text">FAQ</span>
                            </a>
                        </li>
                        <li>
                            <a href="javascript://" class="_commingSoon">
                                <i class="fa fa-info"></i><span class="text">서비스약관</span>
                            </a>
                        </li>
                    </ul>
                </li>

                <li class="${fn:startsWith(url, '/sample/') ? 'active': ''}">
                    <a href="javascript://" class="js-sub-menu-toggle">
                        <i class="fa fa-question"></i><span class="text">샘플페이지</span>
                        <i class="toggle-icon fa fa-angle-${fn:startsWith(url, '/sample/') ? 'down': 'left'}"></i>
                    </a>
                    <ul class="sub-menu" style="${fn:startsWith(url, '/sample/') ? 'display:block;': ''}">
                        <li class="${fn:contains(url, '/sample/editor') ? 'active': ''}">
                            <a href="/sample/editor">
                                <i class="fa fa-search"></i><span class="text">에디터</span>
                            </a>
                        </li>
                        <li class="${fn:contains(url, '/sample/chart') ? 'active': ''}">
                            <a href="/sample/chart">
                                <i class="fa fa-search"></i><span class="text">차트</span>
                            </a>
                        </li>
                        <li class="${fn:contains(url, '/sample/datepicker') ? 'active': ''}">
                            <a href="/sample/datepicker">
                                <i class="fa fa-search"></i><span class="text">DatePicker</span>
                            </a>
                        </li>
                        <li class="${fn:contains(url, '/sample/layer') ? 'active': ''}">
                            <a href="/sample/layer">
                                <i class="fa fa-search"></i><span class="text">레이어</span>
                            </a>
                        </li>
                        <li class="${fn:contains(url, '/sample/function') ? 'active': ''}">
                            <a href="/sample/function">
                                <i class="fa fa-search"></i><span class="text">공통함수</span>
                            </a>
                        </li>
                        <li class="${url.equals('/sample/adminlogin') ? 'active': ''}">
                            <a href="/sample/adminlogin">
                                <i class="fa fa-search"></i><span class="text">관리자로그인</span>
                            </a>
                        </li>
                        <li class="${url.equals('/sample/adminlogin2') ? 'active': ''}">
                            <a href="/sample/adminlogin2">
                                <i class="fa fa-search"></i><span class="text">Inforex메뉴불러오기</span>
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
        </nav>
        <!-- /main-nav -->
    </div>
</div>
<!-- end left sidebar -->

<script type="text/javascript">
    $('._commingSoon').on('click', function(){
       alert('준비중입니다.');
    });

    $('._commingSoon').find('span').css({
        'color' : 'gray',
        'font-weight' : 'bold'
    }).append(' - 준비중');

    $('._inforex').find('span').css({
        'color' : 'gray',
        /*'font-weight' : 'bold'*/
    }).append(' - 새창열기');
</script>