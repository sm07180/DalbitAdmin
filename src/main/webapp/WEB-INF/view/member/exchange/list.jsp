<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    .lb_style{
        border: 1px solid #DDDDDD;
        background-color: #DCE6F2;
        height: 34px;
    }
</style>
<div id="wrapper">
    <div id="page-wrapper">
        <div class="col-lg-12 no-padding">
            <div class="widget widget-table" id="exchangeDetail">
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
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                    <div class="modal-body">
                        <div class="col-md-12 no-padding" style="border: 1px solid #DDDDDD;">
                            <div class="col-md-3 lb_style"><label>신청종류</label></div>
                            <div class="col-md-9"><label id="1"> 현금 출금 신청 </label></div>
                        </div>
                        <div class="col-md-12">
                            <label id="lb_userId">총 적립금액 : 50,000원</label>
                        </div>
                        <div class="col-md-12 no-padding" style="border: 1px solid #DDDDDD;">
                            <div class="col-md-3 lb_style"><label>신청금액</label></div>
                            <div class="col-md-9"><label id="1"> 39,000원(출금 후 잔액 : 11,000원) </label></div>
                        </div>
                        <div class="col-md-12 no-padding" style="border: 1px solid #DDDDDD;">
                            <div class="col-md-3 lb_style"><label>은행명</label></div>
                            <div class="col-md-9"><label id="1"> 우리은행 </label></div>
                        </div>
                        <div class="col-md-12 no-padding" style="border: 1px solid #DDDDDD;">
                            <div class="col-md-3 lb_style"><label>계좌번호</label></div>
                            <div class="col-md-9"><label id="1"> 우리은행 </label></div>
                        </div>
                        <div class="col-md-12 no-padding" style="border: 1px solid #DDDDDD;">
                            <div class="col-md-3 lb_style"><label>예금주</label></div>
                            <div class="col-md-9"><label id="1"> 우리은행 </label></div>
                        </div>
                        <div class="col-md-12 no-padding" style="border: 1px solid #DDDDDD;">
                            <div class="col-md-3 lb_style"><label>주민번호</label></div>
                            <div class="col-md-9"><label id="1">900000-1000000</label></div>
                        </div>
                        <div class="col-md-12 no-padding" style="border: 1px solid #DDDDDD;">
                            <div class="col-md-3 lb_style"><label>주소</label></div>
                            <div class="col-md-9"><label id="1"> 서울 </label></div>
                        </div>
                        <div class="col-md-12 no-padding" style="border: 1px solid #DDDDDD;">
                            <div class="col-md-3 lb_style"><label>전화번호</label></div>
                            <div class="col-md-9"><label id="1"> 010-0000-0000 </label></div>
                        </div>
                        <div class="col-md-12 no-padding" style="border: 1px solid #DDDDDD;">
                            <div class="col-md-3 lb_style"><label>접수서류</label></div>
                            <div class="col-md-9"><label id="1">  </label></div>
                        </div>
                        <div class="col-md-12 no-padding" style="border: 1px solid #DDDDDD;">
                            <div class="col-md-3 lb_style"><label>신청일자</label></div>
                            <div class="col-md-9"><label id="1"> 2020-02-24 11:01:01 </label></div>
                        </div>
                        <div class="col-md-12 no-padding" style="border: 1px solid #DDDDDD;">
                            <div class="col-md-3 lb_style"><label>완료일자</label></div>
                            <div class="col-md-9"><label id="1"> 2020-02-24 11:01:01 </label></div>
                        </div>
                        <div class="col-md-12 no-padding" style="border: 1px solid #DDDDDD;">
                            <div class="col-md-3 lb_style"><label>사유</label></div>
                            <div class="col-md-9"><label id="1"> ※출금취소시 사유 입력 </label></div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn" data-dismiss="modal">닫기</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function() {
    });

    function getHistory_exchange(tmp) {     // 상세보기
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

    function exchangeStatus(index){
        var data = dtList_info_detail.getDataRow(index);
        var roomNo = data.roomNo;
        console.log('환전내역 보기  modal~ roomNo : ' + roomNo);
    }

</script>
