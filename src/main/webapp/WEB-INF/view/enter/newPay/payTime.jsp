<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 결제환불 > 총계 -->
<div class="widget widget-table mb10">
    <div class="widget-content mt10" id="divTime">
        <%--<a href="javascript://" class="_prevSearch">[이전]</a>--%>
        <span class="_searchDate"></span>
        <%--<a href="javascript://" class="_nextSearch">[다음]</a>--%>
        <table class="table table-bordered mb0 _tableHeight" data-height="23px">
            <colgroup>
                <col width="5%"/>
                <col width="4%"/><col width="4%"/><col width="4%"/><col width="4%"/><col width="4%"/>
                <col width="0.1%"/>
                <col width="4%"/><col width="4%"/><col width="4%"/><col width="4%"/><col width="4%"/>
                <col width="0.1%"/>
                <col width="4%"/><col width="4%"/><col width="4%"/><col width="4%"/><col width="4%"/>
                <col width="0.1%"/>
                <col width="4%"/><col width="4%"/><col width="4%"/><col width="4%"/><col width="4%"/>
            </colgroup>
            <thead>
            <tr style="background-color: #b4c7e7">
                <th rowspan="2"></th>
                <th class="_totalDate" colspan="5" id="time_th_2"></th><td class="_noBorder"></td>
                <th class="_totalDate" colspan="5" id="time_th_1"></th><td class="_noBorder"></td>
                <th class="_totalDate" colspan="5" id="time_th_0" style="background-color: #ffe699"></th><td class="_noBorder"></td>
                <th colspan="5" title="평균 합계의 경우 반올림된 평균 데이터의 총합이라&#10;항목별 합계와 다소 오차가 생길 수 있습니다.">평균</th>
            </tr>
            <tr style="background-color: #dae3f3">
                <th>건수</th>
                <th>수량</th>
                <th>결제</th>
                <th>누적</th>
                <th>취소</th>
                <td class="_noBorder"></td>

                <th>건수</th>
                <th>수량</th>
                <th>결제</th>
                <th>누적</th>
                <th>취소</th>
                <td class="_noBorder"></td>

                <th style="background-color: #fff2cc">건수</th>
                <th style="background-color: #fff2cc">수량</th>
                <th style="background-color: #fff2cc">결제</th>
                <th style="background-color: #fff2cc">누적</th>
                <th style="background-color: #fff2cc">취소</th>
                <td class="_noBorder"></td>

                <th title="평균 합계의 경우 반올림된 평균 데이터의 총합이라&#10;항목별 합계와 다소 오차가 생길 수 있습니다.">건수</th>
                <th title="평균 합계의 경우 반올림된 평균 데이터의 총합이라&#10;항목별 합계와 다소 오차가 생길 수 있습니다.">수량</th>
                <th title="평균 합계의 경우 반올림된 평균 데이터의 총합이라&#10;항목별 합계와 다소 오차가 생길 수 있습니다.">결제</th>
                <th title="평균 합계의 경우 반올림된 평균 데이터의 총합이라&#10;항목별 합계와 다소 오차가 생길 수 있습니다.">누적</th>
                <th title="평균 합계의 경우 반올림된 평균 데이터의 총합이라&#10;항목별 합계와 다소 오차가 생길 수 있습니다.">취소</th>

            </tr>
            </thead>
            <tbody id="timeTableBody"></tbody>
        </table>

        <table class="table table-bordered _tableHeight" data-height="23px">
            <colgroup>
                <col width="5%"/>
                <col width="4%"/><col width="4%"/><col width="4%"/><col width="4%"/><col width="4%"/>
                <col width="0.1%"/>
                <col width="4%"/><col width="4%"/><col width="4%"/><col width="4%"/><col width="4%"/>
                <col width="0.1%"/>
                <col width="4%"/><col width="4%"/><col width="4%"/><col width="4%"/><col width="4%"/>
                <col width="0.1%"/>
                <col width="4%"/><col width="4%"/><col width="4%"/><col width="4%"/><col width="4%"/>
            </colgroup>
            <thead>
            <tr style="background-color: #b4c7e7">
                <th rowspan="2"></th>
                <th class="_totalDate" colspan="5" id="time_th_6"></th><td class="_noBorder"></td>
                <th class="_totalDate" colspan="5" id="time_th_5"></th><td class="_noBorder"></td>
                <th class="_totalDate" colspan="5" id="time_th_4"></th><td class="_noBorder"></td>
                <th class="_totalDate" colspan="5" id="time_th_3"></th>
            </tr>
            <tr style="background-color: #dae3f3">
                <th>건수</th>
                <th>수량</th>
                <th>결제</th>
                <th>누적</th>
                <th>취소</th>
                <td class="_noBorder"></td>

                <th>건수</th>
                <th>수량</th>
                <th>결제</th>
                <th>누적</th>
                <th>취소</th>
                <td class="_noBorder"></td>

                <th>건수</th>
                <th>수량</th>
                <th>결제</th>
                <th>누적</th>
                <th>취소</th>
                <td class="_noBorder"></td>

                <th>건수</th>
                <th>수량</th>
                <th>결제</th>
                <th>누적</th>
                <th>취소</th>

            </tr>
            </thead>
            <tbody id="timeTableBody2"></tbody>
        </table>
    </div>
    <div class="widget-footer">
        <span>
        </span>
    </div>
