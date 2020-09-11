<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dummyData"><%= java.lang.Math.round(java.lang.Math.random() * 1000000) %></c:set>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="container-fluid col-lg-8 no-padding">
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
                                <a href="javascript://" class="_prevSearch">[이전]</a>
                                <a href="javascript://" class="_todaySearch">[오늘]</a>
                                <a href="javascript://" class="_nextSearch">[다음]</a>
                            </div>
                        </div>
                    </div>
                </div>
            </form>

            <div class="row col-lg-12 form-inline">
                <!-- 가입자수 -->
                <div class="widget widget-table mb10">
                    <div class="widget-header">
                        <h3><i class="fa fa-table"></i> 환전 통계 현황</h3>
                    </div>
                    <div class="widget-content mt10">
                        <div id="summaryTable"></div>
                        <div id="summaryTable2"></div>
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
</div>

<script type="text/javascript" src="/js/code/enter/joinCodeList.js?${dummyData}"></script>
<script type="text/javascript" src="/js/util/statUtil.js?${dummyData}"></script>
<script type="text/javascript" src="/js/code/money/exchangeCodeList.js?${dummyData}"></script>
<script type="text/javascript" src="/js/code/member/memberCodeList.js?${dummyData}"></script>
<script type="text/javascript" src="/js/handlebars/moneyHelper.js?${dummyData}"></script>

<script type="text/javascript">
    var dateTime = new Date();
    dateTime = moment(dateTime).format("YYYY.MM.DD");
    var week = ['일', '월', '화', '수', '목', '금', '토'];
    var toDay = week[moment(new Date()).day()];
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
        setTimeDate(dateTime);

        //방송 통계 현황
        getList();
    });

    function setTimeDate(dateTime){
        $("#onedayDate").val(dateTime);
        $("#startDate").val(dateTime);
        $("#endDate").val(dateTime);
        $("._searchDate").html(dateTime + " (" + toDay + ")");
    }

    $(document).on('change', 'input[name="slctType"]', function(){
        radioChange();

    });

    function getList(){
        var startDate = $("#startDate").val();
        var year = startDate.split(".")[0];
        var month = startDate.split(".")[1];
        var day = startDate.split(".")[2];

        var endDate = $("#endDate").val();
        var end_year = endDate.split(".")[0];
        var end_month = endDate.split(".")[1];
        var end_day = endDate.split(".")[2];

        var data = {
            search_year : year
            , search_month : month
            , search_day : day
            , search_testId : 0
            , slctType : $('input[name="slctType"]:checked').val()
            , end_year : end_year
            , end_month : end_month
            , end_day : end_day
        };

        var template = $('#tmp_exchangeSummary').html();
        var templateScript = Handlebars.compile(template);
        var html = templateScript();
        $("#summaryTable").html(html);

        ui.paintColor();

        util.getAjaxData("select", "/rest/money/exchange/stat/summary", data, fn_succ_summary);

        var data = {};
        data.search_testId = 0;
        data.viewName = "enableList";
        util.getAjaxData("select", "/rest/money/exchange/list", data, fn_succ_enable_list);

    }
    function fn_succ_summary(dst_id, response){

        var special_total_cnt = 0;
        var special_total_amount = 0;
        var special_total_star = 0;

        response.data.specialSummaryList.forEach(function(data, i){
            console.log(data);
            $('._summary_special_cnt_' + i).html(common.addComma(data.cnt));
            $('._summary_special_amount_' + i).html(common.addComma(data.sumCashReal));
            $('._summary_special_star_' + i).html(common.addComma(data.sumByeol));

            special_total_cnt += data.cnt;
            special_total_amount += data.sumCashReal;
            special_total_star += data.sumByeol;
        });

        $('._summary_total_special_cnt').html(common.addComma(special_total_cnt));
        $('._summary_total_special_amount').html(common.addComma(special_total_amount));
        $('._summary_total_special_star').html(common.addComma(special_total_star));

        var general_total_cnt = 0;
        var general_total_amount = 0;
        var general_total_star = 0;

        response.data.generalSummaryList.forEach(function(data, i){
            $('._summary_user_cnt_' + i).html(common.addComma(data.cnt));
            $('._summary_user_amount_' + i).html(common.addComma(data.sumCashReal));
            $('._summary_user_star_' + i).html(common.addComma(data.sumByeol));

            general_total_cnt += data.cnt;
            general_total_amount += data.sumCashReal;
            general_total_star += data.sumByeol;
        });

        $('._summary_total_user_cnt').html(common.addComma(general_total_cnt));
        $('._summary_total_user_amount').html(common.addComma(general_total_amount));
        $('._summary_total_user_star').html(common.addComma(general_total_star));
    }

    function fn_succ_enable_list(dst_id, response) {
        console.log("--------------------------");
        var exchangeAmt = common.exchangeAmt(response.data.totalGold,response.data.specialCnt).replace(/,/gi,"");
        var totalSuccAmt = common.vatMinus(response.data.totalSuccAmt).replace(/,/gi,"");
        response.data.netProfit = Number(totalSuccAmt)-(Number(exchangeAmt) + Number(response.data.totalExchangeAmt));

        var template = $("#tmp_enableSummary").html();
        var templateScript = Handlebars.compile(template);
        var data = {
            content : response.data
        };
        var html = templateScript(data);
        $("#summaryTable2").html(html);
    }

    $(document).on('click', '._prevSearch', function(){
        searchDate('prev');
    });

    $(document).on('click', '._nextSearch', function(){
        searchDate('next');
    });

    $(document).on('click', '._todaySearch', function(){
        $("input:radio[name='slctType']:radio[value='0']").prop('checked', true);
        radioChange();

        setTimeDate(dateTime);
        $("#bt_search").click();
    });

    function radioChange(){
        if($('input[name="slctType"]:checked').val() == 0){
            $("#oneDayDatePicker").show();
            $("#rangeDatepicker").hide();
        }else {
            $("#oneDayDatePicker").hide();
            $("#rangeDatepicker").show();
        }
        searchDate();
    }

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
        toDay = week[moment($("#startDate").val()).add('days', days).day()];
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

