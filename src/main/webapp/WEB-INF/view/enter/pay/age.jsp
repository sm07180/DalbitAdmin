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
                <th colspan="2">총계</th>
                <th colspan="2">남성</th>
                <th colspan="2">여성</th>
                <th colspan="2">알수없음</th>
                <th colspan="2">10대</th>
                <th colspan="2">20대</th>
                <th colspan="2">30대</th>
                <th colspan="2">40대</th>
                <th colspan="2">50대</th>
                <th colspan="2">60대이상</th>
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
            </tr>
            </thead>
            <tbody id="ageTableBody"></tbody>
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
        getPayAgeList ();
    });

    function getPayAgeList (){
        util.getAjaxData("age", "/rest/enter/pay/pay/age", $("#searchForm").serialize(), fn_agePay_success);
    }

    function fn_agePay_success(data, response){
        var isDataEmpty = response.data.detailList == null;
        $("#ageTableBody").empty();
        if(!isDataEmpty){
            var template = $('#tmp_age').html();
            var templateScript = Handlebars.compile(template);
            var totalContext = response.data.totalInfo;
            var totalHtml = templateScript(totalContext);
            $("#ageTableBody").append(totalHtml);

            response.data.detailList.slctType = $('input[name="slctType"]:checked').val();
        }

        var template = $('#tmp_ageDetailList').html();
        var templateScript = Handlebars.compile(template);
        var detailContext = response.data.detailList;
        var html=templateScript(detailContext);
        $("#ageTableBody").append(html);

        if(isDataEmpty){
            $("#ageTableBody td:last").remove();
        }else{
            $("#ageTableBody").append(totalHtml);
        }
    }
</script>
<script type="text/x-handlebars-template" id="tmp_age">
    <tr class="success font-bold">
        <td>소계</td>
        <td>{{addComma sum_totalCnt}}</td>
        <td>{{addComma sum_totalAmt}}</td>
        <td>{{addComma sum_maleCnt}}</td>
        <td>{{addComma sum_maleAmt}}</td>
        <td>{{addComma sum_femaleCnt}}</td>
        <td>{{addComma sum_femaleAmt}}</td>
        <td>{{addComma sum_noneCnt}}</td>
        <td>{{addComma sum_noneAmt}}</td>
        <td>{{addComma sum_age10Cnt}}</td>
        <td>{{addComma sum_age10Amt}}</td>
        <td>{{addComma sum_age20Cnt}}</td>
        <td>{{addComma sum_age20Amt}}</td>
        <td>{{addComma sum_age30Cnt}}</td>
        <td>{{addComma sum_age30Amt}}</td>
        <td>{{addComma sum_age40Cnt}}</td>
        <td>{{addComma sum_age40Amt}}</td>
        <td>{{addComma sum_age50Cnt}}</td>
        <td>{{addComma sum_age50Amt}}</td>
        <td>{{addComma sum_age60Cnt}}</td>
        <td>{{addComma sum_age60Amt}}</td>
    </tr>
</script>

<script type="text/x-handlebars-template" id="tmp_ageDetailList">
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
        <td>{{addComma noneCnt}}</td>
        <td>{{addComma noneAmt}}</td>
        <td>{{addComma age10Cnt}}</td>
        <td>{{addComma age10Amt}}</td>
        <td>{{addComma age20Cnt}}</td>
        <td>{{addComma age20Amt}}</td>
        <td>{{addComma age30Cnt}}</td>
        <td>{{addComma age30Amt}}</td>
        <td>{{addComma age40Cnt}}</td>
        <td>{{addComma age40Amt}}</td>
        <td>{{addComma age50Cnt}}</td>
        <td>{{addComma age50Amt}}</td>
        <td>{{addComma age60Cnt}}</td>
        <td>{{addComma age60Amt}}</td>
    </tr>
    {{else}}
    <td colspan="11" class="noData">{{isEmptyData}}<td>
        {{/each}}
</script>