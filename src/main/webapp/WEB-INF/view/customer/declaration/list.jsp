<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="container-fluid">
            <!-- serachBox -->

                <div class="row col-lg-12 form-inline">
                    <div class="widget widget-table searchBoxArea">
                        <div class="widget-header searchBoxRow">
                            <h3 class="title"><i class="fa fa-search"></i>신고검색</h3>
                            <div>
                                <select class="form-control searchType" name="searchType">
                                    <option selected="selected">검색조건</option>
                                    <option value="9999">전체</option>
                                    <option value="1">회원 번호</option>
                                    <option value="2">User ID</option>
                                    <option value="3">User 닉네임</option>
                                </select>

                                <select class="form-control searchType" name="slctType">
                                    <option selected="selected">검색조건</option>
                                    <option value="9999">전체</option>
                                    <option value="0">미처리</option>
                                    <option value="1">경고</option>
                                    <option value="2">유지</option>
                                    <option value="3">1일 정지</option>
                                    <option value="4">3일 정지</option>
                                    <option value="5">5일 정지</option>
                                    <option value="6">7일 정지</option>
                                    <option value="7">15일 정지</option>
                                    <option value="8">30일 정지</option>
                                    <option value="9">강제 퇴장</option>
                                </select>

                                <select class="form-control searchType" name="sortReport">
                                    <option selected="selected">신고구분</option>
                                    <option value="9999">전체</option>
                                    <option value="0">사진 및 이미지</option>
                                    <option value="1">음란성</option>
                                    <option value="2">광고 및 상업성</option>
                                    <option value="3">욕설 및 비방성</option>
                                    <option value="4">기타</option>
                                </select>

                                <label><input type="text" class="form-control" name="txt_search" id="txt_search" placeholder="검색할 정보를 입력하세요"></label>
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

                        <span class="button_right">
                            <button class="btn btn-default print-btn" type="button"><i class="fa fa-print"></i>Excel Print</button>
                        </span>

                    </div>
                </div>
            </div> <%-- #data table --%>

            <div class="row col-lg-12 form-inline" id="declareDetail">
                <div class="widget-content">
                    <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist">
                        <li class="active"><a href="#reportDetail" role="tab" data-toggle="tab">상세정보</a></li>
                    </ul>
                    <div class="tab-content no-padding">
                        <div class="tab-pane fade in active" id="reportDetail"><jsp:include page="report.jsp"/></div>     <!-- 상세 -->
                    </div>
                </div>
            </div>
        </div> <%-- #container fluid--%>
    </div> <%-- #page-wrapper --%>
</div> <%-- #wapper --%>

<script>
    $(document).ready(function() {

       $('input[id="txt_search"]').keydown(function(e) {    // textBox 처리
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
    var dtList_info;
    //getChattingHistoryDetail();
    function init() {
        var dtList_info_data = function ( data ) {
            /* parameter */
            data.search = $('#txt_search').val()
            /*data.searchType=$("select[name='searchType']").val()
            data.slctType=$("select[name='slctType']").val()
            data.sortReport=$("select[name='sortReport']").val()*/
        };

        $('#report_title').html("ㆍ신고시 캡쳐내용은 라이브 방송방 신고 시점을 기준으로 5분 이내의 채팅 내역 정보입니다. 신중히 확인 한 후 조치바랍니다.");

        // console.log(customerDataTableSource);
        dtList_info = new DalbitDataTable($("#list_info"), dtList_info_data, customerDataTableSource.DeclareList);
        dtList_info.useCheckBox(true);
        dtList_info.useIndex(true);
        dtList_info.createDataTable();
    }

    function getUser_detail(index){
        console.log("@@@@@    사용자 ID 클릭");
    }
    function getDeclare_detail(index){
        console.log("@@@@@    처리상태 클릭");
        var data = dtList_info.getDataRow(index);
        report_roomNo = data.roomNo;
        report_memNo = data.memNo;
        getChattingHistoryDetail();
    }


    function getDeclareInfo() {
        dtList_info.reload();

        /*검색결과 영역이 접혀 있을 시 열기*/
        var toggleIcon = $('#_searchToggleIcon');
        if(toggleIcon.hasClass('fa-chevron-down')){
            toggleIcon.click();
        }
    }


    $(function() {
        $(".av nav-tabs nav-tabs-custom-colored active").click(function() {
            $("#" + $(this).data('id')).addClass('on');
        });
    });


</script>