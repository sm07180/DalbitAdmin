<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 회원가입 > 플랫폼(연령별) -->
<div class="widget widget-table mb10">
    <div class="widget-content mt10">
        <span class="font-bold">※ 플랫폼(연령대)의 현황 수치는 <span class="font-bold _fontColor" data-fontColor="red">가입 수 (연령대의 플랫폼별 가입 비율 %) / 탈퇴 수」</span>를 표기한 정보입니다</span>
        <table class="table table-bordered _tableHeight" data-height="23px">
            <colgroup>
                <col width="13%"/><col width="7%"/><col width="7%"/><col width="7%"/><col width="7%"/>
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
        util.getAjaxData("platformAge", "/rest/enter/newJoin/platform/age", data, fn_platformAge_success);
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


            response.data.detailList[i].aos40_up_join_Cnt = response.data.detailList[i].aos40_join_Cnt  + response.data.detailList[i].aos50_join_Cnt
                                                          + response.data.detailList[i].aos60_join_Cnt;
            response.data.detailList[i].aos40_up_out_Cnt = response.data.detailList[i].aos40_out_Cnt  + response.data.detailList[i].aos50_out_Cnt
                                                          + response.data.detailList[i].aos60_out_Cnt;

            response.data.detailList[i].ios40_up_join_Cnt = response.data.detailList[i].ios40_join_Cnt  + response.data.detailList[i].ios50_join_Cnt
                                                          + response.data.detailList[i].ios60_join_Cnt;
            response.data.detailList[i].ios40_up_out_Cnt = response.data.detailList[i].ios40_out_Cnt  + response.data.detailList[i].ios50_out_Cnt
                                                          + response.data.detailList[i].ios60_out_Cnt;

            response.data.detailList[i].pc40_up_join_Cnt = response.data.detailList[i].pc40_join_Cnt  + response.data.detailList[i].pc50_join_Cnt
                                                          + response.data.detailList[i].pc60_join_Cnt;
            response.data.detailList[i].pc40_up_out_Cnt = response.data.detailList[i].pc40_out_Cnt  + response.data.detailList[i].pc50_out_Cnt
                                                          + response.data.detailList[i].pc60_out_Cnt;


            response.data.detailList[i].aos_join_total_Cnt = response.data.detailList[i].aos10_join_Cnt + response.data.detailList[i].aos20_join_Cnt
                                                             + response.data.detailList[i].aos30_join_Cnt + response.data.detailList[i].aos40_up_join_Cnt;

            response.data.detailList[i].ios_join_total_Cnt = response.data.detailList[i].ios10_join_Cnt + response.data.detailList[i].ios20_join_Cnt
                                                             + response.data.detailList[i].ios30_join_Cnt + response.data.detailList[i].ios40_up_join_Cnt;

            response.data.detailList[i].pc_join_total_Cnt = response.data.detailList[i].pc10_join_Cnt + response.data.detailList[i].pc20_join_Cnt
                                                            + response.data.detailList[i].pc30_join_Cnt + response.data.detailList[i].pc40_up_join_Cnt;

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
        </td>
        <td>{{addComma aos10_join_Cnt}} ({{average sum_android10Cnt total_join_Cnt}}) / {{addComma aos10_out_Cnt}}</td>
        <td>{{addComma ios10_join_Cnt}} ({{average sum_ios10Cnt total_join_Cnt}}) / {{addComma ios10_out_Cnt}}</td>
        <td>{{addComma pc10_join_Cnt}} ({{average sum_pc10Cnt total_join_Cnt}}) / {{addComma pc10_out_Cnt}}</td>
        <td>{{addComma aos20_join_Cnt}} ({{average sum_android20Cnt total_join_Cnt}}) / {{addComma aos20_out_Cnt}}</td>
        <td>{{addComma ios20_join_Cnt}} ({{average sum_ios20Cnt total_join_Cnt}}) / {{addComma ios20_out_Cnt}}</td>
        <td>{{addComma pc20_join_Cnt}} ({{average sum_pc20Cnt total_join_Cnt}}) / {{addComma pc20_out_Cnt}}</td>
        <td>{{addComma aos30_join_Cnt}} ({{average sum_android30Cnt total_join_Cnt}}) / {{addComma aos30_out_Cnt}}</td>
        <td>{{addComma ios30_join_Cnt}} ({{average sum_ios30Cnt total_join_Cnt}}) / {{addComma ios30_out_Cnt}}</td>
        <td>{{addComma pc30_join_Cnt}} ({{average sum_pc30Cnt total_join_Cnt}}) / {{addComma pc30_out_Cnt}}</td>
        <td>{{addComma aos40_up_join_Cnt}} ({{average sum_android40_upCnt total_join_Cnt}}) / {{addComma aos40_up_out_Cnt}}</td>
        <td>{{addComma ios40_up_join_Cnt}} ({{average sum_ios40_upCnt total_join_Cnt}}) / {{addComma ios40_up_out_Cnt}}</td>
        <td>{{addComma pc40_up_join_Cnt}} ({{average sum_pc40_upCnt total_join_Cnt}}) / {{addComma pc40_up_out_Cnt}}</td>
    </tr>
