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
            </form>
            <!-- //serachBox -->
            <div class="row col-lg-12 form-inline" id="insertBtnDiv">
                <label id="faq_title">ㆍ검색결과 내 질문을 클릭하면 해당 상세정보를 확인할 수 있습니다.</label>
                <button type="button" class="btn btn-default pull-right" id="bt_insert">등록</button>
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
                    <div class="widget-footer">
                        <span>
                            <button class="btn btn-default" type="button" id="bt_delete">선택삭제</button>
                        </span>
                        <span>
                            <button class="btn btn-default print-btn pull-right" type="button" id="excelDownBtn"><i class="fa fa-print"></i>Excel Print</button>
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

        $('input[id="searchText"]').keydown(function(e) {
            if (e.keyCode === 13) {
                getFaqInfo();
            };
        });

        $('#bt_search').click( function() {       //검색
            getFaqInfo();
        });

        getFaqInfo();

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
    $("#search_searchType_aria").html(util.getCommonCodeSelect(-1, faq_searchType));
    $("#search_slctType_aria").html(util.getCommonCodeSelect(-1, faq_slctType));

    $("#bt_insert").on("click", function(){
        generateForm();
    });

    function generateForm() {
        var template = $('#tmp_faqFrm').html();
        var templateScript = Handlebars.compile(template);
        $("#faqForm").html(templateScript);
        $("#viewOn").html(util.getCommonCodeRadio('1', viewOn,"Y"));
        //getFaqInfo();

        // uploadType 추가
        util.editorInit("administrate-faq");
    }

    $(document).on('click', '._getFaqDetail', function(){
        var data = {
            'faqIdx' : $(this).data('idx')
        };
        util.getAjaxData("detail", "/rest/administrate/faq/detail", data, fn_detail_success);
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
        $("#viewOn").html(util.getCommonCodeRadio(response.data.viewOn, viewOn,"Y"));

        // uploadType 추가
        util.editorInit("administrate-faq");
    }

    function isValid(){
        var slctType = $("#faqForm #slctType");
        if(common.isEmpty(slctType.val())){
            alert("구분을 선택해주세요.");
            slctType.focus();
            return false;
        }

        var question = $("#faqForm #question");
        if(common.isEmpty(question.val())){
            alert("질문을 입력해주세요.");
            question.focus();
            return false;
        }

        var editor = $("#editor");
        if(editor.summernote('isEmpty')){
            alert("답변을 입력해주세요.");
            editor.focus();
            return false;
        }
        return true;
    }

    $(document).on('click', '#insertBtn', function(){
        if(isValid()){
            if(confirm("등록하시겠습니까?")){
                var data = $("#faqForm").serialize() +  '&answer=' + $("#editor").summernote('code');
                util.getAjaxData("insert", "/rest/administrate/faq/insert", data, fn_insert_success);
            }
        }
    });

    function fn_insert_success(dst_id, response) {
        dalbitLog(response);
        alert(response.message);
        dtList_info.reload();

        $("#faqForm").empty();
    }

    $(document).on('click', '#updateBtn', function(){
        if(isValid()){
            if(confirm("수정하시겠습니까?")) {
                var data = $("#faqForm").serialize() + '&answer=' + $("#editor").summernote('code');
                util.getAjaxData("update", "/rest/administrate/faq/update", data, fn_update_success);
            }
        }
    });

    $(document).on('click', '#bt_delete', function() {
        var checked = $('#list_info .dt-body-center input[type="checkbox"]:checked');
        if(checked.length == 0){
            alert('삭제할 FAQ를 선택해주세요.');
            return;
        }

        if(confirm(checked.length + "개의 FAQ를 삭제하시겠습니까?")){
            var faqIdxs = '';
            checked.each(function(){
                faqIdxs += $(this).parent().parent().find('._getFaqDetail').data('idx') + ",";
            });
            var data = {
                faqIdxs : faqIdxs
            }
            dalbitLog(data);

            util.getAjaxData("delete", "/rest/administrate/faq/delete", data, fn_delete_success);
        }

    });

    function fn_update_success(dst_id, response) {
        dalbitLog(response);
        alert(response.message);
        dtList_info.reload();

        $("#faqForm").empty();
    }

    function fn_delete_success(dst_id, response) {
        dalbitLog(response);

        alert(response.message +'\n- 성공 : ' + response.data.sucCnt + '건\n- 실패 : ' + response.data.failCnt +'건');
        dtList_info.reload();

        $("#faqForm").empty();
    }


    // 검색
    function getFaqInfo(){
        /* 엑셀저장을 위해 조회조건 임시저장 */
        // tmp_search = $('#searchText').val();
        // tmp_gubun = $("select[name='selectGubun']").val();

        dtList_info.reload();

        /*검색결과 영역이 접혀 있을 시 열기*/
        ui.toggleSearchList();
    }

    // /*=---------- 엑셀 ----------*/
    $('#excelDownBtn').on('click', function(){
        var formElement = document.querySelector("form");
        var formData = new FormData(formElement);

        util.excelDownload($(this), "/rest/administrate/faq/listExcel", formData, fn_success_excel, fn_fail_excel)
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

    function fn_fail_excel(){
        console.log("fn_fail_excel");
    }
    /*----------- 엑셀 ---------=*/
</script>

<script id="tmp_faqFrm" type="text/x-handlebars-template">
    <input type="hidden" name="faqIdx" value="{{faqIdx}}" />
    <div class="row col-lg-12 form-inline mt15">
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
                <col width="10%" />
                <col width="5%" />
                <col width="10%" />
                <col width="5%" />
                <col width="5%" />
                <col width="5%" />
                <col width="5%" />
            </colgroup>
            <tbody>
            <tr class="align-middle">
                <th rowspan="2">No</th>
                <td rowspan="2" id="no">{{faqIdx}}</td>

                <th>구분</th>
                <td>{{{getCommonCodeSelect slctType 'faq_slctType' 'Y'}}}</td>

                <th>질문</th>
                <td colspan="5"><input type="text" name="question" id="question" class="form-control" value="{{question}}" maxlen></td>
            </tr>
            <tr>

                <th>구분</th>
                <td>{{{getCommonCodeSelect slctType 'faq_slctType' 'Y'}}}</td>

                <th>등록일시</th>
                <td id="regDate">{{writeDate}}</td>

                <th>조회수</th>
                <td id="cnt">{{viewCnt}}</td>

                <th>처리자</th>
                <td id="processor">{{opName}}</td>
            </tr>
            </tbody>
        </table>
    </div>
    <div class="row col-lg-12 form-inline">
        <div class="widget">
            <div class="widget-header">
                <h3><i class="fa fa-user"></i> 답변 </h3>
            </div>
            <div class="_editor" id="editor" name="editor">{{{replaceHtml answer}}}</div>
            <table class="table table-bordered table-dalbit" style="margin-bottom: 0px;">
                <tbody>
                <tr class="align-middle">
                    <th>사이트적용</th>
                    <td id="viewOn"></td>
                    <td>
                        <span>
                            {{^faqIdx}}<button class="btn btn-default pull-right" type="button" id="insertBtn">등록하기</button>{{/faqIdx}}
                            {{#faqIdx}}<button class="btn btn-default pull-right" type="button" id="updateBtn">수정하기</button>{{/faqIdx}}
                        </span>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</script>
