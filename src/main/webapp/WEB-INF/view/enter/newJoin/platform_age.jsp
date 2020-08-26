<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 회원가입 > 플랫폼(연령별) -->
<div class="widget widget-table mb10">
    <div class="widget-content mt10">
        <span class="font-bold">* 가입수치(연령대 내에서 플랫폼 별 가입에 대한 %비율)/탈퇴수치를 표기한 정보입니다.</span>
        <table class="table table-bordered _tableHeight" data-height="23px">
            <colgroup>
                <col width="10%"/><col width="7%"/><col width="7%"/><col width="7%"/><col width="7%"/>
                <col width="7%"/><col width="7%"/><col width="7%"/><col width="7%"/><col width="7%"/>
                <col width="7%"/><col width="7%"/><col width="7%"/>
            </colgroup>
            <thead>
            <tr>
                <th class="_bgColor _fontColor" data-bgColor="#4472c4" data-fontColor="yellow" rowspan="2" id="ageDay"></th>
                <th class="_bgColor _fontColor" data-bgColor="#4472c4" data-fontColor="white" colspan="3">10대</th>
                <th class="_bgColor _fontColor" data-bgColor="#4472c4" data-fontColor="white" colspan="3">20대</th>
                <th class="_bgColor _fontColor" data-bgColor="#4472c4" data-fontColor="white" colspan="3">30대</th>
                <th class="_bgColor _fontColor" data-bgColor="#4472c4" data-fontColor="white" colspan="3">40대 이상</th>
            </tr>
            <tr>
                <th class="_bgColor" data-bgColor="#cdd4ea">Android</th>
                <th class="_bgColor" data-bgColor="#cdd4ea">IOS</th>
                <th class="_bgColor" data-bgColor="#cdd4ea">PC</th>
                <th class="_bgColor" data-bgColor="#cdd4ea">Android</th>
                <th class="_bgColor" data-bgColor="#cdd4ea">IOS</th>
                <th class="_bgColor" data-bgColor="#cdd4ea">PC</th>
                <th class="_bgColor" data-bgColor="#cdd4ea">Android</th>
                <th class="_bgColor" data-bgColor="#cdd4ea">IOS</th>
                <th class="_bgColor" data-bgColor="#cdd4ea">PC</th>
                <th class="_bgColor" data-bgColor="#cdd4ea">Android</th>
                <th class="_bgColor" data-bgColor="#cdd4ea">IOS</th>
                <th class="_bgColor" data-bgColor="#cdd4ea">PC</th>
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
        var nowDay = moment(new Date()).format('YYYY') + "." + moment(new Date()).format('MM') + "." + moment(new Date()).format('DD');
        var ageDay = week[moment(nowDay).add('days', 0).day()];
        $("#ageDay").text(nowDay + "(" + ageDay + ")");

        var data = dataSet();
        data.slctType = 1;

        util.getAjaxData("platformAgeList", "/rest/enter/join/platform/age", data, fn_platformAge_success);
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

            response.data.detailList.slctType = 1
        }

        for(var i=0;i<response.data.detailList.length;i++){
            toDay = week[moment(response.data.detailList[i].daily.replace(/-/gi,".")).add('days', 0).day()];
            response.data.detailList[i].date = response.data.detailList[i].daily.replace(/-/gi,".") + "(" + toDay + ")";
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

        ui.tableHeightSet();
        ui.paintColor();
    }

</script>

<script type="text/x-handlebars-template" id="tmp_platformAgeTotal">
    <tr class="font-bold _bgColor _fontColor" data-bgColor="#d0cece" data-fontColor="#f37600">
        <td>
            총계<br/>
            <span style="color: #555555;">가입수치(연령대별비율)<br/>/탈퇴수</span>
        </td>
        <td>{{addComma sum_totalCnt}}</td>
        <td>{{addComma sum_totalCnt}}</td>
        <td>{{addComma sum_totalCnt}}</td>
        <td>{{addComma sum_totalCnt}}</td>
        <td>{{addComma sum_totalCnt}}</td>
        <td>{{addComma sum_totalCnt}}</td>
        <td>{{addComma sum_totalCnt}}</td>
        <td>{{addComma sum_totalCnt}}</td>
        <td>{{addComma sum_totalCnt}}</td>
        <td>{{addComma sum_totalCnt}}</td>
        <td>{{addComma sum_totalCnt}}</td>
        <td>{{addComma sum_totalCnt}}</td>
    </tr>
</script>

<script type="text/x-handlebars-template" id="tmp_platformAgeDetailList">
    {{#each this as |data|}}
        <tr>
            <td class="font-bold _bgColor" data-bgColor="#d8e2f3">
                {{data.date}}
            </td>
            <td>{{addComma totalCnt}}</td>
            <td>{{addComma totalCnt}}</td>
            <td>{{addComma totalCnt}}</td>
            <td>{{addComma totalCnt}}</td>
            <td>{{addComma totalCnt}}</td>
            <td>{{addComma totalCnt}}</td>
            <td>{{addComma totalCnt}}</td>
            <td>{{addComma totalCnt}}</td>
            <td>{{addComma totalCnt}}</td>
            <td>{{addComma totalCnt}}</td>
            <td>{{addComma totalCnt}}</td>
            <td>{{addComma totalCnt}}</td>
        </tr>
    {{else}}
        <tr>
            <td colspan="20" class="noData">{{isEmptyData}}<td>
        </tr>
    {{/each}}
</script>