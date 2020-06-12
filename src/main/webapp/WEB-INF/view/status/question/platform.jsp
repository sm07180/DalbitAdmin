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
                <col width="10%"/><col width="10%"/><col width="10%"/><col width="10%"/><col width="10%"/>
                <col width="10%"/><col width="10%"/><col width="10%"/><col width="10%"/><col width="10%"/>
            </colgroup>
            <thead id="totalTable">
            <tr>
                <th>시간대</th>
                <th>소계</th>
                <th>PC/모바일WEB</th>
                <th>안드로이드</th>
                <th>아이폰</th>
            </tr>
            </thead>
            <tbody id="platformTableBody"></tbody>
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
        getPlatformList();
    });

    function getPlatformList(){
        console.log($("#searchForm").serialize());
        util.getAjaxData("platform", "/rest/status/question/platform", $("#searchForm").serialize(), fn_platform_success);
    }

    function fn_platform_success(data, response){
        dalbitLog(response);
        var isDataEmpty = response.data.detailList == null;
        $("#platformTableBody").empty();
        if(!isDataEmpty){
            var template = $('#tmp_platform').html();
            var templateScript = Handlebars.compile(template);
            var context = response.data.totalInfo;
            var totalHtml = templateScript(context);
            $("#platformTableBody").append(totalHtml);
            response.data.detailList.slctType = $('input[name="slctType"]:checked').val();
        }

        var template = $('#tmp_detailList_platform').html();
        var templateScript = Handlebars.compile(template);
        var context = response.data.detailList;
        var html=templateScript(context);
        $("#platformTableBody").append(html);

        if(isDataEmpty){
            $("#platformTableBody td:last").remove();
        }else{
            $("#platformTableBody").append(totalHtml);
        }
    }
</script>
<script type="text/x-handlebars-template" id="tmp_platform">
    <tr class="success font-bold">
        <td>총계</td>
        <td>{{addComma sum_totalCnt}}</td>
        <td>{{addComma sum_pcCnt}}</td>
        <td>{{addComma sum_androidCnt}}</td>
        <td>{{addComma sum_iosCnt}}</td>
    </tr>
</script>

<script type="text/x-handlebars-template" id="tmp_detailList_platform">
    {{#each this as |data|}}
    <tr>
        <td class="font-bold">
            {{#equal ../slctType 0}}{{data.hour}}시{{/equal}}
            {{#equal ../slctType 1}}{{data.daily}}{{/equal}}
            {{#equal ../slctType 2}}{{data.monthly}}월{{/equal}}
        </td>
        <td>{{addComma totalCnt}}</td>
        <td>{{addComma pcCnt}}</td>
        <td>{{addComma androidCnt}}</td>
        <td>{{addComma iosCnt}}</td>
    </tr>
    {{else}}
    <%--<tr>--%>
    <td colspan="11" class="noData">{{isEmptyData}}<td>
        <%--</tr>--%>
        {{/each}}
</script>