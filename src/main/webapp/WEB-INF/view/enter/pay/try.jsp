<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 결제환불 > 총계 -->
<div class="widget widget-table mb10">
    <div class="widget-content mt10">
        <%--<a href="javascript://" class="_prevSearch">[이전]</a>--%>
        <span class="_searchDate"></span>
        <%--<a href="javascript://" class="_nextSearch">[다음]</a>--%>
        <table class="table table-bordered">
            <colgroup>
                <col width="3%"/><col width="3%"/><col width="3%"/><col width="3%"/><col width="0.1%"/>
                <col width="3%"/><col width="3%"/><col width="3%"/><col width="0.1%"/><col width="3%"/>
                <col width="3%"/><col width="3%"/><col width="0.1%"/><col width="3%"/><col width="3%"/>
                <col width="3%"/><col width="0.1%"/><col width="3%"/><col width="3%"/><col width="3%"/>
                <col width="0.1%"/><col width="3%"/><col width="3%"/><col width="3%"/><col width="0.1%"/>
                <col width="3%"/><col width="3%"/><col width="3%"/><col width="0.1%"/><col width="3%"/>
                <col width="3%"/><col width="3%"/>
            </colgroup>
            <thead>
            <tr style="background-color: #b4c7e7">
                <th rowspan="2"></th>
                <th class="_tryDate" colspan="3" id="th_6"></th><td class="_noBorder"></td>
                <th class="_tryDate" colspan="3" id="th_5"></th><td class="_noBorder"></td>
                <th class="_tryDate" colspan="3" id="th_4"></th><td class="_noBorder"></td>
                <th class="_tryDate" colspan="3" id="th_3"></th><td class="_noBorder"></td>
                <th class="_tryDate" colspan="3" id="th_2"></th><td class="_noBorder"></td>
                <th class="_tryDate" colspan="3" id="th_1"></th><td class="_noBorder"></td>
                <th class="_tryDate" colspan="3" id="th_0" style="background-color: #ffe699"></th><td class="_noBorder"></td>
                <th colspan="3">평균</th>
            </tr>
            <tr style="background-color: #dae3f3">
                <th>성공</th>
                <th>시도</th>
                <th>성공률</th>
                <td class="_noBorder"></td>
                <th>성공</th>
                <th>시도</th>
                <th>성공률</th>
                <td class="_noBorder"></td>
                <th>성공</th>
                <th>시도</th>
                <th>성공률</th>
                <td class="_noBorder"></td>
                <th>성공</th>
                <th>시도</th>
                <th>성공률</th>
                <td class="_noBorder"></td>
                <th>성공</th>
                <th>시도</th>
                <th>성공률</th>
                <td class="_noBorder"></td>
                <th>성공</th>
                <th>시도</th>
                <th>성공률</th>
                <td class="_noBorder"></td>
                <th style="background-color: #fff2cc">성공</th>
                <th style="background-color: #fff2cc">시도</th>
                <th style="background-color: #fff2cc">성공률</th>
                <td class="_noBorder"></td>
                <th>성공</th>
                <th>시도</th>
                <th>성공률</th>
            </tr>
            </thead>
            <tbody id="tryTableBody"></tbody>
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
    function getPayTryList(){
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

        var template = $('#tmp_dummyTryDetailList').html();
        var templateScript = Handlebars.compile(template);
        var context = data;
        var html=templateScript(context);
        $("#tryTableBody").html(html);

        var try_th_6;
        var try_th_5;
        var try_th_4;
        var try_th_3;
        var try_th_2;
        var try_th_1;
        var try_th_0;

        if($('input[name="slctType"]:checked').val() == "0"){
            $("#th_6").text(moment($("#startDate").val()).add('days', -6).format('YYYY.MM.DD'));
            $("#th_5").text(moment($("#startDate").val()).add('days', -5).format('YYYY.MM.DD'));
            $("#th_4").text(moment($("#startDate").val()).add('days', -4).format('YYYY.MM.DD'));
            $("#th_3").text(moment($("#startDate").val()).add('days', -3).format('YYYY.MM.DD'));
            $("#th_2").text(moment($("#startDate").val()).add('days', -2).format('YYYY.MM.DD'));
            $("#th_1").text(moment($("#startDate").val()).add('days', -1).format('YYYY.MM.DD'));
            $("#th_0").text(moment($("#startDate").val()).add('days', 0).format('YYYY.MM.DD'));

            try_th_6 = moment($("#startDate").val()).add('days', -6).format('YYYY.MM.DD');
            try_th_5 = moment($("#startDate").val()).add('days', -5).format('YYYY.MM.DD');
            try_th_4 = moment($("#startDate").val()).add('days', -4).format('YYYY.MM.DD');
            try_th_3 = moment($("#startDate").val()).add('days', -3).format('YYYY.MM.DD');
            try_th_2 = moment($("#startDate").val()).add('days', -2).format('YYYY.MM.DD');
            try_th_1 = moment($("#startDate").val()).add('days', -1).format('YYYY.MM.DD');
            try_th_0 = moment($("#startDate").val()).add('days', 0).format('YYYY.MM.DD');

        }else if($('input[name="slctType"]:checked').val() == "1"){
            $("#th_6").text(moment($("#startDate").val()).add('months', -6).format('YYYY.MM'));
            $("#th_5").text(moment($("#startDate").val()).add('months', -5).format('YYYY.MM'));
            $("#th_4").text(moment($("#startDate").val()).add('months', -4).format('YYYY.MM'));
            $("#th_3").text(moment($("#startDate").val()).add('months', -3).format('YYYY.MM'));
            $("#th_2").text(moment($("#startDate").val()).add('months', -2).format('YYYY.MM'));
            $("#th_1").text(moment($("#startDate").val()).add('months', -1).format('YYYY.MM'));
            $("#th_0").text(moment($("#startDate").val()).add('months', 0).format('YYYY.MM'));

            try_th_6 = moment($("#startDate").val()).add('months', -6).format('YYYY.MM.01') + " - " + moment($("#startDate").val()).add('months', -5).add('days', -1).format('YYYY.MM.DD');
            try_th_5 = moment($("#startDate").val()).add('months', -5).format('YYYY.MM.01') + " - " + moment($("#startDate").val()).add('months', -4).add('days', -1).format('YYYY.MM.DD');
            try_th_4 = moment($("#startDate").val()).add('months', -4).format('YYYY.MM.01') + " - " + moment($("#startDate").val()).add('months', -3).add('days', -1).format('YYYY.MM.DD');
            try_th_3 = moment($("#startDate").val()).add('months', -3).format('YYYY.MM.01') + " - " + moment($("#startDate").val()).add('months', -2).add('days', -1).format('YYYY.MM.DD');
            try_th_2 = moment($("#startDate").val()).add('months', -2).format('YYYY.MM.01') + " - " + moment($("#startDate").val()).add('months', -1).add('days', -1).format('YYYY.MM.DD');
            try_th_1 = moment($("#startDate").val()).add('months', -1).format('YYYY.MM.01') + " - " + moment($("#startDate").val()).add('months', 0).add('days', -1).format('YYYY.MM.DD');
            try_th_0 = moment($("#startDate").val()).add('months', 0).format('YYYY.MM.01') + " - " + moment($("#startDate").val()).add('months', 1).add('days', -1).format('YYYY.MM.DD');

        }else if($('input[name="slctType"]:checked').val() == "2"){
            $("#th_6").text(moment($("#startDate").val()).add('years', -6).format('YYYY'));
            $("#th_5").text(moment($("#startDate").val()).add('years', -5).format('YYYY'));
            $("#th_4").text(moment($("#startDate").val()).add('years', -4).format('YYYY'));
            $("#th_3").text(moment($("#startDate").val()).add('years', -3).format('YYYY'));
            $("#th_2").text(moment($("#startDate").val()).add('years', -2).format('YYYY'));
            $("#th_1").text(moment($("#startDate").val()).add('years', -1).format('YYYY'));
            $("#th_0").text(moment($("#startDate").val()).add('years', 0).format('YYYY'));

            try_th_6 = moment($("#startDate").val()).add('years', -6).format('YYYY.01.01') + " - " + moment($("#startDate").val()).add('years', -5).add('days', -1).format('YYYY.12.31');
            try_th_5 = moment($("#startDate").val()).add('years', -5).format('YYYY.01.01') + " - " + moment($("#startDate").val()).add('years', -4).add('days', -1).format('YYYY.12.31');
            try_th_4 = moment($("#startDate").val()).add('years', -4).format('YYYY.01.01') + " - " + moment($("#startDate").val()).add('years', -3).add('days', -1).format('YYYY.12.31');
            try_th_3 = moment($("#startDate").val()).add('years', -3).format('YYYY.01.01') + " - " + moment($("#startDate").val()).add('years', -2).add('days', -1).format('YYYY.12.31');
            try_th_2 = moment($("#startDate").val()).add('years', -2).format('YYYY.01.01') + " - " + moment($("#startDate").val()).add('years', -1).add('days', -1).format('YYYY.12.31');
            try_th_1 = moment($("#startDate").val()).add('years', -1).format('YYYY.01.01') + " - " + moment($("#startDate").val()).add('years', 0).add('days', -1).format('YYYY.12.31');
            try_th_0 = moment($("#startDate").val()).add('years', 0).format('YYYY.01.01') + " - " + moment($("#startDate").val()).add('years', 1).add('days', -1).format('YYYY.12.31');
        }

        var dateList = try_th_6 +"@"+ try_th_5 +"@"+ try_th_4 +"@"+ try_th_3 +"@"+ try_th_2 +"@"+ try_th_1 +"@"+ try_th_0;

        console.log(dateList);

        var data = {};
        data.dateList = dateList;
        data.slctType = $('input[name="slctType"]:checked').val();
        util.getAjaxData("try", "/rest/enter/pay/try", data, fn_tryPay_success);
    }

    function fn_tryPay_success(data, response){
        dalbitLog(response);
        response.data.forEach(function(data, index){
            data.detailList.forEach(function(detail, detailIndex){
                var tmp = common.average((detail.succCnt / 7), (detail.tryCnt / 7));
                if (tmp == 0) {
                    tmp = tmp + ".0";
                }
                if($('input[name="slctType"]:checked').val() == "0") {
                    if (index == 0) {
                        $("#tryTableBody tr._tr_" + detail.hour + " td:eq(" + (index + 1) + ")").html(common.addComma(detail.succCnt));
                        $("#tryTableBody tr._tr_" + detail.hour + " td:eq(" + (index + 2) + ")").html(common.addComma(detail.tryCnt));
                        $("#tryTableBody tr._tr_" + detail.hour + " td:eq(" + (index + 3) + ")").html(detail.succRate + "%");
                    } else if (index == 7) {
                        $("#tryTableBody tr._tr_" + detail.hour + " td:eq(" + (index * 4 + 1) + ")").html(common.addComma(detail.succCnt));
                        $("#tryTableBody tr._tr_" + detail.hour + " td:eq(" + (index * 4 + 2) + ")").html(common.addComma(detail.tryCnt));
                        $("#tryTableBody tr._tr_" + detail.hour + " td:eq(" + (index * 4 + 3) + ")").html(tmp + "%");
                    } else {
                        $("#tryTableBody tr._tr_" + detail.hour + " td:eq(" + (index * 4 + 1) + ")").html(common.addComma(detail.succCnt));
                        $("#tryTableBody tr._tr_" + detail.hour + " td:eq(" + (index * 4 + 2) + ")").html(common.addComma(detail.tryCnt));
                        $("#tryTableBody tr._tr_" + detail.hour + " td:eq(" + (index * 4 + 3) + ")").html(detail.succRate + "%");
                    }
                } else if($('input[name="slctType"]:checked').val() == "1"){
                    if (index == 0) {
                        $("#tryTableBody tr._tr_" + (detail.day) + " td:eq(" + (index + 1) + ")").html(common.addComma(detail.succCnt));
                        $("#tryTableBody tr._tr_" + (detail.day) + " td:eq(" + (index + 2) + ")").html(common.addComma(detail.tryCnt));
                        $("#tryTableBody tr._tr_" + (detail.day) + " td:eq(" + (index + 3) + ")").html(detail.succRate + "%");
                    } else if (index == 7) {
                        $("#tryTableBody tr._tr_" + (detail.day) + " td:eq(" + (index * 4 + 1) + ")").html(common.addComma(detail.succCnt));
                        $("#tryTableBody tr._tr_" + (detail.day) + " td:eq(" + (index * 4 + 2) + ")").html(common.addComma(detail.tryCnt));
                        $("#tryTableBody tr._tr_" + (detail.day) + " td:eq(" + (index * 4 + 3) + ")").html(tmp + "%");
                    } else {
                        $("#tryTableBody tr._tr_" + (detail.day) + " td:eq(" + (index * 4 + 1) + ")").html(common.addComma(detail.succCnt));
                        $("#tryTableBody tr._tr_" + (detail.day) + " td:eq(" + (index * 4 + 2) + ")").html(common.addComma(detail.tryCnt));
                        $("#tryTableBody tr._tr_" + (detail.day) + " td:eq(" + (index * 4 + 3) + ")").html(detail.succRate + "%");
                    }
                } else if($('input[name="slctType"]:checked').val() == "2"){
                    if (index == 0) {
                        $("#tryTableBody tr._tr_" + (detail.monthly) + " td:eq(" + (index + 1) + ")").html(common.addComma(detail.succCnt));
                        $("#tryTableBody tr._tr_" + (detail.monthly) + " td:eq(" + (index + 2) + ")").html(common.addComma(detail.tryCnt));
                        $("#tryTableBody tr._tr_" + (detail.monthly) + " td:eq(" + (index + 3) + ")").html(detail.succRate + "%");
                    } else if (index == 7) {
                        $("#tryTableBody tr._tr_" + (detail.monthly) + " td:eq(" + (index * 4 + 1) + ")").html(common.addComma(detail.succCnt));
                        $("#tryTableBody tr._tr_" + (detail.monthly) + " td:eq(" + (index * 4 + 2) + ")").html(common.addComma(detail.tryCnt));
                        $("#tryTableBody tr._tr_" + (detail.monthly) + " td:eq(" + (index * 4 + 3) + ")").html(tmp + "%");
                    } else {
                        $("#tryTableBody tr._tr_" + (detail.monthly) + " td:eq(" + (index * 4 + 1) + ")").html(common.addComma(detail.succCnt));
                        $("#tryTableBody tr._tr_" + (detail.monthly) + " td:eq(" + (index * 4 + 2) + ")").html(common.addComma(detail.tryCnt));
                        $("#tryTableBody tr._tr_" + (detail.monthly) + " td:eq(" + (index * 4 + 3) + ")").html(detail.succRate + "%");
                    }
                }
            });
        });

        for(var i=0 ; i<response.data.length;i++){
            var totalInfo = response.data[i].totalInfo;
            if($('input[name="slctType"]:checked').val() == "0"){
                if(i == 0){
                    $("#tryTableBody tr:eq(24) td:eq(" + (i + 1) + ")").html(common.addComma(totalInfo.sum_succCnt));
                    $("#tryTableBody tr:eq(24) td:eq(" + (i + 2) + ")").html(common.addComma(totalInfo.sum_tryCnt));
                    $("#tryTableBody tr:eq(24) td:eq(" + (i + 3) + ")").html(totalInfo.sum_succRate + "%");
                }else{
                    $("#tryTableBody tr:eq(24) td:eq(" + (i * 4 + 1) + ")").html(common.addComma(totalInfo.sum_succCnt));
                    $("#tryTableBody tr:eq(24) td:eq(" + (i * 4 + 2) + ")").html(common.addComma(totalInfo.sum_tryCnt));
                    var tmp = common.average((totalInfo.sum_succCnt/7),(totalInfo.sum_tryCnt/7));
                    if(tmp == 0){
                        tmp = tmp + ".0";
                    }
                    $("#tryTableBody tr:eq(24) td:eq(" + (i * 4 + 3) + ")").html(tmp + "%");
                }
            } else if($('input[name="slctType"]:checked').val() == "1"){
                if(i == 0){
                    $("#tryTableBody tr:eq(31) td:eq(" + (i + 1) + ")").html(common.addComma(totalInfo.sum_succCnt));
                    $("#tryTableBody tr:eq(31) td:eq(" + (i + 2) + ")").html(common.addComma(totalInfo.sum_tryCnt));
                    $("#tryTableBody tr:eq(31) td:eq(" + (i + 3) + ")").html(totalInfo.sum_succRate + "%");
                }else{
                    $("#tryTableBody tr:eq(31) td:eq(" + (i * 4 + 1) + ")").html(common.addComma(totalInfo.sum_succCnt));
                    $("#tryTableBody tr:eq(31) td:eq(" + (i * 4 + 2) + ")").html(common.addComma(totalInfo.sum_tryCnt));
                    var tmp = common.average((totalInfo.sum_succCnt/7),(totalInfo.sum_tryCnt/7));
                    if(tmp == 0){
                        tmp = tmp + ".0";
                    }
                    $("#tryTableBody tr:eq(31) td:eq(" + (i * 4 + 3) + ")").html(tmp + "%");
                }
            } else if($('input[name="slctType"]:checked').val() == "2"){
                if(i == 0){
                    $("#tryTableBody tr:eq(12) td:eq(" + (i + 1) + ")").html(common.addComma(totalInfo.sum_succCnt));
                    $("#tryTableBody tr:eq(12) td:eq(" + (i + 2) + ")").html(common.addComma(totalInfo.sum_tryCnt));
                    $("#tryTableBody tr:eq(12) td:eq(" + (i + 3) + ")").html(totalInfo.sum_succRate + "%");
                }else{
                    $("#tryTableBody tr:eq(12) td:eq(" + (i * 4 + 1) + ")").html(common.addComma(totalInfo.sum_succCnt));
                    $("#tryTableBody tr:eq(12) td:eq(" + (i * 4 + 2) + ")").html(common.addComma(totalInfo.sum_tryCnt));
                    var tmp = common.average((totalInfo.sum_succCnt/7),(totalInfo.sum_tryCnt/7));
                    if(tmp == 0){
                        tmp = tmp + ".0";
                    }
                    $("#tryTableBody tr:eq(12) td:eq(" + (i * 4 + 3) + ")").html(tmp + "%");
                }
            }
        }
    }
