<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="col-md-6 no-padding">
            <label>ㆍ방송 중 (게스트와 매니저를 포함한) 청취자 변동사항을 확인할 수 있습니다.</label>
            <label>ㆍ청취자 리스트는 방송 Live상태 내에서의 데이터로 방송 입퉤장 정보를 포함합니다.</label>
        </div>
        <div class="col-md-6 no-padding pull-right">
            <div class="widget widget-table">
                <div class="widget-content" style="border-top-width:0px;">
                    <table id="top_info" class="table table-sorting table-hover table-bordered">
                        <thead id="table_Top"></thead>
                        <tbody id="table_Body"></tbody>
                    </table>
                </div>
            </div>
        </div>
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
    </div>
</div>
<script>
    $(document).ready(function() {
    });

    function getBroadHistory_listen(tmp) {     // 상세보기
        if(tmp.indexOf("_") > 0){ tmp = tmp.split("_"); tmp = tmp[1]; }
        var source = BroadcastDataTableSource[tmp];
        var dtList_info_detail_data = function (data) {
            data.memNo = memNo;
        }
        dtList_info_detail = new DalbitDataTable($("#"+tmp).find("#list_info_detail"), dtList_info_detail_data, source);
        dtList_info_detail.useCheckBox(false);
        dtList_info_detail.useIndex(true);
        dtList_info_detail.createDataTable();
        dtList_info_detail.reload();

        var dtList_info_data = function ( data ) {
            data.memNo = memNo;
        };
        dtList_top_info = new DalbitDataTable($("#top_info"), dtList_info_data, BroadcastDataTableSource.live_top_list);
        dtList_top_info.useCheckBox(false);
        dtList_top_info.useIndex(false);
        dtList_top_info.createDataTable();
        dtList_top_info.reload();
    }

    function Listen(index){
        var data = dtList_info_detail.getDataRow(index);
        var roomNo = data.roomNo;
        console.log('종료된 청취 방송 상세정보 새창 오픈~ roomNo : ' + roomNo);
    }

</script>
