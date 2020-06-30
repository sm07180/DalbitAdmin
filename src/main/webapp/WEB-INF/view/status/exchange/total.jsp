<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 회원가입 > 총계 -->
<div class="widget widget-table mb10">
    <div class="widget-content mt10">
        <%--<a href="javascript://" class="_prevSearch">[이전]</a>--%>
        <span class="_searchDate"></span>
        <%--<a href="javascript://" class="_nextSearch">[다음]</a>--%>
        <table class="table table-bordered">
            <colgroup>
                <col width="10%"/><col width="9%"/><col width="9%"/><col width="9%"/><col width="9%"/>
                <col width="9%"/><col width="9%"/><col width="9%"/><col width="9%"/><col width="9%"/>
            </colgroup>
            <thead>
            <tr>
                <th rowspan="2">시간대</th>
                <th colspan="2">환전신청</th>
                <th colspan="2">환전완료</th>
                <th colspan="2">환전불가</th>
            </tr>
            <tr>
                <th>건수</th>
                <th>금액</th>
                <th>건수</th>
                <th>금액</th>
                <th>건수</th>
                <th>금액</th>
            </tr>
            </thead>
            <tbody id="totalTableBody"></tbody>
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
        util.getAjaxData("total", "/rest/status/exchange/total", $("#searchForm").serialize(), fn_total_success);
    }

    function fn_total_success(data, response){
        dalbitLog(response);
        var isDataEmpty = response.data.detailList == null;
        $("#totalTableBody").empty();
        if(!isDataEmpty){
            var template = $('#tmp_total').html();
            var templateScript = Handlebars.compile(template);
            var totalContext = response.data.totalInfo;
            var totalHtml = templateScript(totalContext);
            $("#totalTableBody").append(totalHtml);

            response.data.detailList.slctType = $('input[name="slctType"]:checked').val()
        }

        var template = $('#tmp_detailList').html();
        var templateScript = Handlebars.compile(template);
        var detailContext = response.data.detailList;
        var html=templateScript(detailContext);
        $("#totalTableBody").append(html);

        if(isDataEmpty){
            $("#totalTableBody td:last").remove();
        }else{
            $("#totalTableBody").append(totalHtml);
        }
    }
</script>
<script type="text/x-handlebars-template" id="tmp_total">
    <tr class="success font-bold">
        <td>소계</td>
        <td>{{addComma sum_tryCnt}}</td>
        <td>{{addComma sum_tryAmt}}</td>
        <td>{{addComma sum_succCnt}}</td>
        <td>{{addComma sum_succAmt}}</td>
        <td>{{addComma sum_cancCnt}}</td>
        <td>{{addComma sum_cancAmt}}</td>
    </tr>
</script>

<script type="text/x-handlebars-template" id="tmp_detailList">
    {{#each this as |data|}}
    <tr>
        <td class="font-bold">
            {{#equal ../slctType 0}}{{data.hour}}시{{/equal}}
            {{#equal ../slctType 1}}{{data.daily}}일{{/equal}}
            {{#equal ../slctType 2}}{{data.monthly}}월{{/equal}}
        </td>
        <td>{{addComma tryCnt}}</td>
        <td>{{addComma tryAmt}}</td>
        <td>{{addComma succCnt}}</td>
        <td>{{addComma succAmt}}</td>
        <td>{{addComma cancCnt}}</td>
        <td>{{addComma cancAmt}}</td>
    </tr>
    {{else}}
        <td colspan="11" class="noData">{{isEmptyData}}<td>
    {{/each}}
</script>