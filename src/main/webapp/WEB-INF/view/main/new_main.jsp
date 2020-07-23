<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="container-fluid">
            <!--가입/탈퇴-->
            <form id="searchForm">
                <div class="row form-inline">
                    <div class="widget widget-table searchBoxArea">
                        <div class="widget-header searchBoxRow">
                            <h3 class="title"><i class="fa fa-search"></i> 검색조건</h3>
                            <div>
                                <span id="slctTypeArea"></span>
                                <div class="input-group date" id="oneDayDatePicker">
                                    <label for="onedayDate" class="input-group-addon">
                                        <span><i class="fa fa-calendar" id="onedayDateBtn"></i></span>
                                    </label>
                                    <input type="text" class="form-control" id="onedayDate" name="onedayDate">
                                </div>

                                <div class="input-group date" id="monthDatepicker" style="display:none;">
                                    <label for="monthDate" class="input-group-addon">
                                        <span><i class="fa fa-calendar"></i></span>
                                    </label>
                                    <input id="monthDate" type="text" class="form-control" style="width: 196px;"/>
                                </div>

                                <div class="input-group date" id="yearDatepicker" style="display:none;">
                                    <label for="yearDate" class="input-group-addon">
                                        <span><i class="fa fa-calendar"></i></span>
                                    </label>
                                    <input id="yearDate" type="text" class="form-control" style="width: 196px;"/>
                                </div>


                                <input type="hidden" name="startDate" id="startDate">
                                <input type="hidden" name="endDate" id="endDate" />

                                <%--<input name="startDate" id="startDate">--%>
                                <%--<input name="endDate" id="endDate" />--%>
                                <button type="button" class="btn btn-success" id="bt_search">검색</button>
                                <a href="javascript://" class="_prevSearch">[이전]</a>
                                <a href="javascript://" class="_todaySearch">[오늘]</a>
                                <a href="javascript://" class="_nextSearch">[다음]</a>
                            </div>
                        </div>
                    </div>
                </div>
            </form>

            <div class="row">
                <div class="widget widget-table mb10 col-lg-3 no-padding">
                    <div class="widget-header">
                        <h3>
                            <a href="javascript://" onclick="labelClick(0);">
                                <i class="fa fa-bar-chart-o"></i> 가입 / 탈퇴
                            </a>
                        </h3>
                    </div>
                    <div class="widget-content mt10">
                        <table class="table table-condensed table-dark-header table-bordered">
                            <thead>
                            <tr>
                                <th></th>
                                <th>수치</th>
                                <th>증감</th>
                            </tr>
                            </thead>
                            <tbody id="joinWithdrawal_tableBody">
                            </tbody>
                        </table>
                    </div>
                </div>
                <!--//가입/탈퇴-->

                <!--접속자-->
                <div class="widget widget-table mb10 col-lg-3 no-padding">
                    <div class="widget-header">
                        <h3>
                            <a href="javascript://" onclick="labelClick(1);">
                                <i class="fa fa-bar-chart-o"></i> 접속자 (PV/UV)
                            </a>
                        </h3>
                    </div>
                    <div class="widget-content mt10">
                        <table class="table table-condensed table-dark-header table-bordered">
                            <thead>
                            <tr>
                                <th></th>
                                <th>수치</th>
                                <th>증감</th>
                            </tr>
                            </thead>
                            <tbody id="login_tableBody">
                            </tbody>
                        </table>
                    </div>
                </div>
                <!--//접속자-->

                <!--방송개설/청취자-->
                <div class="widget widget-table mb10 col-lg-3 no-padding">
                    <div class="widget-header">
                        <h3>
                            <a href="javascript://" onclick="labelClick(2);">
                                <i class="fa fa-bar-chart-o"></i> 방송개설/청취자
                            </a>
                        </h3>
                    </div>
                    <div class="widget-content mt10">
                        <table class="table table-condensed table-dark-header table-bordered">
                            <thead>
                            <tr>
                                <th></th>
                                <th>건수</th>
                                <th>증감</th>
                            </tr>
                            </thead>
                            <tbody id="broadcastListener_tableBody">
                            </tbody>
                        </table>
                    </div>
                </div>
                <!--//방송개설/청취자-->

                <!--결제/결제취소/환불/환전-->
                <div class="widget widget-table mb10 col-lg-3 no-padding">
                    <div class="widget-header">
                        <h3>
                            <a href="javascript://" onclick="labelClick(3);">
                                <i class="fa fa-bar-chart-o"></i> 결제/결제 취소/환불/환전
                            </a>
                        </h3>
                    </div>
                    <div class="widget-content mt10">
                        <table class="table table-condensed table-dark-header table-bordered">
                            <thead>
                            <tr>
                                <th></th>
                                <th>건수</th>
                                <th>증감</th>
                                <th>금액</th>
                                <th>증감</th>
                            </tr>
                            </thead>
                            <tbody id="paymentCancel_tableBody">
                            </tbody>
                        </table>
                    </div>
                </div>
                <!--//결제/결제취소/환불/환전-->
            </div>


            <!--방송건수 차트-->
            <div class="widget row">
                <div class="widget-content">
                    <!-- end chart tab nav -->
                    <div class="chart-content">
                        <div id='lineArea'></div>
                    </div>
                    <!-- end chart placeholder-->
                    <hr class="separator">
                </div>
            </div>
        </div> <!-- //container-fluid -->
    </div> <!-- //page-wrapper -->
