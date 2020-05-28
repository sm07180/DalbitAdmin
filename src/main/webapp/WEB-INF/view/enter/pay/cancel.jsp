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
            <colgroup>
                <col width="16%"/><col width="14%"/><col width="14%"/><col width="14%"/><col width="14%"/>
                <col width="14%"/><col width="14%"/>
            </colgroup>
            <thead>
            <tr>
                <th rowspan="2">시간대</th>
                <th colspan="2">소계</th>
                <th colspan="2">남성</th>
                <th colspan="2">여성</th>
            </tr>
            <tr>
                <th>건</th>
                <th>금액</th>
                <th>건</th>
                <th>금액</th>
                <th>건</th>
                <th>금액</th>
            </tr>
            </thead>
            <tbody id="cancelTableBody"></tbody>
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
        getPayCancelList ();
    });

    function getPayCancelList (){
        util.getAjaxData("cancel", "/rest/enter/pay/pay/cancel", $("#searchForm").serialize(), fn_cancelPay_success);
    }

    function fn_cancelPay_success(data, response){
        var isDataEmpty = response.data.detailList == null;
        $("#cancelTableBody").empty();
        if(!isDataEmpty){
            var template = $('#tmp_cancel').html();
            var templateScript = Handlebars.compile(template);
            var totalContext = response.data.totalInfo;
            var totalHtml = templateScript(totalContext);
            $("#cancelTableBody").append(totalHtml);

            response.data.detailList.slctType = $('input[name="slctType"]:checked').val();
        }

        var template = $('#tmp_cancelDetailList').html();
        var templateScript = Handlebars.compile(template);
        var detailContext = response.data.detailList;
        var html=templateScript(detailContext);
        $("#cancelTableBody").append(html);

        if(isDataEmpty){
            $("#cancelTableBody td:last").remove();
        }else{
            $("#cancelTableBody").append(totalHtml);
        }
    }
</script>
<script type="text/x-handlebars-template" id="tmp_cancel">
    <tr class="success font-bold">
        <td>소계</td>
        <td>{{addComma sum_totalCnt}}</td>
        <td>{{addComma sum_totalAmt}}</td>
        <td>{{addComma sum_maleCnt}}</td>
        <td>{{addComma sum_maleAmt}}</td>
        <td>{{addComma sum_femaleCnt}}</td>
        <td>{{addComma sum_femaleAmt}}</td>
    </tr>
</script>

<script type="text/x-handlebars-template" id="tmp_cancelDetailList">
    {{#each this as |data|}}
    <tr>
        <td class="font-bold">
            {{#equal ../slctType 0}}{{data.hour}}시{{/equal}}
            {{#equal ../slctType 1}}{{data.daily}}{{/equal}}
            {{#equal ../slctType 2}}{{data.monthly}}월{{/equal}}
        </td>
        <td>{{addComma totalCnt}}</td>
        <td>{{addComma totalAmt}}</td>
        <td>{{addComma maleCnt}}</td>
        <td>{{addComma maleAmt}}</td>
        <td>{{addComma femaleCnt}}</td>
        <td>{{addComma femaleAmt}}</td>
    </tr>
    {{else}}
    <td colspan="11" class="noData">{{isEmptyData}}<td>
        {{/each}}
</script>