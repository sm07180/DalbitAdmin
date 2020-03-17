<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="container-fluid">
            <!-- serachBox -->
            <div class="row col-lg-12 form-inline">
                <div class="widget widget-table searchBoxArea">
                    <div class="widget-header searchBoxRow">
                        <h3 class="title"><i class="fa fa-search"></i> 회원 검색</h3>
                        <div>
                            <select class="form-control searchType" name="selectProStatus">
                                <option value="9999" selected="selected">처리상태(전체)</option>
                                <option value="1">미처리</option>
                                <option value="2">유지</option>
                                <option value="3">1일정지</option>
                                <option value="4">3일정지</option>
                                <option value="5">5일정지</option>
                                <option value="6">7일정지</option>
                                <option value="7">15일정지</option>
                                <option value="8">30일정지</option>
                                <option value="9">강제퇴장</option>
                            </select>

                            <select class="form-control searchType" name="selectGubun">
                                <option value="9999" selected="selected">전체</option>
                                <option value="1">User ID</option>
                                <option value="2">User 닉네임</option>
                                <option value="3">연락처</option>
                                <option value="4">이름</option>
                            </select>

                            <label><input type="text" class="form-control" id="txt_search" placeholder="검색할 정보를 입력하세요"></label>
                            <button type="submit" class="btn btn-success" id="bt_search">검색</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- //serachBox -->
            <!-- DATA TABLE -->
            <div class="row col-lg-12 form-inline">
                <div class="widget widget-table">
                    <div class="widget-header">
                        <h3><i class="fa fa-desktop"></i> 1:1 문의</h3>
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
                    </div>
                </div>
            </div>
            <!-- DATA TABLE END -->
            <!-- TAB -->
            <div class="no-padding">
                <jsp:include page="questionTab.jsp"></jsp:include>
            </div>
            <!-- TAB END -->
        </div>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function() {

        // $("#detail").load("infoDetail.jsp");

        $('input[id="txt_search"]').keydown(function(e) {
            if (e.keyCode === 13) {
                getUserInfo();
            };
        });

        <!-- 버튼 -->
        $('#bt_search').click( function() {       //검색
            getUserInfo();
        });
        <!-- 버튼 끝 -->
    });
    $('#one_title').html("ㆍ회원의 1:1문의 내용을 확인하고, 답변 및 처리할 수 있습니다. 신중히 확인 한 후 답변바랍니다.");

    var tab_id = "false";
    init();
    function init(){
        var dtList_info_data = function ( data ) {
            data.search = $('#txt_search').val();                        // 검색명
            data.gubun = $("select[name='selectGubun']").val();
        };
        dtList_info = new DalbitDataTable($("#list_info"), dtList_info_data, customerDataTableSource.processingStatusHistory);
        dtList_info.useCheckBox(true);
        dtList_info.useIndex(true);
        // dtList_info.setEventClick(test01,0);
        dtList_info.createDataTable();
    }
    // function test01(t1, t2 ,t3) {
    //     dalbitLog(t1)   //
    // }

    function getUserInfo(){                 // 검색
        /* 엑셀저장을 위해 조회조건 임시저장 */
        tmp_search = $('#txt_search').val();
        tmp_gubun = $("select[name='selectGubun']").val();

        dtList_info.reload();

        /*검색결과 영역이 접혀 있을 시 열기*/
        ui.toggleSearchList();
    }

    /*=============엑셀==================*/
    $('#excelDownBtn').on('click', function(){
        var formElement = document.querySelector("form");
        var formData = new FormData(formElement);

        formData.append("search", tmp_search);
        formData.append("date", tmp_date);
        formData.append("gubun", tmp_gubun);
        formData.append("checkDate", tmp_checkDate);
        formData.append("stDate", tmp_stDate);
        formData.append("edDate", tmp_edDate);
        /*formData.append("test003", "test003");*/
        util.excelDownload($(this), "/rest/member/member/listExcel", formData, fn_success_excel)
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

    /*==================================*/
</script>