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
                                <span id="slctTypeArea" style="display:none;"></span>
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
                                <label><input type="text" class="form-control" id="txt_search" name="txt_search"></label>
                                <button type="button" class="btn btn-success" id="bt_search">검색</button>
                                <a href="javascript://" class="_prevSearch">[이전]</a>
                                <a href="javascript://" class="_todaySearch">[오늘]</a>
                                <a href="javascript://" class="_nextSearch">[다음]</a>
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

<script type="text/javascript" src="/js/code/enter/joinCodeList.js?${dummyData}"></script>
<script type="text/javascript" src="/js/util/statUtil.js?${dummyData}"></script>
<script type="text/javascript" src="/js/handlebars/statusHelper.js?${dummyData}"></script>
<script type="text/javascript">

    var dateTime = new Date();
    dateTime = moment(dateTime).format("YYYY.MM.DD");
    var week = ['일', '월', '화', '수', '목', '금', '토'];
    var toDay = week[moment(new Date()).day()];
    setTimeDate(dateTime);

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

        $('input[id="txt_search"]').keydown(function() {
            if (event.keyCode === 13) {
                $("#bt_search").click();
            };
        });
    });

    function setTimeDate(dateTime){
        $("#onedayDate").val(dateTime);
        $("#startDate").val(dateTime);
        $("#endDate").val(dateTime);

        $("._searchDate").html(dateTime + " (" + toDay + ")");
    }

    $(document).on('change', 'input[name="slctType"]', function(){
        console.log($('input[name="slctType"]:checked').val());
        if($('input[name="slctType"]:checked').val() == 0){
            _datePicker = 0;
        }else if($('input[name="slctType"]:checked').val() == 1){
            _datePicker = 1;
        }else{
            _datePicker = 2;
        }
        changeDatepicker();
        $("#bt_search").click();
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

    var _datePicker = 0;

    function changeDatepicker(){
        if(_datePicker == 0){
            $("#oneDayDatePicker").show();
            $("#monthDatepicker").hide();
            $("#yearDatepicker").hide();
            if(_searchText == 1){
                $("#txt_search").show();
            }
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
        }else if(_datePicker == 2){ // 년간
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
        $("#bt_search").click();
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

    getStatPayInfo();

    // function click_way(){
    //     $("#tablist_con li:eq(2) a").tab("show");   // 수단
    //     getPayWayList();
    // }
    // function click_age(){
    //     $("#tablist_con li:eq(1) a").tab("show");   // 회원별
    //     getPayAgeList();
    // }
    // function click_code(){
    //     $("#tablist_con li:eq(3) a").tab("show");   // 상품별
    //     getPayCodeList();
    // }
</script>

