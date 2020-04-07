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

    function getHistory_giftDetail(tmp) {     // 상세보기
        // console.log("memNo : " + memNo);
        if(tmp.indexOf("_") > 0){ tmp = tmp.split("_"); tmp = tmp[1]; }
        var source = MemberDataTableSource[tmp];
        var dtList_info_detail_data = function (data) {
            data.mem_no = memNo;
            data.pageCnt = 10;
        }
        dtList_info_detail = new DalbitDataTable($("#"+tmp).find("#list_info_detail"), dtList_info_detail_data, source);
        dtList_info_detail.useCheckBox(false);
        dtList_info_detail.useIndex(true);
        dtList_info_detail.createDataTable();
        dtList_info_detail.setPageLength(10);
        dtList_info_detail.reload();

        initDataTableTop_select_gift(tmp);
    }
    function initDataTableTop_select_gift(tmp){
        var topTable = '<span name="search_gift_top" id="search_gift_top" onchange="sel_change()"></span>';
        $("#"+tmp).find("#main_table").find(".top-left").addClass("no-padding").append(topTable);
        $("#search_gift_top").html(util.getCommonCodeSelect(-1, gift));
    }
    // function sel_change(value){
    //     console.log("value : " + value);
    // }

    function Gift(index){
        var data = dtList_info_detail.getDataRow(index);
        var roomNo = data.roomNo;
        console.log('Gift~ roomNo : ' + roomNo);
    }

</script>
