<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<ul class="nav nav-tabs nav-tabs-custom-colored mt5">
    <li class="active" id="li_broadGift"><a href="#gift_main_table" role="tab" data-toggle="tab" onclick="memberGiftList('broadGift');">방송중선물</a></li>
    <li  id="li_chargeGift"><a href="#gift_main_table" role="tab" data-toggle="tab" onclick="memberGiftList('chargeGift');">충전선물</a></li>
    <%--<li><a href="#gift_main_table" role="tab" data-toggle="tab" onclick="memberGiftList('exchangeGift');">교환아이템</a></li>--%>

</ul>
<div class="tab-content no-padding">
    <div class="widget widget-table" id="gift_main_table">
        <div class="widget-content">
            <label id="giftTitle">ㆍ회원이 보내고 받은 선물 내역과 달에서 별로 교환한 정보를 확인할 수 있습니다.<br>ㆍ이벤트에 당첨되어 받은 선물은 "받은선물-이벤트"로 부분되어 이벤트 당첨 - 당첨선물</label>
            <span id="table_summaryArea"></span>
            <table id="gift_info_detail" class="table table-sorting table-hover table-bordered datatable">
                <thead id="tableTop_detail">
                </thead>
                <tbody id="tableBody_detail">
                </tbody>
            </table>
        </div>
    </div>
</div>
<script>
    $(document).ready(function() {
    });

    var giftList_gubun="broadGift";
    var slctType = -1;
    var slctItem = -1;
    var slctDate = -1;
    function memberGiftList(tmp){
        slctType = -1;
        slctItem = -1;
        slctDate = -1;
        giftList_gubun = tmp;
        var dtList_info_detail_data = function (data) {
            data.mem_no = memNo;
            data.slctType = slctType;
            data.slctItem = slctItem;
            data.slctDate = slctDate;
        };
        var tmp_summary;
        dtList_info_detail.destroy();
        if(giftList_gubun == "broadGift" ){
            $("#giftTitle").html("ㆍ회원이 보내고 받은 선물 내역과 달에서 별로 교환한 정보를 확인할 수 있습니다.<br>" +
                                 "ㆍ이벤트에 당첨되어 받은 선물은 \"받은선물-이벤트\"로 부분되어 이벤트 당첨 - 당첨선물");
            dtList_info_detail = new DalbitDataTable($("#gift_info_detail"), dtList_info_detail_data, MemberDataTableSource.giftDetail);
            tmp_summary = gift_summary_table;
        }else if(giftList_gubun == "chargeGift"){
            $("#giftTitle").html("ㆍ회원이 보내고, 받은 달의 선물 내역과 운영자가 충전한 달과 별을 확인할 수 있는 정보페이지 입니다.<br>" +
                                 "ㆍ테스트 및 오류처리를 위해 운영자는 회원상세 정보 페이지에서 달과 별을 충전할 수 있습니다.");
            dtList_info_detail = new DalbitDataTable($("#gift_info_detail"), dtList_info_detail_data, MemberDataTableSource.chargeDetail);
            tmp_summary = charge_summary_table;
        }else if(giftList_gubun == "exchangeGift"){
            $("#giftTitle").html("ㆍ회원이 교환한 아이템 내역을 확인할 수 있습니다.<br>" +
                                 "ㆍ교환은 별에서 달로만 교환이 가능합니다.");
            dtList_info_detail = new DalbitDataTable($("#gift_info_detail"), dtList_info_detail_data, MemberDataTableSource.exchangeDetail);
            tmp_summary = exchange_summary_table;
        }
        dtList_info_detail.useCheckBox(false);
        dtList_info_detail.useIndex(true);
        dtList_info_detail.setPageLength(50);
        dtList_info_detail.createDataTable(tmp_summary);

        initDataTableTop_select_gift();
    }

    function gift_summary_table(json){
        dalbitLog(json);
        var template = $("#gift_tableSummary").html();
        var templateScript = Handlebars.compile(template);
        var data = {
            header : mem_total_gift_summary
            , content : json.summary
            , length : json.recordsTotal
        };
        var html = templateScript(data);
        $("#table_summaryArea").html(html);
    }

    function charge_summary_table(json){
        dalbitLog(json);
        var template = $("#charge_tableSummary").html();
        var templateScript = Handlebars.compile(template);
        var data = {
            header : mem_gift_summary
            , content : json.summary
            , length : json.recordsTotal
        };
        var html = templateScript(data);
        $("#table_summaryArea").html(html);
    }

    function exchange_summary_table(json){
        dalbitLog(json);
        var template = $("#exchange_tableSummary").html();
        var templateScript = Handlebars.compile(template);
        var data = {
            header : mem_received_summary
            , content : json.summary
            , length : json.recordsTotal
        };
        var html = templateScript(data);
        $("#table_summaryArea").html(html);
    }

    function initDataTableTop_select_gift(){
        var topTable = "";

        if(giftList_gubun == "broadGift" ){
            topTable = '<span name="search_gift_top" id="search_gift_top" onchange="gift_sel_change()"></span>';
            topTable = topTable + '<span name="radio_gift_date" id="radio_gift_date" style="padding-left: 10px;" onchange="gift_sel_change()"></span>';
        }else if(giftList_gubun == "chargeGift"){
            topTable = '<span name="search_gift_top" id="search_gift_top" onchange="gift_sel_change()"></span>';
            topTable = topTable + '<span name="search_gift_dalbyeol_top" id="search_gift_dalbyeol_top" onchange="gift_sel_change()"></span>';
            topTable = topTable + '<span name="radio_gift_date" id="radio_gift_date" style="padding-left: 10px;" onchange="gift_sel_change()"></span>';
        }else if(giftList_gubun == "exchangeGift"){
            topTable = '<span name="radio_gift_date" id="radio_gift_date" style="padding-left: 10px;" onchange="gift_sel_change()"></span>';
        }
        $("#gift_main_table").find(".top-left").addClass("no-padding").append(topTable);

        $("#search_gift_top").html(util.getCommonCodeSelect(-1, gift));
        $("#search_gift_dalbyeol_top").html(util.getCommonCodeSelect(-1, gift_dalbyeol));
        $("#radio_gift_date").html(util.getCommonCodeRadio(-1, gift_date));

    }
    function gift_sel_change(){
        slctType = $("#search_gift_top").find("#gift option:selected").val();
        slctItem = $("#search_gift_dalbyeol_top").find("#gift_dalbyeol option:selected").val();
        slctDate = $('input[name="gift_date"]:checked').val();

        console.log(slctType);
        console.log(slctItem);
        console.log(slctDate);


        if(giftList_gubun == "broadGift" ){
            dtList_info_detail.reload(gift_summary_table);
        }else if(giftList_gubun == "chargeGift"){
            dtList_info_detail.reload(charge_summary_table);
        }else if(giftList_gubun == "exchangeGift"){
            dtList_info_detail.reload(exchange_summary_table);
        }
    }
