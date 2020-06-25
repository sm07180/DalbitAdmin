<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 로그인 > 총계 -->
<div class="widget widget-table mb10">
    <div class="widget-content mt10 col-md-9">
        <span class="_searchDate"></span>

        <table class="table table-bordered _tableHeight" data-height="23px">
            <colgroup>
                <col width="6.2%"/>
                <col width="6.2%"/><col width="6.2%"/><col width="6.2%"/><col width="6.2%"/><col width="6.2%"/>
                <col width="0.5%"/>
                <col width="6.2%"/><col width="6.2%"/><col width="6.2%"/><col width="6.2%"/><col width="6.2%"/>
                <col width="0.5%"/>
                <col width="6.2%"/><col width="6.2%"/><col width="6.2%"/><col width="6.2%"/><col width="6.2%"/>
            </colgroup>
            <thead>
            <tr style="background-color: #b4c7e7">
                <th rowspan="2"></th>
                <th class="_totalDate" colspan="5" id="total_th_2"></th>
                <td class="_noBorder"></td>
                <th class="_totalDate" colspan="5" id="total_th_1"></th>
                <td class="_noBorder"></td>
                <th class="_totalDate" colspan="5" id="total_th_0" style="background-color: #ffe699"></th>
            </tr>
            <tr style="background-color: #dae3f3">
                <th class="_sex_male"></th>
                <th class="_sex_female"></th>
                <th class="_sex_female"></th>
                <th>알수없음</th>
                <th>소계</th>
                <td class="_noBorder"></td>

                <th class="_sex_male"></th>
                <th class="_sex_female"></th>
                <th class="_sex_female"></th>
                <th>알수없음</th>
                <th>소계</th>
                <td class="_noBorder"></td>

                <th class="_sex_male" style="background-color: #fff2cc"></th>
                <th class="_sex_female" style="background-color: #fff2cc"></th>
                <th class="_sex_female" style="background-color: #fff2cc"></th>
                <th style="background-color: #fff2cc">알수없음</th>
                <th style="background-color: #fff2cc">소계</th>
            </tr>
            </thead>
            <tbody id="totalTableBody"></tbody>
        </table>

        <table class="table table-bordered _tableHeight" data-height="23px">
            <colgroup>
                <col width="6.2%"/>
                <col width="6.2%"/><col width="6.2%"/><col width="6.2%"/><col width="6.2%"/><col width="6.2%"/>
                <col width="0.5%"/>
                <col width="6.2%"/><col width="6.2%"/><col width="6.2%"/><col width="6.2%"/><col width="6.2%"/>
                <col width="0.5%"/>
                <col width="6.2%"/><col width="6.2%"/><col width="6.2%"/><col width="6.2%"/><col width="6.2%"/>
            </colgroup>
            <thead>
            <tr style="background-color: #b4c7e7">
                <th rowspan="2"></th>
                <th class="_totalDate" colspan="5" id="total_th_5"></th>
                <td class="_noBorder"></td>
                <th class="_totalDate" colspan="5" id="total_th_4"></th>
                <td class="_noBorder"></td>
                <th class="_totalDate" colspan="5" id="total_th_3"></th>
            </tr>
            <tr style="background-color: #dae3f3">
                <th class="_sex_male"></th>
                <th class="_sex_female"></th>
                <th class="_sex_female"></th>
                <th>알수없음</th>
                <th>소계</th>
                <td class="_noBorder"></td>

                <th class="_sex_male"></th>
                <th class="_sex_female"></th>
                <th class="_sex_female"></th>
                <th>알수없음</th>
                <th>소계</th>
                <td class="_noBorder"></td>

                <th class="_sex_male"></th>
                <th class="_sex_female"></th>
                <th class="_sex_female"></th>
                <th>알수없음</th>
                <th>소계</th>
            </tr>
            </thead>
            <tbody id="totalTableBody2"></tbody>
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
        getTotalList();
    });


    function tableHeightSet(){
        var tb = $('._tableHeight');
        var height = tb.data('height');

        tb.find('th').each(function(){
            $(this).css('height', height);
        });

        tb.find('td').each(function(){
            console.log($(this));
            $(this).css('height', height);
        });
    }

    var tmp = 0;
    var tmp_end = 0;
    var type;
    function getTotalList(){
        var slctType = $('input[name="slctType"]:checked').val();
        if(slctType == 0){
            tmp_end = 0;
            tmp = 24;
            type = "시";
        }else if (slctType == 1){
            tmp_end = 1;
            tmp = 32;
            type = "일";
        }else if (slctType == 2){
            tmp_end = 1;
            tmp = 13;
            type = "월";
        }

        var slctType_date = [];
        for(var i = tmp_end; i < tmp; i++ ){
            slctType_date.push(i + " " + type);
        }
        data = {
            slctType_date : slctType_date
        };

        var template = $('#tmp_dummyTotalDetailList').html();
        var templateScript = Handlebars.compile(template);
        var context = data;
        var html=templateScript(context);
        $("#totalTableBody").html(html);

        var template = $('#tmp_dummyTotalDetailList2').html();
        var templateScript = Handlebars.compile(template);
        var context = data;
        var html=templateScript(context);
        $("#totalTableBody2").html(html);



        var total_th_5;
        var total_th_4;
        var total_th_3;
        var total_th_2;
        var total_th_1;
        var total_th_0;

        if($('input[name="slctType"]:checked').val() == "0"){
            $("#total_th_5").text(moment($("#startDate").val()).add('days', -5).format('YYYY.MM.DD') + " (" + week[moment($("#startDate").val()).add('days', -5).day()] + ")");
            $("#total_th_4").text(moment($("#startDate").val()).add('days', -4).format('YYYY.MM.DD') + " (" + week[moment($("#startDate").val()).add('days', -4).day()] + ")");
            $("#total_th_3").text(moment($("#startDate").val()).add('days', -3).format('YYYY.MM.DD') + " (" + week[moment($("#startDate").val()).add('days', -3).day()] + ")");
            $("#total_th_2").text(moment($("#startDate").val()).add('days', -2).format('YYYY.MM.DD') + " (" + week[moment($("#startDate").val()).add('days', -2).day()] + ")");
            $("#total_th_1").text(moment($("#startDate").val()).add('days', -1).format('YYYY.MM.DD') + " (" + week[moment($("#startDate").val()).add('days', -1).day()] + ")");
            $("#total_th_0").text(moment($("#startDate").val()).add('days', 0).format('YYYY.MM.DD') + " (" + week[moment($("#startDate").val()).add('days', 0).day()] + ")");

            total_th_5 = moment($("#startDate").val()).add('days', -5).format('YYYY.MM.DD');
            total_th_4 = moment($("#startDate").val()).add('days', -4).format('YYYY.MM.DD');
            total_th_3 = moment($("#startDate").val()).add('days', -3).format('YYYY.MM.DD');
            total_th_2 = moment($("#startDate").val()).add('days', -2).format('YYYY.MM.DD');
            total_th_1 = moment($("#startDate").val()).add('days', -1).format('YYYY.MM.DD');
            total_th_0 = moment($("#startDate").val()).add('days', 0).format('YYYY.MM.DD');

        }else if($('input[name="slctType"]:checked').val() == "1"){
            $("#total_th_5").text(moment($("#startDate").val()).add('months', -5).format('YYYY.MM'));
            $("#total_th_4").text(moment($("#startDate").val()).add('months', -4).format('YYYY.MM'));
            $("#total_th_3").text(moment($("#startDate").val()).add('months', -3).format('YYYY.MM'));
            $("#total_th_2").text(moment($("#startDate").val()).add('months', -2).format('YYYY.MM'));
            $("#total_th_1").text(moment($("#startDate").val()).add('months', -1).format('YYYY.MM'));
            $("#total_th_0").text(moment($("#startDate").val()).add('months', 0).format('YYYY.MM'));

            total_th_5 = moment($("#startDate").val()).add('months', -5).format('YYYY.MM.01') + " - " + moment($("#startDate").val()).add('months', -4).add('days', -1).format('YYYY.MM.DD');
            total_th_4 = moment($("#startDate").val()).add('months', -4).format('YYYY.MM.01') + " - " + moment($("#startDate").val()).add('months', -3).add('days', -1).format('YYYY.MM.DD');
            total_th_3 = moment($("#startDate").val()).add('months', -3).format('YYYY.MM.01') + " - " + moment($("#startDate").val()).add('months', -2).add('days', -1).format('YYYY.MM.DD');
            total_th_2 = moment($("#startDate").val()).add('months', -2).format('YYYY.MM.01') + " - " + moment($("#startDate").val()).add('months', -1).add('days', -1).format('YYYY.MM.DD');
            total_th_1 = moment($("#startDate").val()).add('months', -1).format('YYYY.MM.01') + " - " + moment($("#startDate").val()).add('months', 0).add('days', -1).format('YYYY.MM.DD');
            total_th_0 = moment($("#startDate").val()).add('months', 0).format('YYYY.MM.01') + " - " + moment($("#startDate").val()).add('months', 1).add('days', -1).format('YYYY.MM.DD');

        }else if($('input[name="slctType"]:checked').val() == "2"){
            $("#total_th_5").text(moment($("#startDate").val()).add('years', -5).format('YYYY'));
            $("#total_th_4").text(moment($("#startDate").val()).add('years', -4).format('YYYY'));
            $("#total_th_3").text(moment($("#startDate").val()).add('years', -3).format('YYYY'));
            $("#total_th_2").text(moment($("#startDate").val()).add('years', -2).format('YYYY'));
            $("#total_th_1").text(moment($("#startDate").val()).add('years', -1).format('YYYY'));
            $("#total_th_0").text(moment($("#startDate").val()).add('years', 0).format('YYYY'));

            total_th_5 = moment($("#startDate").val()).add('years', -5).format('YYYY.01.01') + " - " + moment($("#startDate").val()).add('years', -4).add('days', -1).format('YYYY.12.31');
            total_th_4 = moment($("#startDate").val()).add('years', -4).format('YYYY.01.01') + " - " + moment($("#startDate").val()).add('years', -3).add('days', -1).format('YYYY.12.31');
            total_th_3 = moment($("#startDate").val()).add('years', -3).format('YYYY.01.01') + " - " + moment($("#startDate").val()).add('years', -2).add('days', -1).format('YYYY.12.31');
            total_th_2 = moment($("#startDate").val()).add('years', -2).format('YYYY.01.01') + " - " + moment($("#startDate").val()).add('years', -1).add('days', -1).format('YYYY.12.31');
            total_th_1 = moment($("#startDate").val()).add('years', -1).format('YYYY.01.01') + " - " + moment($("#startDate").val()).add('years', 0).add('days', -1).format('YYYY.12.31');
            total_th_0 = moment($("#startDate").val()).add('years', 0).format('YYYY.01.01') + " - " + moment($("#startDate").val()).add('years', 1).add('days', -1).format('YYYY.12.31');
        }
        var dateList = total_th_2 + "@" + total_th_1 + "@" + total_th_0 + "@" + total_th_5 + "@" + total_th_4  + "@" +  total_th_3;
        var data = {};

        console.log(dateList);

        data.dateList = dateList;
        data.slctType = $('input[name="slctType"]:checked').val();
        console.log(data);
        util.getAjaxData("total", "/rest/connect/login/info/total", data, fn_total_success);
    }

    function fn_total_success(data, response){
        dalbitLog(response);

        var tmp_date = new Date();
        tmp_date = moment(tmp_date).format("YYYY.MM.DD HH:mm:SS");
        var tmp_day = tmp_date.split(" ")[0];
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

                var maleCnt;
                var femaleCnt;
                var femaleAvg;
                var noneCnt;
                var totalCnt;

                if(detail.maleCnt != 0){
                    maleCnt = common.addComma(detail.maleCnt);
                }
                if(detail.femaleCnt !=0){
                    femaleCnt = common.addComma(detail.femaleCnt);
                    femaleAvg = common.average(detail.femaleCnt , detail.totalCnt) + "%";
                }
                if(detail.noneCnt !=0){
                    noneCnt = common.addComma(detail.noneCnt);
                }
                if(detail.totalCnt !=0){
                    totalCnt = common.addComma(detail.totalCnt);
                }

                if($('input[name="slctType"]:checked').val() == "0") {
                    // 상단
                    if (index == 0) {
                        $("#totalTableBody tr._tr_" + detail.hour + " td:eq(" + (index + 1) + ")").html(maleCnt);
                        $("#totalTableBody tr._tr_" + detail.hour + " td:eq(" + (index + 2) + ")").html(femaleCnt);
                        $("#totalTableBody tr._tr_" + detail.hour + " td:eq(" + (index + 3) + ")").html(femaleAvg);
                        $("#totalTableBody tr._tr_" + detail.hour + " td:eq(" + (index + 4) + ")").html(noneCnt);
                        $("#totalTableBody tr._tr_" + detail.hour + " td:eq(" + (index + 5) + ")").html(totalCnt);
                        if(tmp_time.split(":")[0] == detail.hour) {
                            $("#totalTableBody tr._tr_" + detail.hour + " td:eq(" + (index + 1) + ")").css("background-color", "#e3ecfb");
                            $("#totalTableBody tr._tr_" + detail.hour + " td:eq(" + (index + 2) + ")").css("background-color", "#e3ecfb");
                            $("#totalTableBody tr._tr_" + detail.hour + " td:eq(" + (index + 3) + ")").css("background-color", "#e3ecfb");
                            $("#totalTableBody tr._tr_" + detail.hour + " td:eq(" + (index + 4) + ")").css("background-color", "#e3ecfb");
                            $("#totalTableBody tr._tr_" + detail.hour + " td:eq(" + (index + 5) + ")").css("background-color", "#e3ecfb");
                        }
                    } else if (index == 1 || index == 2) {
                        $("#totalTableBody tr._tr_" + detail.hour + " td:eq(" + (index * 6 + 1) + ")").html(maleCnt);
                        $("#totalTableBody tr._tr_" + detail.hour + " td:eq(" + (index * 6 + 2) + ")").html(femaleCnt);
                        $("#totalTableBody tr._tr_" + detail.hour + " td:eq(" + (index * 6 + 3) + ")").html(femaleAvg);
                        $("#totalTableBody tr._tr_" + detail.hour + " td:eq(" + (index * 6 + 4) + ")").html(noneCnt);
                        $("#totalTableBody tr._tr_" + detail.hour + " td:eq(" + (index * 6 + 5) + ")").html(totalCnt);
                        if(tmp_time.split(":")[0] == detail.hour) {
                            $("#totalTableBody tr._tr_" + detail.hour + " td:eq(" + (index * 6 + 1) + ")").css("background-color", "#e3ecfb");
                            $("#totalTableBody tr._tr_" + detail.hour + " td:eq(" + (index * 6 + 2) + ")").css("background-color", "#e3ecfb");
                            $("#totalTableBody tr._tr_" + detail.hour + " td:eq(" + (index * 6 + 3) + ")").css("background-color", "#e3ecfb");
                            $("#totalTableBody tr._tr_" + detail.hour + " td:eq(" + (index * 6 + 4) + ")").css("background-color", "#e3ecfb");
                            $("#totalTableBody tr._tr_" + detail.hour + " td:eq(" + (index * 6 + 5) + ")").css("background-color", "#e3ecfb");
                        }
                    }
                    // 하단
                    if (index == 3) {
                        $("#totalTableBody2 tr._tr_" + detail.hour + " td:eq(" + (tmp_index + 1) + ")").html(maleCnt);
                        $("#totalTableBody2 tr._tr_" + detail.hour + " td:eq(" + (tmp_index + 2) + ")").html(femaleCnt);
                        $("#totalTableBody2 tr._tr_" + detail.hour + " td:eq(" + (tmp_index + 3) + ")").html(femaleAvg);
                        $("#totalTableBody2 tr._tr_" + detail.hour + " td:eq(" + (tmp_index + 4) + ")").html(noneCnt);
                        $("#totalTableBody2 tr._tr_" + detail.hour + " td:eq(" + (tmp_index + 5) + ")").html(totalCnt);
                        if(tmp_time.split(":")[0] == detail.hour) {
                            $("#totalTableBody2 tr._tr_" + detail.hour + " td:eq(" + (tmp_index + 1) + ")").css("background-color", "#e3ecfb");
                            $("#totalTableBody2 tr._tr_" + detail.hour + " td:eq(" + (tmp_index + 2) + ")").css("background-color", "#e3ecfb");
                            $("#totalTableBody2 tr._tr_" + detail.hour + " td:eq(" + (tmp_index + 3) + ")").css("background-color", "#e3ecfb");
                            $("#totalTableBody2 tr._tr_" + detail.hour + " td:eq(" + (tmp_index + 4) + ")").css("background-color", "#e3ecfb");
                            $("#totalTableBody2 tr._tr_" + detail.hour + " td:eq(" + (tmp_index + 5) + ")").css("background-color", "#e3ecfb");
                        }
                    }else if(index == 4 || index == 5){
                        $("#totalTableBody2 tr._tr_" + detail.hour + " td:eq(" + (tmp_index * 6 + 1) + ")").html(maleCnt);
                        $("#totalTableBody2 tr._tr_" + detail.hour + " td:eq(" + (tmp_index * 6 + 2) + ")").html(femaleCnt);
                        $("#totalTableBody2 tr._tr_" + detail.hour + " td:eq(" + (tmp_index * 6 + 3) + ")").html(femaleAvg);
                        $("#totalTableBody2 tr._tr_" + detail.hour + " td:eq(" + (tmp_index * 6 + 4) + ")").html(noneCnt);
                        $("#totalTableBody2 tr._tr_" + detail.hour + " td:eq(" + (tmp_index * 6 + 5) + ")").html(totalCnt);
                        if(tmp_time.split(":")[0] == detail.hour) {
                            $("#totalTableBody2 tr._tr_" + detail.hour + " td:eq(" + (tmp_index * 6 + 1) + ")").css("background-color", "#e3ecfb");
                            $("#totalTableBody2 tr._tr_" + detail.hour + " td:eq(" + (tmp_index * 6 + 2) + ")").css("background-color", "#e3ecfb");
                            $("#totalTableBody2 tr._tr_" + detail.hour + " td:eq(" + (tmp_index * 6 + 3) + ")").css("background-color", "#e3ecfb");
                            $("#totalTableBody2 tr._tr_" + detail.hour + " td:eq(" + (tmp_index * 6 + 4) + ")").css("background-color", "#e3ecfb");
                            $("#totalTableBody2 tr._tr_" + detail.hour + " td:eq(" + (tmp_index * 6 + 5) + ")").css("background-color", "#e3ecfb");
                        }
                    }
                    if(index == 2){
                        if((detail.hour > tmp_time.split(":")[0])) {
                            $("#totalTableBody tr._tr_" + detail.hour + " td:eq(" + (index * 6 + 1) + ")").html("");
                            $("#totalTableBody tr._tr_" + detail.hour + " td:eq(" + (index * 6 + 2) + ")").html("");
                            $("#totalTableBody tr._tr_" + detail.hour + " td:eq(" + (index * 6 + 3) + ")").html("");
                            $("#totalTableBody tr._tr_" + detail.hour + " td:eq(" + (index * 6 + 4) + ")").html("");
                            $("#totalTableBody tr._tr_" + detail.hour + " td:eq(" + (index * 6 + 5) + ")").html("");
                        }
                    }

                } else if($('input[name="slctType"]:checked').val() == "1"){
                    //상단
                    if (index == 0) {
                        $("#totalTableBody tr._tr_" + (detail.day) + " td:eq(" + (index + 1) + ")").html(maleCnt);
                        $("#totalTableBody tr._tr_" + (detail.day) + " td:eq(" + (index + 2) + ")").html(femaleCnt);
                        $("#totalTableBody tr._tr_" + (detail.day) + " td:eq(" + (index + 3) + ")").html(femaleAvg);
                        $("#totalTableBody tr._tr_" + (detail.day) + " td:eq(" + (index + 4) + ")").html(noneCnt);
                        $("#totalTableBody tr._tr_" + (detail.day) + " td:eq(" + (index + 5) + ")").html(totalCnt);
                    } else if (index == 1 || index == 2) {
                        $("#totalTableBody tr._tr_" + (detail.day) + " td:eq(" + (index * 6 + 1) + ")").html(maleCnt);
                        $("#totalTableBody tr._tr_" + (detail.day) + " td:eq(" + (index * 6 + 2) + ")").html(femaleCnt);
                        $("#totalTableBody tr._tr_" + (detail.day) + " td:eq(" + (index * 6 + 3) + ")").html(femaleAvg);
                        $("#totalTableBody tr._tr_" + (detail.day) + " td:eq(" + (index * 6 + 4) + ")").html(noneCnt);
                        $("#totalTableBody tr._tr_" + (detail.day) + " td:eq(" + (index * 6 + 5) + ")").html(totalCnt);
                    }

                    // 하단
                    if (index == 3) {
                        $("#totalTableBody2 tr._tr_" + (detail.day) + " td:eq(" + (tmp_index + 1) + ")").html(maleCnt);
                        $("#totalTableBody2 tr._tr_" + (detail.day) + " td:eq(" + (tmp_index + 2) + ")").html(femaleCnt);
                        $("#totalTableBody2 tr._tr_" + (detail.day) + " td:eq(" + (tmp_index + 3) + ")").html(femaleAvg);
                        $("#totalTableBody2 tr._tr_" + (detail.day) + " td:eq(" + (tmp_index + 4) + ")").html(noneCnt);
                        $("#totalTableBody2 tr._tr_" + (detail.day) + " td:eq(" + (tmp_index + 5) + ")").html(totalCnt);
                    } else if (index == 4 || index == 5){
                        $("#totalTableBody2 tr._tr_" + (detail.day) + " td:eq(" + (tmp_index * 6 + 1) + ")").html(maleCnt);
                        $("#totalTableBody2 tr._tr_" + (detail.day) + " td:eq(" + (tmp_index * 6 + 2) + ")").html(femaleCnt);
                        $("#totalTableBody2 tr._tr_" + (detail.day) + " td:eq(" + (tmp_index * 6 + 3) + ")").html(femaleAvg);
                        $("#totalTableBody2 tr._tr_" + (detail.day) + " td:eq(" + (tmp_index * 6 + 4) + ")").html(noneCnt);
                        $("#totalTableBody2 tr._tr_" + (detail.day) + " td:eq(" + (tmp_index * 6 + 5) + ")").html(totalCnt);
                    }
                } else if($('input[name="slctType"]:checked').val() == "2") {
                    //상단
                    if (index == 0) {
                        $("#totalTableBody tr._tr_" + (detail.month) + " td:eq(" + (index + 1) + ")").html(maleCnt);
                        $("#totalTableBody tr._tr_" + (detail.month) + " td:eq(" + (index + 2) + ")").html(femaleCnt);
                        $("#totalTableBody tr._tr_" + (detail.month) + " td:eq(" + (index + 3) + ")").html(femaleAvg);
                        $("#totalTableBody tr._tr_" + (detail.month) + " td:eq(" + (index + 4) + ")").html(noneCnt);
                        $("#totalTableBody tr._tr_" + (detail.month) + " td:eq(" + (index + 5) + ")").html(totalCnt);
                    } else if (index == 1 || index == 2) {
                        $("#totalTableBody tr._tr_" + (detail.month) + " td:eq(" + (index * 6 + 1) + ")").html(maleCnt);
                        $("#totalTableBody tr._tr_" + (detail.month) + " td:eq(" + (index * 6 + 2) + ")").html(femaleCnt);
                        $("#totalTableBody tr._tr_" + (detail.month) + " td:eq(" + (index * 6 + 3) + ")").html(femaleAvg);
                        $("#totalTableBody tr._tr_" + (detail.month) + " td:eq(" + (index * 6 + 4) + ")").html(noneCnt);
                        $("#totalTableBody tr._tr_" + (detail.month) + " td:eq(" + (index * 6 + 5) + ")").html(totalCnt);
                    }
                    //하단
                    if (index == 3){
                        $("#totalTableBody2 tr._tr_" + (detail.month) + " td:eq(" + (tmp_index + 1) + ")").html(maleCnt);
                        $("#totalTableBody2 tr._tr_" + (detail.month) + " td:eq(" + (tmp_index + 2) + ")").html(femaleCnt);
                        $("#totalTableBody2 tr._tr_" + (detail.month) + " td:eq(" + (tmp_index + 3) + ")").html(femaleAvg);
                        $("#totalTableBody2 tr._tr_" + (detail.month) + " td:eq(" + (tmp_index + 4) + ")").html(noneCnt);
                        $("#totalTableBody2 tr._tr_" + (detail.month) + " td:eq(" + (tmp_index + 5) + ")").html(totalCnt);
                    } else if (index == 4 || index == 5) {
                        $("#totalTableBody2 tr._tr_" + (detail.month) + " td:eq(" + (tmp_index * 6 + 1) + ")").html(maleCnt);
                        $("#totalTableBody2 tr._tr_" + (detail.month) + " td:eq(" + (tmp_index * 6 + 2) + ")").html(femaleCnt);
                        $("#totalTableBody2 tr._tr_" + (detail.month) + " td:eq(" + (tmp_index * 6 + 3) + ")").html(femaleAvg);
                        $("#totalTableBody2 tr._tr_" + (detail.month) + " td:eq(" + (tmp_index * 6 + 4) + ")").html(noneCnt);
                        $("#totalTableBody2 tr._tr_" + (detail.month) + " td:eq(" + (tmp_index * 6 + 5) + ")").html(totalCnt);
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

            if($('input[name="slctType"]:checked').val() == "0"){
                if(i == 0){
                    $("#totalTableBody tr:eq(0) td:eq(" + (i + 1) + ")").html(totalInfo.sum_maleCnt);
                    $("#totalTableBody tr:eq(0) td:eq(" + (i + 2) + ")").html(totalInfo.sum_femaleCnt);
                    $("#totalTableBody tr:eq(0) td:eq(" + (i + 3) + ")").html(common.average(totalInfo.sum_femaleCnt , totalInfo.sum_totalCnt) + "%");
                    $("#totalTableBody tr:eq(0) td:eq(" + (i + 4) + ")").html(totalInfo.sum_noneCnt);
                    $("#totalTableBody tr:eq(0) td:eq(" + (i + 5) + ")").html(totalInfo.sum_totalCnt);
                    $("#totalTableBody tr:eq(25) td:eq(" + (i + 1) + ")").html(totalInfo.sum_maleCnt);
                    $("#totalTableBody tr:eq(25) td:eq(" + (i + 2) + ")").html(totalInfo.sum_femaleCnt);
                    $("#totalTableBody tr:eq(25) td:eq(" + (i + 3) + ")").html(common.average(totalInfo.sum_femaleCnt , totalInfo.sum_totalCnt) + "%");
                    $("#totalTableBody tr:eq(25) td:eq(" + (i + 4) + ")").html(totalInfo.sum_noneCnt);
                    $("#totalTableBody tr:eq(25) td:eq(" + (i + 5) + ")").html(totalInfo.sum_totalCnt);
                }else if(i == 1 || i == 2){
                    $("#totalTableBody tr:eq(0) td:eq(" + (i * 6 + 1) + ")").html(totalInfo.sum_maleCnt);
                    $("#totalTableBody tr:eq(0) td:eq(" + (i * 6 + 2) + ")").html(totalInfo.sum_femaleCnt);
                    $("#totalTableBody tr:eq(0) td:eq(" + (i * 6 + 3) + ")").html(common.average(totalInfo.sum_femaleCnt , totalInfo.sum_totalCnt) + "%");
                    $("#totalTableBody tr:eq(0) td:eq(" + (i * 6 + 4) + ")").html(totalInfo.sum_noneCnt);
                    $("#totalTableBody tr:eq(0) td:eq(" + (i * 6 + 5) + ")").html(totalInfo.sum_totalCnt);
                    $("#totalTableBody tr:eq(25) td:eq(" + (i * 6 + 1) + ")").html(totalInfo.sum_maleCnt);
                    $("#totalTableBody tr:eq(25) td:eq(" + (i * 6 + 2) + ")").html(totalInfo.sum_femaleCnt);
                    $("#totalTableBody tr:eq(25) td:eq(" + (i * 6 + 3) + ")").html(common.average(totalInfo.sum_femaleCnt , totalInfo.sum_totalCnt) + "%");
                    $("#totalTableBody tr:eq(25) td:eq(" + (i * 6 + 4) + ")").html(totalInfo.sum_noneCnt);
                    $("#totalTableBody tr:eq(25) td:eq(" + (i * 6 + 5) + ")").html(totalInfo.sum_totalCnt);
                }
            } else if($('input[name="slctType"]:checked').val() == "1"){
                if(i == 0){
                    $("#totalTableBody tr:eq(0) td:eq(" + (i + 1) + ")").html(totalInfo.sum_maleCnt);
                    $("#totalTableBody tr:eq(0) td:eq(" + (i + 2) + ")").html(totalInfo.sum_femaleCnt);
                    $("#totalTableBody tr:eq(0) td:eq(" + (i + 3) + ")").html(common.average(totalInfo.sum_femaleCnt , totalInfo.sum_totalCnt) + "%");
                    $("#totalTableBody tr:eq(0) td:eq(" + (i + 4) + ")").html(totalInfo.sum_noneCnt);
                    $("#totalTableBody tr:eq(0) td:eq(" + (i + 5) + ")").html(totalInfo.sum_totalCnt);
                    $("#totalTableBody tr:eq(32) td:eq(" + (i + 1) + ")").html(totalInfo.sum_maleCnt);
                    $("#totalTableBody tr:eq(32) td:eq(" + (i + 2) + ")").html(totalInfo.sum_femaleCnt);
                    $("#totalTableBody tr:eq(32) td:eq(" + (i + 3) + ")").html(common.average(totalInfo.sum_femaleCnt , totalInfo.sum_totalCnt) + "%");
                    $("#totalTableBody tr:eq(32) td:eq(" + (i + 4) + ")").html(totalInfo.sum_noneCnt);
                    $("#totalTableBody tr:eq(32) td:eq(" + (i + 5) + ")").html(totalInfo.sum_totalCnt);
                }else if(i == 1 || i == 2){
                    $("#totalTableBody tr:eq(0) td:eq(" + (i * 6 + 1) + ")").html(totalInfo.sum_maleCnt);
                    $("#totalTableBody tr:eq(0) td:eq(" + (i * 6 + 2) + ")").html(totalInfo.sum_femaleCnt);
                    $("#totalTableBody tr:eq(0) td:eq(" + (i * 6 + 3) + ")").html(common.average(totalInfo.sum_femaleCnt , totalInfo.sum_totalCnt) + "%");
                    $("#totalTableBody tr:eq(0) td:eq(" + (i * 6 + 4) + ")").html(totalInfo.sum_noneCnt);
                    $("#totalTableBody tr:eq(0) td:eq(" + (i * 6 + 5) + ")").html(totalInfo.sum_totalCnt);
                    $("#totalTableBody tr:eq(32) td:eq(" + (i * 6 + 1) + ")").html(totalInfo.sum_maleCnt);
                    $("#totalTableBody tr:eq(32) td:eq(" + (i * 6 + 2) + ")").html(totalInfo.sum_femaleCnt);
                    $("#totalTableBody tr:eq(32) td:eq(" + (i * 6 + 3) + ")").html(common.average(totalInfo.sum_femaleCnt , totalInfo.sum_totalCnt) + "%");
                    $("#totalTableBody tr:eq(32) td:eq(" + (i * 6 + 4) + ")").html(totalInfo.sum_noneCnt);
                    $("#totalTableBody tr:eq(32) td:eq(" + (i * 6 + 5) + ")").html(totalInfo.sum_totalCnt);
                }
            } else if($('input[name="slctType"]:checked').val() == "2"){
                if(i == 0){
                    $("#totalTableBody tr:eq(0) td:eq(" + (i + 1) + ")").html(totalInfo.sum_maleCnt);
                    $("#totalTableBody tr:eq(0) td:eq(" + (i + 2) + ")").html(totalInfo.sum_femaleCnt);
                    $("#totalTableBody tr:eq(0) td:eq(" + (i + 3) + ")").html(common.average(totalInfo.sum_femaleCnt , totalInfo.sum_totalCnt) + "%");
                    $("#totalTableBody tr:eq(0) td:eq(" + (i + 4) + ")").html(totalInfo.sum_noneCnt);
                    $("#totalTableBody tr:eq(0) td:eq(" + (i + 5) + ")").html(totalInfo.sum_totalCnt);
                    $("#totalTableBody tr:eq(13) td:eq(" + (i + 1) + ")").html(totalInfo.sum_maleCnt);
                    $("#totalTableBody tr:eq(13) td:eq(" + (i + 2) + ")").html(totalInfo.sum_femaleCnt);
                    $("#totalTableBody tr:eq(13) td:eq(" + (i + 3) + ")").html(common.average(totalInfo.sum_femaleCnt , totalInfo.sum_totalCnt) + "%");
                    $("#totalTableBody tr:eq(13) td:eq(" + (i + 4) + ")").html(totalInfo.sum_noneCnt);
                    $("#totalTableBody tr:eq(13) td:eq(" + (i + 5) + ")").html(totalInfo.sum_totalCnt);
                }else if(i == 1 || i == 2){
                    $("#totalTableBody tr:eq(0) td:eq(" + (i * 6 + 1) + ")").html(totalInfo.sum_maleCnt);
                    $("#totalTableBody tr:eq(0) td:eq(" + (i * 6 + 2) + ")").html(totalInfo.sum_femaleCnt);
                    $("#totalTableBody tr:eq(0) td:eq(" + (i * 6 + 3) + ")").html(common.average(totalInfo.sum_femaleCnt , totalInfo.sum_totalCnt) + "%");
                    $("#totalTableBody tr:eq(0) td:eq(" + (i * 6 + 4) + ")").html(totalInfo.sum_noneCnt);
                    $("#totalTableBody tr:eq(0) td:eq(" + (i * 6 + 5) + ")").html(totalInfo.sum_totalCnt);
                    $("#totalTableBody tr:eq(13) td:eq(" + (i * 6 + 1) + ")").html(totalInfo.sum_maleCnt);
                    $("#totalTableBody tr:eq(13) td:eq(" + (i * 6 + 2) + ")").html(totalInfo.sum_femaleCnt);
                    $("#totalTableBody tr:eq(13) td:eq(" + (i * 6 + 3) + ")").html(common.average(totalInfo.sum_femaleCnt , totalInfo.sum_totalCnt) + "%");
                    $("#totalTableBody tr:eq(13) td:eq(" + (i * 6 + 4) + ")").html(totalInfo.sum_noneCnt);
                    $("#totalTableBody tr:eq(13) td:eq(" + (i * 6 + 5) + ")").html(totalInfo.sum_totalCnt);
                }
            }

            // 하단
            if($('input[name="slctType"]:checked').val() == "0"){
                if(i == 3){
                    $("#totalTableBody2 tr:eq(0) td:eq(" + (1) + ")").html(totalInfo.sum_maleCnt);
                    $("#totalTableBody2 tr:eq(0) td:eq(" + (2) + ")").html(totalInfo.sum_femaleCnt);
                    $("#totalTableBody2 tr:eq(0) td:eq(" + (3) + ")").html(common.average(totalInfo.sum_femaleCnt , totalInfo.sum_totalCnt) + "%");
                    $("#totalTableBody2 tr:eq(0) td:eq(" + (4) + ")").html(totalInfo.sum_noneCnt);
                    $("#totalTableBody2 tr:eq(0) td:eq(" + (5) + ")").html(totalInfo.sum_totalCnt);
                    $("#totalTableBody2 tr:eq(25) td:eq(" + (1) + ")").html(totalInfo.sum_maleCnt);
                    $("#totalTableBody2 tr:eq(25) td:eq(" + (2) + ")").html(totalInfo.sum_femaleCnt);
                    $("#totalTableBody2 tr:eq(25) td:eq(" + (3) + ")").html(common.average(totalInfo.sum_femaleCnt , totalInfo.sum_totalCnt) + "%");
                    $("#totalTableBody2 tr:eq(25) td:eq(" + (4) + ")").html(totalInfo.sum_noneCnt);
                    $("#totalTableBody2 tr:eq(25) td:eq(" + (5) + ")").html(totalInfo.sum_totalCnt);
                }else if(i == 4 || i == 5){
                    $("#totalTableBody2 tr:eq(0) td:eq(" + (tmp_index * 6 + 1) + ")").html(totalInfo.sum_maleCnt);
                    $("#totalTableBody2 tr:eq(0) td:eq(" + (tmp_index * 6 + 2) + ")").html(totalInfo.sum_femaleCnt);
                    $("#totalTableBody2 tr:eq(0) td:eq(" + (tmp_index * 6 + 3) + ")").html(common.average(totalInfo.sum_femaleCnt , totalInfo.sum_totalCnt) + "%");
                    $("#totalTableBody2 tr:eq(0) td:eq(" + (tmp_index * 6 + 4) + ")").html(totalInfo.sum_noneCnt);
                    $("#totalTableBody2 tr:eq(0) td:eq(" + (tmp_index * 6 + 5) + ")").html(totalInfo.sum_totalCnt);
                    $("#totalTableBody2 tr:eq(25) td:eq(" + (tmp_index * 6 + 1) + ")").html(totalInfo.sum_maleCnt);
                    $("#totalTableBody2 tr:eq(25) td:eq(" + (tmp_index * 6 + 2) + ")").html(totalInfo.sum_femaleCnt);
                    $("#totalTableBody2 tr:eq(25) td:eq(" + (tmp_index * 6 + 3) + ")").html(common.average(totalInfo.sum_femaleCnt , totalInfo.sum_totalCnt) + "%");
                    $("#totalTableBody2 tr:eq(25) td:eq(" + (tmp_index * 6 + 4) + ")").html(totalInfo.sum_noneCnt);
                    $("#totalTableBody2 tr:eq(25) td:eq(" + (tmp_index * 6 + 5) + ")").html(totalInfo.sum_totalCnt);
                }
            } else if($('input[name="slctType"]:checked').val() == "1"){
                if(i == 3){
                    $("#totalTableBody2 tr:eq(0) td:eq(" + (1) + ")").html(totalInfo.sum_maleCnt);
                    $("#totalTableBody2 tr:eq(0) td:eq(" + (2) + ")").html(totalInfo.sum_femaleCnt);
                    $("#totalTableBody2 tr:eq(0) td:eq(" + (3) + ")").html(common.average(totalInfo.sum_femaleCnt , totalInfo.sum_totalCnt) + "%");
                    $("#totalTableBody2 tr:eq(0) td:eq(" + (4) + ")").html(totalInfo.sum_noneCnt);
                    $("#totalTableBody2 tr:eq(0) td:eq(" + (5) + ")").html(totalInfo.sum_totalCnt);
                    $("#totalTableBody2 tr:eq(32) td:eq(" + (1) + ")").html(totalInfo.sum_maleCnt);
                    $("#totalTableBody2 tr:eq(32) td:eq(" + (2) + ")").html(totalInfo.sum_femaleCnt);
                    $("#totalTableBody2 tr:eq(32) td:eq(" + (3) + ")").html(common.average(totalInfo.sum_femaleCnt , totalInfo.sum_totalCnt) + "%");
                    $("#totalTableBody2 tr:eq(32) td:eq(" + (4) + ")").html(totalInfo.sum_noneCnt);
                    $("#totalTableBody2 tr:eq(32) td:eq(" + (5) + ")").html(totalInfo.sum_totalCnt);
                }else if(i == 4 || i == 5){
                    $("#totalTableBody2 tr:eq(0) td:eq(" + (tmp_index * 6 + 1) + ")").html(totalInfo.sum_maleCnt);
                    $("#totalTableBody2 tr:eq(0) td:eq(" + (tmp_index * 6 + 2) + ")").html(totalInfo.sum_femaleCnt);
                    $("#totalTableBody2 tr:eq(0) td:eq(" + (tmp_index * 6 + 3) + ")").html(common.average(totalInfo.sum_femaleCnt , totalInfo.sum_totalCnt) + "%");
                    $("#totalTableBody2 tr:eq(0) td:eq(" + (tmp_index * 6 + 4) + ")").html(totalInfo.sum_noneCnt);
                    $("#totalTableBody2 tr:eq(0) td:eq(" + (tmp_index * 6 + 5) + ")").html(totalInfo.sum_totalCnt);
                    $("#totalTableBody2 tr:eq(32) td:eq(" + (tmp_index * 6 + 1) + ")").html(totalInfo.sum_maleCnt);
                    $("#totalTableBody2 tr:eq(32) td:eq(" + (tmp_index * 6 + 2) + ")").html(totalInfo.sum_femaleCnt);
                    $("#totalTableBody2 tr:eq(32) td:eq(" + (tmp_index * 6 + 3) + ")").html(common.average(totalInfo.sum_femaleCnt , totalInfo.sum_totalCnt) + "%");
                    $("#totalTableBody2 tr:eq(32) td:eq(" + (tmp_index * 6 + 4) + ")").html(totalInfo.sum_noneCnt);
                    $("#totalTableBody2 tr:eq(32) td:eq(" + (tmp_index * 6 + 5) + ")").html(totalInfo.sum_totalCnt);
                }
            } else if($('input[name="slctType"]:checked').val() == "2"){
                if(i == 3){
                    $("#totalTableBody2 tr:eq(0) td:eq(" + (1) + ")").html(totalInfo.sum_maleCnt);
                    $("#totalTableBody2 tr:eq(0) td:eq(" + (2) + ")").html(totalInfo.sum_femaleCnt);
                    $("#totalTableBody2 tr:eq(0) td:eq(" + (3) + ")").html(common.average(totalInfo.sum_femaleCnt , totalInfo.sum_totalCnt) + "%");
                    $("#totalTableBody2 tr:eq(0) td:eq(" + (4) + ")").html(totalInfo.sum_noneCnt);
                    $("#totalTableBody2 tr:eq(0) td:eq(" + (5) + ")").html(totalInfo.sum_totalCnt);
                    $("#totalTableBody2 tr:eq(13) td:eq(" + (1) + ")").html(totalInfo.sum_maleCnt);
                    $("#totalTableBody2 tr:eq(13) td:eq(" + (2) + ")").html(totalInfo.sum_femaleCnt);
                    $("#totalTableBody2 tr:eq(13) td:eq(" + (3) + ")").html(common.average(totalInfo.sum_femaleCnt , totalInfo.sum_totalCnt) + "%");
                    $("#totalTableBody2 tr:eq(13) td:eq(" + (4) + ")").html(totalInfo.sum_noneCnt);
                    $("#totalTableBody2 tr:eq(13) td:eq(" + (5) + ")").html(totalInfo.sum_totalCnt);
                }else if(i == 4 || i == 5){
                    $("#totalTableBody2 tr:eq(0) td:eq(" + (tmp_index * 6 + 1) + ")").html(totalInfo.sum_maleCnt);
                    $("#totalTableBody2 tr:eq(0) td:eq(" + (tmp_index * 6 + 2) + ")").html(totalInfo.sum_femaleCnt);
                    $("#totalTableBody2 tr:eq(0) td:eq(" + (tmp_index * 6 + 3) + ")").html(common.average(totalInfo.sum_femaleCnt , totalInfo.sum_totalCnt) + "%");
                    $("#totalTableBody2 tr:eq(0) td:eq(" + (tmp_index * 6 + 4) + ")").html(totalInfo.sum_noneCnt);
                    $("#totalTableBody2 tr:eq(0) td:eq(" + (tmp_index * 6 + 5) + ")").html(totalInfo.sum_totalCnt);
                    $("#totalTableBody2 tr:eq(13) td:eq(" + (tmp_index * 6 + 1) + ")").html(totalInfo.sum_maleCnt);
                    $("#totalTableBody2 tr:eq(13) td:eq(" + (tmp_index * 6 + 2) + ")").html(totalInfo.sum_femaleCnt);
                    $("#totalTableBody2 tr:eq(13) td:eq(" + (tmp_index * 6 + 3) + ")").html(common.average(totalInfo.sum_femaleCnt , totalInfo.sum_totalCnt) + "%");
                    $("#totalTableBody2 tr:eq(13) td:eq(" + (tmp_index * 6 + 4) + ")").html(totalInfo.sum_noneCnt);
                    $("#totalTableBody2 tr:eq(13) td:eq(" + (tmp_index * 6 + 5) + ")").html(totalInfo.sum_totalCnt);
                }
            }
        }
        // tableHeightSet();
        ui.tableHeightSet();
    }
</script>


<script type="text/x-handlebars-template" id="tmp_dummyTotalDetailList">
    <tr class="_tr_{{this}} font-bold" style="color: #ff5600;background-color: #f2f2f2">
        <td>총합</td>
        <td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td style="border-bottom: hidden;border-top: hidden;background-color: white"></td>
        <td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td style="border-bottom: hidden;border-top: hidden;background-color: white"></td>
        <td>o</td><td>0</td><td>0</td><td>0</td><td>0</td>
    </tr>
    {{#each this.slctType_date}}
    <tr class="_tr_{{this}}">
        <td class="font-bold"  style="background-color: #dae3f3">{{this}}</td>
        <td></td><td></td><td></td><td></td><td></td><td style="border-bottom: hidden;border-top: hidden"></td>
        <td></td><td></td><td></td><td></td><td></td><td style="border-bottom: hidden;border-top: hidden"></td>
        <td style="background-color: #FFF7E5"></td><td style="background-color: #FFF7E5"></td><td style="background-color: #FFF7E5"></td><td style="background-color: #FFF7E5"></td><td style="background-color: #FFF7E5"></td>
    </tr>
    {{/each}}
    <tr class="_tr_{{this}} font-bold" style="color: #ff5600;background-color: #f2f2f2">
        <td>총합</td>
        <td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td style="border-bottom: hidden;border-top: hidden;background-color: white"></td>
        <td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td style="border-bottom: hidden;border-top: hidden;background-color: white"></td>
        <td>0</td><td>0</td><td>0</td><td>0</td><td>0</td>
    </tr>
</script>

<script type="text/x-handlebars-template" id="tmp_dummyTotalDetailList2">
    <tr class="_tr_{{this}} font-bold" style="color: #ff5600;background-color: #f2f2f2">
        <td>총합</td>
        <td></td><td></td><td></td><td></td><td></td><td style="border-bottom: hidden;border-top: hidden;background-color: white"></td>
        <td></td><td></td><td></td><td></td><td></td><td style="border-bottom: hidden;border-top: hidden;background-color: white"></td>
        <td></td><td></td><td></td><td></td><td></td>
    </tr>
    {{#each this.slctType_date}}
    <tr class="_tr_{{this}}">
        <td class="font-bold" style="background-color: #dae3f3">{{this}}</td>
        <td></td><td></td><td></td><td></td><td></td><td style="border-bottom: hidden;border-top: hidden"></td>
        <td></td><td></td><td></td><td></td><td></td><td style="border-bottom: hidden;border-top: hidden"></td>
        <td></td><td></td><td></td><td></td><td></td>
    </tr>
    {{/each}}
    <tr class="_tr_{{this}} font-bold" style="color: #ff5600;background-color: #f2f2f2">
        <td>총합</td>
        <td></td><td></td><td></td><td></td><td></td><td style="border-bottom: hidden;border-top: hidden;background-color: white"></td>
        <td></td><td></td><td></td><td></td><td></td><td style="border-bottom: hidden;border-top: hidden;background-color: white"></td>
        <td></td><td></td><td></td><td></td><td></td>
    </tr>
</script>