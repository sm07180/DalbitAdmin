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
    <div class="widget-content mt10">
        <span class="_searchDate"></span>
        <table class="table table-bordered">
            <colgroup>
                <col width="13%"/><col width="11%"/><col width="11%"/><col width="11%"/><col width="11%"/>
                <col width="11%"/><col width="11%"/><col width="11%"/><col width="11%"/>
            </colgroup>
            <thead id="loginTotalTable">
            <tr>
                <th rowspan="2">시간대</th>
                <th colspan="4" id="th_after">실시간</th>
                <th colspan="4" id="th_befor">전일</th>
            </tr>
            <tr>
                <th>소계</th>
                <th class="_sex_male">{{{sexIcon 'm'}}}</th>
                <th class="_sex_female">{{{sexIcon 'f'}}}</th>
                <th>알수없음</th>

                <th>소계</th>
                <th class="_sex_male">{{{sexIcon 'm'}}}</th>
                <th class="_sex_female">{{{sexIcon 'f'}}}</th>
                <th>알수없음</th>
            </tr>
            </thead>
            <tbody id="loginTotalTableBody"></tbody>
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
    $(function(){
        // getTotalList();
    });

    function getTotalList(obj){
        console.log(obj);
        util.getAjaxData("total", "/rest/connect/login/info/total", obj, fn_total_success);
    }

    function fn_total_success(data, response){
        var isDataEmpty = response.data.detailList == null;
        $("#loginTotalTableBody").empty();
        if(!isDataEmpty){
            var template = $('#tmp_total').html();
            var templateScript = Handlebars.compile(template);
            var totalContext = response.data.totalInfo;
            var totalHtml = templateScript(totalContext);
            $("#loginTotalTableBody").append(totalHtml);

            response.data.detailList.slctType = $('input[name="slctType"]:checked').val();

        }

        var template = $('#tmp_detailList').html();
        var templateScript = Handlebars.compile(template);
        var detailContext = response.data.detailList;
        var html=templateScript(detailContext);
        $("#loginTotalTableBody").append(html);

        if(isDataEmpty){
            $("#loginTotalTableBody td:last").remove();
        }else{
            $("#loginTotalTableBody").append(totalHtml);
        }

        if($('input[name="slctType"]:checked').val() == 0) {
            $("#loginTotalTable").find("#th_after").text("금일");
            $("#loginTotalTable").find("#th_befor").text("전일");
        }else if($('input[name="slctType"]:checked').val() == 1){
            $("#loginTotalTable").find("#th_after").text("금월");
            $("#loginTotalTable").find("#th_befor").text("전월");
        }else if($('input[name="slctType"]:checked').val() == 2){
            $("#loginTotalTable").find("#th_after").text("금년");
            $("#loginTotalTable").find("#th_befor").text("전년");
        }
    }
</script>
<script type="text/x-handlebars-template" id="tmp_total">
    <tr class="success font-bold">
        <td>총계</td>
        <td>{{addComma sum_totalCnt}}</td>
        <td style="color: blue">{{addComma sum_maleCnt}}</td>
        <td style="color: red">{{addComma sum_femaleCnt}}</td>
        <td>{{addComma sum_noneCnt}}</td>
        <td>{{addComma sum_bTotalCnt}}</td>
        <td style="color: blue">{{addComma sum_bMaleCnt}}</td>
        <td style="color: red">{{addComma sum_bFemaleCnt}}</td>
        <td>{{addComma sum_bNoneCnt}}</td>
    </tr>
</script>

<script type="text/x-handlebars-template" id="tmp_detailList">
    {{#each this as |data|}}
    <tr>
        <td class="font-bold">
            {{#equal ../slctType 0}}{{data.hour}}시{{/equal}}
            {{#equal ../slctType 1}}{{data.month}}월 {{data.day}}일{{/equal}}
            {{#equal ../slctType 2}}{{data.year}}년 {{data.month}}월{{/equal}}
        </td>
        <td>{{addComma totalCnt}}</td>
        <td style="color: blue">{{addComma maleCnt}}</td>
        <td style="color: red">{{addComma femaleCnt}}</td>
        <td>{{addComma noneCnt}}</td>
        <td>{{addComma bTotalCnt}}</td>
        <td style="color: blue">{{addComma bMaleCnt}}</td>
        <td style="color: red">{{addComma bFemaleCnt}}</td>
        <td>{{addComma bNoneCnt}}</td>
    </tr>
    {{else}}
    <%--<tr>--%>
        <td colspan="11" class="noData">{{isEmptyData}}<td>
    <%--</tr>--%>
    {{/each}}
</script>