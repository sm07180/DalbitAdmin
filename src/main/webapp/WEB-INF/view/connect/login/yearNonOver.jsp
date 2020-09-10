<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 로그인 > 총계 -->
<div class="widget-table mb10">
    <div class="widget-content mt10">
        <div class="col-md-12 no-padding">
            <span class="_searchDate"></span>

            <div class="col-md-12 no-padding">
                <table class="table table-bordered _tableHeight" data-height="23px">
                    <colgroup>
                        <col width="10%"/><col width="35%"/><col width="10%"/><col width="10%"/><col width="10%"/>
                        <col width="10%"/><col width="10%"/>
                    </colgroup>
                    <thead>
                    <tr style="background-color: #b4c7e7">
                        <th colspan="2">週 (일 ~ 토)</th>
                        <th class="_sex_male"></th>
                        <th class="_sex_female"></th>
                        <th class="_sex_female"></th>
                        <th class="_sex_none"></th>
                        <th>총계</th>
                    </tr>
                    </thead>
                    <tbody id="totalWeekTableBody"></tbody>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="col-md-5 no-padding">
            <table class="table table-bordered _tableHeight" data-height="23px">
                <colgroup>
                    <col width="6.2%"/>
                    <col width="6.2%"/><col width="6.2%"/><col width="6.2%"/><col width="6.2%"/><col width="6.2%"/>
                </colgroup>
                <thead>
                <tr style="background-color: #b4c7e7">
                    <th rowspan="2"></th>
                    <th class="_totalDate" colspan="5" id="yearNonOver_th"></th>
                </tr>
                <tr style="background-color: #dae3f3">
                    <th class="_sex_male"></th>
                    <th class="_sex_female"></th>
                    <th class="_sex_female"></th>
                    <th class="_sex_none">알수없음</th>
                    <th >소계</th>
                </tr>
                </thead>
                <tbody id="yearNonOverTableBody"></tbody>
            </table>
        </div>
    </div>
    <div class="widget-footer">
        <span>
            <%--<button class="btn btn-default print-btn pull-right" type="button" id="excelDownBtn"><i class="fa fa-print"></i>Excel Down</button>--%>
        </span>
    </div>
</div>

<script type="text/javascript" src="/js/handlebars/statusHelper.js?${dummyData}"></script>

