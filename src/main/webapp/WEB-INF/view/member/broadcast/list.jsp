<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="wrapper">
    <div id="page-wrapper">
        <div class="col-lg-12 no-padding">
            <div class="widget widget-table" id="broadDetail">
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

    function getHistory_broadcast(tmp) {     // 상세보기
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
            '                        <table id="top_info" class="table table-sorting table-hover table-bordered">\n' +
            '                            <thead id="table_Top"></thead>\n' +
            '                            <tbody id="table_Body"></tbody>\n' +
            '                        </table>\n' +
            '                    </div>\n' +
            '                </div>\n' +
            '            </div>';

        $("#"+tmp).find(".top-right").append(topTable);

        var top = tmp.replace("Detail","_top");
        var source = MemberDataTableSource[top];
        var dtList_info_detail_data = function (data) {
            data.memNo = memNo;
        }
        dtList_top_info = new DalbitDataTable($("#"+tmp).find("#top_info"), dtList_info_detail_data, source);
        dtList_top_info.useCheckBox(false);
        dtList_top_info.useIndex(false);
        dtList_top_info.createDataTable();
        dtList_top_info.reload();
    }

    // function Broad(index) {
        // var data = dtList_info_detail.getDataRow(index);
        // var in_roomNo = data.roomNo;
        //
        // if(data.state == "4" || data.state == "5"){
        //     console.log('방송상태 (종료) ~ in_roomNo state : ' + data.state);
        // }else{
        //     console.log('방송상태 (방송중) ~ in_roomNo state : ' + data.state);
        // }
        //
        // var screenW = screen.availWidth;  // 스크린 가로사이즈
        // var screenH = screen.availHeight; // 스크린 세로사이즈
        // var popW = 1000; // 띄울창의 가로사이즈
        // var popH = 800; // 띄울창의 세로사이즈
        // var posL = (screenW - popW) / 2;   // 띄울창의 가로 포지션
        // var posT = (screenH - popH) / 2;   // 띄울창의 세로 포지션
        //
        // // window.open('../member/memberPopup?in_roomNo=' + in_roomNo, 'test', 'width=' + popW + ',height=' + popH + ',top=' + posT + ',left=' + posL + ',resizable=no,scrollbars=no');
        //
        // $("#in_roomNo").val(data.roomNo);
        // $("#in_state").val(data.state);
        // var myForm = document.frmBroad;
        // var url = "../member/popup/memberPopup";
        // window.open('', 'test', 'width=' + popW + ',height=' + popH + ',top=' + posT + ',left=' + posL + ',resizable=no,scrollbars=no');
        // myForm.action = url;
        // myForm.method = "post";
        // myForm.target = "test";
        // myForm.submit();
    // }

</script>

<%--<form id="frmBroad" name="frmBroad" method="post">--%>
    <%--<input name="in_roomNo" id="in_roomNo" value="" class ="hidden">--%>
    <%--<input name="in_state" id="in_state" value="" class ="hidden">--%>
<%--</form>--%>
