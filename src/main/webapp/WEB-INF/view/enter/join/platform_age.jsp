<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 회원가입 > 플랫폼(연령별) -->
<div class="widget widget-table mb10">
    <div class="widget-content mt10">
        <span class="_searchDate"></span>
        <table class="table table-bordered">
            <colgroup>
                <col width="5%"/><col width="5%"/><col width="5%"/><col width="5%"/><col width="5%"/>
                <col width="5%"/><col width="5%"/><col width="5%"/><col width="5%"/><col width="5%"/>
                <col width="5%"/><col width="5%"/><col width="5%"/><col width="5%"/><col width="5%"/>
                <col width="5%"/><col width="5%"/><col width="5%"/><col width="5%"/><col width="5%"/>
                <col width="5%"/><col width="5%"/>
            </colgroup>
            <thead>
            <tr>
                <th rowspan="2"></th>
                <th rowspan="2">소계</th>
                <th colspan="6">안드로이드</th>
                <th colspan="6">아이폰</th>
                <th colspan="6">PC</th>
            </tr>
            <tr>
                <th>10대</th>
                <th>20대</th>
                <th>30대</th>
                <th>40대</th>
                <th>50대</th>
                <th>60대 이상</th>

                <th>10대</th>
                <th>20대</th>
                <th>30대</th>
                <th>40대</th>
                <th>50대</th>
                <th>60대 이상</th>

                <th>10대</th>
                <th>20대</th>
                <th>30대</th>
                <th>40대</th>
                <th>50대</th>
                <th>60대 이상</th>
            </tr>
            </thead>
            <tbody id="platformAgeTableBody"></tbody>
        </table>
    </div>
    <div class="widget-footer">
        <span>
            <%--<button class="btn btn-default print-btn pull-right" type="button" id="excelDownBtn"><i class="fa fa-print"></i>Excel Down</button>--%>
        </span>
    </div>
</div>

<script type="text/javascript">
    function getPlatformAgeList(){
        util.getAjaxData("platformAgeList", "/rest/enter/join/platform/age", $("#searchForm").serialize(), fn_platformAge_success);
    }

    function fn_platformAge_success(data, response){
        var isDataEmpty = response.data.detailList == null;
        var tableBody = $("#platformAgeTableBody");

        tableBody.empty();
        if(!isDataEmpty){
            var template = $('#tmp_platformAgeTotal').html();
            var templateScript = Handlebars.compile(template);
            var totalContext = response.data.totalInfo;
            var totalHtml = templateScript(totalContext);
            tableBody.append(totalHtml);

            response.data.detailList.slctType = $('input[name="slctType"]:checked').val()
        }

        var template = $('#tmp_platformAgeDetailList').html();
        var templateScript = Handlebars.compile(template);
        var detailContext = response.data.detailList;
        var html=templateScript(detailContext);
        tableBody.append(html);

        if(isDataEmpty){
            $("#platformAgeTableBody td:last").remove();
        }else{
            tableBody.append(totalHtml);
        }
    }

</script>

<script type="text/x-handlebars-template" id="tmp_platformAgeTotal">
    <tr class="success font-bold">
        <td>소계</td>
        <td>{{addComma sum_totalCnt}}</td>
        <td>{{addComma sum_android10Cnt}}</td>
        <td>{{addComma sum_android20Cnt}}</td>
        <td>{{addComma sum_android30Cnt}}</td>
        <td>{{addComma sum_android40Cnt}}</td>
        <td>{{addComma sum_android50Cnt}}</td>
        <td>{{addComma sum_android60Cnt}}</td>
        <td>{{addComma sum_ios10Cnt}}</td>
        <td>{{addComma sum_ios20Cnt}}</td>
        <td>{{addComma sum_ios30Cnt}}</td>
        <td>{{addComma sum_ios40Cnt}}</td>
        <td>{{addComma sum_ios50Cnt}}</td>
        <td>{{addComma sum_ios60Cnt}}</td>
        <td>{{addComma sum_pc10Cnt}}</td>
        <td>{{addComma sum_pc20Cnt}}</td>
        <td>{{addComma sum_pc30Cnt}}</td>
        <td>{{addComma sum_pc40Cnt}}</td>
        <td>{{addComma sum_pc50Cnt}}</td>
        <td>{{addComma sum_pc60Cnt}}</td>
    </tr>
</script>

<script type="text/x-handlebars-template" id="tmp_platformAgeDetailList">
    {{#each this as |data|}}
        <tr>
            <td class="font-bold">
                {{#equal ../slctType 0}}{{data.hour}}시{{/equal}}
                {{#equal ../slctType 1}}{{substr data.daily 8}}일{{/equal}}
                {{#equal ../slctType 2}}{{data.monthly}}월{{/equal}}
            </td>
            <td>{{addComma totalCnt}}</td>
            <td>{{addComma android10Cnt}}</td>
            <td>{{addComma android20Cnt}}</td>
            <td>{{addComma android30Cnt}}</td>
            <td>{{addComma android40Cnt}}</td>
            <td>{{addComma android50Cnt}}</td>
            <td>{{addComma android60Cnt}}</td>
            <td>{{addComma ios10Cnt}}</td>
            <td>{{addComma ios20Cnt}}</td>
            <td>{{addComma ios30Cnt}}</td>
            <td>{{addComma ios40Cnt}}</td>
            <td>{{addComma ios50Cnt}}</td>
            <td>{{addComma ios60Cnt}}</td>
            <td>{{addComma pc10Cnt}}</td>
            <td>{{addComma pc20Cnt}}</td>
            <td>{{addComma pc30Cnt}}</td>
            <td>{{addComma pc40Cnt}}</td>
            <td>{{addComma pc50Cnt}}</td>
            <td>{{addComma pc60Cnt}}</td>
        </tr>
    {{else}}
        <tr>
            <td colspan="20" class="noData">{{isEmptyData}}<td>
        </tr>
    {{/each}}
</script>