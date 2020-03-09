<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    .button_right{
        float: right;
        white-space:nowrap;
    }
</style>
<div id="wrapper">
    <div id="page-wrapper">
        <div class="container-fluid">
            <!-- serachBox -->
            <form id="searchForm">
                <div class="row col-lg-12 form-inline">
                    <div class="widget widget-table searchBoxArea">
                        <div class="widget-header searchBoxRow">
                            <h3 class="title"><i class="fa fa-search"></i> 공지검색</h3>
                            <div>
                                <select class="form-control" name="platform">
                                    <option value="9999">전체 ▼</option>
                                    <option value="1">PC</option>
                                    <option value="2">Android-Mobile</option>
                                    <option value="3">IOS-Mobile</option>
                                    <option value="4">Web-Mobile</option>
                                </select>

                                <select class="form-control" name="selectType">
                                    <option value="-1" selected="selected">전체▼</option>
                                    <option value="1">공지제목</option>
                                    <option value="2">내용</option>
                                    <option value="3">작성자</option>
                                </select>

                                <select class="form-control" name="slctType">
                                    <option value="-1" selected="selected">전체▼</option>
                                    <option value="1">서비스공지</option>
                                    <option value="2">이벤트</option>
                                    <option value="3">정기점검</option>
                                    <option value="4">업데이트</option>
                                </select>

                                <select class="form-control" name="viewOn">
                                    <option value="-1" selected="selected">전체▼</option>
                                    <option value="1">ON</option>
                                    <option value="0">OFF</option>
                                </select>

                                <label><input type="text" class="form-control" name="searchText" id="searchText" placeholder="검색할 정보를 입력하세요"></label>
                                <button type="button" class="btn btn-success" id="bt_search">검색</button>
                            </div>
                        </div>
                    </div>
                </div>
                <input type="text" id="dummy" style="display:none;">
            </form>
            <!-- //serachBox -->
            <div class="row col-lg-12 form-inline" id="insertBtnDiv">
                <button type="button" class="btn btn-default button_right" id="bt_insert">등록</button>
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
                        <span>
                            <button class="btn btn-default" type="button">선택삭제</button>
                        </span>
                        <span class="button_right">
                            <button class="btn btn-default print-btn" type="button"><i class="fa fa-print"></i>Excel Print</button>
                        </span>
                    </div>
                </div>
            </div>
            <!-- #DataTable -->

            <form id="noticeForm"></form>
        </div>
    </div>
</div>

<script src="/js/lib/jquery.table2excel.js"></script>

