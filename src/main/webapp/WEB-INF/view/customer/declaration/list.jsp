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
                            <button class="btn btn-default print-btn pull-right" type="button" id="excelDownBtn"><i class="fa fa-print"></i>Excel Print</button>
                        </span>
                    </div>
                </div>
            </div> <%-- #data table --%>
            <form id="declarationForm"></form>
        </div> <%-- #container fluid--%>
    </div> <%-- #page-wrapper --%>
</div> <%-- #wapper --%>

<script type="text/javascript" src="/js/lib/jquery.table2excel.js"></script>
<script type="text/javascript" src="/js/code/customer/customerCodeList.js"></script>
<script>
    $(document).ready(function() {

        $('input[id="searchText"]').keydown(function(e) {    // textBox 처리
            if(e.keyCode == 13) {
                getDeclareInfo();
            };
        });

        $("#bt_search").click(function() {  // 버튼의 클릭이벤트
            getDeclareInfo();
        });

        getDeclareInfo();

    });

    init();
    /** Data Table **/
    function init() {

        var dtList_info_data = function ( data ) {
            data.search = $('#searchText').val();
        };

        dtList_info = new DalbitDataTable($("#list_info"), dtList_info_data, customerDataTableSource.DeclareList, $("#searchForm"));
        dtList_info.useCheckBox(true);
        dtList_info.useIndex(true);
        dtList_info.createDataTable();

        // 검색조건 불러오기
        $("#search_search_type_aria").html(util.getCommonCodeSelect(-1, declaration_searchType));
        $("#search_slct_type_aria").html(util.getCommonCodeSelect(-1, declaration_slctType));
        $("#search_reason_aria").html(util.getCommonCodeSelect(-1, declaration_reason));

    }

    function getDeclareInfo() {
        dtList_info.reload();

        /*검색결과 영역이 접혀 있을 시 열기*/
        ui.toggleSearchList();
    }

    $(document).on('click', '._getDeclarationDetail', function() {
        var data = {
            'reportIdx' : $(this).data('idx')
        };
        util.getAjaxData("detail", "/rest/customer/declaration/detail", data, fn_detail_success);
    });

    $(document).on('click', '#list_info .dt-body-center input[type="checkbox"]', function() {
        if($(this).prop('checked')){
            $(this).parent().parent().find('._getDeclarationDetail').click();
        }
    });

    function fn_detail_success(dst_id, response) {
        var template = $('#tmp_declarationFrm').html();
        var templateScript = Handlebars.compile(template);
        var context = response.data;
        var html=templateScript(context);
        $("#declarationForm").html(html);
        $('#report_title').html("ㆍ신고시 캡쳐내용은 라이브 방송방 신고 시점을 기준으로 5분 이내의 채팅 내역 정보입니다. 신중히 확인 한 후 조치바랍니다.");
    }

    $(function() {
        $(".av nav-tabs nav-tabs-custom-colored active").click(function() {
            $("#" + $(this).data('id')).addClass('on');
        });
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

</script>

<script id="tmp_declarationFrm" type="text/x-handlebars-template">
    <div class="row col-lg-12 mt15">
        <div class="tab-pane fade in active" id="report_tab"><jsp:include page="../../customer/declaration/report.jsp"/></div>     <!-- 상세 -->
    </div>
</script>
