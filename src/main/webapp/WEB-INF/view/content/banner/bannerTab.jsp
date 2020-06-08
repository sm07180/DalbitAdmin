<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>

<div id="contentTab">
    <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist">
        <li><a href="#bannerDetail" role="tab" data-toggle="tab" id="tab_bannerDetail" onclick="onClickContentTab(this.id)">배너 상세정보</a></li>
    </ul>
    <div class="tab-content">
        <div class="tab-pane fade" id="bannerDetail"><jsp:include page="/WEB-INF/view/content/banner/bannerDetail.jsp"/></div>     <!-- 상세 -->
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
    }
</script>