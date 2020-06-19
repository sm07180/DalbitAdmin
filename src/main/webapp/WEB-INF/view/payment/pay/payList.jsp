<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="wrapper">
    <div id="page-wrapper">
        <!-- DATA TABLE -->
        <div class="top-left pull-left dataTable-div col-md-6 no-padding">
            <div class="comments pt10 pb15">ㆍ회원이 요청한 결제 취소 건을 처리하고, 취소 처리상태를 확인 할 수 있습니다.</div>
            <div class="col-md-12 no-padding">
                <label id="payStateArea" onchange="sel_change_payStateArea();"></label>
                <label id="payPlatformArea" onchange="sel_change_payPlatformArea();"></label>
                <label id="payWayArea" onchange="sel_change_payWayArea();"></label>
                <label id="payInnerArea" onchange="sel_change_payInnerArea();" style="border: 1px solid #632beb"></label>
            </div>
        </div>

        <div class="col-md-4 no-padding pull-right mb5">
            <div class="pull-right">
                <span id="pay_summaryArea2"></span>
            </div>
            <div class="mr10 pull-right">
                <span id="pay_summaryArea"></span>
            </div>
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
<script type="text/javascript" src="/js/handlebars/statusHelper.js?${dummyData}"></script>
<script type="text/javascript">

    var dtList_info_pay;

    var tmp_searchPayStatus = 1; //결제완료 디폴트 호출
    var tmp_ostype = -1;
    var txt_search = "";
    var tmp_innerType = "0";
    var tmp_payWay = "all";
    var sDate;
    var eDate;

    $(document).ready(function() {
    });


    function getPayList(tmp) {
        var dtList_info_pay_data = function(data) {
            data.searchText = txt_search;                        // 검색명
            data.sDate = sDate;
            data.eDate = eDate;
            data.ostype = tmp_ostype;
            data.searchPayStatus = tmp_searchPayStatus;
            data.innerType = tmp_innerType;
            data.payWay = tmp_payWay;

        };
        if(tmp == "payment"){
            dtList_info_pay = new DalbitDataTable($("#list_info"), dtList_info_pay_data, payDataTableSource.payList);
        }else{
            dtList_info_pay = new DalbitDataTable($("#list_info"), dtList_info_pay_data, payDataTableSource.memPayHistory);
        }
        dtList_info_pay.useCheckBox(false);
        dtList_info_pay.useIndex(true);
        dtList_info_pay.setPageLength(50);
        dtList_info_pay.createDataTable(pay_listSummary);
        dtList_info_pay.reload();

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

        var template = $("#pay_tableSummary2").html();
        var templateScript = Handlebars.compile(template);
        var data = {
            content : json.summary
            , length : json.recordsTotal
        };
        var html = templateScript(data);
        $("#pay_summaryArea2").html(html);
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
            }else if(cancelData.paycd == 'toss' || cancelData.paycd == 'payco' || cancelData.paycd == 'cashbee' || cancelData.paycd == 'tmoney' || cancelData.paycd == 'kakaopay' ){
                restUrl='payletter'
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
                , paycd : cancelData.paycd
            };

            util.getAjaxData("cancel", "/rest/payment/pay/cancel/"+restUrl, data, payCancelSuccess);
        }
    }

    /* 취소버튼 클릭 */
    function payCancelSuccess(response){
        dalbitLog(response);
        alert("결제취소가 완료되었습니다.");
        dtList_info_pay.reload(pay_listSummary);
    }

    function sel_change_payStateArea(){
        tmp_searchPayStatus = $("select[name='searchPayStatus']").val();
        dtList_info_pay.reload(pay_listSummary);
    }
    function sel_change_payPlatformArea(){
        tmp_ostype = $("select[name='ostype']").val();
        dtList_info_pay.reload(pay_listSummary);
    }

    function sel_change_payInnerArea(){
        tmp_innerType = $("select[name='innerType']").val();
        dtList_info_pay.reload(pay_listSummary);
    }

    function sel_change_payWayArea(){
        tmp_payWay = $("select[name='payWay']").val();
        dtList_info_pay.reload(pay_listSummary);
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
    <table class="table table-condensed table-dark-header table-bordered no-margin" style="margin-right:0px;width: 227px">
        <colgroup>
            <col width="35%"/><col width="65%"/>
        </colgroup>
        <tr>
            <th colspan="2">결제 취소(부가세 포함)</th>
        </tr>
        <tr class="font-bold" style="color: #66a449;">
            <td>{{addComma content.totalPayCancelCnt}}건</td>
            <td>{{addComma content.totalPayCancelAmt}}원</td>
        </tr>
        <tr>
            <th colspan="2">결제 취소(부가세 제외)</th>
        </tr>
        <tr class="font-bold" style="color: #ff5600;">
            <td>{{addComma content.totalPayCancelCnt}}건</td>
            <td>{{vatMinus content.totalPayCancelAmt}}원</td>
        </tr>
    </table>
</script>

<script id="pay_tableSummary2" type="text/x-handlebars-template">
    <table class="table table-bordered mb0" style="width: 227px;">
        <colgroup>
            <col width="35%"/><col width="65%"/>
        </colgroup>
        <tr>
            <th colspan="2">총 결제 건/(부가세 포함) 매출</th>
        </tr>
        <tr style="color: #66a449;">
            <td><b>{{content.totalPayCnt}} 건</b></td>
            <td><b>{{addComma content.totalPayAmt}} 원</b></td>
        </tr>
        <tr>
            <th colspan="2">총 결제 건/(부가세 제외) 매출</th>
        </tr>
        <tr style="color: #ff5600;">
            <td><b>{{content.totalPayCnt}} 건</b></td>
            <td><b>{{vatMinus content.totalPayAmt}} 원</b></td>
        </tr>
    </table>
</script>

