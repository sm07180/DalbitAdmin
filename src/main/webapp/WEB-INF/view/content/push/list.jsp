
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="main-header">
    <div id="page-wrapper">
        <!-- serachBox -->
        <form id="searchForm">
            <div class="row col-lg-12 form-inline">
                <div class="widget widget-table searchBoxArea">
                    <div class="widget-header searchBoxRow">
                        <h3 class="title"><i class="fa fa-search"></i>푸시검색</h3>
                        <div>
                            <span id="search_platform_aria"></span>
                            <%--<span id="search_gender_aria"></span>--%>
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
            <div id="pushList"><jsp:include page="/WEB-INF/view/content/push/pushList.jsp"/></div>          <!-- 푸시 -->
        </div>
    </div>
</div>
<div class="main-content" style="margin-top: 3px;">
    <!-- TAB -->
        <div name="main-content-div" id="pushListContent">
            <jsp:include page="pushTab.jsp"></jsp:include>
        </div>  <!-- 푸시 -->
    <!-- TAB END -->
</div>
<jsp:include page="/WEB-INF/view/common/util/select_BroadcastLiveList.jsp"></jsp:include>
<jsp:include page="/WEB-INF/view/common/util/select_memeberList.jsp"></jsp:include>


<script src="../../../js/lib/jquery.table2excel.js"></script>
<script type="text/javascript" src="/js/code/content/contentCodeList.js?${dummyData}"></script>
<script type="text/javascript" src="/js/code/broadcast/broadCodeList.js?${dummyData}"></script>

<script>
    $(document).ready(function() {
        init();
        initEvent();
    });

//=------------------------------ Init / Event--------------------------------------------

    function init() {
        //검색조건 불러오기
        $("#search_platform_aria").html(util.getCommonCodeSelect(-1, platform));
        // $("#search_gender_aria").html(util.getCommonCodeSelect(-1, gender));
        $("#search_searchType_aria").html(util.getCommonCodeSelect(-1, push_searchType));
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
    }


    // 검색
    function getItemInfo(){
        // var selectTabId = $("#headerTab").find(".active").find("a").prop("id").split("_")[1];
        var selectTabId = "pushList";
        console.log(selectTabId)
        var targetFnc = eval("fnc_"+selectTabId);

        /* 엑셀저장을 위해 조회조건 임시저장 */
        // tmp_search = $('#txt_search').val();
        // tmp_gubun = $("select[name='selectGubun']").val();

        // targetFnc.dtList_info.reload();
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

    function getImg(targetId) {
        var target = $("#"+targetId);

        if(target.length <= 0 || target.val().length <= 0){
            alert("이미지 URL을 확인하여 주시기 바랍니다.");
            return false;
        }

        var imgUrl = target.val();
        $("#"+targetId+"Viewer").attr("src", imgUrl);
        $("#"+targetId+"Viewer").attr("onerror", "imgError(this.src)");
    }

    function imgError(imgURL) {
        if(imgURL.length > 0){
            alert("이미지 URL이 정상적이지 않습니다.\n입력 URL :" + imgURL);
        }
    }

</script>