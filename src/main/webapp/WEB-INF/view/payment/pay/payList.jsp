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
                </div>
            </div>

            <div class="pull-right">
                <span id="pay_summaryArea"></span>
            </div>

            <table id="list_info" class="table table-sorting table-hover table-bordered">
                <thead></thead>
                <tbody></tbody>
            </table>
        <!-- // DATA TABLE -->
</div> <!-- //wrapper -->

<script type="text/javascript" src="/js/code/member/memberCodeList.js?${dummyData}"></script>
<script type="text/javascript" src="/js/code/payment/payCodeList.js?${dummyData}"></script>
<script type="text/javascript">

    var date = new Date();
    var sDate;
    var eDate;
    var dtList_info;

    var tmp_searchPayStatus = -1;
    var tmp_ostype = -1;
    var txt_search = "";
    var tmp_period = "";
    var tmp_joinDate = "";

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

        };
        dtList_info = new DalbitDataTable($("#list_info"), dtList_info_data, payDataTableSource.payList);
        dtList_info.useCheckBox(false);
        dtList_info.useIndex(true);
        dtList_info.createDataTable(pay_listSummary);

        $("#payStateArea").html(util.getCommonCodeSelect('-1', payStatus));
        $("#payPlatformArea").html(util.getCommonCodeSelect('-1', payPlatform));
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

        var result = confirm(cancelData.memnick+"님의 "+ common.addComma(cancelData.prdtprice) +"원에 대한 결제를 취소하시겠습니까?")
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
        init();
    }

    function sel_change_payStateArea(){
        tmp_searchPayStatus = $("select[name='searchPayStatus']").val();
        dtList_info.reload(pay_listSummary);
    }
    function sel_change_payPlatformArea(){
        tmp_ostype = $("select[name='ostype']").val();
        dtList_info.reload(pay_listSummary);
    }

    function codeString(data) {
        var str;
        if(data == 'VA'){
            str = '가상계좌'
        } else if (data == 'CN') {
            str = '신용카드';
        } else if (data == 'MC') {
            str = '휴대폰';
        } else if (data == 'RA') {
            str = '계좌이체';
        } else if (data == 'InApp') {
            str = 'Apple';
        } else {
            str = '-'
        }
        return str;
    }

    function osGubun(data) {
        var os;
        if(data == 1){
            os = 'AOS'
        } else if (data == 2) {
            os = 'IOS';
        } else if (data == 3) {
            os = 'PC';
        } else {
            str = '-'
        }
        return os;
    }

    function bankCodeToString(data) {
        var str='';
        if(data == '003'){
            str = '기업은행';
        } else if(data == '004'){
            str = '국민은행';
        } else if(data == '020'){
            str = '우리은행';
        }else if(data == '026'){
            str = '신한은행';
        }else if(data == '081'){
            str = '하나은행';
        }else if(data == '011'){
            str = '농협';
        }else if(data == '071'){
            str = '우체국';
        }else if(data == '023'){
            str = 'SC제일은행';
        }else if(data == '027'){
            str = '한국씨티은행';
        }else if(data == '007'){
            str = '수협은행';
        }else if(data == '032'){
            str = '부산은행';
        }else if(data == '034'){
            str = '광주은행';
        }else if(data == '039'){
            str = '경남은행';
        }else if(data == '031'){
            str = '대구은행';
        }
        return str;
    }

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