</script>


<script id="gift_tableSummary" type="text/x-handlebars-template">
    <table class="table table-bordered table-summary pull-right" style="margin-right: 0px;">
        <thead>
        <tr>
            {{#each this.header}}
            <th>{{this.code}}</th>
            {{/each}}
        </tr>
        </thead>
        <tbody>
            <td>{{#equal length '0'}}0{{/equal}}{{content.allGiftItemCnt}}건</td>
            <td>{{#equal length '0'}}0{{/equal}}{{content.allGiftDalCnt}}건</td>
            <td>{{#equal length '0'}}0{{/equal}}{{content.allReceivedItemCnt}}건</td>
            <td>{{#equal length '0'}}0{{/equal}}{{content.allReceivedDalCnt}}건</td>
        </tbody>
    </table>
</script>

<script id="charge_tableSummary" type="text/x-handlebars-template">
    <table class="table table-bordered table-summary pull-right" style="margin-right: 0px;">
        <thead>
        <tr>
            {{#each this.header}}
            <th>{{this.code}}</th>
            {{/each}}
        </tr>
        </thead>
        <tbody>
            <td>{{content.allDalGiftCnt}}건</td>
            <td>{{content.allDalReceivedCnt}}건</td>
            <td>{{content.allByeolReceivedCnt}}건</td>
            <%--<td>{{#equal length '0'}}0{{/equal}}{{content.chargeDal}}건</td>--%>
            <%--<td>{{#equal length '0'}}0{{/equal}}{{content.chargeDal}}건</td>--%>
        </tbody>
    </table>
</script>

<script id="exchange_tableSummary" type="text/x-handlebars-template">
    <table class="table table-bordered table-summary pull-right" style="margin-right: 0px;">
        <thead>
        <tr>
            <th rowspan="2">누적 교환 수</th>
            <th colspan="7">각 교환 이용수</th>
        </tr>
        <tr>
            {{#each this.header}}
            <th>{{this.code}}</th>
            {{/each}}
        </tr>
        </thead>
        <tbody>
            <td>{{#equal length '0'}}0{{/equal}}{{content.giftCnt}}건</td>
            <td>{{#equal length '0'}}0{{/equal}}{{content.dalCnt}}건</td>
            <td>{{#equal length '0'}}0{{/equal}}{{content.dalCnt}}건</td>
            <td>{{#equal length '0'}}0{{/equal}}{{content.dalCnt}}건</td>
            <td>{{#equal length '0'}}0{{/equal}}{{content.dalCnt}}건</td>
            <td>{{#equal length '0'}}0{{/equal}}{{content.dalCnt}}건</td>
            <td>{{#equal length '0'}}0{{/equal}}{{content.dalCnt}}건</td>
            <td>{{#equal length '0'}}0{{/equal}}{{content.dalCnt}}건</td>
        </tbody>
    </table>
</script>