</div>
<a id='payTimeExcel' type='button' class="btn btn-default print-btn pull-right" download="" href="#" onclick="return ExcellentExport.excel(this, 'divTime', 'Sheet1');"><i class="fa fa-print"></i>Excel Down</a>

<script src="/js/lib/excellentexport.js"></script>

<script type="text/javascript">
    $(function() {
    });

    function getPayTimeList(){

        $("#payTimeExcel").attr('download' , "결제현황_시간대별_" + moment($("#startDate").val()).add('days', 0).format('YYYY.MM.DD') + ".xls");

        var slctType_date = [];
        for(i = 23; -1 < i; i-- ){
            slctType_date.push(i + " 시");
        }
        data = {
            slctType_date : slctType_date
        };

        var template = $('#tmp_timeTableBody').html();
        var templateScript = Handlebars.compile(template);
        var context = data;
        var html=templateScript(context);
        $("#timeTableBody").html(html);

        var template = $('#tmp_timeTableBody2').html();
        var templateScript = Handlebars.compile(template);
        var context = data;
        var html=templateScript(context);
        $("#timeTableBody2").html(html);

        $("#time_th_6").text(moment($("#startDate").val()).add('days', -6).format('YYYY.MM.DD') + " (" + week[moment($("#startDate").val()).add('days', -6).day()] + ")");
        $("#time_th_5").text(moment($("#startDate").val()).add('days', -5).format('YYYY.MM.DD') + " (" + week[moment($("#startDate").val()).add('days', -5).day()] + ")");
        $("#time_th_4").text(moment($("#startDate").val()).add('days', -4).format('YYYY.MM.DD') + " (" + week[moment($("#startDate").val()).add('days', -4).day()] + ")");
        $("#time_th_3").text(moment($("#startDate").val()).add('days', -3).format('YYYY.MM.DD') + " (" + week[moment($("#startDate").val()).add('days', -3).day()] + ")");
        $("#time_th_2").text(moment($("#startDate").val()).add('days', -2).format('YYYY.MM.DD') + " (" + week[moment($("#startDate").val()).add('days', -2).day()] + ")");
        $("#time_th_1").text(moment($("#startDate").val()).add('days', -1).format('YYYY.MM.DD') + " (" + week[moment($("#startDate").val()).add('days', -1).day()] + ")");
        $("#time_th_0").text(moment($("#startDate").val()).add('days', 0).format('YYYY.MM.DD') + " (" + week[moment($("#startDate").val()).add('days', 0).day()] + ")");

        var total_th_6 = moment($("#startDate").val()).add('days', -6).format('YYYY.MM.DD');
        var total_th_5 = moment($("#startDate").val()).add('days', -5).format('YYYY.MM.DD');
        var total_th_4 = moment($("#startDate").val()).add('days', -4).format('YYYY.MM.DD');
        var total_th_3 = moment($("#startDate").val()).add('days', -3).format('YYYY.MM.DD');
        var total_th_2 = moment($("#startDate").val()).add('days', -2).format('YYYY.MM.DD');
        var total_th_1 = moment($("#startDate").val()).add('days', -1).format('YYYY.MM.DD');
        var total_th_0 = moment($("#startDate").val()).add('days', 0).format('YYYY.MM.DD');

        var dateList = total_th_2 + "@" + total_th_1 + "@" + total_th_0 + "@" + total_th_6 + "@" + total_th_5 + "@" + total_th_4  + "@" +  total_th_3;
        var data = {};

        console.log(dateList);

        data.dateList = dateList;
        data.slctType = 0;
        util.getAjaxData("total", "/rest/enter/pay/total", data, fn_payTime_success);
    }

    function fn_payTime_success(data, response){
        tmp_index = -1;
        var title = "평균 합계의 경우 반올림된 평균 데이터의 총합이라\n항목별 합계와 다소 오차가 생길 수 있습니다.";

        var tmp_date = new Date();
        tmp_date = moment(tmp_date).format("YYYY.MM.DD HH:mm:SS");
        var tmp_day = tmp_date.split(" ")[0];
        var tmp_time = tmp_date.split(" ")[1];

        response.data.forEach(function(data, index){
            if(index > 2){
                ++tmp_index;
            }
            data.detailList.forEach(function(detail, detailIndex){

                if(detail.succAmt == 0){
                    detail.accumAmt = 0;
                }
                $("#timeTableBody tr._tr_" + detail.hour + " td:eq(" + (3 * 6 + 1) + ")").attr('title',title);
                $("#timeTableBody tr._tr_" + detail.hour + " td:eq(" + (3 * 6 + 2) + ")").attr('title',title);
                $("#timeTableBody tr._tr_" + detail.hour + " td:eq(" + (3 * 6 + 3) + ")").attr('title',title);
                $("#timeTableBody tr._tr_" + detail.hour + " td:eq(" + (3 * 6 + 4) + ")").attr('title',title);

                var succCnt = detail.succCnt;
                var succCmt = detail.succCmt;
                var succAmt = detail.succAmt;
                var accumAmt = detail.accumAmt;
                var cancAmt = detail.cancAmt;
                if(succCnt == 0)
                    succCnt = "null";
                if(succCmt == 0)
                    succCmt = "null";
                if(succAmt == 0)
                    succAmt = "null";
                if(accumAmt == 0)
                    accumAmt = "null";
                if(cancAmt == 0)
                    cancAmt = "null";

                if (index == 0) {
                    // $("#timeTableBody tr._tr_" + detail.hour + " td:eq(" + (index + 1) + ")").attr("onclick",hourClick(detail.hour));
                    $("#timeTableBody tr._tr_" + detail.hour + " td:eq(" + (index + 1) + ")").find('._data').html(common.addComma(succCnt));
                    $("#timeTableBody tr._tr_" + detail.hour + " td:eq(" + (index + 2) + ")").html(common.addComma(succCmt));
                    $("#timeTableBody tr._tr_" + detail.hour + " td:eq(" + (index + 3) + ")").html(common.vatMinus(succAmt));
                    $("#timeTableBody tr._tr_" + detail.hour + " td:eq(" + (index + 4) + ")").html(common.vatMinus(accumAmt));
                    $("#timeTableBody tr._tr_" + detail.hour + " td:eq(" + (index + 5) + ")").html(common.vatMinus(cancAmt));
                    if(Number(tmp_time.split(":")[0]) == detail.hour) {
                        for(var i = 1; i < 6 ; i ++){
                            $("#timeTableBody tr._tr_" + (detail.hour) + " td:eq(" + (index + i) + ")").css("background-color", "#e3ecfb");
                            $("#timeTableBody tr._tr_" + (detail.hour) + " td:eq(" + (index + i) + ")").css("font-weight", "bold");
                        }
                    }
                    // data set
                    $("#timeTableBody tr._tr_" + detail.hour + " td:eq(" + (index + 1) + ")").data("hour",detail.hour);
                    $("#timeTableBody tr._tr_" + detail.hour + " td:eq(" + (index + 1) + ")").data("sDate", moment($("#startDate").val()).add('days', -2).format('YYYY.MM.DD'));

                } else if (index == 1 || index == 2) {
                    $("#timeTableBody tr._tr_" + detail.hour + " td:eq(" + (index * 6 + 1) + ")").find('._data').html(common.addComma(succCnt));
                    $("#timeTableBody tr._tr_" + detail.hour + " td:eq(" + (index * 6 + 2) + ")").html(common.addComma(succCmt));
                    $("#timeTableBody tr._tr_" + detail.hour + " td:eq(" + (index * 6 + 3) + ")").html(common.vatMinus(succAmt));
                    $("#timeTableBody tr._tr_" + detail.hour + " td:eq(" + (index * 6 + 4) + ")").html(common.vatMinus(accumAmt));
                    $("#timeTableBody tr._tr_" + detail.hour + " td:eq(" + (index * 6 + 5) + ")").html(common.vatMinus(cancAmt));
                    if(Number(tmp_time.split(":")[0]) == detail.hour) {
                        for(var i = 1; i < 6 ; i ++){
                            $("#timeTableBody tr._tr_" + (detail.hour) + " td:eq(" + (index * 6 + i) + ")").css("background-color", "#e3ecfb");
                            $("#timeTableBody tr._tr_" + (detail.hour) + " td:eq(" + (index * 6 + i) + ")").css("font-weight", "bold");
                        }
                    }

                    // data set
                    $("#timeTableBody tr._tr_" + detail.hour + " td:eq(" + (index * 6 + 1) + ")").data("hour",detail.hour);
                    if(index == 1){
                        $("#timeTableBody tr._tr_" + detail.hour + " td:eq(" + (index * 6 + 1) + ")").data("sDate", moment($("#startDate").val()).add('days', -1).format('YYYY.MM.DD'));
                    }else{
                        $("#timeTableBody tr._tr_" + detail.hour + " td:eq(" + (index * 6 + 1) + ")").data("sDate", moment($("#startDate").val()).add('days', 0).format('YYYY.MM.DD'));
                    }
                } else if(index == 7) {     // 평균
                    $("#timeTableBody tr._tr_" + detail.hour + " td:eq(" + (3 * 6 + 1) + ")").html(common.addComma((succCnt/7).toFixed(1)));
                    $("#timeTableBody tr._tr_" + detail.hour + " td:eq(" + (3 * 6 + 2) + ")").html(common.addComma((succCmt/7).toFixed(1)));
                    $("#timeTableBody tr._tr_" + detail.hour + " td:eq(" + (3 * 6 + 3) + ")").html(common.vatMinus(succAmt/7));
                    $("#timeTableBody tr._tr_" + detail.hour + " td:eq(" + (3 * 6 + 4) + ")").html(common.vatMinus(accumAmt/7));
                    $("#timeTableBody tr._tr_" + detail.hour + " td:eq(" + (3 * 6 + 5) + ")").html(common.vatMinus(cancAmt/7));
                    if(Number(tmp_time.split(":")[0]) == detail.hour) {
                        for(var i = 1; i < 6 ; i ++){
                            $("#timeTableBody tr._tr_" + (detail.hour) + " td:eq(" + (3 * 6 + i) + ")").css("background-color", "#e3ecfb");
                            $("#timeTableBody tr._tr_" + (detail.hour) + " td:eq(" + (3 * 6 + i) + ")").css("font-weight", "bold");
                        }
                    }
                }
                // 하단
                if (index == 3) {
                    $("#timeTableBody2 tr._tr_" + detail.hour + " td:eq(" + (tmp_index + 1) + ")").find('._data').html(common.addComma(succCnt));
                    $("#timeTableBody2 tr._tr_" + detail.hour + " td:eq(" + (tmp_index + 2) + ")").html(common.addComma(succCmt));
                    $("#timeTableBody2 tr._tr_" + detail.hour + " td:eq(" + (tmp_index + 3) + ")").html(common.vatMinus(succAmt));
                    $("#timeTableBody2 tr._tr_" + detail.hour + " td:eq(" + (tmp_index + 4) + ")").html(common.vatMinus(accumAmt));
                    $("#timeTableBody2 tr._tr_" + detail.hour + " td:eq(" + (tmp_index + 5) + ")").html(common.vatMinus(cancAmt));
                    if(Number(tmp_time.split(":")[0]) == detail.hour) {
                        for(var i = 1; i < 6 ; i ++){
                            $("#timeTableBody2 tr._tr_" + (detail.hour) + " td:eq(" + (tmp_index + i) + ")").css("background-color", "#e3ecfb");
                            $("#timeTableBody2 tr._tr_" + (detail.hour) + " td:eq(" + (tmp_index + i) + ")").css("font-weight", "bold");
                        }
                    }
                    // data set
                    $("#timeTableBody2 tr._tr_" + detail.hour + " td:eq(" + (tmp_index + 1) + ")").data("hour",detail.hour);
                    $("#timeTableBody2 tr._tr_" + detail.hour + " td:eq(" + (tmp_index + 1) + ")").data("sDate", moment($("#startDate").val()).add('days', -6).format('YYYY.MM.DD'));
                }else if(index == 4 || index == 5 || index == 6){
                    $("#timeTableBody2 tr._tr_" + detail.hour + " td:eq(" + (tmp_index * 6 + 1) + ")").find('._data').html(common.addComma(succCnt));
                    $("#timeTableBody2 tr._tr_" + detail.hour + " td:eq(" + (tmp_index * 6 + 2) + ")").html(common.addComma(succCmt));
                    $("#timeTableBody2 tr._tr_" + detail.hour + " td:eq(" + (tmp_index * 6 + 3) + ")").html(common.vatMinus(succAmt));
                    $("#timeTableBody2 tr._tr_" + detail.hour + " td:eq(" + (tmp_index * 6 + 4) + ")").html(common.vatMinus(accumAmt));
                    $("#timeTableBody2 tr._tr_" + detail.hour + " td:eq(" + (tmp_index * 6 + 5) + ")").html(common.vatMinus(cancAmt));
                    if(Number(tmp_time.split(":")[0]) == detail.hour) {
                        for(var i = 1; i < 6 ; i ++){
                            $("#timeTableBody2 tr._tr_" + (detail.hour) + " td:eq(" + (tmp_index * 6 + i) + ")").css("background-color", "#e3ecfb");
                            $("#timeTableBody2 tr._tr_" + (detail.hour) + " td:eq(" + (tmp_index * 6 + i) + ")").css("font-weight", "bold");
                        }
                    }
                    // data set
                    $("#timeTableBody2 tr._tr_" + detail.hour + " td:eq(" + (tmp_index * 6 + 1) + ")").data("hour",detail.hour);
                    if(index == 6){
                        $("#timeTableBody2 tr._tr_" + detail.hour + " td:eq(" + (tmp_index * 6 + 1) + ")").data("sDate", moment($("#startDate").val()).add('days', -3).format('YYYY.MM.DD'));
                    }else if(index == 5){
                        $("#timeTableBody2 tr._tr_" + detail.hour + " td:eq(" + (tmp_index * 6 + 1) + ")").data("sDate", moment($("#startDate").val()).add('days', -4).format('YYYY.MM.DD'));
                    }else if(index == 4){
                        $("#timeTableBody2 tr._tr_" + detail.hour + " td:eq(" + (tmp_index * 6 + 1) + ")").data("sDate", moment($("#startDate").val()).add('days', -5).format('YYYY.MM.DD'));
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
            var sum_succCmt = totalInfo.sum_succCmt;
            var sum_succAmt = totalInfo.sum_succAmt;
            var sum_firstCnt = totalInfo.sum_firstCnt;
            var sum_firstCmt = totalInfo.sum_firstCmt;
            var sum_firstAmt = totalInfo.sum_firstAmt;
            var sum_reCnt = totalInfo.sum_reCnt;
            var sum_reCmt = totalInfo.sum_reCmt;
            var sum_reAmt = totalInfo.sum_reAmt;
            var sum_cancCnt = totalInfo.sum_cancCnt;
            var sum_cancCmt = totalInfo.sum_cancCmt;
            var sum_cancAmt = totalInfo.sum_cancAmt;

            if(sum_succCnt == 0)
                sum_succCnt = "null";
            if(sum_succCmt == 0)
                sum_succCmt = "null";
            if(sum_succAmt == 0)
                sum_succAmt = "null";
            if(sum_firstCnt == 0)
                sum_firstCnt = "null";
            if(sum_firstCmt == 0)
                sum_firstCmt = "null";
            if(sum_firstAmt == 0)
                sum_firstAmt = "null";
            if(sum_reCnt == 0)
                sum_reCnt = "null";
            if(sum_reCmt == 0)
                sum_reCmt = "null";
            if(sum_reAmt == 0)
                sum_reAmt = "null";
            if(sum_cancCnt == 0)
                sum_cancCnt = "null";
            if(sum_cancCmt == 0)
                sum_cancCmt = "null";
            if(sum_cancAmt == 0)
                sum_cancAmt = "null";

            if(i == 0){
                //총합
                $("#timeTableBody tr:eq(0) td:eq(" + (i + 1) + ")").html(common.addComma(sum_succCnt));
                $("#timeTableBody tr:eq(0) td:eq(" + (i + 2) + ")").html(common.addComma(sum_succCmt));
                $("#timeTableBody tr:eq(0) td:eq(" + (i + 3) + ")").html(common.vatMinus(sum_succAmt));
                $("#timeTableBody tr:eq(0) td:eq(" + (i + 4) + ")").html(common.vatMinus(sum_cancAmt));
                //첫구매
                $("#timeTableBody tr:eq(1) td:eq(" + (i + 1) + ")").html(common.addComma(sum_firstCnt));
                $("#timeTableBody tr:eq(1) td:eq(" + (i + 2) + ")").html(common.addComma(sum_firstCmt));
                $("#timeTableBody tr:eq(1) td:eq(" + (i + 3) + ")").html(common.vatMinus(sum_firstAmt));
                $("#timeTableBody tr:eq(1) td:eq(" + (i + 4) + ")").html();
                //재구매
                $("#timeTableBody tr:eq(2) td:eq(" + (i + 1) + ")").html(common.addComma(sum_reCnt));
                $("#timeTableBody tr:eq(2) td:eq(" + (i + 2) + ")").html(common.addComma(sum_reCmt));
                $("#timeTableBody tr:eq(2) td:eq(" + (i + 3) + ")").html(common.vatMinus(sum_reAmt));
                $("#timeTableBody tr:eq(2) td:eq(" + (i + 4) + ")").html();
            }else if(i == 1 || i == 2) {
                //총합
                $("#timeTableBody tr:eq(0) td:eq(" + (i * 5 + 1) + ")").html(common.addComma(sum_succCnt));
                $("#timeTableBody tr:eq(0) td:eq(" + (i * 5 + 2) + ")").html(common.addComma(sum_succCmt));
                $("#timeTableBody tr:eq(0) td:eq(" + (i * 5 + 3) + ")").html(common.vatMinus(sum_succAmt));
                $("#timeTableBody tr:eq(0) td:eq(" + (i * 5 + 4) + ")").html(common.vatMinus(sum_cancAmt));
                //첫구매
                $("#timeTableBody tr:eq(1) td:eq(" + (i * 5 + 1) + ")").html(common.addComma(sum_firstCnt));
                $("#timeTableBody tr:eq(1) td:eq(" + (i * 5 + 2) + ")").html(common.addComma(sum_firstCmt));
                $("#timeTableBody tr:eq(1) td:eq(" + (i * 5 + 3) + ")").html(common.vatMinus(sum_firstAmt));
                $("#timeTableBody tr:eq(1) td:eq(" + (i * 5 + 4) + ")").html();
                //재구매
                $("#timeTableBody tr:eq(2) td:eq(" + (i * 5 + 1) + ")").html(common.addComma(sum_reCnt));
                $("#timeTableBody tr:eq(2) td:eq(" + (i * 5 + 2) + ")").html(common.addComma(sum_reCmt));
                $("#timeTableBody tr:eq(2) td:eq(" + (i * 5 + 3) + ")").html(common.vatMinus(sum_reAmt));
                $("#timeTableBody tr:eq(2) td:eq(" + (i * 5 + 4) + ")").html();
            }else if(i == 7){
                //총합
                $("#timeTableBody tr:eq(0) td:eq(" + (3 * 5 + 1) + ")").html(common.addComma((sum_succCnt/7).toFixed(1)));
                $("#timeTableBody tr:eq(0) td:eq(" + (3 * 5 + 2) + ")").html(common.addComma((sum_succCmt/7).toFixed(1)));
                $("#timeTableBody tr:eq(0) td:eq(" + (3 * 5 + 3) + ")").html(common.vatMinus(sum_succAmt/7));
                $("#timeTableBody tr:eq(0) td:eq(" + (3 * 5 + 4) + ")").html(common.vatMinus(sum_cancAmt/7));
                //첫구매
                $("#timeTableBody tr:eq(1) td:eq(" + (3 * 5 + 1) + ")").html(common.addComma((sum_firstCnt/7).toFixed(1)));
                $("#timeTableBody tr:eq(1) td:eq(" + (3 * 5 + 2) + ")").html(common.addComma((sum_firstCmt/7).toFixed(1)));
                $("#timeTableBody tr:eq(1) td:eq(" + (3 * 5 + 3) + ")").html(common.vatMinus(sum_firstAmt/7));
                $("#timeTableBody tr:eq(1) td:eq(" + (3 * 5 + 4) + ")").html();
                //재구매
                $("#timeTableBody tr:eq(2) td:eq(" + (3 * 5 + 1) + ")").html(common.addComma((sum_reCnt/7).toFixed(1)));
                $("#timeTableBody tr:eq(2) td:eq(" + (3 * 5 + 2) + ")").html(common.addComma((sum_reCmt/7).toFixed(1)));
                $("#timeTableBody tr:eq(2) td:eq(" + (3 * 5 + 3) + ")").html(common.vatMinus(sum_reAmt/7));
                $("#timeTableBody tr:eq(2) td:eq(" + (3 * 5 + 4) + ")").html();
            }

            if(i == 3){
                //총합
                $("#timeTableBody2 tr:eq(0) td:eq(" + (tmp_index + 1) + ")").html(common.addComma(sum_succCnt));
                $("#timeTableBody2 tr:eq(0) td:eq(" + (tmp_index + 2) + ")").html(common.addComma(sum_succCmt));
                $("#timeTableBody2 tr:eq(0) td:eq(" + (tmp_index + 3) + ")").html(common.vatMinus(sum_succAmt));
                $("#timeTableBody2 tr:eq(0) td:eq(" + (tmp_index + 4) + ")").html(common.vatMinus(sum_cancAmt));
                //첫구매
                $("#timeTableBody2 tr:eq(1) td:eq(" + (tmp_index + 1) + ")").html(common.addComma(sum_firstCnt));
                $("#timeTableBody2 tr:eq(1) td:eq(" + (tmp_index + 2) + ")").html(common.addComma(sum_firstCmt));
                $("#timeTableBody2 tr:eq(1) td:eq(" + (tmp_index + 3) + ")").html(common.vatMinus(sum_firstAmt));
                $("#timeTableBody2 tr:eq(1) td:eq(" + (tmp_index + 4) + ")").html();
                //재구매
                $("#timeTableBody2 tr:eq(2) td:eq(" + (tmp_index + 1) + ")").html(common.addComma(sum_reCnt));
                $("#timeTableBody2 tr:eq(2) td:eq(" + (tmp_index + 2) + ")").html(common.addComma(sum_reCmt));
                $("#timeTableBody2 tr:eq(2) td:eq(" + (tmp_index + 3) + ")").html(common.vatMinus(sum_reAmt));
                $("#timeTableBody2 tr:eq(2) td:eq(" + (tmp_index + 4) + ")").html();
            }else if(i == 4 || i == 5 || i == 6) {
                //총합
                $("#timeTableBody2 tr:eq(0) td:eq(" + (tmp_index * 5 + 1) + ")").html(common.addComma(sum_succCnt));
                $("#timeTableBody2 tr:eq(0) td:eq(" + (tmp_index * 5 + 2) + ")").html(common.addComma(sum_succCmt));
                $("#timeTableBody2 tr:eq(0) td:eq(" + (tmp_index * 5 + 3) + ")").html(common.vatMinus(sum_succAmt));
                $("#timeTableBody2 tr:eq(0) td:eq(" + (tmp_index * 5 + 4) + ")").html(common.vatMinus(sum_cancAmt));
                //첫구매
                $("#timeTableBody2 tr:eq(1) td:eq(" + (tmp_index * 5 + 1) + ")").html(common.addComma(sum_firstCnt));
                $("#timeTableBody2 tr:eq(1) td:eq(" + (tmp_index * 5 + 2) + ")").html(common.addComma(sum_firstCmt));
                $("#timeTableBody2 tr:eq(1) td:eq(" + (tmp_index * 5 + 3) + ")").html(common.vatMinus(sum_firstAmt));
                $("#timeTableBody2 tr:eq(1) td:eq(" + (tmp_index * 5 + 4) + ")").html();
                //재구매
                $("#timeTableBody2 tr:eq(2) td:eq(" + (tmp_index * 5 + 1) + ")").html(common.addComma(sum_reCnt));
                $("#timeTableBody2 tr:eq(2) td:eq(" + (tmp_index * 5 + 2) + ")").html(common.addComma(sum_reCmt));
                $("#timeTableBody2 tr:eq(2) td:eq(" + (tmp_index * 5 + 3) + ")").html(common.vatMinus(sum_reAmt));
                $("#timeTableBody2 tr:eq(2) td:eq(" + (tmp_index * 5 + 4) + ")").html();
            }
        }
        ui.paintColor();
        ui.tableHeightSet();
    }

    function hourClick(tmp){
        if(tmp.hour > -1 ){
            var popupUrl = "/enter/newPay/popup/history?sDate=" + tmp.sDate + "&eDate=" + tmp.sDate + "&gender=null&time=" + tmp.hour + "&age=null";
            util.windowOpen(popupUrl,"1550","885","결제목록");
        }else{
            alert('데이터가 없습니다.');
        }
    }

</script>

<script type="text/x-handlebars-template" id="tmp_timeTableBody">
    <tr class="_tr_{{this}} font-bold" style="color: #ff5600;">
        <td style="background-color: #dae3f3">총합</td>
        <td></td><td></td><td colspan="2"></td><td></td><td style="border-bottom: hidden;border-top: hidden"></td>
        <td></td><td></td><td colspan="2"></td><td></td><td style="border-bottom: hidden;border-top: hidden"></td>
        <td style="background-color: #FFF7E5"></td><td style="background-color: #FFF7E5"></td><td colspan="2" style="background-color: #FFF7E5"></td><td style="background-color: #FFF7E5"></td><td style="border-bottom: hidden;border-top: hidden"></td>
        <td title="평균 합계의 경우 반올림된 평균 데이터의 총합이라&#10;항목별 합계와 다소 오차가 생길 수 있습니다."></td>
        <td title="평균 합계의 경우 반올림된 평균 데이터의 총합이라&#10;항목별 합계와 다소 오차가 생길 수 있습니다."></td>
        <td title="평균 합계의 경우 반올림된 평균 데이터의 총합이라&#10;항목별 합계와 다소 오차가 생길 수 있습니다." colspan="2"></td>
        <td title="평균 합계의 경우 반올림된 평균 데이터의 총합이라&#10;항목별 합계와 다소 오차가 생길 수 있습니다."></td>
    </tr>
    <tr class="_tr_{{this}}" style="background-color: #f2f2f2">
        <td class="font-bold">첫구매</td>
        <td></td><td></td><td colspan="2"></td><td></td><td style="border-bottom: hidden;border-top: hidden;background-color: white"></td>
        <td></td><td></td><td colspan="2"></td><td></td><td style="border-bottom: hidden;border-top: hidden;background-color: white"></td>
        <td style="background-color: #FFF7E5"></td><td style="background-color: #FFF7E5"></td><td colspan="2" style="background-color: #FFF7E5"></td><td style="background-color: #FFF7E5"></td><td style="border-bottom: hidden;border-top: hidden;background-color: white"></td>
        <td title="평균 합계의 경우 반올림된 평균 데이터의 총합이라&#10;항목별 합계와 다소 오차가 생길 수 있습니다."></td>
        <td title="평균 합계의 경우 반올림된 평균 데이터의 총합이라&#10;항목별 합계와 다소 오차가 생길 수 있습니다."></td>
        <td title="평균 합계의 경우 반올림된 평균 데이터의 총합이라&#10;항목별 합계와 다소 오차가 생길 수 있습니다." colspan="2"></td>
        <td title="평균 합계의 경우 반올림된 평균 데이터의 총합이라&#10;항목별 합계와 다소 오차가 생길 수 있습니다."></td>
    </tr>
    <tr class="_tr_{{this}}" style="background-color: #f2f2f2">
        <td class="font-bold">재구매</td>
        <td></td><td></td><td colspan="2"></td><td></td><td style="border-bottom: hidden;border-top: hidden;background-color: white"></td>
        <td></td><td></td><td colspan="2"></td><td></td><td style="border-bottom: hidden;border-top: hidden;background-color: white"></td>
        <td style="background-color: #FFF7E5"></td><td style="background-color: #FFF7E5"></td><td colspan="2" style="background-color: #FFF7E5"></td><td style="background-color: #FFF7E5"></td><td style="border-bottom: hidden;border-top: hidden;background-color: white"></td>
        <td title="평균 합계의 경우 반올림된 평균 데이터의 총합이라&#10;항목별 합계와 다소 오차가 생길 수 있습니다."></td>
        <td title="평균 합계의 경우 반올림된 평균 데이터의 총합이라&#10;항목별 합계와 다소 오차가 생길 수 있습니다."></td>
        <td title="평균 합계의 경우 반올림된 평균 데이터의 총합이라&#10;항목별 합계와 다소 오차가 생길 수 있습니다." colspan="2"></td>
        <td title="평균 합계의 경우 반올림된 평균 데이터의 총합이라&#10;항목별 합계와 다소 오차가 생길 수 있습니다."></td>
    </tr>

    {{#each this.slctType_date}}
    <tr class="_tr_{{this}}">
        <td class="font-bold" style="background-color: #dae3f3">{{this}}</td>
        <td onclick="hourClick($(this).data())"><a href="javascript://"><span class="_data _fontColor" data-fontcolor="#555"></span></a></td><td onclick="hourClick($(this).data())"><a href="javascript://"><span class="_data _fontColor" data-fontcolor="#555"></span></a></td><td></td><td></td><td></td><td style="border-bottom: hidden;border-top: hidden"></td>
        <td onclick="hourClick($(this).data())"><a href="javascript://"><span class="_data _fontColor" data-fontcolor="#555"></span></a></td><td onclick="hourClick($(this).data())"><a href="javascript://"><span class="_data _fontColor" data-fontcolor="#555"></span></a></td><td></td><td></td><td></td><td style="border-bottom: hidden;border-top: hidden"></td>
        <td onclick="hourClick($(this).data())" style="background-color: #FFF7E5"><a href="javascript://"><span class="_data _fontColor" data-fontcolor="#555"></span></td><td onclick="hourClick($(this).data())" style="background-color: #FFF7E5"><a href="javascript://"><span class="_data _fontColor" data-fontcolor="#555"></span></td><td style="background-color: #FFF7E5"></td><td style="background-color: #FFF7E5"></td><td style="background-color: #FFF7E5"></td><td style="border-bottom: hidden;border-top: hidden"></td>
        <td></td><td></td><td></td><td></td><td></td>
    </tr>
    {{/each}}
</script>

<script type="text/x-handlebars-template" id="tmp_timeTableBody2">
    <tr class="_tr_{{this}} font-bold" style="color: #ff5600;">
        <td style="background-color: #dae3f3">총합</td>
        <td></td><td></td><td colspan="2"></td><td></td><td style="border-bottom: hidden;border-top: hidden"></td>
        <td></td><td></td><td colspan="2"></td><td></td><td style="border-bottom: hidden;border-top: hidden"></td>
        <td></td><td></td><td colspan="2"></td><td></td><td style="border-bottom: hidden;border-top: hidden"></td>
        <td></td><td></td><td colspan="2"></td><td></td>
    </tr>
    <tr class="_tr_{{this}}" style="background-color: #f2f2f2">
        <td class="font-bold">첫구매</td>
        <td></td><td></td><td colspan="2"></td><td></td><td style="border-bottom: hidden;border-top: hidden;background-color: white"></td>
        <td></td><td></td><td colspan="2"></td><td></td><td style="border-bottom: hidden;border-top: hidden;background-color: white"></td>
        <td></td><td></td><td colspan="2"></td><td></td><td style="border-bottom: hidden;border-top: hidden;background-color: white"></td>
        <td></td><td></td><td colspan="2"></td><td></td>
    </tr>
    <tr class="_tr_{{this}}" style="background-color: #f2f2f2">
        <td class="font-bold">재구매</td>
        <td></td><td></td><td colspan="2"></td><td></td><td style="border-bottom: hidden;border-top: hidden;background-color: white"></td>
        <td></td><td></td><td colspan="2"></td><td></td><td style="border-bottom: hidden;border-top: hidden;background-color: white"></td>
        <td></td><td></td><td colspan="2"></td><td></td><td style="border-bottom: hidden;border-top: hidden;background-color: white"></td>
        <td></td><td></td><td colspan="2"></td><td></td>
    </tr>
    {{#each this.slctType_date}}
    <tr class="_tr_{{this}}">
        <td class="font-bold" style="background-color: #dae3f3">{{this}}</td>
        <td onclick="hourClick($(this).data())"><a href="javascript://"><span class="_data _fontColor" data-fontcolor="#555"></span></a></td><td onclick="hourClick($(this).data())"><a href="javascript://"><span class="_data _fontColor" data-fontcolor="#555"></span></a><td></td><td></td><td></td><td style="border-bottom: hidden;border-top: hidden"></td>
        <td onclick="hourClick($(this).data())"><a href="javascript://"><span class="_data _fontColor" data-fontcolor="#555"></span></a></td><td onclick="hourClick($(this).data())"><a href="javascript://"><span class="_data _fontColor" data-fontcolor="#555"></span></a><td></td><td></td><td></td><td style="border-bottom: hidden;border-top: hidden"></td>
        <td onclick="hourClick($(this).data())"><a href="javascript://"><span class="_data _fontColor" data-fontcolor="#555"></span></a></td><td onclick="hourClick($(this).data())"><a href="javascript://"><span class="_data _fontColor" data-fontcolor="#555"></span></a><td></td><td></td><td></td><td style="border-bottom: hidden;border-top: hidden"></td>
        <td onclick="hourClick($(this).data())"><a href="javascript://"><span class="_data _fontColor" data-fontcolor="#555"></span></a></td><td onclick="hourClick($(this).data())"><a href="javascript://"><span class="_data _fontColor" data-fontcolor="#555"></span></a><td></td><td></td><td></td>
    </tr>
    {{/each}}
</script>

