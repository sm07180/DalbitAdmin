<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 로그인 > 총계 -->
<div class="widget widget-table mb10">
    <div class="widget-content mt10">
        <span class="_searchDate"></span>

        <table class="table table-bordered">
            <colgroup>
                <col width="6.2%"/>
                <col width="6.2%"/><col width="6.2%"/><col width="6.2%"/><col width="6.2%"/><col width="6.2%"/>
                <col width="0.5%"/>
                <col width="6.2%"/><col width="6.2%"/><col width="6.2%"/><col width="6.2%"/><col width="6.2%"/>
                <col width="0.5%"/>
                <col width="6.2%"/><col width="6.2%"/><col width="6.2%"/><col width="6.2%"/><col width="6.2%"/>
            </colgroup>
            <thead>
            <tr>
                <th rowspan="2"></th>
                <th class="_totalDate" colspan="5" id="total_th_2"></th>
                <td class="_noBorder"></td>
                <th class="_totalDate" colspan="5" id="total_th_1"></th>
                <td class="_noBorder"></td>
                <th class="_totalDate" colspan="5" id="total_th_0"></th>
            </tr>
            <tr>
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
            <tbody id="totalTableBody"></tbody>
        </table>

        <table class="table table-bordered">
            <colgroup>
                <col width="6.2%"/>
                <col width="6.2%"/><col width="6.2%"/><col width="6.2%"/><col width="6.2%"/><col width="6.2%"/>
                <col width="0.5%"/>
                <col width="6.2%"/><col width="6.2%"/><col width="6.2%"/><col width="6.2%"/><col width="6.2%"/>
                <col width="0.5%"/>
                <col width="6.2%"/><col width="6.2%"/><col width="6.2%"/><col width="6.2%"/><col width="6.2%"/>
            </colgroup>
            <thead>
            <tr>
                <th rowspan="2"></th>
                <th class="_totalDate" colspan="5" id="total_th_5"></th>
                <td class="_noBorder"></td>
                <th class="_totalDate" colspan="5" id="total_th_4"></th>
                <td class="_noBorder"></td>
                <th class="_totalDate" colspan="5" id="total_th_3"></th>
            </tr>
            <tr>
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

    var tmp = 0;
    var tmp_end = 0;
    var type;
    function getTotalList(){
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
                        $("#totalTableBody tr._tr_" + detail.hour + " td:eq(" + (index + 1) + ")").html(common.addComma(detail.maleCnt));
                        $("#totalTableBody tr._tr_" + detail.hour + " td:eq(" + (index + 2) + ")").html(common.addComma(detail.femaleCnt));
                        $("#totalTableBody tr._tr_" + detail.hour + " td:eq(" + (index + 3) + ")").html(common.average(detail.femaleCnt , detail.totalCnt) + "%");
                        $("#totalTableBody tr._tr_" + detail.hour + " td:eq(" + (index + 4) + ")").html(common.addComma(detail.noneCnt));
                        $("#totalTableBody tr._tr_" + detail.hour + " td:eq(" + (index + 5) + ")").html(common.addComma(detail.totalCnt));
                    } else if (index == 1 || index == 2) {
                        $("#totalTableBody tr._tr_" + detail.hour + " td:eq(" + (index * 6 + 1) + ")").html(common.addComma(detail.maleCnt));
                        $("#totalTableBody tr._tr_" + detail.hour + " td:eq(" + (index * 6 + 2) + ")").html(common.addComma(detail.femaleCnt));
                        $("#totalTableBody tr._tr_" + detail.hour + " td:eq(" + (index * 6 + 3) + ")").html(common.average(detail.femaleCnt , detail.totalCnt) + "%");
                        $("#totalTableBody tr._tr_" + detail.hour + " td:eq(" + (index * 6 + 4) + ")").html(common.addComma(detail.noneCnt));
                        $("#totalTableBody tr._tr_" + detail.hour + " td:eq(" + (index * 6 + 5) + ")").html(common.addComma(detail.totalCnt));
                    }
                    // 하단
                    if (index == 3) {
                        $("#totalTableBody2 tr._tr_" + detail.hour + " td:eq(" + (tmp_index + 1) + ")").html(common.addComma(detail.maleCnt));
                        $("#totalTableBody2 tr._tr_" + detail.hour + " td:eq(" + (tmp_index + 2) + ")").html(common.addComma(detail.femaleCnt));
                        $("#totalTableBody2 tr._tr_" + detail.hour + " td:eq(" + (tmp_index + 3) + ")").html(common.average(detail.femaleCnt , detail.totalCnt) + "%");
                        $("#totalTableBody2 tr._tr_" + detail.hour + " td:eq(" + (tmp_index + 4) + ")").html(common.addComma(detail.noneCnt));
                        $("#totalTableBody2 tr._tr_" + detail.hour + " td:eq(" + (tmp_index + 5) + ")").html(common.addComma(detail.totalCnt));
                    }else if(index == 4 || index == 5){
                        $("#totalTableBody2 tr._tr_" + detail.hour + " td:eq(" + (tmp_index * 6 + 1) + ")").html(common.addComma(detail.maleCnt));
                        $("#totalTableBody2 tr._tr_" + detail.hour + " td:eq(" + (tmp_index * 6 + 2) + ")").html(common.addComma(detail.femaleCnt));
                        $("#totalTableBody2 tr._tr_" + detail.hour + " td:eq(" + (tmp_index * 6 + 3) + ")").html(common.average(detail.femaleCnt , detail.totalCnt) + "%");
                        $("#totalTableBody2 tr._tr_" + detail.hour + " td:eq(" + (tmp_index * 6 + 4) + ")").html(common.addComma(detail.noneCnt));
                        $("#totalTableBody2 tr._tr_" + detail.hour + " td:eq(" + (tmp_index * 6 + 5) + ")").html(common.addComma(detail.totalCnt));
                    }

                } else if($('input[name="slctType"]:checked').val() == "1"){
                    //상단
                    if (index == 0) {
                        $("#totalTableBody tr._tr_" + (detail.day) + " td:eq(" + (index + 1) + ")").html(common.addComma(detail.maleCnt));
                        $("#totalTableBody tr._tr_" + (detail.day) + " td:eq(" + (index + 2) + ")").html(common.addComma(detail.femaleCnt));
                        $("#totalTableBody tr._tr_" + (detail.day) + " td:eq(" + (index + 3) + ")").html(common.addComma(common.average(detail.femaleCnt , detail.totalCnt) + "%"));
                        $("#totalTableBody tr._tr_" + (detail.day) + " td:eq(" + (index + 4) + ")").html(common.addComma(detail.noneCnt));
                        $("#totalTableBody tr._tr_" + (detail.day) + " td:eq(" + (index + 5) + ")").html(common.addComma(detail.totalCnt));
                    } else if (index == 1 || index == 2) {
                        $("#totalTableBody tr._tr_" + (detail.day) + " td:eq(" + (index * 6 + 1) + ")").html(common.addComma(detail.maleCnt));
                        $("#totalTableBody tr._tr_" + (detail.day) + " td:eq(" + (index * 6 + 2) + ")").html(common.addComma(detail.femaleCnt));
                        $("#totalTableBody tr._tr_" + (detail.day) + " td:eq(" + (index * 6 + 3) + ")").html(common.addComma(common.average(detail.femaleCnt , detail.totalCnt) + "%"));
                        $("#totalTableBody tr._tr_" + (detail.day) + " td:eq(" + (index * 6 + 4) + ")").html(common.addComma(detail.noneCnt));
                        $("#totalTableBody tr._tr_" + (detail.day) + " td:eq(" + (index * 6 + 5) + ")").html(common.addComma(detail.totalCnt));
                    }
                    // 하단
                    if (index == 3) {
                        $("#totalTableBody2 tr._tr_" + (detail.day) + " td:eq(" + (tmp_index + 1) + ")").html(common.addComma(detail.maleCnt));
                        $("#totalTableBody2 tr._tr_" + (detail.day) + " td:eq(" + (tmp_index + 2) + ")").html(common.addComma(detail.femaleCnt));
                        $("#totalTableBody2 tr._tr_" + (detail.day) + " td:eq(" + (tmp_index + 3) + ")").html(common.addComma(common.average(detail.femaleCnt , detail.totalCnt) + "%"));
                        $("#totalTableBody2 tr._tr_" + (detail.day) + " td:eq(" + (tmp_index + 4) + ")").html(common.addComma(detail.noneCnt));
                        $("#totalTableBody2 tr._tr_" + (detail.day) + " td:eq(" + (tmp_index + 5) + ")").html(common.addComma(detail.totalCnt));
                    } else if (index == 4 || index == 5){
                        $("#totalTableBody2 tr._tr_" + (detail.day) + " td:eq(" + (tmp_index * 6 + 1) + ")").html(common.addComma(detail.maleCnt));
                        $("#totalTableBody2 tr._tr_" + (detail.day) + " td:eq(" + (tmp_index * 6 + 2) + ")").html(common.addComma(detail.femaleCnt));
                        $("#totalTableBody2 tr._tr_" + (detail.day) + " td:eq(" + (tmp_index * 6 + 3) + ")").html(common.addComma(common.average(detail.femaleCnt , detail.totalCnt) + "%"));
                        $("#totalTableBody2 tr._tr_" + (detail.day) + " td:eq(" + (tmp_index * 6 + 4) + ")").html(common.addComma(detail.noneCnt));
                        $("#totalTableBody2 tr._tr_" + (detail.day) + " td:eq(" + (tmp_index * 6 + 5) + ")").html(common.addComma(detail.totalCnt));
                    }
                } else if($('input[name="slctType"]:checked').val() == "2") {
                    //상단
                    if (index == 0) {
                        $("#totalTableBody tr._tr_" + (detail.month) + " td:eq(" + (index + 1) + ")").html(common.addComma(detail.maleCnt));
                        $("#totalTableBody tr._tr_" + (detail.month) + " td:eq(" + (index + 2) + ")").html(common.addComma(detail.femaleCnt));
                        $("#totalTableBody tr._tr_" + (detail.month) + " td:eq(" + (index + 3) + ")").html(common.addComma(common.average(detail.femaleCnt , detail.totalCnt) + "%"));
                        $("#totalTableBody tr._tr_" + (detail.month) + " td:eq(" + (index + 4) + ")").html(common.addComma(detail.noneCnt));
                        $("#totalTableBody tr._tr_" + (detail.month) + " td:eq(" + (index + 5) + ")").html(common.addComma(detail.totalCnt));
                    } else if (index == 1 || index == 2) {
                        $("#totalTableBody tr._tr_" + (detail.month) + " td:eq(" + (index * 6 + 1) + ")").html(common.addComma(detail.maleCnt));
                        $("#totalTableBody tr._tr_" + (detail.month) + " td:eq(" + (index * 6 + 2) + ")").html(common.addComma(detail.femaleCnt));
                        $("#totalTableBody tr._tr_" + (detail.month) + " td:eq(" + (index * 6 + 3) + ")").html(common.addComma(common.average(detail.femaleCnt , detail.totalCnt) + "%"));
                        $("#totalTableBody tr._tr_" + (detail.month) + " td:eq(" + (index * 6 + 4) + ")").html(common.addComma(detail.noneCnt));
                        $("#totalTableBody tr._tr_" + (detail.month) + " td:eq(" + (index * 6 + 5) + ")").html(common.addComma(detail.totalCnt));
                    }
                    //하단
                    if (index == 3){
                        $("#totalTableBody2 tr._tr_" + (detail.month) + " td:eq(" + (tmp_index + 1) + ")").html(common.addComma(detail.maleCnt));
                        $("#totalTableBody2 tr._tr_" + (detail.month) + " td:eq(" + (tmp_index + 2) + ")").html(common.addComma(detail.femaleCnt));
                        $("#totalTableBody2 tr._tr_" + (detail.month) + " td:eq(" + (tmp_index + 3) + ")").html(common.addComma(common.average(detail.femaleCnt , detail.totalCnt) + "%"));
                        $("#totalTableBody2 tr._tr_" + (detail.month) + " td:eq(" + (tmp_index + 4) + ")").html(common.addComma(detail.noneCnt));
                        $("#totalTableBody2 tr._tr_" + (detail.month) + " td:eq(" + (tmp_index + 5) + ")").html(common.addComma(detail.totalCnt));
                    } else if (index == 4 || index == 5) {
                        $("#totalTableBody2 tr._tr_" + (detail.month) + " td:eq(" + (tmp_index * 6 + 1) + ")").html(common.addComma(detail.maleCnt));
                        $("#totalTableBody2 tr._tr_" + (detail.month) + " td:eq(" + (tmp_index * 6 + 2) + ")").html(common.addComma(detail.femaleCnt));
                        $("#totalTableBody2 tr._tr_" + (detail.month) + " td:eq(" + (tmp_index * 6 + 3) + ")").html(common.addComma(common.average(detail.femaleCnt , detail.totalCnt) + "%"));
                        $("#totalTableBody2 tr._tr_" + (detail.month) + " td:eq(" + (tmp_index * 6 + 4) + ")").html(common.addComma(detail.noneCnt));
                        $("#totalTableBody2 tr._tr_" + (detail.month) + " td:eq(" + (tmp_index * 6 + 5) + ")").html(common.addComma(detail.totalCnt));
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
                    $("#totalTableBody tr:eq(0) td:eq(" + (i + 4) + ")").html(totalInfo.sum_neneCnt);
                    $("#totalTableBody tr:eq(0) td:eq(" + (i + 5) + ")").html(totalInfo.sum_totalCnt);
                    $("#totalTableBody tr:eq(25) td:eq(" + (i + 1) + ")").html(totalInfo.sum_maleCnt);
                    $("#totalTableBody tr:eq(25) td:eq(" + (i + 2) + ")").html(totalInfo.sum_femaleCnt);
                    $("#totalTableBody tr:eq(25) td:eq(" + (i + 3) + ")").html(common.average(totalInfo.sum_femaleCnt , totalInfo.sum_totalCnt) + "%");
                    $("#totalTableBody tr:eq(25) td:eq(" + (i + 4) + ")").html(totalInfo.sum_neneCnt);
                    $("#totalTableBody tr:eq(25) td:eq(" + (i + 5) + ")").html(totalInfo.sum_totalCnt);
                }else if(i == 1 || i == 2){
                    $("#totalTableBody tr:eq(0) td:eq(" + (i * 6 + 1) + ")").html(totalInfo.sum_maleCnt);
                    $("#totalTableBody tr:eq(0) td:eq(" + (i * 6 + 2) + ")").html(totalInfo.sum_femaleCnt);
                    $("#totalTableBody tr:eq(0) td:eq(" + (i * 6 + 3) + ")").html(common.average(totalInfo.sum_femaleCnt , totalInfo.sum_totalCnt) + "%");
                    $("#totalTableBody tr:eq(0) td:eq(" + (i * 6 + 4) + ")").html(totalInfo.sum_neneCnt);
                    $("#totalTableBody tr:eq(0) td:eq(" + (i * 6 + 5) + ")").html(totalInfo.sum_totalCnt);
                    $("#totalTableBody tr:eq(25) td:eq(" + (i * 6 + 1) + ")").html(totalInfo.sum_maleCnt);
                    $("#totalTableBody tr:eq(25) td:eq(" + (i * 6 + 2) + ")").html(totalInfo.sum_femaleCnt);
                    $("#totalTableBody tr:eq(25) td:eq(" + (i * 6 + 3) + ")").html(common.average(totalInfo.sum_femaleCnt , totalInfo.sum_totalCnt) + "%");
                    $("#totalTableBody tr:eq(25) td:eq(" + (i * 6 + 4) + ")").html(totalInfo.sum_neneCnt);
                    $("#totalTableBody tr:eq(25) td:eq(" + (i * 6 + 5) + ")").html(totalInfo.sum_totalCnt);
                }
            } else if($('input[name="slctType"]:checked').val() == "1"){
                if(i == 0){
                    $("#totalTableBody tr:eq(0) td:eq(" + (i + 1) + ")").html(totalInfo.sum_maleCnt);
                    $("#totalTableBody tr:eq(0) td:eq(" + (i + 2) + ")").html(totalInfo.sum_femaleCnt);
                    $("#totalTableBody tr:eq(0) td:eq(" + (i + 3) + ")").html(common.average(totalInfo.sum_femaleCnt , totalInfo.sum_totalCnt) + "%");
                    $("#totalTableBody tr:eq(0) td:eq(" + (i + 4) + ")").html(totalInfo.sum_neneCnt);
                    $("#totalTableBody tr:eq(0) td:eq(" + (i + 5) + ")").html(totalInfo.sum_totalCnt);
                    $("#totalTableBody tr:eq(32) td:eq(" + (i + 1) + ")").html(totalInfo.sum_maleCnt);
                    $("#totalTableBody tr:eq(32) td:eq(" + (i + 2) + ")").html(totalInfo.sum_femaleCnt);
                    $("#totalTableBody tr:eq(32) td:eq(" + (i + 3) + ")").html(common.average(totalInfo.sum_femaleCnt , totalInfo.sum_totalCnt) + "%");
                    $("#totalTableBody tr:eq(32) td:eq(" + (i + 4) + ")").html(totalInfo.sum_neneCnt);
                    $("#totalTableBody tr:eq(32) td:eq(" + (i + 5) + ")").html(totalInfo.sum_totalCnt);
                }else if(i == 1 || i == 2){
                    $("#totalTableBody tr:eq(0) td:eq(" + (i * 6 + 1) + ")").html(totalInfo.sum_maleCnt);
                    $("#totalTableBody tr:eq(0) td:eq(" + (i * 6 + 2) + ")").html(totalInfo.sum_femaleCnt);
                    $("#totalTableBody tr:eq(0) td:eq(" + (i * 6 + 3) + ")").html(common.average(totalInfo.sum_femaleCnt , totalInfo.sum_totalCnt) + "%");
                    $("#totalTableBody tr:eq(0) td:eq(" + (i * 6 + 4) + ")").html(totalInfo.sum_neneCnt);
                    $("#totalTableBody tr:eq(0) td:eq(" + (i * 6 + 5) + ")").html(totalInfo.sum_totalCnt);
                    $("#totalTableBody tr:eq(32) td:eq(" + (i * 6 + 1) + ")").html(totalInfo.sum_maleCnt);
                    $("#totalTableBody tr:eq(32) td:eq(" + (i * 6 + 2) + ")").html(totalInfo.sum_femaleCnt);
                    $("#totalTableBody tr:eq(32) td:eq(" + (i * 6 + 3) + ")").html(common.average(totalInfo.sum_femaleCnt , totalInfo.sum_totalCnt) + "%");
                    $("#totalTableBody tr:eq(32) td:eq(" + (i * 6 + 4) + ")").html(totalInfo.sum_neneCnt);
                    $("#totalTableBody tr:eq(32) td:eq(" + (i * 6 + 5) + ")").html(totalInfo.sum_totalCnt);
                }
            } else if($('input[name="slctType"]:checked').val() == "2"){
                if(i == 0){
                    $("#totalTableBody tr:eq(0) td:eq(" + (i + 1) + ")").html(totalInfo.sum_maleCnt);
                    $("#totalTableBody tr:eq(0) td:eq(" + (i + 2) + ")").html(totalInfo.sum_femaleCnt);
                    $("#totalTableBody tr:eq(0) td:eq(" + (i + 3) + ")").html(common.average(totalInfo.sum_femaleCnt , totalInfo.sum_totalCnt) + "%");
                    $("#totalTableBody tr:eq(0) td:eq(" + (i + 4) + ")").html(totalInfo.sum_neneCnt);
                    $("#totalTableBody tr:eq(0) td:eq(" + (i + 5) + ")").html(totalInfo.sum_totalCnt);
                    $("#totalTableBody tr:eq(13) td:eq(" + (i + 1) + ")").html(totalInfo.sum_maleCnt);
                    $("#totalTableBody tr:eq(13) td:eq(" + (i + 2) + ")").html(totalInfo.sum_femaleCnt);
                    $("#totalTableBody tr:eq(13) td:eq(" + (i + 3) + ")").html(common.average(totalInfo.sum_femaleCnt , totalInfo.sum_totalCnt) + "%");
                    $("#totalTableBody tr:eq(13) td:eq(" + (i + 4) + ")").html(totalInfo.sum_neneCnt);
                    $("#totalTableBody tr:eq(13) td:eq(" + (i + 5) + ")").html(totalInfo.sum_totalCnt);
                }else if(i == 1 || i == 2){
                    $("#totalTableBody tr:eq(0) td:eq(" + (i * 6 + 1) + ")").html(totalInfo.sum_maleCnt);
                    $("#totalTableBody tr:eq(0) td:eq(" + (i * 6 + 2) + ")").html(totalInfo.sum_femaleCnt);
                    $("#totalTableBody tr:eq(0) td:eq(" + (i * 6 + 3) + ")").html(common.average(totalInfo.sum_femaleCnt , totalInfo.sum_totalCnt) + "%");
                    $("#totalTableBody tr:eq(0) td:eq(" + (i * 6 + 4) + ")").html(totalInfo.sum_neneCnt);
                    $("#totalTableBody tr:eq(0) td:eq(" + (i * 6 + 5) + ")").html(totalInfo.sum_totalCnt);
                    $("#totalTableBody tr:eq(13) td:eq(" + (i * 6 + 1) + ")").html(totalInfo.sum_maleCnt);
                    $("#totalTableBody tr:eq(13) td:eq(" + (i * 6 + 2) + ")").html(totalInfo.sum_femaleCnt);
                    $("#totalTableBody tr:eq(13) td:eq(" + (i * 6 + 3) + ")").html(common.average(totalInfo.sum_femaleCnt , totalInfo.sum_totalCnt) + "%");
                    $("#totalTableBody tr:eq(13) td:eq(" + (i * 6 + 4) + ")").html(totalInfo.sum_neneCnt);
                    $("#totalTableBody tr:eq(13) td:eq(" + (i * 6 + 5) + ")").html(totalInfo.sum_totalCnt);
                }
            }

            // 하단
            if($('input[name="slctType"]:checked').val() == "0"){
                if(i == 3){
                    $("#totalTableBody2 tr:eq(0) td:eq(" + (1) + ")").html(totalInfo.sum_maleCnt);
                    $("#totalTableBody2 tr:eq(0) td:eq(" + (2) + ")").html(totalInfo.sum_femaleCnt);
                    $("#totalTableBody2 tr:eq(0) td:eq(" + (3) + ")").html(common.average(totalInfo.sum_femaleCnt , totalInfo.sum_totalCnt) + "%");
                    $("#totalTableBody2 tr:eq(0) td:eq(" + (4) + ")").html(totalInfo.sum_neneCnt);
                    $("#totalTableBody2 tr:eq(0) td:eq(" + (5) + ")").html(totalInfo.sum_totalCnt);
                    $("#totalTableBody2 tr:eq(25) td:eq(" + (1) + ")").html(totalInfo.sum_maleCnt);
                    $("#totalTableBody2 tr:eq(25) td:eq(" + (2) + ")").html(totalInfo.sum_femaleCnt);
                    $("#totalTableBody2 tr:eq(25) td:eq(" + (3) + ")").html(common.average(totalInfo.sum_femaleCnt , totalInfo.sum_totalCnt) + "%");
                    $("#totalTableBody2 tr:eq(25) td:eq(" + (4) + ")").html(totalInfo.sum_neneCnt);
                    $("#totalTableBody2 tr:eq(25) td:eq(" + (5) + ")").html(totalInfo.sum_totalCnt);
                }else if(i == 4 || i == 5){
                    $("#totalTableBody2 tr:eq(0) td:eq(" + (tmp_index * 6 + 1) + ")").html(totalInfo.sum_maleCnt);
                    $("#totalTableBody2 tr:eq(0) td:eq(" + (tmp_index * 6 + 2) + ")").html(totalInfo.sum_femaleCnt);
                    $("#totalTableBody2 tr:eq(0) td:eq(" + (tmp_index * 6 + 3) + ")").html(common.average(totalInfo.sum_femaleCnt , totalInfo.sum_totalCnt) + "%");
                    $("#totalTableBody2 tr:eq(0) td:eq(" + (tmp_index * 6 + 4) + ")").html(totalInfo.sum_neneCnt);
                    $("#totalTableBody2 tr:eq(0) td:eq(" + (tmp_index * 6 + 5) + ")").html(totalInfo.sum_totalCnt);
                    $("#totalTableBody2 tr:eq(25) td:eq(" + (tmp_index * 6 + 1) + ")").html(totalInfo.sum_maleCnt);
                    $("#totalTableBody2 tr:eq(25) td:eq(" + (tmp_index * 6 + 2) + ")").html(totalInfo.sum_femaleCnt);
                    $("#totalTableBody2 tr:eq(25) td:eq(" + (tmp_index * 6 + 3) + ")").html(common.average(totalInfo.sum_femaleCnt , totalInfo.sum_totalCnt) + "%");
                    $("#totalTableBody2 tr:eq(25) td:eq(" + (tmp_index * 6 + 4) + ")").html(totalInfo.sum_neneCnt);
                    $("#totalTableBody2 tr:eq(25) td:eq(" + (tmp_index * 6 + 5) + ")").html(totalInfo.sum_totalCnt);
                }
            } else if($('input[name="slctType"]:checked').val() == "1"){
                if(i == 3){
                    $("#totalTableBody2 tr:eq(0) td:eq(" + (1) + ")").html(totalInfo.sum_maleCnt);
                    $("#totalTableBody2 tr:eq(0) td:eq(" + (2) + ")").html(totalInfo.sum_femaleCnt);
                    $("#totalTableBody2 tr:eq(0) td:eq(" + (3) + ")").html(common.average(totalInfo.sum_femaleCnt , totalInfo.sum_totalCnt) + "%");
                    $("#totalTableBody2 tr:eq(0) td:eq(" + (4) + ")").html(totalInfo.sum_neneCnt);
                    $("#totalTableBody2 tr:eq(0) td:eq(" + (5) + ")").html(totalInfo.sum_totalCnt);
                    $("#totalTableBody2 tr:eq(32) td:eq(" + (1) + ")").html(totalInfo.sum_maleCnt);
                    $("#totalTableBody2 tr:eq(32) td:eq(" + (2) + ")").html(totalInfo.sum_femaleCnt);
                    $("#totalTableBody2 tr:eq(32) td:eq(" + (3) + ")").html(common.average(totalInfo.sum_femaleCnt , totalInfo.sum_totalCnt) + "%");
                    $("#totalTableBody2 tr:eq(32) td:eq(" + (4) + ")").html(totalInfo.sum_neneCnt);
                    $("#totalTableBody2 tr:eq(32) td:eq(" + (5) + ")").html(totalInfo.sum_totalCnt);
                }else if(i == 4 || i == 5){
                    $("#totalTableBody2 tr:eq(0) td:eq(" + (tmp_index * 6 + 1) + ")").html(totalInfo.sum_maleCnt);
                    $("#totalTableBody2 tr:eq(0) td:eq(" + (tmp_index * 6 + 2) + ")").html(totalInfo.sum_femaleCnt);
                    $("#totalTableBody2 tr:eq(0) td:eq(" + (tmp_index * 6 + 3) + ")").html(common.average(totalInfo.sum_femaleCnt , totalInfo.sum_totalCnt) + "%");
                    $("#totalTableBody2 tr:eq(0) td:eq(" + (tmp_index * 6 + 4) + ")").html(totalInfo.sum_neneCnt);
                    $("#totalTableBody2 tr:eq(0) td:eq(" + (tmp_index * 6 + 5) + ")").html(totalInfo.sum_totalCnt);
                    $("#totalTableBody2 tr:eq(32) td:eq(" + (tmp_index * 6 + 1) + ")").html(totalInfo.sum_maleCnt);
                    $("#totalTableBody2 tr:eq(32) td:eq(" + (tmp_index * 6 + 2) + ")").html(totalInfo.sum_femaleCnt);
                    $("#totalTableBody2 tr:eq(32) td:eq(" + (tmp_index * 6 + 3) + ")").html(common.average(totalInfo.sum_femaleCnt , totalInfo.sum_totalCnt) + "%");
                    $("#totalTableBody2 tr:eq(32) td:eq(" + (tmp_index * 6 + 4) + ")").html(totalInfo.sum_neneCnt);
                    $("#totalTableBody2 tr:eq(32) td:eq(" + (tmp_index * 6 + 5) + ")").html(totalInfo.sum_totalCnt);
                }
            } else if($('input[name="slctType"]:checked').val() == "2"){
                if(i == 3){
                    $("#totalTableBody2 tr:eq(0) td:eq(" + (1) + ")").html(totalInfo.sum_maleCnt);
                    $("#totalTableBody2 tr:eq(0) td:eq(" + (2) + ")").html(totalInfo.sum_femaleCnt);
                    $("#totalTableBody2 tr:eq(0) td:eq(" + (3) + ")").html(common.average(totalInfo.sum_femaleCnt , totalInfo.sum_totalCnt) + "%");
                    $("#totalTableBody2 tr:eq(0) td:eq(" + (4) + ")").html(totalInfo.sum_neneCnt);
                    $("#totalTableBody2 tr:eq(0) td:eq(" + (5) + ")").html(totalInfo.sum_totalCnt);
                    $("#totalTableBody2 tr:eq(13) td:eq(" + (1) + ")").html(totalInfo.sum_maleCnt);
                    $("#totalTableBody2 tr:eq(13) td:eq(" + (2) + ")").html(totalInfo.sum_femaleCnt);
                    $("#totalTableBody2 tr:eq(13) td:eq(" + (3) + ")").html(common.average(totalInfo.sum_femaleCnt , totalInfo.sum_totalCnt) + "%");
                    $("#totalTableBody2 tr:eq(13) td:eq(" + (4) + ")").html(totalInfo.sum_neneCnt);
                    $("#totalTableBody2 tr:eq(13) td:eq(" + (5) + ")").html(totalInfo.sum_totalCnt);
                }else if(i == 4 || i == 5){
                    $("#totalTableBody2 tr:eq(0) td:eq(" + (tmp_index * 6 + 1) + ")").html(totalInfo.sum_maleCnt);
                    $("#totalTableBody2 tr:eq(0) td:eq(" + (tmp_index * 6 + 2) + ")").html(totalInfo.sum_femaleCnt);
                    $("#totalTableBody2 tr:eq(0) td:eq(" + (tmp_index * 6 + 3) + ")").html(common.average(totalInfo.sum_femaleCnt , totalInfo.sum_totalCnt) + "%");
                    $("#totalTableBody2 tr:eq(0) td:eq(" + (tmp_index * 6 + 4) + ")").html(totalInfo.sum_neneCnt);
                    $("#totalTableBody2 tr:eq(0) td:eq(" + (tmp_index * 6 + 5) + ")").html(totalInfo.sum_totalCnt);
                    $("#totalTableBody2 tr:eq(13) td:eq(" + (tmp_index * 6 + 1) + ")").html(totalInfo.sum_maleCnt);
                    $("#totalTableBody2 tr:eq(13) td:eq(" + (tmp_index * 6 + 2) + ")").html(totalInfo.sum_femaleCnt);
                    $("#totalTableBody2 tr:eq(13) td:eq(" + (tmp_index * 6 + 3) + ")").html(common.average(totalInfo.sum_femaleCnt , totalInfo.sum_totalCnt) + "%");
                    $("#totalTableBody2 tr:eq(13) td:eq(" + (tmp_index * 6 + 4) + ")").html(totalInfo.sum_neneCnt);
                    $("#totalTableBody2 tr:eq(13) td:eq(" + (tmp_index * 6 + 5) + ")").html(totalInfo.sum_totalCnt);
                }
            }
        }
    }
