
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="main-header">
    <div id="page-wrapper">
        <!-- serachBox -->
        <form id="searchForm">
            <div class="row col-lg-12 form-inline">
                <div class="widget widget-table searchBoxArea">
                    <div class="widget-header searchBoxRow">
                        <div class="row col-md-12">
                            <h3 class="title"><i class="fa fa-search"></i>이벤트검색</h3>
                            <div>
                                <span id="search_platform_aria"></span>
                                <span id="search_progressStatus_aria"></span>
                                <span id="search_searchType_aria"></span>

                                <label><input type="text" class="form-control" id="txt_search" placeholder="검색할 정보를 입력하세요"></label>
                                <button type="button" class="btn btn-success" id="bt_search">검색</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <!-- //serachBox -->

        <div id="headerTab">
            <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist">
                <li class="active"><a href="#eventList" role="tab" data-toggle="tab" id="tab_eventList" onclick="onClickHeaderTab(this.id)">진행 이벤트</a></li>
                <li><a href="#pastEventList" role="tab" data-toggle="tab" id="tab_pastEventList" onclick="onClickHeaderTab(this.id)">마감 이벤트</a></li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane fade active in" id="eventList"><jsp:include page="/WEB-INF/view/content/event/eventList.jsp"/></div>     <!-- 진행 이벤트 -->
                <div class="tab-pane fade" id="pastEventList"><jsp:include page="/WEB-INF/view/content/event/eventPastList.jsp"/></div>     <!-- 지난 이벤트 -->
            </div>
        </div>
    </div>
</div>
<div class="main-content" style="margin-top: 3px;">
    <!-- TAB -->
    <jsp:include page="detail/eventTab.jsp"></jsp:include>
    <!-- TAB END -->
</div>
<jsp:include page="../util/imageModal.jsp"></jsp:include>

<script src="../../../js/lib/jquery.table2excel.js"></script>
<script type="text/javascript" src="/js/code/content/contentCodeList.js"></script>

<script>
    $(document).ready(function() {
        init();
        initEvent();
    });

//=------------------------------ Init / Event--------------------------------------------

    function init() {
        //검색조건 불러오기
        $("#search_platform_aria").html(util.getCommonCodeSelect(-1, platformGroup));
        $("#search_progressStatus_aria").html(util.getCommonCodeSelect(-1, progressStatus));
        $("#search_searchType_aria").html(util.getCommonCodeSelect(-1, event_searchType));
    }

    function initEvent(){
        $('input[id="txt_search"]').keydown(function() {
            if (event.keyCode === 13) {
                getBannerInfo();
            };
        });

        $('#bt_search').click( function() {       //검색
            getBannerInfo();
        });
    }


//=------------------------------ Option --------------------------------------------

    //Tab 선택시 호출 함수
    function onClickHeaderTab(id){
        var targetName = id.split("_")[1];
        var targetFnc = eval("fnc_"+targetName);

        // targetFnc.init();
    }

    // 검색
    function getBannerInfo(){
        var selectTabId = $("#headerTab").find(".active").find("a").prop("id").split("_")[1];
        console.log(selectTabId)
        var targetFnc = eval("fnc_"+selectTabId);

        console.log(targetFnc)
        console.log(targetFnc.dtList_info.dataTableSource);

        /* 엑셀저장을 위해 조회조건 임시저장 */
        // tmp_search = $('#txt_search').val();
        // tmp_gubun = $("select[name='selectGubun']").val();

        // targetFnc.dtList_info.reload();
        console.log(targetFnc.dtList_info)
        targetFnc.selectMainList();


        /*검색결과 영역이 접혀 있을 시 열기*/
        ui.toggleSearchList();
    }

        // /*=---------- 엑셀 ----------*/
        // $('#excelDownBtn').on('click', function(){
        //     var formElement = document.querySelector("form");
        //     var formData = new FormData(formElement);
        //
        //     formData.append("search", tmp_search);
        //     formData.append("date", tmp_date);
        //     formData.append("gubun", tmp_gubun);
        //     formData.append("checkDate", tmp_checkDate);
        //     formData.append("stDate", tmp_stDate);
        //     formData.append("edDate", tmp_edDate);
        //     /*formData.append("test003", "test003");*/
        //     excelDownload($(this), "/rest/member/member/listExcel", formData, fn_success_excel, fn_fail_excel)
        // });

        // $("#excelBtn").on("click", function () {
        //     $("#list_info").table2excel({
        //         exclude: ".noExl",
        //         name: "Excel Document Name",
        //         filename: "report" +'.xls', //확장자를 여기서 붙여줘야한다.
        //         fileext: ".xls",
        //         exclude_img: true,
        //         exclude_links: true,
        //         exclude_inputs: true
        //     });
        // });
        //
        // function fn_success_excel(){
        //     console.log("fn_success_excel");
        // }
        //
        // function fn_fail_excel(){
        //     console.log("fn_fail_excel");
        // }
        /*----------- 엑셀 ---------=*/

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

    function getImg(targetName) {
        var target = $("input[name="+targetName+"]");

        if(target.length <= 0 || target.val().length <= 0){
            alert("이미지 URL을 확인하여 주시기 바랍니다.");
            return false;
        }

        var imgUrl = target.val();
        $("#"+targetName+"Viewer").attr("src", imgUrl);
        $("#"+targetName+"Viewer").attr("onerror", "imgError(this.src)");
    }

    function imgError(imgURL) {
        if(imgURL.length > 0){
            alert("이미지 URL이 정상적이지 않습니다.\n입력 URL :" + imgURL);
        }
    }

</script>