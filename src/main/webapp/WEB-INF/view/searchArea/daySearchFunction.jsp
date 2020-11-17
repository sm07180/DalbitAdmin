<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript" src="/js/code/money/exchangeCodeList.js?${dummyData}"></script>

<script type="text/javascript">
    $(function() {
        $(".search_exchange_years").append(util.getCommonCodeSelect(moment(new Date()).format('YYYY'), search_exchange_years));
        year = $("#search_year").val();
        $(document).on('change', '#search_year', function() {
            if(slctType == 0) {
                monthClick("", $("#div_dayButton").find("#search_year").val(), month, day);
            }else if(slctType == 1){
                monthClick("", $("#div_monthButton").find("#search_year").val(), month, day);
            }else if(slctType == 2){
                monthClick("", $("#div_yearButton").find("#search_year").val(), month, day);
            }
        });
    });

    function setDayButton(today){
        $(".monthButton").empty();

        if(common.isEmpty(today)){
            $(".search_exchange_years").empty();
            $(".search_exchange_years").append(util.getCommonCodeSelect(moment(new Date()).format('YYYY'), search_exchange_years));
            month = common.lpad(moment(dateTime).format("MM"),2,"0");
            day = common.lpad(moment(dateTime).format("DD"),2,"0");
        }
        var monthButton = '<div class="btn-group" data-toggle="buttons" id="labelMonthButton">';
        for(var i=1; i<13;i++){
            monthButton = monthButton + '<label class="btn btn-xs mr5 btn-default btn-search labelMonthButton' + common.lpad(i,2,"0") +'" style="border-radius: 4px;" data-month="' + i +'" name="buttonMonth" onclick="monthBottonClick($(this).data())"> <input type="radio">' + i + '</label>';
        }
        monthButton = monthButton + '</div>';

        $(".monthButton").append(monthButton);

        $(".labelMonthButton" + month).addClass('active');

        $(".search_exchange_years").find("#search_year").css("width","100%");
        $(".search_exchange_years").find("#search_year").css("height","100%");

        monthClick("",$("#search_year").val(), month, day);
    }

    function monthClick(id, paramYear, paramMonth, paramDay){
        console.log("----------------- monthClick");
        console.log(id);
        console.log(paramYear);
        console.log(paramMonth);
        console.log(paramDay);


         $(".dayButton").empty();
        year = paramYear;
        month = paramMonth;
        if(paramMonth < 1 || paramMonth > 12){
            return false;
        }
        for(var i=1; i<13;i++){
            $(".labelMonthButton" + common.lpad(i,2,"0")).removeClass('active');
        }

        $(".labelMonthButton" + month).addClass('active');

        var lastDay = new Date(paramYear,paramMonth,-1).getDate() + 1;
        var dayButton = '<div class="btn-group" data-toggle="buttons" id="labelDayButton">';
        for(var i=1; i<lastDay+1;i++){
            dayButton = dayButton + '<label class="btn btn-xs mr5 btn-default btn-search labelDayButton' + common.lpad(i,2,"0") +'" style="border-radius: 4px;" data-day="' + i +'" onclick="dayBottonClick($(this).data())"> <input type="radio">' + i + '</label>';
        }
        dayButton = dayButton + '</div>';
        $(".dayButton").append(dayButton);
        if(Number(paramDay) > lastDay) {
            dayClick("", paramYear, paramMonth, lastDay);
        }else{
            dayClick("", paramYear, paramMonth, paramDay);
        }
    }

    function dayClick(id, paramYear, paramMonth, paramDay){
        console.log("----------------- dayClick");
        console.log(id);
        console.log(paramYear);
        console.log(paramMonth);
        console.log(paramDay);
        console.log(day);

        var lastDay = new Date(paramYear,paramMonth,-1).getDate() + 1;

        for(var i=1; i<lastDay + 1;i++){
            $(".labelDayButton" + common.lpad(i,2,"0")).removeClass('active');
        }

        if(Number(day) > lastDay){
            day = lastDay;
            $(".labelDayButton" + lastDay).addClass('active');
        }else{
            day = paramDay;
            $(".labelDayButton" + paramDay).addClass('active');
        }
        var selectDate = paramYear + "." + common.lpad(paramMonth,2,"0") + "." + common.lpad(day,2,"0");

        if(slctType == 0){
            setTimeDate(selectDate);
        }else if(slctType == 1){
            $("#monthDate").val(selectDate.substr(0,7));
            $("#startDate").val(selectDate.substr(0,8) + "01");
            $("#endDate").val(selectDate.substr(0,8) + lastDay);
            $("._searchDate").html(moment($("#startDate").val()).format('YYYY년 MM월'));
        }else if(slctType == 2){
            $("#yearDate").val(selectDate.substr(0,4));
            $("#startDate").val(selectDate.substr(0,5) + "01.01");
            $("#endDate").val(selectDate.substr(0,5) + "12.31");
            $("._searchDate").html(moment($("#startDate").val()).format('YYYY년'));
        }

        $("#bt_search").click();
    }

    function dateType(paramSlctType){
        if(paramSlctType == 0){
            setDayButton("day");
            $("#div_dayButton").show();
            $("#div_monthButton").hide();
            $("#div_yearButton").hide();
            $("#th_bottonList").show();
            $("#rangeDatepicker").hide();

        }else if(paramSlctType == 1){
            setDayButton("month");
            $("#div_dayButton").hide();
            $("#div_monthButton").show();
            $("#div_yearButton").hide();
            $("#th_bottonList").show();
            $("#rangeDatepicker").hide();

        }else if(paramSlctType == 2){
            setDayButton("year");
            $("#div_dayButton").hide();
            $("#div_monthButton").hide();
            $("#div_yearButton").show();
            $("#th_bottonList").show();
            $("#rangeDatepicker").hide();

        }else if(paramSlctType == 3){
            setDateRange("range");
            $("#div_dayButton").hide();
            $("#div_monthButton").hide();
            $("#div_yearButton").hide();
            $("#th_bottonList").hide();
            $("#rangeDatepicker").show();
        }else if(common.isEmpty(paramSlctType)){
            if(slctType == 0 || slctType == 1 || slctType == 2){
                setDayButton();
            }else if(slctType == 3){
                setTimeDate(dateTime);
                $("#bt_search").click();
            }
        }

        $(".labelMonthButton" + common.lpad(month,2,"0")).addClass('active');
        $(".labelDayButton" + common.lpad(day,2,"0")).addClass('active');
    }

    function monthBottonClick(data){
        if(!common.isEmpty(data)){
            monthClick("",$("#search_year").val(), common.lpad(data.month,2,"0"), common.lpad(day,2,"0"));
        }
    }

    function dayBottonClick(data){
        if(!common.isEmpty(data)) {
            dayClick("", year, common.lpad(month,2,"0"), common.lpad(data.day,2,"0"));
        }
    }

    function dayButtonPrev(isPrev){
        day = Number(day) + isPrev;

        var lastDay = new Date(year,common.lpad(month,2,"0"),-1).getDate() + 1;
        if(day < 1){
            day = 1;
        }
        if(day > lastDay){
            day = lastDay;
        }

        dayClick("", year, common.lpad(month,2,"0"), common.lpad(day,2,"0"));
    }
    function monthButtonPrev(isPrev){
        month = Number(month) + isPrev;

        if(month < 1){
            month = 1;
        }
        if(month > 12){
            month = 12;
        }

        monthClick("",$("#search_year").val(), common.lpad(month,2,"0"), common.lpad(day,2,"0"));
    }
    function yearButtonPrev(isPrev){
        year = Number($("#search_year").val()) + isPrev;
        $(".search_exchange_years").empty();
        $(".search_exchange_years").append(util.getCommonCodeSelect(year, search_exchange_years));
        $(".search_exchange_years").find("#search_year").css("width","100%");
        $(".search_exchange_years").find("#search_year").css("height","100%");

        monthClick("", $("#div_yearButton").find("#search_year").val(), month, day);
    }

    function setDateRange(tmp){

    }
    function dateRangePrev(isPrev){
        var addDate = isPrev ? -1 : 1;
        $("#startDate").val(moment($("#startDate").val()).add("days", addDate).format('YYYY.MM.DD'));
        $("#endDate").val(moment($("#endDate").val()).add("days", addDate).format('YYYY.MM.DD'));
        $("#displayDate").val($("#startDate").val() + " - " + $("#endDate").val());
        $("#bt_search").click();
    }

</script>
