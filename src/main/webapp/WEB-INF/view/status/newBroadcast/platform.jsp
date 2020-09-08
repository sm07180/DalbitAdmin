<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 방송 > 플랫폼 -->
<div class="widget widget-table mb10">
    <div class="widget-content mt10">
        <span class="font-bold" id="platformDate"></span>
        <table class="table table-bordered _tableHeight" data-height="23px">
            <colgroup>
                <col width="4.2%"/><col width="11.1%"/><col width="11.1%"/><col width="11.1%"/><col width="11.1%"/>
                <col width="11.1%"/><col width="11.1%"/><col width="11.1%"/><col width="11.1%"/>
            </colgroup>
            <thead>
            <tr>
                <th rowspan="2" class="_bgColor" data-bgColor="#b4c7e7">구분</th>
                <th colspan="4" class="_bgColor" data-bgColor="#b4c7e7">방송개설</th>
                <th colspan="4" class="_bgColor" data-bgColor="#b4c7e7">방송시간</th>
            </tr>
            <tr>
                <th class="_bgColor" data-bgColor="#e9ebf5">소계</th>
                <th class="_bgColor" data-bgColor="#e9ebf5">PC웹</th>
                <th class="_bgColor" data-bgColor="#e9ebf5">안드로이드</th>
                <th class="_bgColor" data-bgColor="#e9ebf5">아이폰</th>

                <th class="_bgColor" data-bgColor="#e9ebf5">소계</th>
                <th class="_bgColor" data-bgColor="#e9ebf5">PC웹</th>
                <th class="_bgColor" data-bgColor="#e9ebf5">안드로이드</th>
                <th class="_bgColor" data-bgColor="#e9ebf5">아이폰</th>
            </tr>
            </thead>
            <tbody id="platformListBody">
            </tbody>
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
        // getPlatformList();
    });

    function getPlatformList(){
        var data = dataSet();
        data.slctType = 0;

        var timeDay = week[moment(data.startDate).add('days', 0).day()];
        $("#platformDate").text(data.startDate + "(" + timeDay + ")");

        util.getAjaxData("memberList", "/rest/status/broadcast/info/platform", data, fn_platformList_success);
    }


    function fn_platformList_success(dst_id, response) {
        dalbitLog(response);
        var isDataEmpty = response.data.detailList == null;
        $("#platformListBody").empty();
        if(!isDataEmpty){
            var template = $('#tmp_platform').html();
            var templateScript = Handlebars.compile(template);
            var totalContext = response.data.totalInfo;
            var totalHtml = templateScript(totalContext);
            $("#platformListBody").append(totalHtml);

            response.data.detailList.slctType = slctType;
        }

        for(var i=0;i<response.data.detailList.length;i++){
            response.data.detailList[i].nowMonth = Number(moment().format("MM"));
            response.data.detailList[i].nowDay = common.lpad(Number(moment().format("DD"),2,"0"));
            response.data.detailList[i].nowHour = Number(moment().format("HH"));
        }

        var template = $('#tmp_platformDetailList').html();
        var templateScript = Handlebars.compile(template);
        var detailContext = response.data.detailList;
        var html=templateScript(detailContext);
        $("#platformListBody").append(html);

        if(isDataEmpty){
            $("#platformListBody td:last").remove();
        }else{
            $("#platformListBody").append(totalHtml);
        }

        ui.tableHeightSet();
        ui.paintColor();
    }
</script>

<script type="text/x-handlebars-template" id="tmp_platform">
    <tr class="font-bold _bgColor" data-bgColor="#d0cece">
        <td>총합</td>
        <td>{{addComma sum_totalCreateCnt}}</td>
        <td>{{addComma sum_pcCnt}}</td>
        <td>{{addComma sum_androidCnt}}</td>
        <td>{{addComma sum_iosCnt}}</td>
        <td>{{timeStampDay sum_totalBroadcastingTime}}</td>
        <td>{{timeStampDay sum_pcTime}}</td>
        <td>{{timeStampDay sum_androidTime}}</td>
        <td>{{timeStampDay sum_iosTime}}</td>
    </tr>
</script>

<script type="text/x-handlebars-template" id="tmp_platformDetailList">
    {{#each this as |data|}}
    <tr {{#dalbit_if nowHour '==' hour}} class="font-bold _bgColor" data-bgColor="#fff2cc"  {{/dalbit_if}}>
        <td {{#dalbit_if nowHour '==' hour}} class="font-bold _bgColor" data-bgColor="#fff2cc"  {{/dalbit_if}}
        {{#dalbit_if nowHour '!=' hour}} class="font-bold _bgColor" data-bgColor="#d8e2f3"  {{/dalbit_if}}>
        {{data.hour}}시
        </td>
        <td>{{addComma totalCreateCnt 'Y'}}</td>
        <td>{{addComma pcCnt 'Y'}}</td>
        <td>{{addComma androidCnt 'Y'}}</td>
        <td>{{addComma iosCnt 'Y'}}</td>
        <td>{{timeStampDay totalBroadcastingTime}}</td>
        <td>{{timeStampDay pcTime}}</td>
        <td>{{timeStampDay androidTime}}</td>
        <td>{{timeStampDay iosTime}}</td>
    </tr>
    {{/each}}
</script>