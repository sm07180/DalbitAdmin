<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="container-fluid">
            <!-- serachBox -->
            <form id="searchForm">
                <div class="row col-lg-12 form-inline">
                    <div class="widget widget-table searchBoxArea">
                        <div class="widget-header searchBoxRow">
                            <h3 class="title"><i class="fa fa-search"></i>신고검색</h3>
                            <div>
                                <span id="search_search_type_aria"></span>
                                <span id="search_slct_type_aria"></span>
                                <span id="search_reason_aria"></span>
                                <span name="question_platform" id="question_platform"></span>
                                <label><input type="text" class="form-control" name="searchText" id="searchText" placeholder="검색할 정보를 입력하세요"></label>
                                <button type="button" class="btn btn-success" id="bt_search">검색</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            <!-- //serachBox -->

            <!-- DATA TABLE -->
            <div class="row col-lg-12 form-inline">
                <div class="widget widget-table">
                    <div class="widget-header">
                        <h3><i class="fa fa-desktop"></i> 검색결과</h3>
                        <div class="btn-group widget-header-toolbar">
                            <a href="#" title="열기/닫기" class="btn-borderless btn-toggle-expand">
                                <i class="fa fa-chevron-up" id="_searchToggleIcon"></i>
                            </a>
                        </div>
                    </div>
                    <div class="widget-content">
                        <table class="table table-bordered table-summary pull-right" id="declarationSummary">
                            <thead>
                                <tr>
                                    <th rowspan="2">미처리 건</th>
                                    <th colspan="7">제재조치</th>
                                    <th rowspan="2">누적 처리 건</th>
                                </tr>
                                <tr>
                                    <th>정상 건</th>
                                    <th>경고 건</th>
                                    <th>1일 건</th>
                                    <th>3일 건</th>
                                    <th>7일 건</th>
                                    <th>영구정지 건</th>
                                    <th>강제탈퇴 건</th>
                                </tr>
                            </thead>
                            <tbody id="summaryDataTable">

                            </tbody>
                        </table>


                        <table id="list_info" class="table table-sorting table-hover table-bordered">
                            <thead>
                            </thead>
                            <tbody id="tableBody">
                            </tbody>
                        </table>
                        <span>
                            <button class="hidden">111</button>
                        </span>

                    </div>
                    <div class="widget-footer">
                        <span>
                            <button class="btn btn-default print-btn pull-right" type="button" id="excelDownBtn"><i class="fa fa-print"></i>Excel Down</button>
                        </span>
                    </div>
                </div>
            </div> <%-- #data table --%>

            <div class="row col-lg-12 mt15">
                <div class="tab-pane fade in active" id="report_tab">
                    <!-- 상세 -->
                    <jsp:include page="../../customer/declaration/report.jsp"/>
                </div>
            </div>
        </div> <%-- #container fluid--%>
    </div> <%-- #page-wrapper --%>
</div> <%-- #wapper --%>

