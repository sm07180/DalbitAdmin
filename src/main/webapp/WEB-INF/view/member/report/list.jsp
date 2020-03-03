<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="wrapper">
    <div id="page-wrapper">
        <div class="col-lg-12 no-padding">
            <div class="widget widget-table">
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
        <div class="col-md-12 no-padding" id="report_detail">
            <div class="col-lg-12 no-padding">
                <label style="height: 15px;"> ㆍ신고 시 캡쳐 내용은 라이브 방송방 신고시점을 기준으로 5분 이내의 채팅 내역 정보입니다.</label>
            </div>
            <div class="col-lg-12 no-padding">
                <label style="height: 15px;"> ㆍ캡쳐화면 내 닞네임을 클릭하면 클릭한 닉네임의 채팅글만 우측에서 보여집니다.</label>
            </div>
            <div class="col-lg-12 no-padding">
                <label style="height: 15px;"> ㆍ신중히 확인 한 후 조치바랍니다.</label>
            </div>
            <div class="widget-content">
                <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist">
                    <li class="active"><a href="#reportDetail" role="tab" data-toggle="tab">상세정보</a></li>
                </ul>
                <div class="tab-content no-padding">
                    <div class="tab-pane fade in active" id="reportDetail"><jsp:include page="../../customer/declaration/report.jsp"/></div>     <!-- 상세 -->
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function() {
    });

    $('#report_detail').hide();
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
    }

    function Report(index){
        $('#report_detail').show();
        getChattingHistoryDetail();
        var data = dtList_info_detail.getDataRow(index);
        var report_roomNo = data.roomNo;
        var report_memNo = data.memNo;
    }

</script>