</div> <!-- //wrapper -->

<script src='/js/lib/plotly-latest.min.js'></script>
<script type="text/javascript" src="/js/code/enter/joinCodeList.js?${dummyData}"></script>
<script type="text/javascript" src="/js/handlebars/statusHelper.js?${dummyData}"></script>
<script type="text/javascript" src="/js/util/statUtil.js?${dummyData}"></script>

<script type="text/javascript">
    var eDisplayDate;
    $(function(){
        searchData("all");
    });

    var dataType = 0;

    var chartParam = {
        slctType : 11
        , liveType : 1
        , viewType : 1
    };

    var dateTime = new Date();
    dateTime = moment(dateTime).format("YYYY.MM.DD");
    var week = ['일', '월', '화', '수', '목', '금', '토'];
    var toDay = week[moment(new Date()).day()];
    setTimeDate(dateTime);

    var _datePicker = 0;

    $(function(){
        $('#onedayDate').datepicker("onedayDate", new Date()).on('changeDate', function (dateText, inst) {
            var selectDate = moment(dateText.date).format("YYYY.MM.DD");
            $("#startDate").val(selectDate);
            $("#endDate").val(selectDate);
        });
        // 월 선택 -------------------------------------
        $('#monthDate').datepicker({
            minViewMode: 'months',
            format: 'yyyy.mm',
            keyboardNavigation: false,
            forceParse: false,
            autoclose: true,
            language: 'kr',
        });
        $("#monthDate").on('change', function () {
            var monthLastDate = new Date($("#monthDate").val().substr(0,4),$("#monthDate").val().substr(5,6),-1);
            $("#startDate").val($("#monthDate").val() + '.01');
            $("#endDate").val($("#monthDate").val() + "." +  (monthLastDate.getDate() + 1));
            $("._searchDate").html(moment($("#startDate").val()).format('YYYY년 MM월'));
        });

        // 년 선택 --------------------------------
        $('#yearDate').datepicker({
            minViewMode: 'years',
            format: 'yyyy',
            keyboardNavigation: false,
            forceParse: false,
            autoclose: true,
            language: 'kr',
        });
        $("#yearDate").on('change', function () {
            $("#startDate").val($("#yearDate").val() + '.01.01');
            $("#endDate").val($("#yearDate").val() + ".12.31");
            $("._searchDate").html(moment($("#startDate").val()).format('YYYY년'));
        });

        $("#slctTypeArea").append(util.getCommonCodeRadio(0, join_slctType));

        $("#bt_search").on('click', function(){
            searchData();
        });
    });

    function setTimeDate(dateTime){
        $("#onedayDate").val(dateTime);
        $("#startDate").val(dateTime);
        $("#endDate").val(dateTime);

        $("._searchDate").html(dateTime + " (" + toDay + ")");
    }

    $(document).on('change', 'input[name="slctType"]', function(){
        // console.log($('input[name="slctType"]:checked').val());
        if($('input[name="slctType"]:checked').val() == 0){
            _datePicker = 0;
        }else if($('input[name="slctType"]:checked').val() == 1){
            _datePicker = 1;
        }else{
            _datePicker = 2;
        }
        changeDatepicker();

        searchData("all");
    });

    $(document).on('click', '._prevSearch', function(){
        searchDate('prev');
    });

    $(document).on('click', '._nextSearch', function(){
        searchDate('next');
    });

    $(document).on('click', '._todaySearch', function(){
        toDay = week[moment(new Date()).day()];
        changeDatepicker();

        setTimeDate(dateTime);
    });



    function changeDatepicker(){
        if(_datePicker == 0){
            $("#oneDayDatePicker").show();
            $("#monthDatepicker").hide();
            $("#yearDatepicker").hide();
        }else if(_datePicker == 1) {
            $("#oneDayDatePicker").hide();
            $("#monthDatepicker").show();
            $("#yearDatepicker").hide();
        }else if(_datePicker == 2) {
            $("#oneDayDatePicker").hide();
            $("#monthDatepicker").hide();
            $("#yearDatepicker").show();
        }
        searchDate();
    }

    function searchDate(dateType){
        if(_datePicker == 0){ //시간별 , 일간
            if(common.isEmpty(dateType)){
                $("#startDate").val(moment(new Date()).format('YYYY.MM.DD'));
                $("#endDate").val(moment(new Date()).format('YYYY.MM.DD'));
                $("._searchDate").html(moment(new Date()).format('YYYY.MM.DD') + " (" + toDay + ")");
                $("#onedayDate").val(moment(new Date()).format('YYYY.MM.DD'));
            }else if(dateType == 'prev'){
                setDay(-1);
            }else{
                setDay(1);
            }
        }else if(_datePicker == 1){ // 월간
            if(common.isEmpty(dateType)){
                $("#startDate").val(moment(new Date()).format('YYYY.MM.01'));
                $("#endDate").val(moment(moment(new Date()).format('YYYY.MM.01')).add('months', 1).add('days', -1).format('YYYY.MM.DD'));
                $("._searchDate").html(moment(new Date()).format('YYYY년 MM월'));
                $("#monthDate").val(moment(new Date()).format('YYYY.MM'));
            }else if(dateType == 'prev'){
                setMonth(-1);
            }else if(dateType == 'next'){
                setMonth(1);
            }
        }else if(_datePicker == 2){ // 연간
            if(common.isEmpty(dateType)){
                $("#startDate").val(moment(new Date()).format('YYYY.01.01'));
                $("#endDate").val(moment(new Date()).format('YYYY.12.31'));
                $("._searchDate").html(moment(new Date()).format('YYYY년'));
                $("#yearDate").val(moment(new Date()).format('YYYY'));
            }else if(dateType == 'prev'){
                setYear(-1);

            }else if(dateType == 'next'){
                setYear(1);
            }
        }
        searchData("all");
    }

    function setDay(days){
        toDay = week[moment($("#startDate").val()).add('days', days).day()];
        $("#startDate").val(moment($("#startDate").val()).add('days', days).format('YYYY.MM.DD'));
        $("#endDate").val($("#startDate").val());
        $("._searchDate").html($("#startDate").val() + " (" + toDay + ")");
        $("#onedayDate").val($("#startDate").val());
    }

    function setMonth(months){
        $("#startDate").val(moment($("#startDate").val()).add('months', months).format('YYYY.MM.01'));
        $("#endDate").val(moment($("#startDate").val()).add('months', 1).add('days', -1).format('YYYY.MM.DD'));
        $("._searchDate").html(moment($("#startDate").val()).format('YYYY년 MM월'));
        $("#monthDate").val(moment($("#startDate").val()).format('YYYY.MM'));
    }

    function setYear(years){
        $("#startDate").val(moment($("#startDate").val()).add('years', years).format('YYYY.01.01'));
        $("#endDate").val(moment($("#startDate").val()).add('years', 1).add('days', -1).format('YYYY.12.31'));
        $("._searchDate").html(moment($("#startDate").val()).format('YYYY년'));
        $("#yearDate").val(moment($("#startDate").val()).format('YYYY'));
    }



    function searchData(tmp){
        // chartParam.slctDate = $("#startDate").val() + ' 23:59:59';

        var data = {};
        data.slctType = $('input[name="slctType"]:checked').val();
        data.startDate = $("#startDate").val();
        data.endDate = $("#endDate").val();

        if(tmp == "all"){
            util.getAjaxData("statJoin", "/rest/mainStatus/new/main/stat/join", data, fn_join_withdrawal_success);
            util.getAjaxData("statLogin", "/rest/mainStatus/new/main/stat/login", data, fn_login_success);
            util.getAjaxData("memberList", "/rest/status/broadcast/info/total", data, fn_broadcastListener_success);
            util.getAjaxData("statPayInfo", "/rest/mainStatus/new/main/stat/pay", data, fn_paymentCancel_success);
        }else{
            if(dataType == 0){
                // 가입/탈퇴
                util.getAjaxData("statJoin", "/rest/mainStatus/new/main/stat/join", data, fn_join_withdrawal_success);
                // 회원가입 플랫폼
                util.getAjaxData("platformGenderList", "/rest/enter/join/platform/gender", data, fn_platformGender_success);
                // 회원가입 성별
                // 회원가입 연령
            }else if(dataType == 1){
                // 접속 자
                util.getAjaxData("total", "/rest/mainStatus/new/main/stat/login", data, fn_login_success);
                // 접속 플랫폼
                // 접속자 성별
                // 접속자 연령
            }else if(dataType == 2){
                // 방송개설/청취자
                util.getAjaxData("memberList", "/rest/status/broadcast/info/total", data, fn_broadcastListener_success);
                // 방송 개설 성별
                // 방송 개설 연령
            }else if(dataType == 3){
                // 결제/결제취소/환불/환전
                util.getAjaxData("statPayInfo", "/rest/mainStatus/new/main/stat/pay", data, fn_paymentCancel_success);
                // 결제수단
                // 결제성별
                // 결제 연령
                // 결제 취소 수단
            }
        }
    }

    function labelClick(tmp){
        dataType = tmp;
        searchData();
    }

    function fn_join_withdrawal_success(dst_id, response, param){
        $("#joinWithdrawal_tableBody").empty();

        var template = $('#tmp_joinWithdrawal_tableBody').html();
        var templateScript = Handlebars.compile(template);
        var context = response.data;
        var html=templateScript(context);
        $("#joinWithdrawal_tableBody").append(html);
        if(dataType == 0) {
            listSort(dst_id, response, param);
        }
    }

    function fn_login_success(dst_id, response, param){
        $("#login_tableBody").empty();

        var template = $('#tmp_login_tableBody').html();
        var templateScript = Handlebars.compile(template);
        var context = response.data;
        var html=templateScript(context);
        $("#login_tableBody").append(html);
        if(dataType == 1) {
            listSort(dst_id, response, param);
        }
    }


    function fn_broadcastListener_success(dst_id, response, param){
        $("#broadcastListener_tableBody").empty();

        var template = $('#tmp_broadcastListener_tableBody').html();
        var templateScript = Handlebars.compile(template);
        var context = response.data.totalInfo;
        var html=templateScript(context);
        $("#broadcastListener_tableBody").append(html);

        if(dataType == 2) {
            listSort(dst_id, response, param);
        }
    }

    function fn_paymentCancel_success(dst_id, response, param){
        $("#paymentCancel_tableBody").empty();

        var template = $('#tmp_paymentCancel_tableBody').html();
        var templateScript = Handlebars.compile(template);
        var context = response.data;
        var html=templateScript(context);
        $("#paymentCancel_tableBody").append(html);

        if(dataType == 3) {
            listSort(dst_id, response, param);
        }

    }

    function listSort(dst_id, response, param){
        var sortingField = "hour";
        response.data.detailList.sort(function(a, b) { // 오름차순
            return a[sortingField] - b[sortingField];
        });
        if(dataType == 0) {
            response.data.withdrawDetailList.sort(function(a, b) { // 오름차순
                return a[sortingField] - b[sortingField];
            });
        }
        if(dataType == 1) {
            response.data.overDetailList.sort(function(a, b) { // 오름차순
                return a[sortingField] - b[sortingField];
            });
        }
        if(dataType == 2) {
        }
        if(dataType == 3) {
            response.data.detailList2.sort(function(a, b) { // 오름차순
                return a[sortingField] - b[sortingField];
            });
        }
        setChart_join(dst_id, response.data, param);
    }

    function setChart_join(dst_id, response, param){
        var detailData = response;
        var chartData;
        var lineName;
        var barName;
        var lineTitle;
        var barTitle;
        chartData = getChartData(detailData, param);
        if(dataType == 0) {
            lineName = "가입";
            barName = "탈퇴";
            lineTitle = "<b>가입:%{y}";
            barTitle = "<b>탈퇴:%{y}";
        }else if(dataType == 1) {
            lineName = "UV";
            barName = "PV";
            lineTitle = "<b>UV:%{y}";
            barTitle = "<b>PV:%{y}";
        }else if(dataType == 2) {
            lineName = "청취자";
            barName = "방송방";
            lineTitle = "<b>청취자:%{y}";
            barTitle = "<b>방송방:%{y}";
        }else if(dataType == 3) {
            lineName = "결제";
            barName = "환전";
            lineTitle = "<b>결제:%{yCnt} / %{y}";
            barTitle = "<b>환전:%{yCnt} / %{y}";
        }
        /* 라인차트 [start] */
        var trace = {
            x: chartData.x,
            y: chartData.y,
            yCnt : chartData.yCnt,
            mode: 'lines',
            name: lineName,
            line: {
                dash: 'line',
                width: 4
            },
            marker: {
            },
            hovertemplate: lineTitle,

        };
        //바
        var bar = {
            type: 'bar',
            x: chartData.x,
            y: chartData.bar_y,
            yCnt : chartData.bar_yCnt,
            name: barName,
            marker: {
                color: '#e48701',
                line: {
                    width: 0
                },
            },
            hovertemplate: barTitle,
        };
        var data = [trace, bar];
        var layout = {
            xaxis: {
                range: [0, chartData.dataLength],
                autorange: false
            },
            yaxis: {
                range: [0, chartData.max_y],
                autorange: false
            },
            legend: {
                y: 1,
                y: 1,
                traceorder: 'reversed',
                font: {
                    size: 13
                }
            }
        };
        var config = {
            responsive: true
        };
        Plotly.newPlot('lineArea', data, layout, config);
    }

    function getChartData(detailData, param) {
        //x축
        var arrayList_x = [];
        var dataLength = detailData.detailList.length;
        for (var i = 0; i < dataLength; i++) {
            var array = {};
            array = detailData.detailList[i].hour +'시';
            arrayList_x.push(array);
        }

        //y축
        var arrayList_y = [];
        var arrayList_yCnt = [];
        var max_y = 10;  //최대값
        for(var i=0 ; i<dataLength; i++) {
            var array = {};
            if(dataType == 0) {
                array = detailData.detailList[i].totalCnt;
            }else if(dataType == 1) {
                array = detailData.overDetailList[i].totalCnt;
            }else if(dataType == 2) {
                array = detailData.detailList[i].listenerCnt;
            }else if(dataType == 3) {
                array = detailData.detailList[i].succAmt;
            }
            arrayList_y.push(array);

            if(dataType == 3) {
                var arrayCnt = {};
                arrayCnt = detailData.detailList[i].succCnt;
                arrayList_yCnt.push(arrayCnt);

            }
            if(max_y < array){
                max_y = array + 10;
            }
        }
        // 막대 ----------------
        var arrayBarList_y = [];
        var arrayBarList_yCnt = [];
        var barMax_y = 10;  //최대값
        for (var i = 0; i < dataLength; i++) {
            var array = {};
            if(dataType == 0) {
                array = detailData.withdrawDetailList[i].totalCnt;
            }else if(dataType == 1) {
                array = detailData.detailList[i].totalCnt;
            }else if(dataType == 2) {
                array = detailData.detailList[i].createCnt;
            }else if(dataType == 3) {
                array = detailData.detailList2[i].succAmt;
            }
            if(dataType == 3) {
                var arrayCnt = {};
                arrayCnt = detailData.detailList2[i].succCnt;
                arrayBarList_yCnt.push(arrayCnt);
            }

            arrayBarList_y.push(array);
            if (barMax_y < array) {
                barMax_y = array + 10;
            }
        }
        if(barMax_y > max_y){
            max_y = barMax_y;
        }

        var resultData = {
            x : arrayList_x
            , y : arrayList_y
            , yCnt : arrayList_yCnt
            , bar_y : arrayBarList_y
            , bar_yCnt : arrayBarList_yCnt
            , max_y : max_y
            , dataLength : dataLength
        };

        console.log(resultData);
        return resultData;
    }

    function fn_platformGender_success(dst_id, response, param){
        /* 파이차트 [start] */
        var json = {
            values: [57.7, 42.3],
            labels: ['안드로이드', '아이폰'],
            type: 'pie'
        }

        var data = [json];

        var layout = {
            title: '앱다운로드 현황',
            height: 400,
            width: 500
        };

        Plotly.newPlot('pieArea', data, layout);

    }



