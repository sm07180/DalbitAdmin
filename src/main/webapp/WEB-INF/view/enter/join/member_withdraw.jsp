<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 회원가입 > 회원 탈퇴 -->
<div class="widget widget-table mb10">
    <div class="widget-content mt10">
        <span class="_searchDate"></span>
        <table class="table table-bordered">
            <colgroup>
                <col width="10%"/><col width="9%"/><col width="9%"/><col width="9%"/><col width="9%"/>
                <col width="9%"/><col width="9%"/><col width="9%"/><col width="9%"/><col width="9%"/>
                <col width="9%"/>
            </colgroup>
            <thead>
            <tr>
                <th></th>
                <th>소계</th>
                <th class="_sex_male"></th>
                <th class="_sex_female"></th>
                <th>알 수 없음</th>

                <th>10대</th>
                <th>20대</th>
                <th>30대</th>
                <th>40대</th>
                <th>50대</th>
                <th>60대 이상</th>
            </tr>
            </thead>
            <tbody id="withdrawTableBody"></tbody>
        </table>
    </div>
    <div class="widget-footer">
        <span>
            <%--<button class="btn btn-default print-btn pull-right" type="button" id="excelDownBtn"><i class="fa fa-print"></i>Excel Down</button>--%>
        </span>
    </div>
</div>

<script type="text/javascript">
    function getWithdrawList(){
        util.getAjaxData("withdrawList", "/rest/enter/join/info/withdraw", $("#searchForm").serialize(), fn_withdraw_success);
    }

    function fn_withdraw_success(data, response){
        var isDataEmpty = response.data.detailList == null;
        var tableBody = $("#withdrawTableBody");

        tableBody.empty();
        if(!isDataEmpty){
            var template = $('#tmp_withdrawTotal').html();
            var templateScript = Handlebars.compile(template);
            var totalContext = response.data.totalInfo;
            var totalHtml = templateScript(totalContext);
            tableBody.append(totalHtml);

            response.data.detailList.slctType = $('input[name="slctType"]:checked').val()
        }

        var template = $('#tmp_withdrawDetailList').html();
        var templateScript = Handlebars.compile(template);
        var detailContext = response.data.detailList;
        var html=templateScript(detailContext);
        tableBody.append(html);

        if(isDataEmpty){
            $("#withdrawTableBody td:last").remove();
        }else{
            tableBody.append(totalHtml);
        }
    }
</script>

<script type="text/x-handlebars-template" id="tmp_withdrawTotal">
    <tr class="success font-bold">
        <td>소계</td>
        <td>{{addComma sum_totalCnt}}</td>
        <td>{{addComma sum_maleCnt}}</td>
        <td>{{addComma sum_femaleCnt}}</td>
        <td>{{addComma sum_noneCnt}}</td>
        <td>{{addComma sum_age10Cnt}}</td>
        <td>{{addComma sum_age20Cnt}}</td>
        <td>{{addComma sum_age30Cnt}}</td>
        <td>{{addComma sum_age40Cnt}}</td>
        <td>{{addComma sum_age50Cnt}}</td>
        <td>{{addComma sum_age60Cnt}}</td>
    </tr>
</script>

<script type="text/x-handlebars-template" id="tmp_withdrawDetailList">
    {{#each this as |data|}}
        <tr>
            <td class="font-bold">
                {{#equal ../slctType 0}}{{data.hour}}시{{/equal}}
                {{#equal ../slctType 1}}{{substr data.daily 8}}일{{/equal}}
                {{#equal ../slctType 2}}{{data.monthly}}월{{/equal}}
            </td>
            <td>{{addComma totalCnt}}</td>
            <td style="color: blue">{{addComma maleCnt}}</td>
            <td style="color: red">{{addComma femaleCnt}}</td>
            <td>{{addComma noneCnt}}</td>
            <td>{{addComma age10Cnt}}</td>
            <td>{{addComma age20Cnt}}</td>
            <td>{{addComma age30Cnt}}</td>
            <td>{{addComma age40Cnt}}</td>
            <td>{{addComma age50Cnt}}</td>
            <td>{{addComma age60Cnt}}</td>
        </tr>
    {{else}}
        <tr>
            <td colspan="20" class="noData">{{isEmptyData}}<td>
        </tr>
    {{/each}}
</script>