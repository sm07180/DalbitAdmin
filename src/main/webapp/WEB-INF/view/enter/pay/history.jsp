<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    Date nowTime = new Date();
    SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
%>

<!-- 결제/환불 > 결제내역 -->
<div class="widget widget-table mb10">
    <div class="widget-content mt10" id="div_payY">
        <%--<a href="javascript://" class="_prevSearch">[이전]</a>--%>
        <span class="_searchDate"></span>
        <%--<a href="javascript://" class="_nextSearch">[다음]</a>--%>
        <br/>
        <label id="payPlatformArea" onchange="sel_change_pay();"></label>
        <label id="payWayArea" onchange="sel_change_pay();"></label>
        <label id="payInnerArea" onchange="sel_change_pay();" style="border: 1px solid #632beb"></label>

        <div class="pull-right">
            <span id="pay_summaryArea"></span>
        </div>

        <table class="table table-bordered" id="list_info">
            <thead>
            </thead>
            <tbody>
            </tbody>
        </table>
    </div>
    <div class="widget-footer">
        <span>
            <button class="btn btn-default print-btn pull-right" type="button" id="excelDownBtn"><i class="fa fa-print"></i>Excel Down</button>
        </span>
    </div>
</div>

<script type="text/javascript" src="/js/code/payment/payCodeList.js?${dummyData}"></script>

<script type="text/javascript">

    var dtList_info;

    var tmp_ostype = -1;
    var tmp_innerType = 0;
    var tmp_payWay = "all";

    function getPayHistoryList() {
        var sDate;
        var eDate;
        sDate = $("#startDate").val().replace(/\./gi,'');
        eDate = $("#endDate").val().replace(/\./gi,'');
        var dtList_info_data = function(data) {
            data.searchText = "";                        // 검색명
            if( $('input[name="slctType"]:checked').val() == 0){
                data.period = 4;
                data.sDate = sDate;
            }else{
                data.period = 0;
                data.sDate = sDate;
                data.eDate = eDate;
            }
            data.ostype = tmp_ostype;
            data.searchPayStatus = 1;
            data.innerType = tmp_innerType;
            data.payWay = tmp_payWay ;
        };
        dtList_info = new DalbitDataTable($("#div_payY").find("#list_info"), dtList_info_data, payDataTableSource.payHistory);
        dtList_info.useCheckBox(false);
        dtList_info.useIndex(true);
        dtList_info.setPageLength(50);
        dtList_info.createDataTable(pay_listSummary);
        dtList_info.reload();

        $("#div_payY").find("#payPlatformArea").html(util.getCommonCodeSelect('-1', payPlatform));
        $("#div_payY").find("#payInnerArea").html(util.getCommonCodeSelect('0', innerType));
        $("#div_payY").find("#payWayArea").html(util.getCommonCodeSelect('all', payWay));
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

    function sel_change_pay(){
        tmp_ostype = $("#div_payY").find("select[name='ostype']").val();
        tmp_innerType = $("#div_payY").find("select[name='innerType']").val();
        tmp_payWay = $("#div_payY").find("select[name='payWay']").val();
        dtList_info.reload(pay_listSummary);
    }

    /*=============엑셀==================*/
    $('#excelDownBtn').on('click', function(){
        var formElement = document.querySelector("form");
        var formData = new FormData(formElement);
        formData.append("searchText", "");
        if( $('input[name="slctType"]:checked').val() == 0){
            formData.append("period", 4);
            formData.append("sDate", sDate);
        }else{
            formData.append("period", 0);
            formData.append("sDate", sDate);
            formData.append("eDate", eDate);
        }
        formData.append("ostype", $("#div_payY").find("select[name='ostype']").val());
        formData.append("searchPayStatus", -1);
        formData.append("innerType", $("#div_payY").find("select[name='innerType']").val());
        formData.append("payWay", $("#div_payY").find("select[name='payWay']").val());

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