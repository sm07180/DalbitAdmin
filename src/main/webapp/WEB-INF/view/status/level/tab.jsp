<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
</style>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="row col-lg-12 form-inline" style="padding-top: 2px; padding-bottom: 0px;">
            <div class="widget-content">
                <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist" id="tablist_con">
                    <li class="active"><a href="#levelList" role="tab" data-toggle="tab" id="tab_levelList">레벨 회원 분포현황</a></li>
                    <li><a href="#memList" role="tab" data-toggle="tab" id="tab_memList">레벨 회원 내역</a></li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane fade in active" id="levelList"><jsp:include page="levelList.jsp"/></div>      <!-- 레벨 회원 분포현황 -->
                    <div class="tab-pane fade" id="memList"><jsp:include page="list.jsp"/></div>    <!-- 레벨 회원 순으로 보기 -->
                </div>
            </div>
        </div>
    </div>
    <!-- /#page-wrapper -->
</div>
<!-- /#wrapper -->

<script type="text/javascript">
    var tabId;
    $("#tablist_con li a").on('click', function(){
        tabId = $(this).prop('id');
        if(tabId == 'tab_levelList'){
            getLevelList();
        }else if(tabId == 'tab_memList'){
            tmp_filter = 0;
            getMemLevelList();
        }

    });
</script>