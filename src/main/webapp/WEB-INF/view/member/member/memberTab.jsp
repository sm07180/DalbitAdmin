
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="row col-lg-12 form-inline hide mt5" style="padding-bottom: 0px;" id="tabList_top">
    <div class="widget-content" >
        <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist" id="tablist_con">
            <li class="active"><a href="#infoDetail" role="tab" data-toggle="tab">상세정보</a></li>
            <li><a href="#broadDetail" role="tab" data-toggle="tab" id="tab_broadDetail" onclick="tab_click(this.id);">방송내역</a></li>
            <li><a href="#listenDetail" role="tab" data-toggle="tab" id="tab_listenDetail" onclick="tab_click(this.id);">청취내역</a></li>
            <li><a href="#payDetail" role="tab" data-toggle="tab" id="tab_payDetail" onclick="tab_click(this.id);">결제/취소내역</a></li>
            <li><a href="#giftDetail" role="tab" data-toggle="tab" id="tab_giftDetail" onclick="tab_click(this.id);">내지갑</a></li>
            <li><a href="#mystarDetail" role="tab" data-toggle="tab" id="tab_mystarDetail" onclick="tab_click(this.id);">마이스타/팬</a></li>
            <li><a href="#noticeDetail" role="tab" data-toggle="tab" id="tab_noticeDetail" onclick="tab_click(this.id);">회원공지관리</a></li>
            <li><a href="#fanboardDetail" role="tab" data-toggle="tab" id="tab_fanboardDetail" onclick="tab_click(this.id);">팬보드관리</a></li>
            <li><a href="#banwordDetail" role="tab" data-toggle="tab" id="tab_banwordDetail" onclick="tab_click(this.id);">금지어관리</a></li>
            <li><a href="#declarationDetail" role="tab" data-toggle="tab" id="tab_declarationDetail" onclick="tab_click(this.id);">신고내역</a></li>
            <li><a href="#questionDetail" role="tab" data-toggle="tab" id="tab_questionDetail" onclick="tab_click(this.id);">문의내역</a></li>
        </ul>
        <div class="tab-content">
            <div class="tab-pane fade in active " id="infoDetail"><jsp:include page="mamberInfo.jsp"/></div>     <!-- 상세 -->
            <div class="tab-pane fade" id="broadDetail"><jsp:include page="../broadcast/list.jsp"/></div>       <!-- 방송 -->
            <div class="tab-pane fade" id="listenDetail"><jsp:include page="../listen/list.jsp"/></div>         <!-- 청취 -->
            <div class="tab-pane fade" id="payDetail"><jsp:include page="../pay/list.jsp"/></div>               <!-- 결제 -->
            <div class="tab-pane fade" id="giftDetail"><jsp:include page="../gift/list.jsp"/></div>             <!-- 선물 -->
            <div class="tab-pane fade" id="mystarDetail"><jsp:include page="../myStar/list.jsp"/></div>         <!-- 마이스타 -->
            <div class="tab-pane fade" id="noticeDetail"><jsp:include page="../notice/list.jsp"/></div>         <!-- 공지 -->
            <div class="tab-pane fade" id="fanboardDetail"><jsp:include page="../fanboard/list.jsp"/></div>       <!-- 팬보드 -->
            <div class="tab-pane fade" id="banwordDetail"><jsp:include page="../banword/list.jsp"/></div>         <!-- 금지어 -->
            <div class="tab-pane fade" id="declarationDetail"><jsp:include page="../declaration/list.jsp"/></div> <!-- 신고 -->
            <div class="tab-pane fade" id="questionDetail"><jsp:include page="../question/list.jsp"/></div>     <!-- 문의 -->
        </div>
    </div>
</div>


<script type="text/javascript" src="/js/code/member/memberCodeList.js?${dummyData}"></script>
<script type="text/javascript" src="/js/code/customer/customerCodeList.js?${dummyData}"></script>
<script type="text/javascript" src="/js/message/member/memberMessage.js?${dummyData}"></script>
<script type="text/javascript" src="/js/code/broadcast/broadCodeList.js?${dummyData}"></script>

<script>
    $(document).ready(function() {
    });
    var dtList_info_detail;
    var dtList_top_info;

    function tab_click(tmp){
        if(tmp == "tab_broadDetail"){
            getHistory_broadDetail(tmp);
        }else if(tmp == "tab_listenDetail"){
            getHistory_listenDetail(tmp);
        }else if(tmp == "tab_payDetail"){
            getHistory_payDetail(tmp);
        }else if(tmp == "tab_giftDetail"){
            memberGiftInit("broadGift");
        }else if(tmp == "tab_mystarDetail"){
            getHistory_mystarDetail(tmp);
        }else if(tmp == "tab_noticeDetail"){
            getHistory_noticeDetail(tmp);
        }else if(tmp == "tab_fanboardDetail"){
            getHistory_fanbroadDetail(tmp);
        }else if(tmp == "tab_banwordDetail"){
            getHistory_banwordDetail(tmp);
        }else if(tmp == "tab_declarationDetail"){
            getHistory_declarationDetail(tmp);
        }else if(tmp == "tab_questionDetail"){
            getHistory_questionDetail(tmp);
        }
    }
</script>