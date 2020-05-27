<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 결제환불 > 총계 -->
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
        <table class="table table-bordered">
            <thead>
            <tr>
                <th rowspan="2">시간대</th>
                <th colspan="2">소계</th>
                <th colspan="2">휴대폰</th>
                <th colspan="2">카드</th>
                <th colspan="2">인앱결제(아이폰)</th>
                <th colspan="2">실시간 계좌이체</th>
                <th colspan="2">무통장 입금</th>
            </tr>
            <tr>
                <th>건</th>
                <th>금액</th>
                <th>건</th>
                <th>금액</th>
                <th>건</th>
                <th>금액</th>
                <th>건</th>
                <th>금액</th>
                <th>건</th>
                <th>금액</th>
                <th>건</th>
                <th>금액</th>
            </tr>
            </thead>
            <tbody id="wayTableBody"></tbody>
        </table>
    </div>
    <div class="widget-footer">
        <span>
            <%--<button class="btn btn-default print-btn pull-right" type="button" id="excelDownBtn"><i class="fa fa-print"></i>Excel Down</button>--%>
        </span>
    </div>
</div>

<script type="text/javascript">
    $(function(){
        getPayWayList ();
    });

    function getPayWayList (){
        util.getAjaxData("way", "/rest/enter/pay/pay/way", $("#searchForm").serialize(), fn_wayPay_success);
    }

    function fn_wayPay_success(data, response){
        var isDataEmpty = response.data.detailList == null;
        $("#wayTableBody").empty();
        if(!isDataEmpty){
            var template = $('#tmp_way').html();
            var templateScript = Handlebars.compile(template);
            var totalContext = response.data.totalInfo;
            var totalHtml = templateScript(totalContext);
            $("#wayTableBody").append(totalHtml);

            response.data.detailList.slctType = $('input[name="slctType"]:checked').val();
        }

        var template = $('#tmp_wayDetailList').html();
        var templateScript = Handlebars.compile(template);
        var detailContext = response.data.detailList;
        var html=templateScript(detailContext);
        $("#wayTableBody").append(html);

        if(isDataEmpty){
            $("#wayTableBody td:last").remove();
        }else{
            $("#wayTableBody").append(totalHtml);
        }
    }
</script>
<script type="text/x-handlebars-template" id="tmp_way">
    <tr class="success font-bold">
        <td>소계</td>
        <td>{{addComma sum_totalCnt}}</td>
        <td>{{addComma sum_totalAmt}}</td>
        <td>{{addComma sum_mcCnt}}</td>
        <td>{{addComma sum_mcAmt}}</td>
        <td>{{addComma sum_cnCnt}}</td>
        <td>{{addComma sum_cnAmt}}</td>
        <td>{{addComma sum_inappCnt}}</td>
        <td>{{addComma sum_inappAmt}}</td>
        <td>{{addComma sum_raCnt}}</td>
        <td>{{addComma sum_raAmt}}</td>
        <td>{{addComma sum_vaCnt}}</td>
        <td>{{addComma sum_vaAmt}}</td>
    </tr>
</script>

<script type="text/x-handlebars-template" id="tmp_wayDetailList">
    {{#each this as |data|}}
    <tr>
        <td class="font-bold">
            {{#equal ../slctType 0}}{{data.hour}}시{{/equal}}
            {{#equal ../slctType 1}}{{data.daily}}{{/equal}}
            {{#equal ../slctType 2}}{{data.monthly}}월{{/equal}}
        </td>
        <td>{{addComma totalCnt}}</td>
        <td>{{addComma totalAmt}}</td>
        <td>{{addComma mcCnt}}</td>
        <td>{{addComma mcAmt}}</td>
        <td>{{addComma cnCnt}}</td>
        <td>{{addComma cnAmt}}</td>
        <td>{{addComma inappCnt}}</td>
        <td>{{addComma inappAmt}}</td>
        <td>{{addComma raCnt}}</td>
        <td>{{addComma raAmt}}</td>
        <td>{{addComma vaCnt}}</td>
        <td>{{addComma vaAmt}}</td>
    </tr>
    {{else}}
    <td colspan="11" class="noData">{{isEmptyData}}<td>
        {{/each}}
</script>