<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    .text_center{
        text-align: center;
    }
    .middle{
        display:table-cell;
        vertical-align:middle;
    }
    .lb_style{
        border: 1px solid #DDDDDD;
        background-color: #DCE6F2;
        height: 34px;
    }
</style>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="row col-lg-12 form-inline">
                <div class="col-md-12" style="background: #DCE6F2;height: 40px;">
                    <label style="font-weight: bold;color: #000000;">공지검색&nbsp;&nbsp;</label>
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
                    <button type="submit" class="btn btn-default" id="bt_search">검색</button>
                </div>
            </div>
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

            <!-- ###################################################################### -->
            <div class="row col-lg-12 form-inline">
                <div class="col-md-12 no-padding">
                    <label id="notice_title"></label>
                </div>


            </div>
            <!-- ################################################################# -->
                <div class="row">
                    <div class="col-md-12" style="height: 170px; padding-top:10px;"><textarea id="notice" style="width: 100%; height: 100%"></textarea></div>
                </div>
            </div>

        </div>
    </div>
</div>

<script src="../../../js/lib/jquery.table2excel.js"></script>

<script>
    $(document).ready(function() {

        $('input[id="txt_search"]').keydown(function() {
            if (event.keyCode === 13) {
                getPushInfo();
            };
        });

        $('#bt_search').click( function() {       //검색
            getPushInfo();
        });
    });

    $('#notice_title').html("ㆍ선택한 공지사항을 자세히 확인하고 수정할 수 있습니다.<br> ㆍ공지내용 수정 또는 등록 후 게시상태를 ON으로 선택한 후 등록을 완료하여야 공지 내용이 게시됩니다.");

    init();
    function init(){
        var dtList_info_data = function ( data ) {
            data.search = $('#txt_search').val();                        // 검색명
            data.gubun = $("select[name='selectGubun']").val()
        };

        dtList_info = new DalbitDataTable($("#list_info"), dtList_info_data, PushDataTableSource.pushInfo);
        dtList_info.useCheckBox(true);
        dtList_info.useIndex(true);
        dtList_info.setEventClick(updataPushInfo,4);
        dtList_info.createDataTable();
    }

    function updataPushInfo() {
        alert("test");
    }

    // 검색
    function getPushInfo(){
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