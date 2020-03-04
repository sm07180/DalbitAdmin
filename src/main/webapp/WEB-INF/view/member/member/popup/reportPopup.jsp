<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String in_memNo = request.getParameter("in_memNo");
%>

<style>
    .lb_style{
        border: 1px solid #DDDDDD;
        background-color: #DCE6F2;
        height: 34px;
    }
</style>

<div class="col-md-12 no-padding" id="report_detail">
    <div class="widget-content">
        <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist">
            <li class="active"><a href="#reportDetail" role="tab" data-toggle="tab">상세정보</a></li>
        </ul>
        <div class="tab-content no-padding">
            <div class="tab-pane fade in active" id="reportDetail"><jsp:include page="../../../customer/declaration/report.jsp"/></div>     <!-- 상세 -->
        </div>
    </div>
</div>

<script>
    $(document).ready(function() {
    });

    $('#report_title').html("ㆍ신고 시 캡쳐내용은 라이브 방송방 신고시점을 기준으로 5분 이내의 채팅 내역 정보입니다.<br/>ㆍ캡쳐화면 내 닉네임을 클릭하면 클릭한 닉네임의 채팅글만 우측에서 보여집니다.<br/> ㆍ신중히 확인 한 후 조치바랍니다.");

    init();
    function init(){
        var memNo =  <%=in_memNo%>;
        getChattingHistoryDetail();
    }
</script>