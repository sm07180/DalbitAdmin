<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    Date nowTime = new Date();
    SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
%>

<!-- 방송 > 총계 -->
<div class="widget widget-table mb10">
    <div class="widget-header">
        <div class="btn-group widget-header-toolbar">
            <a href="#" title="Expand/Collapse" class="btn-borderless btn-toggle-expand"><i class="fa fa-chevron-up"></i></a>
        </div>
    </div>
    <div class="widget-content mt10">
        <a href="javascript://">[이전]</a>
        <%= sf.format(nowTime)%>
        <a href="javascript://">[다음]</a>
        <table class="table table-bordered">
            <thead>
            <tr>
                <th>시간대</th>
                <th>방송개설 건</th>
                <th>방송시간(분)</th>
                <th>DJ</th>
                <th>청취자</th>
                <th>게스트</th>
                <th>선물 건수</th>
                <th>선물 금액</th>
            </tr>
            </thead>
            <tbody>
            <tr class="success">
                <th>총계</th>
                <td>23</td>
                <td>150</td>
                <td>23</td>
                <td>230</td>
                <td>2</td>
                <td>50</td>
                <td>200,000</td>
            </tr>

            <%
                for(int i=0; i<24; i++) {
            %>
            <tr>
                <th><%=i%>시 ~ <%=i+1%>시</th>
                <td>23</td>
                <td>150</td>
                <td>23</td>
                <td>230</td>
                <td>2</td>
                <td>50</td>
                <td>200,000</td>
            </tr>
            <%
                }
            %>

            <tr class="success">
                <th>총계</th>
                <td>23</td>
                <td>150</td>
                <td>23</td>
                <td>230</td>
                <td>2</td>
                <td>50</td>
                <td>200,000</td>
            </tr>
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
        util.getAjaxData("memberList", "/rest/status/broadcast/info/total", $("#searchForm").serialize(), fn_totalJoin_success);
    }

    function fn_totalJoin_success(data, response){
        var isDataEmpty = response.data.detailList == null;
        $("#tableBody").empty();
        if(!isDataEmpty){
            var template = $('#tmp_total').html();
            var templateScript = Handlebars.compile(template);
            var totalContext = response.data.totalInfo;
            var totalTtml = templateScript(totalContext);
            $("#tableBody").append(totalTtml);

            response.data.detailList.slctType = $('input[name="slctType"]:checked').val()
        }

        var template = $('#tmp_detailList').html();
        var templateScript = Handlebars.compile(template);
        var detailContext = response.data.detailList;
        var html=templateScript(detailContext);
        $("#tableBody").append(html);

        if(isDataEmpty){
            $("#tableBody td:last").remove();
        }else{
            $("#tableBody").append(totalTtml);
        }
    }
</script>
<script type="text/x-handlebars-template" id="tmp_total">
    <tr class="success">
        <td>소계</td>
        <td>{{addComma sum_totalCnt}}</td>
        <td>{{addComma sum_maleCnt}}</td>
        <td>{{addComma sum_femaleCnt}}</td>
        <td>{{addComma sum_noneCnt}}</td>
        <td>{{addComma sum_age10Cnt}}</td>
        <td>{{addComma sum_age20Cnt}}</td>
    </tr>
</script>

<script type="text/x-handlebars-template" id="tmp_detailList">
    {{#each this as |data|}}
        <tr>
            <td>
                {{#equal ../slctType 0}}{{data.hour}}시{{/equal}}
                {{#equal ../slctType 1}}{{data.daily}}{{/equal}}
                {{#equal ../slctType 2}}{{data.monthly}}월{{/equal}}
            </td>
            <td>{{addComma totalCnt}}</td>
            <td>{{addComma maleCnt}}</td>
            <td>{{addComma femaleCnt}}</td>
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
            <td colspan="11" class="noData">{{isEmptyData}}<td>
        </tr>
    {{/each}}
</script>