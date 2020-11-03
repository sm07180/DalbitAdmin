<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 결제환불 > 총계 -->
<div class="widget widget-table mb10">
    <div class="widget-content mt10" id="divTry">
        <%--<a href="javascript://" class="_prevSearch">[이전]</a>--%>
        <span class="_searchDate"></span>
        <%--<a href="javascript://" class="_nextSearch">[다음]</a>--%>
        <table class="table table-bordered _tableHeight" data-height="23px">
            <colgroup>
                <col width="4.7%"/><col width="4.7%"/><col width="4.7%"/><col width="4.7%"/><col width="4.7%"/>
                <col width="4.7%"/><col width="0.1%"/><col width="4.7%"/><col width="4.7%"/><col width="4.7%"/>
                <col width="4.7%"/><col width="4.7%"/><col width="0.1%"/><col width="4.7%"/><col width="4.7%"/>
                <col width="4.7%"/><col width="4.7%"/><col width="4.7%"/><col width="0.1%"/><col width="4.7%"/>
                <col width="4.7%"/><col width="4.7%"/><col width="4.7%"/><col width="4.7%"/>
            </colgroup>
            <thead>
            <tr style="background-color: #b4c7e7">
                <th rowspan="2"></th>
                <th class="_tryDate" colspan="5" id="th_2"></th><td class="_noBorder"></td>
                <th class="_tryDate" colspan="5" id="th_1"></th><td class="_noBorder"></td>
                <th class="_tryDate" colspan="5" id="th_0" style="background-color: #ffe699"></th><td class="_noBorder"></td>
                <th colspan="5"  title="평균 합계의 경우 반올림된 평균 데이터의 총합이라&#10;항목별 합계와 다소 오차가 생길 수 있습니다.">평균</th>
            </tr>
            <tr style="background-color: #dae3f3">
                <th>성공</th>
                <th>시도</th>
                <th>실패</th>
                <th>취소</th>
                <th>성공률</th>
                <td class="_noBorder"></td>
                <th>성공</th>
                <th>시도</th>
                <th>실패</th>
                <th>취소</th>
                <th>성공률</th>
                <td class="_noBorder"></td>
                <th style="background-color: #fff2cc">성공</th>
                <th style="background-color: #fff2cc">시도</th>
                <th style="background-color: #fff2cc">실패</th>
                <th style="background-color: #fff2cc">취소</th>
                <th style="background-color: #fff2cc">성공률</th>
                <td class="_noBorder"></td>
                <th  title="평균 합계의 경우 반올림된 평균 데이터의 총합이라&#10;항목별 합계와 다소 오차가 생길 수 있습니다.">성공</th>
                <th  title="평균 합계의 경우 반올림된 평균 데이터의 총합이라&#10;항목별 합계와 다소 오차가 생길 수 있습니다.">시도</th>
                <th  title="평균 합계의 경우 반올림된 평균 데이터의 총합이라&#10;항목별 합계와 다소 오차가 생길 수 있습니다.">실패</th>
                <th  title="평균 합계의 경우 반올림된 평균 데이터의 총합이라&#10;항목별 합계와 다소 오차가 생길 수 있습니다.">취소</th>
                <th  title="평균 합계의 경우 반올림된 평균 데이터의 총합이라&#10;항목별 합계와 다소 오차가 생길 수 있습니다.">성공률</th>
            </tr>
            </thead>
            <tbody id="tryTableBody"></tbody>
        </table>

        <table class="table table-bordered _tableHeight" data-height="23px">
            <colgroup>
                <col width="4.7%"/><col width="4.7%"/><col width="4.7%"/><col width="4.7%"/><col width="4.7%"/>
                <col width="4.7%"/><col width="0.1%"/><col width="4.7%"/><col width="4.7%"/><col width="4.7%"/>
                <col width="4.7%"/><col width="4.7%"/><col width="0.1%"/><col width="4.7%"/><col width="4.7%"/>
                <col width="4.7%"/><col width="4.7%"/><col width="4.7%"/><col width="0.1%"/><col width="4.7%"/>
                <col width="4.7%"/><col width="4.7%"/><col width="4.7%"/><col width="4.7%"/>
            </colgroup>
            <thead>
            <tr style="background-color: #b4c7e7">
                <th rowspan="2"></th>
                <th class="_tryDate" colspan="5" id="th_6"></th><td class="_noBorder"></td>
                <th class="_tryDate" colspan="5" id="th_5"></th><td class="_noBorder"></td>
                <th class="_tryDate" colspan="5" id="th_4"></th><td class="_noBorder"></td>
                <th class="_tryDate" colspan="5" id="th_3"></th>
            </tr>
            <tr style="background-color: #dae3f3">
                <th>성공</th>
                <th>시도</th>
                <th>실패</th>
                <th>취소</th>
                <th>성공률</th>
                <td class="_noBorder"></td>
                <th>성공</th>
                <th>시도</th>
                <th>실패</th>
                <th>취소</th>
                <th>성공률</th>
                <td class="_noBorder"></td>
                <th>성공</th>
                <th>시도</th>
                <th>실패</th>
                <th>취소</th>
                <th>성공률</th>
                <td class="_noBorder"></td>
                <th>성공</th>
                <th>시도</th>
                <th>실패</th>
                <th>취소</th>
                <th>성공률</th>
            </tr>
            </thead>
            <tbody id="tryTableBody_bottom"></tbody>
        </table>
    </div>
    <div class="widget-footer">
        <span>
            <%--<button class="btn btn-default print-btn pull-right" type="button" id="excelDownBtn"><i class="fa fa-print"></i>Excel Down</button>--%>
        </span>
    </div>
