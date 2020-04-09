<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>

<div id="contentTab">
    <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist">
        <li><a href="#pushDetail" role="tab" data-toggle="tab" id="tab_pushDetail" onclick="onClickContentTab(this.id)">푸시 메세지</a></li>
    </ul>
    <div class="tab-content">
        <div class="tab-pane fade" id="pushDetail"><jsp:include page="/WEB-INF/view/content/push/pushDetail.jsp"/></div>     <!-- 상세 -->
    </div>
</div>

<script>
    $(document).ready(function() {
    });

    //Tab 선택시 호출 함수
    function onClickContentTab(id){
        var targetName = id.split("_")[1];
        var targetFnc = eval("fnc_"+targetName);

        targetFnc.init();
    }
</script>