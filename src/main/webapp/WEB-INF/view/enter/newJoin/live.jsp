<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 로그인 > 총계 -->
<div class="widget widget-table mb10">
    <div class="widget-content mt10">
        <span class="_searchDate"></span>

        <table class="table table-bordered _tableHeight" data-height="23px">
            <colgroup>
                <col width="2.3%"/><col width="1.0%"/><col width="1.0%"/><col width="1.0%"/><col width="1.0%"/>
                <col width="1.0%"/><col width="1.0%"/><col width="1.0%"/><col width="1.0%"/><col width="1.0%"/>
                <col width="1.0%"/><col width="1.0%"/><col width="1.0%"/><col width="1.0%"/><col width="1.0%"/>
                <col width="1.0%"/><col width="1.0%"/><col width="1.0%"/><col width="1.0%"/><col width="1.0%"/>
                <col width="1.0%"/><col width="1.0%"/><col width="1.0%"/><col width="1.0%"/><col width="1.0%"/>
                <col width="1.0%"/><col width="1.0%"/><col width="1.0%"/><col width="1.0%"/><col width="1.0%"/>
                <col width="1.0%"/><col width="1.0%"/><col width="1.0%"/><col width="1.0%"/><col width="1.0%"/>
                <col width="1.0%"/><col width="1.0%"/><col width="1.0%"/><col width="1.0%"/><col width="1.0%"/>
                <col width="1.0%"/><col width="1.0%"/><col width="1.0%"/><col width="1.0%"/><col width="1.0%"/>
                <col width="1.0%"/><col width="1.0%"/><col width="1.0%"/><col width="1.0%"/><col width="1.0%"/>
                <col width="1.0%"/><col width="1.0%"/><col width="1.0%"/><col width="1.0%"/><col width="1.0%"/>
                <col width="1.0%"/><col width="1.0%"/><col width="1.0%"/><col width="1.0%"/><col width="1.0%"/>
                <col width="1.0%"/><col width="1.0%"/><col width="1.0%"/><col width="1.0%"/><col width="1.0%"/>
                <col width="1.0%"/><col width="1.0%"/><col width="1.0%"/><col width="1.0%"/><col width="1.0%"/>
                <col width="1.0%"/><col width="1.0%"/><col width="1.0%"/>
            </colgroup>
            <thead>
            <tr>
                <th rowspan="4" class="_bgColor _fontColor" data-bgColor="#4472c4" data-fontColor="#ffffff">구분</th>
                <th id="live_th_1" colspan="36" class="_bgColor _fontColor" data-bgColor="#4472c4" data-fontColor="#ffffff">하루전</th>
                <th id="live_th_0" colspan="36" class="_bgColor _fontColor" data-bgColor="#bf9000" data-fontColor="#ffffff">오늘</th>
            </tr>
            <tr>
                <th colspan="12" class="_sex_male _bgColor" data-bgColor="#b4c7e7"></th>
                <th colspan="12" class="_sex_female _bgColor" data-bgColor="#b4c7e7"></th>
                <th colspan="12" class="_sex_none _bgColor" data-bgColor="#b4c7e7"></th>
                <th colspan="12" class="_sex_male _bgColor" data-bgColor="#ffd966"></th>
                <th colspan="12" class="_sex_female _bgColor" data-bgColor="#ffd966"></th>
                <th colspan="12" class="_sex_none _bgColor" data-bgColor="#ffd966"></th>
            </tr>
            <tr>
                <th colspan="2" class="_bgColor" data-bgColor="#e9ebf5">전화</th>
                <th colspan="2" class="_bgColor" data-bgColor="#e9ebf5">카카오</th>
                <th colspan="2" class="_bgColor" data-bgColor="#e9ebf5">네이버</th>
                <th colspan="2" class="_bgColor" data-bgColor="#e9ebf5">페이<br/>스북</th>
                <th colspan="2" class="_bgColor" data-bgColor="#e9ebf5">애플</th>
                <th colspan="2" class="_bgColor" data-bgColor="#e9ebf5">구글</th>
                <th colspan="2" class="_bgColor" data-bgColor="#e9ebf5">전화</th>
                <th colspan="2" class="_bgColor" data-bgColor="#e9ebf5">카카오</th>
                <th colspan="2" class="_bgColor" data-bgColor="#e9ebf5">네이버</th>
                <th colspan="2" class="_bgColor" data-bgColor="#e9ebf5">페이<br/>스북</th>
                <th colspan="2" class="_bgColor" data-bgColor="#e9ebf5">애플</th>
                <th colspan="2" class="_bgColor" data-bgColor="#e9ebf5">구글</th>
                <th colspan="2" class="_bgColor" data-bgColor="#e9ebf5">전화</th>
                <th colspan="2" class="_bgColor" data-bgColor="#e9ebf5">카카오</th>
                <th colspan="2" class="_bgColor" data-bgColor="#e9ebf5">네이버</th>
                <th colspan="2" class="_bgColor" data-bgColor="#e9ebf5">페이<br/>스북</th>
                <th colspan="2" class="_bgColor" data-bgColor="#e9ebf5">애플</th>
                <th colspan="2" class="_bgColor" data-bgColor="#e9ebf5">구글</th>

                <th colspan="2" class="_bgColor" data-bgColor="#ffe699">전화</th>
                <th colspan="2" class="_bgColor" data-bgColor="#ffe699">카카오</th>
                <th colspan="2" class="_bgColor" data-bgColor="#ffe699">네이버</th>
                <th colspan="2" class="_bgColor" data-bgColor="#ffe699">페이<br/>스북</th>
                <th colspan="2" class="_bgColor" data-bgColor="#ffe699">애플</th>
                <th colspan="2" class="_bgColor" data-bgColor="#ffe699">구글</th>
                <th colspan="2" class="_bgColor" data-bgColor="#ffe699">전화</th>
                <th colspan="2" class="_bgColor" data-bgColor="#ffe699">카카오</th>
                <th colspan="2" class="_bgColor" data-bgColor="#ffe699">네이버</th>
                <th colspan="2" class="_bgColor" data-bgColor="#ffe699">페이<br/>스북</th>
                <th colspan="2" class="_bgColor" data-bgColor="#ffe699">애플</th>
                <th colspan="2" class="_bgColor" data-bgColor="#ffe699">구글</th>
                <th colspan="2" class="_bgColor" data-bgColor="#ffe699">전화</th>
                <th colspan="2" class="_bgColor" data-bgColor="#ffe699">카카오</th>
                <th colspan="2" class="_bgColor" data-bgColor="#ffe699">네이버</th>
                <th colspan="2" class="_bgColor" data-bgColor="#ffe699">페이<br/>스북</th>
                <th colspan="2" class="_bgColor" data-bgColor="#ffe699">애플</th>
                <th colspan="2" class="_bgColor" data-bgColor="#ffe699">구글</th>
            </tr>
            <tr>
                <th class="_bgColor" data-bgColor="#b4c7e7">가입</th>
                <th class="_bgColor" data-bgColor="#b4c7e7">탈퇴</th>
                <th class="_bgColor" data-bgColor="#b4c7e7">가입</th>
                <th class="_bgColor" data-bgColor="#b4c7e7">탈퇴</th>
                <th class="_bgColor" data-bgColor="#b4c7e7">가입</th>
                <th class="_bgColor" data-bgColor="#b4c7e7">탈퇴</th>
                <th class="_bgColor" data-bgColor="#b4c7e7">가입</th>
                <th class="_bgColor" data-bgColor="#b4c7e7">탈퇴</th>
                <th class="_bgColor" data-bgColor="#b4c7e7">가입</th>
                <th class="_bgColor" data-bgColor="#b4c7e7">탈퇴</th>
                <th class="_bgColor" data-bgColor="#b4c7e7">가입</th>
                <th class="_bgColor" data-bgColor="#b4c7e7">탈퇴</th>
                <th class="_bgColor" data-bgColor="#b4c7e7">가입</th>
                <th class="_bgColor" data-bgColor="#b4c7e7">탈퇴</th>
                <th class="_bgColor" data-bgColor="#b4c7e7">가입</th>
                <th class="_bgColor" data-bgColor="#b4c7e7">탈퇴</th>
                <th class="_bgColor" data-bgColor="#b4c7e7">가입</th>
                <th class="_bgColor" data-bgColor="#b4c7e7">탈퇴</th>
                <th class="_bgColor" data-bgColor="#b4c7e7">가입</th>
                <th class="_bgColor" data-bgColor="#b4c7e7">탈퇴</th>
                <th class="_bgColor" data-bgColor="#b4c7e7">가입</th>
                <th class="_bgColor" data-bgColor="#b4c7e7">탈퇴</th>
                <th class="_bgColor" data-bgColor="#b4c7e7">가입</th>
                <th class="_bgColor" data-bgColor="#b4c7e7">탈퇴</th>
                <th class="_bgColor" data-bgColor="#b4c7e7">가입</th>
                <th class="_bgColor" data-bgColor="#b4c7e7">탈퇴</th>
                <th class="_bgColor" data-bgColor="#b4c7e7">가입</th>
                <th class="_bgColor" data-bgColor="#b4c7e7">탈퇴</th>
                <th class="_bgColor" data-bgColor="#b4c7e7">가입</th>
                <th class="_bgColor" data-bgColor="#b4c7e7">탈퇴</th>
                <th class="_bgColor" data-bgColor="#b4c7e7">가입</th>
                <th class="_bgColor" data-bgColor="#b4c7e7">탈퇴</th>
                <th class="_bgColor" data-bgColor="#b4c7e7">가입</th>
                <th class="_bgColor" data-bgColor="#b4c7e7">탈퇴</th>
                <th class="_bgColor" data-bgColor="#b4c7e7">가입</th>
                <th class="_bgColor" data-bgColor="#b4c7e7">탈퇴</th>

                <th class="_bgColor" data-bgColor="#ffd966">가입</th>
                <th class="_bgColor" data-bgColor="#ffd966">탈퇴</th>
                <th class="_bgColor" data-bgColor="#ffd966">가입</th>
                <th class="_bgColor" data-bgColor="#ffd966">탈퇴</th>
                <th class="_bgColor" data-bgColor="#ffd966">가입</th>
                <th class="_bgColor" data-bgColor="#ffd966">탈퇴</th>
                <th class="_bgColor" data-bgColor="#ffd966">가입</th>
                <th class="_bgColor" data-bgColor="#ffd966">탈퇴</th>
                <th class="_bgColor" data-bgColor="#ffd966">가입</th>
                <th class="_bgColor" data-bgColor="#ffd966">탈퇴</th>
                <th class="_bgColor" data-bgColor="#ffd966">가입</th>
                <th class="_bgColor" data-bgColor="#ffd966">탈퇴</th>
                <th class="_bgColor" data-bgColor="#ffd966">가입</th>
                <th class="_bgColor" data-bgColor="#ffd966">탈퇴</th>
                <th class="_bgColor" data-bgColor="#ffd966">가입</th>
                <th class="_bgColor" data-bgColor="#ffd966">탈퇴</th>
                <th class="_bgColor" data-bgColor="#ffd966">가입</th>
                <th class="_bgColor" data-bgColor="#ffd966">탈퇴</th>
                <th class="_bgColor" data-bgColor="#ffd966">가입</th>
                <th class="_bgColor" data-bgColor="#ffd966">탈퇴</th>
                <th class="_bgColor" data-bgColor="#ffd966">가입</th>
                <th class="_bgColor" data-bgColor="#ffd966">탈퇴</th>
                <th class="_bgColor" data-bgColor="#ffd966">가입</th>
                <th class="_bgColor" data-bgColor="#ffd966">탈퇴</th>
                <th class="_bgColor" data-bgColor="#ffd966">가입</th>
                <th class="_bgColor" data-bgColor="#ffd966">탈퇴</th>
                <th class="_bgColor" data-bgColor="#ffd966">가입</th>
                <th class="_bgColor" data-bgColor="#ffd966">탈퇴</th>
                <th class="_bgColor" data-bgColor="#ffd966">가입</th>
                <th class="_bgColor" data-bgColor="#ffd966">탈퇴</th>
                <th class="_bgColor" data-bgColor="#ffd966">가입</th>
                <th class="_bgColor" data-bgColor="#ffd966">탈퇴</th>
                <th class="_bgColor" data-bgColor="#ffd966">가입</th>
                <th class="_bgColor" data-bgColor="#ffd966">탈퇴</th>
                <th class="_bgColor" data-bgColor="#ffd966">가입</th>
                <th class="_bgColor" data-bgColor="#ffd966">탈퇴</th>
            </tr>
            </thead>
            <tbody id="liveTableBody"></tbody>
        </table>


        <table class="table table-bordered _tableHeight" data-height="23px">
            <colgroup>
                <col width="2.3%"/><col width="1.0%"/><col width="1.0%"/><col width="1.0%"/><col width="1.0%"/>
                <col width="1.0%"/><col width="1.0%"/><col width="1.0%"/><col width="1.0%"/><col width="1.0%"/>
                <col width="1.0%"/><col width="1.0%"/><col width="1.0%"/><col width="1.0%"/><col width="1.0%"/>
                <col width="1.0%"/><col width="1.0%"/><col width="1.0%"/><col width="1.0%"/><col width="1.0%"/>
                <col width="1.0%"/><col width="1.0%"/><col width="1.0%"/><col width="1.0%"/><col width="1.0%"/>
                <col width="1.0%"/><col width="1.0%"/><col width="1.0%"/><col width="1.0%"/><col width="1.0%"/>
                <col width="1.0%"/><col width="1.0%"/><col width="1.0%"/><col width="1.0%"/><col width="1.0%"/>
                <col width="1.0%"/><col width="1.0%"/><col width="1.0%"/><col width="1.0%"/><col width="1.0%"/>
                <col width="1.0%"/><col width="1.0%"/><col width="1.0%"/><col width="1.0%"/><col width="1.0%"/>
                <col width="1.0%"/><col width="1.0%"/><col width="1.0%"/><col width="1.0%"/><col width="1.0%"/>
                <col width="1.0%"/><col width="1.0%"/><col width="1.0%"/><col width="1.0%"/><col width="1.0%"/>
                <col width="1.0%"/><col width="1.0%"/><col width="1.0%"/><col width="1.0%"/><col width="1.0%"/>
                <col width="1.0%"/><col width="1.0%"/><col width="1.0%"/><col width="1.0%"/><col width="1.0%"/>
                <col width="1.0%"/><col width="1.0%"/><col width="1.0%"/><col width="1.0%"/><col width="1.0%"/>
                <col width="1.0%"/><col width="1.0%"/><col width="1.0%"/>
            </colgroup>
            <thead>
            <tr>
                <th rowspan="4" class="_bgColor _fontColor" data-bgColor="#4472c4" data-fontColor="#ffffff">구분</th>
                <th id="live_th_3" colspan="36" class="_bgColor _fontColor" data-bgColor="#4472c4" data-fontColor="#ffffff">삼일전</th>
                <th id="live_th_2" colspan="36" class="_bgColor _fontColor" data-bgColor="#4472c4" data-fontColor="#ffffff">이틀전</th>
            </tr>
            <tr class="_bgColor" data-bgColor="#b4c7e7">
                <th colspan="12" class="_sex_male"></th>
                <th colspan="12" class="_sex_female"></th>
                <th colspan="12" class="_sex_none"></th>
                <th colspan="12" class="_sex_male"></th>
                <th colspan="12" class="_sex_female"></th>
                <th colspan="12" class="_sex_none"></th>
            </tr>
            <tr style="background-color: #e9ebf5">
                <th colspan="2">전화</th>
                <th colspan="2">카카오</th>
                <th colspan="2">네이버</th>
                <th colspan="2">페이스북</th>
                <th colspan="2">애플</th>
                <th colspan="2">구글</th>
                <th colspan="2">전화</th>
                <th colspan="2">카카오</th>
                <th colspan="2">네이버</th>
                <th colspan="2">페이스북</th>
                <th colspan="2">애플</th>
                <th colspan="2">구글</th>
                <th colspan="2">전화</th>
                <th colspan="2">카카오</th>
                <th colspan="2">네이버</th>
                <th colspan="2">페이스북</th>
                <th colspan="2">애플</th>
                <th colspan="2">구글</th>
                <th colspan="2">전화</th>
                <th colspan="2">카카오</th>
                <th colspan="2">네이버</th>
                <th colspan="2">페이스북</th>
                <th colspan="2">애플</th>
                <th colspan="2">구글</th>
                <th colspan="2">전화</th>
                <th colspan="2">카카오</th>
                <th colspan="2">네이버</th>
                <th colspan="2">페이스북</th>
                <th colspan="2">애플</th>
                <th colspan="2">구글</th>
                <th colspan="2">전화</th>
                <th colspan="2">카카오</th>
                <th colspan="2">네이버</th>
                <th colspan="2">페이스북</th>
                <th colspan="2">애플</th>
                <th colspan="2">구글</th>
            </tr>
            <tr style="background-color: #cfd5ea">
                <th>가입</th>
                <th>탈퇴</th>
                <th>가입</th>
                <th>탈퇴</th>
                <th>가입</th>
                <th>탈퇴</th>
                <th>가입</th>
                <th>탈퇴</th>
                <th>가입</th>
                <th>탈퇴</th>
                <th>가입</th>
                <th>탈퇴</th>
                <th>가입</th>
                <th>탈퇴</th>
                <th>가입</th>
                <th>탈퇴</th>
                <th>가입</th>
                <th>탈퇴</th>
                <th>가입</th>
                <th>탈퇴</th>
                <th>가입</th>
                <th>탈퇴</th>
                <th>가입</th>
                <th>탈퇴</th>
                <th>가입</th>
                <th>탈퇴</th>
                <th>가입</th>
                <th>탈퇴</th>
                <th>가입</th>
                <th>탈퇴</th>
                <th>가입</th>
                <th>탈퇴</th>
                <th>가입</th>
                <th>탈퇴</th>
                <th>가입</th>
                <th>탈퇴</th>
                <th>가입</th>
                <th>탈퇴</th>
                <th>가입</th>
                <th>탈퇴</th>
                <th>가입</th>
                <th>탈퇴</th>
                <th>가입</th>
                <th>탈퇴</th>
                <th>가입</th>
                <th>탈퇴</th>
                <th>가입</th>
                <th>탈퇴</th>
                <th>가입</th>
                <th>탈퇴</th>
                <th>가입</th>
                <th>탈퇴</th>
                <th>가입</th>
                <th>탈퇴</th>
                <th>가입</th>
                <th>탈퇴</th>
                <th>가입</th>
                <th>탈퇴</th>
                <th>가입</th>
                <th>탈퇴</th>
                <th>가입</th>
                <th>탈퇴</th>
                <th>가입</th>
                <th>탈퇴</th>
                <th>가입</th>
                <th>탈퇴</th>
                <th>가입</th>
                <th>탈퇴</th>
                <th>가입</th>
                <th>탈퇴</th>
                <th>가입</th>
                <th>탈퇴</th>
            </tr>
            </thead>
            <tbody id="liveTableBody2"></tbody>
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
        getLive();
    });

    var tmp = 0;
    var tmp_end = 0;
    var type;
    function getLive(){
        $("#live_th_3").text(moment($("#startDate").val()).add('days', -3).format('YYYY.MM.DD') + " (" + week[moment($("#startDate").val()).add('days', -3).day()] + ")");
        $("#live_th_2").text(moment($("#startDate").val()).add('days', -2).format('YYYY.MM.DD') + " (" + week[moment($("#startDate").val()).add('days', -2).day()] + ")");
        $("#live_th_1").text(moment($("#startDate").val()).add('days', -1).format('YYYY.MM.DD') + " (" + week[moment($("#startDate").val()).add('days', -1).day()] + ")");
        $("#live_th_0").text(moment($("#startDate").val()).add('days', 0).format('YYYY.MM.DD') + " (" + week[moment($("#startDate").val()).add('days', 0).day()] + ")");

        var th_3 = moment($("#startDate").val()).add('days', -3).format('YYYY.MM.DD');
        var th_2 = moment($("#startDate").val()).add('days', -2).format('YYYY.MM.DD');
        var th_1 = moment($("#startDate").val()).add('days', -1).format('YYYY.MM.DD');
        var th_0 = moment($("#startDate").val()).add('days', 0).format('YYYY.MM.DD');
        var dateList = th_0 + "@" + th_1 + "@" + th_2 + "@" + th_3;
        var data = {};
        data.dateList = dateList;
        data.slctType = slctType;
        util.getAjaxData("total", "/rest/connect/login/info/totalAll", data, fn_live_success);
    }

    function fn_live_success(data, response){
        dalbitLog(response);

        tmp_end = 0;
        tmp = 24;
        type = "시";
        var slctType_date = [];
        for(var i = tmp_end; i < tmp; i++ ){
            slctType_date.push(i + " " + type);
        }
        data = {
            slctType_date : slctType_date
        };

        var template = $('#tmp_dummyLive').html();
        var templateScript = Handlebars.compile(template);
        var context = data;
        var html=templateScript(context);
        $("#liveTableBody").html(html);

        var template = $('#tmp_dummyLive2').html();
        var templateScript = Handlebars.compile(template);
        var context = data;
        var html=templateScript(context);
        $("#liveTableBody2").html(html);


        var tmp_date = new Date();
        tmp_date = moment(tmp_date).format("YYYY.MM.DD HH:mm:SS");
        var tmp_time = tmp_date.split(" ")[1];

        tmp_index = -1;

        response.data.forEach(function(data, index){
            if(index > 2){
                ++tmp_index;
            }
            data.detailList.forEach(function(detail, detailIndex){
                if(detail.succAmt == 0){
                    detail.accumAmt = 0;
                }

                // 상단
                if (index == 1) {
                    $("#liveTableBody tr._tr_" + detail.hour + " td:eq(" + (1) + ")").html();
                    $("#liveTableBody tr._tr_" + detail.hour + " td:eq(" + (2) + ")").html();
                    $("#liveTableBody tr._tr_" + detail.hour + " td:eq(" + (3) + ")").html();
                    $("#liveTableBody tr._tr_" + detail.hour + " td:eq(" + (4) + ")").html();
                    $("#liveTableBody tr._tr_" + detail.hour + " td:eq(" + (5) + ")").html();
                    $("#liveTableBody tr._tr_" + detail.hour + " td:eq(" + (6) + ")").html();
                    $("#liveTableBody tr._tr_" + detail.hour + " td:eq(" + (7) + ")").html();
                    $("#liveTableBody tr._tr_" + detail.hour + " td:eq(" + (8) + ")").html();
                    $("#liveTableBody tr._tr_" + detail.hour + " td:eq(" + (9) + ")").html();
                    $("#liveTableBody tr._tr_" + detail.hour + " td:eq(" + (10) + ")").html();
                    $("#liveTableBody tr._tr_" + detail.hour + " td:eq(" + (11) + ")").html();
                    $("#liveTableBody tr._tr_" + detail.hour + " td:eq(" + (12) + ")").html();

                    if(Number(tmp_time.split(":")[0]) == detail.hour) {
                        for(var i = 1; i < 37 ; i ++){
                            $("#liveTableBody tr._tr_" + (detail.hour) + " td:eq(" + (i) + ")").css("background-color", "#e3ecfb");
                            $("#liveTableBody tr._tr_" + (detail.hour) + " td:eq(" + (i) + ")").css("font-weight", "bold");
                        }
                    }
                }

                if (index == 0) {
                    $("#liveTableBody tr._tr_" + detail.hour + " td:eq(" + (37 + 1) + ")").html();
                    $("#liveTableBody tr._tr_" + detail.hour + " td:eq(" + (37 + 2) + ")").html();
                    $("#liveTableBody tr._tr_" + detail.hour + " td:eq(" + (37 + 3) + ")").html();
                    $("#liveTableBody tr._tr_" + detail.hour + " td:eq(" + (37 + 4) + ")").html();
                    $("#liveTableBody tr._tr_" + detail.hour + " td:eq(" + (37 + 5) + ")").html();
                    $("#liveTableBody tr._tr_" + detail.hour + " td:eq(" + (37 + 6) + ")").html();
                    $("#liveTableBody tr._tr_" + detail.hour + " td:eq(" + (37 + 7) + ")").html();
                    $("#liveTableBody tr._tr_" + detail.hour + " td:eq(" + (37 + 8) + ")").html();
                    $("#liveTableBody tr._tr_" + detail.hour + " td:eq(" + (37 + 9) + ")").html();
                    $("#liveTableBody tr._tr_" + detail.hour + " td:eq(" + (37 + 10) + ")").html();
                    $("#liveTableBody tr._tr_" + detail.hour + " td:eq(" + (37 + 11) + ")").html();
                    $("#liveTableBody tr._tr_" + detail.hour + " td:eq(" + (37 + 12) + ")").html();
                    if(Number(tmp_time.split(":")[0]) == detail.hour) {
                        for(var i = 0; i < 37 ; i ++){
                            $("#liveTableBody tr._tr_" + (detail.hour) + " td:eq(" + (37 + i) + ")").css("background-color", "#e3ecfb");
                            $("#liveTableBody tr._tr_" + (detail.hour) + " td:eq(" + (37 + i) + ")").css("font-weight", "bold");
                        }
                    }
                }
                // 하단
                if (index == 2) {
                    $("#liveTableBody2 tr._tr_" + detail.hour + " td:eq(" + (1) + ")").html();
                    $("#liveTableBody2 tr._tr_" + detail.hour + " td:eq(" + (2) + ")").html();
                    $("#liveTableBody2 tr._tr_" + detail.hour + " td:eq(" + (3) + ")").html();
                    $("#liveTableBody2 tr._tr_" + detail.hour + " td:eq(" + (4) + ")").html();
                    $("#liveTableBody2 tr._tr_" + detail.hour + " td:eq(" + (5) + ")").html();
                    $("#liveTableBody2 tr._tr_" + detail.hour + " td:eq(" + (6) + ")").html();
                    $("#liveTableBody2 tr._tr_" + detail.hour + " td:eq(" + (7) + ")").html();
                    $("#liveTableBody2 tr._tr_" + detail.hour + " td:eq(" + (8) + ")").html();
                    $("#liveTableBody2 tr._tr_" + detail.hour + " td:eq(" + (9) + ")").html();
                    $("#liveTableBody2 tr._tr_" + detail.hour + " td:eq(" + (10) + ")").html();
                    $("#liveTableBody2 tr._tr_" + detail.hour + " td:eq(" + (11) + ")").html();
                    $("#liveTableBody2 tr._tr_" + detail.hour + " td:eq(" + (12) + ")").html();

                    if(Number(tmp_time.split(":")[0]) == detail.hour) {
                        for(var i = 1; i < 37 ; i ++){
                            $("#liveTableBody2 tr._tr_" + (detail.hour) + " td:eq(" + (i) + ")").css("background-color", "#e3ecfb");
                            $("#liveTableBody2 tr._tr_" + (detail.hour) + " td:eq(" + (i) + ")").css("font-weight", "bold");
                        }
                    }
                }
                if(index == 3){

                    $("#liveTableBody2 tr._tr_" + detail.hour + " td:eq(" + (37 + 1) + ")").html();
                    $("#liveTableBody2 tr._tr_" + detail.hour + " td:eq(" + (37 + 2) + ")").html();
                    $("#liveTableBody2 tr._tr_" + detail.hour + " td:eq(" + (37 + 3) + ")").html();
                    $("#liveTableBody2 tr._tr_" + detail.hour + " td:eq(" + (37 + 4) + ")").html();
                    $("#liveTableBody2 tr._tr_" + detail.hour + " td:eq(" + (37 + 5) + ")").html();
                    $("#liveTableBody2 tr._tr_" + detail.hour + " td:eq(" + (37 + 6) + ")").html();
                    $("#liveTableBody2 tr._tr_" + detail.hour + " td:eq(" + (37 + 7) + ")").html();
                    $("#liveTableBody2 tr._tr_" + detail.hour + " td:eq(" + (37 + 8) + ")").html();
                    $("#liveTableBody2 tr._tr_" + detail.hour + " td:eq(" + (37 + 9) + ")").html();
                    $("#liveTableBody2 tr._tr_" + detail.hour + " td:eq(" + (37 + 10) + ")").html();
                    $("#liveTableBody2 tr._tr_" + detail.hour + " td:eq(" + (37 + 11) + ")").html();
                    $("#liveTableBody2 tr._tr_" + detail.hour + " td:eq(" + (37 + 12) + ")").html();

                    if(Number(tmp_time.split(":")[0]) == detail.hour) {
                        for(var i = 0; i < 37 ; i ++){
                            $("#liveTableBody2 tr._tr_" + (detail.hour) + " td:eq(" + (37 + i) + ")").css("background-color", "#e3ecfb");
                            $("#liveTableBody2 tr._tr_" + (detail.hour) + " td:eq(" + (37 + i) + ")").css("font-weight", "bold");
                        }
                    }
                }
            });
        });

        tmp_index = -1;
        for(var i=0 ; i<response.data.length;i++){
            if(i > 2){
                ++tmp_index;
            }
            var totalInfo = response.data[i].totalInfo;
            //상단

            if(i == 0){
                $("#liveTableBody tr:eq(0) td:eq(" + (1) + ")").html();
                $("#liveTableBody tr:eq(0) td:eq(" + (2) + ")").html();
                $("#liveTableBody tr:eq(0) td:eq(" + (3) + ")").html();
                $("#liveTableBody tr:eq(0) td:eq(" + (4) + ")").html();
                $("#liveTableBody tr:eq(0) td:eq(" + (5) + ")").html();
                $("#liveTableBody tr:eq(0) td:eq(" + (6) + ")").html();
                $("#liveTableBody tr:eq(0) td:eq(" + (7) + ")").html();
                $("#liveTableBody tr:eq(0) td:eq(" + (8) + ")").html();
                $("#liveTableBody tr:eq(0) td:eq(" + (9) + ")").html();
                $("#liveTableBody tr:eq(0) td:eq(" + (10) + ")").html();
                $("#liveTableBody tr:eq(0) td:eq(" + (11) + ")").html();
                $("#liveTableBody tr:eq(0) td:eq(" + (12) + ")").html();

                $("#liveTableBody tr:eq(25) td:eq(" + (1) + ")").html();
                $("#liveTableBody tr:eq(25) td:eq(" + (2) + ")").html();
                $("#liveTableBody tr:eq(25) td:eq(" + (3) + ")").html();
                $("#liveTableBody tr:eq(25) td:eq(" + (4) + ")").html();
                $("#liveTableBody tr:eq(25) td:eq(" + (5) + ")").html();
                $("#liveTableBody tr:eq(25) td:eq(" + (6) + ")").html();
                $("#liveTableBody tr:eq(25) td:eq(" + (7) + ")").html();
                $("#liveTableBody tr:eq(25) td:eq(" + (8) + ")").html();
                $("#liveTableBody tr:eq(25) td:eq(" + (9) + ")").html();
                $("#liveTableBody tr:eq(25) td:eq(" + (10) + ")").html();
                $("#liveTableBody tr:eq(25) td:eq(" + (11) + ")").html();
                $("#liveTableBody tr:eq(25) td:eq(" + (12) + ")").html();
            }else if(i == 1){
                $("#liveTableBody tr:eq(0) td:eq(" + (25 + 1) + ")").html();
                $("#liveTableBody tr:eq(0) td:eq(" + (25 + 2) + ")").html();
                $("#liveTableBody tr:eq(0) td:eq(" + (25 + 3) + ")").html();
                $("#liveTableBody tr:eq(0) td:eq(" + (25 + 4) + ")").html();
                $("#liveTableBody tr:eq(0) td:eq(" + (25 + 5) + ")").html();
                $("#liveTableBody tr:eq(0) td:eq(" + (25 + 6) + ")").html();

                $("#liveTableBody tr:eq(25) td:eq(" + (25 + 1) + ")").html();
                $("#liveTableBody tr:eq(25) td:eq(" + (25 + 2) + ")").html();
                $("#liveTableBody tr:eq(25) td:eq(" + (25 + 3) + ")").html();
                $("#liveTableBody tr:eq(25) td:eq(" + (25 + 4) + ")").html();
                $("#liveTableBody tr:eq(25) td:eq(" + (25 + 5) + ")").html();
                $("#liveTableBody tr:eq(25) td:eq(" + (25 + 6) + ")").html();
            }

            // 하단
            if(i == 2){
                $("#liveTableBody2 tr:eq(0) td:eq(" + (1) + ")").html();
                $("#liveTableBody2 tr:eq(0) td:eq(" + (2) + ")").html();
                $("#liveTableBody2 tr:eq(0) td:eq(" + (3) + ")").html();
                $("#liveTableBody2 tr:eq(0) td:eq(" + (4) + ")").html();
                $("#liveTableBody2 tr:eq(0) td:eq(" + (5) + ")").html();
                $("#liveTableBody2 tr:eq(0) td:eq(" + (6) + ")").html();
                $("#liveTableBody2 tr:eq(0) td:eq(" + (7) + ")").html();
                $("#liveTableBody2 tr:eq(0) td:eq(" + (8) + ")").html();
                $("#liveTableBody2 tr:eq(0) td:eq(" + (9) + ")").html();
                $("#liveTableBody2 tr:eq(0) td:eq(" + (10) + ")").html();
                $("#liveTableBody2 tr:eq(0) td:eq(" + (11) + ")").html();
                $("#liveTableBody2 tr:eq(0) td:eq(" + (12) + ")").html();

                $("#liveTableBody2 tr:eq(25) td:eq(" + (1) + ")").html();
                $("#liveTableBody2 tr:eq(25) td:eq(" + (2) + ")").html();
                $("#liveTableBody2 tr:eq(25) td:eq(" + (3) + ")").html();
                $("#liveTableBody2 tr:eq(25) td:eq(" + (4) + ")").html();
                $("#liveTableBody2 tr:eq(25) td:eq(" + (5) + ")").html();
                $("#liveTableBody2 tr:eq(25) td:eq(" + (6) + ")").html();
            }else if(i == 3){
                $("#liveTableBody2 tr:eq(0) td:eq(" + (25 + 1) + ")").html();
                $("#liveTableBody2 tr:eq(0) td:eq(" + (25 + 2) + ")").html();
                $("#liveTableBody2 tr:eq(0) td:eq(" + (25 + 3) + ")").html();
                $("#liveTableBody2 tr:eq(0) td:eq(" + (25 + 4) + ")").html();
                $("#liveTableBody2 tr:eq(0) td:eq(" + (25 + 5) + ")").html();
                $("#liveTableBody2 tr:eq(0) td:eq(" + (25 + 6) + ")").html();
                $("#liveTableBody2 tr:eq(0) td:eq(" + (25 + 7) + ")").html();
                $("#liveTableBody2 tr:eq(0) td:eq(" + (25 + 8) + ")").html();
                $("#liveTableBody2 tr:eq(0) td:eq(" + (25 + 9) + ")").html();
                $("#liveTableBody2 tr:eq(0) td:eq(" + (25 + 10) + ")").html();
                $("#liveTableBody2 tr:eq(0) td:eq(" + (25 + 11) + ")").html();
                $("#liveTableBody2 tr:eq(0) td:eq(" + (25 + 12) + ")").html();

                $("#liveTableBody2 tr:eq(25) td:eq(" + (25 + 1) + ")").html();
                $("#liveTableBody2 tr:eq(25) td:eq(" + (25 + 2) + ")").html();
                $("#liveTableBody2 tr:eq(25) td:eq(" + (25 + 3) + ")").html();
                $("#liveTableBody2 tr:eq(25) td:eq(" + (25 + 4) + ")").html();
                $("#liveTableBody2 tr:eq(25) td:eq(" + (25 + 5) + ")").html();
                $("#liveTableBody2 tr:eq(25) td:eq(" + (25 + 6) + ")").html();
            }
        }
        // ui.paintColor();
        ui.tableHeightSet();
    }

