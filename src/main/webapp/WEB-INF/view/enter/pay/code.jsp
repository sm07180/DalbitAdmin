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
                <th colspan="2">5,500원</th>
                <th colspan="2">11,000원</th>
                <th colspan="2">55,000원</th>
                <th colspan="2">110,000원</th>
                <th colspan="2">220,000원</th>
                <th colspan="2">330,000원</th>
                <th colspan="2">5,900원</th>
                <th colspan="2">12,000원</th>
                <th colspan="2">36,000원</th>
                <th colspan="2">50,000원</th>
                <th colspan="2">109,000원</th>
                <th colspan="2">299,000원</th>
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
                <th>건</th>
                <th>금액</th>
            </tr>
            </thead>
            <tbody id="codeTableBody"></tbody>
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
        getPayCodeList ();
    });

    function getPayCodeList (){
        util.getAjaxData("code", "/rest/enter/pay/pay/code", $("#searchForm").serialize(), fn_codePay_success);
    }

    function fn_codePay_success(data, response){
        var isDataEmpty = response.data.detailList == null;
        $("#codeTableBody").empty();
        if(!isDataEmpty){
            var template = $('#tmp_code').html();
            var templateScript = Handlebars.compile(template);
            var totalContext = response.data.totalInfo;
            var totalHtml = templateScript(totalContext);
            $("#codeTableBody").append(totalHtml);

            response.data.detailList.slctType = $('input[name="slctType"]:checked').val();
        }

        var template = $('#tmp_codeDetailList').html();
        var templateScript = Handlebars.compile(template);
        var detailContext = response.data.detailList;
        var html=templateScript(detailContext);
        $("#codeTableBody").append(html);

        if(isDataEmpty){
            $("#codeTableBody td:last").remove();
        }else{
            $("#codeTableBody").append(totalHtml);
        }
    }
</script>
<script type="text/x-handlebars-template" id="tmp_code">
    <tr class="success font-bold">
        <td>소계</td>
        <td>{{addComma sum_totalCnt}}</td>
        <td>{{addComma sum_totalAmt}}</td>
        <td>{{addComma sum_code01Cnt}}</td>
        <td>{{addComma sum_code01Amt}}</td>
        <td>{{addComma sum_code02Cnt}}</td>
        <td>{{addComma sum_code02Amt}}</td>
        <td>{{addComma sum_code03Cnt}}</td>
        <td>{{addComma sum_code03Amt}}</td>
        <td>{{addComma sum_code04Cnt}}</td>
        <td>{{addComma sum_code04Amt}}</td>
        <td>{{addComma sum_code05Cnt}}</td>
        <td>{{addComma sum_code05Amt}}</td>
        <td>{{addComma sum_code06Cnt}}</td>
        <td>{{addComma sum_code06Amt}}</td>
        <td>{{addComma sum_code07Cnt}}</td>
        <td>{{addComma sum_code07Amt}}</td>
        <td>{{addComma sum_code08Cnt}}</td>
        <td>{{addComma sum_code08Amt}}</td>
        <td>{{addComma sum_code09Cnt}}</td>
        <td>{{addComma sum_code09Amt}}</td>
        <td>{{addComma sum_code10Cnt}}</td>
        <td>{{addComma sum_code10Amt}}</td>
        <td>{{addComma sum_code11Cnt}}</td>
        <td>{{addComma sum_code11Amt}}</td>
        <td>{{addComma sum_code12Cnt}}</td>
        <td>{{addComma sum_code12Amt}}</td>
    </tr>
</script>

<script type="text/x-handlebars-template" id="tmp_codeDetailList">
    {{#each this as |data|}}
    <tr>
        <td class="font-bold">
            {{#equal ../slctType 0}}{{data.hour}}시{{/equal}}
            {{#equal ../slctType 1}}{{data.daily}}{{/equal}}
            {{#equal ../slctType 2}}{{data.monthly}}월{{/equal}}
        </td>
        <td>{{addComma totalCnt}}</td>
        <td>{{addComma totalAmt}}</td>
        <td>{{addComma code01Cnt}}</td>
        <td>{{addComma code01Amt}}</td>
        <td>{{addComma code02Cnt}}</td>
        <td>{{addComma code02Amt}}</td>
        <td>{{addComma code03Cnt}}</td>
        <td>{{addComma code03Amt}}</td>
        <td>{{addComma code04Cnt}}</td>
        <td>{{addComma code04Amt}}</td>
        <td>{{addComma code05Cnt}}</td>
        <td>{{addComma code05Amt}}</td>
        <td>{{addComma code06Cnt}}</td>
        <td>{{addComma code06Amt}}</td>
        <td>{{addComma code07Cnt}}</td>
        <td>{{addComma code07Amt}}</td>
        <td>{{addComma code08Cnt}}</td>
        <td>{{addComma code08Amt}}</td>
        <td>{{addComma code09Cnt}}</td>
        <td>{{addComma code09Amt}}</td>
        <td>{{addComma code10Cnt}}</td>
        <td>{{addComma code10Amt}}</td>
        <td>{{addComma code11Cnt}}</td>
        <td>{{addComma code11Amt}}</td>
        <td>{{addComma code12Cnt}}</td>
        <td>{{addComma code12Amt}}</td>
    </tr>
    {{else}}
    <td colspan="11" class="noData">{{isEmptyData}}<td>
        {{/each}}
</script>