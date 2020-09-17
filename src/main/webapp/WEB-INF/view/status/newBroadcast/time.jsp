<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 방송현황 > 시간대별 -->
<span class="_searchDate font-bold"></span>
<span class="" style="font-size: 11px;color: red;">* 총 수치(비중복 수치)로 표기된 현황입니다.</span>
<div class="widget widget-table mb10">
    <div class="widget-content mt10">
        <div class="col-md-11 no-padding">
            <span class="font-bold">◈DJ/청취자 성별</span>
            <table class="table table-bordered _tableHeight" data-height="23px">
                <colgroup>
                    <col width="4.2%"/><col width="5.1%"/><col width="5.1%"/><col width="5.1%"/><col width="5.1%"/>
                    <col width="5.1%"/><col width="5.1%"/><col width="5.1%"/><col width="5.1%"/><col width="5.1%"/>
                    <col width="5.1%"/><col width="5.1%"/><col width="5.1%"/><col width="5.1%"/><col width="5.1%"/>
                    <col width="5.1%"/>
                </colgroup>
                <thead>
                <tr>
                    <th rowspan="2" class="_bgColor" data-bgColor="#b4c7e7">구분</th>
                    <th colspan="6" class="_bgColor" data-bgColor="#b4c7e7">DJ (방송개설)</th>
                    <th colspan="6" class="_bgColor" data-bgColor="#b4c7e7">청취자</th>
                    <th rowspan="2" class="_bgColor" data-bgColor="#b4c7e7">방송시간</th>
                    <th rowspan="2" class="_bgColor" data-bgColor="#b4c7e7">선물 건 수</th>
                    <th rowspan="2" class="_bgColor" data-bgColor="#b4c7e7">선물 달 수</th>
                </tr>
                <tr>
                    <th class="_bgColor _sex_male" data-bgColor="#e9ebf5"></th>
                    <th class="_bgColor _sex_female" data-bgColor="#e9ebf5"></th>
                    <th class="_bgColor _sex_none" data-bgColor="#e9ebf5"></th>
                    <th class="_bgColor" data-bgColor="#bfbfbf">소계</th>
                    <th class="_bgColor" data-bgColor="#e9ebf5">누적 방송 총계</th>
                    <th class="_bgColor" data-bgColor="#e9ebf5">최대 개설 수</th>
                    <th class="_bgColor _sex_male" data-bgColor="#e9ebf5"></th>
                    <th class="_bgColor _sex_female" data-bgColor="#e9ebf5"></th>
                    <th class="_bgColor _sex_none" data-bgColor="#e9ebf5"></th>
                    <th class="_bgColor" data-bgColor="#bfbfbf">소계</th>
                    <th class="_bgColor" data-bgColor="#e9ebf5">누적 청취 총계</th>
                    <th class="_bgColor" data-bgColor="#e9ebf5">최대 청취 수</th>
                </tr>
                </thead>
                <tbody id="timeTableBody"></tbody>
            </table>
        </div>

        <div class="col-md-8 no-padding">
            <span class="font-bold">◈선물 별</span>
            <table class="table table-bordered _tableHeight" data-height="23px">
                <colgroup>
                    <col width="7.2%"/><col width="14.2%"/><col width="14.2%"/><col width="14.2%"/><col width="14.2%"/>
                    <col width="14.2%"/><col width="14.2%"/>
                </colgroup>
                <thead>
                <tr>
                    <th class="_bgColor" data-bgColor="#b4c7e7">구분</th>
                    <th class="_bgColor" data-bgColor="#b4c7e7">총 선물 건수</th>
                    <th class="_bgColor" data-bgColor="#b4c7e7">총 선물 달수</th>
                    <th class="_bgColor" data-bgColor="#b4c7e7">일반선물 건수</th>
                    <th class="_bgColor" data-bgColor="#b4c7e7">일반선물 달수</th>
                    <th class="_bgColor" data-bgColor="#b4c7e7">비밀선물 건수</th>
                    <th class="_bgColor" data-bgColor="#b4c7e7">비밀선물 달수</th>
                </tr>
                </thead>
                <tbody  id="giftListBody">
                </tbody>
            </table>
        </div>

        <div class="col-md-8 no-padding">
            <span class="font-bold">◈플랫폼 별</span>
            <table class="table table-bordered _tableHeight" data-height="23px">
                <colgroup>
                    <col width="7.2%"/><col width="11.1%"/><col width="11.1%"/><col width="11.1%"/><col width="11.1%"/>
                    <col width="11.1%"/><col width="11.1%"/><col width="11.1%"/><col width="11.1%"/>
                </colgroup>
                <thead>
                <tr>
                    <th rowspan="2" class="_bgColor" data-bgColor="#b4c7e7">구분</th>
                    <th colspan="3" class="_bgColor" data-bgColor="#b4c7e7">방송개설</th>
                    <th rowspan="2" class="_bgColor" data-bgColor="#d0cece">소계</th>
                    <th colspan="3" class="_bgColor" data-bgColor="#b4c7e7">방송시간</th>
                    <th rowspan="2" class="_bgColor" data-bgColor="#d0cece">소계</th>
                </tr>
                <tr>
                    <th class="_bgColor" data-bgColor="#e9ebf5">PC웹</th>
                    <th class="_bgColor" data-bgColor="#e9ebf5">안드로이드</th>
                    <th class="_bgColor" data-bgColor="#e9ebf5">아이폰</th>

                    <th class="_bgColor" data-bgColor="#e9ebf5">PC웹</th>
                    <th class="_bgColor" data-bgColor="#e9ebf5">안드로이드</th>
                    <th class="_bgColor" data-bgColor="#e9ebf5">아이폰</th>
                </tr>
                </thead>
                <tbody id="platformTimeListBody">
                </tbody>
            </table>
        </div>
        <div class="col-md-8 no-padding">
            <span class="font-bold">◈방송 주제 별</span>
            <table class="table table-bordered _tableHeight" data-height="23px">
                <colgroup>
                    <col width="7%"/><col width="8.3%"/><col width="8.3%"/><col width="8.3%"/><col width="8.3%"/>
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
                    <th class="_bgColor" data-bgColor="#d0cece">소계</th>
                </tr>
                </thead>
                <tbody id="typeTimeTableBody"></tbody>
            </table>
        </div>
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

        $("._searchDate").html(moment($("#startDate").val()).format('YYYY년 MM월 DD일') + "(" + timeDay + ")");

        util.getAjaxData("time", "/rest/status/newBroadcast/info/time", data, fn_time_success);

        util.getAjaxData("broadcastGift", "/rest/status/broadcast/broadcastGift/list", data, fn_broadcastGift_success);

        util.getAjaxData("memberList", "/rest/status/broadcast/info/platform", data, fn_platformTimeList_success);

        util.getAjaxData("type", "/rest/status/newBroadcast/info/type", data, fn_typeTime_success);
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
            response.data.detailList[i].index = common.lpad(Number(moment().format("HH")),2,"0");
            response.data.detailList[i].nowMonth = Number(moment().format("MM"));
            response.data.detailList[i].nowDay = common.lpad(Number(moment().format("DD"),2,"0"));
            response.data.detailList[i].nowHour = Number(moment().format("HH"));
        }
        //현재 객체 배열을 정렬
        response.data.detailList.sort(function (a, b) {
            return a.index < b.index ? 1 : -1;
        });

        var tmp_create_totalCnt = 0;
        var tmp_listener_totalCnt = 0;
        for(var i=0;i<response.data.detailList.length;i++){
            var create_totalCnt = [
                response.data.detailList[i].create_mCnt,
                response.data.detailList[i].create_fCnt,
                response.data.detailList[i].create_nCnt,
            ];
            if(common.getListSum(create_totalCnt) != 0 ){
                response.data.detailList[i].create_totalCnt = common.getListSum(create_totalCnt);
                response.data.detailList[i].create_accuTotalCnt = tmp_create_totalCnt + common.getListSum(create_totalCnt);
                tmp_create_totalCnt = tmp_create_totalCnt + common.getListSum(create_totalCnt);
            }else{
                response.data.detailList[i].create_totalCnt = 0;
                response.data.detailList[i].create_accuTotalCnt = 0;
            }
            var listener_totalCnt = [
                response.data.detailList[i].listener_mCnt,
                response.data.detailList[i].listener_fCnt,
                response.data.detailList[i].listener_nCnt,
            ];
            if(common.getListSum(listener_totalCnt) != 0){
                response.data.detailList[i].listener_totalCnt = common.getListSum(listener_totalCnt);
                response.data.detailList[i].listener_accuTotalCnt = tmp_listener_totalCnt + common.getListSum(listener_totalCnt);
                tmp_listener_totalCnt = tmp_listener_totalCnt + common.getListSum(listener_totalCnt);
            }else{
                response.data.detailList[i].listener_accuTotalCnt = 0;
                response.data.detailList[i].listener_totalCnt = 0;
            }
        }
        //현재 객체 배열을 정렬
        response.data.detailList.sort(function (a, b) {
            return a.index < b.index ? 1 : -1;
        });

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

    function fn_broadcastGift_success(dst_id, response) {
        dalbitLog(response);
        var isDataEmpty = response.data.detailList == null;
        $("#giftListBody").empty();
        if(!isDataEmpty){
            var template = $('#tmp_giftTotal').html();
            var templateScript = Handlebars.compile(template);
            var totalContext = response.data.totalInfo;
            var totalHtml = templateScript(totalContext);
            $("#giftListBody").append(totalHtml);

            response.data.detailList.slctType = $('input:radio[name="slctType"]:checked').val();
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

        var template = $('#tmp_giftDetailList').html();
        var templateScript = Handlebars.compile(template);
        var detailContext = response.data.detailList;
        var html=templateScript(detailContext);
        $("#giftListBody").append(html);

        if(isDataEmpty){
            $("#giftListBody td:last").remove();
        }else{
            $("#giftListBody").append(totalHtml);
        }

        ui.tableHeightSet();
        ui.paintColor();
    }

    function fn_platformTimeList_success(dst_id, response) {
        dalbitLog(response);
        var isDataEmpty = response.data.detailList == null;
        $("#platformTimeListBody").empty();
        if(!isDataEmpty){
            var template = $('#tmp_platformTime').html();
            var templateScript = Handlebars.compile(template);
            var totalContext = response.data.totalInfo;
            var totalHtml = templateScript(totalContext);
            $("#platformTimeListBody").append(totalHtml);

            response.data.detailList.slctType = slctType;
        }

        for(var i=0;i<response.data.detailList.length;i++){
            response.data.detailList[i].nowMonth = Number(moment().format("MM"));
            response.data.detailList[i].nowDay = common.lpad(Number(moment().format("DD"),2,"0"));
            response.data.detailList[i].nowHour = Number(moment().format("HH"));
        }

        var template = $('#tmp_platformTimeDetailList').html();
        var templateScript = Handlebars.compile(template);
        var detailContext = response.data.detailList;
        var html=templateScript(detailContext);
        $("#platformTimeListBody").append(html);

        if(isDataEmpty){
            $("#platformTimeListBody td:last").remove();
        }else{
            $("#platformTimeListBody").append(totalHtml);
        }

        ui.tableHeightSet();
        ui.paintColor();
    }

    function fn_typeTime_success(data, response){
        var isDataEmpty = response.data.detailList == null;
        var tableBody = $("#typeTimeTableBody");

        tableBody.empty();
        if(!isDataEmpty){
            var template = $('#tmp_typeTime').html();
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

        var template = $('#tmp_typeTimeDetailList').html();
        var templateScript = Handlebars.compile(template);
        var detailContext = response.data.detailList;
        var html=templateScript(detailContext);
        tableBody.append(html);

        if(isDataEmpty){
            $("#typeTimeTableBody td:last").remove();
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
        <td>{{addComma total_create_totalCnt}} ({{addComma total_unique_dj_Cnt}})</td>
        <td class="_fontColor" data-fontColor="#ff3300">{{addComma total_create_totalCnt}}</td>
        <td>{{addComma total_create_max_Cnt}}</td>
        <td class="_fontColor" data-fontColor="blue">{{addComma total_listener_mCnt}}</td>
        <td class="_fontColor" data-fontColor="red">{{addComma total_listener_fCnt}}</td>
        <td>{{addComma total_listener_nCnt}}</td>
        <td>{{addComma total_listener_totalCnt}} ({{addComma total_unique_listener_Cnt}})</td>
        <td class="_fontColor" data-fontColor="#ff3300">{{addComma total_listener_totalCnt}}</td>
        <td>{{addComma total_listener_max_Cnt}}</td>
        <td style="text-align: right">{{timeStampDay total_airtime}}</td>
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
        <td>{{#dalbit_if create_totalCnt '!=' 0}}{{addComma create_totalCnt 'Y'}} ({{addComma unique_dj_Cnt}}){{/dalbit_if}}</td>
        <td class="_fontColor" data-fontColor="#ff3300">{{addComma create_accuTotalCnt 'Y'}}</td>
        <td>{{addComma create_max_Cnt 'Y'}}</td>
        <td class="_fontColor" data-fontColor="blue">{{addComma listener_mCnt 'Y'}}</td>
        <td class="_fontColor" data-fontColor="red">{{addComma listener_fCnt 'Y'}}</td>
        <td>{{addComma listener_nCnt 'Y'}}</td>
        <td>{{#dalbit_if listener_totalCnt '!=' 0}}{{addComma listener_totalCnt 'Y'}} ({{addComma unique_listener_Cnt}}){{/dalbit_if}}</td>
        <td class="_fontColor" data-fontColor="#ff3300">{{addComma listener_accuTotalCnt 'Y'}}</td>
        <td>{{addComma listener_max_Cnt 'Y'}}</td>
        <td style="text-align: right">{{timeStampDay airtime}}</td>
        <td>{{addComma gift_Cnt 'Y'}}</td>
        <td>{{addComma gift_Amt 'Y'}}</td>
    </tr>
    {{else}}
    <tr>
        <td colspan="20" class="noData">{{isEmptyData}}<td>
    </tr>
    {{/each}}
</script>

<script type="text/x-handlebars-template" id="tmp_giftTotal">
    <tr class="font-bold _bgColor" data-bgColor="#d0cece">
        <td>총합</td>
        <td>{{addComma sum_totalGiftCnt}}</td>
        <td>{{addComma sum_totalGiftAmount}}</td>
        <td>{{addComma sum_normalGiftCnt}}</td>
        <td>{{addComma sum_normalGiftAmount}}</td>
        <td>{{addComma sum_secretGiftCnt}}</td>
        <td>{{addComma sum_secretGiftAmount}}</td>
    </tr>
</script>

<script type="text/x-handlebars-template" id="tmp_giftDetailList">
    {{#each this as |data|}}
    <tr {{#dalbit_if nowHour '==' hour}} class="font-bold _bgColor" data-bgColor="#fff2cc"  {{/dalbit_if}}>
        <td {{#dalbit_if nowHour '==' hour}} class="font-bold _bgColor" data-bgColor="#fff2cc"  {{/dalbit_if}}
        {{#dalbit_if nowHour '!=' hour}} class="font-bold _bgColor" data-bgColor="#d8e2f3"  {{/dalbit_if}}>
        {{data.hour}}시
        </td>
        <td>{{addComma totalGiftCnt 'Y'}}</td>
        <td>{{addComma totalGiftAmount 'Y'}}</td>
        <td>{{addComma normalGiftCnt 'Y'}}</td>
        <td>{{addComma normalGiftAmount 'Y'}}</td>
        <td>{{addComma secretGiftCnt 'Y'}}</td>
        <td>{{addComma secretGiftAmount 'Y'}}</td>
    </tr>
    {{else}}
    <tr>
        <td colspan="22" class="noData">{{isEmptyData}}<td>
    </tr>
    {{/each}}
</script>

<script type="text/x-handlebars-template" id="tmp_platformTime">
    <tr class="font-bold _bgColor" data-bgColor="#d0cece">
        <td>총합</td>
        <td>{{addComma sum_pcCnt}}</td>
        <td>{{addComma sum_androidCnt}}</td>
        <td>{{addComma sum_iosCnt}}</td>
        <td>{{addComma sum_totalCreateCnt}} ({{addComma sum_unique_dj_Cnt}})</td>
        <td style="text-align: right">{{timeStampDay sum_pcTime}}</td>
        <td style="text-align: right">{{timeStampDay sum_androidTime}}</td>
        <td style="text-align: right">{{timeStampDay sum_iosTime}}</td>
        <td style="text-align: right">{{timeStampDay sum_totalBroadcastingTime}}</td>
    </tr>
</script>

<script type="text/x-handlebars-template" id="tmp_platformTimeDetailList">
    {{#each this as |data|}}
    <tr {{#dalbit_if nowHour '==' hour}} class="font-bold _bgColor" data-bgColor="#fff2cc"  {{/dalbit_if}}>
        <td {{#dalbit_if nowHour '==' hour}} class="font-bold _bgColor" data-bgColor="#fff2cc"  {{/dalbit_if}}
        {{#dalbit_if nowHour '!=' hour}} class="font-bold _bgColor" data-bgColor="#d8e2f3"  {{/dalbit_if}}>
        {{data.hour}}시
        </td>
        <td>{{addComma pcCnt 'Y'}}</td>
        <td>{{addComma androidCnt 'Y'}}</td>
        <td>{{addComma iosCnt 'Y'}}</td>
        <td>{{#dalbit_if totalCreateCnt '!=' 0}}{{addComma totalCreateCnt}} ({{addComma unique_dj_Cnt}}){{/dalbit_if}}</td>
        <td style="text-align: right">{{timeStampDay pcTime}}</td>
        <td style="text-align: right">{{timeStampDay androidTime}}</td>
        <td style="text-align: right">{{timeStampDay iosTime}}</td>
        <td style="text-align: right">{{timeStampDay totalBroadcastingTime}}</td>
    </tr>
    {{/each}}
</script>

<script type="text/x-handlebars-template" id="tmp_typeTime">
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
        <td>{{addComma sum_totalCreateCnt}} ({{addComma sum_unique_dj_Cnt}})</td>
    </tr>
</script>

<script type="text/x-handlebars-template" id="tmp_typeTimeDetailList">
    {{#each this as |data|}}
    <tr {{#dalbit_if nowHour '==' hour}} class="font-bold _bgColor" data-bgColor="#fff2cc"  {{/dalbit_if}}>
        <td {{#dalbit_if nowHour '==' hour}} class="font-bold _bgColor" data-bgColor="#fff2cc"  {{/dalbit_if}}
        {{#dalbit_if nowHour '!=' hour}} class="font-bold _bgColor" data-bgColor="#d8e2f3"  {{/dalbit_if}}>
        {{data.hour}}시
        </td>
        <td>{{addComma create03Cnt 'Y'}}</td>
        <td>{{addComma create00Cnt 'Y'}}</td>
        <td>{{addComma create01Cnt 'Y'}}</td>
        <td>{{addComma create02Cnt 'Y'}}</td>
        <td>{{addComma create04Cnt 'Y'}}</td>
        <td>{{addComma create05Cnt 'Y'}}</td>
        <td>{{addComma create06Cnt 'Y'}}</td>
        <td>{{addComma create09Cnt 'Y'}}</td>
        <td>{{addComma create13Cnt 'Y'}}</td>
        <td>{{#dalbit_if totalCreateCnt '!=' 0}}{{addComma totalCreateCnt 'Y'}} ({{addComma unique_dj_Cnt}}){{/dalbit_if}}</td>
    </tr>
    {{else}}
    <tr>
        <td colspan="11" class="noData">{{isEmptyData}}<td>
    </tr>
    {{/each}}
</script>