<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>

<div id="contentTab">
    <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist">
        <li><a href="#giftDetail" role="tab" data-toggle="tab" id="tab_giftDetail" onclick="onClickContentTab(this.id)">선물 아이템 상세</a></li>
    </ul>
    <div class="tab-content">
        <div class="tab-pane fade" id="giftDetail"><jsp:include page="/WEB-INF/view/content/item/detail/giftDetail.jsp"/></div>     <!-- 상세 -->
    </div>
</div>

<script>
    $(document).ready(function() {
    });

    //Tab 선택시 호출 함수
    function onClickContentTab(id){
        var targetName = id.split("_")[1];
        var targetFnc = eval("fnc_"+targetName);

        showContentTab();
        targetFnc.init();

        var scrollPosition = $("#tab_"+targetFnc.targetId).offset();
        util.scrollPostion(scrollPosition.top);
    }
</script>