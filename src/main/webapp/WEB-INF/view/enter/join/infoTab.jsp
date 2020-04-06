<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
</style>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="row col-lg-12 form-inline" style="padding-top: 2px; padding-bottom: 0px;">
            <div class="widget-content">
                <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist" id="tablist_con">
                    <li class="active"><a href="#total" role="tab" data-toggle="tab">총계</a></li>
                    <li><a href="#gender" role="tab" data-toggle="tab" id="tab_joGenderDetail">성별</a></li>
                    <li><a href="#platGender" role="tab" data-toggle="tab" id="tab_joPlatGenderDetail">플랫폼(성별)</a></li>
                    <li><a href="#platAge" role="tab" data-toggle="tab" id="tab_joPlatAgeDetail">플랫폼(연령별)</a></li>
                    <li><a href="#memberQuit" role="tab" data-toggle="tab" id="tab_joMemberQuitDetail">회원 탈퇴</a></li>
                    <li><a href="#memberAll" role="tab" data-toggle="tab" id="tab_joMemberAllDetail">전체 회원</a></li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane fade in active" id="total"><jsp:include page="total.jsp"/></div>       <!-- 총계 -->
                    <div class="tab-pane fade" id="gender"><jsp:include page="gender.jsp"/></div>               <!-- 성별 -->
                    <div class="tab-pane fade" id="platGender"><jsp:include page="platform_gender.jsp"/></div>  <!-- 플랫폼(성별) -->
                    <div class="tab-pane fade" id="platAge"><jsp:include page="platform_age.jsp"/></div>        <!-- 플랫폼(연령별) -->
                    <div class="tab-pane fade" id="memberQuit"><jsp:include page="member_quit.jsp"/></div>      <!-- 회원 탈퇴 -->
                    <div class="tab-pane fade" id="memberAll"><jsp:include page="member_all.jsp"/></div>        <!-- 전체 회원 -->
                </div>
            </div>
        </div>
    </div>
    <!-- /#page-wrapper -->
</div>
<!-- /#wrapper -->