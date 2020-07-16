<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="container-fluid col-lg-9 no-padding">
            <form id="searchForm">
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
                        <h3><i class="fa fa-table"></i> 아이템 통계 현황</h3>
                    </div>
                    <div class="widget-content mt10">
                        <table class="table table-bordered">
                            <colgroup>
                                <col width="10%"/><col width="10%"/><col width="10%"/><col width="10%"/><col width="10%"/>
                                <col width="10%"/><col width="10%"/><col width="10%"/><col width="10%"/><col width="10%"/>
                            </colgroup>
                            <thead>
                            <tr>
                                <th></th>
                                <th>실시간</th>
                                <th>전일</th>
                                <th>증감</th>
                                <th>주간</th>
                                <th>전주</th>
                                <th>증감</th>
                                <th>월간</th>
                                <th>전월</th>
                                <th>증감</th>
                            </tr>
                            </thead>
                            <tbody id="liveTableBody"></tbody>
                        </table>
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
        util.getAjaxData("itemLive", "/rest/status/item/live/list", null, fn_live_success);
    }

    function fn_live_success(data, response){
        $("#liveTableBody").empty();
        var template = $('#tmp_live').html();
        var templateScript = Handlebars.compile(template);
        var context = response.data.liveInfo;
        var html=templateScript(context);
        $("#liveTableBody").append(html);
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
        if(tabId != 'tab_broadcastDetail') {
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
        // if($('input[name="slctType"]:checked').val() == 0){
        //     $("#oneDayDatePicker").show();
        //     $("#rangeDatepicker").hide();
        // }else {
        //     $("#oneDayDatePicker").hide();
        //     $("#rangeDatepicker").show();
        // }
        searchDate();
    }

    function searchDate(dateType){
        if(tabId != "tab_broadcastDetail"){
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
        }else{
            var slctType = $('input[name="slctType2"]:checked').val();
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

<script type="text/x-handlebars-template" id="tmp_live">
    <tr>
        <th>건수</th>
        <td>{{addComma now_item_cnt}}</td>
        <td>{{addComma yes_item_cnt}}</td>
        <td class="{{upAndDownClass now_inc_cnt}}"><i class="fa {{upAndDownIcon now_inc_cnt}}"></i> {{addComma now_inc_cnt}}</td>
        <td>{{addComma week_item_cnt}}</td>
        <td>{{addComma bweek_item_cnt}}</td>
        <td class="{{upAndDownClass week_inc_cnt}}"><i class="fa {{upAndDownIcon week_inc_cnt}}"></i> {{addComma week_inc_cnt}}</td>
        <td>{{addComma month_item_cnt}}</td>
        <td>{{addComma bmonth_item_cnt}}</td>
        <td class="{{upAndDownClass month_inc_cnt}}"><i class="fa {{upAndDownIcon month_inc_cnt}}"></i> {{addComma month_inc_cnt}}</td>
    </tr>
    <tr>
        <th>달수</th>
        <td>{{addComma now_item_amt}}</td>
        <td>{{addComma yes_item_amt}}</td>
        <td class="{{upAndDownClass now_inc_amt}}"><i class="fa {{upAndDownIcon now_inc_amt}}"></i> {{addComma now_inc_amt}}</td>
        <td>{{addComma week_item_amt}}</td>
        <td>{{addComma bweek_item_amt}}</td>
        <td class="{{upAndDownClass week_inc_amt}}"><i class="fa {{upAndDownIcon week_inc_amt}}"></i> {{addComma week_inc_amt}}</td>
        <td>{{addComma month_item_amt}}</td>
        <td>{{addComma bmonth_item_amt}}</td>
        <td class="{{upAndDownClass month_inc_amt}}"><i class="fa {{upAndDownIcon month_inc_amt}}"></i> {{addComma month_inc_amt}}</td>
    </tr>
    <%--<tr>
        <th>합계</th>
        <td>{{addComma }}</td>
        <td>{{addComma }}</td>
        <td class="{{upAndDownClass }}"><i class="fa {{upAndDownIcon }}"></i> {{addComma }}</td>
        <td>{{addComma }}</td>
        <td>{{addComma }}</td>
        <td class="{{upAndDownClass }}"><i class="fa {{upAndDownIcon }}"></i> {{addComma }}</td>
        <td>{{addComma }}</td>
        <td>{{addComma }}</td>
        <td class="{{upAndDownClass }}"><i class="fa {{upAndDownIcon }}"></i> {{addComma }}</td>
    </tr>--%>
</script>