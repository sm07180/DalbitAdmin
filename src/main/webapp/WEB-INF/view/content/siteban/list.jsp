
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="main-header">
    <div id="page-wrapper">
        <div id="headerTab">
            <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist">
                <li class="active"><a href="#sitebanList" role="tab" data-toggle="tab" id="tab_sitebanList" onclick="onClickHeaderTab(this.id)">사이트 금지어 관리</a></li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane fade active in" id="sitebanList"><jsp:include page="/WEB-INF/view/content/siteban/sitebanList.jsp"/></div>     <!-- 사이트 금지어 관리 -->
            </div>
        </div>
    </div>
</div>
<div class="main-content" style="margin-top: 3px;">
</div>

<script src="../../../js/lib/jquery.table2excel.js"></script>
<script type="text/javascript" src="/js/code/content/contentCodeList.js"></script>

<script>
    $(document).ready(function() {
        init();
        initEvent();
    });

    //=------------------------------ Init / Event--------------------------------------------

    function init() {

    }

    function initEvent(){

    }


    //=------------------------------ Option --------------------------------------------

    //Tab 선택시 호출 함수
    function onClickHeaderTab(id){
        var targetName = id.split("_")[1];
        var targetFnc = eval("fnc_"+targetName);

        // targetFnc.init();
    }


    var dataKey = "";
    var dataInfo = "";
    function setSelectDataInfo(key, data){
        dataKey = key;
        dataInfo = data;
    }

    function getSelectDataInfo() {
        if(common.isEmpty(dataKey) && common.isEmpty(dataInfo)){
            return null;
        }

        return {
            "dataKey" : dataKey
            ,"data" : dataInfo
        }
    }

</script>