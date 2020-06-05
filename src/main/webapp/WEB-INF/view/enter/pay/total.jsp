<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 결제환불 > 총계 -->
<div class="widget widget-table mb10">
    <div class="widget-content mt10">
        <%--<a href="javascript://" class="_prevSearch">[이전]</a>--%>
        <span class="_searchDate"></span>
        <%--<a href="javascript://" class="_nextSearch">[다음]</a>--%>
        <table class="table table-bordered mb0">
            <colgroup>
                <col width="6.5%"/><col width="5.5%"/><col width="5.5%"/><col width="5.5%"/><col width="5.5%"/>
                <col width="5.5%"/><col width="5.5%"/><col width="5.5%"/><col width="5.5%"/><col width="5.5%"/>
                <col width="5.5%"/><col width="5.5%"/><col width="5.5%"/><col width="5.5%"/><col width="5.5%"/>
                <col width="5.5%"/><col width="5.5%"/><col width="5.5%"/>
            </colgroup>
            <thead>
            <tr style="background-color: #b4c7e7">
                <th rowspan="2"></th>
                <th class="_totalDate" colspan="4" id="total_th_2"></th>
                <th class="_totalDate" colspan="4" id="total_th_1"></th>
                <th class="_totalDate" colspan="4" id="total_th_0" style="background-color: #ffe699"></th>
                <th colspan="4">평균</th>
            </tr>
            <tr style="background-color: #dae3f3">
                <th>건수</th>
                <th>결제</th>
                <th>누적</th>
                <th>환불</th>

                <th>건수</th>
                <th>결제</th>
                <th>누적</th>
                <th>환불</th>

                <th style="background-color: #fff2cc">건수</th>
                <th style="background-color: #fff2cc">결제</th>
                <th style="background-color: #fff2cc">누적</th>
                <th style="background-color: #fff2cc">환불</th>

                <th>건수</th>
                <th>결제</th>
                <th>누적</th>
                <th>환불</th>

            </tr>
            </thead>
            <tbody id="totalTableBody"></tbody>
        </table>

        <table class="table table-bordered">
            <colgroup>
                <col width="6.5%"/><col width="5.5%"/><col width="5.5%"/><col width="5.5%"/><col width="5.5%"/>
                <col width="5.5%"/><col width="5.5%"/><col width="5.5%"/><col width="5.5%"/><col width="5.5%"/>
                <col width="5.5%"/><col width="5.5%"/><col width="5.5%"/><col width="5.5%"/><col width="5.5%"/>
                <col width="5.5%"/><col width="5.5%"/><col width="5.5%"/>
            </colgroup>
            <thead>
            <tr style="background-color: #b4c7e7">
                <th rowspan="2"></th>
                <th class="_totalDate" colspan="4" id="total_th_6"></th>
                <th class="_totalDate" colspan="4" id="total_th_5"></th>
                <th class="_totalDate" colspan="4" id="total_th_4"></th>
                <th class="_totalDate" colspan="4" id="total_th_3"></th>
            </tr>
            <tr style="background-color: #dae3f3">
                <th>건수</th>
                <th>결제</th>
                <th>누적</th>
                <th>환불</th>

                <th>건수</th>
                <th>결제</th>
                <th>누적</th>
                <th>환불</th>

                <th>건수</th>
                <th>결제</th>
                <th>누적</th>
                <th>환불</th>

                <th>건수</th>
                <th>결제</th>
                <th>누적</th>
                <th>환불</th>

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
    $(function() {
    });

    var tmp = 0;
    var tmp_end = 0;
    var type;
    function getPayTotalList(){
        var slctType = $('input[name="slctType"]:checked').val();
        if(slctType == 0){
            tmp_end = -1;
            tmp = 23;
            type = "시";
        }else if (slctType == 1){
            tmp_end = 0;
            tmp = 31;
            type = "일";
        }else if (slctType == 2){
            tmp_end = 0;
            tmp = 12;
            type = "월";
        }

        var slctType_date = [];
        for(i = tmp; tmp_end < i; i-- ){
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


        var total_th_6;
        var total_th_5;
        var total_th_4;
        var total_th_3;
        var total_th_2;
        var total_th_1;
        var total_th_0;

        console.log($('input[name="slctType"]:checked').val());


        if($('input[name="slctType"]:checked').val() == "0"){
            $("#total_th_6").text(moment($("#startDate").val()).add('days', -6).format('YYYY.MM.DD'));
            $("#total_th_5").text(moment($("#startDate").val()).add('days', -5).format('YYYY.MM.DD'));
            $("#total_th_4").text(moment($("#startDate").val()).add('days', -4).format('YYYY.MM.DD'));
            $("#total_th_3").text(moment($("#startDate").val()).add('days', -3).format('YYYY.MM.DD'));
            $("#total_th_2").text(moment($("#startDate").val()).add('days', -2).format('YYYY.MM.DD'));
            $("#total_th_1").text(moment($("#startDate").val()).add('days', -1).format('YYYY.MM.DD'));
            $("#total_th_0").text(moment($("#startDate").val()).add('days', 0).format('YYYY.MM.DD'));

            total_th_6 = moment($("#startDate").val()).add('days', -6).format('YYYY.MM.DD');
            total_th_5 = moment($("#startDate").val()).add('days', -5).format('YYYY.MM.DD');
            total_th_4 = moment($("#startDate").val()).add('days', -4).format('YYYY.MM.DD');
            total_th_3 = moment($("#startDate").val()).add('days', -3).format('YYYY.MM.DD');
            total_th_2 = moment($("#startDate").val()).add('days', -2).format('YYYY.MM.DD');
            total_th_1 = moment($("#startDate").val()).add('days', -1).format('YYYY.MM.DD');
            total_th_0 = moment($("#startDate").val()).add('days', 0).format('YYYY.MM.DD');

        }else if($('input[name="slctType"]:checked').val() == "1"){
            $("#total_th_6").text(moment($("#startDate").val()).add('months', -6).format('YYYY.MM'));
            $("#total_th_5").text(moment($("#startDate").val()).add('months', -5).format('YYYY.MM'));
            $("#total_th_4").text(moment($("#startDate").val()).add('months', -4).format('YYYY.MM'));
            $("#total_th_3").text(moment($("#startDate").val()).add('months', -3).format('YYYY.MM'));
            $("#total_th_2").text(moment($("#startDate").val()).add('months', -2).format('YYYY.MM'));
            $("#total_th_1").text(moment($("#startDate").val()).add('months', -1).format('YYYY.MM'));
            $("#total_th_0").text(moment($("#startDate").val()).add('months', 0).format('YYYY.MM'));

            total_th_6 = moment($("#startDate").val()).add('months', -6).format('YYYY.MM.01') + " - " + moment($("#startDate").val()).add('months', -5).add('days', -1).format('YYYY.MM.DD');
            total_th_5 = moment($("#startDate").val()).add('months', -5).format('YYYY.MM.01') + " - " + moment($("#startDate").val()).add('months', -4).add('days', -1).format('YYYY.MM.DD');
            total_th_4 = moment($("#startDate").val()).add('months', -4).format('YYYY.MM.01') + " - " + moment($("#startDate").val()).add('months', -3).add('days', -1).format('YYYY.MM.DD');
            total_th_3 = moment($("#startDate").val()).add('months', -3).format('YYYY.MM.01') + " - " + moment($("#startDate").val()).add('months', -2).add('days', -1).format('YYYY.MM.DD');
            total_th_2 = moment($("#startDate").val()).add('months', -2).format('YYYY.MM.01') + " - " + moment($("#startDate").val()).add('months', -1).add('days', -1).format('YYYY.MM.DD');
            total_th_1 = moment($("#startDate").val()).add('months', -1).format('YYYY.MM.01') + " - " + moment($("#startDate").val()).add('months', 0).add('days', -1).format('YYYY.MM.DD');
            total_th_0 = moment($("#startDate").val()).add('months', 0).format('YYYY.MM.01') + " - " + moment($("#startDate").val()).add('months', 1).add('days', -1).format('YYYY.MM.DD');

        }else if($('input[name="slctType"]:checked').val() == "2"){
            $("#total_th_6").text(moment($("#startDate").val()).add('years', -6).format('YYYY'));
            $("#total_th_5").text(moment($("#startDate").val()).add('years', -5).format('YYYY'));
            $("#total_th_4").text(moment($("#startDate").val()).add('years', -4).format('YYYY'));
            $("#total_th_3").text(moment($("#startDate").val()).add('years', -3).format('YYYY'));
            $("#total_th_2").text(moment($("#startDate").val()).add('years', -2).format('YYYY'));
            $("#total_th_1").text(moment($("#startDate").val()).add('years', -1).format('YYYY'));
            $("#total_th_0").text(moment($("#startDate").val()).add('years', 0).format('YYYY'));

            total_th_6 = moment($("#startDate").val()).add('months', -6).format('YYYY.01.01') + " - " + moment($("#startDate").val()).add('months', -5).add('days', -1).format('YYYY.12.31');
            total_th_5 = moment($("#startDate").val()).add('months', -5).format('YYYY.01.01') + " - " + moment($("#startDate").val()).add('months', -4).add('days', -1).format('YYYY.12.31');
            total_th_4 = moment($("#startDate").val()).add('months', -4).format('YYYY.01.01') + " - " + moment($("#startDate").val()).add('months', -3).add('days', -1).format('YYYY.12.31');
            total_th_3 = moment($("#startDate").val()).add('months', -3).format('YYYY.01.01') + " - " + moment($("#startDate").val()).add('months', -2).add('days', -1).format('YYYY.12.31');
            total_th_2 = moment($("#startDate").val()).add('months', -2).format('YYYY.01.01') + " - " + moment($("#startDate").val()).add('months', -1).add('days', -1).format('YYYY.12.31');
            total_th_1 = moment($("#startDate").val()).add('months', -1).format('YYYY.01.01') + " - " + moment($("#startDate").val()).add('months', 0).add('days', -1).format('YYYY.12.31');
            total_th_0 = moment($("#startDate").val()).add('months', 0).format('YYYY.01.01') + " - " + moment($("#startDate").val()).add('months', 1).add('days', -1).format('YYYY.12.31');
        }
        var dateList = total_th_2 + "@" + total_th_1 + "@" + total_th_0 + "@" + total_th_6 + "@" + total_th_5 + "@" + total_th_4  + "@" +  total_th_3;
        var data = {};

        console.log(dateList);


        data.dateList = dateList;
        data.slctType = $('input[name="slctType"]:checked').val();
        util.getAjaxData("total", "/rest/enter/pay/total", data, fn_totalPay_success);
    }

    function fn_totalPay_success(data, response){
        dalbitLog(response);

        tmp_index = -1;
        response.data.forEach(function(data, index){
            if(index > 2){
                ++tmp_index;
            }
            data.detailList.forEach(function(detail, detailIndex){
                if(detail.succAmt == 0){
                    detail.accumAmt = 0;
                }
                if($('input[name="slctType"]:checked').val() == "0") {
                    // 상단
                    if (index == 0) {
                        $("#totalTableBody tr._tr_" + detail.hour + " td:eq(" + (index + 1) + ")").html(common.addComma(detail.succCnt));
                        $("#totalTableBody tr._tr_" + detail.hour + " td:eq(" + (index + 2) + ")").html(common.vatMinus(detail.succAmt));
                        $("#totalTableBody tr._tr_" + detail.hour + " td:eq(" + (index + 3) + ")").html(common.vatMinus(detail.accumAmt));
                        $("#totalTableBody tr._tr_" + detail.hour + " td:eq(" + (index + 4) + ")").html(0);
                    } else if (index == 1 || index == 2) {
                        $("#totalTableBody tr._tr_" + detail.hour + " td:eq(" + (index * 4 + 1) + ")").html(common.addComma(detail.succCnt));
                        $("#totalTableBody tr._tr_" + detail.hour + " td:eq(" + (index * 4 + 2) + ")").html(common.vatMinus(detail.succAmt));
                        $("#totalTableBody tr._tr_" + detail.hour + " td:eq(" + (index * 4 + 3) + ")").html(common.vatMinus(detail.accumAmt));
                        $("#totalTableBody tr._tr_" + detail.hour + " td:eq(" + (index * 4 + 4) + ")").html(0);
                    } else if(index == 7) {
                        $("#totalTableBody tr._tr_" + detail.hour + " td:eq(" + (3 * 4 + 1) + ")").html(common.addComma(detail.succCnt));
                        $("#totalTableBody tr._tr_" + detail.hour + " td:eq(" + (3 * 4 + 2) + ")").html(common.vatMinus(detail.succAmt));
                        $("#totalTableBody tr._tr_" + detail.hour + " td:eq(" + (3 * 4 + 3) + ")").html(common.vatMinus(detail.accumAmt));
                        $("#totalTableBody tr._tr_" + detail.hour + " td:eq(" + (3 * 4 + 4) + ")").html(0);
                    }
                    // 하단
                    if (index == 3) {
                        $("#totalTableBody2 tr._tr_" + detail.hour + " td:eq(" + (tmp_index + 1) + ")").html(common.addComma(detail.succCnt));
                        $("#totalTableBody2 tr._tr_" + detail.hour + " td:eq(" + (tmp_index + 2) + ")").html(common.vatMinus(detail.succAmt));
                        $("#totalTableBody2 tr._tr_" + detail.hour + " td:eq(" + (tmp_index + 3) + ")").html(common.vatMinus(detail.accumAmt));
                        $("#totalTableBody2 tr._tr_" + detail.hour + " td:eq(" + (tmp_index + 4) + ")").html(0);
                    }else if(index == 4 || index == 5 || index == 6){
                        $("#totalTableBody2 tr._tr_" + detail.hour + " td:eq(" + (tmp_index * 4 + 1) + ")").html(common.addComma(detail.succCnt));
                        $("#totalTableBody2 tr._tr_" + detail.hour + " td:eq(" + (tmp_index * 4 + 2) + ")").html(common.vatMinus(detail.succAmt));
                        $("#totalTableBody2 tr._tr_" + detail.hour + " td:eq(" + (tmp_index * 4 + 3) + ")").html(common.vatMinus(detail.accumAmt));
                        $("#totalTableBody2 tr._tr_" + detail.hour + " td:eq(" + (tmp_index * 4 + 4) + ")").html(0);
                    }

                } else if($('input[name="slctType"]:checked').val() == "1"){
                    //상단
                    if (index == 0) {
                        $("#totalTableBody tr._tr_" + (detail.day) + " td:eq(" + (index + 1) + ")").html(common.addComma(detail.succCnt));
                        $("#totalTableBody tr._tr_" + (detail.day) + " td:eq(" + (index + 2) + ")").html(common.vatMinus(detail.succAmt));
                        $("#totalTableBody tr._tr_" + (detail.day) + " td:eq(" + (index + 3) + ")").html(common.vatMinus(detail.accumAmt));
                        $("#totalTableBody tr._tr_" + (detail.day) + " td:eq(" + (index + 4) + ")").html(0);
                    } else if (index == 1 || index == 2) {
                        $("#totalTableBody tr._tr_" + (detail.day) + " td:eq(" + (index * 4 + 1) + ")").html(common.addComma(detail.succCnt));
                        $("#totalTableBody tr._tr_" + (detail.day) + " td:eq(" + (index * 4 + 2) + ")").html(common.vatMinus(detail.succAmt));
                        $("#totalTableBody tr._tr_" + (detail.day) + " td:eq(" + (index * 4 + 3) + ")").html(common.vatMinus(detail.accumAmt));
                        $("#totalTableBody tr._tr_" + (detail.day) + " td:eq(" + (index * 4 + 4) + ")").html(0);
                    } else if(index == 7) {
                        $("#totalTableBody tr._tr_" + (detail.day) + " td:eq(" + (3 * 4 + 1) + ")").html(common.addComma(detail.succCnt));
                        $("#totalTableBody tr._tr_" + (detail.day) + " td:eq(" + (3 * 4 + 2) + ")").html(common.vatMinus(detail.succAmt));
                        $("#totalTableBody tr._tr_" + (detail.day) + " td:eq(" + (3 * 4 + 3) + ")").html(common.vatMinus(detail.accumAmt));
                        $("#totalTableBody tr._tr_" + (detail.day) + " td:eq(" + (3 * 4 + 4) + ")").html(0);
                    }
                    // 하단
                    if (index == 3) {
                        $("#totalTableBody2 tr._tr_" + (detail.day) + " td:eq(" + (tmp_index + 1) + ")").html(common.addComma(detail.succCnt));
                        $("#totalTableBody2 tr._tr_" + (detail.day) + " td:eq(" + (tmp_index + 2) + ")").html(common.vatMinus(detail.succAmt));
                        $("#totalTableBody2 tr._tr_" + (detail.day) + " td:eq(" + (tmp_index + 3) + ")").html(common.vatMinus(detail.accumAmt));
                        $("#totalTableBody2 tr._tr_" + (detail.day) + " td:eq(" + (tmp_index + 4) + ")").html(0);
                    } else if (index == 4 || index == 5 || index == 6){
                        $("#totalTableBody2 tr._tr_" + (detail.day) + " td:eq(" + (tmp_index * 4 + 1) + ")").html(common.addComma(detail.succCnt));
                        $("#totalTableBody2 tr._tr_" + (detail.day) + " td:eq(" + (tmp_index * 4 + 2) + ")").html(common.vatMinus(detail.succAmt));
                        $("#totalTableBody2 tr._tr_" + (detail.day) + " td:eq(" + (tmp_index * 4 + 3) + ")").html(common.vatMinus(detail.accumAmt));
                        $("#totalTableBody2 tr._tr_" + (detail.day) + " td:eq(" + (tmp_index * 4 + 4) + ")").html(0);
                    }
                } else if($('input[name="slctType"]:checked').val() == "2") {
                    //상단
                    if (index == 0) {
                        $("#totalTableBody tr._tr_" + (detail.monthly) + " td:eq(" + (index + 1) + ")").html(common.addComma(detail.succCnt));
                        $("#totalTableBody tr._tr_" + (detail.monthly) + " td:eq(" + (index + 2) + ")").html(common.vatMinus(detail.succAmt));
                        $("#totalTableBody tr._tr_" + (detail.monthly) + " td:eq(" + (index + 3) + ")").html(common.vatMinus(detail.accumAmt));
                        $("#totalTableBody tr._tr_" + (detail.monthly) + " td:eq(" + (index + 4) + ")").html(0);
                    } else if (index == 1 || index == 2) {
                        $("#totalTableBody tr._tr_" + (detail.monthly) + " td:eq(" + (index * 4 + 1) + ")").html(common.addComma(detail.succCnt));
                        $("#totalTableBody tr._tr_" + (detail.monthly) + " td:eq(" + (index * 4 + 2) + ")").html(common.vatMinus(detail.succAmt));
                        $("#totalTableBody tr._tr_" + (detail.monthly) + " td:eq(" + (index * 4 + 3) + ")").html(common.vatMinus(detail.accumAmt));
                        $("#totalTableBody tr._tr_" + (detail.monthly) + " td:eq(" + (index * 4 + 4) + ")").html(0);
                    } else if(index == 7) {
                        $("#totalTableBody tr._tr_" + (detail.monthly) + " td:eq(" + (3 * 4 + 1) + ")").html(common.addComma(detail.succCnt));
                        $("#totalTableBody tr._tr_" + (detail.monthly) + " td:eq(" + (3 * 4 + 2) + ")").html(common.vatMinus(detail.succAmt));
                        $("#totalTableBody tr._tr_" + (detail.monthly) + " td:eq(" + (3 * 4 + 3) + ")").html(common.vatMinus(detail.accumAmt));
                        $("#totalTableBody tr._tr_" + (detail.monthly) + " td:eq(" + (3 * 4 + 4) + ")").html(0);
                    }
                    //하단
                    if (index == 3){
                        $("#totalTableBody2 tr._tr_" + (detail.monthly) + " td:eq(" + (tmp_index + 1) + ")").html(common.addComma(detail.succCnt));
                        $("#totalTableBody2 tr._tr_" + (detail.monthly) + " td:eq(" + (tmp_index + 2) + ")").html(common.vatMinus(detail.succAmt));
                        $("#totalTableBody2 tr._tr_" + (detail.monthly) + " td:eq(" + (tmp_index + 3) + ")").html(common.vatMinus(detail.accumAmt));
                        $("#totalTableBody2 tr._tr_" + (detail.monthly) + " td:eq(" + (tmp_index + 4) + ")").html(0);
                    } else if (index == 4 || index == 5 || index == 6) {
                        $("#totalTableBody2 tr._tr_" + (detail.monthly) + " td:eq(" + (tmp_index * 4 + 1) + ")").html(common.addComma(detail.succCnt));
                        $("#totalTableBody2 tr._tr_" + (detail.monthly) + " td:eq(" + (tmp_index * 4 + 2) + ")").html(common.vatMinus(detail.succAmt));
                        $("#totalTableBody2 tr._tr_" + (detail.monthly) + " td:eq(" + (tmp_index * 4 + 3) + ")").html(common.vatMinus(detail.accumAmt));
                        $("#totalTableBody2 tr._tr_" + (detail.monthly) + " td:eq(" + (tmp_index * 4 + 4) + ")").html(0);
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
            if(i == 0){
                //총합
                $("#totalTableBody tr:eq(0) td:eq(" + (i + 1) + ")").html(common.addComma(totalInfo.sum_succCnt));
                $("#totalTableBody tr:eq(0) td:eq(" + (i + 2) + ")").html(common.vatMinus(totalInfo.sum_succAmt));
                $("#totalTableBody tr:eq(0) td:eq(" + (i + 3) + ")").html(0);
                //첫구매
                $("#totalTableBody tr:eq(1) td:eq(" + (i + 1) + ")").html(common.addComma(totalInfo.sum_firstCnt));
                $("#totalTableBody tr:eq(1) td:eq(" + (i + 2) + ")").html(common.vatMinus(totalInfo.sum_firstAmt));
                $("#totalTableBody tr:eq(1) td:eq(" + (i + 3) + ")").html(0);
                //재구매
                $("#totalTableBody tr:eq(2) td:eq(" + (i + 1) + ")").html(common.addComma(totalInfo.sum_reCnt));
                $("#totalTableBody tr:eq(2) td:eq(" + (i + 2) + ")").html(common.vatMinus(totalInfo.sum_reAmt));
                $("#totalTableBody tr:eq(2) td:eq(" + (i + 3) + ")").html(0);
            }else if(i == 1 || i == 2) {
                //총합
                $("#totalTableBody tr:eq(0) td:eq(" + (i * 3 + 1) + ")").html(common.addComma(totalInfo.sum_succCnt));
                $("#totalTableBody tr:eq(0) td:eq(" + (i * 3 + 2) + ")").html(common.vatMinus(totalInfo.sum_succAmt));
                $("#totalTableBody tr:eq(0) td:eq(" + (i * 3 + 3) + ")").html(0);
                //첫구매
                $("#totalTableBody tr:eq(1) td:eq(" + (i * 3 + 1) + ")").html(common.addComma(totalInfo.sum_firstCnt));
                $("#totalTableBody tr:eq(1) td:eq(" + (i * 3 + 2) + ")").html(common.vatMinus(totalInfo.sum_firstAmt));
                $("#totalTableBody tr:eq(1) td:eq(" + (i * 3 + 3) + ")").html(0);
                //재구매
                $("#totalTableBody tr:eq(2) td:eq(" + (i * 3 + 1) + ")").html(common.addComma(totalInfo.sum_reCnt));
                $("#totalTableBody tr:eq(2) td:eq(" + (i * 3 + 2) + ")").html(common.vatMinus(totalInfo.sum_reAmt));
                $("#totalTableBody tr:eq(2) td:eq(" + (i * 3 + 3) + ")").html(0);
            }else if(i == 7){
                //총합
                $("#totalTableBody tr:eq(0) td:eq(" + (3 * 3 + 1) + ")").html(common.addComma(totalInfo.sum_succCnt));
                $("#totalTableBody tr:eq(0) td:eq(" + (3 * 3 + 2) + ")").html(common.vatMinus(totalInfo.sum_succAmt));
                $("#totalTableBody tr:eq(0) td:eq(" + (3 * 3 + 3) + ")").html(0);
                //첫구매
                $("#totalTableBody tr:eq(1) td:eq(" + (3 * 3 + 1) + ")").html(common.addComma(totalInfo.sum_firstCnt));
                $("#totalTableBody tr:eq(1) td:eq(" + (3 * 3 + 2) + ")").html(common.vatMinus(totalInfo.sum_firstAmt));
                $("#totalTableBody tr:eq(1) td:eq(" + (3 * 3 + 3) + ")").html(0);
                //재구매
                $("#totalTableBody tr:eq(2) td:eq(" + (3 * 3 + 1) + ")").html(common.addComma(totalInfo.sum_reCnt));
                $("#totalTableBody tr:eq(2) td:eq(" + (3 * 3 + 2) + ")").html(common.vatMinus(totalInfo.sum_reAmt));
                $("#totalTableBody tr:eq(2) td:eq(" + (3 * 3 + 3) + ")").html(0);
            }

            if(i == 3){
                //총합
                $("#totalTableBody2 tr:eq(0) td:eq(" + (tmp_index + 1) + ")").html(common.addComma(totalInfo.sum_succCnt));
                $("#totalTableBody2 tr:eq(0) td:eq(" + (tmp_index + 2) + ")").html(common.vatMinus(totalInfo.sum_succAmt));
                $("#totalTableBody2 tr:eq(0) td:eq(" + (tmp_index + 3) + ")").html(0);
                //첫구매
                $("#totalTableBody2 tr:eq(1) td:eq(" + (tmp_index + 1) + ")").html(common.addComma(totalInfo.sum_firstCnt));
                $("#totalTableBody2 tr:eq(1) td:eq(" + (tmp_index + 2) + ")").html(common.vatMinus(totalInfo.sum_firstAmt));
                $("#totalTableBody2 tr:eq(1) td:eq(" + (tmp_index + 3) + ")").html(0);
                //재구매
                $("#totalTableBody2 tr:eq(2) td:eq(" + (tmp_index + 1) + ")").html(common.addComma(totalInfo.sum_reCnt));
                $("#totalTableBody2 tr:eq(2) td:eq(" + (tmp_index + 2) + ")").html(common.vatMinus(totalInfo.sum_reAmt));
                $("#totalTableBody2 tr:eq(2) td:eq(" + (tmp_index + 3) + ")").html(0);
            }else if(i == 4 || i == 5 || i == 6) {
                //총합
                $("#totalTableBody2 tr:eq(0) td:eq(" + (tmp_index * 3 + 1) + ")").html(common.addComma(totalInfo.sum_succCnt));
                $("#totalTableBody2 tr:eq(0) td:eq(" + (tmp_index * 3 + 2) + ")").html(common.vatMinus(totalInfo.sum_succAmt));
                $("#totalTableBody2 tr:eq(0) td:eq(" + (tmp_index * 3 + 3) + ")").html(0);
                //첫구매
                $("#totalTableBody2 tr:eq(1) td:eq(" + (tmp_index * 3 + 1) + ")").html(common.addComma(totalInfo.sum_firstCnt));
                $("#totalTableBody2 tr:eq(1) td:eq(" + (tmp_index * 3 + 2) + ")").html(common.vatMinus(totalInfo.sum_firstAmt));
                $("#totalTableBody2 tr:eq(1) td:eq(" + (tmp_index * 3 + 3) + ")").html(0);
                //재구매
                $("#totalTableBody2 tr:eq(2) td:eq(" + (tmp_index * 3 + 1) + ")").html(common.addComma(totalInfo.sum_reCnt));
                $("#totalTableBody2 tr:eq(2) td:eq(" + (tmp_index * 3 + 2) + ")").html(common.vatMinus(totalInfo.sum_reAmt));
                $("#totalTableBody2 tr:eq(2) td:eq(" + (tmp_index * 3 + 3) + ")").html(0);
            }
        }
    }
</script>

<script type="text/x-handlebars-template" id="tmp_dummyTotalDetailList">
    <tr class="_tr_{{this}}">
        <td class="font-bold" style="background-color: #dae3f3">총합</td>
        <td>0</td><td colspan="2">0</td><td>0</td>
        <td>0</td><td colspan="2">0</td><td>0</td>
        <td style="background-color: #FFF7E5">0</td><td colspan="2" style="background-color: #FFF7E5">0</td><td style="background-color: #FFF7E5">0</td>
        <td>0</td><td colspan="2">0</td><td>0</td>
    </tr>
    <tr class="_tr_{{this}}">
        <td class="font-bold" style="background-color: #dae3f3">첫구매</td>
        <td>0</td><td colspan="2">0</td><td>0</td>
        <td>0</td><td colspan="2">0</td><td>0</td>
        <td style="background-color: #FFF7E5">0</td><td colspan="2" style="background-color: #FFF7E5">0</td><td style="background-color: #FFF7E5">0</td>
        <td>0</td><td colspan="2">0</td><td>0</td>
    </tr>
    <tr class="_tr_{{this}}">
        <td class="font-bold" style="background-color: #dae3f3">재구매</td>
        <td>0</td><td colspan="2">0</td><td>0</td>
        <td>0</td><td colspan="2">0</td><td>0</td>
        <td style="background-color: #FFF7E5">0</td><td colspan="2" style="background-color: #FFF7E5">0</td><td style="background-color: #FFF7E5">0</td>
        <td>0</td><td colspan="2">0</td><td>0</td>
    </tr>

    {{#each this.slctType_date}}
    <tr class="_tr_{{this}}">
        <td class="font-bold" style="background-color: #dae3f3">{{this}}</td>
        <td>0</td><td>0</td><td>0</td><td>0</td>
        <td>0</td><td>0</td><td>0</td><td>0</td>
        <td style="background-color: #FFF7E5">0</td><td style="background-color: #FFF7E5">0</td><td style="background-color: #FFF7E5">0</td><td style="background-color: #FFF7E5">0</td>
        <td>0</td><td>0</td><td>0</td><td>0</td>
    </tr>
    {{/each}}
</script>

<script type="text/x-handlebars-template" id="tmp_dummyTotalDetailList2">
    <tr class="_tr_{{this}}">
        <td class="font-bold" style="background-color: #dae3f3">총합</td>
        <td>0</td><td colspan="2">0</td><td>0</td>
        <td>0</td><td colspan="2">0</td><td>0</td>
        <td>0</td><td colspan="2">0</td><td>0</td>
        <td>0</td><td colspan="2">0</td><td>0</td>
    </tr>
    <tr class="_tr_{{this}}">
        <td class="font-bold" style="background-color: #dae3f3">첫구매</td>
        <td>0</td><td colspan="2">0</td><td>0</td>
        <td>0</td><td colspan="2">0</td><td>0</td>
        <td>0</td><td colspan="2">0</td><td>0</td>
        <td>0</td><td colspan="2">0</td><td>0</td>
    </tr>
    <tr class="_tr_{{this}}">
        <td class="font-bold" style="background-color: #dae3f3">재구매</td>
        <td>0</td><td colspan="2">0</td><td>0</td>
        <td>0</td><td colspan="2">0</td><td>0</td>
        <td>0</td><td colspan="2">0</td><td>0</td>
        <td>0</td><td colspan="2">0</td><td>0</td>
    </tr>
    {{#each this.slctType_date}}
    <tr class="_tr_{{this}}">
        <td class="font-bold" style="background-color: #dae3f3">{{this}}</td>
        <td>0</td><td>0</td><td>0</td><td>0</td>
        <td>0</td><td>0</td><td>0</td><td>0</td>
        <td>0</td><td>0</td><td>0</td><td>0</td>
        <td>0</td><td>0</td><td>0</td><td>0</td>
    </tr>
    {{/each}}
</script>

