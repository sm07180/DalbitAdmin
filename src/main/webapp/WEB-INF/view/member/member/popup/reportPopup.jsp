<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String in_memNo = request.getParameter("memNo");
    String in_memNick = request.getParameter("memNick");
    String in_memSex = request.getParameter("memSex");
%>

<div class="col-md-12 no-padding" id="report_detail">
    <div class="widget-content">
        <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist">
            <li class="active"><a href="#reportDetail" role="tab" data-toggle="tab">경고/정지</a></li>
        </ul>
        <div class="tab-content no-padding">
            <div class="col-lg-12 no-padding">
                <label id="report_title"></label>
            </div>
            <div class="col-lg-12 no-padding">
                <div class="col-md-12 no-padding lb_style">
                    <label>대상자</label>
                </div>
                <div class="col-md-12 no-padding">
                    <div class="col-md-4 no-padding">
                        <div class="col-md-6 lb_style"><label>아이디</label></div>
                        <div class="col-md-6" style="height: 34px;"><label id="lb_memNo"></label></div>
                    </div>
                    <div class="col-md-4 no-padding">
                        <div class="col-md-6 lb_style"><label>닉네임</label></div>
                        <div class="col-md-6" style="height: 34px;"><label id="lb_memNick"></label></div>
                    </div>
                    <div class="col-md-4 no-padding">
                        <div class="col-md-6 lb_style"><label>성별</label></div>
                        <div class="col-md-6" style="height: 34px;"><label id="lb_memSex"></label></div>
                    </div>
                </div>
                <div class="col-md-12 no-padding">
                    <div class="col-md-4 lb_style"><label>조치사유</label></div>
                    <div class="col-md-8" style="height: 34px;"><label>조치사유 선택</label></div>
                    <div class="col-md-4 lb_style" style="height: 68px;"><label>조치내역</label></div>
                    <div class="col-md-8" style="height: 68px;">
                        <label class="radio-inline"><input type="radio" name="radio_ban" value="ban_pre" checked>유지</label>
                        <label class="radio-inline"><input type="radio" name="radio_ban" value="ban_war">경고</label>
                        <label class="radio-inline"><input type="radio" name="radio_ban" value="ban_1">1일 정지</label>
                        <label class="radio-inline"><input type="radio" name="radio_ban" value="ban_3">3일 정지</label>
                        <label class="radio-inline"><input type="radio" name="radio_ban" value="ban_7">7일 정지</label>
                        <label class="radio-inline"><input type="radio" name="radio_ban" value="ban_15">15일 정지</label>
                        <label class="radio-inline"><input type="radio" name="radio_ban" value="ban_30">30일 정지</label>
                        <label class="radio-inline"><input type="radio" name="radio_ban" value="ban_ban">강제탈퇴</label>
                    </div>
                    <div class="col-md-4 lb_style" style="height: 142px;"<label>운영자메모</label></div>
                <div class="col-md-8" style="height: 142px;"><label>asdasd</label></div>
                <div class="col-md-4 lb_style"><label>등록/처리일시</label></div>
                <div class="col-md-8" style="height: 34px;">2020-02-02 11:00</div>
                <div class="col-md-4 lb_style"><label>운영자명</label></div>
                <div class="col-md-8" style="height: 34px;"><label>양운영</label></div>
            </div>
            <div class="col-md-12 no-padding" style="text-align: center">
                <button type="button" id="bt_complet" class="btn btn-default btn-sm">처리완료</button>
                <button type="button" id="bt_close" class="btn btn-default btn-sm" >취소</button>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function() {
        $('#report_title').html("ㆍ운영자에 의해 경고 또는 정지/강제탈퇴 등의 처리가 가능합니다.<br/>ㆍ해당 유저를 제외한 경고/정지/탈퇴 처리 시 사유를 메모에 남겨주세요.");
    });
    var memNo =  <%=in_memNo%>;
    var memNick =  <%=in_memNick%>;
    var memSex =  <%=in_memSex%>;

    init();
    function init() {
        $('#lb_memNo').html(memNo);
        $('#lb_memNick').html(memNick);
        if(memSex == "m"){
            $('#lb_memSex').html("남");
        }else{
            $('#lb_memSex').html("여");
        }
    }
</script>