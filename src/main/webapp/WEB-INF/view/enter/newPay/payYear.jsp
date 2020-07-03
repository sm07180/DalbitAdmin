<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 결제환불 > 총계 -->
<div class="widget widget-table mb10">
    <div class="widget-content mt10">
        <%--<a href="javascript://" class="_prevSearch">[이전]</a>--%>
        <span class="_searchDate"></span>
        <%--<a href="javascript://" class="_nextSearch">[다음]</a>--%>
        <table class="table table-bordered mb0 _tableHeight" data-height="23px">
            <colgroup>
                <col width="5%"/><col width="5%"/><col width="5%"/><col width="5%"/><col width="5%"/>
                <col width="0.1%"/><col width="5%"/><col width="5%"/><col width="5%"/><col width="5%"/>
                <col width="0.1%"/><col width="5%"/><col width="5%"/><col width="5%"/><col width="5%"/>
                <col width="0.1%"/><col width="5%"/><col width="5%"/><col width="5%"/><col width="5%"/>
            </colgroup>
            <thead>
            <tr style="background-color: #b4c7e7">
                <th rowspan="2"></th>
                <th class="_totalDate" colspan="4" id="year_th_2"></th><td class="_noBorder"></td>
                <th class="_totalDate" colspan="4" id="year_th_1"></th><td class="_noBorder"></td>
                <th class="_totalDate" colspan="4" id="year_th_0" style="background-color: #ffe699"></th><td class="_noBorder"></td>
                <th colspan="4" title="평균 합계의 경우 반올림된 평균 데이터의 총합이라&#10;항목별 합계와 다소 오차가 생길 수 있습니다.">평균</th>
            </tr>
            <tr style="background-color: #dae3f3">
                <th>건수</th>
                <th>결제</th>
                <th>누적</th>
                <th>환불</th>
                <td class="_noBorder"></td>

                <th>건수</th>
                <th>결제</th>
                <th>누적</th>
                <th>환불</th>
                <td class="_noBorder"></td>

                <th style="background-color: #fff2cc">건수</th>
                <th style="background-color: #fff2cc">결제</th>
                <th style="background-color: #fff2cc">누적</th>
                <th style="background-color: #fff2cc">환불</th>
                <td class="_noBorder"></td>

                <th title="평균 합계의 경우 반올림된 평균 데이터의 총합이라&#10;항목별 합계와 다소 오차가 생길 수 있습니다.">건수</th>
                <th title="평균 합계의 경우 반올림된 평균 데이터의 총합이라&#10;항목별 합계와 다소 오차가 생길 수 있습니다.">결제</th>
                <th title="평균 합계의 경우 반올림된 평균 데이터의 총합이라&#10;항목별 합계와 다소 오차가 생길 수 있습니다.">누적</th>
                <th title="평균 합계의 경우 반올림된 평균 데이터의 총합이라&#10;항목별 합계와 다소 오차가 생길 수 있습니다.">환불</th>

            </tr>
            </thead>
            <tbody id="yearTableBody"></tbody>
        </table>

        <table class="table table-bordered _tableHeight" data-height="23px">
            <colgroup>
                <col width="5%"/><col width="5%"/><col width="5%"/><col width="5%"/><col width="5%"/>
                <col width="0.1%"/><col width="5%"/><col width="5%"/><col width="5%"/><col width="5%"/>
                <col width="0.1%"/><col width="5%"/><col width="5%"/><col width="5%"/><col width="5%"/>
                <col width="0.1%"/><col width="5%"/><col width="5%"/><col width="5%"/><col width="5%"/>
            </colgroup>
            <thead>
            <tr style="background-color: #b4c7e7">
                <th rowspan="2"></th>
                <th class="_totalDate" colspan="4" id="year_th_6"></th><td class="_noBorder"></td>
                <th class="_totalDate" colspan="4" id="year_th_5"></th><td class="_noBorder"></td>
                <th class="_totalDate" colspan="4" id="year_th_4"></th><td class="_noBorder"></td>
                <th class="_totalDate" colspan="4" id="year_th_3"></th>
            </tr>
            <tr style="background-color: #dae3f3">
                <th>건수</th>
                <th>결제</th>
                <th>누적</th>
                <th>환불</th>
                <td class="_noBorder"></td>

                <th>건수</th>
                <th>결제</th>
                <th>누적</th>
                <th>환불</th>
                <td class="_noBorder"></td>

                <th>건수</th>
                <th>결제</th>
                <th>누적</th>
                <th>환불</th>
                <td class="_noBorder"></td>

                <th>건수</th>
                <th>결제</th>
                <th>누적</th>
                <th>환불</th>

            </tr>
            </thead>
            <tbody id="yearTableBody2"></tbody>
        </table>
    </div>
    <div class="widget-footer">
        <span>
            <%--<button class="btn btn-default print-btn pull-right" type="button" id="excelDownBtn"><i class="fa fa-print"></i>Excel Down</button>--%>
        </span>
    </div>
