<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 방송현황 > 시간대별 -->
<div class="widget widget-table mb10">
    <div class="widget-content mt10">
        <span class="font-bold" id="timeDate"></span>
        <table class="table table-bordered _tableHeight" data-height="23px">
            <colgroup>
                <col width="7.1%"/><col width="7.1%"/><col width="7.1%"/><col width="7.1%"/><col width="7.1%"/>
                <col width="7.1%"/><col width="7.1%"/><col width="7.1%"/><col width="7.1%"/><col width="7.1%"/>
                <col width="7.1%"/><col width="7.1%"/><col width="7.1%"/><col width="7.1%"/>
            </colgroup>
            <thead>
            <tr>
                <th rowspan="2" class="_bgColor" data-bgColor="#b4c7e7">구분</th>
                <th colspan="5" class="_bgColor" data-bgColor="#b4c7e7">DJ (방송개설)</th>
                <th colspan="5" class="_bgColor" data-bgColor="#b4c7e7">청취자</th>
                <th rowspan="2" class="_bgColor" data-bgColor="#b4c7e7">방송시간</th>
                <th rowspan="2" class="_bgColor" data-bgColor="#b4c7e7">선물 건 수</th>
                <th rowspan="2" class="_bgColor" data-bgColor="#b4c7e7">선물 달 수</th>
            </tr>                                                              
            <tr>
                <th class="_bgColor _sex_male" data-bgColor="#e9ebf5"></th>
                <th class="_bgColor _sex_female" data-bgColor="#e9ebf5"></th>
                <th class="_bgColor _sex_none" data-bgColor="#e9ebf5"></th>
                <th class="_bgColor" data-bgColor="#e9ebf5">최대 개설 수</th>
                <th class="_bgColor" data-bgColor="#e9ebf5">누적 방송 총계</th>
                <th class="_bgColor _sex_male" data-bgColor="#e9ebf5"></th>
                <th class="_bgColor _sex_female" data-bgColor="#e9ebf5"></th>
                <th class="_bgColor _sex_none" data-bgColor="#e9ebf5"></th>
                <th class="_bgColor" data-bgColor="#e9ebf5">최대 청취 수</th>
                <th class="_bgColor" data-bgColor="#e9ebf5">누적 청취 총계</th>
            </tr>
            </thead>
            <tbody id="timeTableBody"></tbody>
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
        getTimeList();
    });


    function getTimeList(){
        var data = dataSet();
        data.slctType = 0;

        var timeDay = week[moment(data.startDate).add('days', 0).day()];
        $("#timeDate").text(data.startDate + "(" + timeDay + ")");

        util.getAjaxData("time", "/rest/status/newBroadcast/info/time", data, fn_time_success);
    }

    function fn_time_success(data, response){
        var isDataEmpty = response.data.detailList == null;
        var tableBody = $("#timeTableBody");

        tableBody.empty();
        if(!isDataEmpty){
            var total_create_totalCnt = [
                response.data.totalInfo.total_create_mCnt,
                response.data.totalInfo.total_create_fCnt,
                response.data.totalInfo.total_create_nCnt,
            ];
            response.data.totalInfo["total_create_totalCnt"] = common.getListSum(total_create_totalCnt);

            var total_listener_totalCnt = [
                response.data.totalInfo.total_listener_mCnt,
                response.data.totalInfo.total_listener_fCnt,
                response.data.totalInfo.total_listener_nCnt,
            ];
            response.data.totalInfo["total_listener_totalCnt"] = common.getListSum(total_listener_totalCnt);

            var template = $('#tmp_timeTotal').html();
            var templateScript = Handlebars.compile(template);
            var totalContext = response.data.totalInfo;
            var totalHtml = templateScript(totalContext);
            tableBody.append(totalHtml);
        }

        for(var i=0;i<response.data.detailList.length;i++){
            response.data.detailList[i].nowMonth = Number(moment().format("MM"));
            response.data.detailList[i].nowDay = common.lpad(Number(moment().format("DD"),2,"0"));
            response.data.detailList[i].nowHour = Number(moment().format("HH"));

            var create_totalCnt = [
                response.data.detailList[i].create_mCnt,
                response.data.detailList[i].create_fCnt,
                response.data.detailList[i].create_nCnt,
            ];
            response.data.detailList[i].create_totalCnt = common.getListSum(create_totalCnt);

            var listener_totalCnt = [
                response.data.detailList[i].listener_mCnt,
                response.data.detailList[i].listener_fCnt,
                response.data.detailList[i].listener_nCnt,
            ];
            response.data.detailList[i].listener_totalCnt = common.getListSum(listener_totalCnt);
        }

        var template = $('#tmp_timeDetailList').html();
        var templateScript = Handlebars.compile(template);
        var detailContext = response.data.detailList;
        var html=templateScript(detailContext);
        tableBody.append(html);

        if(isDataEmpty){
            $("#timeTableBody td:last").remove();
        }else{
            tableBody.append(totalHtml);
        }

        ui.tableHeightSet();
        ui.paintColor();
    }

