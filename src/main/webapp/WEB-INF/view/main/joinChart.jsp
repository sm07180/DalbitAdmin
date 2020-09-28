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
            var apple_join_total_cnt = [
                response.data.detailList[i].apple_join_fCnt,
                response.data.detailList[i].apple_join_mCnt,
                response.data.detailList[i].apple_join_nCnt,
            ];
            response.data.detailList[i].apple_join_total_cnt = common.getListSum(apple_join_total_cnt);

            var fbook_join_total_cnt = [
                response.data.detailList[i].fbook_join_fCnt,
                response.data.detailList[i].fbook_join_mCnt,
                response.data.detailList[i].fbook_join_nCnt,
            ];
            response.data.detailList[i].fbook_join_total_cnt = common.getListSum(fbook_join_total_cnt);

            var google_join_total_cnt = [
                response.data.detailList[i].google_join_fCnt,
                response.data.detailList[i].google_join_mCnt,
                response.data.detailList[i].google_join_nCnt,
            ];
            response.data.detailList[i].google_join_total_cnt = common.getListSum(google_join_total_cnt);

            var kakao_join_total_cnt = [
                response.data.detailList[i].kakao_join_fCnt,
                response.data.detailList[i].kakao_join_mCnt,
                response.data.detailList[i].kakao_join_nCnt,
            ];
            response.data.detailList[i].kakao_join_total_cnt = common.getListSum(kakao_join_total_cnt);

            var naver_join_total_cnt = [
                response.data.detailList[i].naver_join_fCnt,
                response.data.detailList[i].naver_join_mCnt,
                response.data.detailList[i].naver_join_nCnt,
            ];
            response.data.detailList[i].naver_join_total_cnt = common.getListSum(naver_join_total_cnt);

            var phone_join_total_cnt = [
                response.data.detailList[i].phone_join_fCnt,
                response.data.detailList[i].phone_join_mCnt,
                response.data.detailList[i].phone_join_nCnt,
            ];
            response.data.detailList[i].phone_join_total_cnt = common.getListSum(phone_join_total_cnt);
        }

        var apple_join_total_cnt = [
            response.data.totalInfo.apple_join_fCnt,
            response.data.totalInfo.apple_join_mCnt,
            response.data.totalInfo.apple_join_nCnt,
        ];
        response.data.totalInfo.apple_join_total_cnt = common.getListSum(apple_join_total_cnt);

        var fbook_join_total_cnt = [
            response.data.totalInfo.fbook_join_fCnt,
            response.data.totalInfo.fbook_join_mCnt,
            response.data.totalInfo.fbook_join_nCnt,
        ];
        response.data.totalInfo.fbook_join_total_cnt = common.getListSum(fbook_join_total_cnt);

        var google_join_total_cnt = [
            response.data.totalInfo.google_join_fCnt,
            response.data.totalInfo.google_join_mCnt,
            response.data.totalInfo.google_join_nCnt,
        ];
        response.data.totalInfo.google_join_total_cnt = common.getListSum(google_join_total_cnt);

        var kakao_join_total_cnt = [
            response.data.totalInfo.kakao_join_fCnt,
            response.data.totalInfo.kakao_join_mCnt,
            response.data.totalInfo.kakao_join_nCnt,
        ];
        response.data.totalInfo.kakao_join_total_cnt = common.getListSum(kakao_join_total_cnt);

        var naver_join_total_cnt = [
            response.data.totalInfo.naver_join_fCnt,
            response.data.totalInfo.naver_join_mCnt,
            response.data.totalInfo.naver_join_nCnt,
        ];
        response.data.totalInfo.naver_join_total_cnt = common.getListSum(naver_join_total_cnt);

        var phone_join_total_cnt = [
            response.data.totalInfo.phone_join_fCnt,
            response.data.totalInfo.phone_join_mCnt,
            response.data.totalInfo.phone_join_nCnt,
        ];
        response.data.totalInfo.phone_join_total_cnt = common.getListSum(phone_join_total_cnt);

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
                return a.day < b.day ? -1 : a.day > b.day ? 1 : 0;
            });
        }

        setChart2(dst_id, response.data, param);
    }

    function setChart2(dst_id, response, param){
        var detailData = response;
        var chartData = getChartData2(detailData, param);

        var apple = {
            type: 'bar',
            x: chartData.x,
            y: chartData.apple,
            name: "Apple",
            marker: { color: '#fff6cc', line: { width: 0 }, },
            hovertemplate: "<b>Apple:%{y:,.0f}",
        };
        var fbook = {
            type: 'bar',
            x: chartData.x,
            y: chartData.fbook,
            name: "FaceBook",
            marker: { color: '#1f77b4', line: { width: 0 }, },
            hovertemplate: "<b>FaceBook:%{y:,.0f}",
        };
        var google = {
            type: 'bar',
            x: chartData.x,
            y: chartData.google,
            name: "Google",
            marker: { color: '#ff0800', line: { width: 0 }, },
            hovertemplate: "<b>Google:%{y:,.0f}",
        };

        var kakao = {
            type: 'bar',
            x: chartData.x,
            y: chartData.kakao,
            name: "Kakao",
            marker: { color: '#ffda00', line: { width: 0 }, },
            hovertemplate: "<b>Kakao:%{y:,.0f}",
        };

        var naver = {
            type: 'bar',
            x: chartData.x,
            y: chartData.naver,
            name: "Naver",
            marker: { color: '#05b400', line: { width: 0 }, },
            hovertemplate: "<b>Naver:%{y:,.0f}",
        };

        var phone = {
            type: 'bar',
            x: chartData.x,
            y: chartData.phone,
            name: "Phone",
            marker: { color: '#b400a7', line: { width: 0 }, },
            hovertemplate: "<b>Phone:%{y:,.0f}",
        };

        var data = [apple,fbook,google,kakao,naver,phone];

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
                b: 100,
                pad: 4
            },
        };

        var config = {responsive: true};
        Plotly.newPlot('barArea', data, layout, config );

        var json = {
            values: chartData.sumPlaform,
            labels: ['Apple', 'FaceBook', 'Google', 'Kakao', 'Naver', 'Phone'],
            type: 'pie',
            hole: .6
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
                array = detailData.detailList[i].the_hr +'시';
            }else if($('input[name="slctType"]:checked').val() == 1) {
                array = Number(detailData.detailList[i].day) + "일";
            }else if($('input[name="slctType"]:checked').val() == 2) {
                array = detailData.detailList[i].monthly + "월";
            }
            arrayList_x.push(array);
        }

        //y축
        var arrayList_apple = [];
        var max_apple = 10;  //최대값
        for(var i=0 ; i<dataLength; i++) {
            var array = {};
            array = detailData.detailList[i].apple_join_total_cnt;
            arrayList_apple.push(array);
            if(max_apple < array){
                max_apple = array + 10;
            }
        }

        //y축
        var arrayList_fbook = [];
        var max_fbook = 10;  //최대값
        for(var i=0 ; i<dataLength; i++) {
            var array = {};
            array = detailData.detailList[i].fbook_join_total_cnt;
            arrayList_fbook.push(array);
            if(max_fbook < array){
                max_fbook = array + 10;
            }
        }

        //y축
        var arrayList_google = [];
        var max_google = 10;  //최대값
        for(var i=0 ; i<dataLength; i++) {
            var array = {};
            array = detailData.detailList[i].google_join_total_cnt;
            arrayList_google.push(array);
            if(max_google < array){
                max_google = array + 10;
            }
        }

        //y축
        var arrayList_kakao = [];
        var max_kakao = 10;  //최대값
        for(var i=0 ; i<dataLength; i++) {
            var array = {};
            array = detailData.detailList[i].kakao_join_total_cnt;
            arrayList_kakao.push(array);
            if(max_kakao < array){
                max_kakao = array + 10;
            }
        }

        //y축
        var arrayList_naver = [];
        var max_naver = 10;  //최대값
        for(var i=0 ; i<dataLength; i++) {
            var array = {};
            array = detailData.detailList[i].naver_join_total_cnt;
            arrayList_naver.push(array);
            if(max_naver < array){
                max_naver = array + 10;
            }
        }

        //y축
        var arrayList_phone = [];
        var max_phone = 10;  //최대값
        for(var i=0 ; i<dataLength; i++) {
            var array = {};
            array = detailData.detailList[i].phone_join_total_cnt;
            arrayList_phone.push(array);
            if(max_phone < array){
                max_phone = array + 10;
            }
        }


        var max_y;
        max_y = max_apple;

        if(max_y < max_fbook){
            max_y = max_fbook
        }
        if(max_y < max_google){
            max_y = max_google
        }
        if(max_y < max_kakao){
            max_y = max_kakao
        }
        if(max_y < max_naver){
            max_y = max_naver
        }
        if(max_y < max_phone){
            max_y = max_phone
        }

        var sumPlaform = [detailData.totalInfo.apple_join_total_cnt, detailData.totalInfo.fbook_join_total_cnt
                        , detailData.totalInfo.google_join_total_cnt, detailData.totalInfo.kakao_join_total_cnt
                        , detailData.totalInfo.naver_join_total_cnt, detailData.totalInfo.phone_join_total_cnt
                        ];

        console.log("-------------------------------------");
        console.log(max_fbook);
        console.log(max_google);
        console.log(max_kakao);
        console.log(max_naver);
        console.log(max_phone);
        console.log(max_apple);
        console.log(max_y);

        var resultData = {
            x : arrayList_x
            , apple : arrayList_apple
            , fbook : arrayList_fbook
            , google : arrayList_google
            , kakao : arrayList_kakao
            , naver : arrayList_naver
            , phone : arrayList_phone
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
            type: 'pie',
            hole: .6
        }
        var data = [json];
        var layout = {
            title: '',
        };
        Plotly.newPlot('pieArea2', data, layout);

        var json = {
            values: chartData.sumAge,
            labels: ['10대','20대','30대','40대','50대','60대'],
            type: 'pie',
            hole: .6
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