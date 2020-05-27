<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 회원가입 > 성별 -->
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
                <th colspan="7">가입자(남성)</th>
                <th colspan="7">가입자(여성)</th>
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
        <td>{{addComma sum_totalMCnt}}</td>
        <td>{{addComma sum_age10MCnt}}</td>
        <td>{{addComma sum_age20MCnt}}</td>
        <td>{{addComma sum_age30MCnt}}</td>
        <td>{{addComma sum_age40MCnt}}</td>
        <td>{{addComma sum_age50MCnt}}</td>
        <td>{{addComma sum_age60MCnt}}</td>
        <td>{{addComma sum_totalFCnt}}</td>
        <td>{{addComma sum_age10FCnt}}</td>
        <td>{{addComma sum_age20FCnt}}</td>
        <td>{{addComma sum_age30FCnt}}</td>
        <td>{{addComma sum_age40FCnt}}</td>
        <td>{{addComma sum_age50FCnt}}</td>
        <td>{{addComma sum_age60FCnt}}</td>
        <td>{{addComma sum_totalNCnt}}</td>
    </tr>
</script>

<script type="text/x-handlebars-template" id="tmp_genderDetailList">
    {{#each this as |data|}}
        <tr>
            <td class="font-bold">
                {{#equal ../slctType 0}}{{data.hour}}시{{/equal}}
                {{#equal ../slctType 1}}{{data.daily}}{{/equal}}
                {{#equal ../slctType 2}}{{data.monthly}}월{{/equal}}
            </td>
            <td>{{addComma totalMCnt}}</td>
            <td>{{addComma age10MCnt}}</td>
            <td>{{addComma age20MCnt}}</td>
            <td>{{addComma age30MCnt}}</td>
            <td>{{addComma age40MCnt}}</td>
            <td>{{addComma age50MCnt}}</td>
            <td>{{addComma age60MCnt}}</td>
            <td>{{addComma totalFCnt}}</td>
            <td>{{addComma age10FCnt}}</td>
            <td>{{addComma age20FCnt}}</td>
            <td>{{addComma age30FCnt}}</td>
            <td>{{addComma age40FCnt}}</td>
            <td>{{addComma age50FCnt}}</td>
            <td>{{addComma age60FCnt}}</td>
            <td>{{addComma totalNCnt}}</td>
        </tr>
    {{else}}
        <tr>
            <td colspan="22" class="noData">{{isEmptyData}}<td>
        </tr>
    {{/each}}
</script>