</script>
<script type="text/x-handlebars-template" id="tmp_joinWithdrawal_tableBody">
    <tr>
        <th>가입</th>
        <td>{{addComma totalInfo.sum_totalCnt}}</td>
        <td class="{{upAndDownClass totalInfo.sum_totalCnt}}"><i class="fa {{upAndDownIcon totalInfo.sum_totalCnt}}"></i> {{addComma totalInfo.sum_totalCnt}}</td>
    </tr>
    <tr>
        <th>탈퇴</th>
        <td>{{addComma withdrawTotalInfo.sum_totalCnt}}</td>
        <td class="{{upAndDownClass withdrawTotalInfo.sum_totalCnt}}"><i class="fa {{upAndDownIcon withdrawTotalInfo.sum_totalCnt}}"></i> {{addComma withdrawTotalInfo.sum_totalCnt}}</td>
    </tr>
</script>

<script type="text/x-handlebars-template" id="tmp_login_tableBody">
    <tr>
        <th>PV</th>
        <td>{{addComma overTotalInfo.sum_totalCnt}}</td>
        <td class="{{upAndDownClass overTotalInfo.sum_totalCnt}}"><i class="fa {{upAndDownIcon overTotalInfo.sum_totalCnt}}"></i> {{addComma overTotalInfo.sum_totalCnt}}</td>
    </tr>
    <tr>
        <th>UV</th>
        <td>{{addComma totalInfo.sum_totalCnt}}</td>
        <td class="{{upAndDownClass totalInfo.sum_totalCnt}}"><i class="fa {{upAndDownIcon totalInfo.sum_totalCnt}}"></i> {{addComma totalInfo.sum_totalCnt}}</td>
    </tr>
