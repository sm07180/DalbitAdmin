<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dummyData"><%= java.lang.Math.round(java.lang.Math.random() * 1000000) %></c:set>

<div id="main-header">
    <div id="page-wrapper">
        <%--<div class="container-fluid">--%>
            <!-- serachBox -->
            <form id="searchForm">
                <div class="row col-lg-12 form-inline">
                    <div class="widget widget-table searchBoxArea">
                        <div class="widget-header searchBoxRow">
                            <h3 class="title"><i class="fa fa-search"></i>스플래시 검색</h3>
                            <div>
                                <span id="search_searchType_aria"></span>

                                <label><input type="text" class="form-control" id="txt_search" placeholder="검색할 정보를 입력하세요"></label>
                                <button type="button" class="btn btn-success" id="bt_search">검색</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            <!-- //serachBox -->

            <!-- DATA TABLE -->
            <div class="row col-lg-12 form-inline">
                <div class="widget widget-table" id="splashDataTable">
                    <div class="widget-header">
                        <h3><i class="fa fa-desktop"></i> 검색결과</h3>
                    </div>
                    <div class="widget-content">
                        <table id="list_info" class="table table-sorting table-hover table-bordered">
                            <thead>
                            </thead>
                            <tbody id="tableBody">
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!-- DATA TABLE END -->
        <%--</div>--%>

    </div>
</div>
<div class="main-content">
    <!-- TAB -->
    <jsp:include page="splashTab.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/view/common/util/select_memeberList.jsp"></jsp:include>
    <!-- TAB END -->
</div>

<script src="../../../js/lib/jquery.table2excel.js"></script>
<script type="text/javascript" src="/js/code/content/contentCodeList.js?${dummyData}"></script>
<script>
    $(document).ready(function() {
        init();
        initDataTable();
        initEvent();
    });

//=------------------------------ Init / Event--------------------------------------------

    function init() {
        //검색조건 불러오기
        $("#search_searchType_aria").html(util.getCommonCodeSelect(-1, push_searchType));
    }


    var dtList_info;
    function initDataTable(){
        //=---------- 푸시메시지 DataTable ----------
        var dtList_info_data = function ( data ) {
            data.search = $('#txt_search').val();                        // 검색명
            data.gubun = $("select[name='selectGubun']").val()
        };
        dtList_info = new DalbitDataTable($("#list_info"), dtList_info_data, SplashDataTableSource.splashList, $("#searchForm"));
        dtList_info.useCheckBox(true);
        dtList_info.useIndex(true);
        dtList_info.setEventClick(updateSplashInfo,4);
        dtList_info.createDataTable();

        // Button 추가
        var delBtn = '<input type="button" value="선택 삭제" class="btn btn-danger btn-sm" id="btn_delete" style="margin-right: 3px;"/>'
        var addBtn = '<input type="button" value="등록" class="btn btn-success btn-sm" id="btn_insert" style="margin-left: 3px;"/>'
        var excelBtn = '<button class="btn btn-default print-btn btn-sm" type="button" style="margin-left: 3px;"><i class="fa fa-print"></i>Excel Down</button>'

        $("#splashDataTable").find(".footer-left").append(delBtn);
        $("#splashDataTable").find(".top-right").append(addBtn);

        $("#splashDataTable").find(".footer-right").append(excelBtn);
        //---------- 푸시메시지 DataTable ----------=
    }


    function initEvent(){
        $('input[id="txt_search"]').keydown(function() {
            if (event.keyCode === 13) {
                getSplashInfo();
            };
        });

        $('#bt_search').click( function() {       //검색
            getSplashInfo();
        });

        $("#btn_insert").on("click", function () { //등록
            insertSplashInfo();
        });

        $("#btn_delete").on("click", function () { //삭제
            delSplashData();
        });
    }




//=------------------------------ Option --------------------------------------------

    // 등록
    function insertSplashInfo() {
        insertSplash();
        $("#tab_splashList").click();
        ui.unCheck('list_info');
    }

    // 삭제
    function delSplashData() {
        var checkDatas = dtList_info.getCheckedData();

        if(checkDatas.length <= 0){
            alert("삭제할 정보를 선택해주세요.");
            return false;
        }
        dalbitLog(checkDatas);
    }

    // 수정
    function updateSplashInfo(data) {
        updateSplash({
            splashIdx: data.rowNum
            ,column02: data.splash_col5
            ,column03: data.splash_col1
            ,column04: "제목"
            ,column05: "내용"
            ,column06: data.splash_col2
            ,column07: ""
            ,column08: "option5"
            ,column09: "#ffffff"
            ,column10: ""
            ,column11: "0"
            ,column12: "2020-03-04"
            ,column13: "00"
            ,column14: "00"
            ,column15: ""
            ,column16: data.splash_col6
        })

        $("#tab_splashList").click();
    }

    // 검색
    function getSplashInfo(){
        /* 엑셀저장을 위해 조회조건 임시저장 */
        // tmp_search = $('#txt_search').val();
        // tmp_gubun = $("select[name='selectGubun']").val();

        dtList_info.reload();

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
</script>