<script>
    $(document).ready(function() {

        /* summernote */
        var targetEditor = $('.summernote');

        targetEditor.summernote({
            height: 300,
            focus: true,
            // onpaste: function() {
            //     alert('You have pasted something to the editor');
            // },
            callbacks: { // 콜백을 사용
                // 이미지를 업로드할 경우 이벤트를 발생.
                onImageUpload: function (files, editor, welEditable) {
                    console.log("[onImageUpload]")

                    var formData = new FormData();
                    formData.append("file", files[0]);
                    // TODO  업로드 타입은 상황에 맞게 수정 부탁드립니다.
                    formData.append("uploadType", "bg");
                    fileUpdate("https://devphoto2.dalbitcast.com/upload", formData, function (data) {
                        var json = jQuery.parseJSON(data);
                        console.log(json);
                        if (json.code != "0") {
                            alert(json.message);
                            return;
                        }

                        // UPLOAD IMAGE URL 적용
                        var imgURL = json.data.url;
                        targetEditor.summernote('editor.insertImage', imgURL);
                    });
                }
            }
        });

        $('input[id="searchText"]').keydown(function(e) {
            if (e.keyCode === 13) {
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
            data.search = $('#searchText').val();                       // 검색명
            data.gubun = $("select[name='selectGubun']").val()
        };

        dtList_info = new DalbitDataTable($("#list_info"), dtList_info_data, NoticeDataTableSource.noticeInfo, $("#searchForm"));
        dtList_info.useCheckBox(true);
        dtList_info.useIndex(true);
        dtList_info.createDataTable();
    }

    $("#bt_insert").on("click", function(){
        insert();
    });

    function insert() {
        var template = $('#tmp_noticeFrm').html();
        var templateScript = Handlebars.compile(template);
        $("#noticeForm").html(templateScript);
    }

    // 상세조회
    function getNotice_detail(index) {
        var data = dtList_info.getDataRow(index);
        var obj = new Object();
        obj.noticeIdx = data.noticeIdx;

        getAjaxData("detail", "/rest/content/notice/detail", obj, fn_detail_success, fn_detail_fail);

    }

    function fn_detail_success(dst_id, response) {
        dalbitLog('fn_detail_success');
        dalbitLog(response);
        // form 띄우기
        var template = $('#tmp_noticeFrm').html();
        var templateScript = Handlebars.compile(template);
        var context = response.data;
        var html = templateScript(context);
        $("#noticeForm").html(html);

    }

    function fn_detail_fail(data, textStatus, jqXHR){
        console.log(data, textStatus, jqXHR);
    }

    function isValid(){

        var slctType = $("#slctType");
        if(isEmpty(slctType.val())){
            alert("구분을 선택해주세요.");
            slctType.focus();
            return false;
        }

        var title = $("#title");
        if(isEmpty(title.val())){
            alert("제목을 입력해주세요.");
            title.focus();
            return false;
        }

        var contents = $("#contents");
        if(isEmpty(contents.val())){
            alert("내용을 입력해주세요.");
            contents.focus();
            return false;
        }

        return true;
    }

    $(document).on('click', '#insertBtn', function(){
        if(isValid()){
            getAjaxData("insert", "/rest/content/notice/insert", $("#noticeForm").serialize(), fn_insert_success, fn_insert_fail);
        }
    });

    function fn_insert_success(dst_id, response) {
        dalbitLog(response);
        alert(response.message);
        insert();
    }
    function fn_insert_fail(data, textStatus, jqXHR) {
        console.log(data, textStatus, jqXHR);
    }

    $(document).on('click', '#updateBtn', function(){

        if(isValid()){
            getAjaxData("update", "/rest/content/notice/update", $("#noticeForm").serialize(), fn_update_success, fn_update_fail);
        }
    });

    function fn_update_success(dst_id, response) {
        dalbitLog(response);
        alert(response.message);
        insert();
    }
    function fn_update_fail(data, textStatus, jqXHR) {
        console.log(data, textStatus, jqXHR);
    }


    // 검색
    function getNoticeInfo(){
        /* 엑셀저장을 위해 조회조건 임시저장 */
        // tmp_search = $('#searchText').val();
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

<script id="tmp_noticeFrm" type="text/x-handlebars-template">
    <input type="hidden" name="noticeIdx" value="{{noticeIdx}}" />
    <div class="row col-lg-12 form-inline">
        <div class="col-md-12 no-padding">
            <label id="notice_title">ㆍ선택한 공지사항을 자세히 확인하고 수정할 수 있습니다.<br> ㆍ공지내용 수정 또는 등록 후 게시상태를 ON으로 선택한 후 등록을 완료하여야 공지 내용이 게시됩니다.</label>
            <span class="button_right">
                <button class="btn btn-default" type="button" id="insertBtn">등록하기</button>
                <button class="btn btn-default" type="button" id="updateBtn">수정하기</button>
            </span>
        </div>
        <div class="row col-md-12">
            <div class="col-md-2 no-padding">
                <div class="col-md-5 lb_style"><label>No</label></div>
                <div class="col-md-7" style="height: 34px;"><label id="no">{{noticeIdx}}</label></div>
                <div class="col-md-5 lb_style"><label>플랫폼</label></div>
                <div class="col-md-7" style="height: 34px;"><label id="platform">{{platform}}</label></div>
            </div>

            <div class="col-md-2 no-padding">
                <div class="col-md-4 lb_style"><label>구분</label></div>
                <div class="col-md-8" style="height: 34px;"><label id="sort"><input type="text" name="slctType" id="slctType" value="{{slctType}}"></label></div>
                <div class="col-md-4 lb_style"><label>성별</label></div>
                <div class="col-md-8" style="height: 34px;">
                    <label>
                        <select class="form-control" name="genderType">
                            <option value="1">여자</option>
                            <option value="2">남자</option>
                        </select>
                    </label>
                </div>
            </div>

            <div class="col-md-2 no-padding">
                <div class="col-md-6 lb_style" style="width:64px; height: 68px;"><label>제목</label></div>
                <div class="col-md-6" style="height: 68px;">
                    <label id="title_label"><input type="text" name="title" id="title" value="{{title}}"></label>
                </div>
            </div>

            <div class="col-md-2 no-padding">
                <div class="col-md-5 lb_style"><label>등록일시</label></div>
                <div class="col-md-7" style="height: 34px;"><label id="regDate">{{writeDate}}</label></div>
                <div class="col-md-5 lb_style"><label>게시 중지일시</label></div>
                <div class="col-md-7" style="height: 34px;"><label id="stopDate">-</label></div>
            </div>

            <div class="col-md-2 no-padding">
                <div class="col-md-5 lb_style"><label>조회수</label></div>
                <div class="col-md-7" style="height: 34px;"><label id="cnt">{{viewCnt}}</label></div>
                <div class="col-md-5 lb_style"><label>등록/수정처리자</label></div>
                <div class="col-md-7" style="height: 34px;"><label id="processor">-</label></div>
            </div>

            <div class="col-md-2 no-padding">
                <div class="col-md-6 lb_style" style="width:64px; height:68px"><label>게시상태</label></div>
                <div class="col-md-6" style="height: 68px;"><label id="status">-</label></div>
            </div>
        </div>
    </div>

    <div class="row col-lg-12 form-inline area_style">
        <div class="widget">
            <div class="widget-header">
                <h3><i class="fa fa-user"></i> 내용 </h3>
            </div>
            <textarea class="code" style="width: 100%; height: 300px" name="contents" id="contents">{{contents}}</textarea>
        </div>
    </div>

</script>