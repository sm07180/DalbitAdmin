<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 회원가입 > 총계 -->
<div class="widget widget-table mb10">
    <div class="widget-content mt10">
        <table class="table table-bordered">
            <colgroup>
                <col width="%"/>
            </colgroup>
            <thead>
            <tr>
                <th rowspan="3">날짜</th>
                <th rowspan="3">구분</th>
                <th colspan="12" class="_sex_male"></th>
                <th colspan="2" rowspan="2">남성 합</th>
                <th colspan="12" class="_sex_female"></th>
                <th colspan="2" rowspan="2">여성 합</th>
                <th colspan="12" class="_sex_none"></th>
                <th colspan="2" rowspan="2">알수없음 합</th>
                <th rowspan="3">총합</th>
            </tr>
            <tr>
                <th colspan="2">전화</th>
                <th colspan="2">카카오</th>
                <th colspan="2">네이버</th>
                <th colspan="2">페이스북</th>
                <th colspan="2">애플</th>
                <th colspan="2">구글</th>

                <th colspan="2">전화</th>
                <th colspan="2">카카오</th>
                <th colspan="2">네이버</th>
                <th colspan="2">페이스북</th>
                <th colspan="2">애플</th>
                <th colspan="2">구글</th>

                <th colspan="2">전화</th>
                <th colspan="2">카카오</th>
                <th colspan="2">네이버</th>
                <th colspan="2">페이스북</th>
                <th colspan="2">애플</th>
                <th colspan="2">구글</th>
            </tr>
            <tr>
                <th>가입</th>
                <th>탈퇴</th>
                <th>가입</th>
                <th>탈퇴</th>
                <th>가입</th>
                <th>탈퇴</th>
                <th>가입</th>
                <th>탈퇴</th>
                <th>가입</th>
                <th>탈퇴</th>
                <th>가입</th>
                <th>탈퇴</th>
                <th>가입</th>
                <th>탈퇴</th>
                <th>가입</th>
                <th>탈퇴</th>
                <th>가입</th>
                <th>탈퇴</th>
                <th>가입</th>
                <th>탈퇴</th>
                <th>가입</th>
                <th>탈퇴</th>
                <th>가입</th>
                <th>탈퇴</th>
                <th>가입</th>
                <th>탈퇴</th>
                <th>가입</th>
                <th>탈퇴</th>
                <th>가입</th>
                <th>탈퇴</th>
                <th>가입</th>
                <th>탈퇴</th>
                <th>가입</th>
                <th>탈퇴</th>
                <th>가입</th>
                <th>탈퇴</th>
                <th>가입</th>
                <th>탈퇴</th>
                <th>가입</th>
                <th>탈퇴</th>
                <th>가입</th>
                <th>탈퇴</th>
            </tr>
            </thead>
            <tbody id="month_tableBody"></tbody>
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
    });

    function getMonthList(){
        var data = dataSet();
        data.slctType = 1;
        console.log(data);
        util.getAjaxData("memberList", "/rest/enter/join/info/total", dataSet(), fn_monthJoin_success);
    }

    function fn_monthJoin_success(data, response){
        $("#month_tableBody").empty();

        response.data.detailList.slctType = 1;

        var template = $('#tmp_monthDetailList').html();
        var templateScript = Handlebars.compile(template);
        var detailContext = response.data.detailList;
        var html=templateScript(detailContext);
        $("#month_tableBody").append(html);
    }
</script>

<script type="text/x-handlebars-template" id="tmp_monthDetailList">
    {{#each this as |data|}}
        <tr>
            <td class="font-bold" rowspan="3">
                {{#equal ../slctType 0}}{{data.hour}}시{{/equal}}
                {{#equal ../slctType 1}}{{substr data.daily 8}}일{{/equal}}
                {{#equal ../slctType 2}}{{data.monthly}}월{{/equal}}
            </td>
            <td>AOS</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
        </tr>
        <tr>
            <td>IOS</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
        </tr>
        <tr>
            <td>PC</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
            <td>{{addComma totalCnt 'Y'}}</td>
        </tr>
    {{else}}
        <tr>
            <td colspan="42" class="noData">{{isEmptyData}}<td>
        </tr>
    {{/each}}

    <td colspan="2">소계</td>
    <td colspan="2">{{addComma sum_totalCnt}}</td>
    <td colspan="2">{{addComma sum_totalCnt}}</td>
    <td colspan="2">{{addComma sum_totalCnt}}</td>
    <td colspan="2">{{addComma sum_totalCnt}}</td>
    <td colspan="2">{{addComma sum_totalCnt}}</td>
    <td colspan="2">{{addComma sum_totalCnt}}</td>
    <td>{{addComma sum_totalCnt}}</td>
    <td>{{addComma sum_totalCnt}}</td>
    <td colspan="2">{{addComma sum_totalCnt}}</td>
    <td colspan="2">{{addComma sum_totalCnt}}</td>
    <td colspan="2">{{addComma sum_totalCnt}}</td>
    <td colspan="2">{{addComma sum_totalCnt}}</td>
    <td colspan="2">{{addComma sum_totalCnt}}</td>
    <td colspan="2">{{addComma sum_totalCnt}}</td>
    <td>{{addComma sum_totalCnt}}</td>
    <td>{{addComma sum_totalCnt}}</td>
    <td colspan="2">{{addComma sum_totalCnt}}</td>
    <td colspan="2">{{addComma sum_totalCnt}}</td>
    <td colspan="2">{{addComma sum_totalCnt}}</td>
    <td colspan="2">{{addComma sum_totalCnt}}</td>
    <td colspan="2">{{addComma sum_totalCnt}}</td>
    <td colspan="2">{{addComma sum_totalCnt}}</td>
    <td>{{addComma sum_totalCnt}}</td>
    <td>{{addComma sum_totalCnt}}</td>
    <td>{{addComma sum_totalCnt}}</td>
</script>