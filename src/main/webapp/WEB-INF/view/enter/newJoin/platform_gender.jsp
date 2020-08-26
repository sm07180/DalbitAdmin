<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 회원가입 > 플랫폼(연령별) -->
<div class="widget widget-table mb10">
    <div class="widget-content mt10">
        <table class="table table-bordered _tableHeight" data-height="23px">
            <colgroup>
                <col width="10%"/><col width="7%"/><col width="7%"/><col width="7%"/><col width="7%"/>
                <col width="7%"/><col width="7%"/><col width="7%"/><col width="7%"/><col width="7%"/>
                <col width="7%"/><col width="7%"/><col width="7%"/>
            </colgroup>
            <thead>
            <tr>
                <th class="_bgColor" data-bgColor="#ffd966" rowspan="2" id="genderDay"></th>
                <th class="_bgColor" data-bgColor="#ffd966" colspan="3">Android</th>
                <th class="_bgColor" data-bgColor="#ffd966" colspan="3">IOS</th>
                <th class="_bgColor" data-bgColor="#ffd966" colspan="3">PC</th>
            </tr>
            <tr>
                <th class="_bgColor _sex_male"   data-bgColor="#fee599"></th>
                <th class="_bgColor _sex_female" data-bgColor="#fee599"></th>
                <th class="_bgColor _sex_none"   data-bgColor="#fee599"></th>
                <th class="_bgColor _sex_male"   data-bgColor="#fee599"></th>
                <th class="_bgColor _sex_female" data-bgColor="#fee599"></th>
                <th class="_bgColor _sex_none"   data-bgColor="#fee599"></th>
                <th class="_bgColor _sex_male"   data-bgColor="#fee599"></th>
                <th class="_bgColor _sex_female" data-bgColor="#fee599"></th>
                <th class="_bgColor _sex_none"   data-bgColor="#fee599"></th>
            </tr>
            </thead>
            <tbody id="platformGenderTableBody"></tbody>
        </table>

        <table class="table table-bordered _tableHeight" data-height="23px">
            <colgroup>
                <col width="10%"/><col width="7%"/><col width="7%"/><col width="7%"/><col width="7%"/>
                <col width="7%"/><col width="7%"/><col width="7%"/><col width="7%"/><col width="7%"/>
                <col width="7%"/><col width="7%"/><col width="7%"/>
            </colgroup>
            <thead>
            <tr>
                <th class="_bgColor" data-bgColor="#8da9db" rowspan="2" id="genderDay2"></th>
                <th class="_bgColor" data-bgColor="#8da9db" colspan="3">Android</th>
                <th class="_bgColor" data-bgColor="#8da9db" colspan="3">IOS</th>
                <th class="_bgColor" data-bgColor="#8da9db" colspan="3">PC</th>
            </tr>
            <tr>
                <th class="_bgColor _sex_male"   data-bgColor="#b3c6e7"></th>
                <th class="_bgColor _sex_female" data-bgColor="#b3c6e7"></th>
                <th class="_bgColor _sex_none"   data-bgColor="#b3c6e7"></th>
                <th class="_bgColor _sex_male"   data-bgColor="#b3c6e7"></th>
                <th class="_bgColor _sex_female" data-bgColor="#b3c6e7"></th>
                <th class="_bgColor _sex_none"   data-bgColor="#b3c6e7"></th>
                <th class="_bgColor _sex_male"   data-bgColor="#b3c6e7"></th>
                <th class="_bgColor _sex_female" data-bgColor="#b3c6e7"></th>
                <th class="_bgColor _sex_none"   data-bgColor="#b3c6e7"></th>
            </tr>
            </thead>
            <tbody id="platformGenderTableBody2"></tbody>
        </table>
    </div>
    <div class="widget-footer">
        <span>
            <%--<button class="btn btn-default print-btn pull-right" type="button" id="excelDownBtn"><i class="fa fa-print"></i>Excel Down</button>--%>
        </span>
    </div>
