<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="container-fluid">
            <form id="searchForm">
                <div class="row col-lg-12 form-inline">
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
                            </div>
                        </div>
                    </div>
                </div>
            </form>

            <div class="row col-lg-12 form-inline">
                <div class="widget widget-table mb10">
                    <div class="widget-header">
                        <h3><i class="fa fa-table"></i> 결제/환불 통계 현황</h3>
                        <div class="btn-group widget-header-toolbar">
                            <a href="#" title="Expand/Collapse" class="btn-borderless btn-toggle-expand"><i class="fa fa-chevron-up"></i></a>
                        </div>
                    </div>
                    <div class="widget-content mt10">
                        <table class="table table-condensed table-dark-header table-bordered" id="statPayTable">
                            <thead>
                            </thead>
                            <tbody id="statPayTableBody">
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <!-- tab -->
            <div class="no-padding" id="infoTab">
                <jsp:include page="infoTab.jsp"/>
            </div>
            <!-- //tab -->
        </div>
    </div>
</div>

<script type="text/javascript" src="/js/code/enter/joinCodeList.js?${dummyData}"></script>
<script type="text/javascript" src="/js/util/statUtil.js?${dummyData}"></script>
<script type="text/javascript">
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

        var dateTime = new Date();
        dateTime = moment(dateTime).format("YYYY.MM.DD");
        setTimeDate(dateTime);

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
        util.getAjaxData("statPayInfo", "/rest/enter/pay/pay/info", null, fn_statPayInfo_success);
    }
    function fn_statPayInfo_success(data, response){
        var template = $('#tmp_payTableSummary').html();
        var templateScript = Handlebars.compile(template);
        var context = response.data;
        var html=templateScript(context);
        $("#statPayTableBody").append(html);
    }

    $(document).on('click', '._prevSearch', function(){
        searchDate('prev');
    });

    $(document).on('click', '._nextSearch', function(){
        searchDate('next');
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

<script id="tmp_payTableSummary" type="text/x-handlebars-template">
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>결제수단</th>
                <th>합계</th>
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
                <td>결제금액(건수)</td>
                <td>{{addComma content.total_amt}}({{addComma content.total_cnt}})</td>
                <td>{{addComma content.mc_amt}}({{addComma content.mc_cnt}})</td>
                <td>{{addComma content.cn_amt}}({{addComma content.cn_cnt}})</td>
                <td>{{addComma content.inapp_amt}}({{addComma content.inapp_cnt}})</td>
                <td>{{addComma content.ra_amt}}({{addComma content.ra_cnt}})</td>
                <td>{{addComma content.va_amt}}({{addComma content.va_cnt}})</td>
                <td>0(0)</td>
                <td>0(0)</td>
            </tr>
        </tbody>
        <thead>
            <tr>
                <th>결제회원</th>
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
                <td>결제금액(건수)</td>
                <td>{{addComma content.male_amt}}({{addComma content.male_cnt}})</td>
                <td>{{addComma content.female_amt}}({{addComma content.female_cnt}})</td>
                <td>{{addComma content.age10_amt}}({{addComma content.age10_cnt}})</td>
                <td>{{addComma content.age20_amt}}({{addComma content.age20_cnt}})</td>
                <td>{{addComma content.age30_amt}}({{addComma content.age30_cnt}})</td>
                <td>{{addComma content.age40_amt}}({{addComma content.age40_cnt}})</td>
                <td>{{addComma content.age50_amt}}({{addComma content.age50_cnt}})</td>
                <td>{{addComma content.age60_amt}}({{addComma content.age60_cnt}})</td>
            </tr>
        </tbody>
        <thead>
            <tr>
                <th colspan="2">결제상품(Web, 안드로이드)</th>
                <th>달 50</th>
                <th>달 100</th>
                <th>달 500</th>
                <th>달 1,000</th>
                <th>달 2,000</th>
                <th>달 3,000</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td colspan="2">결제금액(건수)</td>
                <td>{{addComma content.code01_amt}}({{addComma content.code01_cnt}})</td>
                <td>{{addComma content.code02_amt}}({{addComma content.code02_cnt}})</td>
                <td>{{addComma content.code03_amt}}({{addComma content.code03_cnt}})</td>
                <td>{{addComma content.code04_amt}}({{addComma content.code04_cnt}})</td>
                <td>{{addComma content.code05_amt}}({{addComma content.code05_cnt}})</td>
                <td>{{addComma content.code06_amt}}({{addComma content.code06_cnt}})</td>
                <td></td>
            </tr>
        </tbody>
        <thead>
            <tr>
                <th colspan="2">결제상품(아이폰)</th>
                <th>달 49</th>
                <th>달 100</th>
                <th>달 300</th>
                <th>달 420</th>
                <th>달 920</th>
                <th>달 2,350</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td colspan="2">결제금액(건수)</td>
                <td>{{addComma content.code07_amt}}({{addComma content.code07_cnt}})</td>
                <td>{{addComma content.code08_amt}}({{addComma content.code08_cnt}})</td>
                <td>{{addComma content.code09_amt}}({{addComma content.code09_cnt}})</td>
                <td>{{addComma content.code10_amt}}({{addComma content.code10_cnt}})</td>
                <td>{{addComma content.code11_amt}}({{addComma content.code11_cnt}})</td>
                <td>{{addComma content.code12_amt}}({{addComma content.code12_cnt}})</td>
                <td></td>
            </tr>
        </tbody>
    </table>

