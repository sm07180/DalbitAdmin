<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!--방송건수 차트-->
<div class="widget row">
    <div class="widget-content">
        <!-- end chart tab nav -->
        <div class="col-md-8 no-padding">
            <div id='barArea'></div>
        </div>
        <div class="col-md-4 no-padding">
            <div id='pieArea'></div>
        </div>
        <div class="col-md-6 no-padding">
            <div id='pieArea2'></div>
        </div>
        <div class="col-md-6 no-padding">
            <div id='pieArea3'></div>
        </div>
        <!-- end chart placeholder-->
        <hr class="separator">
    </div>
</div>

<script type="text/javascript">

    function fn_platform_success(dst_id, response, param){
        for(var i=0; i<response.data.detailList.length;i++){
            var android_total_cnt = [
                response.data.detailList[i].androidFCnt,
                response.data.detailList[i].androidMCnt,
                response.data.detailList[i].androidNCnt
            ];
            response.data.detailList[i].adnroidTotal = common.getListSum(android_total_cnt);

            var ios_total_cnt = [
                response.data.detailList[i].iosFCnt,
                response.data.detailList[i].iosMCnt,
                response.data.detailList[i].iosNCnt
            ];
            response.data.detailList[i].iosTotal = common.getListSum(ios_total_cnt);

            var pc_total_cnt = [
                response.data.detailList[i].pcFCnt,
                response.data.detailList[i].pcMCnt,
                response.data.detailList[i].pcNCnt
            ];
            response.data.detailList[i].pcTotal = common.getListSum(pc_total_cnt);
        }

        var sum_android_total_cnt = [
            response.data.totalInfo.sum_androidFCnt,
            response.data.totalInfo.sum_androidMCnt,
            response.data.totalInfo.sum_androidNCnt
        ];
        response.data.totalInfo.sumAosTotal = common.getListSum(sum_android_total_cnt);

        var sum_ios_total_cnt = [
            response.data.totalInfo.sum_iosFCnt,
            response.data.totalInfo.sum_iosMCnt,
            response.data.totalInfo.sum_iosNCnt
        ];
        response.data.totalInfo.sumIosTotal = common.getListSum(sum_ios_total_cnt);

        var sum_pc_total_cnt = [
            response.data.totalInfo.sum_pcFCnt,
            response.data.totalInfo.sum_pcMCnt,
            response.data.totalInfo.sum_pcNCnt
        ];
        response.data.totalInfo.sumPcTotal = common.getListSum(sum_pc_total_cnt);



        if($('input[name="slctType"]:checked').val() == 0 || $('input[name="slctType"]:checked').val() == 2) {
            if($('input[name="slctType"]:checked').val() == 0){
                var sortingField = "hour";
            }else{
                var sortingField = "monthly";
            }
            response.data.detailList.sort(function(a, b) { // 오름차순
                return a[sortingField] - b[sortingField];
            });

        }else if($('input[name="slctType"]:checked').val() == 1) {
            response.data.detailList.sort(function(a, b) { // 오름차순
                return a.daily < b.daily ? -1 : a.daily > b.daily ? 1 : 0;
            });
        }

        setChart2(dst_id, response.data, param);
    }

    function setChart2(dst_id, response, param){
        var detailData = response;
        var chartData = getChartData2(detailData, param);

        //바
        var aos = {
            type: 'bar',
            x: chartData.x,
            y: chartData.aos,
            name: "안드로이드",
            marker: { color: '#2ca02c', line: { width: 0 }, },
            hovertemplate: "<b>안드로이드:%{y:,.0f}",
        };
        var ios = {
            type: 'bar',
            x: chartData.x,
            y: chartData.ios,
            name: "IOS",
            marker: { color: '#ff7f0e', line: { width: 0 }, },
            hovertemplate: "<b>IOS:%{y:,.0f}",
        };
        var pc = {
            type: 'bar',
            x: chartData.x,
            y: chartData.pc,
            name: "PC",
            marker: { color: '#1f77b4', line: { width: 0 }, },
            hovertemplate: "<b>PC:%{y:,.0f}",
        };

        var data = [aos,ios,pc];

        var layout = {
            xaxis: { range: [0, chartData.dataLength], autorange: false },
            yaxis: { range: [0, chartData.max_y], autorange: false ,tickformat: ',d',},
            legend: { y: 1, y: 1, traceorder: 'reversed',separators : '.,'
                , font: { size: 13 }
            },
            margin: {
                l: 120,
                r: 50,
                t: 20,
                b: 20,
                pad: 4
            },
        };

        var config = {responsive: true};
        Plotly.newPlot('barArea', data, layout, config );

        var json = {
            values: chartData.sumPlaform,
            labels: ['안드로이드', 'IOS', 'PC'],
            type: 'pie'
        }

        var data = [json];

        var layout = {
            title: '',
        };
        Plotly.newPlot('pieArea', data, layout);
    }


    function getChartData2(detailData, param) {
        //x축
        var arrayList_x = [];
        var dataLength = detailData.detailList.length;
        for (var i = 0; i < dataLength; i++) {
            var array = {};
            if($('input[name="slctType"]:checked').val() == 0) {
                array = detailData.detailList[i].hour +'시';
            }else if($('input[name="slctType"]:checked').val() == 1) {
                array = detailData.detailList[i].daily.split("-")[1] + "월" + detailData.detailList[i].daily.split("-")[2] + "일";
            }else if($('input[name="slctType"]:checked').val() == 2) {
                array = detailData.detailList[i].monthly + "월";
            }
            arrayList_x.push(array);
        }

        //y축
        var arrayList_aos = [];
        var max_aos = 10;  //최대값
        for(var i=0 ; i<dataLength; i++) {
            var array = {};
            array = detailData.detailList[i].adnroidTotal;
            arrayList_aos.push(array);
            if(max_aos < array){
                max_aos = array + 10;
            }
        }

        //y축
        var arrayList_ios = [];
        var max_ios = 10;  //최대값
        for(var i=0 ; i<dataLength; i++) {
            var array = {};
            array = detailData.detailList[i].iosTotal;
            arrayList_ios.push(array);
            if(max_ios < array){
                max_ios = array + 10;
            }
        }

        //y축
        var arrayList_pc = [];
        var max_pc = 10;  //최대값
        for(var i=0 ; i<dataLength; i++) {
            var array = {};
            array = detailData.detailList[i].pcTotal;
            arrayList_pc.push(array);
            if(max_pc < array){
                max_pc = array + 10;
            }
        }
        var max_y;
        max_y = max_aos;
        (max_y < max_ios) ? max_y = max_ios : ((max_y < max_pc) ?  max_y = max_pc : max_y = max_aos);

        var sumPlaform = [detailData.totalInfo.sumAosTotal, detailData.totalInfo.sumIosTotal, detailData.totalInfo.sumPcTotal];

        var resultData = {
            x : arrayList_x
            , aos : arrayList_aos
            , ios : arrayList_ios
            , pc : arrayList_pc
            , sumPlaform : sumPlaform
            , max_y : max_y
            , dataLength : dataLength
        };

        console.log(resultData);
        return resultData;
    }

    function fn_genderAge_success(dst_id, response, param){
        var age10_cnt = [
            response.data.totalInfo.sum_age10FCnt,
            response.data.totalInfo.sum_age10MCnt,
            response.data.totalInfo.sum_age10NCnt,
        ];
        response.data.totalInfo.age10Cnt = common.getListSum(age10_cnt);
        var age20_cnt = [
            response.data.totalInfo.sum_age20FCnt,
            response.data.totalInfo.sum_age20MCnt,
            response.data.totalInfo.sum_age20NCnt,
        ];
        response.data.totalInfo.age20Cnt = common.getListSum(age20_cnt);
        var age30_cnt = [
            response.data.totalInfo.sum_age30FCnt,
            response.data.totalInfo.sum_age30MCnt,
            response.data.totalInfo.sum_age30NCnt,
        ];
        response.data.totalInfo.age30Cnt = common.getListSum(age30_cnt);
        var age40_cnt = [
            response.data.totalInfo.sum_age40FCnt,
            response.data.totalInfo.sum_age40MCnt,
            response.data.totalInfo.sum_age40NCnt,
        ];
        response.data.totalInfo.age40Cnt = common.getListSum(age40_cnt);
        var age50_cnt = [
            response.data.totalInfo.sum_age50FCnt,
            response.data.totalInfo.sum_age50MCnt,
            response.data.totalInfo.sum_age50NCnt,
        ];
        response.data.totalInfo.age50Cnt = common.getListSum(age50_cnt);
        var age60_cnt = [
            response.data.totalInfo.sum_age60FCnt,
            response.data.totalInfo.sum_age60MCnt,
            response.data.totalInfo.sum_age60NCnt,
        ];
        response.data.totalInfo.age60Cnt = common.getListSum(age60_cnt);

        setChart3(dst_id, response.data.totalInfo, param);
    }

    function setChart3(dst_id, response, param){
        var detailData = response;
        var chartData = getChartData3(detailData, param);

        var json = {
            values: chartData.sumGender,
            labels: ['남', '여', '알수없음'],
            type: 'pie'
        }
        var data = [json];
        var layout = {
            title: '',
        };
        Plotly.newPlot('pieArea2', data, layout);

        var json = {
            values: chartData.sumAge,
            labels: ['10대','20대','30대','40대','50대','60대'],
            type: 'pie'
        }
        var data = [json];
        var layout = {
            title: '',
        };
        Plotly.newPlot('pieArea3', data, layout);

    }


    function getChartData3(detailData, param) {
        //x축
        var sumGender = [detailData.sum_totalMCnt, detailData.sum_totalFCnt, detailData.sum_totalNCnt];
        var sumAge = [detailData.age10Cnt, detailData.age20Cnt, detailData.age30Cnt, detailData.age40Cnt, detailData.age50Cnt, detailData.age60Cnt];

        var resultData = {
            sumGender : sumGender
            ,sumAge : sumAge
        };

        console.log(resultData);
        return resultData;
    }

</script>