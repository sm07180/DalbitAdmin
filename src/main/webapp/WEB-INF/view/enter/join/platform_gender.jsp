<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 회원가입 > 플랫폼(성별) -->
<div class="widget widget-table mb10">
    <div class="widget-content mt10">
        <span class="_searchDate"></span>
        <table class="table table-bordered">
            <colgroup>
                <col width="10%"/><col width="9%"/><col width="9%"/><col width="9%"/><col width="9%"/>
                <col width="9%"/><col width="9%"/><col width="9%"/><col width="9%"/><col width="9%"/>
                <col width="9%"/>
            </colgroup>
            <thead>
            <tr>
                <th rowspan="2">시간대</th>
                <th rowspan="2">소계</th>
                <th colspan="3">안드로이드</th>
                <th colspan="3">아이폰</th>
                <th colspan="3">PC</th>
            </tr>
            <tr>
                <th class="_sex_male"></th>
                <th class="_sex_female"></th>
                <th>알 수 없음</th>

                <th class="_sex_male"></th>
                <th class="_sex_female"></th>
                <th>알 수 없음</th>

                <th class="_sex_male"></th>
                <th class="_sex_female"></th>
                <th>알 수 없음</th>
            </tr>
            </thead>
            <tbody id="platformGenderTableBody"></tbody>
        </table>
    </div>
    <div class="widget-footer">
        <span>
            <%--<button class="btn btn-default print-btn pull-right" type="button" id="excelDownBtn"><i class="fa fa-print"></i>Excel Down</button>--%>
        </span>
    </div>
</div>

<script type="text/javascript">

    function getPlatformGenderList(){
        util.getAjaxData("platformGenderList", "/rest/enter/join/platform/gender", $("#searchForm").serialize(), fn_platformGender_success);
    }

    function fn_platformGender_success(data, response){
        var isDataEmpty = response.data.detailList == null;
        $("#platformGenderTableBody").empty();
        if(!isDataEmpty){
            var template = $('#tmp_platformGenderTotal').html();
            var templateScript = Handlebars.compile(template);
            var totalContext = response.data.totalInfo;
            var totalHtml = templateScript(totalContext);
            $("#platformGenderTableBody").append(totalHtml);

            response.data.detailList.slctType = $('input[name="slctType"]:checked').val()
        }

        var template = $('#tmp_platformGenderDetailList').html();
        var templateScript = Handlebars.compile(template);
        var detailContext = response.data.detailList;
        var html=templateScript(detailContext);
        $("#platformGenderTableBody").append(html);

        if(isDataEmpty){
            $("#platformGenderTableBody td:last").remove();
        }else{
            $("#platformGenderTableBody").append(totalHtml);
        }
    }

</script>

<script type="text/x-handlebars-template" id="tmp_platformGenderTotal">
    <tr class="success font-bold">
        <td>소계</td>
        <td>{{addComma sum_totalCnt}}</td>
        <td style="color: blue">{{addComma sum_androidMCnt}}</td>
        <td style="color: red">{{addComma sum_androidFCnt}}</td>
        <td>{{addComma sum_androidNCnt}}</td>
        <td style="color: blue">{{addComma sum_iosMCnt}}</td>
        <td style="color: red">{{addComma sum_iosFCnt}}</td>
        <td>{{addComma sum_iosNCnt}}</td>
        <td style="color: blue">{{addComma sum_pcMCnt}}</td>
        <td style="color: red">{{addComma sum_pcFCnt}}</td>
        <td>{{addComma sum_pcNCnt}}</td>
    </tr>
</script>

<script type="text/x-handlebars-template" id="tmp_platformGenderDetailList">
    {{#each this as |data|}}
        <tr>
            <td class="font-bold">
                {{#equal ../slctType 0}}{{data.hour}}시{{/equal}}
                {{#equal ../slctType 1}}{{data.daily}}{{/equal}}
                {{#equal ../slctType 2}}{{data.monthly}}월{{/equal}}
            </td>
            <td>{{addComma totalCnt}}</td>
            <td style="color: blue">{{addComma androidMCnt}}</td>
            <td style="color: red">{{addComma androidFCnt}}</td>
            <td>{{addComma androidNCnt}}</td>
            <td style="color: blue">{{addComma iosMCnt}}</td>
            <td style="color: red">{{addComma iosFCnt}}</td>
            <td>{{addComma iosNCnt}}</td>
            <td style="color: blue">{{addComma pcMCnt}}</td>
            <td style="color: red">{{addComma pcFCnt}}</td>
            <td>{{addComma pcNCnt}}</td>
        </tr>
    {{else}}
        <tr>
            <td colspan="22" class="noData">{{isEmptyData}}<td>
        </tr>
    {{/each}}
</script>