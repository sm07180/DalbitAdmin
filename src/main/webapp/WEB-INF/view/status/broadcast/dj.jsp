<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 방송 > DJ -->
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
                <th rowspan="2">소계</th>
                <th colspan="3">성별</th>
                <th colspan="6">연령별</th>
            </tr>

            <tr>
                <th>남성</th>
                <th>여성</th>
                <th>알 수 없음</th>

                <th>10대</th>
                <th>20대</th>
                <th>30대</th>
                <th>40대</th>
                <th>50대</th>
                <th>60대 이상</th>
            </tr>
            </thead>
            <tbody id="djListBody">
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
        broadcastDj();
    });

    function broadcastDj(){
        util.getAjaxData("broadcastDj", "/rest/status/broadcast/info/dj", $("#searchForm").serialize(), fn_broadcastDj_success);
    }

    function fn_broadcastDj_success(dst_id, response) {
        dalbitLog(response);
        var isDataEmpty = response.data.detailList == null;
        $("#djListBody").empty();
        if(!isDataEmpty){
            var template = $('#tmp_djTotal').html();
            var templateScript = Handlebars.compile(template);
            var totalContext = response.data.totalInfo;
            var totalHtml = templateScript(totalContext);
            $("#djListBody").append(totalHtml);

            response.data.detailList.slctType = $('input:radio[name="slctType"]:checked').val();
        }

        var template = $('#tmp_djDetailList').html();
        var templateScript = Handlebars.compile(template);
        var detailContext = response.data.detailList;
        var html=templateScript(detailContext);
        $("#djListBody").append(html);

        if(isDataEmpty){
            $("#djListBody td:last").remove();
        }else{
            $("#djListBody").append(totalHtml);
        }
    }
</script>

<script type="text/x-handlebars-template" id="tmp_djTotal">
    <tr class="success">
        <td>소계</td>
        <td>{{addComma sum_totalCnt}}</td>
        <td>{{addComma sum_maleCnt}}</td>
        <td>{{addComma sum_femaleCnt}}</td>
        <td>{{addComma sum_noneCnt}}</td>
        <td>{{addComma sum_dj10Cnt}}</td>
        <td>{{addComma sum_dj20Cnt}}</td>
        <td>{{addComma sum_dj30Cnt}}</td>
        <td>{{addComma sum_dj40Cnt}}</td>
        <td>{{addComma sum_dj50Cnt}}</td>
        <td>{{addComma sum_dj60Cnt}}</td>
    </tr>
</script>

<script type="text/x-handlebars-template" id="tmp_djDetailList">
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
        <td>{{addComma dj10Cnt}}</td>
        <td>{{addComma dj20Cnt}}</td>
        <td>{{addComma dj30Cnt}}</td>
        <td>{{addComma dj40Cnt}}</td>
        <td>{{addComma dj50Cnt}}</td>
        <td>{{addComma dj60Cnt}}</td>
    </tr>
    {{else}}
    <tr>
        <td colspan="22" class="noData">{{isEmptyData}}<td>
    </tr>
    {{/each}}
</script>