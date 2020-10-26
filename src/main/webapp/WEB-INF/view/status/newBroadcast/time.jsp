<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 방송현황 > 시간대별 -->
<span class="_searchDate font-bold"></span>
<span class="" style="font-size: 11px;color: red;">* 총 수치(비중복 수치)로 표기된 현황입니다.</span>
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
                    <th rowspan="2" class="_bgColor" data-bgColor="#b4c7e7">구분</th>
                    <th colspan="5" class="_bgColor" data-bgColor="#b4c7e7">DJ (방송개설)</th>
                    <th rowspan="2" class="_bgColor" data-bgColor="#b4c7e7">방송시간</th>
                    <th colspan="5" class="_bgColor" data-bgColor="#b4c7e7">게스트</th>
                    <th colspan="5" class="_bgColor" data-bgColor="#b4c7e7">청취자</th>
                </tr>
                <tr>
                    <th class="_bgColor _sex_male" data-bgColor="#e9ebf5"></th>
                    <th class="_bgColor _sex_female" data-bgColor="#e9ebf5"></th>
                    <th class="_bgColor _sex_none" data-bgColor="#e9ebf5"></th>
                    <th class="_bgColor" data-bgColor="#bfbfbf">소계</th>
                    <th class="_bgColor" data-bgColor="#e9ebf5">최대 개설 수</th>
                    <th class="_bgColor _sex_male" data-bgColor="#e9ebf5"></th>
                    <th class="_bgColor _sex_female" data-bgColor="#e9ebf5"></th>
                    <th class="_bgColor _sex_none" data-bgColor="#e9ebf5"></th>
                    <th class="_bgColor" data-bgColor="#bfbfbf">소계</th>
                    <th class="_bgColor" data-bgColor="#e9ebf5">최대 게스트 수</th>
                    <th class="_bgColor _sex_male" data-bgColor="#e9ebf5"></th>
                    <th class="_bgColor _sex_female" data-bgColor="#e9ebf5"></th>
                    <th class="_bgColor _sex_none" data-bgColor="#e9ebf5"></th>
                    <th class="_bgColor" data-bgColor="#bfbfbf">소계</th>
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
                    <col width="5.2%"/><col width="5.2%"/><col width="5.2%"/><col width="5.2%"/><col width="5.2%"/>
                    <col width="5.2%"/><col width="5.2%"/><col width="5.2%"/><col width="5.2%"/><col width="5.2%"/>
                    <col width="5.2%"/><col width="5.2%"/><col width="5.2%"/><col width="5.2%"/><col width="5.2%"/>
                    <col width="5.2%"/><col width="5.2%"/><col width="5.2%"/><col width="5.2%"/>
                </colgroup>
                <thead>
                <tr>
                    <th rowspan="3" class="_bgColor" data-bgColor="#b4c7e7">구분</th>
                    <th colspan="6" class="_bgColor" data-bgColor="#b4c7e7">DJ</th>
                    <th colspan="6" class="_bgColor" data-bgColor="#f8cbad">게스트</th>
                    <th colspan="6" class="_bgColor _fontColor" data-bgColor="#000000" data-fontcolor="#ffc000" id="giftTotalCnt">총 합</th>
                </tr>
                <tr>
                    <th colspan="3" class="_bgColor" data-bgColor="#dae3f3">일반</th>
                    <th colspan="3" class="_bgColor" data-bgColor="#dae3f3">비밀</th>
                    <th colspan="3" class="_bgColor" data-bgColor="#fbe5d6">일반</th>
                    <th colspan="3" class="_bgColor" data-bgColor="#fbe5d6">비밀</th>
                    <th colspan="3" class="_bgColor" data-bgColor="#f2f2f2">일반</th>
                    <th colspan="3" class="_bgColor" data-bgColor="#f2f2f2">비밀</th>
                </tr>
                <tr>
                    <th class="_bgColor" data-bgColor="#dae3f3">건 수</th>
                    <th class="_bgColor" data-bgColor="#dae3f3">수량</th>
                    <th class="_bgColor" data-bgColor="#dae3f3">달 수</th>
                    <th class="_bgColor" data-bgColor="#dae3f3">건 수</th>
                    <th class="_bgColor" data-bgColor="#dae3f3">수량</th>
                    <th class="_bgColor" data-bgColor="#dae3f3">달 수</th>
                    <th class="_bgColor" data-bgColor="#fbe5d6">건 수</th>
                    <th class="_bgColor" data-bgColor="#fbe5d6">수량</th>
                    <th class="_bgColor" data-bgColor="#fbe5d6">달 수</th>
                    <th class="_bgColor" data-bgColor="#fbe5d6">건 수</th>
                    <th class="_bgColor" data-bgColor="#fbe5d6">수량</th>
                    <th class="_bgColor" data-bgColor="#fbe5d6">달 수</th>
                    <th class="_bgColor" data-bgColor="#f2f2f2">건 수</th>
                    <th class="_bgColor" data-bgColor="#f2f2f2">수량</th>
                    <th class="_bgColor" data-bgColor="#f2f2f2">달 수</th>
                    <th class="_bgColor" data-bgColor="#f2f2f2">건 수</th>
                    <th class="_bgColor" data-bgColor="#f2f2f2">수량</th>
                    <th class="_bgColor" data-bgColor="#f2f2f2">달 수</th>
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

    function fn_broadcastGift_success(dst_id, response) {
        dalbitLog(response);
        var isDataEmpty = response.data.detailList == null;
        $("#giftListBody").empty();
        if(!isDataEmpty){

            response.data.totalInfo.sum_totalGiftCnt = response.data.totalInfo.sum_normalGiftCnt + response.data.totalInfo.sum_guest_normalGiftCnt;
            response.data.totalInfo.sum_totalGiftCmt = response.data.totalInfo.sum_normalGiftCmt + response.data.totalInfo.sum_guest_normalGiftCmt;
            response.data.totalInfo.sum_totalGiftAmount = response.data.totalInfo.sum_normalGiftAmount + response.data.totalInfo.sum_guest_normalGiftAmount;
            response.data.totalInfo.sum_totalSecretGiftCnt = response.data.totalInfo.sum_secretGiftCnt + response.data.totalInfo.sum_guest_secretGiftCnt;
            response.data.totalInfo.sum_totalSecretGiftCmt = response.data.totalInfo.sum_secretGiftCmt + response.data.totalInfo.sum_guest_secretGiftCmt;
            response.data.totalInfo.sum_totalSecretGiftAmount = response.data.totalInfo.sum_secretGiftAmount + response.data.totalInfo.sum_guest_secretGiftAmount;

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

            response.data.detailList[i].totalGiftCnt = response.data.detailList[i].normalGiftCnt + response.data.detailList[i].guest_normalGiftCnt;
            response.data.detailList[i].totalGiftCmt = response.data.detailList[i].normalGiftCmt + response.data.detailList[i].guest_normalGiftCmt;
            response.data.detailList[i].totalGiftAmount = response.data.detailList[i].normalGiftAmount + response.data.detailList[i].guest_normalGiftAmount;
            response.data.detailList[i].totalSecretGiftCnt = response.data.detailList[i].secretGiftCnt + response.data.detailList[i].guest_secretGiftCnt;
            response.data.detailList[i].totalSecretGiftCmt = response.data.detailList[i].secretGiftCmt + response.data.detailList[i].guest_secretGiftCmt;
            response.data.detailList[i].totalSecretGiftAmount = response.data.detailList[i].secretGiftAmount + response.data.detailList[i].guest_secretGiftAmount;
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
        <td class="_fontColor" data-fontColor="blue">{{addComma total_create_mCnt}} ({{addComma total_unique_dj_mCnt}})</td>
        <td class="_fontColor" data-fontColor="red">{{addComma total_create_fCnt}} ({{addComma total_unique_dj_fCnt}})</td>
        <td>{{addComma total_create_nCnt}} ({{addComma total_unique_dj_nCnt}})</td>
        <td>{{addComma total_create_totalCnt}} ({{addComma total_unique_dj_Cnt}})</td>
        <td>{{addComma total_create_max_Cnt}}</td>
        <td style="text-align: right">{{timeStampDay total_airtime}}</td>
        <td class="_fontColor" data-fontColor="blue">{{addComma total_guest_mCnt}} ({{addComma total_guest_unique_mCnt}})</td>
        <td class="_fontColor" data-fontColor="red">{{addComma total_guest_fCnt}} ({{addComma total_guest_unique_fCnt}})</td>
        <td>{{addComma total_guest_nCnt}} ({{addComma total_guest_unique_nCnt}})</td>
        <td>{{addComma total_guest_totalCnt}} ({{addComma total_guest_UniqueCnt}})</td>
        <td>{{addComma total_guest_max_Cnt}}</td>
        <td class="_fontColor" data-fontColor="blue">{{addComma total_listener_mCnt}} ({{addComma total_unique_listener_mCnt}})</td>
        <td class="_fontColor" data-fontColor="red">{{addComma total_listener_fCnt}} ({{addComma total_unique_listener_fCnt}})</td>
        <td>{{addComma total_listener_nCnt}} ({{addComma total_unique_listener_nCnt}})</td>
        <td>{{addComma total_listener_totalCnt}} ({{addComma total_unique_listener_Cnt}})</td>
        <td>{{addComma total_listener_max_Cnt}}</td>
    </tr>
</script>

<script type="text/x-handlebars-template" id="tmp_timeDetailList">
    {{#each this as |data|}}
    <tr {{#dalbit_if nowHour '==' the_hr}} class="font-bold _bgColor" data-bgColor="#fff2cc"  {{/dalbit_if}}>
        <td {{#dalbit_if nowHour '==' the_hr}} class="font-bold _bgColor" data-bgColor="#fff2cc"  {{/dalbit_if}}
        {{#dalbit_if nowHour '!=' the_hr}} class="font-bold _bgColor" data-bgColor="#d8e2f3"  {{/dalbit_if}}>
        {{data.the_hr}}시
        </td>
        <td class="_fontColor" data-fontColor="blue">{{#dalbit_if create_mCnt '!=' 0}}{{addComma create_mCnt 'Y'}} ({{addComma unique_dj_mCnt}}){{/dalbit_if}}</td>
        <td class="_fontColor" data-fontColor="red">{{#dalbit_if create_fCnt '!=' 0}}{{addComma create_fCnt 'Y'}} ({{addComma unique_dj_fCnt}}){{/dalbit_if}}</td>
        <td>{{#dalbit_if create_nCnt '!=' 0}}{{addComma create_nCnt 'Y'}} ({{addComma unique_dj_nCnt}}){{/dalbit_if}}</td>
        <td {{#dalbit_if nowHour '!=' the_hr}} class="_bgColor" data-bgColor="#d0cece" {{/dalbit_if}}>{{#dalbit_if create_totalCnt '!=' 0}}{{addComma create_totalCnt 'Y'}} ({{addComma unique_dj_Cnt}}){{/dalbit_if}}</td>
        <td>{{addComma create_max_Cnt 'Y'}}</td>
        <td style="text-align: right">{{timeStampDay airtime}}</td>
        <td class="_fontColor" data-fontColor="blue">{{#dalbit_if guest_mCnt '!=' 0}}{{addComma guest_mCnt 'Y'}} ({{addComma guest_unique_mCnt}}){{/dalbit_if}}</td>
        <td class="_fontColor" data-fontColor="red">{{#dalbit_if guest_fCnt '!=' 0}}{{addComma guest_fCnt 'Y'}} ({{addComma guest_unique_fCnt}}){{/dalbit_if}}</td>
        <td>{{#dalbit_if guest_nCnt '!=' 0}}{{addComma guest_nCnt 'Y'}} ({{addComma guest_unique_nCnt}}){{/dalbit_if}}</td>
        <td {{#dalbit_if nowHour '!=' the_hr}} class="_bgColor" data-bgColor="#d0cece" {{/dalbit_if}}>{{#dalbit_if guest_Cnt '!=' 0}}{{addComma guest_Cnt 'Y'}} ({{addComma guest_unique_Cnt}}){{/dalbit_if}}</td>
        <td>{{addComma guest_max_Cnt 'Y'}}</td>
        <td class="_fontColor" data-fontColor="blue">{{#dalbit_if listener_mCnt '!=' 0}}{{addComma listener_mCnt 'Y'}} ({{addComma unique_listener_mCnt}}){{/dalbit_if}}</td>
        <td class="_fontColor" data-fontColor="red">{{#dalbit_if listener_fCnt '!=' 0}}{{addComma listener_fCnt 'Y'}} ({{addComma unique_listener_fCnt}}){{/dalbit_if}}</td>
        <td>{{#dalbit_if listener_nCnt '!=' 0}}{{addComma listener_nCnt 'Y'}} ({{addComma unique_listener_nCnt}}){{/dalbit_if}}</td>
        <td {{#dalbit_if nowHour '!=' the_hr}} class="_bgColor" data-bgColor="#d0cece" {{/dalbit_if}}>{{#dalbit_if listener_totalCnt '!=' 0}}{{addComma listener_totalCnt 'Y'}} ({{addComma unique_listener_Cnt}}){{/dalbit_if}}</td>
        <td>{{addComma listener_max_Cnt 'Y'}}</td>
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
        <td>{{addComma sum_normalGiftCnt 'Y'}}</td>
        <td>{{addComma sum_normalGiftCmt 'Y'}}</td>
        <td>{{addComma sum_normalGiftAmount 'Y'}}</td>
        <td>{{addComma sum_secretGiftCnt 'Y'}}</td>
        <td>{{addComma sum_secretGiftCmt 'Y'}}</td>
        <td>{{addComma sum_secretGiftAmount 'Y'}}</td>
        <td>{{addComma sum_guest_normalGiftCnt 'Y'}}</td>
        <td>{{addComma sum_guest_normalGiftCmt 'Y'}}</td>
        <td>{{addComma sum_guest_normalGiftAmount 'Y'}}</td>
        <td>{{addComma sum_guest_secretGiftCnt 'Y'}}</td>
        <td>{{addComma sum_guest_secretGiftCmt 'Y'}}</td>
        <td>{{addComma sum_guest_secretGiftAmount 'Y'}}</td>
        <td>{{addComma sum_totalGiftCnt 'Y'}}</td>
        <td>{{addComma sum_totalGiftCmt 'Y'}}</td>
        <td>{{addComma sum_totalGiftAmount 'Y'}}</td>
        <td>{{addComma sum_totalSecretGiftCnt 'Y'}}</td>
        <td>{{addComma sum_totalSecretGiftCmt 'Y'}}</td>
        <td>{{addComma sum_totalSecretGiftAmount 'Y'}}</td>
    </tr>
</script>

<script type="text/x-handlebars-template" id="tmp_giftDetailList">
    {{#each this as |data|}}
    <tr {{#dalbit_if nowHour '==' hour}} class="font-bold _bgColor" data-bgColor="#fff2cc"  {{/dalbit_if}}>
        <td {{#dalbit_if nowHour '==' hour}} class="font-bold _bgColor" data-bgColor="#fff2cc"  {{/dalbit_if}}
        {{#dalbit_if nowHour '!=' hour}} class="font-bold _bgColor" data-bgColor="#d8e2f3"  {{/dalbit_if}}>
        {{data.hour}}시
        </td>
        <td>{{addComma normalGiftCnt 'Y'}}</td>
        <td>{{addComma normalGiftCmt 'Y'}}</td>
        <td>{{addComma normalGiftAmount 'Y'}}</td>
        <td>{{addComma secretGiftCnt 'Y'}}</td>
        <td>{{addComma secretGiftCmt 'Y'}}</td>
        <td>{{addComma secretGiftAmount 'Y'}}</td>
        <td>{{addComma guest_normalGiftCnt 'Y'}}</td>
        <td>{{addComma guest_normalGiftCmt 'Y'}}</td>
        <td>{{addComma guest_normalGiftAmount 'Y'}}</td>
        <td>{{addComma guest_secretGiftCnt 'Y'}}</td>
        <td>{{addComma guest_secretGiftCmt 'Y'}}</td>
        <td>{{addComma guest_secretGiftAmount 'Y'}}</td>
        <td>{{addComma totalGiftCnt 'Y'}}</td>
        <td>{{addComma totalGiftCmt 'Y'}}</td>
        <td>{{addComma totalGiftAmount 'Y'}}</td>
        <td>{{addComma totalSecretGiftCnt 'Y'}}</td>
        <td>{{addComma totalSecretGiftCmt 'Y'}}</td>
        <td>{{addComma totalSecretGiftAmount 'Y'}}</td>
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
        <td {{#dalbit_if nowHour '!=' hour}} class="_bgColor" data-bgColor="#d0cece" {{/dalbit_if}}>{{#dalbit_if totalCreateCnt '!=' 0}}{{addComma totalCreateCnt}} ({{addComma unique_dj_Cnt}}){{/dalbit_if}}</td>
        <td style="text-align: right">{{timeStampDay pcTime}}</td>
        <td style="text-align: right">{{timeStampDay androidTime}}</td>
        <td style="text-align: right">{{timeStampDay iosTime}}</td>
        <td style="text-align: right" {{#dalbit_if nowHour '!=' hour}} class="_bgColor" data-bgColor="#d0cece" {{/dalbit_if}}>{{timeStampDay totalBroadcastingTime}}</td>
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
        <td {{#dalbit_if nowHour '!=' hour}} class="_bgColor" data-bgColor="#d0cece" {{/dalbit_if}}>{{#dalbit_if totalCreateCnt '!=' 0}}{{addComma totalCreateCnt 'Y'}} ({{addComma unique_dj_Cnt}}){{/dalbit_if}}</td>
    </tr>
    {{else}}
    <tr>
        <td colspan="11" class="noData">{{isEmptyData}}<td>
    </tr>
    {{/each}}
</script>