</div>

<script type="text/javascript">
    $(function() {
    });

    function getPayYearList(){
        var slctType_date = [];
        for(i = 12; 0 < i; i-- ){
            slctType_date.push(i + " 월");
        }
        data = {
            slctType_date : slctType_date
        };

        var template = $('#tmp_yearTableBody').html();
        var templateScript = Handlebars.compile(template);
        var context = data;
        var html=templateScript(context);
        $("#yearTableBody").html(html);

        var template = $('#tmp_yearTableBody2').html();
        var templateScript = Handlebars.compile(template);
        var context = data;
        var html=templateScript(context);
        $("#yearTableBody2").html(html);


        $("#year_th_6").text(moment($("#startDate").val()).add('years', -6).format('YYYY'));
        $("#year_th_5").text(moment($("#startDate").val()).add('years', -5).format('YYYY'));
        $("#year_th_4").text(moment($("#startDate").val()).add('years', -4).format('YYYY'));
        $("#year_th_3").text(moment($("#startDate").val()).add('years', -3).format('YYYY'));
        $("#year_th_2").text(moment($("#startDate").val()).add('years', -2).format('YYYY'));
        $("#year_th_1").text(moment($("#startDate").val()).add('years', -1).format('YYYY'));
        $("#year_th_0").text(moment($("#startDate").val()).add('years', 0).format('YYYY'));

        var total_th_6 = moment($("#startDate").val()).add('years', -6).format('YYYY.01.01') + "-" + moment($("#startDate").val()).add('years', -6).format('YYYY.12.31');
        var total_th_5 = moment($("#startDate").val()).add('years', -5).format('YYYY.01.01') + "-" + moment($("#startDate").val()).add('years', -5).format('YYYY.12.31');
        var total_th_4 = moment($("#startDate").val()).add('years', -4).format('YYYY.01.01') + "-" + moment($("#startDate").val()).add('years', -4).format('YYYY.12.31');
        var total_th_3 = moment($("#startDate").val()).add('years', -3).format('YYYY.01.01') + "-" + moment($("#startDate").val()).add('years', -3).format('YYYY.12.31');
        var total_th_2 = moment($("#startDate").val()).add('years', -2).format('YYYY.01.01') + "-" + moment($("#startDate").val()).add('years', -2).format('YYYY.12.31');
        var total_th_1 = moment($("#startDate").val()).add('years', -1).format('YYYY.01.01') + "-" + moment($("#startDate").val()).add('years', -1).format('YYYY.12.31');
        var total_th_0 = moment($("#startDate").val()).add('years', 0).format('YYYY.01.01') + "-" + moment($("#startDate").val()).add('years', 0).format('YYYY.12.31');

        var dateList = total_th_2 + "@" + total_th_1 + "@" + total_th_0 + "@" + total_th_6 + "@" + total_th_5 + "@" + total_th_4  + "@" +  total_th_3;
        var data = {};

        data.dateList = dateList;
        data.slctType = 2;

        console.log(data);
        util.getAjaxData("total", "/rest/enter/pay/total", data, fn_payYear_success);
    }

    function fn_payYear_success(data, response){
        tmp_index = -1;
        var title = "평균 합계의 경우 반올림된 평균 데이터의 총합이라\n항목별 합계와 다소 오차가 생길 수 있습니다.";

        var tmp_date = new Date();
        tmp_date = moment(tmp_date).format("YYYY.MM.DD HH:mm:SS");
        var tmp_day = tmp_date.split(" ")[0];
        var tmp_time = tmp_date.split(" ")[1];

        console.log("------------------------------------");

        response.data.forEach(function(data, index){
            if(index > 2){
                ++tmp_index;
            }
            data.detailList.forEach(function(detail, detailIndex){
                if(detail.succAmt == 0){
                    detail.accumAmt = 0;
                }
                $("#yearTableBody tr._tr_" + detail.hour + " td:eq(" + (3 * 5 + 1) + ")").attr('title',title);
                $("#yearTableBody tr._tr_" + detail.hour + " td:eq(" + (3 * 5 + 2) + ")").attr('title',title);
                $("#yearTableBody tr._tr_" + detail.hour + " td:eq(" + (3 * 5 + 3) + ")").attr('title',title);
                $("#yearTableBody tr._tr_" + detail.hour + " td:eq(" + (3 * 5 + 4) + ")").attr('title',title);

                var succCnt = detail.succCnt;
                var succAmt = detail.succAmt;
                var accumAmt = detail.accumAmt;
                if(succCnt == 0)
                    succCnt = "null";
                if(succAmt == 0)
                    succAmt = "null";
                if(accumAmt == 0)
                    accumAmt = "null";

                //상단
                if (index == 0) {
                    $("#yearTableBody tr._tr_" + (detail.monthly) + " td:eq(" + (index + 1) + ")").html(common.addComma(succCnt));
                    $("#yearTableBody tr._tr_" + (detail.monthly) + " td:eq(" + (index + 2) + ")").html(common.vatMinus(succAmt));
                    $("#yearTableBody tr._tr_" + (detail.monthly) + " td:eq(" + (index + 3) + ")").html(common.vatMinus(accumAmt));
                    $("#yearTableBody tr._tr_" + (detail.monthly) + " td:eq(" + (index + 4) + ")").html();
                    for (var i = 1; i < 5; i++) {
                        $("#yearTableBody tr:eq(" + (15 - Number(tmp_day.split(".")[1])) + ") td:eq(" + (index + i) + ")").css("background-color", "#e3ecfb");
                        $("#yearTableBody tr:eq(" + (15 - Number(tmp_day.split(".")[1])) + ") td:eq(" + (index + i) + ")").css("font-weight", "bold");
                    }
                } else if (index == 1 || index == 2) {
                    $("#yearTableBody tr._tr_" + (detail.monthly) + " td:eq(" + (index * 5 + 1) + ")").html(common.addComma(succCnt));
                    $("#yearTableBody tr._tr_" + (detail.monthly) + " td:eq(" + (index * 5 + 2) + ")").html(common.vatMinus(succAmt));
                    $("#yearTableBody tr._tr_" + (detail.monthly) + " td:eq(" + (index * 5 + 3) + ")").html(common.vatMinus(accumAmt));
                    $("#yearTableBody tr._tr_" + (detail.monthly) + " td:eq(" + (index * 5 + 4) + ")").html();
                    for (var i = 1; i < 5; i++) {
                        $("#yearTableBody tr:eq(" + (15 - Number(tmp_day.split(".")[1])) + ") td:eq(" + (index * 5 + i) + ")").css("background-color", "#e3ecfb");
                        $("#yearTableBody tr:eq(" + (15 - Number(tmp_day.split(".")[1])) + ") td:eq(" + (index * 5 + i) + ")").css("font-weight", "bold");
                    }
                } else if(index == 7) {
                    $("#yearTableBody tr._tr_" + (detail.monthly) + " td:eq(" + (3 * 5 + 1) + ")").html(common.addComma((succCnt/7).toFixed(1)));
                    $("#yearTableBody tr._tr_" + (detail.monthly) + " td:eq(" + (3 * 5 + 2) + ")").html(common.vatMinus(succAmt/7));
                    $("#yearTableBody tr._tr_" + (detail.monthly) + " td:eq(" + (3 * 5 + 3) + ")").html(common.vatMinus(accumAmt/7));
                    $("#yearTableBody tr._tr_" + (detail.monthly) + " td:eq(" + (3 * 5 + 4) + ")").html();
                    for (var i = 1; i < 5; i++) {
                        $("#yearTableBody tr:eq(" + (15 - Number(tmp_day.split(".")[1])) + ") td:eq(" + (3 * 5 + i) + ")").css("background-color", "#e3ecfb");
                        $("#yearTableBody tr:eq(" + (15 - Number(tmp_day.split(".")[1])) + ") td:eq(" + (3 * 5 + i) + ")").css("font-weight", "bold");
                    }
                }
                //하단
                if (index == 3){
                    $("#yearTableBody2 tr._tr_" + (detail.monthly) + " td:eq(" + (tmp_index + 1) + ")").html(common.addComma(succCnt));
                    $("#yearTableBody2 tr._tr_" + (detail.monthly) + " td:eq(" + (tmp_index + 2) + ")").html(common.vatMinus(succAmt));
                    $("#yearTableBody2 tr._tr_" + (detail.monthly) + " td:eq(" + (tmp_index + 3) + ")").html(common.vatMinus(accumAmt));
                    $("#yearTableBody2 tr._tr_" + (detail.monthly) + " td:eq(" + (tmp_index + 4) + ")").html();
                    for (var i = 1; i < 5; i++) {
                        $("#yearTableBody2 tr:eq(" + (15 - Number(tmp_day.split(".")[1])) + ") td:eq(" + (tmp_index + i) + ")").css("background-color", "#e3ecfb");
                        $("#yearTableBody2 tr:eq(" + (15 - Number(tmp_day.split(".")[1])) + ") td:eq(" + (tmp_index + i) + ")").css("font-weight", "bold");
                    }
                } else if (index == 4 || index == 5 || index == 6) {
                    $("#yearTableBody2 tr._tr_" + (detail.monthly) + " td:eq(" + (tmp_index * 5 + 1) + ")").html(common.addComma(succCnt));
                    $("#yearTableBody2 tr._tr_" + (detail.monthly) + " td:eq(" + (tmp_index * 5 + 2) + ")").html(common.vatMinus(succAmt));
                    $("#yearTableBody2 tr._tr_" + (detail.monthly) + " td:eq(" + (tmp_index * 5 + 3) + ")").html(common.vatMinus(accumAmt));
                    $("#yearTableBody2 tr._tr_" + (detail.monthly) + " td:eq(" + (tmp_index * 5 + 4) + ")").html();
                    for (var i = 1; i < 5; i++) {
                        $("#yearTableBody2 tr:eq(" + (15 - Number(tmp_day.split(".")[1])) + ") td:eq(" + (tmp_index * 5 + i) + ")").css("background-color", "#e3ecfb");
                        $("#yearTableBody2 tr:eq(" + (15 - Number(tmp_day.split(".")[1])) + ") td:eq(" + (tmp_index * 5 + i) + ")").css("font-weight", "bold");
                    }
                }
            });
        });

        tmp_index = -1;
        for(var i=0 ; i<response.data.length;i++){
            var totalInfo = response.data[i].totalInfo;
            if(i > 2){
                ++tmp_index;
            }

            var sum_succCnt = totalInfo.sum_succCnt;
            var sum_succAmt = totalInfo.sum_succAmt;
            var sum_firstCnt = totalInfo.sum_firstCnt;
            var sum_firstAmt = totalInfo.sum_firstAmt;
            var sum_reCnt = totalInfo.sum_reCnt;
            var sum_reAmt = totalInfo.sum_reAmt;

            if(sum_succCnt == 0)
                sum_succCnt = "null";
            if(sum_succAmt == 0)
                sum_succAmt = "null";
            if(sum_firstCnt == 0)
                sum_firstCnt = "null";
            if(sum_firstAmt == 0)
                sum_firstAmt = "null";
            if(sum_reCnt == 0)
                sum_reCnt = "null";
            if(sum_reAmt == 0)
                sum_reAmt = "null";

            if(i == 0){
                //총합
                $("#yearTableBody tr:eq(0) td:eq(" + (i + 1) + ")").html(common.addComma(sum_succCnt));
                $("#yearTableBody tr:eq(0) td:eq(" + (i + 2) + ")").html(common.vatMinus(sum_succAmt));
                $("#yearTableBody tr:eq(0) td:eq(" + (i + 3) + ")").html();
                //첫구매
                $("#yearTableBody tr:eq(1) td:eq(" + (i + 1) + ")").html(common.addComma(sum_firstCnt));
                $("#yearTableBody tr:eq(1) td:eq(" + (i + 2) + ")").html(common.vatMinus(sum_firstAmt));
                $("#yearTableBody tr:eq(1) td:eq(" + (i + 3) + ")").html();
                //재구매
                $("#yearTableBody tr:eq(2) td:eq(" + (i + 1) + ")").html(common.addComma(sum_reCnt));
                $("#yearTableBody tr:eq(2) td:eq(" + (i + 2) + ")").html(common.vatMinus(sum_reAmt));
                $("#yearTableBody tr:eq(2) td:eq(" + (i + 3) + ")").html();
            }else if(i == 1 || i == 2) {
                //총합
                $("#yearTableBody tr:eq(0) td:eq(" + (i * 4 + 1) + ")").html(common.addComma(sum_succCnt));
                $("#yearTableBody tr:eq(0) td:eq(" + (i * 4 + 2) + ")").html(common.vatMinus(sum_succAmt));
                $("#yearTableBody tr:eq(0) td:eq(" + (i * 4 + 3) + ")").html();
                //첫구매
                $("#yearTableBody tr:eq(1) td:eq(" + (i * 4 + 1) + ")").html(common.addComma(sum_firstCnt));
                $("#yearTableBody tr:eq(1) td:eq(" + (i * 4 + 2) + ")").html(common.vatMinus(sum_firstAmt));
                $("#yearTableBody tr:eq(1) td:eq(" + (i * 4 + 3) + ")").html();
                //재구매
                $("#yearTableBody tr:eq(2) td:eq(" + (i * 4 + 1) + ")").html(common.addComma(sum_reCnt));
                $("#yearTableBody tr:eq(2) td:eq(" + (i * 4 + 2) + ")").html(common.vatMinus(sum_reAmt));
                $("#yearTableBody tr:eq(2) td:eq(" + (i * 4 + 3) + ")").html();
            }else if(i == 7){
                //총합
                $("#yearTableBody tr:eq(0) td:eq(" + (3 * 4 + 1) + ")").html(common.addComma((sum_succCnt/7).toFixed(1)));
                $("#yearTableBody tr:eq(0) td:eq(" + (3 * 4 + 2) + ")").html(common.vatMinus(sum_succAmt/7));
                $("#yearTableBody tr:eq(0) td:eq(" + (3 * 4 + 3) + ")").html();
                //첫구매
                $("#yearTableBody tr:eq(1) td:eq(" + (3 * 4 + 1) + ")").html(common.addComma((sum_firstCnt/7).toFixed(1)));
                $("#yearTableBody tr:eq(1) td:eq(" + (3 * 4 + 2) + ")").html(common.vatMinus(sum_firstAmt/7));
                $("#yearTableBody tr:eq(1) td:eq(" + (3 * 4 + 3) + ")").html();
                //재구매
                $("#yearTableBody tr:eq(2) td:eq(" + (3 * 4 + 1) + ")").html(common.addComma((sum_reCnt/7).toFixed(1)));
                $("#yearTableBody tr:eq(2) td:eq(" + (3 * 4 + 2) + ")").html(common.vatMinus(sum_reAmt/7));
                $("#yearTableBody tr:eq(2) td:eq(" + (3 * 4 + 3) + ")").html();
            }

            if(i == 3){
                //총합
                $("#yearTableBody2 tr:eq(0) td:eq(" + (tmp_index + 1) + ")").html(common.addComma(sum_succCnt));
                $("#yearTableBody2 tr:eq(0) td:eq(" + (tmp_index + 2) + ")").html(common.vatMinus(sum_succAmt));
                $("#yearTableBody2 tr:eq(0) td:eq(" + (tmp_index + 3) + ")").html();
                //첫구매
                $("#yearTableBody2 tr:eq(1) td:eq(" + (tmp_index + 1) + ")").html(common.addComma(sum_firstCnt));
                $("#yearTableBody2 tr:eq(1) td:eq(" + (tmp_index + 2) + ")").html(common.vatMinus(sum_firstAmt));
                $("#yearTableBody2 tr:eq(1) td:eq(" + (tmp_index + 3) + ")").html();
                //재구매
                $("#yearTableBody2 tr:eq(2) td:eq(" + (tmp_index + 1) + ")").html(common.addComma(sum_reCnt));
                $("#yearTableBody2 tr:eq(2) td:eq(" + (tmp_index + 2) + ")").html(common.vatMinus(sum_reAmt));
                $("#yearTableBody2 tr:eq(2) td:eq(" + (tmp_index + 3) + ")").html();
            }else if(i == 4 || i == 5 || i == 6) {
                //총합
                $("#yearTableBody2 tr:eq(0) td:eq(" + (tmp_index * 4 + 1) + ")").html(common.addComma(sum_succCnt));
                $("#yearTableBody2 tr:eq(0) td:eq(" + (tmp_index * 4 + 2) + ")").html(common.vatMinus(sum_succAmt));
                $("#yearTableBody2 tr:eq(0) td:eq(" + (tmp_index * 4 + 3) + ")").html();
                //첫구매
                $("#yearTableBody2 tr:eq(1) td:eq(" + (tmp_index * 4 + 1) + ")").html(common.addComma(sum_firstCnt));
                $("#yearTableBody2 tr:eq(1) td:eq(" + (tmp_index * 4 + 2) + ")").html(common.vatMinus(sum_firstAmt));
                $("#yearTableBody2 tr:eq(1) td:eq(" + (tmp_index * 4 + 3) + ")").html();
                //재구매
                $("#yearTableBody2 tr:eq(2) td:eq(" + (tmp_index * 4 + 1) + ")").html(common.addComma(sum_reCnt));
                $("#yearTableBody2 tr:eq(2) td:eq(" + (tmp_index * 4 + 2) + ")").html(common.vatMinus(sum_reAmt));
                $("#yearTableBody2 tr:eq(2) td:eq(" + (tmp_index * 4 + 3) + ")").html();
            }
        }
        ui.tableHeightSet();
    }
