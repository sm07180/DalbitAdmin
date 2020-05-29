<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="wrapper">
    <div id="page-wrapper" class="col-lg-8 no-padding">
        <div class="container-fluid">
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

                                <div class="input-group date" id="rangeDatepicker" style="display:none;">
                                    <label for="displayDate" class="input-group-addon">
                                        <span><i class="fa fa-calendar"></i></span>
                                    </label>
                                    <input type="text" name="displayDate" id="displayDate" class="form-control" />
                                </div>

                                <input type="hidden" name="startDate" id="startDate">
                                <input type="hidden" name="endDate" id="endDate" />

                                <button type="button" class="btn btn-success" id="bt_search">검색</button>
                                <a href="javascript://" class="_prevSearch">[이전]</a>
                                <a href="javascript://" class="_todaySearch">[오늘]</a>
                                <a href="javascript://" class="_nextSearch">[다음]</a>
                            </div>
                        </div>
                    </div>
                </div>
            </form>

            <div class="row form-inline">
                <div class="widget widget-table mb10">
                    <div class="widget-header">
                        <h3><i class="fa fa-table"></i> 결제통계 현황</h3>
                    </div>
                    <div class="widget-content mt10">
                        <table class="table table-condensed table-dark-header table-bordered">
                            <thead>
                            </thead>
                            <tbody id="statPayTableBody1">
                            </tbody>
                        </table>
                        <table class="table table-condensed table-dark-header table-bordered">
                            <thead>
                            </thead>
                            <tbody id="statPayTableBody2">
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- tab -->
    <div class="no-padding" id="infoTab">
        <jsp:include page="infoTab.jsp"/>
    </div>
    <!-- //tab -->
</div>

