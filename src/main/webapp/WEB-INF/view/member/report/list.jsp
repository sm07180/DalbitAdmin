<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="col-lg-12 no-padding">
    <div class="widget widget-table" id="main_table">
        <div class="widget-content">
            <table id="list_info_detail" class="table table-sorting table-hover table-bordered datatable">
                <thead id="tableTop_detail">
                </thead>
                <tbody id="tableBody_detail">
                </tbody>
            </table>
        </div>
    </div>
</div>
<div class="tab-pane fade in active" id="report_tab">
    <form id="declarationForm"></form>
</div>

<script>
    $(document).ready(function() {
    });

    var tmp_platform="-1";          // 최초 selectbox가 없기때문에 전체로 초기 세팅
    var tmp_slctReason="-1";        // 최초 selectbox가 없기때문에 전체로 초기 세팅
    function getHistory_reportDetail(tmp) {     // 상세보기
        if(tmp.indexOf("_") > 0){ tmp = tmp.split("_"); tmp = tmp[1]; }
        console.log("tmp : " + memNo);
        var source = MemberDataTableSource[tmp];
        var dtList_info_detail_data = function (data) {
            data.searchText = memNo;
            data.slctReason = tmp_slctReason;
            data.platform = tmp_platform;
        }
        dtList_info_detail = new DalbitDataTable($("#"+tmp).find("#list_info_detail"), dtList_info_detail_data, source);
        dtList_info_detail.useCheckBox(false);
        dtList_info_detail.useIndex(true);
        dtList_info_detail.createDataTable();
        dtList_info_detail.reload();
        initDataTableTop(tmp);                  // 상단 정보 테이블
        initDataTableTop_select_report(tmp);    // 상단 selectBox
    }
    function initDataTableTop(tmp){
        var topTable = '<div class="col-md-12 no-padding pull-right">\n' +
            '                <div class="widget-table" id="main_table_top">\n' +
            '                    <div class="widget-content no-padding">\n' +
            '                        <table id="top_info" class="table table-sorting table-hover table-bordered">\n' +
            '                            <thead id="table_Top"></thead>\n' +
            '                            <tbody id="table_Body"></tbody>\n' +
            '                        </table>\n' +
            '                    </div>\n' +
            '                </div>\n' +
            '            </div>';
        $("#"+tmp).find("#main_table").find(".top-right").addClass("no-padding").append(topTable);
        var top = tmp.replace("Detail","_top");
        var source = MemberDataTableSource[top];
        var dtList_info_detail_data = function (data) {
            data.mem_no = memNo;
        }
        dtList_top_info = new DalbitDataTable($("#"+tmp).find("#top_info"), dtList_info_detail_data, source);
        dtList_top_info.useCheckBox(false);
        dtList_top_info.useIndex(false);
        dtList_top_info.useOrdering(false);
        dtList_top_info.onlyTableView();            //테이블만
        dtList_top_info.createDataTable();
        dtList_top_info.reload();
    }
    function initDataTableTop_select_report(tmp){
        var topTable = '<span name="search_platform_aria_top" id="search_platform_aria_top" onchange="sel_change()"></span>' +
                        '<span name="search_reason_aria_top" id="search_reason_aria_top" onchange="sel_change()"></span>';
        $("#"+tmp).find("#main_table").find(".top-left").addClass("no-padding").append(topTable);
        $("#search_platform_aria_top").html(util.getCommonCodeSelect(-1, search_platform));
        $("#search_reason_aria_top").html(util.getCommonCodeSelect(-1, declaration_reason));
        // $("#search_slct_type_aria").html(util.getCommonCodeSelect(-1, declaration_slctType));
        // $("#search_reason_aria").html(util.getCommonCodeSelect(-1, declaration_reason));
    }
    function sel_change(){
        tmp_platform = $("select[name='platform']").val();
        tmp_slctReason = $("select[name='slctReason']").val();
        dtList_info_detail.reload();
    }

    function Report(index){
        var obj = new Object();
        obj.reportIdx = index;
        util.getAjaxData("detail", "/rest/customer/declaration/detail", obj, fn_detail_success);
    }

    function fn_detail_success(dst_id, response) {
        var template = $('#tmp_declarationFrm').html();
        var templateScript = Handlebars.compile(template);
        var context = response.data;
        var html=templateScript(context);
        $("#declarationForm").html(html);
        $('#report_title').html("ㆍ신고 시 캡쳐내용은 라이브 방송방 신고시점을 기준으로 5분 이내의 채팅 내역 정보입니다.<br/>ㆍ캡쳐화면 내 닉네임을 클릭하면 클릭한 닉네임의 채팅글만 우측에서 보여집니다.<br/> ㆍ신중히 확인 한 후 조치바랍니다.");
    }
</script>

<script id="tmp_declarationFrm" type="text/x-handlebars-template">
    <jsp:include page="../../customer/declaration/report.jsp"/>
</script>
