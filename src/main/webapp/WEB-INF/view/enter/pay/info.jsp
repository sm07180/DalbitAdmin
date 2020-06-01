<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="wrapper">
    <div id="page-wrapper" class="col-lg-12 no-padding">
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
                    <div class="widget-content mt10 col-md-8 no-padding">
                        <table class="table table-condensed table-dark-header table-bordered no-margin">
                            <thead>
                            </thead>
                            <tbody id="statPayTableBody1">
                            </tbody>
                        </table>
                    </div>
                    <div class="col-lg-1"></div>
                    <div class="widget-content mt10 col-md-2 no-padding">
                        <table class="table table-condensed table-dark-header table-bordered no-margin">
                            <thead>
                            </thead>
                            <tbody id="PayTotalTableBody">
                            </tbody>
                        </table>
                    </div>

                    <div class="widget-content mt10 col-md-12 no-padding">
                        <table class="table table-condensed table-dark-header table-bordered no-margin">
                            <thead>
                            </thead>
                            <tbody id="statPayTableBody2">
                            </tbody>
                        </table>
                    </div>
                    <div class="widget-content mt10 col-md-12 no-padding">
                        <table class="table table-condensed table-dark-header table-bordered no-margin">
                            <thead>
                            </thead>
                            <tbody id="statPayTableBody3">
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
<script type="text/javascript" src="/js/handlebars/statusHelper.js?${dummyData}"></script>
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
        // WEB/안드로이드 총 계/합
        var android_total_cnt = [
            response.data.info.code01_cnt,
            response.data.info.code02_cnt,
            response.data.info.code03_cnt,
            response.data.info.code04_cnt,
            response.data.info.code05_cnt,
            response.data.info.code06_cnt,
        ];
        var android_total_amt = [
            response.data.info.code01_amt,
            response.data.info.code02_amt,
            response.data.info.code03_amt,
            response.data.info.code04_amt,
            response.data.info.code05_amt,
            response.data.info.code06_amt,
        ];
        response.data.info["android_total_cnt"] = common.getListSum(android_total_cnt);
        response.data.info["android_total_amt"] = common.getListSum(android_total_amt);

        // IOS 총 계/합
        var ios_total_cnt = [
            response.data.info.code07_cnt,
            response.data.info.code08_cnt,
            response.data.info.code09_cnt,
            response.data.info.code10_cnt,
            response.data.info.code11_cnt,
            response.data.info.code12_cnt,
        ];
        var ios_total_amt = [
            response.data.info.code07_amt,
            response.data.info.code08_amt,
            response.data.info.code09_amt,
            response.data.info.code10_amt,
            response.data.info.code11_amt,
            response.data.info.code12_amt,
        ];
        response.data.info["ios_total_cnt"] = common.getListSum(ios_total_cnt);
        response.data.info["ios_total_amt"] = common.getListSum(ios_total_amt);

        var template = $('#tmp_payTableSummary1').html();
        var templateScript = Handlebars.compile(template);
        var context = response.data.info;
        var html=templateScript(context);
        $("#statPayTableBody1").append(html);

        var template = $('#tmp_payTableSummary2').html();
        var templateScript = Handlebars.compile(template);
        var context = response.data.info;
        var html=templateScript(context);
        $("#statPayTableBody2").append(html);

        var template = $('#tmp_payTableSummary3').html();
        var templateScript = Handlebars.compile(template);
        var context = response.data.info;
        var html=templateScript(context);
        $("#statPayTableBody3").append(html);

        var template = $('#tmp_payTotalTable').html();
        var templateScript = Handlebars.compile(template);
        var context = response.data.info;
        var html=templateScript(context);
        $("#PayTotalTableBody").append(html);
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
            <col width="10%"/><col width="10%"/><col width="10%"/><col width="10%"/>
        </colgroup>
        <thead>
        <tr>
            <th><label class="font-bold" style="color: blue;">※결제 방법 별</label></th>
            <th>휴대폰</th>
            <th>카드</th>
            <th>가상계좌이체</th>
            <th>인앱결제(아이폰)</th>
            <th style="color: red">총합</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <th>결제 건 수</th>
            <td>{{addComma mc_cnt}}</td>
            <td>{{addComma cn_cnt}}</td>
            <td>{{addComma va_cnt}}</td>
            <td>{{addComma inapp_cnt}}</td>
            <td style="color: red">{{addComma total_cnt}}</td>
        </tr>
        <tr>
            <th>부과세 포함 금액</th>
            <td>{{addComma mc_amt}}</td>
            <td>{{addComma cn_amt}}</td>
            <td>{{addComma va_amt}}</td>
            <td>{{addComma inapp_amt}}</td>
            <td style="color: red">{{addComma total_amt}}</td>
        </tr>
        <tr>
            <th><label class="font-bold" style="color: red;">부과세 제외 금액</label></th>
            <td style="color: red;">{{vatMinus mc_amt}}</td>
            <td style="color: red;">{{vatMinus cn_amt}}</td>
            <td style="color: red;">{{vatMinus va_amt}}</td>
            <td style="color: red;">{{vatMinus inapp_amt}}</td>
            <td style="color: red;">{{vatMinus total_amt}}</td>
        </tr>
        <tr>
            <th><label class="font-bold">결제 비율</label></th>
            <td>({{payRate mc_cnt total_cnt}}%)<br><label style="color: red;">{{payRate mc_amt total_amt}}%</label></td>
            <td>({{payRate cn_cnt total_cnt}}%)<br/><label style="color: red;">{{payRate cn_amt total_amt}}%</label></td>
            <td>({{payRate va_cnt total_cnt}}%)<br/><label style="color: red;">{{payRate va_amt total_amt}}%</label></td>
            <td>({{payRate inapp_cnt total_cnt}}%)<br/><label style="color: red;">{{payRate inapp_amt total_amt}}%</label></td>
            <td>({{payRate total_cnt total_cnt}}%)<br/><label style="color: red;">{{payRate total_amt total_amt}}%</label></td>
        </tr>
        </tbody>
    </table>