<script type="text/javascript" src="/js/lib/jquery.table2excel.js"></script>
<script type="text/javascript" src="/js/code/customer/customerCodeList.js?${dummyData}"></script>
<script type="text/javascript" src="/js/code/customer/questionCodeList.js?${dummyData}"></script>
<script type="text/javascript">
    var dtList_info;

    $(document).ready(function() {
        init();
        ui.checkBoxInit('list_info');
    });

    /** Data Table **/
    var tmp_searchText = null;
    var tmp_searchType = null;
    var tmp_slctType = null;
    var tmp_slctReason = null;
    var tmp_slctPlatform = null;
    function init() {

        util.getAjaxData("summary", "/rest/customer/declaration/opCount", "", fn_success);


        var dtList_info_data = function ( data ) {
            data.searchText = tmp_searchText;
            data.searchType = tmp_searchType;
            data.slctType = tmp_slctType;
            data.slctReason = tmp_slctReason;
            data.strPlatform = tmp_slctPlatform;
        };
        dtList_info = new DalbitDataTable($("#list_info"), dtList_info_data, customerDataTableSource.DeclareList);
        dtList_info.useCheckBox(true);
        dtList_info.useIndex(true);
        dtList_info.createDataTable();

        // 검색조건 불러오기
        $("#search_search_type_aria").html(util.getCommonCodeSelect(-1, declaration_searchType));
        $("#search_slct_type_aria").html(util.getCommonCodeSelect(-1, declaration_slctType));
        $("#search_reason_aria").html(util.getCommonCodeSelect(-1, declaration_reason));
        $("#question_platform").html(util.getCommonCodeSelect(-1, question_platform));

        getDeclareInfo();

    }

    $(".av nav-tabs nav-tabs-custom-colored active").on('click', function() {
        $("#" + $(this).data('id')).addClass('on');
    });

    $('input[id="searchText"]').on('keydown', function(e) {    // textBox 처리
        if(e.keyCode == 13) {
            getDeclareInfo();
        };
    });

    $("#bt_search").on('click', function() {  // 버튼의 클릭이벤트
        getDeclareInfo();
    });

    function getDeclareInfo() {
        tmp_searchText = $('#searchText').val();
        tmp_searchType = $("select[name='searchType']").val();
        tmp_slctType  = $("select[name='slctType']").val();
        tmp_slctReason  = $("select[name='slctReason']").val();
        tmp_slctPlatform  = $("select[name='platform']").val();

        dtList_info.reload();

        /*검색결과 영역이 접혀 있을 시 열기*/
        ui.toggleSearchList();
        $("#declarationForm").empty();
    }

    // $(document).on('click', '._getDeclarationDetail', function() {
    //     $('#report_tab').addClass("show");
    //
    //     console.log($(this).data('rowNum'));
    //     var data = {
    //         'reportIdx' : $(this).data('idx')
    //     };
    //     util.getAjaxData("detail", "/rest/customer/declaration/detail", data, fn_detail_success);
    // });

    function getDeclarationDetail(index){
        var data = dtList_info.getDataRow(index);

        var obj = {};
        obj.reportIdx = data.reportIdx;
        obj.rowNum = data.rowNum;

        util.getAjaxData("detail", "/rest/customer/declaration/detail", obj, fn_detail_success);
    }

    $(document).on('click', '#list_info .dt-body-center input[type="checkbox"]', function() {
        if($(this).prop('checked')){
            $(this).parent().parent().find('._getDeclarationDetail').click();
        } else {
            $("#declarationForm").empty();
        }
    });

    // /*=---------- 엑셀 ----------*/
    $('#excelDownBtn').on('click', function(){

        var formElement = document.querySelector("form");
        var formData = new FormData(formElement);

        util.excelDownload($(this), "/rest/customer/declaration/listExcel", formData, fn_success_excel)
    });

    $("#excelBtn").on("click", function () {
        $("#list_info").table2excel({
            exclude: ".noExl",
            name: "Excel Document Name",
            filename: "report" +'.xls', //확장자를 여기서 붙여줘야한다.
            fileext: ".xls",
            exclude_img: true,
            exclude_links: true,
            exclude_inputs: true
        });
    });

    function fn_success_excel(){
        console.log("fn_success_excel");
    }
    /*----------- 엑셀 ---------=*/



    function fn_success(dst_id, response) {
        dalbitLog(response);
        var template = $('#tmp_declarationSummary').html();
        var templateScript = Handlebars.compile(template);
        var context = response;
        var html = templateScript(context);

        $("#summaryDataTable").append(html);
    }

</script>

<script id="tmp_declarationSummary" type="text/x-handlebars-template">
    {{#data}}
    <tr>
        <td>{{addComma notOpCnt}}건</td> <%--미처리--%>
        <td>{{addComma code_1_Cnt}}건</td> <%--정상--%>
        <td>{{addComma code_2_Cnt}}건</td> <%--경고--%>
        <td>{{addComma code_3_Cnt}}건</td> <%--1일 정지--%>
        <td>{{addComma code_4_Cnt}}건</td> <%--3일 정지--%>
        <td>{{addComma code_5_Cnt}}건</td> <%--7일 정지--%>
        <td>{{addComma code_6_Cnt}}건</td> <%--영구 정지 --%>
        <td>{{addComma code_7_Cnt}}건</td> <%--강제 탈퇴--%>
        <td>{{addComma allOpCnt}}건</td>
    </tr>
    {{/data}}
</script>