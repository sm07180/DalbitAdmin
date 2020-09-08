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
                                <%--<span id="slctTypeArea"></span>--%>

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

                                <button type="button" class="btn btn-success" id="bt_search">검색</button>
                                <a href="javascript://" class="_prevSearch">[이전]</a>
                                <a href="javascript://" class="_todaySearch">[오늘]</a>
                                <a href="javascript://" class="_nextSearch">[다음]</a>

                                <label class="control-inline fancy-checkbox custom-color-green">
                                    <input type="checkbox" name="search_testId" id="search_testId" value="1" checked="true">
                                    <span id="checkTestid" style="display: none">테스트 아이디 제외</span>
                                </label>

                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <!-- tab -->
    <div class="no-padding" id="infoTab">
        <jsp:include page="infoTab.jsp"/>
    </div>
    <!-- //tab -->
</div>

<script type="text/javascript" src="/js/code/status/statusCodeList.js?${dummyData}"></script>
<script type="text/javascript" src="/js/code/enter/joinCodeList.js?${dummyData}"></script>
<script type="text/javascript" src="/js/util/statUtil.js?${dummyData}"></script>
<script type="text/javascript" src="/js/handlebars/statusHelper.js?${dummyData}"></script>

<script type="text/javascript">
    var dateTime = new Date();
    dateTime = moment(dateTime).format("YYYY.MM.DD");
    var week = ['일', '월', '화', '수', '목', '금', '토'];
    var toDay = week[moment(new Date()).day()];
    setTimeDate(dateTime);

    var slctType;

    $(function(){
        // $("#slctTypeArea").append(util.getCommonCodeRadio(0, join_slctType));

        $('#onedayDate').datepicker("onedayDate", new Date()).on('changeDate', function(dateText, inst){
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
        });

    });

    function setTimeDate(dateTime){
        $("#onedayDate").val(dateTime);
        $("#startDate").val(dateTime);
        $("#endDate").val(dateTime);
        $("._searchDate").html(dateTime + " (" + toDay + ")");
    }

    function setRangeDate(displayDate, startDate, endDate){
        $("#onedayDate").val(startDate);
        $("#startDate").val(startDate);
        $("#endDate").val(endDate);
        $("#monthDate").val(startDate.substr(0,7));
        $("#yearDate").val(startDate.substr(0,4));
    }

    $(document).on('click', '._prevSearch', function(){
        prevNext(true);
    });

    $(document).on('click', '._nextSearch', function(){
        prevNext(false);
    });

    $(document).on('click', '._todaySearch', function(){

        if(tabId == 'tab_time' || tabId == 'tab_gift' || tabId == 'tab_platform'){
            slctType = "0";
            me = 0;
        }else if(tabId == 'tab_day' || tabId == 'tab_type') {
            slctType = "1";
            me = 1;
        }else if(tabId == 'tab_year') {
            slctType = "2";
            me = 2;
        }

        if(tabId == 'tab_time'){
            getTimeList();
        }else if(tabId == 'tab_day'){
            getDayList();
        }else if(tabId == 'tab_year'){
            getYearList();
        }else if(tabId == 'tab_platform'){
            getPlatformList();
        }else if(tabId == 'tab_year'){
            getTypeList();
        }else if(tabId == 'tab_gift'){
            getGiftHistoryList();
        }

        setTimeDate(dateTime);
        radioChange();
        $("#bt_search").click();
    });

    var me = 0;
    function radioChange(){
        if(me == 0){
            $("#oneDayDatePicker").show();
            $("#monthDatepicker").hide();
            $("#yearDatepicker").hide();
            $("#startDate").val($("#onedayDate").val());
            $("#endDate").val($("#onedayDate").val());
        }else{
            if(me == 1){
                // 일별 -----------------------------------
                $("#oneDayDatePicker").hide();
                $("#monthDatepicker").show();
                $("#yearDatepicker").hide();

                var monthLastDate = new Date($("#onedayDate").val().substr(0,4),$("#onedayDate").val().substr(5,7),-1);
                $("#startDate").val($("#onedayDate").val().substr(0,8) + "01");
                $("#endDate").val($("#onedayDate").val().substr(0,8) + (monthLastDate.getDate() + 1));
                $("#monthDate").val($("#onedayDate").val().substr(0,7));

                var rangeDate = $("#monthDate").val().split(' - ');
                if(-1 < rangeDate.indexOf(' - ')){
                    $("#startDate").val(rangeDate[0]);
                    $("#endDate").val(rangeDate[1]);
                };
            }else{
                // 월별 ----------------------------------
                $("#oneDayDatePicker").hide();
                $("#monthDatepicker").hide();
                $("#yearDatepicker").show();

                var yearDate = new Date();
                $("#startDate").val(yearDate.getFullYear() + '.01.01');
                $("#endDate").val(yearDate.getFullYear() + ".12.31");
                $("#yearDate").val(yearDate.getFullYear());
            }
        }
    }

    var slctType = 0;
    function prevNext(isPrev){

        var targetDate = statUtil.getStatTimeDate($("#startDate").val(), stat_searchType, slctType, isPrev);
        var addDate = isPrev ? -1 : 1;

        toDay = week[moment($("#startDate").val()).add('days', addDate).day()];

        if(slctType == 0){
            setTimeDate(targetDate);
        }else if(slctType == 1){
            $("#startDate").val(moment($("#startDate").val()).add("months", addDate).format('YYYY.MM.DD'));
            var monthLastDate = new Date($("#startDate").val().substr(0,4),$("#startDate").val().substr(5,7),-1);
            $("#endDate").val($("#startDate").val().substr(0,8) +(monthLastDate.getDate() + 1));
            setRangeDate(targetDate, $("#startDate").val(), $("#endDate").val());
        }else if(slctType == 2){
            $("#startDate").val(moment($("#startDate").val()).add("years", addDate).format('YYYY.MM.DD'));
            $("#endDate").val(moment($("#endDate").val()).add("years", addDate).format('YYYY.MM.DD'));
            setRangeDate(targetDate, $("#startDate").val(), $("#endDate").val());
        }
        $("#bt_search").click();
    }

    function dataSet(){
        var startDate;
        var endDate;

        // if(!common.isEmpty(isPrev)){
        //     var addDate = isPrev ? -1 : 1;
        //     startDate = moment($("#startDate").val()).add("months", addDate).format('YYYY.MM.DD');
        //     var monthLastDate = new Date(startDate.substr(0,4),startDate.substr(5,7),-1);
        //     endDate = startDate.substr(0,8) +(monthLastDate.getDate() + 1);
        // }else{
            startDate = $("#startDate").val();
            endDate = $("#endDate").val();
        // }

        var data = {
            slctType : slctType,
            startDate : startDate,
            endDate : endDate
        };

        return data;
    }

</script>