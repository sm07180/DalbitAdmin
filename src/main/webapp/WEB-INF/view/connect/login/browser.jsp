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
            <thead id="browserTable">
            <tr>
                <th rowspan="2">시간대</th>
                <th colspan="4" id="th_after">실시간</th>
                <th colspan="4" id="th_befor">전일</th>
            </tr>
            <tr>
                <th>소계</th>
                <th>안드로이드</th>
                <th>아이폰</th>
                <th>PC</th>

                <th>소계</th>
                <th>안드로이드</th>
                <th>아이폰</th>
                <th>PC</th>
            </tr>
            </thead>
            <tbody id="browserTableBody"></tbody>
            </tbody>
        </table>
    </div>
    <div class="widget-footer">
        <span>
            <button class="btn btn-default print-btn pull-right" type="button" id="excelDownBtn"><i class="fa fa-print"></i>Excel Down</button>
        </span>
    </div>
</div>

<script type="text/javascript">

    function getBrowserList(obj){
        util.getAjaxData("browser", "/rest/connect/login/info/browser", obj, fn_browser_success);
    }

    function fn_browser_success(data, response){
        var isDataEmpty = response.data.detailList == null;
        $("#browserTableBody").empty();
        if(!isDataEmpty){
            var template = $('#tmp_browserTotal').html();
            var templateScript = Handlebars.compile(template);
            var totalContext = response.data.totalInfo;
            var totalHtml = templateScript(totalContext);
            $("#browserTableBody").append(totalHtml);

            response.data.detailList.slctType = $('input[name="slctType"]:checked').val();

        }

        var template = $('#tmp_browserDetailList').html();
        var templateScript = Handlebars.compile(template);
        var detailContext = response.data.detailList;
        var html=templateScript(detailContext);
        $("#browserTableBody").append(html);

        if(isDataEmpty){
            $("#browserTableBody td:last").remove();
        }else{
            $("#browserTableBody").append(totalHtml);
        }

        if($('input[name="slctType"]:checked').val() == 0) {
            $("#browserTable").find("#th_after").text("금일");
            $("#browserTable").find("#th_befor").text("전일");
        }else if($('input[name="slctType"]:checked').val() == 1){
            $("#browserTable").find("#th_after").text("금월");
            $("#browserTable").find("#th_befor").text("전월");
        }else if($('input[name="slctType"]:checked').val() == 2){
            $("#browserTable").find("#th_after").text("금년");
            $("#browserTable").find("#th_befor").text("전년");
        }
    }
</script>
<script type="text/x-handlebars-template" id="tmp_browserTotal">
    <tr class="success">
        <td>총계</td>
        <td>{{addComma sum_totalCnt}}</td>
        <td>{{addComma sum_androidCnt}}</td>
        <td>{{addComma sum_iosCnt}}</td>
        <td>{{addComma sum_pcCnt}}</td>

        <td>{{addComma sum_bTotalCnt}}</td>
        <td>{{addComma sum_bAndroidCnt}}</td>
        <td>{{addComma sum_bIosCnt}}</td>
        <td>{{addComma sum_bPcCnt}}</td>
    </tr>
</script>

<script type="text/x-handlebars-template" id="tmp_browserDetailList">
    {{#each this as |data|}}
    <tr>
        <td>
            {{#equal ../slctType 0}}{{data.hour}}시{{/equal}}
            {{#equal ../slctType 1}}{{data.month}}월 {{data.day}}일{{/equal}}
            {{#equal ../slctType 2}}{{data.year}}년 {{data.month}}월{{/equal}}
        </td>
        <td>{{addComma totalCnt}}</td>
        <td>{{addComma androidCnt}}</td>
        <td>{{addComma iosCnt}}</td>
        <td>{{addComma pcCnt}}</td>

        <td>{{addComma bTotalCnt}}</td>
        <td>{{addComma bAndroidCnt}}</td>
        <td>{{addComma bIosCnt}}</td>
        <td>{{addComma bPcCnt}}</td>
    </tr>
    {{else}}

    <td colspan="10" class="noData">{{isEmptyData}}<td>

    {{/each}}
</script>