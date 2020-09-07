<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 방송현황 > 시간대별 -->
<div class="widget widget-table mb10">
    <div class="widget-content mt10">
        <span class="font-bold" id="typeDate"></span>
        <table class="table table-bordered _tableHeight" data-height="23px">
            <colgroup>
                <col width="8.3%"/><col width="8.3%"/><col width="8.3%"/><col width="8.3%"/><col width="8.3%"/>
                <col width="8.3%"/><col width="8.3%"/><col width="8.3%"/><col width="8.3%"/><col width="8.3%"/>
                <col width="8.3%"/><col width="8.3%"/>
            </colgroup>
            <thead>
            <tr>
                <th class="_bgColor" data-bgColor="#b4c7e7">구분</th>
                <th class="_bgColor" data-bgColor="#b4c7e7">수다/챗</th>
                <th class="_bgColor" data-bgColor="#b4c7e7">일상/소통</th>
                <th class="_bgColor" data-bgColor="#b4c7e7">힐링</th>
                <th class="_bgColor" data-bgColor="#b4c7e7">노래/연주</th>
                <th class="_bgColor" data-bgColor="#b4c7e7">미팅/소개팅</th>
                <th class="_bgColor" data-bgColor="#b4c7e7">고민/사연</th>
                <th class="_bgColor" data-bgColor="#b4c7e7">책/여행</th>
                <th class="_bgColor" data-bgColor="#b4c7e7">ASMR</th>
                <th class="_bgColor" data-bgColor="#b4c7e7">성우</th>
                <%--<th class="_bgColor" data-bgColor="#b4c7e7">총합</th>--%>
            </tr>
            </thead>
            <tbody id="typeTableBody"></tbody>
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
        // getDayList();
    });


    function getTypeList(){
        var nowDay = moment(new Date()).format('YYYY') + "." + moment(new Date()).format('MM') + "." + moment(new Date()).format('DD');
        var dayDay = week[moment(nowDay).add('days', 0).day()];
        $("#typeDate").text(nowDay + "(" + dayDay + ")");

        var data = dataSet();
        data.slctType = 1;
        util.getAjaxData("type", "/rest/status/newBroadcast/info/type", data, fn_type_success);
    }

    function fn_type_success(data, response){
        var isDataEmpty = response.data.detailList == null;
        var tableBody = $("#typeTableBody");

        tableBody.empty();
        if(!isDataEmpty){
            var template = $('#tmp_typeTotal').html();
            var templateScript = Handlebars.compile(template);
            var totalContext = response.data.totalInfo;
            var totalHtml = templateScript(totalContext);
            tableBody.append(totalHtml);
        }


        for(var i=0;i<response.data.detailList.length;i++){
            response.data.detailList[i].nowMonth = Number(moment().format("MM"));
            response.data.detailList[i].nowDay = common.lpad(Number(moment().format("DD")),2,"0");
            response.data.detailList[i].nowHour = Number(moment().format("HH"));

            response.data.detailList[i].day = response.data.detailList[i].daily.substr(8,2);

            toDay = week[moment(response.data.detailList[i].daily.replace(/-/gi,".")).add('days', 0).day()];
            if(toDay == "토"){
                toDay = '<span class="_fontColor" data-fontColor="blue">' + response.data.detailList[i].daily.replace(/-/gi,".") + "(" + toDay + ")" + '</span>';
            }else if(toDay == "일"){
                toDay = '<span class="_fontColor" data-fontColor="red">' + response.data.detailList[i].daily.replace(/-/gi,".") + "(" + toDay + ")" + '</span>';
            }else{
                toDay = response.data.detailList[i].daily.replace(/-/gi,".") + "(" + toDay + ")";
            }

            response.data.detailList[i].date = toDay;

        }

        var template = $('#tmp_typeDetailList').html();
        var templateScript = Handlebars.compile(template);
        var detailContext = response.data.detailList;
        var html=templateScript(detailContext);
        tableBody.append(html);

        if(isDataEmpty){
            $("#typeTableBody td:last").remove();
        }else{
            tableBody.append(totalHtml);
        }

        ui.tableHeightSet();
        ui.paintColor();
    }

</script>

<script type="text/x-handlebars-template" id="tmp_typeTotal">
    <tr class="font-bold _bgColor" data-bgColor="#d0cece">
        <td>총합</td>
        <td>{{addComma sum_create03Cnt}}</td>
        <td>{{addComma sum_create00Cnt}}</td>
        <td>{{addComma sum_create01Cnt}}</td>
        <td>{{addComma sum_create02Cnt}}</td>
        <td>{{addComma sum_create04Cnt}}</td>
        <td>{{addComma sum_create05Cnt}}</td>
        <td>{{addComma sum_create06Cnt}}</td>
        <td>{{addComma sum_create09Cnt}}</td>
        <td>{{addComma sum_create13Cnt}}</td>
        <%--<td>{{addComma sum_totalCreateCnt}}</td>--%>
    </tr>
</script>

<script type="text/x-handlebars-template" id="tmp_typeDetailList">
    {{#each this as |data|}}
    <tr {{#dalbit_if nowDay '==' day}} class="font-bold _bgColor" data-bgColor="#fff2cc"  {{/dalbit_if}}>
        <td {{#dalbit_if nowDay '==' day}} class="font-bold _bgColor" data-bgColor="#fff2cc"  {{/dalbit_if}}
        {{#dalbit_if nowDay '!=' day}} class="font-bold _bgColor" data-bgColor="#d8e2f3"  {{/dalbit_if}}>
        {{{data.date}}}
        </td>
        <td>{{addComma create03Cnt}}</td>
        <td>{{addComma create00Cnt}}</td>
        <td>{{addComma create01Cnt}}</td>
        <td>{{addComma create02Cnt}}</td>
        <td>{{addComma create04Cnt}}</td>
        <td>{{addComma create05Cnt}}</td>
        <td>{{addComma create06Cnt}}</td>
        <td>{{addComma create09Cnt}}</td>
        <td>{{addComma create13Cnt}}</td>
        <%--<td>{{addComma totalCreateCnt}}</td>--%>
    </tr>
    {{else}}
    <tr>
        <td colspan="11" class="noData">{{isEmptyData}}<td>
    </tr>
    {{/each}}
</script>