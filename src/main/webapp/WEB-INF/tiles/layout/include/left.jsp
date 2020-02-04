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

                <c:if test="${fn:startsWith(url, '/member1234/')}">
                    <li><a href="page-inbox.html"><i class="fa fa-envelope-o"></i><span class="text">개별/방송 중 공지</span></a></li>
                    <li><a href="#" class="js-sub-menu-toggle"><i class="fa fa-file"></i><span class="text">File Manager</span>
                        <i class="toggle-icon fa fa-angle-left"></i></a>
                        <ul class="sub-menu ">
                            <li><a href="page-file-manager.html"><span class="text">Default</span></a></li>
                            <li><a href="page-file-manager-transparent.html"><span class="text">Transparent</span></a></li>
                        </ul>
                    </li>
                    <li><a href="page-projects.html"><i class="fa fa-briefcase"></i><span class="text">Projects</span></a></li>
                    <li><a href="page-project-detail.html"><i class="fa fa-tasks"></i><span class="text">Project Detail</span></a></li>
                    <li><a href="#" class="js-sub-menu-toggle"><i class="fa fa-bar-chart-o fw"></i><span class="text">Charts &amp; Statistics</span>
                        <i class="toggle-icon fa fa-angle-left"></i></a>
                        <ul class="sub-menu ">
                            <li><a href="charts-statistics.html"><span class="text">Charts</span></a></li>
                            <li><a href="charts-statistics-transparent.html"><span class="text">Charts Transparent</span></a></li>
                            <li><a href="charts-statistics-interactive.html"><span class="text">Interactive Charts</span></a></li>
                            <li><a href="charts-statistics-interactive-transparent.html"><span class="text">Interactive Charts Transparent</span></a></li>
                            <li><a href="charts-statistics-real-time.html"><span class="text">Realtime Charts</span></a></li>
                            <li><a href="charts-statistics-real-time-transparent.html"><span class="text">Realtime Charts Transparent</span></a></li>
                            <li><a href="charts-d3charts.html"><span class="text">D3 Charts</span></a></li>
                        </ul>
                    </li>
                    <li><a href="#" class="js-sub-menu-toggle"><i class="fa fa-edit fw"></i><span class="text">Forms</span>
                        <i class="toggle-icon fa fa-angle-left"></i></a>
                        <ul class="sub-menu ">
                            <li><a href="form-inplace-editing.html"><span class="text">In-place Editing</span></a></li>
                            <li><a href="form-elements.html"><span class="text">Form Elements</span></a></li>
                            <li><a href="form-layouts.html"><span class="text">Form Layouts</span></a></li>
                            <li><a href="form-bootstrap-elements.html"><span class="text">Bootstrap Elements</span></a></li>
                            <li><a href="form-validations.html"><span class="text">Validation</span></a></li>
                            <li><a href="form-file-upload.html"><span class="text">File Upload</span></a></li>
                            <li><a href="form-text-editor.html"><span class="text">Text Editor</span></a></li>
                        </ul>
                    </li>
                    <li><a href="#" class="js-sub-menu-toggle"><i class="fa fa-list-alt fw"></i><span class="text">UI Elements</span>
                        <i class="toggle-icon fa fa-angle-left"></i></a>
                        <ul class="sub-menu ">
                            <li><a href="ui-elements-general.html"><span class="text">General Elements</span></a></li>
                            <li><a href="ui-elements-tabs.html"><span class="text">Tabs</span></a></li>
                            <li><a href="ui-elements-buttons.html"><span class="text">Buttons</span></a></li>
                            <li><a href="ui-elements-icons.html"><span class="text">Icons <span class="badge element-bg-color-blue">Updated</span></span></a></li>
                            <li><a href="ui-elements-flash-message.html"><span class="text">Flash Message</span></a></li>
                        </ul>
                    </li>
                    <li><a href="widgets.html"><i class="fa fa-puzzle-piece fa-fw"></i><span class="text">Widgets</span></a></li>
                    <li><a href="#" class="js-sub-menu-toggle"><i class="fa fa-gears fw"></i><span class="text">Components</span>
                        <i class="toggle-icon fa fa-angle-left"></i></a>
                        <ul class="sub-menu ">
                            <li><a href="components-wizard.html"><span class="text">Wizard (with validation)</span></a></li>
                            <li><a href="components-calendar.html"><span class="text">Calendar</span></a></li>
                            <li><a href="components-maps.html"><span class="text">Maps</span></a></li>
                            <li><a href="components-maps-transparent.html"><span class="text">Maps Transparent</span></a></li>
                            <li><a href="components-gallery.html"><span class="text">Gallery</span></a></li>
                            <li><a href="components-tree-view.html"><span class="text">Tree View </span></a></li>
                            <li><a href="components-tree-view-transparent.html"><span class="text">Tree View Transparent</span></a></li>
                        </ul>
                    </li>
                    <li><a href="#" class="js-sub-menu-toggle"><i class="fa fa-table fw"></i><span class="text">Tables</span>
                        <i class="toggle-icon fa fa-angle-left"></i></a>
                        <ul class="sub-menu ">
                            <li><a href="tables-static-table.html"><span class="text">Static Table</span></a></li>
                            <li><a href="tables-dynamic-table.html"><span class="text">Dynamic Table</span></a></li>
                        </ul>
                    </li>
                    <li><a href="typography.html"><i class="fa fa-font fa-fw"></i><span class="text">Typography</span></a></li>
                    <li>
                        <a href="#" class="js-sub-menu-toggle"><i class="fa fa-bars"></i>
                            <span class="text">Menu Lvl 1</span>
                            <i class="toggle-icon fa fa-angle-left"></i>
                        </a>
                        <ul class="sub-menu">
                            <li class="">
                                <a href="#" class="js-sub-menu-toggle">
                                    <span class="text">Menu Lvl 2</span>
                                    <i class="toggle-icon fa fa-angle-left"></i>
                                </a>
                                <ul class="sub-menu">
                                    <li><a href="#">Menu Lvl 3</a></li>
                                    <li><a href="#">Menu Lvl 3</a></li>
                                    <li><a href="#">Menu Lvl 3</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="#">
                                    <span class="text">Menu Lvl 2</span>
                                </a>
                            </li>
                        </ul>
                    </li>
                </c:if>
            </ul>
        </nav>
        <!-- /main-nav -->
    </div>
</div>
<!-- end left sidebar -->