</div>
<a id='tryExcel' type='button' class="btn btn-default print-btn pull-right" download="" href="#" onclick="return ExcellentExport.excel(this, 'divTry', 'Sheet1');"><i class="fa fa-print"></i>Excel Down</a>

<script type="text/javascript">
    $(function() {
    });

    function getPayTryList(){
        $("#tryExcel").attr('download' , "결제현황_결제성공_시도_" + moment($("#startDate").val()).add('days', 0).format('YYYY.MM.DD') + ".xls");

        var slctType_date = [];
        for(i = 23; -1 < i; i-- ){
            slctType_date.push(i + " 시");
        }
        data = {
            slctType_date : slctType_date
        };

        var template = $('#tmp_dummyTryDetailList').html();
        var templateScript = Handlebars.compile(template);
        var context = data;
        var html=templateScript(context);
        $("#tryTableBody").html(html);

        var template = $('#tmp_dummyTryDetailList_bottom').html();
        var templateScript = Handlebars.compile(template);
        var context = data;
        var html=templateScript(context);
        $("#tryTableBody_bottom").html(html);

        $("#th_6").text(moment($("#startDate").val()).add('days', -6).format('YYYY.MM.DD') + " (" + week[moment($("#startDate").val()).add('days', -6).day()] + ")");
        $("#th_5").text(moment($("#startDate").val()).add('days', -5).format('YYYY.MM.DD') + " (" + week[moment($("#startDate").val()).add('days', -5).day()] + ")");
        $("#th_4").text(moment($("#startDate").val()).add('days', -4).format('YYYY.MM.DD') + " (" + week[moment($("#startDate").val()).add('days', -4).day()] + ")");
        $("#th_3").text(moment($("#startDate").val()).add('days', -3).format('YYYY.MM.DD') + " (" + week[moment($("#startDate").val()).add('days', -3).day()] + ")");
        $("#th_2").text(moment($("#startDate").val()).add('days', -2).format('YYYY.MM.DD') + " (" + week[moment($("#startDate").val()).add('days', -2).day()] + ")");
        $("#th_1").text(moment($("#startDate").val()).add('days', -1).format('YYYY.MM.DD') + " (" + week[moment($("#startDate").val()).add('days', -1).day()] + ")");
        $("#th_0").text(moment($("#startDate").val()).add('days', 0).format('YYYY.MM.DD') + " (" + week[moment($("#startDate").val()).add('days', 0).day()] + ")");

        var try_th_6 = moment($("#startDate").val()).add('days', -6).format('YYYY.MM.DD');
        var try_th_5 = moment($("#startDate").val()).add('days', -5).format('YYYY.MM.DD');
        var try_th_4 = moment($("#startDate").val()).add('days', -4).format('YYYY.MM.DD');
        var try_th_3 = moment($("#startDate").val()).add('days', -3).format('YYYY.MM.DD');
        var try_th_2 = moment($("#startDate").val()).add('days', -2).format('YYYY.MM.DD');
        var try_th_1 = moment($("#startDate").val()).add('days', -1).format('YYYY.MM.DD');
        var try_th_0 = moment($("#startDate").val()).add('days', 0).format('YYYY.MM.DD');

        var dateList = try_th_6 +"@"+ try_th_5 +"@"+ try_th_4 +"@"+ try_th_3 +"@"+ try_th_2 +"@"+ try_th_1 +"@"+ try_th_0;

        console.log(dateList);

        var data = {};
        data.dateList = dateList;
        data.slctType = 0;
        util.getAjaxData("try", "/rest/enter/pay/try", data, fn_tryPay_success);
    }

    function fn_tryPay_success(data, response){
        var title = "평균 합계의 경우 반올림된 평균 데이터의 총합이라\n항목별 합계와 다소 오차가 생길 수 있습니다.";

        var tmp_date = new Date();
        tmp_date = moment(tmp_date).format("YYYY.MM.DD HH:mm:SS");
        var tmp_day = tmp_date.split(" ")[0];
        var tmp_time = tmp_date.split(" ")[1];

        response.data.forEach(function(data, index){
            data.detailList.forEach(function(detail, detailIndex){

                $("#tryTableBody tr._tr_" + detail.hour + " td:eq(" + (3 * 4 + 1) + ")").attr('title',title);
                $("#tryTableBody tr._tr_" + detail.hour + " td:eq(" + (3 * 4 + 2) + ")").attr('title',title);
                $("#tryTableBody tr._tr_" + detail.hour + " td:eq(" + (3 * 4 + 3) + ")").attr('title',title);
                $("#tryTableBody tr._tr_" + detail.hour + " td:eq(" + (3 * 4 + 4) + ")").attr('title',title);
                $("#tryTableBody tr._tr_" + detail.hour + " td:eq(" + (3 * 4 + 5) + ")").attr('title',title);

                var tmp = "";

                var succCnt = detail.succCnt;
                var tryCnt = detail.tryCnt;
                var succRate = detail.succRate;
                var cancCnt = detail.cancCnt;
                var failCnt = detail.failCnt;
                if(succCnt != 0)
                    tmp = common.average((detail.succCnt / 7), (detail.tryCnt / 7)) + "%";

                if(succRate != 0)
                    succRate = succRate + "%";

                if (index == 4) {
                    $("#tryTableBody tr._tr_" + detail.hour + " td:eq(" + (1) + ")").html(common.addComma(succCnt,'Y'));
                    $("#tryTableBody tr._tr_" + detail.hour + " td:eq(" + (2) + ")").html(common.addComma(tryCnt,'Y'));
                    $("#tryTableBody tr._tr_" + detail.hour + " td:eq(" + (3) + ")").html(common.addComma(failCnt,'Y'));
                    $("#tryTableBody tr._tr_" + detail.hour + " td:eq(" + (4) + ")").html(common.addComma(cancCnt,'Y'));
                    $("#tryTableBody tr._tr_" + detail.hour + " td:eq(" + (5) + ")").html(common.addComma(succRate,'Y'));
                    if(Number(tmp_time.split(":")[0]) == detail.hour) {
                        for(var i = 1; i < 6 ; i ++){
                            $("#tryTableBody tr._tr_" + detail.hour + " td:eq(" + (i) + ")").css("background-color", "#e3ecfb");
                            $("#tryTableBody tr._tr_" + detail.hour + " td:eq(" + (i) + ")").css("font-weight", "bold");
                        }
                    }
                } else if (index == 7) {    // 평균
                    $("#tryTableBody tr._tr_" + detail.hour + " td:eq(" + (3 * 6 + 1) + ")").html(common.addComma((succCnt/7).toFixed(1),'Y'));
                    $("#tryTableBody tr._tr_" + detail.hour + " td:eq(" + (3 * 6 + 2) + ")").html(common.addComma((tryCnt/7).toFixed(1),'Y'));
                    $("#tryTableBody tr._tr_" + detail.hour + " td:eq(" + (3 * 6 + 3) + ")").html(common.addComma((failCnt / 7).toFixed(1),'Y'));
                    $("#tryTableBody tr._tr_" + detail.hour + " td:eq(" + (3 * 6 + 4) + ")").html(common.addComma((cancCnt/7).toFixed(1),'Y'));
                    $("#tryTableBody tr._tr_" + detail.hour + " td:eq(" + (3 * 6 + 5) + ")").html(tmp);
                    if(Number(tmp_time.split(":")[0]) == detail.hour) {
                        for(var i = 1; i < 6 ; i ++){
                            $("#tryTableBody tr._tr_" + detail.hour + " td:eq(" + (3 * 6 + i) + ")").css("background-color", "#e3ecfb");
                            $("#tryTableBody tr._tr_" + detail.hour + " td:eq(" + (3 * 6 + i) + ")").css("font-weight", "bold");
                        }
                    }
                } else if (index == 5 || index == 6) {
                    var tmpIndex=1;
                    if(index == 6){
                        tmpIndex=2;
                    }
                    $("#tryTableBody tr._tr_" + detail.hour + " td:eq(" + (tmpIndex * 6 + 1) + ")").html(common.addComma(succCnt,'Y'));
                    $("#tryTableBody tr._tr_" + detail.hour + " td:eq(" + (tmpIndex * 6 + 2) + ")").html(common.addComma(tryCnt,'Y'));
                    $("#tryTableBody tr._tr_" + detail.hour + " td:eq(" + (tmpIndex * 6 + 3) + ")").html(common.addComma(failCnt ,'Y'));
                    $("#tryTableBody tr._tr_" + detail.hour + " td:eq(" + (tmpIndex * 6 + 4) + ")").html(common.addComma(cancCnt,'Y'));
                    $("#tryTableBody tr._tr_" + detail.hour + " td:eq(" + (tmpIndex * 6 + 5) + ")").html(common.addComma(succRate,'Y'));
                    if(Number(tmp_time.split(":")[0]) == detail.hour) {
                        for(var i = 1; i < 6 ; i ++){
                            $("#tryTableBody tr._tr_" + detail.hour + " td:eq(" + (tmpIndex * 6 + i) + ")").css("background-color", "#e3ecfb");
                            $("#tryTableBody tr._tr_" + detail.hour + " td:eq(" + (tmpIndex * 6 + i) + ")").css("font-weight", "bold");
                        }
                    }
                }

                if (index == 0) {
                    $("#tryTableBody_bottom tr._tr_" + detail.hour + " td:eq(" + (1) + ")").html(common.addComma(succCnt,'Y'));
                    $("#tryTableBody_bottom tr._tr_" + detail.hour + " td:eq(" + (2) + ")").html(common.addComma(tryCnt,'Y'));
                    $("#tryTableBody_bottom tr._tr_" + detail.hour + " td:eq(" + (3) + ")").html(common.addComma(failCnt,'Y'));
                    $("#tryTableBody_bottom tr._tr_" + detail.hour + " td:eq(" + (4) + ")").html(common.addComma(cancCnt,'Y'));
                    $("#tryTableBody_bottom tr._tr_" + detail.hour + " td:eq(" + (5) + ")").html(common.addComma(succRate,'Y'));
                    if(Number(tmp_time.split(":")[0]) == detail.hour) {
                        for(var i = 1; i < 6 ; i ++){
                            $("#tryTableBody_bottom tr._tr_" + detail.hour + " td:eq(" + (i) + ")").css("background-color", "#e3ecfb");
                            $("#tryTableBody_bottom tr._tr_" + detail.hour + " td:eq(" + (i) + ")").css("font-weight", "bold");
                        }
                    }
                } else if (index == 1 || index == 2 || index == 3) {
                    $("#tryTableBody_bottom tr._tr_" + detail.hour + " td:eq(" + (index * 6 + 1) + ")").html(common.addComma(succCnt,'Y'));
                    $("#tryTableBody_bottom tr._tr_" + detail.hour + " td:eq(" + (index * 6 + 2) + ")").html(common.addComma(tryCnt,'Y'));
                    $("#tryTableBody_bottom tr._tr_" + detail.hour + " td:eq(" + (index * 6 + 3) + ")").html(common.addComma(failCnt,'Y'));
                    $("#tryTableBody_bottom tr._tr_" + detail.hour + " td:eq(" + (index * 6 + 4) + ")").html(common.addComma(cancCnt,'Y'));
                    $("#tryTableBody_bottom tr._tr_" + detail.hour + " td:eq(" + (index * 6 + 5) + ")").html(common.addComma(succRate,'Y'));
                    if(Number(tmp_time.split(":")[0]) == detail.hour) {
                        for(var i = 1; i < 6 ; i ++){
                            $("#tryTableBody_bottom tr._tr_" + detail.hour + " td:eq(" + (index * 6 + i) + ")").css("background-color", "#e3ecfb");
                            $("#tryTableBody_bottom tr._tr_" + detail.hour + " td:eq(" + (index * 6 + i) + ")").css("font-weight", "bold");
                        }
                    }
                }
            });
        });

        for(var i=0 ; i<response.data.length;i++) {
            var totalInfo = response.data[i].totalInfo;

            var sum_succCnt = totalInfo.sum_succCnt;
            var sum_tryCnt = totalInfo.sum_tryCnt;
            var sum_succRate = totalInfo.sum_succRate;
            var sum_cancCnt = totalInfo.sum_cancCnt;
            var sum_failCnt = totalInfo.sum_failCnt;
            var tmp = "";

            if (sum_succCnt != 0) {
                tmp = common.average((sum_succCnt / 7), (sum_tryCnt / 7)) + "%";
            }else{
                tmp = 0;
            }
            if (sum_succRate != 0) {
                sum_succRate = sum_succRate + "%";
            }else{
                sum_succRate = "0%";
            }

            if(i == 4){
                $("#tryTableBody tr:eq(0) td:eq(" + (1) + ")").html(common.addComma(sum_succCnt));
                $("#tryTableBody tr:eq(0) td:eq(" + (2) + ")").html(common.addComma(sum_tryCnt));
                $("#tryTableBody tr:eq(0) td:eq(" + (3) + ")").html(common.addComma(sum_failCnt));
                $("#tryTableBody tr:eq(0) td:eq(" + (4) + ")").html(common.addComma(sum_cancCnt));
                $("#tryTableBody tr:eq(0) td:eq(" + (5) + ")").html(sum_succRate);
                $("#tryTableBody tr:eq(25) td:eq(" + (1) + ")").html(common.addComma(sum_succCnt));
                $("#tryTableBody tr:eq(25) td:eq(" + (2) + ")").html(common.addComma(sum_tryCnt));
                $("#tryTableBody tr:eq(25) td:eq(" + (3) + ")").html(common.addComma(sum_failCnt));
                $("#tryTableBody tr:eq(25) td:eq(" + (4) + ")").html(common.addComma(sum_cancCnt));
                $("#tryTableBody tr:eq(25) td:eq(" + (5) + ")").html(sum_succRate);
            }else if(i == 7){
                $("#tryTableBody tr:eq(0) td:eq(" + (3 * 6 + 1) + ")").html(common.addComma((sum_succCnt/7).toFixed(1)));
                $("#tryTableBody tr:eq(0) td:eq(" + (3 * 6 + 2) + ")").html(common.addComma((sum_tryCnt/7).toFixed(1)));
                $("#tryTableBody tr:eq(0) td:eq(" + (3 * 6 + 3) + ")").html(common.addComma((sum_failCnt/7).toFixed(1)));
                $("#tryTableBody tr:eq(0) td:eq(" + (3 * 6 + 4) + ")").html(common.addComma((sum_cancCnt/7).toFixed(1)));
                $("#tryTableBody tr:eq(0) td:eq(" + (3 * 6 + 5) + ")").html(tmp);
                $("#tryTableBody tr:eq(25) td:eq(" + (3 * 6 + 1) + ")").html(common.addComma((sum_succCnt/7).toFixed(1)));
                $("#tryTableBody tr:eq(25) td:eq(" + (3 * 6 + 2) + ")").html(common.addComma((sum_tryCnt/7).toFixed(1)));
                $("#tryTableBody tr:eq(25) td:eq(" + (3 * 6 + 3) + ")").html(common.addComma((sum_failCnt/7).toFixed(1)));
                $("#tryTableBody tr:eq(25) td:eq(" + (3 * 6 + 4) + ")").html(common.addComma((sum_cancCnt/7).toFixed(1)));
                $("#tryTableBody tr:eq(25) td:eq(" + (3 * 6 + 5) + ")").html(tmp);
            }else if(i == 5 || i == 6){
                var tmpIndex=1;
                if(i == 6){
                    tmpIndex=2;
                }
                $("#tryTableBody tr:eq(0) td:eq(" + (tmpIndex * 6 + 1) + ")").html(common.addComma(sum_succCnt));
                $("#tryTableBody tr:eq(0) td:eq(" + (tmpIndex * 6 + 2) + ")").html(common.addComma(sum_tryCnt));
                $("#tryTableBody tr:eq(0) td:eq(" + (tmpIndex * 6 + 3) + ")").html(common.addComma(sum_failCnt));
                $("#tryTableBody tr:eq(0) td:eq(" + (tmpIndex * 6 + 4) + ")").html(common.addComma(sum_cancCnt));
                $("#tryTableBody tr:eq(0) td:eq(" + (tmpIndex * 6 + 5) + ")").html(tmp);
                $("#tryTableBody tr:eq(25) td:eq(" + (tmpIndex * 6 + 1) + ")").html(common.addComma(sum_succCnt));
                $("#tryTableBody tr:eq(25) td:eq(" + (tmpIndex * 6 + 2) + ")").html(common.addComma(sum_tryCnt));
                $("#tryTableBody tr:eq(25) td:eq(" + (tmpIndex * 6 + 3) + ")").html(common.addComma(sum_failCnt));
                $("#tryTableBody tr:eq(25) td:eq(" + (tmpIndex * 6 + 4) + ")").html(common.addComma(sum_cancCnt));
                $("#tryTableBody tr:eq(25) td:eq(" + (tmpIndex * 6 + 5) + ")").html(tmp);
            }


            if(i == 0){
                $("#tryTableBody_bottom tr:eq(0) td:eq(" + (1) + ")").html(common.addComma(sum_succCnt));
                $("#tryTableBody_bottom tr:eq(0) td:eq(" + (2) + ")").html(common.addComma(sum_tryCnt));
                $("#tryTableBody_bottom tr:eq(0) td:eq(" + (3) + ")").html(common.addComma(sum_failCnt));
                $("#tryTableBody_bottom tr:eq(0) td:eq(" + (4) + ")").html(common.addComma(sum_cancCnt));
                $("#tryTableBody_bottom tr:eq(0) td:eq(" + (5) + ")").html(sum_succRate);
                $("#tryTableBody_bottom tr:eq(25) td:eq(" + (1) + ")").html(common.addComma(sum_succCnt));
                $("#tryTableBody_bottom tr:eq(25) td:eq(" + (2) + ")").html(common.addComma(sum_tryCnt));
                $("#tryTableBody_bottom tr:eq(25) td:eq(" + (3) + ")").html(common.addComma(sum_failCnt));
                $("#tryTableBody_bottom tr:eq(25) td:eq(" + (4) + ")").html(common.addComma(sum_cancCnt));
                $("#tryTableBody_bottom tr:eq(25) td:eq(" + (5) + ")").html(sum_succRate);
            }else if(i == 1 || i == 2 || i == 3){
                $("#tryTableBody_bottom tr:eq(0) td:eq(" + (i * 6 + 1) + ")").html(common.addComma(sum_succCnt));
                $("#tryTableBody_bottom tr:eq(0) td:eq(" + (i * 6 + 2) + ")").html(common.addComma(sum_tryCnt));
                $("#tryTableBody_bottom tr:eq(0) td:eq(" + (i * 6 + 3) + ")").html(common.addComma(sum_failCnt));
                $("#tryTableBody_bottom tr:eq(0) td:eq(" + (i * 6 + 4) + ")").html(common.addComma(sum_cancCnt));
                $("#tryTableBody_bottom tr:eq(0) td:eq(" + (i * 6 + 5) + ")").html(tmp);
                $("#tryTableBody_bottom tr:eq(25) td:eq(" + (i * 6 + 1) + ")").html(common.addComma(sum_succCnt));
                $("#tryTableBody_bottom tr:eq(25) td:eq(" + (i * 6 + 2) + ")").html(common.addComma(sum_tryCnt));
                $("#tryTableBody_bottom tr:eq(25) td:eq(" + (i * 6 + 3) + ")").html(common.addComma(sum_failCnt));
                $("#tryTableBody_bottom tr:eq(25) td:eq(" + (i * 6 + 4) + ")").html(common.addComma(sum_cancCnt));
                $("#tryTableBody_bottom tr:eq(25) td:eq(" + (i * 6 + 5) + ")").html(tmp);
            }
        }
        ui.tableHeightSet();
    }
