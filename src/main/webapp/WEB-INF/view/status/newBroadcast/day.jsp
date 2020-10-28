<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 방송현황 > 시간대별 -->
<div class="col-md-12 no-padding divTable">
    <span class="_searchDate font-bold " style="width: 90px"></span>
    <label class="" style="font-size: 11px;color: red;">
        * 총 수치(비중복 수치)로 표기된 현황입니다.<br/>
        * 게스트 수치는 청취자 수치에 포함됩니다.
    </label>
</div>
<div class="widget widget-table mb10">
    <div class="widget-content mt10">
        <div class="col-md-12 no-padding">
            <span class="font-bold">◈DJ/청취자 성별</span>
            <table class="table table-bordered _tableHeight" data-height="23px">
                <colgroup>
                    <%--<col width="4.2%"/>--%>
                </colgroup>
                <thead>
                <tr>
                    <th rowspan="3" class="_bgColor" data-bgColor="#b4c7e7">구분</th>
                    <th colspan="5" class="_bgColor" data-bgColor="#b4c7e7">DJ (방송개설)</th>
                    <th rowspan="3" class="_bgColor" data-bgColor="#b4c7e7">방송시간</th>
                    <th colspan="6" class="_bgColor" data-bgColor="#f8cbad">청취자</th>
                    <th rowspan="3" class="_bgColor" data-bgColor="#b4c7e7">선물 수</th>
                    <th rowspan="3" class="_bgColor" data-bgColor="#b4c7e7">선물 달</th>
                </tr>
                <tr>
                    <th colspan="3" class="_bgColor" data-bgcolor="#dae3f3">DJ 성별</th>
                    <th rowspan="2" class="_bgColor" data-bgcolor="#d9d9d9">소계</th>
                    <th rowspan="2" class="_bgColor" data-bgcolor="#dae3f3">최대 개설</th>
                    <th colspan="3" class="_bgColor" data-bgcolor="#fbe5d6">청취자 성별</th>
                    <th rowspan="2" class="_bgColor" data-bgcolor="#fbe5d6">게스트</th>
                    <th rowspan="2" class="_bgColor" data-bgcolor="#d9d9d9">소계</th>
                    <th rowspan="2" class="_bgColor" data-bgcolor="#fbe5d6">최대 청취자</th>
                </tr>
                <tr>
                    <th class="_bgColor _sex_male" data-bgColor="#b4c7e7"></th>
                    <th class="_bgColor _sex_female" data-bgColor="#b4c7e7"></th>
                    <th class="_bgColor _sex_none" data-bgColor="#b4c7e7"></th>
                    <th class="_bgColor _sex_male" data-bgColor="#f8cbad"></th>
                    <th class="_bgColor _sex_female" data-bgColor="#f8cbad"></th>
                    <th class="_bgColor _sex_none" data-bgColor="#f8cbad"></th>
                </tr>
                </thead>
                <tbody id="dayTableBody"></tbody>
            </table>
        </div>

        <div class="col-md-8 no-padding">
            <span class="font-bold">◈선물 별</span>
            <table class="table table-bordered _tableHeight" data-height="23px">
                <colgroup>
                    <col width="8.7%"/><col width="14.2%"/><col width="14.2%"/><col width="14.2%"/><col width="14.2%"/>
                    <col width="14.2%"/><col width="14.2%"/>
                </colgroup>
                <thead>
                <tr>
                    <th rowspan="2" class="_bgColor" data-bgColor="#b4c7e7">구분</th>
                    <th colspan="2" class="_bgColor" data-bgColor="#b4c7e7">DJ<br/>일반(비밀)</th>
                    <th colspan="2" class="_bgColor" data-bgColor="#f8cbad">게스트<br/>일반(비밀)</th>
                    <th colspan="2" class="_bgColor _fontColor" data-bgColor="#000000" data-fontcolor="#ffc000" id="giftTotalCnt">
                        총 합<br/>(일반 + 비밀)
                    </th>
                </tr>
                <tr>
                    <th class="_bgColor" data-bgColor="#dae3f3">건 수</th>
                    <th class="_bgColor" data-bgColor="#dae3f3">달 수</th>
                    <th class="_bgColor" data-bgColor="#fbe5d6">건 수</th>
                    <th class="_bgColor" data-bgColor="#fbe5d6">달 수</th>
                    <th class="_bgColor" data-bgColor="#f2f2f2">건 수</th>
                    <th class="_bgColor" data-bgColor="#f2f2f2">달 수</th>
                </tr>
                </thead>
                <tbody  id="giftDayListBody">
                </tbody>
            </table>
        </div>

        <div class="col-md-8 no-padding">
            <span class="font-bold">◈플랫폼 별</span>
            <table class="table table-bordered _tableHeight" data-height="23px">
                <colgroup>
                    <col width="9.1%"/><col width="11.1%"/><col width="11.1%"/><col width="11.1%"/><col width="11.1%"/>
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
                <tbody id="platformDayListBody">
                </tbody>
            </table>
        </div>
        <div class="col-md-8 no-padding">
            <span class="font-bold">◈방송 주제 별</span>
            <table class="table table-bordered _tableHeight" data-height="23px">
                <colgroup>
                    <col width="8%"/><col width="8.3%"/><col width="8.3%"/><col width="8.3%"/><col width="8.3%"/>
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
                <tbody id="typeDayTableBody"></tbody>
            </table>
        </div>
    </div>
