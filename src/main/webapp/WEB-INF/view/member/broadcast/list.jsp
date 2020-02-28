<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
</style>
<div id="broadDetail">
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
        </div>
    </div>
</div>
<script>
    $(document).ready(function() {
    });

    function getHistoryDetail(tmp) {     // 상세보기
        console.log("tmp : " + tmp);
        if(tmp.indexOf("_") > 0){       // userid 클릭시 _ 없이 호출
            tmp = tmp.split("_");
            tmp = tmp[1];
        }
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

    function Broad(index) {
        var data = dtList_info_detail.getDataRow(index);
        var roomNo = data.roomNo;
        console.log('종료된 방송 상세정보 새창 오픈~ roomNo : ' + roomNo);

        var screenW = screen.availWidth;  // 스크린 가로사이즈
        var screenH = screen.availHeight; // 스크린 세로사이즈
        var popW = 1000; // 띄울창의 가로사이즈
        var popH = 800; // 띄울창의 세로사이즈
        var posL = (screenW - popW) / 2;   // 띄울창의 가로 포지션
        var posT = (screenH - popH) / 2;   // 띄울창의 세로 포지션

        // window.open('../member/list?roomNo=' + roomNo, 'test', 'width=' + popW + ',height=' + popH + ',top=' + posT + ',left=' + posL + ',resizable=no,scrollbars=no');

        var myForm = document.frmData;
        var url = "http://localhost:8081/member/member/memberPopup.jsp";
        // var url = "http://localhost:8081/template2/index.html";
        // var url = "https://www.naver.com";
        // window.open('', '방송정보', 'width=' + popW + ',height=' + popH + ',top=' + posT + ',left=' + posL + ',resizable=no,scrollbars=no');
        window.open('', 'test', 'width=' + popW + ',height=' + popH + ',top=' + posT + ',left=' + posL + ',resizable=no,scrollbars=no');
        myForm.action = url;
        myForm.method = "post";
        myForm.target = "test";
        myForm.submit();
    }

</script>

<form id="frmData" name="frmData" method="post">
    <input name="roomNo" value="test" class="hidden">
</form>