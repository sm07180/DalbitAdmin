<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
</style>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="widget-content">
            <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist" id="tablist_con">
                <li class="active"><a href="#currentUser" role="tab" data-toggle="tab" id="tab_userDetail">현재 접속 회원</a></li><!-- 회원검색 새 창도 열리게끔 -->
                <%--<li><a href="#total" role="tab" data-toggle="tab" id="tab_total">총계</a></li>--%>
            </ul>
            <div class="tab-content">
                <div class="tab-pane fade  in active" id="currentUser"><jsp:include page="currentUser.jsp"/></div>             <!-- 현재 접속 회원 -->
                <%--<div class="tab-pane fade" id="total"><jsp:include page="total.jsp"/></div>      <!-- 총계 -->--%>
            </div>
        </div>
    </div>
    <!-- /#page-wrapper -->
</div>
<!-- /#wrapper -->

<script type="text/javascript">
    $("#tablist_con li a").on('click', function(){
        var tabId = $(this).prop('id');
        if(tabId == 'tab_total'){
            getTotalList();
        }else if(tabId == 'tab_userDetail'){
            getCurrenList();
        }
    });
</script>
