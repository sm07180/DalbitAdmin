<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dummyData"><%= java.lang.Math.round(java.lang.Math.random() * 1000000) %>
</c:set>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="clearfix widget-content mb5">
                <h4 class="font-bold">팀현황</h4>

                <div class="mb10">
                    <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist">
                        <li class="active">
                            <a href="/content/team/list">전체 팀</a>
                        </li>
                        <li>
                            <a href="/content/team/stat">월간 현황</a>
                        </li>
                        <li>
                            <a href="/content/team/symbol">팀 심볼 관리</a>
                        </li>
                        <li>
                            <a href="/content/team/badge">활동배지 관리</a>
                        </li>
                    </ul>
                </div>

                <div class="mb10">
                    <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist">
                        <li class="active">
                            <a href="#activeTeam" role="tab" data-toggle="tab">활동중</a>
                        </li>
                        <li>
                            <a href="#deletedTeam" role="tab" data-toggle="tab">삭제됨</a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane fade in active" id="activeTeam">
                            활동중
                        </div>
                        <div class="tab-pane fade" id="deletedTeam">
                            삭제됨
                        </div>
                    </div>
                </div>
            </div>
        </div> <!-- //container-fluid -->
    </div> <!-- //page-wrapper -->
</div>
<!-- //wrapper-->