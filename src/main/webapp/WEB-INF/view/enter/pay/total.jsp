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
        <%--<a href="javascript://" class="_prevSearch">[이전]</a>--%>
        <span class="_searchDate"></span>
        <%--<a href="javascript://" class="_nextSearch">[다음]</a>--%>
        <table class="table table-bordered">
            <colgroup>
                <col width="16%"/><col width="14%"/><col width="14%"/><col width="14%"/><col width="14%"/>
                <col width="14%"/><col width="14%"/>
            </colgroup>
            <thead>
            <tr>
                <th>시간대</th>
                <th>결제 건</th>
                <th>결제 금액</th>
                <th>결제 시도</th>
                <th>성공률</th>
                <th>결제 취소 건수</th>
                <th>취소 금액</th>
            </tr>
            </thead>
            <tbody id="tableBody"></tbody>
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
        getTotalList();
    });

    function getTotalList(){
        util.getAjaxData("total", "/rest/enter/pay/pay/total", $("#searchForm").serialize(), fn_totalPay_success);
    }

    function fn_totalPay_success(data, response){
        var isDataEmpty = response.data.detailList == null;
        $("#tableBody").empty();
        if(!isDataEmpty){
            var template = $('#tmp_total').html();
            var templateScript = Handlebars.compile(template);
            var totalContext = response.data.totalInfo;
            var totalHtml = templateScript(totalContext);
            $("#tableBody").append(totalHtml);

            response.data.detailList.slctType = $('input[name="slctType"]:checked').val();
        }

        var template = $('#tmp_detailList').html();
        var templateScript = Handlebars.compile(template);
        var detailContext = response.data.detailList;
        var html=templateScript(detailContext);
        $("#tableBody").append(html);

        if(isDataEmpty){
            $("#tableBody td:last").remove();
        }else{
            $("#tableBody").append(totalHtml);
        }
    }
</script>
<script type="text/x-handlebars-template" id="tmp_total">
    <tr class="success font-bold">
        <td>소계</td>
        <td>{{addComma sum_succCnt}}</td>
        <td>{{addComma sum_succAmt}}</td>
        <td>{{addComma sum_tryCnt}}</td>
        <td>{{addComma sum_succRate}}%</td>
        <td>{{addComma sum_cancCnt}}</td>
        <td>{{addComma sum_cancAmt}}</td>
    </tr>
</script>

<script type="text/x-handlebars-template" id="tmp_detailList">
    {{#each this as |data|}}
    <tr>
        <td class="font-bold">
            {{#equal ../slctType 0}}{{data.hour}}시{{/equal}}
            {{#equal ../slctType 1}}{{data.daily}}{{/equal}}
            {{#equal ../slctType 2}}{{data.monthly}}월{{/equal}}
        </td>
        <td>{{addComma succCnt}}</td>
        <td>{{addComma succAmt}}</td>
        <td>{{addComma tryCnt}}</td>
        <td>{{addComma succRate}}%</td>
        <td>{{addComma cancCnt}}</td>
        <td>{{addComma cancAmt}}</td>
    </tr>
    {{else}}
    <td colspan="11" class="noData">{{isEmptyData}}<td>
    {{/each}}
</script>