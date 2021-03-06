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
                <col width="5.2%"/><col width="5.2%"/><col width="5.2%"/><col width="5.2%"/><col width="5.2%"/>
                <col width="5.2%"/><col width="5.2%"/><col width="5.2%"/><col width="5.2%"/><col width="5.2%"/>
                <col width="5.2%"/><col width="5.2%"/><col width="5.2%"/><col width="5.2%"/><col width="5.2%"/>
                <col width="5.2%"/><col width="5.2%"/><col width="5.2%"/><col width="5.2%"/>
            </colgroup>
            <thead>
            <tr>
                <th rowspan="2"></th>
                <th colspan="2">총계</th>
                <th colspan="2">휴대폰<i class="fa fa-tablet"></i></th>
                <th colspan="2">카드<i class="fa fa-credit-card"></i></th>
                <th colspan="2">인앱결제(아이폰)<i class="fa fa-apple"></i></th>
                <th colspan="2">가상계좌아체<i class="fa fa-money"></i></th>
                <th colspan="2">문화상품권<i class="fa fa-barcode"></i></th>
                <th colspan="2">해피머니상품권<i class="fa fa-smile-o"></i></th>
                <%--<th colspan="2">스마트문상(게임)<i class="fa fa-gamepad"></i></th>--%>
                <%--<th colspan="2">도서문화상품권<i class="fa fa-book"></i></th>--%>
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
                <th>건</th>
                <th>금액</th>
                <th>건</th>
                <th>금액</th>
                <th>건</th>
                <th>금액</th>
                <%--<th>건</th>--%>
                <%--<th>금액</th>--%>
                <%--<th>건</th>--%>
                <%--<th>금액</th>--%>
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
        util.getAjaxData("way", "/rest/enter/pay/way", $("#searchForm").serialize(), fn_wayPay_success);
    }

    function fn_wayPay_success(data, response){
        for(var i=0;i<response.data.detailList.length;i++){
            response.data.detailList[i]["sum_totalCnt"] = response.data.totalInfo.sum_totalCnt;
            response.data.detailList[i]["sum_totalAmt"] = response.data.totalInfo.sum_totalAmt;
        }
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
        <td style="font-weight:bold;color: #ff5600;">{{addComma sum_totalCnt}}<br/>({{average sum_totalCnt sum_totalCnt}}%)</td>
        <td style="font-weight:bold;color: #ff5600;"><b>{{vatMinus sum_totalAmt}}<br/>({{average sum_totalAmt sum_totalAmt}}%)</b></td>
        <td>{{addComma sum_mcCnt}}</td>
        <td>{{vatMinus sum_mcAmt}}</td>
        <td>{{addComma sum_cnCnt}}</td>
        <td>{{vatMinus sum_cnAmt}}</td>
        <td>{{addComma sum_inappCnt}}</td>
        <td>{{vatMinus sum_inappAmt}}</td>
        <td>{{addComma sum_vaCnt}}</td>
        <td>{{vatMinus sum_vaAmt}}</td>
        <td>{{addComma sum_gmCnt}}</td>
        <td>{{vatMinus sum_gmAmt}}</td>
        <td>{{addComma sum_hmCnt}}</td>
        <td>{{vatMinus sum_hmAmt}}</td>
        <%--<td>{{vatMinus sum_ggCnt}}</td>--%>
        <%--<td>{{vatMinus sum_ggAmt}}</td>--%>
        <%--<td>{{vatMinus sum_gcCnt}}</td>--%>
        <%--<td>{{vatMinus sum_gcAmt}}</td>--%>
    </tr>
</script>

<script type="text/x-handlebars-template" id="tmp_wayDetailList">
    {{#each this as |data|}}
    <tr>
        <td class="font-bold">
            {{#equal ../slctType 0}}{{data.hour}}시{{/equal}}
            {{#equal ../slctType 1}}{{substr data.daily 8}}일{{/equal}}
            {{#equal ../slctType 2}}{{data.monthly}}월{{/equal}}
        </td>
        <td>{{addComma totalCnt}}<br/>({{average totalCnt sum_totalCnt}}%)</td>
        <td style="font-weight:bold">{{vatMinus totalAmt}}<br/>({{average totalAmt sum_totalAmt}}%)</td>
        <td>{{addComma mcCnt}}</td>
        <td>{{vatMinus mcAmt}}</td>
        <td>{{addComma cnCnt}}</td>
        <td>{{vatMinus cnAmt}}</td>
        <td>{{addComma inappCnt}}</td>
        <td>{{vatMinus inappAmt}}</td>
        <td>{{addComma vaCnt}}</td>
        <td>{{vatMinus vaAmt}}</td>
        <td>{{addComma gmCnt}}</td>
        <td>{{vatMinus gmAmt}}</td>
        <td>{{addComma hmCnt}}</td>
        <td>{{vatMinus hmAmt}}</td>
        <%--<td>{{vatMinus ggCnt}}</td>--%>
        <%--<td>{{vatMinus ggAmt}}</td>--%>
        <%--<td>{{vatMinus gcCnt}}</td>--%>
        <%--<td>{{vatMinus gcAmt}}</td>--%>

    </tr>
    {{else}}
    <td colspan="11" class="noData">{{isEmptyData}}<td>
        {{/each}}
</script>