</script>

<script type="text/x-handlebars-template" id="tmp_platformAgeDetailList">
    {{#each this as |data|}}
        <tr {{#dalbit_if nowDay '==' day}} class="font-bold _bgColor" data-bgColor="#fff2cc"  {{/dalbit_if}}>
            <td {{#dalbit_if nowDay '==' day}} class="font-bold _bgColor" data-bgColor="#fff2cc"  {{/dalbit_if}}
                {{#dalbit_if nowDay '!=' day}} class="font-bold _bgColor" data-bgColor="#d8e2f3"  {{/dalbit_if}}>
                {{{data.date}}}
            </td>
            <td>{{addComma aos10_join_Cnt}} ({{average aos10_join_Cnt aos_join_total_Cnt}}) / {{aos10_out_Cnt}}</td>
            <td>{{addComma ios10_join_Cnt}} ({{average ios10_join_Cnt ios_join_total_Cnt}}) / {{ios10_out_Cnt}}</td>
            <td>{{addComma pc10_join_Cnt}} ({{average pc10_join_Cnt pc_join_total_Cnt}}) / {{pc10_out_Cnt}}</td>
            <td>{{addComma aos20_join_Cnt}} ({{average aos20_join_Cnt aos_join_total_Cnt}}) / {{aos20_out_Cnt}}</td>
            <td>{{addComma ios20_join_Cnt}} ({{average ios20_join_Cnt ios_join_total_Cnt}}) / {{ios20_out_Cnt}}</td>
            <td>{{addComma pc20_join_Cnt}} ({{average pc20_join_Cnt pc_join_total_Cnt}}) / {{pc20_out_Cnt}}</td>
            <td>{{addComma aos30_join_Cnt}} ({{average aos30_join_Cnt aos_join_total_Cnt}}) / {{aos30_out_Cnt}}</td>
            <td>{{addComma ios30_join_Cnt}} ({{average ios30_join_Cnt ios_join_total_Cnt}}) / {{ios30_out_Cnt}}</td>
            <td>{{addComma pc30_join_Cnt}} ({{average pc30_join_Cnt pc_join_total_Cnt}} ) / {{pc30_out_Cnt}}</td>
            <td>{{addComma aos40_up_join_Cnt}} ({{average aos40_up_join_Cnt aos_join_total_Cnt}}) / {{aos40_up_out_Cnt}}</td>
            <td>{{addComma ios40_up_join_Cnt}} ({{average ios40_up_join_Cnt ios_join_total_Cnt}}) / {{ios40_up_out_Cnt}}</td>
            <td>{{addComma pc40_up_join_Cnt}} ({{average pc40_up_join_Cnt pc_join_total_Cnt}}) / {{pc40_up_out_Cnt}}</td>
        </tr>
    {{else}}
        <tr>
            <td colspan="20" class="noData">{{isEmptyData}}<td>
        </tr>
    {{/each}}
</script>