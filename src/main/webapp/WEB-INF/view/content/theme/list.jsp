<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dummyData"><%= java.lang.Math.round(java.lang.Math.random() * 1000000) %></c:set>

<div id="main-header">
    <div id="page-wrapper">
        <div id="headerTab">
            <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist">
                <li class="active"><a href="#broadcastList" role="tab" data-toggle="tab" id="tab_broadcastList" onclick="onClickHeaderTab(this.id)">방송주제 관리</a></li>
                <%--<li><a href="#castList" role="tab" data-toggle="tab" id="tab_castList" onclick="onClickHeaderTab(this.id)">캐스트주제 관리</a></li>--%>
            </ul>
            <div class="tab-content">
                <div class="tab-pane fade active in" id="broadcastList"><jsp:include page="/WEB-INF/view/content/theme/broadcastList.jsp"/></div>     <!-- 방송주제 -->
                <%--<div class="tab-pane fade" id="castList"><jsp:include page="/WEB-INF/view/content/theme/castList.jsp"/></div>     <!-- 캐스트주제 -->--%>
            </div>
        </div>
    </div>
</div>
<div class="main-content" style="margin-top: 3px;">
</div>

<script src="/js/lib/jquery.table2excel.js"></script>
<script type="text/javascript" src="/js/code/content/contentCodeList.js?${dummyData}"></script>

<script type="text/javascript">
//=------------------------------ Option --------------------------------------------

    //Tab 선택시 호출 함수
    function onClickHeaderTab(id){
        var targetName = id.split("_")[1];
        var targetFnc = eval("fnc_"+targetName);

        // targetFnc.init();
    }


    var choiceDataInfo = {};
    function setSelectDataInfo(key, data){
        choiceDataInfo[key] = data;
    }

    function getSelectDataInfo() {
        if(common.isEmpty(choiceDataInfo)){
            return null;
        }

        return choiceDataInfo;
    }

</script>