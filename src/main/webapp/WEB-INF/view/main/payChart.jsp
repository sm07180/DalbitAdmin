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
        var detailData = response.data.totalInfo;
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
        // var payWay = {
        //     type: 'bar',
        //     x: chartData.x,
        //     y: chartData.y,
        //     customdata : chartData.xCnt,
        //     name: "",
        //     marker: { color: color, line: { width: 0 }, },
        //     hovertemplate: "<b>%{customdata:,.0f}건 / %{y:,.0f}",
        // };
        //
        // var data = [payWay];
        //
        // var layout = {
        //     xaxis: { range: [0, 12], autorange: false },
        //     yaxis: { range: [0, chartData.max_x], autorange: false ,tickformat: ',d',},
        //     legend: { y: 1, y: 1, traceorder: 'reversed',separators : '.,'
        //         , font: { size: 13 }
        //     }
        // };
        //
        // var config = {responsive: true};
        // Plotly.newPlot('payWayBarChart', data, layout, config );


        var data = [{
            type: 'bar',
            x: chartData.x,
            y: chartData.y,
            orientation: 'h',
            marker: { color: color, line: { width: 0 }, },
            customdata : chartData.xCnt,
            hovertemplate: "<b>%{customdata:,.0f}건 / %{x:,.0f}",
        }];

        var layout = {
            xaxis: { range: [0, chartData.max_x], autorange: false ,tickformat: ',d',},
            yaxis: { range: [0, 10], autorange: false ,tickformat: ',d',},
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

        Plotly.newPlot('payWayBarChart', data, layout);



        var json = {
            values: chartData.x,
            labels: chartData.y,
            type: 'pie'
        }
        var data = [json];
        var layout = {
            margin: {
                l: 120,
                r: 50,
                t: 20,
                b: 20,
                pad: 4
            },
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
            // detailData.sum_ggAmt,
            // detailData.sum_gcAmt,
            detailData.sum_tmoneyAmt,
            detailData.sum_cashbeeAmt,
            detailData.sum_paycoAmt,
            detailData.sum_kakaopayAmt,
        ];

        var max_x;
        max_x = Math.max.apply(null, arrayList_max_x);

        //x축
        var arrayList_x = [
            detailData.sum_mcAmt,
            detailData.sum_cnAmt,
            detailData.sum_inappAmt,
            detailData.sum_vaAmt,
            detailData.sum_gmAmt,
            detailData.sum_hmAmt,
            // detailData.sum_ggAmt,
            // detailData.sum_gcAmt,
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
            // detailData.sum_ggCnt,
            // detailData.sum_gcCnt,
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
            // "스마트문상(게임)",
            // "도서문화상품권",
            "티머니",
            "캐시비",
            "페이코",
            "카카오페이",
        ];

        var resultData = {
            x : arrayList_x
            , xCnt : arrayList_xCnt
            , y : arrayList_y
            , max_x : max_x
        };

        console.log(resultData);
        return resultData;
    }


    function fn_agePay_success(dst_id, response, param){
        var detailData = response.data.totalInfo;
        var chartData = getPayGenderAgeChart(detailData, param);

        var json = {
            values: chartData.genderAmt,
            labels: chartData.genderType,
            type: 'pie'
        }
        var data = [json];
        var layout = {
            title: '',
        };
        Plotly.newPlot('payGenderPieChart', data, layout);


        var json = {
            values: chartData.ageAmt,
            labels: chartData.ageType,
            type: 'pie'
        }
        var data = [json];
        var layout = {
            title: '',
        };
        Plotly.newPlot('payAgePieChart', data, layout);

    }

    function getPayGenderAgeChart(detailData, param) {

        var genderAmt = [
            detailData.sum_maleAmt,
            detailData.sum_femaleAmt,
            detailData.sum_noneAmt,
        ];
        var genderType = [
            "남",
            "여",
            "알수없음",
        ];

        var ageAmt = [
            detailData.sum_age10Amt,
            detailData.sum_age20Amt,
            detailData.sum_age30Amt,
            detailData.sum_age40Amt,
            detailData.sum_age50Amt,
            detailData.sum_age60Amt,
        ];
        var ageType = [
            "10대",
            "20대",
            "30대",
            "40대",
            "50대",
            "60대",
        ];

        var resultData = {
            genderAmt : genderAmt
            , genderType : genderType
            , ageAmt : ageAmt
            , ageType : ageType
        };

        console.log(resultData);
        return resultData;
    }


</script>