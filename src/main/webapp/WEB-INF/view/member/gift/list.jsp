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
        initDataTableTop_select_gift(tmp);
    }
    function initDataTableTop_select_gift(tmp){
        var topTable = '<div class="col-md-12 no-padding pull-right">\n' +
            '                 <form id="cob_gift_gubun">\n' +
            '                    <select id="cob_gift_gubun" name="gift_gubun" class="" onchange="sel_change(this.value);" tyle="width: 120px;">\n' +
            '                        <option value="9999" selected="selected">구분</option>\n' +
            '                        <option value="1">보낸선물</option>\n' +
            '                        <option value="2">받은선물</option>\n' +
            '                        <option value="3">이벤트-받은선물</option>\n' +
            '                        <option value="4">교환</option>\n' +
            '                    </select>\n' +
            '                </form>\n' +
            '            </div>';

        $("#"+tmp).find("#main_table").find(".top-left").append(topTable);
    }
    function sel_change(value){
        console.log("value : " + value);
    }

    function Gift(index){
        var data = dtList_info_detail.getDataRow(index);
        var roomNo = data.roomNo;
        console.log('Gift~ roomNo : ' + roomNo);
    }

</script>
