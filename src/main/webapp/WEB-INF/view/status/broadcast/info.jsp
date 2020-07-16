<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="container-fluid col-lg-9 no-padding">
            <form id="searchForm">
                <input type="hidden" id="pageNo" name="pageNo" value="1" />
                <input type="hidden" id="pageCnt" name="pageCnt" value="100" />
                <div class="row col-lg-12 form-inline">
                    <div class="widget widget-table searchBoxArea">
                        <div class="widget-header searchBoxRow">
                            <h3 class="title"><i class="fa fa-search"></i> 검색조건</h3>
                            <div>
                                <span id="slctTypeArea"></span>
                                <span id="slctTypeArea2" style="display: none"></span>

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

                                <input type="hidden" name="startDate" id="startDate" />
                                <input type="hidden" name="endDate" id="endDate" />
                                <%--<input name="startDate" id="startDate" />--%>
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

            <div class="row col-lg-12 form-inline">
                <div class="col-lg-6 pl0 pr5">
                    <!-- 방송 -->
                    <div class="widget widget-table mb10">
                        <div class="widget-header">
                            <h3><i class="fa fa-table"></i> 방송 통계 현황</h3>
                        </div>
                        <div class="widget-content mt10">
                            <table class="table table-bordered" id="tb_broadSumStatus">
                                <colgroup>
                                    <col width="20%"/><col width="16%"/><col width="16%"/><col width="16%"/><col width="16%"/>
                                    <col width="16%"/>
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th></th>
                                        <th>실시간</th>
                                        <th>전일</th>
                                        <th>증감</th>
                                        <th>주간</th>
                                        <th>증감</th>
                                    </tr>
                                </thead>
                                <tbody id="broadSumStatus">
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!-- //방송 -->
                </div>

                <div class="col-lg-6 pr0 pl5">
                    <!-- 선물 -->
                    <div class="widget widget-table mb10">
                        <div class="widget-header">
                            <h3><i class="fa fa-table"></i> 선물 통계 현황</h3>
                        </div>
                        <div class="widget-content mt10">
                            <table class="table table-bordered" id="tb_giftSumStatus">
                                <colgroup>
                                    <col width="20%"/><col width="16%"/><col width="16%"/><col width="16%"/><col width="16%"/>
                                    <col width="16%"/>
                                </colgroup>
                                <thead>
                                <tr>
                                    <th></th>
                                    <th>실시간</th>
                                    <th>전일</th>
                                    <th>증감</th>
                                    <th>주간</th>
                                    <th>증감</th>
                                </tr>
                                </thead>
                                <tbody id="giftSumStatus">
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!-- //선물 -->
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
<script type="text/javascript">

    var dateTime = new Date();
    dateTime = moment(dateTime).format("YYYY.MM.DD");
    var week = ['일', '월', '화', '수', '목', '금', '토'];
    var toDay = week[moment(new Date()).day()];
    setTimeDate(dateTime);

    $(function(){
        $("#slctTypeArea").append(util.getCommonCodeRadio(0, join_slctType));
        $("#slctTypeArea2").append(util.getCommonCodeRadio(0, join_slctType2));

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

    $(document).on('change', 'input[name="slctType2"]', function(){
        radioChange();
    });

    function getList(){
        util.getAjaxData("broadSumStatus", "/rest/status/broadcast/broadcastLive/list", null, fn_broadSumStatus_success);
    }

    function fn_broadSumStatus_success(data, response){
        $("#broadSumStatus").empty();
        $("#giftSumStatus").empty();

        var template = $('#tmp_broadcastLive').html();
        var templateScript = Handlebars.compile(template);
        var context = response.data.broadCastLiveInfo;
        var html=templateScript(context);
        $("#broadSumStatus").append(html);

        var template = $('#tmp_giftLive').html();
        var templateScript = Handlebars.compile(template);
        var context = response.data.broadCastLiveInfo;
        var html=templateScript(context);
        $("#giftSumStatus").append(html);
    }

    $(document).on('click', '._prevSearch', function(){
        searchDate('prev');
    });

    $(document).on('click', '._nextSearch', function(){
        searchDate('next');
    });
    $(document).on('click', '._todaySearch', function(){
        toDay = week[moment(new Date()).day()];
        $("input:radio[name='slctType']:radio[value='0']").prop('checked', true);
        $("input:radio[name='slctType2']:radio[value='0']").prop('checked', true);
        radioChange();

        setTimeDate(dateTime);
        getList();
        $("#bt_search").click();
    });

    function radioChange(){
        if(tabId != 'tab_giftHistoryDetail') {
            if ($('input[name="slctType"]:checked').val() == 0) {
                $("#oneDayDatePicker").show();
                $("#rangeDatepicker").hide();
            } else {
                $("#oneDayDatePicker").hide();
                $("#rangeDatepicker").show();
            }
        }else{
            if ($('input[name="slctType2"]:checked').val() == 0) {
                $("#oneDayDatePicker").show();
                $("#rangeDatepicker").hide();
            } else {
                $("#oneDayDatePicker").hide();
                $("#rangeDatepicker").show();
            }
        }
        searchDate();
    }

    function searchDate(dateType){
        var slctType;
        console.log(tabId);
        if(tabId != 'tab_giftHistoryDetail'){
            slctType = $('input[name="slctType"]:checked').val();

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

        }else{
            slctType = $('input[name="slctType2"]:checked').val();
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
            }else if(slctType == 2){
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

<script type="text/x-handlebars-template" id="tmp_broadcastLive">
    <tr>
        <th>방송개설건</th>
        <td>{{addComma create_now_cnt}}</td>
        <td>{{addComma create_yes_cnt}}</td>
        <td class="{{upAndDownClass create_now_inc_cnt}}"><i class="fa {{upAndDownIcon create_now_inc_cnt}}"></i> {{addComma create_now_inc_cnt}}</td>
        <td>{{addComma create_week_cnt}}</td>
        <td class="{{upAndDownClass create_week_inc_cnt}}"><i class="fa {{upAndDownIcon create_week_inc_cnt}}"></i> {{addComma create_week_inc_cnt}}</td>
    </tr>
    <tr>
        <th>방송시간</th>
        <td>{{addComma broadcast_now_time}}</td>
        <td>{{addComma broadcast_yes_time}}</td>
        <td class="{{upAndDownClass broadcast_now_inc_time}}"><i class="fa {{upAndDownIcon broadcast_now_inc_time}}"></i> {{addComma broadcast_now_inc_time}}</td>
        <td>{{addComma broadcast_week_time}}</td>
        <td class="{{upAndDownClass broadcast_week_inc_time}}"><i class="fa {{upAndDownIcon broadcast_week_inc_time}}"></i> {{addComma broadcast_week_inc_time}}</td>
    </tr>
</script>

<script type="text/x-handlebars-template" id="tmp_giftLive">
    <tr>
        <th>선물 건</th>
        <td>{{addComma gift_now_cnt}}</td>
        <td>{{addComma gift_yes_cnt}}</td>
        <td class="{{upAndDownClass gift_now_inc_cnt}}"><i class="fa {{upAndDownIcon gift_now_inc_cnt}}"></i> {{addComma gift_now_inc_cnt}}</td>
        <td>{{addComma gift_week_cnt}}</td>
        <td class="{{upAndDownClass gift_week_inc_cnt}}"><i class="fa {{upAndDownIcon gift_week_inc_cnt}}"></i> {{addComma gift_week_inc_cnt}}</td>
    </tr>
    <tr>
        <th>선물 달수</th>
        <td>{{addComma gift_now_amt}}</td>
        <td>{{addComma gift_yes_amt}}</td>
        <td class="{{upAndDownClass gift_now_inc_amt}}"><i class="fa {{upAndDownIcon gift_now_inc_amt}}"></i> {{addComma gift_now_inc_amt}}</td>
        <td>{{addComma gift_week_amt}}</td>
        <td class="{{upAndDownClass gift_week_inc_amt}}"><i class="fa {{upAndDownIcon gift_week_inc_amt}}"></i> {{addComma gift_week_inc_amt}}</td>
    </tr>
</script>