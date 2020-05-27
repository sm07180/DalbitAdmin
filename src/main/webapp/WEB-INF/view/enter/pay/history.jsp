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
    <div class="widget-header">
        <div class="btn-group widget-header-toolbar">
            <a href="#" title="Expand/Collapse" class="btn-borderless btn-toggle-expand"><i class="fa fa-chevron-up"></i></a>
        </div>
    </div>
    <div class="widget-content mt10">
        <a href="javascript://" class="_prevSearch">[이전]</a>
        <span class="_searchDate"></span>
        <a href="javascript://" class="_nextSearch">[다음]</a>
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
        var sDate = $("#startDate").val().replace(/\./gi,'');
        var eDate = $("#endDate").val().replace(/\./gi,'');

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
            data.ostype = -1;
            data.searchPayStatus = -1;
            data.innerType = -1;
            data.payWay = "all";
        };
        dtList_info = new DalbitDataTable($("#list_info"), dtList_info_data, payDataTableSource.payHistory);
        dtList_info.useCheckBox(false);
        dtList_info.useIndex(true);
        dtList_info.setPageLength(50);
        dtList_info.createDataTable();
        dtList_info.reload();
    }

</script>