</script>

<script type="text/x-handlebars-template" id="tmp_timeTotal">
    <tr class="font-bold _bgColor" data-bgColor="#d0cece">
        <td>총합</td>
        <td class="_fontColor" data-fontColor="blue">{{addComma total_create_mCnt}}</td>
        <td class="_fontColor" data-fontColor="red">{{addComma total_create_fCnt}}</td>
        <td>{{addComma total_create_nCnt}}</td>
        <td class="_fontColor" data-fontColor="#ff3300">{{addComma total_create_totalCnt}}</td>
        <td>{{addComma total_create_max_Cnt}}</td>
        <td class="_fontColor" data-fontColor="blue">{{addComma total_listener_mCnt}}</td>
        <td class="_fontColor" data-fontColor="red">{{addComma total_listener_fCnt}}</td>
        <td>{{addComma total_listener_nCnt}}</td>
        <td class="_fontColor" data-fontColor="#ff3300">{{addComma total_listener_totalCnt}}</td>
        <td>{{addComma total_listener_max_Cnt}}</td>
        <td>{{timeStampDay total_airtime}}</td>
        <td>{{addComma total_gift_Cnt}}</td>
        <td>{{addComma total_gift_Amt}}</td>
    </tr>
</script>

<script type="text/x-handlebars-template" id="tmp_timeDetailList">
    {{#each this as |data|}}
    <tr {{#dalbit_if nowHour '==' the_hr}} class="font-bold _bgColor" data-bgColor="#fff2cc"  {{/dalbit_if}}>
        <td {{#dalbit_if nowHour '==' the_hr}} class="font-bold _bgColor" data-bgColor="#fff2cc"  {{/dalbit_if}}
        {{#dalbit_if nowHour '!=' the_hr}} class="font-bold _bgColor" data-bgColor="#d8e2f3"  {{/dalbit_if}}>
        {{data.the_hr}}시
        </td>
        <td class="_fontColor" data-fontColor="blue">{{addComma create_mCnt 'Y'}}</td>
        <td class="_fontColor" data-fontColor="red">{{addComma create_fCnt 'Y'}}</td>
        <td>{{addComma create_nCnt 'Y'}}</td>
        <td class="_fontColor" data-fontColor="#ff3300">{{addComma create_totalCnt 'Y'}}</td>
        <td>{{addComma create_max_Cnt 'Y'}}</td>
        <td class="_fontColor" data-fontColor="blue">{{addComma listener_mCnt 'Y'}}</td>
        <td class="_fontColor" data-fontColor="red">{{addComma listener_fCnt 'Y'}}</td>
        <td>{{addComma listener_nCnt 'Y'}}</td>
        <td class="_fontColor" data-fontColor="#ff3300">{{addComma listener_totalCnt 'Y'}}</td>
        <td>{{addComma listener_max_Cnt 'Y'}}</td>
        <td>{{timeStampDay airtime}}</td>
        <td>{{addComma gift_Cnt 'Y'}}</td>
        <td>{{addComma gift_Amt 'Y'}}</td>
    </tr>
    {{else}}
    <tr>
        <td colspan="20" class="noData">{{isEmptyData}}<td>
    </tr>
    {{/each}}
</script>