</div>
<div class="widget-footer">
    <span>
        <%--<button class="btn btn-default print-btn pull-right" type="button" id="excelDownBtn"><i class="fa fa-print"></i>Excel Down</button>--%>
    </span>
</div>

<script type="text/javascript">
    $(function(){
        // getDayList();
    });

    function getDayList(){
        $("._searchDate").html(moment($("#startDate").val()).format('YYYY년 MM월'));

        var data = dataSet();
        data.slctType = 1;
        util.getAjaxData("time", "/rest/status/newBroadcast/info/time", data, fn_day_success);

        util.getAjaxData("broadcastGift", "/rest/status/broadcast/broadcastGift/list", data, fn_broadcastGiftDay_success);

        util.getAjaxData("memberList", "/rest/status/broadcast/info/platform", data, fn_platformDayList_success);

        util.getAjaxData("type", "/rest/status/newBroadcast/info/type", data, fn_typeDay_success);
    }

    function fn_day_success(data, response){
        var isDataEmpty = response.data.detailList == null;
        var tableBody = $("#dayTableBody");

        tableBody.empty();
        if(!isDataEmpty){
            var template = $('#tmp_dayTotal').html();
            var templateScript = Handlebars.compile(template);
            var totalContext = response.data.totalInfo;
            var totalHtml = templateScript(totalContext);
            tableBody.append(totalHtml);
        }

        for(var i=0;i<response.data.detailList.length;i++){
            response.data.detailList[i].nowMonth = Number(moment().format("MM"));
            response.data.detailList[i].nowDay = common.lpad(Number(moment().format("DD")),2,"0");
            response.data.detailList[i].nowHour = Number(moment().format("HH"));
            response.data.detailList[i].day = response.data.detailList[i].the_date.substr(8,2);
            toDay = week[moment(response.data.detailList[i].the_date.replace(/-/gi,".")).add('days', 0).day()];
            if(toDay == "토"){
                toDay = '<span class="_fontColor" data-fontColor="blue">' + response.data.detailList[i].the_date.replace(/-/gi,".") + "(" + toDay + ")" + '</span>';
            }else if(toDay == "일"){
                toDay = '<span class="_fontColor" data-fontColor="red">' + response.data.detailList[i].the_date.replace(/-/gi,".") + "(" + toDay + ")" + '</span>';
            }else{
                toDay = response.data.detailList[i].the_date.replace(/-/gi,".") + "(" + toDay + ")";
            }
            response.data.detailList[i].date = toDay;
        }

        var template = $('#tmp_dayDetailList').html();
        var templateScript = Handlebars.compile(template);
        var detailContext = response.data.detailList;
        var html=templateScript(detailContext);
        tableBody.append(html);

        if(isDataEmpty){
            $("#dayTableBody td:last").remove();
        }else{
            tableBody.append(totalHtml);
        }

        ui.tableHeightSet();
        ui.paintColor();
    }

    function fn_broadcastGiftDay_success(dst_id, response) {
        dalbitLog(response);
        var isDataEmpty = response.data.detailList == null;
        $("#giftDayListBody").empty();
        if(!isDataEmpty){

            response.data.totalInfo.sum_totalGiftCnt = response.data.totalInfo.sum_normalGiftCnt + response.data.totalInfo.sum_guest_normalGiftCnt;
            response.data.totalInfo.sum_totalGiftCmt = response.data.totalInfo.sum_normalGiftCmt + response.data.totalInfo.sum_guest_normalGiftCmt;
            response.data.totalInfo.sum_totalGiftAmount = response.data.totalInfo.sum_normalGiftAmount + response.data.totalInfo.sum_guest_normalGiftAmount;
            response.data.totalInfo.sum_totalSecretGiftCnt = response.data.totalInfo.sum_secretGiftCnt + response.data.totalInfo.sum_guest_secretGiftCnt;
            response.data.totalInfo.sum_totalSecretGiftCmt = response.data.totalInfo.sum_secretGiftCmt + response.data.totalInfo.sum_guest_secretGiftCmt;
            response.data.totalInfo.sum_totalSecretGiftAmount = response.data.totalInfo.sum_secretGiftAmount + response.data.totalInfo.sum_guest_secretGiftAmount;

            var template = $('#tmp_giftDay').html();
            var templateScript = Handlebars.compile(template);
            var totalContext = response.data.totalInfo;
            var totalHtml = templateScript(totalContext);
            $("#giftDayListBody").append(totalHtml);

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

            response.data.detailList[i].totalGiftCnt = response.data.detailList[i].normalGiftCnt + response.data.detailList[i].guest_normalGiftCnt;
            response.data.detailList[i].totalGiftCmt = response.data.detailList[i].normalGiftCmt + response.data.detailList[i].guest_normalGiftCmt;
            response.data.detailList[i].totalGiftAmount = response.data.detailList[i].normalGiftAmount + response.data.detailList[i].guest_normalGiftAmount;
            response.data.detailList[i].totalSecretGiftCnt = response.data.detailList[i].secretGiftCnt + response.data.detailList[i].guest_secretGiftCnt;
            response.data.detailList[i].totalSecretGiftCmt = response.data.detailList[i].secretGiftCmt + response.data.detailList[i].guest_secretGiftCmt;
            response.data.detailList[i].totalSecretGiftAmount = response.data.detailList[i].secretGiftAmount + response.data.detailList[i].guest_secretGiftAmount;
        }

        var template = $('#tmp_giftDayDetailList').html();
        var templateScript = Handlebars.compile(template);
        var detailContext = response.data.detailList;
        var html=templateScript(detailContext);
        $("#giftDayListBody").append(html);

        if(isDataEmpty){
            $("#giftDayListBody td:last").remove();
        }else{
            $("#giftDayListBody").append(totalHtml);
        }

        ui.tableHeightSet();
        ui.paintColor();
    }

    function fn_platformDayList_success(dst_id, response) {
        dalbitLog(response);
        var isDataEmpty = response.data.detailList == null;
        $("#platformDayListBody").empty();
        if(!isDataEmpty){
            var template = $('#tmp_platformDay').html();
            var templateScript = Handlebars.compile(template);
            var totalContext = response.data.totalInfo;
            var totalHtml = templateScript(totalContext);
            $("#platformDayListBody").append(totalHtml);

            response.data.detailList.slctType = slctType;
        }

        for(var i=0;i<response.data.detailList.length;i++){
            response.data.detailList[i].nowMonth = Number(moment().format("MM"));
            response.data.detailList[i].nowDay = common.lpad(Number(moment().format("DD"),2,"0"));
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
            console.log(toDay);
            response.data.detailList[i].date = toDay;
        }

        var template = $('#tmp_platformDayDetailList').html();
        var templateScript = Handlebars.compile(template);
        var detailContext = response.data.detailList;
        var html=templateScript(detailContext);
        $("#platformDayListBody").append(html);

        if(isDataEmpty){
            $("#platformDayListBody td:last").remove();
        }else{
            $("#platformDayListBody").append(totalHtml);
        }

        ui.tableHeightSet();
        ui.paintColor();
    }

    function fn_typeDay_success(data, response){
        var isDataEmpty = response.data.detailList == null;
        var tableBody = $("#typeDayTableBody");

        tableBody.empty();
        if(!isDataEmpty){
            var template = $('#tmp_typeDay').html();
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

        var template = $('#tmp_typeDayDetailList').html();
        var templateScript = Handlebars.compile(template);
        var detailContext = response.data.detailList;
        var html=templateScript(detailContext);
        tableBody.append(html);

        if(isDataEmpty){
            $("#typeDayTableBody td:last").remove();
        }else{
            tableBody.append(totalHtml);
        }

        ui.tableHeightSet();
        ui.paintColor();
    }

</script>

<script type="text/x-handlebars-template" id="tmp_dayTotal">
    <tr class="font-bold _bgColor" data-bgColor="#d0cece">
        <td>총합</td>
        <td class="_fontColor" data-fontColor="blue">{{addComma total_create_mCnt}} ({{addComma total_unique_dj_mCnt}})</td>
        <td class="_fontColor" data-fontColor="red">{{addComma total_create_fCnt}} ({{addComma total_unique_dj_fCnt}})</td>
        <td>{{addComma total_create_nCnt}} ({{addComma total_unique_dj_nCnt}})</td>
        <td>{{addComma total_create_totalCnt}} ({{addComma total_unique_dj_Cnt}})</td>
        <td>{{addComma total_create_max_Cnt}}</td>
        <td style="text-align: right">{{timeStampDay total_airtime}}</td>
        <td class="_fontColor" data-fontColor="blue">{{addComma total_listener_mCnt}} ({{addComma total_unique_listener_mCnt}})</td>
        <td class="_fontColor" data-fontColor="red">{{addComma total_listener_fCnt}} ({{addComma total_unique_listener_fCnt}})</td>
        <td>{{addComma total_listener_nCnt}} ({{addComma total_unique_listener_nCnt}})</td>
        <td>{{addComma total_guest_totalCnt}} ({{addComma total_guest_UniqueCnt}})</td>
        <td>{{addComma total_listener_totalCnt}} ({{addComma total_unique_listener_Cnt}})</td>
        <td>{{addComma total_listener_max_Cnt}}</td>
        <td>{{addComma total_gift_Cnt}}</td>
        <td>{{addComma total_gift_Amt}}</td>
    </tr>
</script>

<script type="text/x-handlebars-template" id="tmp_dayDetailList">
    {{#each this as |data|}}
    <tr {{#dalbit_if nowDay '==' day}} class="font-bold _bgColor" data-bgColor="#fff2cc"  {{/dalbit_if}}>
        <td {{#dalbit_if nowDay '==' day}} class="font-bold _bgColor" data-bgColor="#fff2cc"  {{/dalbit_if}}
        {{#dalbit_if nowDay '!=' day}} class="font-bold _bgColor" data-bgColor="#d8e2f3"  {{/dalbit_if}}>
        {{{data.date}}}
        <td class="_fontColor" data-fontColor="blue">{{#dalbit_if create_mCnt '!=' 0}}{{addComma create_mCnt 'Y'}} ({{addComma unique_dj_mCnt}}){{/dalbit_if}}</td>
        <td class="_fontColor" data-fontColor="red">{{#dalbit_if create_fCnt '!=' 0}}{{addComma create_fCnt 'Y'}} ({{addComma unique_dj_fCnt}}){{/dalbit_if}}</td>
        <td>{{#dalbit_if create_nCnt '!=' 0}}{{addComma create_nCnt 'Y'}} ({{addComma unique_dj_nCnt}}){{/dalbit_if}}</td>
        <td {{#dalbit_if nowHour '!=' the_hr}} class="_bgColor" data-bgColor="#d0cece" {{/dalbit_if}}>{{#dalbit_if create_Cnt '!=' 0}}{{addComma create_Cnt 'Y'}} ({{addComma unique_dj_Cnt}}){{/dalbit_if}}</td>
        <td>{{addComma create_max_Cnt 'Y'}}</td>
        <td style="text-align: right">{{timeStampDay airtime}}</td>
        <td class="_fontColor" data-fontColor="blue">{{#dalbit_if listener_mCnt '!=' 0}}{{addComma listener_mCnt 'Y'}} ({{addComma unique_listener_mCnt}}){{/dalbit_if}}</td>
        <td class="_fontColor" data-fontColor="red">{{#dalbit_if listener_fCnt '!=' 0}}{{addComma listener_fCnt 'Y'}} ({{addComma unique_listener_fCnt}}){{/dalbit_if}}</td>
        <td>{{#dalbit_if listener_nCnt '!=' 0}}{{addComma listener_nCnt 'Y'}} ({{addComma unique_listener_nCnt}}){{/dalbit_if}}</td>
        <td>{{#dalbit_if guest_Cnt '!=' 0}}{{addComma guest_Cnt 'Y'}} ({{addComma guest_unique_Cnt}}){{/dalbit_if}}</td>
        <td {{#dalbit_if nowHour '!=' the_hr}} class="_bgColor" data-bgColor="#d0cece" {{/dalbit_if}}>{{#dalbit_if listener_Cnt '!=' 0}}{{addComma listener_Cnt 'Y'}} ({{addComma unique_listener_Cnt}}){{/dalbit_if}}</td>
        <td>{{addComma listener_max_Cnt 'Y'}}</td>
        <td>{{addComma gift_Cnt 'Y'}}</td>
        <td>{{addComma gift_Amt 'Y'}}</td>
    </tr>
    {{else}}
    <tr>
        <td colspan="20" class="noData">{{isEmptyData}}<td>
    </tr>
    {{/each}}
</script>


<script type="text/x-handlebars-template" id="tmp_giftDay">
    <tr class="font-bold _bgColor" data-bgColor="#d0cece">
        <td>총합</td>
        <td>{{addComma sum_normalGiftCnt}} ({{addComma sum_secretGiftCnt}})</td>
        <td>{{addComma sum_normalGiftAmount}} ({{addComma sum_secretGiftAmount}})</td>
        <td>{{addComma sum_guest_normalGiftCnt}} ({{addComma sum_guest_secretGiftCnt}})</td>
        <td>{{addComma sum_guest_normalGiftAmount}} ({{addComma sum_guest_secretGiftAmount}})</td>
        <td>{{addComma sum_totalGiftCnt}} ({{addComma sum_totalSecretGiftCnt}})</td>
        <td>{{addComma sum_totalGiftAmount}} ({{addComma sum_totalSecretGiftAmount}})</td>
    </tr>
</script>

<script type="text/x-handlebars-template" id="tmp_giftDayDetailList">
    {{#each this as |data|}}
    <tr {{#dalbit_if nowDay '==' day}} class="font-bold _bgColor" data-bgColor="#fff2cc"  {{/dalbit_if}}>
        <td {{#dalbit_if nowDay '==' day}} class="font-bold _bgColor" data-bgColor="#fff2cc"  {{/dalbit_if}}
        {{#dalbit_if nowDay '!=' day}} class="font-bold _bgColor" data-bgColor="#d8e2f3"  {{/dalbit_if}}>
        {{{data.date}}}
        </td>
        <td>
            {{#dalbit_if normalGiftCnt '!=' 0}}
                {{#dalbit_if secretGiftCnt '!=' 0}}
                    {{addComma normalGiftCnt}} ({{addComma secretGiftCnt}})
                {{else}}
                    {{addComma normalGiftCnt}} (0)
                {{/dalbit_if}}
            {{else}}
                {{#dalbit_if secretGiftCnt '!=' 0}}
                    0 ({{addComma secretGiftCnt}})
                {{/dalbit_if}}
            {{/dalbit_if}}
        </td>
        <td>
            {{#dalbit_if normalGiftAmount '!=' 0}}
                {{#dalbit_if secretGiftAmount '!=' 0}}
                    {{addComma normalGiftAmount}} ({{addComma secretGiftAmount}})
                {{else}}
                    {{addComma normalGiftAmount}} (0)
                {{/dalbit_if}}
            {{else}}
                {{#dalbit_if secretGiftAmount '!=' 0}}
                    0 ({{addComma secretGiftAmount}})
                {{/dalbit_if}}
            {{/dalbit_if}}
        </td>
        <td>
            {{#dalbit_if guest_normalGiftCnt '!=' 0}}
                {{#dalbit_if guest_secretGiftCnt '!=' 0}}
                    {{addComma guest_normalGiftCnt}} ({{addComma guest_secretGiftCnt}})
                {{else}}
                    {{addComma guest_normalGiftCnt}} (0)
                {{/dalbit_if}}
            {{else}}
                {{#dalbit_if guest_secretGiftCnt '!=' 0}}
                    0 ({{addComma guest_secretGiftCnt}})
                {{/dalbit_if}}
            {{/dalbit_if}}

        </td>
        <td>
            {{#dalbit_if guest_normalGiftAmount '!=' 0}}
                {{#dalbit_if guest_secretGiftAmount '!=' 0}}
                    {{addComma guest_normalGiftAmount}} ({{addComma guest_secretGiftAmount}})
                {{else}}
                    {{addComma guest_normalGiftAmount}} (0)
                {{/dalbit_if}}
            {{else}}
                {{#dalbit_if guest_secretGiftAmount '!=' 0}}
                    0 ({{addComma guest_secretGiftAmount}})
                {{/dalbit_if}}
            {{/dalbit_if}}
        </td>
        <td>
            {{#dalbit_if totalGiftCnt '!=' 0}}
                {{#dalbit_if totalSecretGiftCnt '!=' 0}}
                    {{addComma totalGiftCnt}} ({{addComma totalSecretGiftCnt}})
                {{else}}
                    {{addComma totalGiftCnt}} (0)
                {{/dalbit_if}}
            {{else}}
                {{#dalbit_if totalSecretGiftCnt '!=' 0}}
                    0 ({{addComma totalSecretGiftCnt}})
                {{/dalbit_if}}
            {{/dalbit_if}}
        </td>
        <td>
            {{#dalbit_if totalGiftAmount '!=' 0}}
                {{#dalbit_if totalSecretGiftAmount '!=' 0}}
                    {{addComma totalGiftAmount}} ({{addComma totalSecretGiftAmount}})
                {{else}}
                    {{addComma totalGiftAmount}} (0)
                {{/dalbit_if}}
            {{else}}
                {{#dalbit_if totalSecretGiftAmount '!=' 0}}
                    0 ({{addComma totalSecretGiftAmount}})
                {{/dalbit_if}}
            {{/dalbit_if}}
        </td>
    </tr>
    {{else}}
    <tr>
        <td colspan="22" class="noData">{{isEmptyData}}<td>
    </tr>
    {{/each}}
</script>


<script type="text/x-handlebars-template" id="tmp_platformDay">
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

<script type="text/x-handlebars-template" id="tmp_platformDayDetailList">
    {{#each this as |data|}}
    <tr {{#dalbit_if nowDay '==' day}} class="font-bold _bgColor" data-bgColor="#fff2cc"  {{/dalbit_if}}>
        <td {{#dalbit_if nowDay '==' day}} class="font-bold _bgColor" data-bgColor="#fff2cc"  {{/dalbit_if}}
        {{#dalbit_if nowDay '!=' day}} class="font-bold _bgColor" data-bgColor="#d8e2f3"  {{/dalbit_if}}>
        {{{data.date}}}
        </td>
        <td>{{addComma pcCnt 'Y'}}</td>
        <td>{{addComma androidCnt 'Y'}}</td>
        <td>{{addComma iosCnt 'Y'}}</td>
        <td {{#dalbit_if nowDay '!=' day}} class="_bgColor" data-bgColor="#d0cece" {{/dalbit_if}}>{{#dalbit_if totalCreateCnt '!=' 0}}{{addComma totalCreateCnt}} ({{addComma unique_dj_Cnt}}){{/dalbit_if}}</td>
        <td style="text-align: right">{{timeStampDay pcTime}}</td>
        <td style="text-align: right">{{timeStampDay androidTime}}</td>
        <td style="text-align: right">{{timeStampDay iosTime}}</td>
        <td style="text-align: right" {{#dalbit_if nowDay '!=' day}} class="_bgColor" data-bgColor="#d0cece" {{/dalbit_if}}>{{timeStampDay totalBroadcastingTime}}</td>
    </tr>
    {{/each}}
</script>


<script type="text/x-handlebars-template" id="tmp_typeDay">
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

<script type="text/x-handlebars-template" id="tmp_typeDayDetailList">
    {{#each this as |data|}}
    <tr {{#dalbit_if nowDay '==' day}} class="font-bold _bgColor" data-bgColor="#fff2cc"  {{/dalbit_if}}>
        <td {{#dalbit_if nowDay '==' day}} class="font-bold _bgColor" data-bgColor="#fff2cc"  {{/dalbit_if}}
        {{#dalbit_if nowDay '!=' day}} class="font-bold _bgColor" data-bgColor="#d8e2f3"  {{/dalbit_if}}>
        {{{data.date}}}
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
        <td {{#dalbit_if nowDay '!=' day}} class="_bgColor" data-bgColor="#d0cece" {{/dalbit_if}}>{{#dalbit_if totalCreateCnt '!=' 0}}{{addComma totalCreateCnt 'Y'}} ({{addComma unique_dj_Cnt}}){{/dalbit_if}}</td>
    </tr>
    {{else}}
    <tr>
        <td colspan="11" class="noData">{{isEmptyData}}<td>
    </tr>
    {{/each}}
</script>