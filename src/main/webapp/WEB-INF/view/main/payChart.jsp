<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!--방송건수 차트-->
<div class="widget row">
    <div class="widget-content">
        <!-- end chart tab nav -->
        <div class="col-md-8 no-padding">
            <div id='payWayBarChart'></div>
        </div>
        <div class="col-md-4 no-padding">
            <div id='payWayPieChart'></div>
        </div>
        <div class="col-md-6 no-padding">
            <div id='payGenderPieChart'></div>
        </div>
        <div class="col-md-6 no-padding">
            <div id='payAgePieChart'></div>
        </div>
        <%--<div class="col-md-6 no-padding">--%>
            <%--<div id='payCancelWayBarChart'></div>--%>
        <%--</div>--%>
        <%--<div class="col-md-6 no-padding">--%>
            <%--<div id='payCancelWayPieChart'></div>--%>
        <%--</div>--%>
        <!-- end chart placeholder-->
    </div>
</div>

<script type="text/javascript">

    function fn_payWay_success(dst_id, response, param){
        setPayWayChart(dst_id, response.data.totalInfo, param);
    }

    function setPayWayChart(dst_id, response, param){
        var detailData = response;
        var chartData = getPayWayChart(detailData, param);

        var color = [
            '#00ffbc'
            ,'#00ff4a'
            ,'#3dff00'
            ,'#8fff00'
            ,'#e6ff00'
            ,'#ffda00'
            ,'#ffac00'
            ,'#ff4700'
            ,'#ff0091'
            ,'#ff00d4'
            ,'#bc00ff'
            ,'#9900ff'
        ]

        //바
        var payWay = {
            type: 'bar',
            x: chartData.x,
            y: chartData.y,
            customdata : chartData.xCnt,
            name: "",
            marker: { color: color, line: { width: 0 }, },
            hovertemplate: "<b>%{customdata:,.0f}건 / %{y:,.0f}",
        };

        var data = [payWay];

        var layout = {
            xaxis: { range: [0, 12], autorange: false },
            yaxis: { range: [0, chartData.max_x], autorange: false ,tickformat: ',d',},
            legend: { y: 1, y: 1, traceorder: 'reversed',separators : '.,'
                , font: { size: 13 }
            }
        };

        var config = {responsive: true};
        Plotly.newPlot('payWayBarChart', data, layout, config );

        var json = {
            values: chartData.y,
            labels: chartData.x,
            type: 'pie'
        }
        var data = [json];
        var layout = {
            title: '',
        };
        Plotly.newPlot('payWayPieChart', data, layout);
    }


    function getPayWayChart(detailData, param) {

        //x축
        var arrayList_max_x = [
            detailData.sum_mcAmt,
            detailData.sum_cnAmt,
            detailData.sum_inappAmt,
            detailData.sum_vaAmt,
            detailData.sum_gmAmt,
            detailData.sum_hmAmt,
            detailData.sum_ggAmt,
            detailData.sum_gcAmt,
            detailData.sum_tmoneyAmt,
            detailData.sum_cashbeeAmt,
            detailData.sum_paycoAmt,
            detailData.sum_kakaopayAmt,
        ];

        arrayList_max_x.sort(function(a, b) { // 오름차순
            return b - a;
        });

        var max_x;
        max_x = arrayList_max_x[0];

        //x축
        var arrayList_x = [
            detailData.sum_mcAmt,
            detailData.sum_cnAmt,
            detailData.sum_inappAmt,
            detailData.sum_vaAmt,
            detailData.sum_gmAmt,
            detailData.sum_hmAmt,
            detailData.sum_ggAmt,
            detailData.sum_gcAmt,
            detailData.sum_tmoneyAmt,
            detailData.sum_cashbeeAmt,
            detailData.sum_paycoAmt,
            detailData.sum_kakaopayAmt,
        ];
        var arrayList_xCnt = [
            detailData.sum_mcCnt,
            detailData.sum_cnCnt,
            detailData.sum_inappCnt,
            detailData.sum_vaCnt,
            detailData.sum_gmCnt,
            detailData.sum_hmCnt,
            detailData.sum_ggCnt,
            detailData.sum_gcCnt,
            detailData.sum_tmoneyCnt,
            detailData.sum_cashbeeCnt,
            detailData.sum_paycoCnt,
            detailData.sum_kakaopayCnt,
        ];

        //y축
        var arrayList_y = [
            "휴대폰",
            "카드",
            "인앱결제(아이폰)",
            "가상계좌아체",
            "문화상품권",
            "해피머니상품권",
            "스마트문상(게임)",
            "도서문화상품권",
            "티머니",
            "캐시비",
            "페이코",
            "카카오페이",
        ];

        var resultData = {
            x : arrayList_y
            , xCnt : arrayList_xCnt
            , y : arrayList_x
            , max_x : max_x
        };

        console.log(resultData);
        return resultData;
    }

    // function fn_genderAge_success(dst_id, response, param){
    //     var age10_cnt = [
    //         response.data.totalInfo.sum_age10FCnt,
    //         response.data.totalInfo.sum_age10MCnt,
    //         response.data.totalInfo.sum_age10NCnt,
    //     ];
    //     response.data.totalInfo.age10Cnt = common.getListSum(age10_cnt);
    //     var age20_cnt = [
    //         response.data.totalInfo.sum_age20FCnt,
    //         response.data.totalInfo.sum_age20MCnt,
    //         response.data.totalInfo.sum_age20NCnt,
    //     ];
    //     response.data.totalInfo.age20Cnt = common.getListSum(age20_cnt);
    //     var age30_cnt = [
    //         response.data.totalInfo.sum_age30FCnt,
    //         response.data.totalInfo.sum_age30MCnt,
    //         response.data.totalInfo.sum_age30NCnt,
    //     ];
    //     response.data.totalInfo.age30Cnt = common.getListSum(age30_cnt);
    //     var age40_cnt = [
    //         response.data.totalInfo.sum_age40FCnt,
    //         response.data.totalInfo.sum_age40MCnt,
    //         response.data.totalInfo.sum_age40NCnt,
    //     ];
    //     response.data.totalInfo.age40Cnt = common.getListSum(age40_cnt);
    //     var age50_cnt = [
    //         response.data.totalInfo.sum_age50FCnt,
    //         response.data.totalInfo.sum_age50MCnt,
    //         response.data.totalInfo.sum_age50NCnt,
    //     ];
    //     response.data.totalInfo.age50Cnt = common.getListSum(age50_cnt);
    //     var age60_cnt = [
    //         response.data.totalInfo.sum_age60FCnt,
    //         response.data.totalInfo.sum_age60MCnt,
    //         response.data.totalInfo.sum_age60NCnt,
    //     ];
    //     response.data.totalInfo.age60Cnt = common.getListSum(age60_cnt);
    //
    //     setChart3(dst_id, response.data.totalInfo, param);
    // }
    //
    // function setChart3(dst_id, response, param){
    //     var detailData = response;
    //     var chartData = getChartData3(detailData, param);
    //
    //     var json = {
    //         values: chartData.sumGender,
    //         labels: ['남', '여', '알수없음'],
    //         type: 'pie'
    //     }
    //     var data = [json];
    //     var layout = {
    //         title: '',
    //     };
    //     Plotly.newPlot('pieArea2', data, layout);
    //
    //     var json = {
    //         values: chartData.sumAge,
    //         labels: ['10대','20대','30대','40대','50대','60대'],
    //         type: 'pie'
    //     }
    //     var data = [json];
    //     var layout = {
    //         title: '',
    //     };
    //     Plotly.newPlot('pieArea3', data, layout);
    //
    // }
    //
    //
    // function getChartData3(detailData, param) {
    //     //x축
    //     var sumGender = [detailData.sum_totalMCnt, detailData.sum_totalFCnt, detailData.sum_totalNCnt];
    //     var sumAge = [detailData.age10Cnt, detailData.age20Cnt, detailData.age30Cnt, detailData.age40Cnt, detailData.age50Cnt, detailData.age60Cnt];
    //
    //     var resultData = {
    //         sumGender : sumGender
    //         ,sumAge : sumAge
    //     };
    //
    //     console.log(resultData);
    //     return resultData;
    // }

</script>