<script type="text/javascript" src="/js/code/enter/joinCodeList.js?${dummyData}"></script>
<script type="text/javascript" src="/js/util/statUtil.js?${dummyData}"></script>
<script type="text/javascript">

    var dateTime = new Date();
    dateTime = moment(dateTime).format("YYYY.MM.DD");
    setTimeDate(dateTime);

    $(function(){
        $("#slctTypeArea").append(util.getCommonCodeRadio(0, join_slctType));

        $('#onedayDate').datepicker("onedayDate", new Date()).on('changeDate', function(dateText, inst){
            var selectDate = moment(dateText.date).format("YYYY.MM.DD");
            $("#displayDate").val(selectDate+ ' - ' + selectDate);
            $("#startDate").val(selectDate);
            $("#endDate").val(selectDate);
        });

        $("#displayDate").statsDaterangepicker(
            function(start, end, t1) {
                $("#startDate").val(start.format('YYYY.MM.DD'));
                $("#endDate").val(end.format('YYYY.MM.DD'));

                $("#onedayDate").val($("#startDate").val());
            }
        );
        //결제/환불 통계 현황
        getStatPayInfo();
    });

    function setTimeDate(dateTime){
        $("#onedayDate").val(dateTime);
        $("#startDate").val(dateTime);
        $("#endDate").val(dateTime);
        $("._searchDate").html(dateTime);
    }

    $(document).on('change', 'input[name="slctType"]', function(){
        var me = $(this);
        if(me.val() == 0){
            $("#oneDayDatePicker").show();
            $("#rangeDatepicker").hide();
        }else {
            $("#oneDayDatePicker").hide();
            $("#rangeDatepicker").show();
        }
        searchDate();
    });

    function getStatPayInfo(){
        util.getAjaxData("statPayInfo", "/rest/enter/pay/info", null, fn_statPayInfo_success1);
    }
    function fn_statPayInfo_success1(data, response){
        var template = $('#tmp_payTableSummary1').html();
        var templateScript = Handlebars.compile(template);
        var context = response.data.info;
        var html=templateScript(context);
        console.log(context);
        $("#statPayTableBody1").append(html);

        fn_statPayInfo_success2(data, response);
    }
    function fn_statPayInfo_success2(data, response){
        var template = $('#tmp_payTableSummary2').html();
        var templateScript = Handlebars.compile(template);
        var context = response.data.info;
        var html=templateScript(context);
        console.log(context);
        $("#statPayTableBody2").append(html);
    }

    $(document).on('click', '._prevSearch', function(){
        searchDate('prev');
    });

    $(document).on('click', '._nextSearch', function(){
        searchDate('next');
    });

    $(document).on('click', '._todaySearch', function(){
        setTimeDate(dateTime);
        $("#bt_search").click();
    });

    function searchDate(dateType){
        var slctType = $('input[name="slctType"]:checked').val();
        //시간별
        if(slctType == 0){
            if(common.isEmpty(dateType)){
                $("#startDate").val(moment(new Date()).format('YYYY.MM.DD'));
                $("#endDate").val(moment(new Date()).format('YYYY.MM.DD'));
                $("._searchDate").html(moment(new Date()).format('YYYY.MM.DD'));
            }else if(dateType == 'prev'){
                setDay(-1);
            }else{
                setDay(1);
            }
            //일별
        }else if(slctType == 1){
            if(common.isEmpty(dateType)){
                $("#startDate").val(moment(new Date()).format('YYYY.MM.01'));
                $("#endDate").val(moment(moment(new Date()).format('YYYY.MM.01')).add('months', 1).add('days', -1).format('YYYY.MM.DD'));
                $("._searchDate").html(moment(new Date()).format('YYYY년 MM월'));
                $("#displayDate").val($("#startDate").val() + ' - ' + $("#endDate").val());
            }else if(dateType == 'prev'){
                setMonth(-1);
            }else if(dateType == 'next'){
                setMonth(1);
            }
            //월별
        }else{
            if(common.isEmpty(dateType)){
                $("#startDate").val(moment(new Date()).format('YYYY.01.01'));
                $("#endDate").val(moment(new Date()).format('YYYY.12.31'));

                $("._searchDate").html(moment(new Date()).format('YYYY년'));
                $("#displayDate").val($("#startDate").val() + ' - ' + $("#endDate").val());

            }else if(dateType == 'prev'){
                setYear(-1);

            }else if(dateType == 'next'){
                setYear(1);
            }
        }
        $("#bt_search").click();
    }

    function setDay(days){
        $("#startDate").val(moment($("#startDate").val()).add('days', days).format('YYYY.MM.DD'));
        $("#endDate").val($("#startDate").val());

        $("._searchDate").html($("#startDate").val());
        $("#onedayDate").val($("#startDate").val());
    }

    function setMonth(months){
        $("#startDate").val(moment($("#startDate").val()).add('months', months).format('YYYY.MM.01'));
        $("#endDate").val(moment($("#startDate").val()).add('months', 1).add('days', -1).format('YYYY.MM.DD'));

        $("._searchDate").html(moment($("#startDate").val()).format('YYYY년 MM월'));
        $("#displayDate").val($("#startDate").val() + " - " + $("#endDate").val());
    }

    function setYear(years){
        $("#startDate").val(moment($("#startDate").val()).add('years', years).format('YYYY.01.01'));
        $("#endDate").val(moment($("#startDate").val()).add('years', 1).add('days', -1).format('YYYY.12.31'));

        $("._searchDate").html(moment($("#startDate").val()).format('YYYY년'));
        $("#displayDate").val($("#startDate").val() + " - " + $("#endDate").val());
    }
</script>