</script>


<script type="text/x-handlebars-template" id="tmp_dummyLive">
    <tr class="_tr_{{this}} font-bold" style="color: #ff5600;background-color: #f2f2f2">
        <td>총합</td>
        <td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td>
        <td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td>
        <td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td>
        <td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td>
        <td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td>
        <td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td>
    </tr>
    {{#each this.slctType_date}}
    <tr class="_tr_{{this}}">
        <td class="font-bold"  style="background-color: #dae3f3">{{this}}</td>
        <td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
        <td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
        <td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>

        <td style="background-color: #fff7e5"></td><td style="background-color: #fff7e5"></td><td style="background-color: #fff7e5"></td><td style="background-color: #fff7e5"></td><td style="background-color: #fff7e5"></td>
        <td style="background-color: #fff7e5"></td><td style="background-color: #fff7e5"></td><td style="background-color: #fff7e5"></td><td style="background-color: #fff7e5"></td><td style="background-color: #fff7e5"></td>
        <td style="background-color: #fff7e5"></td><td style="background-color: #fff7e5"></td>
        <td style="background-color: #fff7e5"></td><td style="background-color: #fff7e5"></td><td style="background-color: #fff7e5"></td><td style="background-color: #fff7e5"></td><td style="background-color: #fff7e5"></td>
        <td style="background-color: #fff7e5"></td><td style="background-color: #fff7e5"></td><td style="background-color: #fff7e5"></td><td style="background-color: #fff7e5"></td><td style="background-color: #fff7e5"></td>
        <td style="background-color: #fff7e5"></td><td style="background-color: #fff7e5"></td>
        <td style="background-color: #fff7e5"></td><td style="background-color: #fff7e5"></td><td style="background-color: #fff7e5"></td><td style="background-color: #fff7e5"></td><td style="background-color: #fff7e5"></td>
        <td style="background-color: #fff7e5"></td><td style="background-color: #fff7e5"></td><td style="background-color: #fff7e5"></td><td style="background-color: #fff7e5"></td><td style="background-color: #fff7e5"></td>
        <td style="background-color: #fff7e5"></td><td style="background-color: #fff7e5"></td>
    </tr>
    {{/each}}
    <tr class="_tr_{{this}} font-bold" style="color: #ff5600;background-color: #f2f2f2">
        <td>소계</td>
        <td colspan="2">0</td><td colspan="2">0</td><td colspan="2">0</td><td colspan="2">0</td><td colspan="2">0</td><td colspan="2">0</td>
        <td colspan="2">0</td><td colspan="2">0</td><td colspan="2">0</td><td colspan="2">0</td><td colspan="2">0</td><td colspan="2">0</td>
        <td colspan="2">0</td><td colspan="2">0</td><td colspan="2">0</td><td colspan="2">0</td><td colspan="2">0</td><td colspan="2">0</td>
        <td colspan="2">0</td><td colspan="2">0</td><td colspan="2">0</td><td colspan="2">0</td><td colspan="2">0</td><td colspan="2">0</td>
        <td colspan="2">0</td><td colspan="2">0</td><td colspan="2">0</td><td colspan="2">0</td><td colspan="2">0</td><td colspan="2">0</td>
        <td colspan="2">0</td><td colspan="2">0</td><td colspan="2">0</td><td colspan="2">0</td><td colspan="2">0</td><td colspan="2">0</td>
    </tr>
    <tr class="_tr_{{this}} font-bold" style="color: #ff5600;background-color: #f2f2f2">
        <td>총계</td>
        <td colspan="36">0</td>
        <td colspan="36">0</td>
    </tr>
</script>

<script type="text/x-handlebars-template" id="tmp_dummyLive2">
    <tr class="_tr_{{this}} font-bold" style="color: #ff5600;background-color: #f2f2f2">
        <td>총합</td>
        <td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td>
        <td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td>
        <td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td>
        <td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td>
        <td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td>
        <td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td>
    </tr>
    {{#each this.slctType_date}}
    <tr class="_tr_{{this}}">
        <td class="font-bold" style="background-color: #dae3f3">{{this}}</td>
        <td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
        <td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
        <td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
        <td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
        <td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
        <td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
    </tr>
    {{/each}}
    <tr class="_tr_{{this}} font-bold" style="color: #ff5600;background-color: #f2f2f2">
        <td>소계</td>
        <td colspan="2">0</td><td colspan="2">0</td><td colspan="2">0</td><td colspan="2">0</td><td colspan="2">0</td><td colspan="2">0</td>
        <td colspan="2">0</td><td colspan="2">0</td><td colspan="2">0</td><td colspan="2">0</td><td colspan="2">0</td><td colspan="2">0</td>
        <td colspan="2">0</td><td colspan="2">0</td><td colspan="2">0</td><td colspan="2">0</td><td colspan="2">0</td><td colspan="2">0</td>
        <td colspan="2">0</td><td colspan="2">0</td><td colspan="2">0</td><td colspan="2">0</td><td colspan="2">0</td><td colspan="2">0</td>
        <td colspan="2">0</td><td colspan="2">0</td><td colspan="2">0</td><td colspan="2">0</td><td colspan="2">0</td><td colspan="2">0</td>
        <td colspan="2">0</td><td colspan="2">0</td><td colspan="2">0</td><td colspan="2">0</td><td colspan="2">0</td><td colspan="2">0</td>
    </tr>
    <tr class="_tr_{{this}} font-bold" style="color: #ff5600;background-color: #f2f2f2">
        <td>총계</td>
        <td colspan="36">0</td>
        <td colspan="36">0</td>
    </tr>
</script>