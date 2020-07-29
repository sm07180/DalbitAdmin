<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
</style>


<ul class="nav nav-tabs nav-tabs-custom-colored mt5" role="tablist">
    <li class="active"><a href="#noticeList" role="tab" data-toggle="tab" id="tab_noticeList" onclick="">회원/방송공지</a></li>
    <li><a href="#profileMsgList" role="tab" data-toggle="tab" id="tab_profileMsgList" onclick="">프로필메세지</a></li>
    <li><a href="#fanBoardList" role="tab" data-toggle="tab" id="tab_fanBoardList" onclick="">팬보드</a></li>
    <li><a href="#storyList" role="tab" data-toggle="tab" id="tab_storyList">사연</a></li>
    <li><a href="#banWordList" role="tab" data-toggle="tab" id="tab_banWordList" onclick="">금지어</a></li>
</ul>
<div class="tab-content no-padding">
    <!-- 회원/방송공지 -->
    <!-- 프로필메세지 -->
    <!-- 팬보드 -->
    <div class="tab-pane fade" id="storyList"><jsp:include page="storyList.jsp"/></div>               <!-- 사연 -->
    <!-- 금지어 -->
</div>


<script type="text/javascript">

</script>