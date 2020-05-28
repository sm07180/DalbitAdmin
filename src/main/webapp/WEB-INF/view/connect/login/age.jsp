<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    Date nowTime = new Date();
    SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
%>

<!-- 로그인 현황 > 총계 -->
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
            <thead id="ageTable">
            <tr>
                <th rowspan="2">시간대</th>
                <th colspan="7" id="th_after">실시간</th>
                <th colspan="7" id="th_befor">전일</th>
            </tr>
            <tr>
                <th>소계</th>
                <th>10대</th>
                <th>20대</th>
                <th>30대</th>
                <th>40대</th>
                <th>50대</th>
                <th>60대이상</th>

                <th>소계</th>
                <th>10대</th>
                <th>20대</th>
                <th>30대</th>
                <th>40대</th>
                <th>50대</th>
                <th>60대이상</th>

            </tr>
            </thead>
            <tbody id="ageTableBody"></tbody>
            </tbody>
        </table>
    </div>
    <div class="widget-footer">
        <span>
            <%--<button class="btn btn-default print-btn pull-right" type="button" id="excelDownBtn"><i class="fa fa-print"></i>Excel Down</button>--%>
        </span>
    </div>
</div>

<script type="text/javascript">

    function getAgeList(obj){
        util.getAjaxData("age", "/rest/connect/login/info/age", obj, fn_age_success);
    }

    function fn_age_success(data, response){
        var isDataEmpty = response.data.detailList == null;
        $("#ageTableBody").empty();
        if(!isDataEmpty){
            var template = $('#tmp_ageTotal').html();
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

        if($('input[name="slctType"]:checked').val() == 0) {
            $("#ageTable").find("#th_after").text("금일");
            $("#ageTable").find("#th_befor").text("전일");
        }else if($('input[name="slctType"]:checked').val() == 1){
            $("#ageTable").find("#th_after").text("금월");
            $("#ageTable").find("#th_befor").text("전월");
        }else if($('input[name="slctType"]:checked').val() == 2){
            $("#ageTable").find("#th_after").text("금년");
            $("#ageTable").find("#th_befor").text("전년");
        }
    }
</script>
<script type="text/x-handlebars-template" id="tmp_ageTotal">
    <tr class="success font-bold">
        <td>총계</td>
        <td>{{addComma sum_totalCnt}}</td>
        <td>{{addComma sum_age10Cnt}}</td>
        <td>{{addComma sum_age20Cnt}}</td>
        <td>{{addComma sum_age30Cnt}}</td>
        <td>{{addComma sum_age40Cnt}}</td>
        <td>{{addComma sum_age50Cnt}}</td>
        <td>{{addComma sum_age60Cnt}}</td>

        <td>{{addComma sum_bTotalCnt}}</td>
        <td>{{addComma sum_bAge10Cnt}}</td>
        <td>{{addComma sum_bAge20Cnt}}</td>
        <td>{{addComma sum_bAge30Cnt}}</td>
        <td>{{addComma sum_bAge40Cnt}}</td>
        <td>{{addComma sum_bAge50Cnt}}</td>
        <td>{{addComma sum_bAge60Cnt}}</td>
    </tr>
</script>

<script type="text/x-handlebars-template" id="tmp_ageDetailList">
    {{#each this as |data|}}
    <tr>
        <td class="font-bold">
            {{#equal ../slctType 0}}{{data.hour}}시{{/equal}}
            {{#equal ../slctType 1}}{{data.month}}월 {{data.day}}일{{/equal}}
            {{#equal ../slctType 2}}{{data.year}}년 {{data.month}}월{{/equal}}
        </td>
        <td>{{addComma totalCnt}}</td>
        <td>{{addComma age10Cnt}}</td>
        <td>{{addComma age20Cnt}}</td>
        <td>{{addComma age30Cnt}}</td>
        <td>{{addComma age40Cnt}}</td>
        <td>{{addComma age50Cnt}}</td>
        <td>{{addComma age60Cnt}}</td>

        <td>{{addComma bTotalCnt}}</td>
        <td>{{addComma bAge10Cnt}}</td>
        <td>{{addComma bAge20Cnt}}</td>
        <td>{{addComma bAge30Cnt}}</td>
        <td>{{addComma bAge40Cnt}}</td>
        <td>{{addComma bAge50Cnt}}</td>
        <td>{{addComma bAge60Cnt}}</td>
    </tr>
    {{else}}
    <td colspan="15" class="noData">{{isEmptyData}}<td>
    {{/each}}
</script>