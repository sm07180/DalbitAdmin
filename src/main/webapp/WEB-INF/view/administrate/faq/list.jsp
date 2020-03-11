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
                            <h3 class="title"><i class="fa fa-search"></i> FAQ 검색</h3>
                            <div>
                                <span id="search_searchType_aria"></span>
                                <span id="search_slctType_aria"></span>

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
                <label id="faq_title">ㆍ검색결과 내 질문을 클릭하면 해당 상세정보를 확인할 수 있습니다.</label>
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
                            <button class="btn btn-default" type="button" id="bt_delete">선택삭제</button>
                        </span>
                        <span class="button_right">
                            <button class="btn btn-default print-btn" type="button"><i class="fa fa-print"></i>Excel Print</button>
                        </span>
                    </div>
                </div>
            </div>
            <!-- #DataTable -->

            <form id="faqForm"></form>
        </div>
    </div>
</div>

<script type="text/javascript" src="/js/lib/jquery.table2excel.js"></script>
<script type="text/javascript" src="/js/code/administrate/adminCodeList.js"></script>
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
                    fileUpdate(IMAGE_SERVER_URL + "/upload", formData, function (data) {
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
                getFaqInfo();
            };
        });

        $('#bt_search').click( function() {       //검색
            getFaqInfo();
        });

    });

    var dtList_info;
    var dtList_info_data = function ( data ) {
        data.search = $('#searchText').val();                       // 검색명
        data.gubun = $("select[name='selectGubun']").val()
    };

    dtList_info = new DalbitDataTable($("#list_info"), dtList_info_data, FaqDataTableSource.faqInfo, $("#searchForm"));
    dtList_info.useCheckBox(true);
    dtList_info.useIndex(true);
    dtList_info.createDataTable();

    //검색조건 불러오기
    $("#search_searchType_aria").html(getCommonCodeSelect(-1, faq_searchType));
    $("#search_slctType_aria").html(getCommonCodeSelect(-1, faq_slctType));

    init();

    function init(){
    }

    $("#bt_insert").on("click", function(){
        insert();
    });

    function insert() {
        var template = $('#tmp_faqFrm').html();
        var templateScript = Handlebars.compile(template);
        $("#faqForm").html(templateScript);
        $("#viewOn").html(getCommonCodeRadio('1', viewOn,"Y"));
        getFaqInfo();
    }

    // 상세조회
    // function getFaq_detail(index) {
    //     var data = dtList_info.getDataRow(index);
    //     var obj = new Object();
    //     obj.faqIdx = data.faqIdx;
    //
    //     getAjaxData("detail", "/rest/administrate/faq/detail", obj, fn_detail_success, fn_detail_fail);
    //
    // }
    $(document).on('click', '._getFaqDetail', function(){
        var data = {
            'faqIdx' : $(this).data('idx')
        };
        getAjaxData("detail", "/rest/administrate/faq/detail", data, fn_detail_success, fn_detail_fail);
    });

    $(document).on('click', '#list_info .dt-body-center input[type="checkbox"]', function(){
        if($(this).prop('checked')){
            $(this).parent().parent().find('._getFaqDetail').click();
        }
    });

    function fn_detail_success(dst_id, response) {
        dalbitLog('fn_detail_success');
        dalbitLog(response);
        // form 띄우기
        var template = $('#tmp_faqFrm').html();
        var templateScript = Handlebars.compile(template);
        var context = response.data;
        var html = templateScript(context);
        $("#faqForm").html(html);
        $("#viewOn").html(getCommonCodeRadio(response.data.viewOn, viewOn,"Y"));
    }

    function fn_detail_fail(data, textStatus, jqXHR){
        console.log(data, textStatus, jqXHR);
    }

    function isValid(){
        var slctType_detail = $("#faqForm #slctType_detail");
        if(isEmpty(slctType_detail.val())){
            alert("구분을 선택해주세요.");
            slctType_detail.focus();
            return false;
        }

        var question = $("#faqForm #question");
        if(isEmpty(question.val())){
            alert("질문을 입력해주세요.");
            question.focus();
            return false;
        }

        var answer = $("#faqForm #answer");
        if(isEmpty(answer.val())){
            alert("답변을 입력해주세요.");
            answer.focus();
            return false;
        }
        return true;
    }

    $(document).on('click', '#insertBtn', function(){
        var str = $("#faqForm").serialize();
        console.log("str : " + str);
        if(isValid()){
            getAjaxData("insert", "/rest/administrate/faq/insert", $("#faqForm").serialize(), fn_insert_success, fn_insert_fail);
        }
    });

    function fn_insert_success(dst_id, response) {
        dalbitLog(response);
        // alert(response.message);
        insert();
    }
    function fn_insert_fail(data, textStatus, jqXHR) {
        console.log(data, textStatus, jqXHR);
    }

    $(document).on('click', '#updateBtn', function(){
        if(isValid()){
            getAjaxData("update", "/rest/administrate/faq/update", $("#faqForm").serialize(), fn_update_success, fn_update_fail);
        }
    });

    $(document).on('click', '#bt_delete', function() {
        var checked = $('#list_info .dt-body-center input[type="checkbox"]:checked');
        if(checked.length == 0){
            alert('삭제할 FAQ를 선택해주세요.');
            return;
        }
        var faqIdxs = '';
        checked.each(function(){
            faqIdxs += $(this).parent().parent().find('._getFaqDetail').data('idx') + ",";
        });
        var data = {
            faqIdxs : faqIdxs
        }
        dalbitLog(data);

        getAjaxData("delete", "/rest/administrate/faq/delete", data, fn_delete_success, fn_delete_fail);
    });

    function fn_update_success(dst_id, response) {
        dalbitLog(response);
        alert(response.message);
        insert();
    }
    function fn_update_fail(data, textStatus, jqXHR) {
        console.log(data, textStatus, jqXHR);
    }

    function fn_delete_success(dst_id, response) {
        dalbitLog(response);

        alert(response.message +'\n- 성공 : ' + response.data.sucCnt + '건\n- 실패 : ' + response.data.failCnt +'건');
        dtList_info.reload();
    }
    function fn_delete_fail(data, textStatus, jqXHR) {
        console.log(data, textStatus, jqXHR);
    }


    // 검색
    function getFaqInfo(){
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

<script id="tmp_faqFrm" type="text/x-handlebars-template">
    <input type="hidden" name="faqIdx" value="{{faqIdx}}" />
    <div class="row col-lg-12 form-inline">
        <div class="col-md-12 no-padding">
            <label id="faq_detatil_title">ㆍ선택한 FAQ 정보를 확인/수정/삭제를 할 수 있습니다.</label>
        </div>
    </div>
    <div class="row col-lg-12">
        <table class="table table-bordered table-dalbit" style="margin-bottom: 0px;">
            <colgroup>
                <col width="5%" />
                <col width="5%" />
                <col width="5%" />
                <col width="5%" />
                <col width="5%" />
                <col width="5%" />
                <col width="5%" />
                <col width="5%" />
                <col width="5%" />
                <col width="5%" />
                <col width="5%" />
                <col width="5%" />
            </colgroup>
            <tbody>
            <tr class="align-middle">
                <th rowspan="2">No</th>
                <td rowspan="2" id="no">{{faqIdx}}</td>

                <th rowspan="2">구분</th>
                <td rowspan="2" id="slctType">{{{getCommonCodeSelect slctType 'faq_slctType_detail'}}}</td>

                <th rowspan="2">질문</th>
                <td rowspan="2" colspan="10"><input type="text" name="question" id="question" class="form-control" value="{{question}}" maxlen></td>

                <th rowspan="2">등록일시</th>
                <td rowspan="2" id="regDate">{{writeDate}}</td>

                <th>조회수</th>
                <td id="cnt">{{viewCnt}}</td>
            </tr>
            <tr>
                <th>처리자</th>
                <td id="processor">{{opName}}</td>
            </tr>
            </tbody>
        </table>
    </div>
    <div class="row col-lg-12 form-inline area_style">
        <div class="widget">
            <div class="widget-header">
                <h3><i class="fa fa-user"></i> 답변 </h3>
            </div>
            <textarea class="code" style="width: 100%; height: 300px" name="answer" id="answer">{{answer}}</textarea>
            <table class="table table-bordered table-dalbit" style="margin-bottom: 0px;">
                <tbody>
                <tr class="align-middle">
                    <th>사이트적용</th>
                    <td id="viewOn"></td>
                    <td>
                        <span class="button_right">
                            <button class="btn btn-default" type="button" id="insertBtn">등록하기</button>
                            <button class="btn btn-default" type="button" id="updateBtn">수정하기</button>
                        </span>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</script>