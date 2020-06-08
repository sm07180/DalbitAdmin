
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="main-header">
    <div id="page-wrapper">
        <!-- serachBox -->
        <form id="searchForm">
            <div class="row col-lg-12 form-inline">
                <div class="widget widget-table searchBoxArea">
                    <div class="widget-header searchBoxRow">
                        <h3 class="title"><i class="fa fa-search"></i>시스템메시지 검색</h3>
                        <div>
                            <span id="search_searchType_aria"></span>

                            <label><input type="text" class="form-control" id="txt_search" name="searchText" placeholder="검색할 정보를 입력하세요"></label>
                            <button type="button" class="btn btn-success" id="bt_search">검색</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <!-- //serachBox -->

        <div id="headerTab">
            <div id="messageList"><jsp:include page="/WEB-INF/view/content/message/messageList.jsp"/></div>          <!-- 푸시 -->
        </div>
    </div>
</div>
<div class="main-content" style="margin-top: 3px; display: none;">
    <%-- popup으로 인한 주석
    <!-- TAB -->
        <div name="main-content-div" id="messageListContent">
            <jsp:include page="messageTab.jsp"></jsp:include>
        </div>  <!-- 푸시 -->
    <!-- TAB END -->

    --%>
</div>
<jsp:include page="/WEB-INF/view/common/util/select_memeberList.jsp"></jsp:include>

<script src="../../../js/lib/jquery.table2excel.js"></script>
<script type="text/javascript" src="/js/code/administrate/adminCodeList.js?${dummyData}"></script>

<script>
    $(document).ready(function() {
        init();
        initEvent();
    });

//=------------------------------ Init / Event--------------------------------------------

    function init() {
        //검색조건 불러오기
        $("#search_searchType_aria").html(util.getCommonCodeSelect(-1, message_searchType));
    }

    function initEvent(){
        $('input[id="txt_search"]').keydown(function() {
            if (event.keyCode === 13) {
                getItemInfo();
            };
        });

        $('#bt_search').click( function() {       //검색
            getItemInfo();
        });
    }


//=------------------------------ Option --------------------------------------------

    // Content Tab 선택 초기화
    function initContentTab(){
        $("[name=main-content-div]").each(function(){
            $(this).find("#contentTab").find(".active").removeClass("active");
            $(this).find(".tab-content").find(".active").removeClass("in").removeClass("active");
        });

        $(".main-content").hide();
    }

    function showContentTab(){
        $(".main-content").show();

    }


    // 검색
    function getItemInfo(){
        // var selectTabId = $("#headerTab").find(".active").find("a").prop("id").split("_")[1];
        var selectTabId = "messageList";
        console.log(selectTabId)
        var targetFnc = eval("fnc_"+selectTabId);

        // targetFnc.dtList_info.reload();
        targetFnc.selectMainList();

        /*검색결과 영역이 접혀 있을 시 열기*/
        ui.toggleSearchList();
    }


    var choiceDataInfo = null;
    function initSelectDataInfo() {
        choiceDataInfo = {};
    }

    function setSelectDataInfo(key, data){
        if(common.isEmpty(choiceDataInfo)){
            initSelectDataInfo();
        }
        choiceDataInfo[key] = data;
    }

    function getSelectDataInfo() {
        if(common.isEmpty(choiceDataInfo) || jQuery.isEmptyObject(choiceDataInfo)){
            return null;
        }

        return choiceDataInfo;
    }

</script>