<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="container-fluid">
            <!-- serachBox -->
            <div class="row col-lg-12 form-inline">
                <div class="widget widget-table searchBoxArea">
                    <div class="widget-header searchBoxRow">
                        <h3 class="title"><i class="fa fa-search"></i> 공지검색</h3>
                        <div>
                            <select class="form-control" name="selectType">
                                <option value="9999" selected="selected">전체▼</option>
                                <option value="1">공지제목</option>
                                <option value="2">내용</option>
                                <option value="3">작성자</option>
                            </select>

                            <select class="form-control" name="noticeType">
                                <option value="9999" selected="selected">전체▼</option>
                                <option value="1">서비스공지</option>
                                <option value="2">긴급공지</option>
                                <option value="3">이벤트</option>
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
                    </div>
                </div>
            </div>
            <!-- #DataTable -->

            <div class="row col-lg-12 form-inline">
                <div class="col-md-12 no-padding">
                    <label id="notice_title"></label>
                </div>
                <div class="row col-md-12">
                    <div class="col-md-2 no-padding">
                        <div class="col-md-5 lb_style"><label>No</label></div>
                        <div class="col-md-7" style="height: 34px;"><label>41</label></div>
                        <div class="col-md-5 lb_style"><label>플랫폼</label></div>
                        <div class="col-md-7" style="height: 34px;"><label>
                            <select class="form-control" name="platformType">
                                <option value="1">Android</option>
                                <option value="2">IOS</option>
                                <option value="3">PC</option>
                            </select>
                        </label></div>
                    </div>

                    <div class="col-md-2 no-padding">
                        <div class="col-md-4 lb_style"><label>구분</label></div>
                        <div class="col-md-8" style="height: 34px;"><label>
                            <select class="form-control" name="noticeType">
                                <option value="1">서비스공지</option>
                                <option value="2">긴급공지</option>
                                <option value="3">이벤트</option>
                            </select>
                        </label></div>
                        <div class="col-md-4 lb_style"><label>성별</label></div>
                        <div class="col-md-8" style="height: 34px;"><label>
                            <select class="form-control" name="genderType">
                                <option value="1">여자</option>
                                <option value="2">남자</option>
                            </select>
                        </label></div>
                    </div>

                    <div class="col-md-2 no-padding">
                            <div class="col-md-6 lb_style" style="width:64px; height: 68px;"><label>제목</label></div>
                            <div class="col-md-6" style="height: 68px;"><label>
                               달빛라디오 돈 대박 벌었다
                            </label></div>
                    </div>
                    <div class="col-md-2 no-padding">
                        <div class="col-md-5 lb_style"><label>등록일시</label></div>
                        <div class="col-md-7" style="height: 34px;"><label>YY.MM.DD</label></div>
                        <div class="col-md-5 lb_style"><label>게시 중지일시</label></div>
                        <div class="col-md-7" style="height: 34px;"><label>YY.MM.DD</label></div>
                    </div>
                    <div class="col-md-2 no-padding">
                        <div class="col-md-5 lb_style"><label>조회수</label></div>
                        <div class="col-md-7" style="height: 34px;"><label>OO</label></div>
                        <div class="col-md-5 lb_style"><label>등록/수정처리자</label></div>
                        <div class="col-md-7" style="height: 34px;"><label>처리자ID</label></div>
                    </div>
                    <div class="col-md-2 no-padding">
                            <div class="col-md-6 lb_style" style="width:64px; height:68px"><label>게시상태</label></div>
                            <div class="col-md-6" style="height: 68px;"><label>OFF</label></div>
                    </div>
                </div>
            </div>

            <div class="row col-lg-12 form-inline area_style">
                <textarea id="notice" style="width: 100%; height: 100%"
                 placeholder="달빛라디오가 오픈한지 한달여만에 대박을 쳤습니다."></textarea></div>
            </div>
        </div>
    </div>
</div>

<script src="../../../js/lib/jquery.table2excel.js"></script>

<script>
    $(document).ready(function() {

        $('input[id="txt_search"]').keydown(function() {
            if (event.keyCode === 13) {
                getNoticeInfo();
            };
        });

        $('#bt_search').click( function() {       //검색
            getNoticeInfo();
        });

    });

    $('#notice_title').html("ㆍ선택한 공지사항을 자세히 확인하고 수정할 수 있습니다.<br> ㆍ공지내용 수정 또는 등록 후 게시상태를 ON으로 선택한 후 등록을 완료하여야 공지 내용이 게시됩니다.");

    init();
    function init(){
        var dtList_info_data = function ( data ) {
            data.search = $('#txt_search').val();                        // 검색명
            data.gubun = $("select[name='selectGubun']").val()
        };

        dtList_info = new DalbitDataTable($("#list_info"), dtList_info_data, NoticeDataTableSource.noticeInfo);
        dtList_info.useCheckBox(true);
        dtList_info.useIndex(true);
        dtList_info.setEventClick(updataPushInfo,4);
        dtList_info.createDataTable();
    }

    function updataPushInfo() {
        alert("test");
    }

    // 검색
    function getNoticeInfo(){
        /* 엑셀저장을 위해 조회조건 임시저장 */
        // tmp_search = $('#txt_search').val();
        // tmp_gubun = $("select[name='selectGubun']").val();

        dtList_info.reload();

        /*검색결과 영역이 접혀 있을 시 열기*/
        var toggleIcon = $('#_searchToggleIcon');
        if(toggleIcon.hasClass('fa-chevron-down')){
            toggleIcon.click();
        }
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