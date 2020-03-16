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
<script>
    $(document).ready(function() {
    });

    function getHistory_listen(tmp) {     // 상세보기
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
        initDataTableTop(tmp);      // 상단 정보 테이블
    }
    function initDataTableTop(tmp){
        var topTable = '<div class="col-md-12 no-padding pull-right">\n' +
            '                <div class="widget widget-table">\n' +
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
            data.memNo = memNo;
        }
        dtList_top_info = new DalbitDataTable($("#"+tmp).find("#top_info"), dtList_info_detail_data, source);
        dtList_top_info.useCheckBox(false);
        dtList_top_info.useIndex(false);
        dtList_top_info.useOrdering(false);
        dtList_top_info.onlyTableView();
        dtList_top_info.createDataTable();
        dtList_top_info.reload();
    }

    function Listen(index){
        var data = dtList_info_detail.getDataRow(index);
        var roomNo = data.roomNo;
        console.log('종료된 청취 방송 상세정보 새창 오픈~ roomNo : ' + roomNo);
    }

</script>
