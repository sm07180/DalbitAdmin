<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="wrapper">
    <div id="page-wrapper">
        <!-- DATA TABLE -->
        <div class="top-left pull-left dataTable-div">
            <div class="comments pt10 pb15">ㆍ회원이 요청한 결제 취소 건을 처리하고, 취소 처리상태를 확인 할 수 있습니다.</div>
            <div class="col-md-12 no-padding">
                <label id="payStateArea" onchange="sel_change_payStateArea();"></label>
                <label id="payPlatformArea" onchange="sel_change_payPlatformArea();"></label>
                <label id="payWayArea" onchange="sel_change_payWayArea();"></label>
                <label id="payInnerArea" onchange="sel_change_payInnerArea();" style="border: 1px solid #632beb"></label>
            </div>
        </div>

        <div class="pull-right">
            <span id="pay_summaryArea"></span>
        </div>

        <table id="list_info" class="table table-sorting table-hover table-bordered">
            <thead></thead>
            <tbody></tbody>
        </table>
        <button class="btn btn-default btn-sm print-btn pull-right" type="button" id="excelDownBtn"><i class="fa fa-print"></i>Excel Down</button>
        <!-- // DATA TABLE -->
    </div>
</div> <!-- //wrapper -->

<script type="text/javascript" src="/js/code/member/memberCodeList.js?${dummyData}"></script>
<script type="text/javascript" src="/js/code/payment/payCodeList.js?${dummyData}"></script>
<script type="text/javascript">

    var date = new Date();
    var sDate;
    var eDate;
    var dtList_info;

    var tmp_searchPayStatus = 1; //결제완료 디폴트 호출
    var tmp_ostype = -1;
    var txt_search = "";
    var tmp_period = "";
    var tmp_joinDate = "";
    var tmp_innerType = "0";
    var tmp_payWay = "all";

    $(document).ready(function() {
    });


    function getPayList() {
        var dtList_info_data = function(data) {
            data.searchText = txt_search;                        // 검색명
            data.period = tmp_period;
            if(tmp_joinDate == "0" || tmp_joinDate == "1" || tmp_joinDate == "2") {               // 선택
                data.sDate = sDate;
                data.eDate = eDate;
            }else if(tmp_joinDate == "3" ){
                data.sDate = sDate;
            }else if(tmp_joinDate == "4" ){
                data.sDate = $("#onedayDate").val().replace(/-/gi, "");
            }
            data.ostype = tmp_ostype;
            data.searchPayStatus = tmp_searchPayStatus;
            data.innerType = tmp_innerType;
            data.payWay = tmp_payWay;

        };
        dtList_info = new DalbitDataTable($("#list_info"), dtList_info_data, payDataTableSource.payList);
        dtList_info.useCheckBox(false);
        dtList_info.useIndex(true);
        dtList_info.setPageLength(50);
        dtList_info.createDataTable(pay_listSummary);
        dtList_info.reload();

        $("#payStateArea").html(util.getCommonCodeSelect('1', payStatus));
        $("#payPlatformArea").html(util.getCommonCodeSelect('-1', payPlatform));
        $("#payWayArea").html(util.getCommonCodeSelect('all', payWay));
        $("#payInnerArea").html(util.getCommonCodeSelect('0', innerType));

    }

    function pay_listSummary(json){
        console.log(json);
        var template = $("#pay_tableSummary").html();
        var templateScript = Handlebars.compile(template);
        var data = {
            content : json.summary
            , length : json.recordsTotal
        };
        var html = templateScript(data);
        $("#pay_summaryArea").html(html);
    }

    /* 취소버튼 클릭 */
    function cancelClick(cancelData){

        var result = confirm(cancelData.memnick+"님의 "+ common.addComma(cancelData.prdtprice) +"원에 대한 결제를 취소하시겠습니까?");

        if(result){
            var restUrl='';
            if(cancelData.paycd == 'CN'){
                restUrl='card'
            }else if(cancelData.paycd == 'RA'){
                restUrl='bank'
            }else if(cancelData.paycd == 'MC'){
                restUrl='phone'
            }else {
                alert("결제수단 오류 확인필요");
            }

            var data = {
                prdtprice : cancelData.prdtprice
                , mobilid : cancelData.mobilid
                , tradeid : cancelData.tradeid
                , mrchid : cancelData.storeid
                , memno : cancelData.memno
                , dalcnt : cancelData.dalcnt
            };

            util.getAjaxData("cancel", "/rest/payment/pay/cancel/"+restUrl, data, payCancelSuccess);
        }
    }

    /* 취소버튼 클릭 */
    function payCancelSuccess(response){
        dalbitLog(response);
        alert("결제취소가 완료되었습니다.");
        dtList_info.reload(pay_listSummary);
    }

    function sel_change_payStateArea(){
        tmp_searchPayStatus = $("select[name='searchPayStatus']").val();
        dtList_info.reload(pay_listSummary);
    }
    function sel_change_payPlatformArea(){
        tmp_ostype = $("select[name='ostype']").val();
        dtList_info.reload(pay_listSummary);
    }

    function sel_change_payInnerArea(){
        tmp_innerType = $("select[name='innerType']").val();
        dtList_info.reload(pay_listSummary);
    }

    function sel_change_payWayArea(){
        tmp_payWay = $("select[name='payWay']").val();
        dtList_info.reload(pay_listSummary);
    }
    /*=============엑셀==================*/
    $('#excelDownBtn').on('click', function(){
        var formElement = document.querySelector("form");
        var formData = new FormData(formElement);
        formData.append("searchText", txt_search);
        formData.append("period", tmp_period);
        formData.append("sDate", sDate);
        formData.append("eDate", eDate);
        formData.append("ostype", tmp_ostype);
        formData.append("searchPayStatus", tmp_searchPayStatus);
        formData.append("innerType", tmp_innerType);
        formData.append("payWay", tmp_payWay);

        util.excelDownload($(this), "/rest/payment/pay/listExcel", formData);

    });


</script>


<script id="pay_tableSummary" type="text/x-handlebars-template">
    <table class="table table-bordered table-summary pull-right" style="margin-right:0px">
        <thead>
        <tr>
            <th colspan="2">총 결제완료</th>
            <th colspan="2">총 결제취소</th>
            <th colspan="2">총 취소실패</th>
        </tr>
        </thead>
        <tbody>
            <td>{{addComma content.totalPayCnt}}건</td>
            <td>{{addComma content.totalPayAmt}}원</td>
            <td>{{addComma content.totalPayCancelCnt}}건</td>
            <td>{{addComma content.totalPayCancelAmt}}원</td>
            <td>{{addComma content.totalPayCancelCannotCnt}}건</td>
            <td>{{addComma content.totalPayCancelCannotAmt}}원</td>
        </tbody>
    </table>
</script>