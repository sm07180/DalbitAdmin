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
                                <label><input type="text" class="form-control" name="txt_search" id="txt_search" placeholder="검색할 정보를 입력하세요"></label>
                                <button type="button" class="btn btn-success" id="bt_search">검색</button>
                            </div>
                        </div>
                    </div>
                </div>
                <input type="text" id="dummy" style="display:none;">
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

    $('#report_title').html("ㆍ신고시 캡쳐내용은 라이브 방송방 신고 시점을 기준으로 5분 이내의 채팅 내역 정보입니다. 신중히 확인 한 후 조치바랍니다.");

    init();
    /** Data Table **/
    var dtList_info;
    function init() {
        var dtList_info_data = function ( data ) {
            data.search = $('#txt_search').val();
            data.searchType = $("#search_search_type_aria option:selected").val();
            data.slctType = $("#search_slct_type_aria option:selected").val();
            data.reason = $("#search_reason_aria option:selected").val();
        };

        dtList_info = new DalbitDataTable($("#list_info"), dtList_info_data, customerDataTableSource.DeclareList, $("#searchForm"));
        dtList_info.useCheckBox(true);
        dtList_info.useIndex(true);
        dtList_info.createDataTable();

        // 검색조건 불러오기
        $("#search_search_type_aria").html(util.getCommonCodeSelect(-1, declaration_searchType));
        $("#search_slct_type_aria").html(util.getCommonCodeSelect(-1, declaration_opCode));
        $("#search_reason_aria").html(util.getCommonCodeSelect(-1, declaration_reason));
    }

    function getDeclareInfo() {
        dtList_info.reload();

        /*검색결과 영역이 접혀 있을 시 열기*/
        var toggleIcon = $('#_searchToggleIcon');
        if(toggleIcon.hasClass('fa-chevron-down')){
            toggleIcon.click();
        }
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
        //getChattingHistoryDetail();
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
    <div class="row col-lg-12 form-inline" id="declareDetail">
        <div class="widget-content">
            <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist">
                <li class="active"><a href="#reportDetail" role="tab" data-toggle="tab">상세정보</a></li>
            </ul>
            <div class="tab-content no-padding">
                <table class="table table-bordered table-dalbit">
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
                    </colgroup>
                    <tbody>
                    <tr class="align-middle">
                        <th rowspan="2">No</th>
                        <td rowspan="2">{{reportIdx}}</td>

                        <th>신고사유</th>
                        <td>{{{getCommonCodeSelect report_reason 'declaration_reason'}}}</td>

                        <th>Browser</th>
                        <td>{{browser}}</td>

                        <th>접수일시</th>
                        <td>{{reg_date}}</td>

                        <th>처리상태</th>
                        <td>{{{getCommonCodeSelect status 'declaration_status'}}}</td>
                    </tr>
                    <tr>
                        <th>플랫폼</th>
                        <td>{{platform}}</td>

                        <th>IP Address</th>
                        <td>{{ipAddress}}</td>

                        <th>처리일시</th>
                        <td>{{op_date}}</td>

                        <th>처리자명</th>
                        <td>{{opName}}</td>
                    </tr>
                    <tr class="align-middle">
                        <th colspan="4">신고자</th>
                        <th colspan="4">대상자</th>

                        <th rowspan="5">조치내역</th>
                        <td rowspan="5">
                            {{{getCommonCodeRadio op_code 'report_radio'}}}
                        </td>
                    </tr>
                    <tr>
                        <td>{{mem_id}}</td>
                        <td>{{level}}/{{grade}}</td>
                        <td>{{mem_nick}}</td>
                        <td>{{memSex}}</td>

                        <td>{{reported_mem_id}}</td>
                        <td>{{reported_level}}/{{reported_grade}}</td>
                        <td>{{reported_mem_nick}}</td>
                        <td>{{reported_memSex}}</td>
                    </tr>
                    <tr>
                        <th colspan="2">누적 결제 수<br />/금액</th>
                        <td colspan="2">{{payCount}} <br />{{payAmount}}</td>

                        <th colspan="2">누적 결제 수<br />/금액</th>
                        <td colspan="2">{{reported_payCount}} <br />{{reported_payAmount}}</td>
                    </tr>
                    <tr>
                        <th colspan="2">누적 선물 수<br />/금액</th>
                        <td colspan="2">{{giftCount}} <br />{{giftAmount}}</td>

                        <th colspan="2">누적 선물 수<br />/금액</th>
                        <td colspan="2">{{reported_giftCount}} <br />{{reported_giftAmount}}</td>
                    </tr>
                    <tr>
                        <th colspan="2">총 신고</th>
                        <td colspan="2"></td>

                        <th colspan="2">총 신고/조치</th>
                        <td colspan="2"> <br /></td>
                    </tr>
                    </tbody>
                </table>

            </div>
        </div>
    </div>
</script>
