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
            <thead id="loginTotalTable">
            <tr>
                <th rowspan="2">시간대</th>
                <th colspan="4">실시간</th>
                <%--<th colspan="4" id="th_slctType">전일</th>--%>
            </tr>
            <tr>
                <th>소계</th>
                <th>남성</th>
                <th>여성</th>
                <th>알수없음</th>

                <%--<th>소계</th>--%>
                <%--<th>남성</th>--%>
                <%--<th>여성</th>--%>
                <%--<th>알수없음</th>--%>
            </tr>
            </thead>
            <tbody id="loginTotalTableBody"></tbody>
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
    $(function(){
        getTotalList();
    });

    function getTotalList(){
        util.getAjaxData("total", "/rest/connect/login/info/total", $("#searchForm").serialize(), fn_total_success);
    }

    function fn_total_success(data, response){
        var isDataEmpty = response.data.detailList == null;
        $("#loginTotalTableBody").empty();
        if(!isDataEmpty){
            var template = $('#tmp_total').html();
            var templateScript = Handlebars.compile(template);
            var totalContext = response.data.totalInfo;
            var totalTtml = templateScript(totalContext);
            $("#loginTotalTableBody").append(totalTtml);

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
            $("#loginTotalTableBody").append(totalTtml);
        }

        if($('input[name="slctType"]:checked').val() == 0) {
            $("#loginTotalTable").find("#th_slctType").text("전일");
        }else if($('input[name="slctType"]:checked').val() == 1){
            $("#loginTotalTable").find("#th_slctType").text("전월");
        }else if($('input[name="slctType"]:checked').val() == 2){
            $("#loginTotalTable").find("#th_slctType").text("전년");
        }
    }
</script>
<script type="text/x-handlebars-template" id="tmp_total">
    <tr class="success">
        <td>총계</td>
        <td>{{addComma sum_totalCnt}}</td>
        <td>{{addComma sum_maleCnt}}</td>
        <td>{{addComma sum_femaleCnt}}</td>
        <td>{{addComma sum_noneCnt}}</td>
        <%--<td>0</td>--%>
        <%--<td>0</td>--%>
        <%--<td>0</td>--%>
        <%--<td>0</td>--%>
    </tr>
</script>

<script type="text/x-handlebars-template" id="tmp_detailList">
    {{#each this as |data|}}
    <tr>
        <td>
            {{#equal ../slctType 0}}{{data.hour}}시{{/equal}}
            {{#equal ../slctType 1}}{{data.month}}월 {{data.day}}일{{/equal}}
            {{#equal ../slctType 2}}{{data.year}}년 {{data.month}}월{{/equal}}
        </td>
        <td>{{addComma totalCnt}}</td>
        <td>{{addComma maleCnt}}</td>
        <td>{{addComma femaleCnt}}</td>
        <td>{{addComma noneCnt}}</td>
        <%--<td>0</td>--%>
        <%--<td>0</td>--%>
        <%--<td>0</td>--%>
        <%--<td>0</td>--%>
    </tr>
    {{else}}
    <tr>
        <td colspan="11" class="noData">{{isEmptyData}}<td>
    </tr>
    {{/each}}
</script>