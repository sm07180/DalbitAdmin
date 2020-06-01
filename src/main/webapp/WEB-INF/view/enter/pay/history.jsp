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
            data.ostype = $("#div_payY").find("select[name='ostype']").val();
            data.searchPayStatus = 1;
            data.innerType = $("#div_payY").find("select[name='innerType']").val();
            data.payWay = $("#div_payY").find("select[name='payWay']").val();
        };
        dtList_info = new DalbitDataTable($("#div_payY").find("#list_info"), dtList_info_data, payDataTableSource.payHistory);
        dtList_info.useCheckBox(false);
        dtList_info.useIndex(true);
        dtList_info.setPageLength(50);
        dtList_info.createDataTable();
        dtList_info.reload();

        $("#div_payY").find("#payPlatformArea").html(util.getCommonCodeSelect('-1', payPlatform));
        $("#div_payY").find("#payWayArea").html(util.getCommonCodeSelect('all', payWay));
        $("#div_payY").find("#payInnerArea").html(util.getCommonCodeSelect('0', innerType));
    }

    function sel_change_pay(){
        dtList_info.reload();
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