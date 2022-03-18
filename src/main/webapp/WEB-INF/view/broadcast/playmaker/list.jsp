<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dummyData"><%= java.lang.Math.round(java.lang.Math.random() * 1000000) %></c:set>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="clearfix widget-content mb5">
                <h4 class="font-bold">플레이 메이커</h4>

                <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist" id="tablist_con">
                    <li class="active"><a href="#playmakerAdmin" role="tab" data-toggle="tab" onclick="initPlaymakerAdminEvent();">플레이메이커 관리</a></li>
                    <li><a href="#playmakerDetail" role="tab" data-toggle="tab" onclick="initPlaymakerDetailEvent();">상세조회</a></li>
                    <li><a href="#playmakerTeam" role="tab" data-toggle="tab">팀설정</a></li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane fade in active" id="playmakerAdmin">
                        <jsp:include page="playmakerAdmin.jsp"/>
                    </div>
                    <div class="tab-pane fade" id="playmakerDetail">
                        <jsp:include page="playmakerDetail.jsp"/>
                    </div>
                    <div class="tab-pane fade" id="playmakerTeam">
                        <jsp:include page="playmakerTeam.jsp"/>
                    </div>
                </div>
            </div>
        </div> <!-- //container-fluid -->
    </div> <!-- //page-wrapper -->
</div>
<!-- //wrapper-->

<jsp:include page="/WEB-INF/view/common/util/select_specialList.jsp"></jsp:include>
<script type="text/javascript" src="/js/code/menu/menuCodeList.js?${dummyData}"></script>

<script>
  function handlebarsPaging(targetId, pagingInfo) {
    switch (targetId) {
      case 'playmaker-admin-p-top':
      case 'playmaker-admin-p-bottom':
      case 'playmaker-admin-e-top':
      case 'playmaker-admin-e-bottom':
        adminPagingInfo.pageNo = pagingInfo.pageNo;
        adminEventData.callList();
        break;
      case 'playmaker-detail-top':
      case 'playmaker-detail-bottom':
        datailPagingInfo.pageNo = pagingInfo.pageNo;
        datailEventData.callList();
        break;
    }
  }
</script>