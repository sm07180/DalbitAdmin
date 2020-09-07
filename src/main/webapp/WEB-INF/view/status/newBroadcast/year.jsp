<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 방송현황 > 시간대별 -->
<div class="widget widget-table mb10">
    <div class="widget-content mt10">
        <span class="font-bold" id="yearDate"></span>
        <table class="table table-bordered _tableHeight" data-height="23px">
            <colgroup>
                <col width="8.3%"/><col width="8.3%"/><col width="8.3%"/><col width="8.3%"/><col width="8.3%"/>
                <col width="8.3%"/><col width="8.3%"/><col width="8.3%"/><col width="8.3%"/><col width="8.3%"/>
                <col width="8.3%"/><col width="8.3%"/>
            </colgroup>
            <thead>
            <tr>
                <th rowspan="2" class="_bgColor" data-bgColor="#b4c7e7">구분</th>
                <th colspan="4" class="_bgColor" data-bgColor="#b4c7e7">DJ(방송개별)</th>
                <th colspan="4" class="_bgColor" data-bgColor="#b4c7e7">청취자</th>
                <th rowspan="2" class="_bgColor" data-bgColor="#b4c7e7">방송시간</th>
                <th rowspan="2" class="_bgColor" data-bgColor="#b4c7e7">선물 건 수</th>
                <th rowspan="2" class="_bgColor" data-bgColor="#b4c7e7">선물 달 수</th>
            </tr>                                                              
            <tr>
                <th class="_bgColor _sex_male" data-bgColor="#e9ebf5"></th>
                <th class="_bgColor _sex_female" data-bgColor="#e9ebf5"></th>
                <th class="_bgColor _sex_none" data-bgColor="#e9ebf5"></th>
                <th class="_bgColor" data-bgColor="#e9ebf5">최대 개설수</th>
                <th class="_bgColor _sex_male" data-bgColor="#e9ebf5"></th>
                <th class="_bgColor _sex_female" data-bgColor="#e9ebf5"></th>
                <th class="_bgColor _sex_none" data-bgColor="#e9ebf5"></th>
                <th class="_bgColor" data-bgColor="#e9ebf5">최대 개설수</th>
            </tr>
            </thead>
            <tbody id="yearTableBody"></tbody>
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
        // getYearList();
    });


    function getYearList(){
        var nowYear = moment(new Date()).format('YYYY');
        $("#yearDate").text(nowYear);

        var data = dataSet();
        data.slctType = 2;
        util.getAjaxData("time", "/rest/status/newBroadcast/info/time", data, fn_year_success);
    }

    function fn_year_success(data, response){
        var isDataEmpty = response.data.detailList == null;
        var tableBody = $("#yearTableBody");

        tableBody.empty();
        if(!isDataEmpty){
            var template = $('#tmp_yearTotal').html();
            var templateScript = Handlebars.compile(template);
            var totalContext = response.data.totalInfo;
            var totalHtml = templateScript(totalContext);
            tableBody.append(totalHtml);
        }

        for(var i=0;i<response.data.detailList.length;i++){
            response.data.detailList[i].nowMonth = Number(moment().format("MM"));
            response.data.detailList[i].nowDay = common.lpad(Number(moment().format("DD"),2,"0"));
            response.data.detailList[i].nowHour = Number(moment().format("HH"));

            response.data.detailList[i].month = response.data.detailList[i].the_date.substr(5,6);
        }

        var template = $('#tmp_yearDetailList').html();
        var templateScript = Handlebars.compile(template);
        var detailContext = response.data.detailList;
        var html=templateScript(detailContext);
        tableBody.append(html);

        if(isDataEmpty){
            $("#yearTableBody td:last").remove();
        }else{
            tableBody.append(totalHtml);
        }

        ui.tableHeightSet();
        ui.paintColor();
    }

</script>

<script type="text/x-handlebars-template" id="tmp_yearTotal">
    <tr class="font-bold _bgColor" data-bgColor="#d0cece">
        <td>총계</td>
        <td class="_fontColor" data-fontColor="blue">{{addComma total_create_mCnt}}</td>
        <td class="_fontColor" data-fontColor="red">{{addComma total_create_fCnt}}</td>
        <td>{{addComma total_create_nCnt}}</td>
        <td>{{addComma total_create_max_Cnt}}</td>
        <td class="_fontColor" data-fontColor="blue">{{addComma total_listener_mCnt}}</td>
        <td class="_fontColor" data-fontColor="red">{{addComma total_listener_fCnt}}</td>
        <td>{{addComma total_listener_nCnt}}</td>
        <td>{{addComma total_listener_max_Cnt}}</td>
        <td>{{timeStampDay total_airtime}}</td>
        <td>{{addComma total_gift_Cnt}}</td>
        <td>{{addComma total_gift_Amt}}</td>
    </tr>
</script>

<script type="text/x-handlebars-template" id="tmp_yearDetailList">
    {{#each this as |data|}}
    <tr {{#dalbit_if nowMonth '==' month}} class="font-bold _bgColor" data-bgColor="#fff2cc"  {{/dalbit_if}}>
    <td {{#dalbit_if nowMonth '==' month}} class="font-bold _bgColor" data-bgColor="#fff2cc"  {{/dalbit_if}}
    {{#dalbit_if nowMonth '!=' month}} class="font-bold _bgColor" data-bgColor="#d8e2f3"  {{/dalbit_if}}>
    {{data.the_date}}
    </td>
        <td class="_fontColor" data-fontColor="blue">{{addComma create_mCnt}}</td>
        <td class="_fontColor" data-fontColor="red">{{addComma create_fCnt}}</td>
        <td>{{addComma create_nCnt}}</td>
        <td>{{addComma create_max_Cnt}}</td>
        <td class="_fontColor" data-fontColor="blue">{{addComma listener_mCnt}}</td>
        <td class="_fontColor" data-fontColor="red">{{addComma listener_fCnt}}</td>
        <td>{{addComma listener_nCnt}}</td>
        <td>{{addComma listener_max_Cnt}}</td>
        <td>{{timeStampDay airtime}}</td>
        <td>{{addComma gift_Cnt}}</td>
        <td>{{addComma gift_Amt}}</td>
    </tr>
    {{else}}
    <tr>
        <td colspan="20" class="noData">{{isEmptyData}}<td>
    </tr>
    {{/each}}
</script>