<script type="text/javascript">
    $(function(){
        // getYearNonOver();
    });

    var tmp = 0;
    var tmp_end = 0;
    var type;
    function getYearNonOver(){
        var th;
        $("#yearNonOver_th").text(moment($("#startDate").val()).add('years', 0).format('YYYY'));
        th = moment($("#startDate").val()).add('years', 0).format('YYYY.01.01') + " - " + moment($("#startDate").val()).add('years', 1).add('days', -1).format('YYYY.12.31');
        var dateList =th ;
        var data = {};
        data.dateList = dateList;
        data.slctType = slctType;
        util.getAjaxData("total", "/rest/connect/login/info/total", data, fn_yearNonOver_success);

        data = {};
        data.slctType = "3";
        data.startDate = moment($("#startDate").val()).add('years', 0).format('YYYY.01.01');
        data.endDate = moment($("#startDate").val()).add('years', 1).add('days', -1).format('YYYY.12.31');
        util.getAjaxData("total", "/rest/connect/login/total/week", data, fn_yearNonOverWeek_success);
    }

    function fn_yearNonOverWeek_success(data, response){
        $("#totalWeekTableBody").empty();
        var template = $('#tmp_totalWeekTable').html();
        var templateScript = Handlebars.compile(template);
        var detailContext = response.data.detailList;
        var html=templateScript(detailContext);
        $("#totalWeekTableBody").append(html);
        ui.tableHeightSet();

        var tmp_date = new Date();
        tmp_date = moment(tmp_date).format("YYYY.MM.DD HH:mm:SS");
        var tmp_day = tmp_date.split(" ")[0];
        var tmp_time = tmp_date.split(" ")[1];

        for (var i = 1; i < 7; i++) {
            $("#totalWeekTableBody td:eq(" + (i) + ")").css("font-weight", "bold");
        }

    }
    function fn_yearNonOver_success(data, response){
        tmp_end = 0;
        tmp = response.data[0].detailList.length - 1;
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

        var tmp_date = new Date();
        tmp_date = moment(tmp_date).format("YYYY.MM.DD HH:mm:SS");
        var tmp_day = tmp_date.split(" ")[0];
        var tmp_time = tmp_date.split(" ")[1];

        response.data.forEach(function(data, index){
            data.detailList.forEach(function(detail, detailIndex){
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
                $("#yearNonOverTableBody tr._tr_" + (detail.month) + " td:eq(" + (1) + ")").html(maleCnt);
                $("#yearNonOverTableBody tr._tr_" + (detail.month) + " td:eq(" + (2) + ")").html(femaleCnt);
                $("#yearNonOverTableBody tr._tr_" + (detail.month) + " td:eq(" + (3) + ")").html(femaleAvg);
                $("#yearNonOverTableBody tr._tr_" + (detail.month) + " td:eq(" + (4) + ")").html(noneCnt);
                $("#yearNonOverTableBody tr._tr_" + (detail.month) + " td:eq(" + (5) + ")").html(totalCnt);

                if(Number(tmp_day.split(".")[1]) == detail.month) {
                    for (var i = 1; i < 6; i++) {
                        $("#yearNonOverTableBody tr._tr_" + (detail.month) + " td:eq(" + (i) + ")").css("font-weight", "bold");
                    }
                }

            });
        });

        for(var i=0 ; i<response.data.length;i++){
            var totalInfo = response.data[i].totalInfo;
            $("#yearNonOverTableBody tr:eq(0) td:eq(" + (1) + ")").html(common.addComma(totalInfo.sum_umaleCnt));
            $("#yearNonOverTableBody tr:eq(0) td:eq(" + (2) + ")").html(common.addComma(totalInfo.sum_ufemaleCnt));
            $("#yearNonOverTableBody tr:eq(0) td:eq(" + (3) + ")").html(common.average(totalInfo.sum_ufemaleCnt , totalInfo.sum_utotalCnt) + "%");
            $("#yearNonOverTableBody tr:eq(0) td:eq(" + (4) + ")").html(common.addComma(totalInfo.sum_unoneCnt));
            $("#yearNonOverTableBody tr:eq(0) td:eq(" + (5) + ")").html(common.addComma(totalInfo.sum_utotalCnt));
            $("#yearNonOverTableBody tr:eq( " + (tmp+1) +  ") td:eq(" + (1) + ")").html(common.addComma(totalInfo.sum_umaleCnt));
            $("#yearNonOverTableBody tr:eq( " + (tmp+1) +  ") td:eq(" + (2) + ")").html(common.addComma(totalInfo.sum_ufemaleCnt));
            $("#yearNonOverTableBody tr:eq( " + (tmp+1) +  ") td:eq(" + (3) + ")").html(common.average(totalInfo.sum_ufemaleCnt , totalInfo.sum_utotalCnt) + "%");
            $("#yearNonOverTableBody tr:eq( " + (tmp+1) +  ") td:eq(" + (4) + ")").html(common.addComma(totalInfo.sum_unoneCnt));
            $("#yearNonOverTableBody tr:eq( " + (tmp+1) +  ") td:eq(" + (5) + ")").html(common.addComma(totalInfo.sum_utotalCnt));
        }
        ui.tableHeightSet();
    }
</script>

<script type="text/x-handlebars-template" id="tmp_totalWeekTable">
    {{#each this as |data|}}
    <tr>
        <td class="font-bold">
            {{data.week}}주
        </td>
        <td>{{date}}</td>
        <td style="color: blue">{{addComma maleCnt}}</td>
        <td style="color: red">{{addComma femaleCnt}}</td>
        <td style="color: red">{{average femaleCnt totalCnt}}%</td>
        <td>{{addComma noneCnt}}</td>
        <td>{{addComma totalCnt}}</td>
    </tr>
    {{/each}}
</script>

<script type="text/x-handlebars-template" id="tmp_dummyYearNonOver">
    <tr class="_tr_{{this}} font-bold" style="color: #ff5600;background-color: #f2f2f2">
        <td>총합</td>
        <td>0</td><td>0</td><td>0</td><td>0</td><td>0</td>
    </tr>
    {{#each this.slctType_date}}
    <tr class="_tr_{{this}}">
        <td class="font-bold"  style="background-color: #dae3f3">{{this}}</td>
        <td>0</td><td>0</td><td>0</td><td>0</td><td>0</td>
    </tr>
    {{/each}}
    <tr class="_tr_{{this}} font-bold" style="color: #ff5600;background-color: #f2f2f2">
        <td>총합</td>
        <td>0</td><td>0</td><td>0</td><td>0</td><td>0</td>
    </tr>
</script>