</script>

<script type="text/x-handlebars-template" id="tmp_broadcastListener_tableBody">
    <tr>
        <th>방송방</th>
        <td>{{addComma sum_createCnt}}</td>
        <td class="{{upAndDownClass sum_createCnt}}"><i class="fa {{upAndDownIcon sum_createCnt}}"></i> {{addComma sum_createCnt}}</td>
    </tr>
    <tr>
        <th>청취자</th>
        <td>{{addComma sum_listenerCnt}}</td>
        <td class="{{upAndDownClass sum_listenerCnt}}"><i class="fa {{upAndDownIcon sum_listenerCnt}}"></i> {{addComma sum_listenerCnt}}</td>
    </tr>
</script>

<script type="text/x-handlebars-template" id="tmp_paymentCancel_tableBody">
    <tr>
        <th>결제</th>
        <td>{{addComma totalInfo.sum_succCnt}}</td>
        <td>{{addComma totalInfo.sum_succAmt}}</td>
        <td class="{{upAndDownClass totalInfo.sum_succCnt}}"><i class="fa {{upAndDownIcon totalInfo.sum_succCnt}}"></i> {{addComma totalInfo.sum_succCnt}} </td>
        <td class="{{upAndDownClass totalInfo.sum_succAmt}}"><i class="fa {{upAndDownIcon totalInfo.sum_succAmt}}"></i> {{addComma totalInfo.sum_succAmt}} </td>
    </tr>
    <tr>
        <th>결제취소</th>
        <td>0</td>
        <td>0</td>
        <td class="{{upAndDownClass cancelCnt}}"><i class="fa {{upAndDownIcon cancelCnt}}"></i> 0 </td>
        <td class="{{upAndDownClass cancelAmt}}"><i class="fa {{upAndDownIcon cancelAmt}}"></i> 0 </td>
    </tr>
    <tr>
        <th>환불</th>
        <td>0</td>
        <td>0</td>
        <td class="{{upAndDownClass cancelCnt}}"><i class="fa {{upAndDownIcon cancelCnt}}"></i> 0 </td>
        <td class="{{upAndDownClass cancelAmt}}"><i class="fa {{upAndDownIcon cancelAmt}}"></i> 0 </td>
    </tr>
    <tr>
        <th>환전</th>
        <td>{{addComma totalInfo2.sum_succCnt}}</td>
        <td>{{addComma totalInfo2.sum_succAmt}}</td>
        <td class="{{upAndDownClass totalInfo2.sum_succCnt}}"><i class="fa {{upAndDownIcon totalInfo2.sum_succCnt}}"></i> {{addComma totalInfo2.sum_succCnt}} </td>
        <td class="{{upAndDownClass totalInfo2.sum_succAmt}}"><i class="fa {{upAndDownIcon totalInfo2.sum_succAmt}}"></i> {{addComma totalInfo2.sum_succAmt}} </td>
    </tr>
</script>