</script>


<script type="text/x-handlebars-template" id="tmp_dummyTotalDetailList">
    <tr class="_tr_{{this}} font-bold" style="background-color: #b4c7e7">
        <td>총합</td>
        <td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td style="border-bottom: hidden;border-top: hidden;background-color: white"></td>
        <td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td style="border-bottom: hidden;border-top: hidden;background-color: white"></td>
        <td>0</td><td>0</td><td>0</td><td>0</td><td>0</td>
    </tr>
    {{#each this.slctType_date}}
    <tr class="_tr_{{this}}">
        <td class="font-bold">{{this}}</td>
        <td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td style="border-bottom: hidden;border-top: hidden"></td>
        <td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td style="border-bottom: hidden;border-top: hidden"></td>
        <td>0</td><td>0</td><td>0</td><td>0</td><td>0</td>
    </tr>
    {{/each}}
    <tr class="_tr_{{this}} font-bold" style="background-color: #b4c7e7">
        <td>총합</td>
        <td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td style="border-bottom: hidden;border-top: hidden;background-color: white"></td>
        <td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td style="border-bottom: hidden;border-top: hidden;background-color: white"></td>
        <td>0</td><td>0</td><td>0</td><td>0</td><td>0</td>
    </tr>
</script>

<script type="text/x-handlebars-template" id="tmp_dummyTotalDetailList2">
    <tr class="_tr_{{this}} font-bold" style="background-color: #b4c7e7">
        <td>총합</td>
        <td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td style="border-bottom: hidden;border-top: hidden;background-color: white"></td>
        <td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td style="border-bottom: hidden;border-top: hidden;background-color: white"></td>
        <td>0</td><td>0</td><td>0</td><td>0</td><td>0</td>
    </tr>
    {{#each this.slctType_date}}
    <tr class="_tr_{{this}}">
        <td class="font-bold">{{this}}</td>
        <td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td style="border-bottom: hidden;border-top: hidden"></td>
        <td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td style="border-bottom: hidden;border-top: hidden"></td>
        <td>0</td><td>0</td><td>0</td><td>0</td><td>0</td>
    </tr>
    {{/each}}
    <tr class="_tr_{{this}} font-bold" style="background-color: #b4c7e7">
        <td>총합</td>
        <td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td style="border-bottom: hidden;border-top: hidden;background-color: white"></td>
        <td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td style="border-bottom: hidden;border-top: hidden;background-color: white"></td>
        <td>0</td><td>0</td><td>0</td><td>0</td><td>0</td>
    </tr>
</script>