</script>

<script type="text/x-handlebars-template" id="tmp_yearTableBody">
    <tr class="_tr_{{this}} font-bold" style="color: #ff5600;">
        <td style="background-color: #dae3f3">총합</td>
        <td></td><td colspan="2"></td><td></td><td style="border-bottom: hidden;border-top: hidden"></td>
        <td></td><td colspan="2"></td><td></td><td style="border-bottom: hidden;border-top: hidden"></td>
        <td style="background-color: #FFF7E5"></td><td colspan="2" style="background-color: #FFF7E5"></td><td style="background-color: #FFF7E5"></td><td style="border-bottom: hidden;border-top: hidden"></td>
        <td title="평균 합계의 경우 반올림된 평균 데이터의 총합이라&#10;항목별 합계와 다소 오차가 생길 수 있습니다."></td>
        <td title="평균 합계의 경우 반올림된 평균 데이터의 총합이라&#10;항목별 합계와 다소 오차가 생길 수 있습니다." colspan="2"></td>
        <td title="평균 합계의 경우 반올림된 평균 데이터의 총합이라&#10;항목별 합계와 다소 오차가 생길 수 있습니다."></td>
    </tr>
    <tr class="_tr_{{this}}" style="background-color: #f2f2f2">
        <td class="font-bold">첫구매</td>
        <td></td><td colspan="2"></td><td></td><td style="border-bottom: hidden;border-top: hidden;background-color: white"></td>
        <td></td><td colspan="2"></td><td></td><td style="border-bottom: hidden;border-top: hidden;background-color: white"></td>
        <td style="background-color: #FFF7E5"></td><td colspan="2" style="background-color: #FFF7E5"></td><td style="background-color: #FFF7E5"></td><td style="border-bottom: hidden;border-top: hidden;background-color: white"></td>
        <td title="평균 합계의 경우 반올림된 평균 데이터의 총합이라&#10;항목별 합계와 다소 오차가 생길 수 있습니다."></td>
        <td title="평균 합계의 경우 반올림된 평균 데이터의 총합이라&#10;항목별 합계와 다소 오차가 생길 수 있습니다." colspan="2"></td>
        <td title="평균 합계의 경우 반올림된 평균 데이터의 총합이라&#10;항목별 합계와 다소 오차가 생길 수 있습니다."></td>
    </tr>
    <tr class="_tr_{{this}}" style="background-color: #f2f2f2">
        <td class="font-bold">재구매</td>
        <td></td><td colspan="2"></td><td></td><td style="border-bottom: hidden;border-top: hidden;background-color: white"></td>
        <td></td><td colspan="2"></td><td></td><td style="border-bottom: hidden;border-top: hidden;background-color: white"></td>
        <td style="background-color: #FFF7E5"></td><td colspan="2" style="background-color: #FFF7E5"></td><td style="background-color: #FFF7E5"></td><td style="border-bottom: hidden;border-top: hidden;background-color: white"></td>
        <td title="평균 합계의 경우 반올림된 평균 데이터의 총합이라&#10;항목별 합계와 다소 오차가 생길 수 있습니다."></td>
        <td title="평균 합계의 경우 반올림된 평균 데이터의 총합이라&#10;항목별 합계와 다소 오차가 생길 수 있습니다." colspan="2"></td>
        <td title="평균 합계의 경우 반올림된 평균 데이터의 총합이라&#10;항목별 합계와 다소 오차가 생길 수 있습니다."></td>
    </tr>

    {{#each this.slctType_date}}
    <tr class="_tr_{{this}}">
        <td class="font-bold" style="background-color: #dae3f3">{{this}}</td>
        <td></td><td></td><td></td><td></td><td style="border-bottom: hidden;border-top: hidden"></td>
        <td></td><td></td><td></td><td></td><td style="border-bottom: hidden;border-top: hidden"></td>
        <td style="background-color: #FFF7E5"></td><td style="background-color: #FFF7E5"></td><td style="background-color: #FFF7E5"></td><td style="background-color: #FFF7E5"></td><td style="border-bottom: hidden;border-top: hidden"></td>
        <td></td><td></td><td></td><td></td>
    </tr>
    {{/each}}
</script>

<script type="text/x-handlebars-template" id="tmp_yearTableBody2">
    <tr class="_tr_{{this}} font-bold" style="color: #ff5600;">
        <td style="background-color: #dae3f3">총합</td>
        <td></td><td colspan="2"></td><td></td><td style="border-bottom: hidden;border-top: hidden"></td>
        <td></td><td colspan="2"></td><td></td><td style="border-bottom: hidden;border-top: hidden"></td>
        <td></td><td colspan="2"></td><td></td><td style="border-bottom: hidden;border-top: hidden"></td>
        <td></td><td colspan="2"></td><td></td>
    </tr>
    <tr class="_tr_{{this}}" style="background-color: #f2f2f2">
        <td class="font-bold">첫구매</td>
        <td></td><td colspan="2"></td><td></td><td style="border-bottom: hidden;border-top: hidden;background-color: white"></td>
        <td></td><td colspan="2"></td><td></td><td style="border-bottom: hidden;border-top: hidden;background-color: white"></td>
        <td></td><td colspan="2"></td><td></td><td style="border-bottom: hidden;border-top: hidden;background-color: white"></td>
        <td></td><td colspan="2"></td><td></td>
    </tr>
    <tr class="_tr_{{this}}" style="background-color: #f2f2f2">
        <td class="font-bold">재구매</td>
        <td></td><td colspan="2"></td><td></td><td style="border-bottom: hidden;border-top: hidden;background-color: white"></td>
        <td></td><td colspan="2"></td><td></td><td style="border-bottom: hidden;border-top: hidden;background-color: white"></td>
        <td></td><td colspan="2"></td><td></td><td style="border-bottom: hidden;border-top: hidden;background-color: white"></td>
        <td></td><td colspan="2"></td><td></td>
    </tr>
    {{#each this.slctType_date}}
    <tr class="_tr_{{this}}">
        <td class="font-bold" style="background-color: #dae3f3">{{this}}</td>
        <td></td><td></td><td></td><td></td><td style="border-bottom: hidden;border-top: hidden"></td>
        <td></td><td></td><td></td><td></td><td style="border-bottom: hidden;border-top: hidden"></td>
        <td></td><td></td><td></td><td></td><td style="border-bottom: hidden;border-top: hidden"></td>
        <td></td><td></td><td></td><td></td>
    </tr>
    {{/each}}
</script>

