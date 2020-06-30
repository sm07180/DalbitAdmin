<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 회원가입 > 성별 -->
<div class="widget widget-table mb10">
    <div class="widget-content mt10">
        <span class="_searchDate"></span>
        <table class="table table-bordered">
            <colgroup>
                <col width="14%"/><col width="5%"/><col width="5%"/><col width="5%"/><col width="5%"/>
                <col width="5%"/><col width="5%"/><col width="8%"/><col width="5%"/><col width="5%"/>
                <col width="5%"/><col width="5%"/><col width="5%"/><col width="5%"/><col width="8%"/>
                <col width="8%"/>
            </colgroup>
            <thead>
            <tr>
                <th rowspan="2"></th>
                <th class="_sex_male" colspan="7"></th>
                <th class="_sex_female" colspan="7"></th>
                <th rowspan="2">알 수 없음</th>
            </tr>
            <tr>
                <th>소계</th>
                <th>10대</th>
                <th>20대</th>
                <th>30대</th>
                <th>40대</th>
                <th>50대</th>
                <th>60대 이상</th>

                <th>소계</th>
                <th>10대</th>
                <th>20대</th>
                <th>30대</th>
                <th>40대</th>
                <th>50대</th>
                <th>60대 이상</th>
            </tr>
            </thead>
            <tbody id="genderTableBody"></tbody>
        </table>
    </div>
    <div class="widget-footer">
        <span>
            <%--<button class="btn btn-default print-btn pull-right" type="button" id="excelDownBtn"><i class="fa fa-print"></i>Excel Down</button>--%>
        </span>
    </div>
</div>

<script type="text/javascript">

    function getGenderList(){
        util.getAjaxData("genderList", "/rest/enter/join/info/gender", $("#searchForm").serialize(), fn_genderJoin_success);
    }

    function fn_genderJoin_success(data, response){
        var isDataEmpty = response.data.detailList == null;
        $("#genderTableBody").empty();
        if(!isDataEmpty){
            var template = $('#tmp_genderTotal').html();
            var templateScript = Handlebars.compile(template);
            var totalContext = response.data.totalInfo;
            var totalHtml = templateScript(totalContext);
            $("#genderTableBody").append(totalHtml);

            response.data.detailList.slctType = $('input[name="slctType"]:checked').val()
        }

        var template = $('#tmp_genderDetailList').html();
        var templateScript = Handlebars.compile(template);
        var detailContext = response.data.detailList;
        var html=templateScript(detailContext);
        $("#genderTableBody").append(html);

        if(isDataEmpty){
            $("#genderTableBody td:last").remove();
        }else{
            $("#genderTableBody").append(totalHtml);
        }
    }
</script>

<script type="text/x-handlebars-template" id="tmp_genderTotal">
    <tr class="success font-bold">
        <td>소계</td>
        <td style="color: blue">{{addComma sum_totalMCnt}}</td>
        <td style="color: blue">{{addComma sum_age10MCnt}}</td>
        <td style="color: blue">{{addComma sum_age20MCnt}}</td>
        <td style="color: blue">{{addComma sum_age30MCnt}}</td>
        <td style="color: blue">{{addComma sum_age40MCnt}}</td>
        <td style="color: blue">{{addComma sum_age50MCnt}}</td>
        <td style="color: blue">{{addComma sum_age60MCnt}}</td>
        <td style="color: red">{{addComma sum_totalFCnt}}</td>
        <td style="color: red">{{addComma sum_age10FCnt}}</td>
        <td style="color: red">{{addComma sum_age20FCnt}}</td>
        <td style="color: red">{{addComma sum_age30FCnt}}</td>
        <td style="color: red">{{addComma sum_age40FCnt}}</td>
        <td style="color: red">{{addComma sum_age50FCnt}}</td>
        <td style="color: red">{{addComma sum_age60FCnt}}</td>
        <td>{{addComma sum_totalNCnt}}</td>
    </tr>
</script>

<script type="text/x-handlebars-template" id="tmp_genderDetailList">
    {{#each this as |data|}}
        <tr>
            <td class="font-bold">
                {{#equal ../slctType 0}}{{data.hour}}시{{/equal}}
                {{#equal ../slctType 1}}{{substr data.daily 8}}일{{/equal}}
                {{#equal ../slctType 2}}{{data.monthly}}월{{/equal}}
            </td>
            <td style="color: blue">{{addComma totalMCnt}}</td>
            <td style="color: blue">{{addComma age10MCnt}}</td>
            <td style="color: blue">{{addComma age20MCnt}}</td>
            <td style="color: blue">{{addComma age30MCnt}}</td>
            <td style="color: blue">{{addComma age40MCnt}}</td>
            <td style="color: blue">{{addComma age50MCnt}}</td>
            <td style="color: blue">{{addComma age60MCnt}}</td>
            <td style="color: red">{{addComma totalFCnt}}</td>
            <td style="color: red">{{addComma age10FCnt}}</td>
            <td style="color: red">{{addComma age20FCnt}}</td>
            <td style="color: red">{{addComma age30FCnt}}</td>
            <td style="color: red">{{addComma age40FCnt}}</td>
            <td style="color: red">{{addComma age50FCnt}}</td>
            <td style="color: red">{{addComma age60FCnt}}</td>
            <td>{{addComma totalNCnt}}</td>
        </tr>
    {{else}}
        <tr>
            <td colspan="22" class="noData">{{isEmptyData}}<td>
        </tr>
    {{/each}}
</script>