</script>

<script id="tmp_payTableSummary2" type="text/x-handlebars-template">
    <table class="table table-bordered mb0">
        <colgroup>
            <col width="9%"/><col width="7%"/><col width="7%"/><col width="7%"/><col width="7%"/>
            <col width="1%"/><col width="9%"/><col width="7%"/><col width="7%"/><col width="7%"/>
            <col width="7%"/><col width="7%"/><col width="8%"/><col width="8%"/>
        </colgroup>
        <thead>
        <tr>
            <th><label class="font-bold" style="color: blue;">※결제 성별</label></th>
            <th><label class="font-bold" style="color: blue">남성</label></th>
            <th><label class="font-bold" style="color: red">여성</label></th>
            <th>알수없음</th>
            <th>총 합</th>
            <th style="background-color: white; border-bottom: hidden; border-top: hidden;"></th>
            <th><label class="font-bold" style="color: blue;">※결제 연령대 별</label></th>
            <th>10대</th>
            <th>20대</th>
            <th>30대</th>
            <th>40대</th>
            <th>50대</th>
            <th>60대 이상</th>
            <th>총 합</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <th>결제 건 수</th>
            <td><label class="font-bold" style="color: blue">{{addComma male_cnt}}</label></td>
            <td><label class="font-bold" style="color: red">{{addComma female_cnt}}</label></td>
            <td>{{addComma none_cnt}}</td>
            <td>{{addComma total_cnt}}</td>
            <td style="border-bottom: hidden;"></td>
            <th>결제 건 수</th>
            <td>{{addComma age10_cnt}}</td>
            <td>{{addComma age20_cnt}}</td>
            <td>{{addComma age30_cnt}}</td>
            <td>{{addComma age40_cnt}}</td>
            <td>{{addComma age50_cnt}}</td>
            <td>{{addComma age60_cnt}}</td>
            <td>{{addComma total_cnt}}</td>
        </tr>
        <tr>
            <th>부과세 포함 금액</th>
            <td><label class="font-bold" style="color: blue">{{addComma male_amt}}</label></td>
            <td><label class="font-bold" style="color: red">{{addComma female_amt}}</label></td>
            <td>{{addComma none_amt}}</td>
            <td>{{addComma total_amt}}</td>
            <td style="border-bottom: hidden;"></td>
            <th>부과세 포함 금액</th>
            <td>{{addComma age10_amt}}</td>
            <td>{{addComma age20_amt}}</td>
            <td>{{addComma age30_amt}}</td>
            <td>{{addComma age40_amt}}</td>
            <td>{{addComma age50_amt}}</td>
            <td>{{addComma age60_amt}}</td>
            <td>{{addComma total_amt}}</td>
        </tr>
        <tr>
            <th><label class="font-bold" style="color: red;">부과세 제외 금액</label></th>
            <td style="color: red;">{{vatMinus male_amt}}</td>
            <td style="color: red;">{{vatMinus female_amt}}</td>
            <td style="color: red;">{{vatMinus none_amt}}</td>
            <td style="color: red;">{{vatMinus total_amt}}</td>
            <td style="border-bottom: hidden;"></td>
            <th><label class="font-bold" style="color: red;">부과세 제외 금액</label></th>
            <td style="color: red;">{{vatMinus age10_amt}}</td>
            <td style="color: red;">{{vatMinus age20_amt}}</td>
            <td style="color: red;">{{vatMinus age30_amt}}</td>
            <td style="color: red;">{{vatMinus age40_amt}}</td>
            <td style="color: red;">{{vatMinus age50_amt}}</td>
            <td style="color: red;">{{vatMinus age60_amt}}</td>
            <td style="color: red;">{{vatMinus total_amt}}</td>
        </tr>
        <tr>
            <th>결제 비율</th>
            <td><label class="font-bold" style="color: blue">({{payRate male_cnt total_cnt}}%)</label><br><label style="color: red;">{{payRate male_amt total_amt}}%</label></td>
            <td><label class="font-bold" style="color: red">({{payRate female_cnt total_cnt}}%)</label><br><label style="color: red;">{{payRate female_amt total_amt}}%</label></td>
            <td>({{payRate none_cnt none_cnt}}%)<br><label style="color: red;">{{payRate none_amt total_amt}}%</label></td>
            <td>({{payRate total_cnt total_cnt}}%)<br><label style="color: red;">{{payRate total_amt total_amt}}%</label></td>
            <td style="border-bottom: hidden;"></td>
            <th>결제 비율</th>
            <td>({{payRate age10_cnt total_cnt}}%)<br><label style="color: red;">{{payRate age10_amt total_amt}}%</label></td>
            <td>({{payRate age20_cnt total_cnt}}%)<br><label style="color: red;">{{payRate age20_amt total_amt}}%</label></td>
            <td>({{payRate age30_cnt total_cnt}}%)<br><label style="color: red;">{{payRate age30_amt total_amt}}%</label></td>
            <td>({{payRate age40_cnt total_cnt}}%)<br><label style="color: red;">{{payRate age40_amt total_amt}}%</label></td>
            <td>({{payRate age50_cnt total_cnt}}%)<br><label style="color: red;">{{payRate age50_amt total_amt}}%</label></td>
            <td>({{payRate age60_cnt total_cnt}}%)<br><label style="color: red;">{{payRate age60_amt total_amt}}%</label></td>
            <td>({{payRate total_cnt total_cnt}}%)<br><label style="color: red;">{{payRate total_amt total_amt}}%</label></td>
        </tr>
        </tbody>
    </table>
