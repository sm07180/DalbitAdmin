<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
</style>


<ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist" id="tablist_con">
    <li class="active"><a href="#storyList" role="tab" data-toggle="tab" id="tab_storyList">사연</a></li>
    <li><a href="#fanBoardList" role="tab" data-toggle="tab" id="tab_fanBoardList">팬보드</a></li>
    <li><a href="#fanBoardReply" role="tab" data-toggle="tab" id="tab_fanBoardReply">팬보드댓글</a></li>
    <li><a href="#noticeList" role="tab" data-toggle="tab" id="tab_noticeList">방송공지</a></li>
    <li><a href="#broadNoticeList" role="tab" data-toggle="tab" id="tab_broadNoticeList">방송방공지</a></li>
    <li><a href="#profileMsgList" role="tab" data-toggle="tab" id="tab_profileMsgList">프로필메세지</a></li>
    <li><a href="#clipReply" role="tab" data-toggle="tab" id="tab_clipReply">클립댓글</a></li> <!-- 클립댓글-->
</ul>
<div class="tab-content no-padding">
    <div class="tab-pane fade in active" id="storyList"><jsp:include page="storyList.jsp"/></div>
    <div class="tab-pane fade" id="fanBoardList"><jsp:include page="fanBoardList.jsp"/></div>
    <div class="tab-pane fade" id="fanBoardReply"><jsp:include page="fanBoardReply.jsp"/></div>
    <div class="tab-pane fade" id="noticeList"><jsp:include page="noticeList.jsp"/></div>
    <div class="tab-pane fade" id="broadNoticeList"><jsp:include page="broadNoticeList.jsp"/></div>
    <div class="tab-pane fade" id="profileMsgList"><jsp:include page="profileMsgList.jsp"/></div>
    <div class="tab-pane fade" id="clipReply"><jsp:include page="clipReply.jsp"/></div>
</div>


<script type="text/javascript">
    var tabId = "tab_storyList" ;
    $("#tablist_con li a").on('click', function(){
        tabId = $(this).prop('id');
        if(tabId == "tab_storyList" ){
            storyList();
        }else if(tabId == "tab_fanBoardList" ){
            fanBoardList();
        }else if(tabId == "tab_fanBoardReply" ){
            fanBoardReply();
        }else if(tabId == "tab_noticeList" ){
            noticeList();
        }else if(tabId == "tab_broadNoticeList" ){
            broadNoticeList();
        }else if(tabId == "tab_profileMsgList" ){
            profileMsgList();
        }else if(tabId == "tab_clipReply" ){
            clipReplyList();
        }
    });
    $('input[id="txt_search"]').keydown(function(e) {
        if(e.keyCode == 13) {
            $("#bt_search").click();
        }
    });
    $('#bt_search').on('click', function() {
        if(tabId == "tab_storyList" ){
            storyList();
        }else if(tabId == "tab_fanBoardList" ){
            fanBoardList();
        }else if(tabId == "tab_fanBoardReply" ){
            fanBoardReply();
        }else if(tabId == "tab_noticeList" ){
            noticeList();
        }else if(tabId == "tab_broadNoticeList" ){
            broadNoticeList();
        }else if(tabId == "tab_profileMsgList" ){
            profileMsgList();
        }else if(tabId == "tab_clipReply" ){
            clipReplyList();
        }
    });

</script>