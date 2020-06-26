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
                <th class="_totalDate" colspan="5" id="yearNonOver_th_2"></th>
                <td class="_noBorder"></td>
                <th class="_totalDate" colspan="5" id="yearNonOver_th_1"></th>
                <td class="_noBorder"></td>
                <th class="_totalDate" colspan="5" id="yearNonOver_th_0" style="background-color: #ffe699"></th>
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
            <tbody id="yearNonOverTableBody"></tbody>
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
                <th class="_totalDate" colspan="5" id="yearNonOver_th_5"></th>
                <td class="_noBorder"></td>
                <th class="_totalDate" colspan="5" id="yearNonOver_th_4"></th>
                <td class="_noBorder"></td>
                <th class="_totalDate" colspan="5" id="yearNonOver_th_3"></th>
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
            <tbody id="yearNonOverTableBody2"></tbody>
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
        // getYearNonOver();
    });

    var tmp = 0;
    var tmp_end = 0;
    var type;
    function getYearNonOver(){
        tmp_end = 0;
        tmp = 12;
        type = "월";

        var slctType_date = [];
        for(var i = tmp; tmp_end < i; i-- ){
            slctType_date.push(i + " " + type);
        }
        data = {
            slctType_date : slctType_date
        };

        var template = $('#tmp_dummyYearNonOver').html();
        var templateScript = Handlebars.compile(template);
        var context = data;
        var html=templateScript(context);
        $("#yearNonOverTableBody").html(html);

        var template = $('#tmp_dummyYearNonOver2').html();
        var templateScript = Handlebars.compile(template);
        var context = data;
        var html=templateScript(context);
        $("#yearNonOverTableBody2").html(html);


        var th_5;
        var th_4;
        var th_3;
        var th_2;
        var th_1;
        var th_0;

        $("#yearNonOver_th_5").text(moment($("#startDate").val()).add('years', -5).format('YYYY'));
        $("#yearNonOver_th_4").text(moment($("#startDate").val()).add('years', -4).format('YYYY'));
        $("#yearNonOver_th_3").text(moment($("#startDate").val()).add('years', -3).format('YYYY'));
        $("#yearNonOver_th_2").text(moment($("#startDate").val()).add('years', -2).format('YYYY'));
        $("#yearNonOver_th_1").text(moment($("#startDate").val()).add('years', -1).format('YYYY'));
        $("#yearNonOver_th_0").text(moment($("#startDate").val()).add('years', 0).format('YYYY'));

        th_5 = moment($("#startDate").val()).add('years', -5).format('YYYY.01.01') + " - " + moment($("#startDate").val()).add('years', -4).add('days', -1).format('YYYY.12.31');
        th_4 = moment($("#startDate").val()).add('years', -4).format('YYYY.01.01') + " - " + moment($("#startDate").val()).add('years', -3).add('days', -1).format('YYYY.12.31');
        th_3 = moment($("#startDate").val()).add('years', -3).format('YYYY.01.01') + " - " + moment($("#startDate").val()).add('years', -2).add('days', -1).format('YYYY.12.31');
        th_2 = moment($("#startDate").val()).add('years', -2).format('YYYY.01.01') + " - " + moment($("#startDate").val()).add('years', -1).add('days', -1).format('YYYY.12.31');
        th_1 = moment($("#startDate").val()).add('years', -1).format('YYYY.01.01') + " - " + moment($("#startDate").val()).add('years', 0).add('days', -1).format('YYYY.12.31');
        th_0 = moment($("#startDate").val()).add('years', 0).format('YYYY.01.01') + " - " + moment($("#startDate").val()).add('years', 1).add('days', -1).format('YYYY.12.31');

        var dateList = th_2 + "@" + th_1 + "@" + th_0 + "@" + th_5 + "@" + th_4  + "@" +  th_3;
        var data = {};

        console.log(dateList);

        data.dateList = dateList;
        data.slctType = slctType;
        console.log(data);
        util.getAjaxData("total", "/rest/connect/login/info/total", data, fn_yearNonOver_success);
    }

    function fn_yearNonOver_success(data, response){
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

                //상단
                if (index == 0) {
                    $("#yearNonOverTableBody tr._tr_" + (detail.month) + " td:eq(" + (index + 1) + ")").html(maleCnt);
                    $("#yearNonOverTableBody tr._tr_" + (detail.month) + " td:eq(" + (index + 2) + ")").html(femaleCnt);
                    $("#yearNonOverTableBody tr._tr_" + (detail.month) + " td:eq(" + (index + 3) + ")").html(femaleAvg);
                    $("#yearNonOverTableBody tr._tr_" + (detail.month) + " td:eq(" + (index + 4) + ")").html(noneCnt);
                    $("#yearNonOverTableBody tr._tr_" + (detail.month) + " td:eq(" + (index + 5) + ")").html(totalCnt);
                } else if (index == 1 || index == 2) {
                    $("#yearNonOverTableBody tr._tr_" + (detail.month) + " td:eq(" + (index * 6 + 1) + ")").html(maleCnt);
                    $("#yearNonOverTableBody tr._tr_" + (detail.month) + " td:eq(" + (index * 6 + 2) + ")").html(femaleCnt);
                    $("#yearNonOverTableBody tr._tr_" + (detail.month) + " td:eq(" + (index * 6 + 3) + ")").html(femaleAvg);
                    $("#yearNonOverTableBody tr._tr_" + (detail.month) + " td:eq(" + (index * 6 + 4) + ")").html(noneCnt);
                    $("#yearNonOverTableBody tr._tr_" + (detail.month) + " td:eq(" + (index * 6 + 5) + ")").html(totalCnt);
                }
                //하단
                if (index == 3){
                    $("#yearNonOverTableBody2 tr._tr_" + (detail.month) + " td:eq(" + (tmp_index + 1) + ")").html(maleCnt);
                    $("#yearNonOverTableBody2 tr._tr_" + (detail.month) + " td:eq(" + (tmp_index + 2) + ")").html(femaleCnt);
                    $("#yearNonOverTableBody2 tr._tr_" + (detail.month) + " td:eq(" + (tmp_index + 3) + ")").html(femaleAvg);
                    $("#yearNonOverTableBody2 tr._tr_" + (detail.month) + " td:eq(" + (tmp_index + 4) + ")").html(noneCnt);
                    $("#yearNonOverTableBody2 tr._tr_" + (detail.month) + " td:eq(" + (tmp_index + 5) + ")").html(totalCnt);
                } else if (index == 4 || index == 5) {
                    $("#yearNonOverTableBody2 tr._tr_" + (detail.month) + " td:eq(" + (tmp_index * 6 + 1) + ")").html(maleCnt);
                    $("#yearNonOverTableBody2 tr._tr_" + (detail.month) + " td:eq(" + (tmp_index * 6 + 2) + ")").html(femaleCnt);
                    $("#yearNonOverTableBody2 tr._tr_" + (detail.month) + " td:eq(" + (tmp_index * 6 + 3) + ")").html(femaleAvg);
                    $("#yearNonOverTableBody2 tr._tr_" + (detail.month) + " td:eq(" + (tmp_index * 6 + 4) + ")").html(noneCnt);
                    $("#yearNonOverTableBody2 tr._tr_" + (detail.month) + " td:eq(" + (tmp_index * 6 + 5) + ")").html(totalCnt);
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
                $("#yearNonOverTableBody tr:eq(0) td:eq(" + (i + 1) + ")").html(totalInfo.sum_maleCnt);
                $("#yearNonOverTableBody tr:eq(0) td:eq(" + (i + 2) + ")").html(totalInfo.sum_femaleCnt);
                $("#yearNonOverTableBody tr:eq(0) td:eq(" + (i + 3) + ")").html(common.average(totalInfo.sum_femaleCnt , totalInfo.sum_totalCnt) + "%");
                $("#yearNonOverTableBody tr:eq(0) td:eq(" + (i + 4) + ")").html(totalInfo.sum_noneCnt);
                $("#yearNonOverTableBody tr:eq(0) td:eq(" + (i + 5) + ")").html(totalInfo.sum_totalCnt);
                $("#yearNonOverTableBody tr:eq(13) td:eq(" + (i + 1) + ")").html(totalInfo.sum_maleCnt);
                $("#yearNonOverTableBody tr:eq(13) td:eq(" + (i + 2) + ")").html(totalInfo.sum_femaleCnt);
                $("#yearNonOverTableBody tr:eq(13) td:eq(" + (i + 3) + ")").html(common.average(totalInfo.sum_femaleCnt , totalInfo.sum_totalCnt) + "%");
                $("#yearNonOverTableBody tr:eq(13) td:eq(" + (i + 4) + ")").html(totalInfo.sum_noneCnt);
                $("#yearNonOverTableBody tr:eq(13) td:eq(" + (i + 5) + ")").html(totalInfo.sum_totalCnt);
            }else if(i == 1 || i == 2){
                $("#yearNonOverTableBody tr:eq(0) td:eq(" + (i * 6 + 1) + ")").html(totalInfo.sum_maleCnt);
                $("#yearNonOverTableBody tr:eq(0) td:eq(" + (i * 6 + 2) + ")").html(totalInfo.sum_femaleCnt);
                $("#yearNonOverTableBody tr:eq(0) td:eq(" + (i * 6 + 3) + ")").html(common.average(totalInfo.sum_femaleCnt , totalInfo.sum_totalCnt) + "%");
                $("#yearNonOverTableBody tr:eq(0) td:eq(" + (i * 6 + 4) + ")").html(totalInfo.sum_noneCnt);
                $("#yearNonOverTableBody tr:eq(0) td:eq(" + (i * 6 + 5) + ")").html(totalInfo.sum_totalCnt);
                $("#yearNonOverTableBody tr:eq(13) td:eq(" + (i * 6 + 1) + ")").html(totalInfo.sum_maleCnt);
                $("#yearNonOverTableBody tr:eq(13) td:eq(" + (i * 6 + 2) + ")").html(totalInfo.sum_femaleCnt);
                $("#yearNonOverTableBody tr:eq(13) td:eq(" + (i * 6 + 3) + ")").html(common.average(totalInfo.sum_femaleCnt , totalInfo.sum_totalCnt) + "%");
                $("#yearNonOverTableBody tr:eq(13) td:eq(" + (i * 6 + 4) + ")").html(totalInfo.sum_noneCnt);
                $("#yearNonOverTableBody tr:eq(13) td:eq(" + (i * 6 + 5) + ")").html(totalInfo.sum_totalCnt);
            }

            // 하단
            if(i == 3){
                $("#yearNonOverTableBody2 tr:eq(0) td:eq(" + (1) + ")").html(totalInfo.sum_maleCnt);
                $("#yearNonOverTableBody2 tr:eq(0) td:eq(" + (2) + ")").html(totalInfo.sum_femaleCnt);
                $("#yearNonOverTableBody2 tr:eq(0) td:eq(" + (3) + ")").html(common.average(totalInfo.sum_femaleCnt , totalInfo.sum_totalCnt) + "%");
                $("#yearNonOverTableBody2 tr:eq(0) td:eq(" + (4) + ")").html(totalInfo.sum_noneCnt);
                $("#yearNonOverTableBody2 tr:eq(0) td:eq(" + (5) + ")").html(totalInfo.sum_totalCnt);
                $("#yearNonOverTableBody2 tr:eq(13) td:eq(" + (1) + ")").html(totalInfo.sum_maleCnt);
                $("#yearNonOverTableBody2 tr:eq(13) td:eq(" + (2) + ")").html(totalInfo.sum_femaleCnt);
                $("#yearNonOverTableBody2 tr:eq(13) td:eq(" + (3) + ")").html(common.average(totalInfo.sum_femaleCnt , totalInfo.sum_totalCnt) + "%");
                $("#yearNonOverTableBody2 tr:eq(13) td:eq(" + (4) + ")").html(totalInfo.sum_noneCnt);
                $("#yearNonOverTableBody2 tr:eq(13) td:eq(" + (5) + ")").html(totalInfo.sum_totalCnt);
            }else if(i == 4 || i == 5){
                $("#yearNonOverTableBody2 tr:eq(0) td:eq(" + (tmp_index * 6 + 1) + ")").html(totalInfo.sum_maleCnt);
                $("#yearNonOverTableBody2 tr:eq(0) td:eq(" + (tmp_index * 6 + 2) + ")").html(totalInfo.sum_femaleCnt);
                $("#yearNonOverTableBody2 tr:eq(0) td:eq(" + (tmp_index * 6 + 3) + ")").html(common.average(totalInfo.sum_femaleCnt , totalInfo.sum_totalCnt) + "%");
                $("#yearNonOverTableBody2 tr:eq(0) td:eq(" + (tmp_index * 6 + 4) + ")").html(totalInfo.sum_noneCnt);
                $("#yearNonOverTableBody2 tr:eq(0) td:eq(" + (tmp_index * 6 + 5) + ")").html(totalInfo.sum_totalCnt);
                $("#yearNonOverTableBody2 tr:eq(13) td:eq(" + (tmp_index * 6 + 1) + ")").html(totalInfo.sum_maleCnt);
                $("#yearNonOverTableBody2 tr:eq(13) td:eq(" + (tmp_index * 6 + 2) + ")").html(totalInfo.sum_femaleCnt);
                $("#yearNonOverTableBody2 tr:eq(13) td:eq(" + (tmp_index * 6 + 3) + ")").html(common.average(totalInfo.sum_femaleCnt , totalInfo.sum_totalCnt) + "%");
                $("#yearNonOverTableBody2 tr:eq(13) td:eq(" + (tmp_index * 6 + 4) + ")").html(totalInfo.sum_noneCnt);
                $("#yearNonOverTableBody2 tr:eq(13) td:eq(" + (tmp_index * 6 + 5) + ")").html(totalInfo.sum_totalCnt);
            }
        }
        // tableHeightSet();
        ui.tableHeightSet();
    }
</script>


<script type="text/x-handlebars-template" id="tmp_dummyYearNonOver">
    <tr class="_tr_{{this}} font-bold" style="color: #ff5600;background-color: #f2f2f2">
        <td>총합</td>
        <td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td style="border-bottom: hidden;border-top: hidden;background-color: white"></td>
        <td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td style="border-bottom: hidden;border-top: hidden;background-color: white"></td>
        <td>0</td><td>0</td><td>0</td><td>0</td><td>0</td>
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

<script type="text/x-handlebars-template" id="tmp_dummyYearNonOver2">
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