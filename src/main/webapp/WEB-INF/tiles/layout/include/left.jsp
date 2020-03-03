<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="url" value="${requestScope['javax.servlet.forward.request_uri']}" />
<c:set var="param" value="${requestScope['javax.servlet.forward.query_string']}" />
<c:set var="param_menu" value="${param.menu}" />

<!-- left sidebar -->
<div id="left-sidebar" class="left-sidebar ">
    <!-- main-nav -->
    <div class="sidebar-scroll">
        <nav class="main-nav">
            <ul class="main-menu">

                <!--
                <c:if test="${fn:startsWith(url, '/member/')}">
                    <li class="${fn:contains(url, '/member/main') ? 'active': ''}">
                        <a href="#" class="js-sub-menu-toggle">
                            <i class="fa fa-navicon"></i><span class="text">회원정보</span>
                            <i class="toggle-icon fa fa-angle-down"></i>
                        </a>
                        <ul class="sub-menu open">
                            <li class="${fn:contains(url, '/member/member/list') ? 'active': ''}">
                                <a href="/member/member/list"><i class="fa fa-search">
                                    </i><span class="text">회원검색</span>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="${fn:contains(url, '/member/broadcast/list') || fn:contains(url, '/member/listen/list') ? 'active': ''}">
                        <a href="#" class="js-sub-menu-toggle">
                            <i class="fa fa-navicon"></i><span class="text">방송/청취기록</span>
                            <i class="toggle-icon fa fa-angle-down"></i>
                        </a>
                        <ul class="sub-menu open">
                            <li class="${fn:contains(url, '/member/broadcast/list') ? 'active': ''}">
                                <a href="/member/broadcast/list">
                                    <i class="fa fa-microphone"></i><span class="text">방송기록</span>
                                </a>
                            </li>
                            <li class="${fn:contains(url, '/member/listen/list') ? 'active': ''}">
                                <a href="/member/listen/list">
                                    <i class="fa fa-headphones"></i><span class="text">청취기록</span>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="${fn:contains(url, '/member/pay/list') || fn:contains(url, '/member/gift/list') || fn:contains(url, '/member/exchange/list') ? 'active': ''}">
                        <a href="#" class="js-sub-menu-toggle">
                            <i class="fa fa-navicon"></i><span class="text">개인결제</span>
                            <i class="toggle-icon fa fa-angle-down"></i>
                        </a>
                        <ul class="sub-menu open">
                            <li class="${fn:contains(url, '/member/pay/list') ? 'active': ''}">
                                <a href="/member/pay/list">
                                    <i class="fa fa-cc-visa"></i><span class="text">결제/환불내역</span>
                                </a>
                            </li>
                            <li class="${fn:contains(url, '/member/gift/list') ? 'active': ''}">
                                <a href="/member/gift/list">
                                    <i class="fa fa-gift"></i><span class="text">선물내역</span>
                                </a>
                            </li>
                            <li class="${fn:contains(url, '/member/exchange/list') ? 'active': ''}">
                                <a href="/member/exchange/list">
                                    <i class="fa fa-krw"></i><span class="text">환전내역</span>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="${fn:contains(url, '/member/myStar/list') ? 'active': ''}">
                        <a href="/member/myStar/list">
                            <i class="fa fa-star"></i><span class="text">MyStar</span>
                        </a>
                    </li>
                    <li class="${fn:contains(url, '/member/fan/list') ? 'active': ''}">
                        <a href="/member/fan/list"><i class="fa fa-moon-o"></i><span class="text">Fan</span></a>
                    </li>
                    <li class="${fn:contains(url, '/member/notice/list') ? 'active': ''}">
                        <a href="/member/notice/list"><i class="fa fa-bullhorn"></i><span class="text">개별/방송 중 공지</span></a>
                    </li>
                    <li class="${fn:contains(url, '/member/receipt/list') ? 'active': ''}">
                        <a href="/member/receipt/list"><i class="fa fa-comments-o"></i><span class="text">신고/1:1문의</span></a>
                    </li>
                    <li class="${fn:contains(url, '/member/connect/list') ? 'active': ''}">
                        <a href="/member/connect/list"><i class="fa fa-sign-in"></i><span class="text">회원접속 기록</span></a>
                    </li>
                </c:if>

                <c:if test="${fn:startsWith(url, '/broadcast/')}">
                    <li class="${fn:contains(url, '/broadcast/broadcast/list') ? 'active': ''}">
                        <a href="#" class="js-sub-menu-toggle">
                            <i class="fa fa-navicon"></i><span class="text">방송정보</span>
                            <i class="toggle-icon fa fa-angle-down"></i>
                        </a>
                        <ul class="sub-menu open">
                            <li class="active"><a href="/broadcast/broadcast/list"><i class="fa fa-search"></i><span class="text">방송검색</span></a></li>
                        </ul>
                    </li>

                    <li class="${fn:contains(url, '/broadcast/member/list') ? 'active': ''}">
                        <a href="/broadcast/member/list"><i class="fa fa-users"></i><span class="text">청취자/매니저/강퇴자 관리</span></a>
                    </li>
                    <li class="${fn:contains(url, '/broadcast/fan/list') ? 'active': ''}">
                        <a href="/broadcast/fan/list"><i class="fa fa-list-ol"></i><span class="text">팬랭킹관리</span></a>
                    </li>
                    <li class="${fn:contains(url, '/broadcast/story/list') ? 'active': ''}">
                        <a href="/broadcast/story/list"><i class="fa fa-envelope-o"></i><span class="text">사연내역</span></a>
                    </li>
                    <li class="${fn:contains(url, '/broadcast/chat/list') ? 'active': ''}">
                        <a href="/broadcast/chat/list"><i class="fa fa-comment-o"></i><span class="text">채팅내역</span></a>
                    </li>
                    <li class="${fn:contains(url, '/broadcast/like/list') ? 'active': ''}">
                        <a href="/broadcast/like/list"><i class="fa fa-thumbs-o-up"></i><span class="text">받은 좋아요</span></a>
                    </li>
                    <li class="${fn:contains(url, '/broadcast/ban/list') ? 'active': ''}">
                        <a href="/broadcast/ban/list"><i class="fa fa-ban"></i><span class="text">금지어등록정보</span></a>
                    </li>
                    <li class="${fn:contains(url, '/broadcast/connect/list') ? 'active': ''}">
                        <a href="/broadcast/connect/list"><i class="fa fa-plug"></i><span class="text">방송 접속 환경</span></a>
                    </li>
                </c:if>

                <c:if test="${fn:startsWith(url, '/administrate/')}">
                    <li class="${fn:contains(url, '/administrate/recommend/list') ? 'active': ''}">
                        <a href="/administrate/recommend/list"><i class="fa fa-user"></i><span class="text">추천 DJ/인기DJ</span></a>
                    </li>

                    <li class="${fn:contains(url, '/administrate/star/list') ? 'active': ''}">
                        <a href="/administrate/star/list"><i class="fa fa-list-ol"></i><span class="text">DJ랭킹/Fan랭킹</span></a>
                    </li>

                    <li class="${fn:contains(url, '/administrate/liveRecommend/list') || fn:contains(url, '/administrate/livePop/list') || fn:contains(url, '/administrate/liveNew/list') ? 'active': ''}">
                        <a href="#" class="js-sub-menu-toggle">
                            <i class="fa fa-microphone"></i><span class="text">실시간 Live</span>
                            <i class="toggle-icon fa fa-angle-down"></i>
                        </a>
                        <ul class="sub-menu open">
                            <li class="${fn:contains(url, '/administrate/liveRecommend/list') ? 'active': ''}">
                                <a href="/administrate/liveRecommend/list">
                                    <i class="fa fa-star"></i><span class="text">추천DJ</span>
                                </a>
                            </li>
                        </ul>
                        <ul class="sub-menu open">
                            <li class="${fn:contains(url, '/administrate/livePop/list') ? 'active': ''}">
                                <a href="/administrate/livePop/list">
                                    <i class="fa fa-fire"></i><span class="text">인기DJ</span>
                                </a>
                            </li>
                        </ul>
                        <ul class="sub-menu open">
                            <li class="${fn:contains(url, '/administrate/liveNew/list') ? 'active': ''}">
                                <a href="/administrate/liveNew/list">
                                    <i class="fa fa-plus-square-o"></i><span class="text">신입DJ</span>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="${fn:contains(url, '/administrate/cast/list') ? 'active': ''}">
                        <a href="/administrate/cast/list">
                            <i class="fa fa-fire"></i><span class="text">인기캐스트</span>
                        </a>
                    </li>
                    <li class="${fn:contains(url, '/administrate/banner/list') ? 'active': ''}">
                        <a href="/administrate/banner/list">
                            <i class="fa fa-flag"></i><span class="text">이벤트/배너</span>
                        </a>
                    </li>
                    <li class="${fn:contains(url, '/administrate/profile/list') || fn:contains(url, '/administrate/broadcast/list')? 'active': ''}">
                        <a href="#" class="js-sub-menu-toggle">
                            <i class="fa fa-picture-o"></i><span class="text">프로필/방송방 배경</span>
                        </a>
                        <ul class="sub-menu open">
                            <li class="${fn:contains(url, '/administrate/profile/list') ? 'active': ''}">
                                <a href="/administrate/profile/list">
                                    <i class="fa fa-picture-o"></i><span class="text">프로필</span>
                                </a>
                            </li>
                        </ul>
                        <ul class="sub-menu open">
                            <li class="${fn:contains(url, '/administrate/broadcast/list') ? 'active': ''}">
                                <a href="/administrate/broadcast/list">
                                    <i class="fa fa-picture-o"></i><span class="text">방송방</span>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="${fn:contains(url, '/administrate/message/list') ? 'active': ''}">
                        <a href="/administrate/message/list"><i class="fa fa-comment-o"></i><span class="text">시스템 메시지</span></a>
                    </li>
                    <li class="${fn:contains(url, '/administrate/splash/list') ? 'active': ''}">
                        <a href="/administrate/message/list"><i class="fa fa-comment"></i><span class="text">스플래시 메시지</span></a>
                    </li>
                    <li class="${fn:contains(url, '/administrate/ban/list') ? 'active': ''}">
                        <a href="/administrate/ban/list"><i class="fa fa-ban"></i><span class="text">사이트 금지어 관리</span></a>
                    </li>
                    <li class="${fn:contains(url, '/administrate/theme/list') ? 'active': ''}">
                        <a href="/administrate/theme/list"><i class="fa fa-headphones"></i><span class="text">방송주제 관리</span></a>
                    </li>
                    <li class="${fn:contains(url, '/administrate/quest/list') ? 'active': ''}">
                        <a href="/administrate/quest/list"><i class="fa fa-maxcdn"></i><span class="text">미션</span></a>
                    </li>
                </c:if>

                <c:if test="${fn:startsWith(url, '/customer/')}">
                    <li class="${fn:contains(url, '/customer/notice/list') ? 'active': ''}">
                        <a href="/customer/notice/list">
                            <i class="fa fa-bell-o"></i><span class="text">사이트 공지</span>
                        </a>
                    </li>

                    <li class="${fn:contains(url, '/customer/pay/list') ? 'active': ''}">
                        <a href="/customer/pay/list">
                            <i class="fa fa-krw"></i><span class="text">결제 환불/환전 처리</span>
                        </a>
                    </li>

                    <li class="${fn:contains(url, '/customer/declaration/list') ? 'active': ''}">
                        <a href="/customer/declaration/list">
                            <i class="fa fa-dot-circle-o"></i><span class="text">신고</span>
                        </a>
                    </li>

                    <li class="${fn:contains(url, '/customer/question/list') ? 'active': ''}">
                        <a href="/customer/question/list">
                            <i class="fa fa-phone"></i><span class="text">1:1문의/전화문의</span>
                        </a>
                    </li>

                    <li class="${fn:contains(url, '/customer/email/list') ? 'active': ''}">
                        <a href="/customer/email/list">
                            <i class="fa fa-envelope-o"></i><span class="text">제휴 메일</span>
                        </a>
                    </li>

                    <li class="${fn:contains(url, '/customer/faq/list') ? 'active': ''}">
                        <a href="/customer/faq/list">
                            <i class="fa fa-question"></i><span class="text">FAQ</span>
                        </a>
                    </li>
                </c:if>
                -->

                <li class="${fn:contains(url, '/customer/faq/list') ? 'active': ''}">
                    <a href="javascript://">
                        <i class="fa fa-question"></i><span class="text">메인</span>
                    </a>
                </li>
                <li class="${fn:contains(url, '/customer/faq/list') ? 'active': ''}">
                    <a href="javascript://" class="js-sub-menu-toggle">
                        <i class="fa fa-question"></i><span class="text">현황분석</span>
                        <i class="toggle-icon fa fa-angle-left"></i>
                    </a>
                    <ul class="sub-menu">
                        <li>
                            <a href="javascript://">
                                <i class="fa fa-search"></i><span class="text">앱다운로드</span>
                            </a>
                        </li>
                        <li>
                            <a href="javascript://">
                                <i class="fa fa-search"></i><span class="text">접속현황</span>
                            </a>
                        </li>
                        <li>
                            <a href="javascript://">
                                <i class="fa fa-search"></i><span class="text">회원현황</span>
                            </a>
                        </li>
                        <li>
                            <a href="javascript://">
                                <i class="fa fa-search"></i><span class="text">방송현황</span>
                            </a>
                        </li>
                        <li>
                            <a href="javascript://">
                                <i class="fa fa-search"></i><span class="text">캐스트현황</span>
                            </a>
                        </li>
                        <li>
                            <a href="javascript://">
                                <i class="fa fa-search"></i><span class="text">결제/환전</span>
                            </a>
                        </li>
                        <li>
                            <a href="javascript://">
                                <i class="fa fa-search"></i><span class="text">결제취소/환전</span>
                            </a>
                        </li>
                        <li>
                            <a href="javascript://">
                                <i class="fa fa-search"></i><span class="text">상품</span>
                            </a>
                        </li>
                        <li>
                            <a href="javascript://">
                                <i class="fa fa-search"></i><span class="text">1:1 문의</span>
                            </a>
                        </li>
                        <li>
                            <a href="javascript://">
                                <i class="fa fa-search"></i><span class="text">장애분석</span>
                            </a>
                        </li>
                        <li>
                            <a href="javascript://">
                                <i class="fa fa-search"></i><span class="text">이벤트</span>
                            </a>
                        </li>
                        <li>
                            <a href="javascript://">
                                <i class="fa fa-search"></i><span class="text">파트너 DJ</span>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="${fn:startsWith(url, '/member/') ? 'active': ''}">
                    <a href="javascript://" class="js-sub-menu-toggle">
                        <i class="fa fa-question"></i><span class="text">회원검색</span>
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
                <li class="${fn:startsWith(url, '/broadcast/') ? 'active': ''}">
                    <a href="javascript://" class="js-sub-menu-toggle">
                        <i class="fa fa-question"></i><span class="text">생방송관리</span>
                        <i class="toggle-icon fa fa-angle-${fn:startsWith(url, '/broadcast/') ? 'down': 'left'}"></i>
                    </a>
                    <ul class="sub-menu" style="${fn:startsWith(url, '/broadcast/') ? 'display:block;': ''}">
                        <li class="${fn:contains(url, '/broadcast/live/list') ? 'active': ''}">
                            <a href="/broadcast/live/list">
                                <i class="fa fa-microphone"></i><span class="text">생방송 리스트</span>
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
                        <i class="fa fa-question"></i><span class="text">캐스트관리</span>
                        <i class="toggle-icon fa fa-angle-${fn:startsWith(url, '/cast/') ? 'down': 'left'}"></i>
                    </a>
                    <ul class="sub-menu" style="${fn:startsWith(url, '/cast/') ? 'display:block;': ''}">
                        <li>
                            <a href="javascript://">
                                <i class="fa fa-search"></i><span class="text">캐스트 검색</span>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="${fn:startsWith(url, '/exchange/') ? 'active': ''}">
                    <a href="javascript://" class="js-sub-menu-toggle">
                        <i class="fa fa-question"></i><span class="text">환전관리</span>
                        <i class="toggle-icon fa fa-angle-${fn:startsWith(url, '/exchange/') ? 'down': 'left'}"></i>
                    </a>
                    <ul class="sub-menu" style="${fn:startsWith(url, '/exchange/') ? 'display:block;': ''}">
                        <li class="${fn:contains(url, '/exchange/exchange/list') ? 'active': ''}">
                            <a href="/exchange/exchange/list">
                                <i class="fa fa-search"></i><span class="text">환전신청/처리</span>
                            </a>
                        </li>
                        <li class="${fn:contains(url, '/exchange/history/list') ? 'active': ''}">
                            <a href="/exchange/history/list">
                                <i class="fa fa-search"></i><span class="text">환전상세정보</span>
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
                            <a href="/customer/paycancel/list">
                                <i class="fa fa-krw"></i><span class="text">결제취소</span>
                            </a>
                        </li>
                        <li class="${fn:contains(url, '/customer/exchange/list') ? 'active': ''}">
                            <a href="/customer/exchange/list">
                                <i class="fa fa-krw"></i><span class="text">환불신청</span>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="${fn:startsWith(url, '/menu/') ? 'active': ''}">
                    <a href="javascript://" class="js-sub-menu-toggle">
                        <i class="fa fa-question"></i><span class="text">메뉴별현황</span>
                        <i class="toggle-icon fa fa-angle-${fn:startsWith(url, '/menu/') ? 'down': 'left'}"></i>
                    </a>
                    <ul class="sub-menu" style="${fn:startsWith(url, '/menu/') ? 'display:block;': ''}">
                        <li class="${fn:contains(url, '/menu/recommend/list') ? 'active': ''}">
                            <a href="/menu/recommend/list">
                                <i class="fa fa-search"></i><span class="text">추천DJ</span>
                            </a>
                        </li>
                        <li class="${fn:contains(url, '/menu/best/list') ? 'active': ''}">
                            <a href="/menu/best/list">
                                <i class="fa fa-search"></i><span class="text">인기DJ</span>
                            </a>
                        </li>
                        <li class="${fn:contains(url, '/menu/rank/djRankList') ? 'active': ''}">
                            <a href="/menu/rank/djRankList">
                                <i class="fa fa-search"></i><span class="text">DJ랭킹/팬랭킹</span>
                            </a>
                        </li>
                        <li>
                            <a href="javascript://">
                                <i class="fa fa-search"></i><span class="text">실시간 Live</span>
                            </a>
                        </li>
                        <li>
                            <a href="javascript://">
                                <i class="fa fa-search"></i><span class="text">캐스트</span>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="${fn:startsWith(url, '/content/') ? 'active': ''}">
                    <a href="javascript://" class="js-sub-menu-toggle">
                        <i class="fa fa-question"></i><span class="text">컨텐츠운영</span>
                        <i class="toggle-icon fa fa-angle-${fn:startsWith(url, '/content/') ? 'down': 'left'}"></i>
                    </a>
                    <ul class="sub-menu" style="${fn:startsWith(url, '/content/') ? 'display:block;': ''}">
                        <li>
                            <a href="javascript://">
                                <i class="fa fa-search"></i><span class="text">파트너 DJ 신청</span>
                            </a>
                        </li>
                        <li>
                            <a href="javascript://">
                                <i class="fa fa-search"></i><span class="text">베스트 파트너 DJ</span>
                            </a>
                        </li>
                        <li>
                            <a href="javascript://">
                                <i class="fa fa-search"></i><span class="text">프로필/방송방 배경</span>
                            </a>
                        </li>
                        <li>
                            <a href="javascript://">
                                <i class="fa fa-search"></i><span class="text">아이템관리</span>
                            </a>
                        </li>
                        <li>
                            <a href="javascript://">
                                <i class="fa fa-search"></i><span class="text">이벤트관리</span>
                            </a>
                        </li>
                        <li>
                            <a href="javascript://">
                                <i class="fa fa-search"></i><span class="text">배너관리</span>
                            </a>
                        </li>
                        <li>
                            <a href="/content/notice/list">
                                <i class="fa fa-search"></i><span class="text">사이트공지</span>
                            </a>
                        </li>
                        <li>
                            <a href="/content/push/list">
                                <i class="fa fa-search"></i><span class="text">푸시 메시지</span>
                            </a>
                        </li>
                        <li>
                            <a href="javascript://">
                                <i class="fa fa-search"></i><span class="text">스플래시 메시지</span>
                            </a>
                        </li>
                        <li>
                            <a href="javascript://">
                                <i class="fa fa-search"></i><span class="text">사이트 금지어</span>
                            </a>
                        </li>
                        <li>
                            <a href="javascript://">
                                <i class="fa fa-search"></i><span class="text">방송주제</span>
                            </a>
                        </li>
                    </ul>
                </li>

                <li class="${fn:startsWith(url, '/administrate/') ? 'active': ''}">
                    <a href="javascript://" class="js-sub-menu-toggle">
                        <i class="fa fa-question"></i><span class="text">어드민관리</span>
                        <i class="toggle-icon fa fa-angle-${fn:startsWith(url, '/administrate/') ? 'down': 'left'}"></i>
                    </a>
                    <ul class="sub-menu" style="${fn:startsWith(url, '/administrate/') ? 'display:block;': ''}">
                        <li>
                            <a href="javascript://">
                                <i class="fa fa-search"></i><span class="text">어드민 카테고리</span>
                            </a>
                        </li>
                        <li>
                            <a href="javascript://">
                                <i class="fa fa-search"></i><span class="text">권한관리</span>
                            </a>
                        </li>
                        <li>
                            <a href="javascript://">
                                <i class="fa fa-search"></i><span class="text">정보수정내역</span>
                            </a>
                        </li>
                        <li>
                            <a href="javascript://">
                                <i class="fa fa-search"></i><span class="text">테스트아이디</span>
                            </a>
                        </li>
                        <li>
                            <a href="javascript://">
                                <i class="fa fa-search"></i><span class="text">방송가이드관리</span>
                            </a>
                        </li>
                        <li>
                            <a href="javascript://">
                                <i class="fa fa-search"></i><span class="text">FAQ</span>
                            </a>
                        </li>
                        <li>
                            <a href="javascript://">
                                <i class="fa fa-search"></i><span class="text">서비스약관</span>
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
                    </ul>
                </li>
            </ul>

            <div class="text-center">통계현황</div>
            <div id="_statisticsArea">
                <div class="rowData row ">
                    <label class="col-md-6 control-label">로그인 수</label>
                    <div class="col-md-6 text-center">3건</div>
                </div>
                <div class="row rowData">
                    <label class="col-md-6 control-label">재가입 횟수</label>
                    <div class="col-md-6 text-center">3건</div>
                </div>
                <div class="row rowData">
                    <label class="col-md-6 control-label">결제 수</label>
                    <div class="col-md-6 text-center">3건</div>
                </div>
                <div class="row rowData">
                    <label class="col-md-6 control-label">선물 수</label>
                    <div class="col-md-6 text-center">3건</div>
                </div>
                <div class="row rowData">
                    <label class="col-md-6 control-label">선물 금액</label>
                    <div class="col-md-6 text-center">3건</div>
                </div>
                <div class="row rowData">
                    <label class="col-md-6 control-label">보유 아이템 수</label>
                    <div class="col-md-6 text-center">3건</div>
                </div>
                <div class="row rowData">
                    <label class="col-md-6 control-label">환전 처리 수</label>
                    <div class="col-md-6 text-center">3건</div>
                </div>
                <div class="row rowData">
                    <label class="col-md-6 control-label">환전 금액</label>
                    <div class="col-md-6 text-center">3건</div>
                </div>
                <div class="row rowData">
                    <label class="col-md-6 control-label">현재 잔여금액</label>
                    <div class="col-md-6 text-center">3건</div>
                </div>
                <div class="row rowData">
                    <label class="col-md-6 control-label">방송강제퇴장</label>
                    <div class="col-md-6 text-center">3건</div>
                </div>
                <div class="row rowData">
                    <label class="col-md-6 control-label">신고처리</label>
                    <div class="col-md-6 text-center">3건</div>
                </div>
            </div>
        </nav>
        <!-- /main-nav -->
    </div>
</div>
<!-- end left sidebar -->