</script>


<script id="tmp_payTableSummary3" type="text/x-handlebars-template">
    <table class="table table-bordered mb0">
        <colgroup>
            <col width="5.8%"/><col width="5.8%"/><col width="5.8%"/><col width="5.8%"/><col width="5.8%"/>
            <col width="5.8%"/><col width="5.8%"/><col width="5.8%"/><col width="1%"/><col width="5.8%"/>
            <col width="5.8%"/><col width="5.8%"/><col width="5.8%"/><col width="5.8%"/><col width="5.8%"/>
            <col width="5.8%"/><col width="5.8%"/>
        </colgroup>
        <tbody>
        <tr>
            <th><label class="font-bold" style="color: blue;">※아이템별</label><br>Web, 안드로이드</th>
            <th>달 50</th>
            <th>달 100</th>
            <th>달 500</th>
            <th>달 1,000</th>
            <th>달 2,000</th>
            <th>달 3,000</th>
            <th>총합</th>
            <td style="border-bottom: hidden;border-top: hidden;"></td>
            <th><label class="font-bold" style="color: blue;">※아이템별</label><br>아이폰</th>
            <th>달 49</th>
            <th>달 100</th>
            <th>달 300</th>
            <th>달 420</th>
            <th>달 920</th>
            <th>달 2,350</th>
            <th>총합</th>
        </tr>
        <tr>
            <th>결제 건 수</th>
            <td>{{addComma code01_cnt}}</td>
            <td>{{addComma code02_cnt}}</td>
            <td>{{addComma code03_cnt}}</td>
            <td>{{addComma code04_cnt}}</td>
            <td>{{addComma code05_cnt}}</td>
            <td>{{addComma code06_cnt}}</td>
            <td>{{addComma android_total_cnt}}</td>
            <td style="border-bottom: hidden;"></td>
            <th>결제 건 수</th>
            <td>{{addComma code07_cnt}}</td>
            <td>{{addComma code08_cnt}}</td>
            <td>{{addComma code09_cnt}}</td>
            <td>{{addComma code10_cnt}}</td>
            <td>{{addComma code11_cnt}}</td>
            <td>{{addComma code12_cnt}}</td>
            <td>{{addComma ios_total_cnt}}</td>
        </tr>
        <tr>
            <th>부과세 포함 금액</th>
            <td>{{addComma code01_amt}}</td>
            <td>{{addComma code02_amt}}</td>
            <td>{{addComma code03_amt}}</td>
            <td>{{addComma code04_amt}}</td>
            <td>{{addComma code05_amt}}</td>
            <td>{{addComma code06_amt}}</td>
            <td>{{addComma android_total_amt}}</td>
            <td style="border-bottom: hidden;"></td>
            <th>부과세 포함 금액</th>
            <td>{{addComma code07_amt}}</td>
            <td>{{addComma code08_amt}}</td>
            <td>{{addComma code09_amt}}</td>
            <td>{{addComma code10_amt}}</td>
            <td>{{addComma code11_amt}}</td>
            <td>{{addComma code12_amt}}</td>
            <td>{{addComma ios_total_cnt}}</td>
        </tr>
        <tr>
            <th><label class="font-bold" style="color: red;">부과세 제외 금액</label></th>
            <td style="color: red;">{{vatMinus code01_amt}}</td>
            <td style="color: red;">{{vatMinus code02_amt}}</td>
            <td style="color: red;">{{vatMinus code03_amt}}</td>
            <td style="color: red;">{{vatMinus code04_amt}}</td>
            <td style="color: red;">{{vatMinus code05_amt}}</td>
            <td style="color: red;">{{vatMinus code06_amt}}</td>
            <td style="color: red;">{{vatMinus android_total_amt}}</td>
            <td style="border-bottom: hidden;"></td>
            <th style="color: red;"><label class="font-bold" style="color: red;">부과세 제외 금액</label></th>
            <td style="color: red;">{{vatMinus code07_amt}}</td>
            <td style="color: red;">{{vatMinus code08_amt}}</td>
            <td style="color: red;">{{vatMinus code09_amt}}</td>
            <td style="color: red;">{{vatMinus code10_amt}}</td>
            <td style="color: red;">{{vatMinus code11_amt}}</td>
            <td style="color: red;">{{vatMinus code12_amt}}</td>
            <td style="color: red;">{{vatMinus ios_total_amt}}</td>
        </tr>
        <tr>
            <th>결제 비율</th>
            <td>({{payRate code01_cnt android_total_cnt}}%)<br><label style="color: red;">{{payRate code01_amt android_total_amt}}%</label></td>
            <td>({{payRate code02_cnt android_total_cnt}}%)<br><label style="color: red;">{{payRate code02_amt android_total_amt}}%</label></td>
            <td>({{payRate code03_cnt android_total_cnt}}%)<br><label style="color: red;">{{payRate code03_amt android_total_amt}}%</label></td>
            <td>({{payRate code04_cnt android_total_cnt}}%)<br><label style="color: red;">{{payRate code04_amt android_total_amt}}%</label></td>
            <td>({{payRate code05_cnt android_total_cnt}}%)<br><label style="color: red;">{{payRate code05_amt android_total_amt}}%</label></td>
            <td>({{payRate code06_cnt android_total_cnt}}%)<br><label style="color: red;">{{payRate code06_amt android_total_amt}}%</label></td>
            <td>({{payRate android_total_cnt android_total_cnt}}%)<br><label style="color: red;">{{payRate android_total_amt android_total_amt}}%</label></td>
            <td style="border-bottom: hidden;"></td>
            <th>결제 비율</th>
            <td>({{payRate code07_cnt ios_total_cnt}}%)<br><label style="color: red;">{{payRate code07_amt ios_total_amt}}%</label></td>
            <td>({{payRate code08_cnt ios_total_cnt}}%)<br><label style="color: red;">{{payRate code08_amt ios_total_amt}}%</label></td>
            <td>({{payRate code09_cnt ios_total_cnt}}%)<br><label style="color: red;">{{payRate code09_amt ios_total_amt}}%</label></td>
            <td>({{payRate code10_cnt ios_total_cnt}}%)<br><label style="color: red;">{{payRate code10_amt ios_total_amt}}%</label></td>
            <td>({{payRate code11_cnt ios_total_cnt}}%)<br><label style="color: red;">{{payRate code11_amt ios_total_amt}}%</label></td>
            <td>({{payRate code12_cnt ios_total_cnt}}%)<br><label style="color: red;">{{payRate code12_amt ios_total_amt}}%</label></td>
            <td>({{payRate ios_total_cnt ios_total_cnt}}%)<br><label style="color: red;">{{payRate ios_total_amt ios_total_amt}}%</label></td>
        </tr>
        </tbody>
    </table>
</script>

<script id="tmp_payTotalTable" type="text/x-handlebars-template">
    <table class="table table-bordered mb0">
        <colgroup>
            <col width="35%"/><col width="65%"/>
        </colgroup>
        <tr>
            <th colspan="2">총 결제건/(부과세 제외) 매출</th>
        </tr>
        <tr>
            <td style="color: red;">{{total_cnt}} 건</td>
            <td style="color: red;">{{vatMinus total_amt}} 원</td>
        </tr>
    </table>
</script>