</script>

<script type="text/x-handlebars-template" id="tmp_dummyTryDetailList">
    {{#each this.slctType_date}}
        <tr class="_tr_{{this}}">
            <td class="font-bold" style="background-color: #dae3f3">{{this}}</td>
            <td>0</td><td>0</td><td>0%</td><td style="border-bottom: hidden;border-top: hidden"></td>
            <td>0</td><td>0</td><td>0%</td><td style="border-bottom: hidden;border-top: hidden"></td>
            <td>0</td><td>0</td><td>0%</td><td style="border-bottom: hidden;border-top: hidden"></td>
            <td>0</td><td>0</td><td>0%</td><td style="border-bottom: hidden;border-top: hidden"></td>
            <td>0</td><td>0</td><td>0%</td><td style="border-bottom: hidden;border-top: hidden"></td>
            <td>0</td><td>0</td><td>0%</td><td style="border-bottom: hidden;border-top: hidden"></td>
            <td style="background-color: #FFF7E5">0</td><td style="background-color: #FFF7E5">0</td><td style="background-color: #FFF7E5">0%</td><td style="border-bottom: hidden;border-top: hidden"></td>
            <td>0</td><td>0</td><td>0.0%</td>
        </tr>
    {{/each}}
    <tr class="_tr_total font-bold" style="background-color: #b4c7e7">
        <td>합계</td>
        <td>0</td><td>0</td><td>0</td><td style="border-bottom: hidden;border-top: hidden;background-color: white"></td>
        <td>0</td><td>0</td><td>0</td><td style="border-bottom: hidden;border-top: hidden;background-color: white"></td>
        <td>0</td><td>0</td><td>0</td><td style="border-bottom: hidden;border-top: hidden;background-color: white"></td>
        <td>0</td><td>0</td><td>0</td><td style="border-bottom: hidden;border-top: hidden;background-color: white"></td>
        <td>0</td><td>0</td><td>0</td><td style="border-bottom: hidden;border-top: hidden;background-color: white"></td>
        <td>0</td><td>0</td><td>0</td><td style="border-bottom: hidden;border-top: hidden;background-color: white"></td>
        <td style="background-color: #fff2cc">0</td><td style="background-color: #fff2cc">0</td><td style="background-color: #fff2cc">0</td><td style="border-bottom: hidden;border-top: hidden;background-color: white"></td>
        <td>0</td><td>0</td><td>0.0</td>
    </tr>
</script>

