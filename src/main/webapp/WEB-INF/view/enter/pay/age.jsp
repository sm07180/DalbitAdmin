<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 결제환불 > 총계 -->
<div class="widget widget-table mb10">
    <div class="widget-content mt10">
        <%--<a href="javascript://" class="_prevSearch">[이전]</a>--%>
        <span class="_searchDate"></span>
        <%--<a href="javascript://" class="_nextSearch">[다음]</a>--%>
        <table class="table table-bordered">
            <colgroup>
                <col width="4%"/><col width="4%"/><col width="4%"/><col width="4%"/><col width="4%"/>
                <col width="4%"/><col width="4%"/><col width="4%"/><col width="4%"/><col width="1%"/>
                <col width="4%"/><col width="4%"/><col width="4%"/><col width="4%"/><col width="4%"/>
                <col width="4%"/><col width="4%"/><col width="4%"/><col width="4%"/><col width="4%"/>
                <col width="4%"/><col width="4%"/><col width="4%"/><col width="4%"/><col width="4%"/>
            </colgroup>
            <thead>
            <tr>
                <th colspan="9">성별</th>
                <th style="background-color: white; border-bottom: hidden;border-top: hidden;"></th>
                <th colspan="15">연령대별</th>
            </tr>
            <tr>
                <th rowspan="2"></th>
                <th colspan="2">총계</th>
                <th colspan="2" class="_sex_male"></th>
                <th colspan="2" class="_sex_female"></th>
                <th colspan="2">알수없음</th>
                <th rowspan="2" style="background-color: white; border-bottom: hidden;"></th>
                <th rowspan="2"></th>
                <th colspan="2">총계</th>
                <th colspan="2">10대</th>
                <th colspan="2">20대</th>
                <th colspan="2">30대</th>
                <th colspan="2">40대</th>
                <th colspan="2">50대</th>
                <th colspan="2">60대이상</th>
            </tr>
            <tr>
                <th>건(비율)</th>
                <th>금액(비율)</th>
                <th>건</th>
                <th>금액</th>
                <th>건</th>
                <th>금액</th>
                <th>건</th>
                <th>금액</th>
                <th>건(비율)</th>
                <th>금액(비율)</th>
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
        util.getAjaxData("age", "/rest/enter/pay/age", $("#searchForm").serialize(), fn_agePay_success);
    }

    function fn_agePay_success(data, response){

        for(var i=0;i<response.data.detailList.length;i++){
            response.data.detailList[i]["sum_totalCnt"] = response.data.totalInfo.sum_totalCnt;
            response.data.detailList[i]["sum_totalAmt"] = response.data.totalInfo.sum_totalAmt;
        }

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
        <td style="color:#ff5600;"><b>{{addComma sum_totalCnt}}<br/>({{average sum_totalCnt sum_totalCnt}}%)</b></td>
        <td style="color:#ff5600;"><b>{{vatMinus sum_totalAmt}}<br/>({{average sum_totalAmt sum_totalAmt}}%)</b></td>
        <td style="color: blue;">{{addComma sum_maleCnt}}</td>
        <td style="color: blue;">{{vatMinus sum_maleAmt}}</td>
        <td style="color: red;">{{addComma sum_femaleCnt}}</td>
        <td style="color: red;">{{vatMinus sum_femaleAmt}}</td>
        <td>{{addComma sum_noneCnt}}</td>
        <td>{{vatMinus sum_noneAmt}}</td>
        <td style="background-color: white;border-bottom: hidden;"></td>
        <td>소계</td>
        <td style="color:#ff5600;"><b>{{addComma sum_totalCnt}}<br/>({{average sum_totalCnt sum_totalCnt}}%)</b></td>
        <td style="color:#ff5600;"><b>{{vatMinus sum_totalAmt}}<br/>({{average sum_totalAmt sum_totalAmt}}%)</b></td>
        <td>{{addComma sum_age10Cnt}}</td>
        <td>{{vatMinus sum_age10Amt}}</td>
        <td>{{addComma sum_age20Cnt}}</td>
        <td>{{vatMinus sum_age20Amt}}</td>
        <td>{{addComma sum_age30Cnt}}</td>
        <td>{{vatMinus sum_age30Amt}}</td>
        <td>{{addComma sum_age40Cnt}}</td>
        <td>{{vatMinus sum_age40Amt}}</td>
        <td>{{addComma sum_age50Cnt}}</td>
        <td>{{vatMinus sum_age50Amt}}</td>
        <td>{{addComma sum_age60Cnt}}</td>
        <td>{{vatMinus sum_age60Amt}}</td>
    </tr>
</script>

<script type="text/x-handlebars-template" id="tmp_ageDetailList">
    {{#each this as |data|}}
    <tr>
        <td class="font-bold">
            {{#equal ../slctType 0}}{{data.hour}}시{{/equal}}
            {{#equal ../slctType 1}}{{substr data.daily 8}}일{{/equal}}
            {{#equal ../slctType 2}}{{data.monthly}}월{{/equal}}
        </td>
        <td>{{addComma totalCnt}}<br/>({{average totalCnt sum_totalCnt}}%)</td>
        <td><b>{{vatMinus totalAmt}}<br/>({{average totalAmt sum_totalAmt}}%)</b></td>
        <td style="color: blue;">{{addComma maleCnt}}</td>
        <td style="color: blue;">{{vatMinus maleAmt}}</td>
        <td style="color: red;">{{addComma femaleCnt}}</td>
        <td style="color: red;">{{vatMinus femaleAmt}}</td>
        <td>{{addComma noneCnt}}</td>
        <td>{{vatMinus noneAmt}}</td>
        <td style="border-bottom: hidden;"></td>
        <td class="font-bold">
            {{#equal ../slctType 0}}{{data.hour}}시{{/equal}}
            {{#equal ../slctType 1}}{{substr data.daily 8}}일{{/equal}}
            {{#equal ../slctType 2}}{{data.monthly}}월{{/equal}}
        </td>
        <td>{{addComma totalCnt}}<br/>({{average totalCnt sum_totalCnt}}%)</td>
        <td><b>{{vatMinus totalAmt}}<br/>({{average totalAmt sum_totalAmt}}%)</b></td>
        <td>{{addComma age10Cnt}}</td>
        <td>{{vatMinus age10Amt}}</td>
        <td>{{addComma age20Cnt}}</td>
        <td>{{vatMinus age20Amt}}</td>
        <td>{{addComma age30Cnt}}</td>
        <td>{{vatMinus age30Amt}}</td>
        <td>{{addComma age40Cnt}}</td>
        <td>{{vatMinus age40Amt}}</td>
        <td>{{addComma age50Cnt}}</td>
        <td>{{vatMinus age50Amt}}</td>
        <td>{{addComma age60Cnt}}</td>
        <td>{{vatMinus age60Amt}}</td>
    </tr>
    {{else}}
    <td colspan="11" class="noData">{{isEmptyData}}<td>
        {{/each}}
</script>