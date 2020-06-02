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
        <a href="javascript://" class="_prevSearch">[이전]</a>
        <span class="_searchDate"></span>
        <a href="javascript://" class="_nextSearch">[다음]</a>
        <table class="table table-bordered">
            <colgroup>
                <col width="25%"/><col width="25%"/><col width="25%"/><col width="25%"/>
            </colgroup>
            <thead id="totalTable">
            <tr>
                <th>시간대</th>
                <th>등록 건 수</th>
                <th>처리 건 수</th>
                <th>미처리 건 수</th>
            </tr>
            </thead>
            <tbody id="totalTableBody"></tbody>
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
        getTotalList();
    });

    function getTotalList(){
        util.getAjaxData("total", "/rest/status/question/total", $("#searchForm").serialize(), fn_total_success);
    }

    function fn_total_success(data, response){
        var isDataEmpty = response.data.detailList == null;
        $("#totalTableBody").empty();
        if(!isDataEmpty){
            var template = $('#tmp_total').html();
            var templateScript = Handlebars.compile(template);
            var totalContext = response.data.totalInfo;
            var totalHtml = templateScript(totalContext);
            $("#totalTableBody").append(totalHtml);
            response.data.detailList.slctType = $('input[name="slctType"]:checked').val();
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
        <td>총계</td>
        <td>{{addComma sum_regCnt}}</td>
        <td>{{addComma sum_opCnt}}</td>
        <td>{{addComma sum_nopCnt}}</td>
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
        <td>{{addComma regCnt}}</td>
        <td>{{addComma opCnt}}</td>
        <td>{{addComma nopCnt}}</td>
    </tr>
    {{else}}
    <%--<tr>--%>
    <td colspan="11" class="noData">{{isEmptyData}}<td>
    <%--</tr>--%>
    {{/each}}
</script>