</script>

<script type="text/x-handlebars-template" id="tmp_dummyTryDetailList">
    <tr class="_tr_total font-bold" style="background-color: #b4c7e7">
        <td>합계</td>
        <td></td><td></td><td></td><td></td><td></td><td style="border-bottom: hidden;border-top: hidden;background-color: white"></td>
        <td></td><td></td><td></td><td></td><td></td><td style="border-bottom: hidden;border-top: hidden;background-color: white"></td>
        <td style="background-color: #fff2cc"></td><td style="background-color: #fff2cc"></td><td style="background-color: #fff2cc"></td><td style="background-color: #fff2cc"></td><td style="background-color: #fff2cc"></td><td style="border-bottom: hidden;border-top: hidden;background-color: white"></td>
        <td title="평균 합계의 경우 반올림된 평균 데이터의 총합이라&#10;항목별 합계와 다소 오차가 생길 수 있습니다."></td>
        <td title="평균 합계의 경우 반올림된 평균 데이터의 총합이라&#10;항목별 합계와 다소 오차가 생길 수 있습니다."></td>
        <td title="평균 합계의 경우 반올림된 평균 데이터의 총합이라&#10;항목별 합계와 다소 오차가 생길 수 있습니다."></td>
        <td title="평균 합계의 경우 반올림된 평균 데이터의 총합이라&#10;항목별 합계와 다소 오차가 생길 수 있습니다."></td>
        <td title="평균 합계의 경우 반올림된 평균 데이터의 총합이라&#10;항목별 합계와 다소 오차가 생길 수 있습니다."></td>
    </tr>
    {{#each this.slctType_date}}
        <tr class="_tr_{{this}}">
            <td class="font-bold" style="background-color: #dae3f3">{{this}}</td>
            <td></td><td></td><td></td><td></td><td></td><td style="border-bottom: hidden;border-top: hidden"></td>
            <td></td><td></td><td></td><td></td><td></td><td style="border-bottom: hidden;border-top: hidden"></td>
            <td style="background-color: #FFF7E5"></td><td style="background-color: #FFF7E5"></td><td style="background-color: #FFF7E5"></td><td style="background-color: #FFF7E5"></td><td style="background-color: #FFF7E5"></td><td style="border-bottom: hidden;border-top: hidden"></td>
            <td></td><td></td><td></td><td></td><td></td>
        </tr>
    {{/each}}
    <tr class="_tr_total font-bold" style="background-color: #b4c7e7">
        <td>합계</td>
        <td></td><td></td><td></td><td></td><td></td><td style="border-bottom: hidden;border-top: hidden;background-color: white"></td>
        <td></td><td></td><td></td><td></td><td></td><td style="border-bottom: hidden;border-top: hidden;background-color: white"></td>
        <td style="background-color: #fff2cc"></td><td style="background-color: #fff2cc"></td><td style="background-color: #fff2cc"></td><td style="background-color: #fff2cc"></td><td style="background-color: #fff2cc"></td><td style="border-bottom: hidden;border-top: hidden;background-color: white"></td>
        <td title="평균 합계의 경우 반올림된 평균 데이터의 총합이라&#10;항목별 합계와 다소 오차가 생길 수 있습니다."></td>
        <td title="평균 합계의 경우 반올림된 평균 데이터의 총합이라&#10;항목별 합계와 다소 오차가 생길 수 있습니다."></td>
        <td title="평균 합계의 경우 반올림된 평균 데이터의 총합이라&#10;항목별 합계와 다소 오차가 생길 수 있습니다."></td>
        <td title="평균 합계의 경우 반올림된 평균 데이터의 총합이라&#10;항목별 합계와 다소 오차가 생길 수 있습니다."></td>
        <td title="평균 합계의 경우 반올림된 평균 데이터의 총합이라&#10;항목별 합계와 다소 오차가 생길 수 있습니다."></td>
    </tr>
</script>


<script type="text/x-handlebars-template" id="tmp_dummyTryDetailList_bottom">
    <tr class="_tr_total font-bold" style="background-color: #b4c7e7">
        <td>합계</td>
        <td></td><td></td><td></td><td></td><td></td><td style="border-bottom: hidden;border-top: hidden;background-color: white"></td>
        <td></td><td></td><td></td><td></td><td></td><td style="border-bottom: hidden;border-top: hidden;background-color: white"></td>
        <td></td><td></td><td></td><td></td><td></td><td style="border-bottom: hidden;border-top: hidden;background-color: white"></td>
        <td></td><td></td><td></td><td></td><td></td>
    </tr>
    {{#each this.slctType_date}}
    <tr class="_tr_{{this}}">
        <td class="font-bold" style="background-color: #dae3f3">{{this}}</td>
        <td></td><td></td><td></td><td></td><td></td><td style="border-bottom: hidden;border-top: hidden"></td>
        <td></td><td></td><td></td><td></td><td></td><td style="border-bottom: hidden;border-top: hidden"></td>
        <td></td><td></td><td></td><td></td><td></td><td style="border-bottom: hidden;border-top: hidden"></td>
        <td></td><td></td><td></td><td></td><td></td>
    </tr>
    {{/each}}
    <tr class="_tr_total font-bold" style="background-color: #b4c7e7">
        <td>합계</td>
        <td></td><td></td><td></td><td></td><td></td><td style="border-bottom: hidden;border-top: hidden;background-color: white"></td>
        <td></td><td></td><td></td><td></td><td></td><td style="border-bottom: hidden;border-top: hidden;background-color: white"></td>
        <td></td><td></td><td></td><td></td><td></td><td style="border-bottom: hidden;border-top: hidden;background-color: white"></td>
        <td></td><td></td><td></td><td></td><td></td>
    </tr>
</script>

