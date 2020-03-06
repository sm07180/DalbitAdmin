<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="wrapper">
    <div id="page-wrapper">
        <div class="col-lg-12 no-padding">
            <div class="widget widget-table" id="reportDetail">
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
        <div class="col-md-12 no-padding hide" id="report_detail">
            <div class="widget-content">
                <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist">
                    <li class="active"><a href="#report_tab" role="tab" data-toggle="tab">상세정보</a></li>
                </ul>
                <div class="tab-content no-padding">
                    <div class="tab-pane fade in active" id="report_tab"><jsp:include page="../../customer/declaration/report.jsp"/></div>     <!-- 상세 -->
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function() {
    });

    $('#report_title').html("ㆍ신고 시 캡쳐내용은 라이브 방송방 신고시점을 기준으로 5분 이내의 채팅 내역 정보입니다.<br/>ㆍ캡쳐화면 내 닉네임을 클릭하면 클릭한 닉네임의 채팅글만 우측에서 보여집니다.<br/> ㆍ신중히 확인 한 후 조치바랍니다.");

    function getHistory_report(tmp) {     // 상세보기
        if(tmp.indexOf("_") > 0){ tmp = tmp.split("_"); tmp = tmp[1]; }
        var source = MemberDataTableSource[tmp];
        var dtList_info_detail_data = function (data) {
            data.memNo = memNo;
        }
        dtList_info_detail = new DalbitDataTable($("#"+tmp).find("#list_info_detail"), dtList_info_detail_data, source);
        dtList_info_detail.useCheckBox(false);
        dtList_info_detail.useIndex(true);
        dtList_info_detail.createDataTable();
        dtList_info_detail.reload();

        initDataTableTop(tmp);
    }
    function initDataTableTop(tmp){
        var topTable = '<div class="col-md-12 no-padding pull-right">\n' +
            '                <div class="widget widget-table">\n' +
            '                    <div class="widget-content" style="border-top-width:0px;padding-bottom: 0px;">\n' +
            '                        <table id="top_listen" class="table table-sorting table-hover table-bordered">\n' +
            '                            <thead id="table_Top"></thead>\n' +
            '                            <tbody id="table_Body"></tbody>\n' +
            '                        </table>\n' +
            '                    </div>\n' +
            '                </div>\n' +
            '            </div>';

        $("#"+tmp).find(".top-right").addClass("no-padding").append(topTable);

        var top = tmp.replace("Detail","_top");
        var source = MemberDataTableSource[top];
        var dtList_info_detail_data = function (data) {
            data.memNo = memNo;
        }
        dtList_top_info = new DalbitDataTable($("#"+tmp).find("#top_listen"), dtList_info_detail_data, source);
        dtList_top_info.useCheckBox(false);
        dtList_top_info.useIndex(false);
        dtList_top_info.createDataTable();
        dtList_top_info.reload();
    }

    function Report(index){
        $('#report_detail').addClass("show");
        getChattingHistoryDetail();
        var data = dtList_info_detail.getDataRow(index);
        var report_roomNo = data.roomNo;
        var report_memNo = data.memNo;
    }

</script>