<script id="tmp_payTableSummary1" type="text/x-handlebars-template">
    <table class="table table-bordered mb0">
        <colgroup>
            <col width="10%"/><col width="10%"/><col width="10%"/><col width="10%"/><col width="10%"/>
            <col width="10%"/><col width="10%"/><col width="10%"/><col width="10%"/><col width="10%"/>
        </colgroup>
        <thead>
            <tr>
                <th colspan="2">결제수단</th>
                <th style="color: red">합계</th>
                <th>휴대폰</th>
                <th>카드</th>
                <th>실시간계좌이체</th>
                <th>무통장</th>
                <th>인앱결제(아이폰)</th>
                <th>네이버페이</th>
                <th>페이코</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td colspan="2">결제금액(건수)</td>
                <td style="color: red">{{addComma total_amt}}({{addComma total_cnt}})</td>
                <td>{{addComma mc_amt}}({{addComma mc_cnt}})</td>
                <td>{{addComma cn_amt}}({{addComma cn_cnt}})</td>
                <td>{{addComma inapp_amt}}({{addComma inapp_cnt}})</td>
                <td>{{addComma ra_amt}}({{addComma ra_cnt}})</td>
                <td>{{addComma va_amt}}({{addComma va_cnt}})</td>
                <td>0(0)</td>
                <td>0(0)</td>
            </tr>
        </tbody>
        <thead>
        <tr>
            <th colspan="2">결제회원</th>
            <th>남성</th>
            <th>여성</th>
            <th>10대</th>
            <th>20대</th>
            <th>30대</th>
            <th>40대</th>
            <th>50대</th>
            <th>60대 이상</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td colspan="2">결제금액(건수)</td>
            <td>{{addComma male_amt}}({{addComma male_cnt}})</td>
            <td>{{addComma female_amt}}({{addComma female_cnt}})</td>
            <td>{{addComma age10_amt}}({{addComma age10_cnt}})</td>
            <td>{{addComma age20_amt}}({{addComma age20_cnt}})</td>
            <td>{{addComma age30_amt}}({{addComma age30_cnt}})</td>
            <td>{{addComma age40_amt}}({{addComma age40_cnt}})</td>
            <td>{{addComma age50_amt}}({{addComma age50_cnt}})</td>
            <td>{{addComma age60_amt}}({{addComma age60_cnt}})</td>
        </tr>
        </tbody>
    </table>
</script>

<script id="tmp_payTableSummary2" type="text/x-handlebars-template">
    <table class="table table-bordered mb0">
        <colgroup>
            <col width="16%"/><col width="12%"/><col width="12%"/><col width="12%"/>
            <col width="12%"/><col width="12%"/><col width="12%"/><col width="12%"/>
        </colgroup>
        <thead>
            <tr>
                <th>결제상품(Web, 안드로이드)</th>
                <th>달 50</th>
                <th>달 100</th>
                <th>달 500</th>
                <th>달 1,000</th>
                <th>달 2,000</th>
                <th>달 3,000</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>결제금액(건수)</td>
                <td>{{addComma code01_amt}}({{addComma code01_cnt}})</td>
                <td>{{addComma code02_amt}}({{addComma code02_cnt}})</td>
                <td>{{addComma code03_amt}}({{addComma code03_cnt}})</td>
                <td>{{addComma code04_amt}}({{addComma code04_cnt}})</td>
                <td>{{addComma code05_amt}}({{addComma code05_cnt}})</td>
                <td>{{addComma code06_amt}}({{addComma code06_cnt}})</td>
            </tr>
        </tbody>
        <thead>
            <tr>
                <th>결제상품(아이폰)</th>
                <th>달 49</th>
                <th>달 100</th>
                <th>달 300</th>
                <th>달 420</th>
                <th>달 920</th>
                <th>달 2,350</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>결제금액(건수)</td>
                <td>{{addComma code07_amt}}({{addComma code07_cnt}})</td>
                <td>{{addComma code08_amt}}({{addComma code08_cnt}})</td>
                <td>{{addComma code09_amt}}({{addComma code09_cnt}})</td>
                <td>{{addComma code10_amt}}({{addComma code10_cnt}})</td>
                <td>{{addComma code11_amt}}({{addComma code11_cnt}})</td>
                <td>{{addComma code12_amt}}({{addComma code12_cnt}})</td>
            </tr>
        </tbody>
    </table>
</script>