<script type="text/x-handlebars-template" id="tmp_exchangeSummary">
    <div class="col-lg-4 no-padding">
        <table class="table table-bordered table-summary">
            <colgroup>
                <col width="80px"/>
                <col width="80px"/>
                <col width="80px"/>
                <col width="80px"/>
            </colgroup>

            <thead>
                <tr>
                    <th colspan="4" class="_bgColor _fontColor" data-bgcolor="#ffa100" data-fontcolor="white">스페셜DJ</th>
                </tr>
                <tr>
                    <th>상태</th>
                    <th>건 수</th>
                    <th>금액</th>
                    <th>요청 별</th>
                </tr>
            </thead>
            <tbody id="tb_special_summary">
                <tr>
                    <th>환전신청</th>
                    <td style="background-color: white"><span class="_summary_special_cnt_0">0</span>건</td>
                    <td style="background-color: white"><span class="_summary_special_amount_0">0</span>원</td>
                    <td style="background-color: white"><span class="_summary_special_star_0">0</span>별</td>
                </tr>
                <tr>
                    <th>처리완료</th>
                    <td style="background-color: white"><span class="_summary_special_cnt_1">0</span>건</td>
                    <td style="background-color: white"><span class="_summary_special_amount_1">0</span>원</td>
                    <td style="background-color: white"><span class="_summary_special_star_1">0</span>별</td>
                </tr>
                <tr class="_fontColor" data-fontcolor="#ff5600">
                    <th>총계</th>
                    <th style="background-color: white"><span class="_summary_total_special_cnt">0</span>건</th>
                    <th style="background-color: white"><span class="_summary_total_special_amount">0</span>원</th>
                    <th style="background-color: white"><span class="_summary_total_special_star">0</span>별</th>
                </tr>

                <tr style="border-left: hidden;border-right: hidden; height: 5px;">
                    <td colspan="4" style="height: 5px;"></td>
                </tr>

                <tr>
                    <th>처리불가</th>
                    <td style="background-color: white"><span class="_summary_special_cnt_2">0</span>건</td>
                    <!-- 양과장님 요청으로 데이터 삭제 처리 -->
                    <!--<td style="background-color: white"><span class="_summary_user_7">0</span>원</td>
                    <td style="background-color: white"><span class="_summary_user_8">0</span>별</td>-->
                    <td style="background-color: white">-</td>
                    <td style="background-color: white">-</td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="col-lg-4 no-padding">
        <table class="table table-bordered table-summary" style="margin-right: 0px">
            <colgroup>
                <col width="80px"/>
                <col width="80px"/>
                <col width="80px"/>
                <col width="80px"/>
            </colgroup>

            <thead>
                <tr>
                    <th colspan="4" class="_bgColor _fontColor" data-bgcolor="#66a449" data-fontcolor="white">일반회원</th>
                </tr>
                <tr>
                    <th>상태</th>
                    <th>건 수</th>
                    <th>금액</th>
                    <th>요청 별</th>
                </tr>
            </thead>
            <tbody id="tb_user_summary">
                <tr>
                    <th>환전신청</th>
                    <td style="background-color: white"><span class="_summary_user_cnt_0">0</span>건</td>
                    <td style="background-color: white"><span class="_summary_user_amount_0">0</span>원</td>
                    <td style="background-color: white"><span class="_summary_user_star_0">0</span>별</td>
                </tr>
                <tr>
                    <th>처리완료</th>
                    <td style="background-color: white"><span class="_summary_user_cnt_1">0</span>건</td>
                    <td style="background-color: white"><span class="_summary_user_amount_1">0</span>원</td>
                    <td style="background-color: white"><span class="_summary_user_star_1">0</span>별</td>
                </tr>
                <tr class="_fontColor" data-fontcolor="#ff5600">
                    <th>총계</th>
                    <th style="background-color: white"><span class="_summary_total_user_cnt">0</span>건</th>
                    <th style="background-color: white"><span class="_summary_total_user_amount">0</span>원</th>
                    <th style="background-color: white"><span class="_summary_total_user_star">0</span>별</th>
                </tr>

                <tr style="border-left: hidden;border-right: hidden; height: 5px;">
                    <td colspan="4" style="height: 5px;"></td>
                </tr>

                <tr>
                    <th>처리불가</th>
                    <td style="background-color: white"><span class="_summary_user_cnt_2">0</span>건</td>
                    <!-- 양과장님 요청으로 데이터 삭제 처리 -->
                    <!--<td style="background-color: white"><span class="_summary_user_7">0</span>원</td>
                    <td style="background-color: white"><span class="_summary_user_8">0</span>별</td>-->
                    <td style="background-color: white">-</td>
                    <td style="background-color: white">-</td>
                </tr>
            </tbody>
        </table>
    </div>
</script>

<script type="text/x-handlebars-template" id="tmp_enableSummary">
    <div class="col-lg-3 no-padding">
        <table class="table table-bordered table-summary" style="margin-right: 0px;width: 300px">
            <colgroup>
                <col width="50%"/><col width="50%"/>
            </colgroup>
            <tr>
                <th colspan="2">총 환전 가능금액</th>
            </tr>
            <tr style="background-color: white">
                <td>{{addComma content.enableCnt}} 명</td>
                <td>{{exchangeAmt content.totalGold content.specialCnt}}원</td>
            </tr>
            <tr>
                <th colspan="2">
                    <label class="font-bold" style="padding-top: 9px">(환전가능 금액/부가세 제외)<br/>
                        총 예상 순 매출
                    </label>
                </th>
            </tr>
            <tr style="background-color: white">
                <td colspan="2" class="font-bold" style="color: #ff5600">{{addComma content.netProfit}}원</td>
            </tr>
        </table>
    </div>
</script>