</div>

<script type="text/javascript">
    function getWithdrawList(){
        var nowDay = moment(new Date()).format('YYYY') + "." + moment(new Date()).format('MM') + "." + moment(new Date()).format('DD');
        var genderDay = week[moment(nowDay).add('days', 0).day()];
        $("#genderDay").text(nowDay + "(" + genderDay + ")");

        var data = dataSet();
        data.slctType = 1;
        util.getAjaxData("platformGenderList", "/rest/enter/join/platform/gender", data, fn_platformGender_success);



        var data = dataSet(true);

        var PrevDay = data.startDate;
        $("#genderDay2").text(PrevDay.substr(5,2) + " 월");

        data.slctType = 1;
        util.getAjaxData("platformGenderList", "/rest/enter/join/platform/gender", data, fn_platformGender_success2);
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

            response.data.detailList.slctType = 1;
        }

        for(var i=0;i<response.data.detailList.length;i++){
            toDay = week[moment(response.data.detailList[i].daily.replace(/-/gi,".")).add('days', 0).day()];
            response.data.detailList[i].date = response.data.detailList[i].daily.replace(/-/gi,".") + "(" + toDay + ")";
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

        ui.tableHeightSet();
        ui.paintColor();
    }

    function fn_platformGender_success2(data, response){

        var isDataEmpty = response.data.detailList == null;
        $("#platformGenderTableBody2").empty();
        if(!isDataEmpty){
            var template = $('#tmp_platformGenderTotal2').html();
            var templateScript = Handlebars.compile(template);
            var totalContext = response.data.totalInfo;
            var totalHtml = templateScript(totalContext);
            $("#platformGenderTableBody2").append(totalHtml);

            response.data.detailList.slctType = 1;
        }

        for(var i=0;i<response.data.detailList.length;i++){
            toDay = week[moment(response.data.detailList[i].daily.replace(/-/gi,".")).add('days', 0).day()];
            response.data.detailList[i].date = response.data.detailList[i].daily.replace(/-/gi,".") + "(" + toDay + ")";
        }

        var template = $('#tmp_platformGenderDetailList2').html();
        var templateScript = Handlebars.compile(template);
        var detailContext = response.data.detailList;
        var html=templateScript(detailContext);
        $("#platformGenderTableBody2").append(html);

        if(isDataEmpty){
            $("#platformGenderTableBody2 td:last").remove();
        }else{
            $("#platformGenderTableBody2").append(totalHtml);
        }

        ui.tableHeightSet();
        ui.paintColor();
    }

</script>

<script type="text/x-handlebars-template" id="tmp_platformGenderTotal">
    <tr class="font-bold _bgColor _fontColor" data-bgColor="#d0cece" data-fontColor="#f37600">
        <td>
            총계<br/>
            <span style="color: #555555;">가입수치(성별 비율)/탈퇴수</span>
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
    </tr>
</script>

<script type="text/x-handlebars-template" id="tmp_platformGenderDetailList">
    {{#each this as |data|}}
    <tr>
        <td class="font-bold _bgColor" data-bgColor="#fff2cc">
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
    </tr>
    {{else}}
    <tr>
        <td colspan="20" class="noData">{{isEmptyData}}<td>
    </tr>
    {{/each}}
</script>


<script type="text/x-handlebars-template" id="tmp_platformGenderTotal2">
    <tr class="font-bold _bgColor _fontColor" data-bgColor="#d0cece" data-fontColor="#f37600">
        <td>
            총계<br/>
            <span style="color: #555555;">가입수치(성별 비율)/탈퇴수</span>
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
    </tr>
</script>

<script type="text/x-handlebars-template" id="tmp_platformGenderDetailList2">
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
    </tr>
    {{else}}
    <tr>
        <td colspan="20" class="noData">{{isEmptyData}}<td>
    </tr>
    {{/each}}
</script>