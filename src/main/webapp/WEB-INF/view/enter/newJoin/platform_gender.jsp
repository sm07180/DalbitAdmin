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
        data.slctType = 0;
        util.getAjaxData("platformGenderList", "/rest/enter/newJoin/platform/gender", data, fn_platformGender_success);

        var data = dataSet(true);
        var PrevDay = data.startDate;
        $("#genderDay2").text(PrevDay.substr(5,2) + " 월");
        data.slctType = 0;
        util.getAjaxData("platformGenderList", "/rest/enter/newJoin/platform/gender", data, fn_platformGender_success2);
    }

    function fn_platformGender_success(data, response){

        var isDataEmpty = response.data.detailList == null;
        $("#platformGenderTableBody").empty();
        if(!isDataEmpty){
            response.data.totalInfo.aos_total_join_Cnt = response.data.totalInfo.aos_total_join_mCnt + response.data.totalInfo.aos_total_join_fCnt + response.data.totalInfo.aos_total_join_nCnt;
            response.data.totalInfo.ios_total_join_Cnt = response.data.totalInfo.ios_total_join_mCnt + response.data.totalInfo.ios_total_join_fCnt + response.data.totalInfo.ios_total_join_nCnt;
            response.data.totalInfo.pc_total_join_Cnt = response.data.totalInfo.pc_total_join_mCnt + response.data.totalInfo.pc_total_join_fCnt + response.data.totalInfo.pc_total_join_nCnt;
            response.data.totalInfo.total_join_Cnt = response.data.totalInfo.aos_total_join_Cnt + response.data.totalInfo.ios_total_join_Cnt + response.data.totalInfo.pc_total_join_Cnt;

            var template = $('#tmp_platformGenderTotal').html();
            var templateScript = Handlebars.compile(template);
            var totalContext = response.data.totalInfo;
            var totalHtml = templateScript(totalContext);
            $("#platformGenderTableBody").append(totalHtml);
        }

        for(var i=0;i<response.data.detailList.length;i++){
            response.data.detailList[i].nowMonth = Number(moment().format("MM"));
            response.data.detailList[i].nowDay = common.lpad(Number(moment().format("DD"),2,"0"));
            response.data.detailList[i].nowHour = Number(moment().format("HH"));
            response.data.detailList[i].day = response.data.detailList[i].the_date.substr(8,2);
            toDay = week[moment(response.data.detailList[i].the_date.replace(/-/gi,".")).add('days', 0).day()];
            if(toDay == "토"){
                toDay = '<span class="_fontColor" data-fontColor="blue">' + toDay + '</span>';
            }else if(toDay == "일"){
                toDay = '<span class="_fontColor" data-fontColor="red">' + toDay + '</span>';
            }
            response.data.detailList[i].date = response.data.detailList[i].the_date.replace(/-/gi,".") + "(" + toDay + ")";

            response.data.detailList[i].aos_total_join_Cnt = response.data.detailList[i].aos_total_join_mCnt + response.data.detailList[i].aos_total_join_fCnt + response.data.detailList[i].aos_total_join_nCnt;
            response.data.detailList[i].ios_total_join_Cnt = response.data.detailList[i].ios_total_join_mCnt + response.data.detailList[i].ios_total_join_fCnt + response.data.detailList[i].ios_total_join_nCnt;
            response.data.detailList[i].pc_total_join_Cnt = response.data.detailList[i].pc_total_join_mCnt + response.data.detailList[i].pc_total_join_fCnt + response.data.detailList[i].pc_total_join_nCnt;
            response.data.detailList[i].total_join_Cnt = response.data.detailList[i].aos_total_join_Cnt + response.data.detailList[i].ios_total_join_Cnt + response.data.detailList[i].pc_total_join_Cnt;

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

            response.data.totalInfo.aos_total_join_Cnt = response.data.totalInfo.aos_total_join_mCnt + response.data.totalInfo.aos_total_join_fCnt + response.data.totalInfo.aos_total_join_nCnt;
            response.data.totalInfo.ios_total_join_Cnt = response.data.totalInfo.ios_total_join_mCnt + response.data.totalInfo.ios_total_join_fCnt + response.data.totalInfo.ios_total_join_nCnt;
            response.data.totalInfo.pc_total_join_Cnt = response.data.totalInfo.pc_total_join_mCnt + response.data.totalInfo.pc_total_join_fCnt + response.data.totalInfo.pc_total_join_nCnt;
            response.data.totalInfo.total_join_Cnt = response.data.totalInfo.aos_total_join_Cnt + response.data.totalInfo.ios_total_join_Cnt + response.data.totalInfo.pc_total_join_Cnt;

            var template = $('#tmp_platformGenderTotal2').html();
            var templateScript = Handlebars.compile(template);
            var totalContext = response.data.totalInfo;
            var totalHtml = templateScript(totalContext);
            $("#platformGenderTableBody2").append(totalHtml);
        }

        for(var i=0;i<response.data.detailList.length;i++){
            response.data.detailList[i].nowMonth = Number(moment().format("MM"));
            response.data.detailList[i].nowDay = common.lpad(Number(moment().format("DD"),2,"0"));
            response.data.detailList[i].nowHour = Number(moment().format("HH"));
            response.data.detailList[i].day = response.data.detailList[i].the_date.substr(8,2);

            toDay = week[moment(response.data.detailList[i].the_date.replace(/-/gi,".")).add('days', 0).day()];
            if(toDay == "토"){
                toDay = '<span class="_fontColor" data-fontColor="blue">' + toDay + '</span>';
            }else if(toDay == "일"){
                toDay = '<span class="_fontColor" data-fontColor="red">' + toDay + '</span>';
            }
            response.data.detailList[i].date = response.data.detailList[i].the_date.replace(/-/gi,".") + "(" + toDay + ")";

            response.data.detailList[i].aos_total_join_Cnt = response.data.detailList[i].aos_total_join_mCnt + response.data.detailList[i].aos_total_join_fCnt + response.data.detailList[i].aos_total_join_nCnt;
            response.data.detailList[i].ios_total_join_Cnt = response.data.detailList[i].ios_total_join_mCnt + response.data.detailList[i].ios_total_join_fCnt + response.data.detailList[i].ios_total_join_nCnt;
            response.data.detailList[i].pc_total_join_Cnt = response.data.detailList[i].pc_total_join_mCnt + response.data.detailList[i].pc_total_join_fCnt + response.data.detailList[i].pc_total_join_nCnt;
            response.data.detailList[i].total_join_Cnt = response.data.detailList[i].aos_total_join_Cnt + response.data.detailList[i].ios_total_join_Cnt + response.data.detailList[i].pc_total_join_Cnt;

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

        <td>{{aos_total_join_mCnt}} ({{average aos_total_join_mCnt total_join_Cnt 0}}%) / {{aos_total_out_mCnt}}</td>
        <td>{{aos_total_join_fCnt}} ({{average aos_total_join_fCnt total_join_Cnt 0}}%) / {{aos_total_out_fCnt}}</td>
        <td>{{aos_total_join_nCnt}} ({{average aos_total_join_nCnt total_join_Cnt 0}}%) / {{aos_total_out_nCnt}}</td>
        <td>{{ios_total_join_mCnt}} ({{average ios_total_join_mCnt total_join_Cnt 0}}%) / {{ios_total_out_mCnt}}</td>
        <td>{{ios_total_join_fCnt}} ({{average ios_total_join_fCnt total_join_Cnt 0}}%) / {{ios_total_out_fCnt}}</td>
        <td>{{ios_total_join_nCnt}} ({{average ios_total_join_nCnt total_join_Cnt 0}}%) / {{ios_total_out_nCnt}}</td>
        <td>{{pc_total_join_mCnt}} ({{average pc_total_join_mCnt total_join_Cnt 0}}%) / {{pc_total_out_mCnt}}</td>
        <td>{{pc_total_join_fCnt}} ({{average pc_total_join_fCnt total_join_Cnt 0}}%) / {{pc_total_out_fCnt}}</td>
        <td>{{pc_total_join_nCnt}} ({{average pc_total_join_nCnt total_join_Cnt 0}}%) / {{pc_total_out_nCnt}}</td>
    </tr>
</script>

<script type="text/x-handlebars-template" id="tmp_platformGenderDetailList">
    {{#each this as |data|}}
    <tr {{#dalbit_if nowDay '==' day}} class="font-bold _bgColor" data-bgColor="#fff2cc"  {{/dalbit_if}}>
        <td class="font-bold _bgColor" data-bgColor="#fff2cc">
            {{{data.date}}}
        </td>
        <td>{{aos_total_join_mCnt}} ({{average aos_total_join_mCnt total_join_Cnt 0}}%) / {{aos_total_out_mCnt}}</td>
        <td>{{aos_total_join_fCnt}} ({{average aos_total_join_fCnt total_join_Cnt 0}}%) / {{aos_total_out_fCnt}}</td>
        <td>{{aos_total_join_nCnt}} ({{average aos_total_join_nCnt total_join_Cnt 0}}%) / {{aos_total_out_nCnt}}</td>
        <td>{{ios_total_join_mCnt}} ({{average ios_total_join_mCnt total_join_Cnt 0}}%) / {{ios_total_out_mCnt}}</td>
        <td>{{ios_total_join_fCnt}} ({{average ios_total_join_fCnt total_join_Cnt 0}}%) / {{ios_total_out_fCnt}}</td>
        <td>{{ios_total_join_nCnt}} ({{average ios_total_join_nCnt total_join_Cnt 0}}%) / {{ios_total_out_nCnt}}</td>
        <td>{{pc_total_join_mCnt}} ({{average pc_total_join_mCnt total_join_Cnt 0}}%) / {{pc_total_out_mCnt}}</td>
        <td>{{pc_total_join_fCnt}} ({{average pc_total_join_fCnt total_join_Cnt 0}}%) / {{pc_total_out_fCnt}}</td>
        <td>{{pc_total_join_nCnt}} ({{average pc_total_join_nCnt total_join_Cnt 0}}%) / {{pc_total_out_nCnt}}</td>
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

        <td>{{aos_total_join_mCnt}} ({{average aos_total_join_mCnt total_join_Cnt}}%) / {{aos_total_out_mCnt}}</td>
        <td>{{aos_total_join_fCnt}} ({{average aos_total_join_fCnt total_join_Cnt}}%) / {{aos_total_out_fCnt}}</td>
        <td>{{aos_total_join_nCnt}} ({{average aos_total_join_nCnt total_join_Cnt}}%) / {{aos_total_out_nCnt}}</td>
        <td>{{ios_total_join_mCnt}} ({{average ios_total_join_mCnt total_join_Cnt}}%) / {{ios_total_out_mCnt}}</td>
        <td>{{ios_total_join_fCnt}} ({{average ios_total_join_fCnt total_join_Cnt}}%) / {{ios_total_out_fCnt}}</td>
        <td>{{ios_total_join_nCnt}} ({{average ios_total_join_nCnt total_join_Cnt}}%) / {{ios_total_out_nCnt}}</td>
        <td>{{pc_total_join_mCnt}} ({{average pc_total_join_mCnt total_join_Cnt}}%) / {{pc_total_out_mCnt}}</td>
        <td>{{pc_total_join_fCnt}} ({{average pc_total_join_fCnt total_join_Cnt}}%) / {{pc_total_out_fCnt}}</td>
        <td>{{pc_total_join_nCnt}} ({{average pc_total_join_nCnt total_join_Cnt}}%) / {{pc_total_out_nCnt}}</td>
    </tr>
</script>

<script type="text/x-handlebars-template" id="tmp_platformGenderDetailList2">
    {{#each this as |data|}}
    <tr {{#dalbit_if nowDay '==' day}} class="font-bold _bgColor" data-bgColor="#fff2cc"  {{/dalbit_if}}>
        <td {{#dalbit_if nowDay '==' day}} class="font-bold _bgColor" data-bgColor="#fff2cc"  {{/dalbit_if}}
            {{#dalbit_if nowDay '!=' day}} class="font-bold _bgColor" data-bgColor="#d8e2f3"  {{/dalbit_if}}>
            {{{data.date}}}
        </td>
        <td>{{aos_total_join_mCnt}} ({{average aos_total_join_mCnt total_join_Cnt}}%) / {{aos_total_out_mCnt}}</td>
        <td>{{aos_total_join_fCnt}} ({{average aos_total_join_fCnt total_join_Cnt}}%) / {{aos_total_out_fCnt}}</td>
        <td>{{aos_total_join_nCnt}} ({{average aos_total_join_nCnt total_join_Cnt}}%) / {{aos_total_out_nCnt}}</td>
        <td>{{ios_total_join_mCnt}} ({{average ios_total_join_mCnt total_join_Cnt}}%) / {{ios_total_out_mCnt}}</td>
        <td>{{ios_total_join_fCnt}} ({{average ios_total_join_fCnt total_join_Cnt}}%) / {{ios_total_out_fCnt}}</td>
        <td>{{ios_total_join_nCnt}} ({{average ios_total_join_nCnt total_join_Cnt}}%) / {{ios_total_out_nCnt}}</td>
        <td>{{pc_total_join_mCnt}} ({{average pc_total_join_mCnt total_join_Cnt}}%) / {{pc_total_out_mCnt}}</td>
        <td>{{pc_total_join_fCnt}} ({{average pc_total_join_fCnt total_join_Cnt}}%) / {{pc_total_out_fCnt}}</td>
        <td>{{pc_total_join_nCnt}} ({{average pc_total_join_nCnt total_join_Cnt}}%) / {{pc_total_out_nCnt}}</td>
    </tr>
    {{else}}
    <tr>
        <td colspan="20" class="noData">{{isEmptyData}}<td>
    </tr>
    {{/each}}
</script>