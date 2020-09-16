<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dummyData"><%= java.lang.Math.round(java.lang.Math.random() * 1000000) %></c:set>
<%
    String in_clipNo = request.getParameter("clipNo");
%>


<div id="wrapper">
    <div id="page-wrapper">
        <!-- tab -->
        <div class="no-padding" id="infoTab">
            <jsp:include page="infoTab.jsp"/>
        </div>
        <!-- //tab -->
    </div>
</div>

<script type="text/javascript" src="/js/code/enter/joinCodeList.js?${dummyData}"></script>
<script type="text/javascript" src="/js/util/statUtil.js?${dummyData}"></script>
<script type="text/javascript" src="/js/handlebars/statusHelper.js?${dummyData}"></script>
<script type="text/javascript" src="/js/dataTablesSource/clip/clipDetailDataTableSource.js?${dummyData}"></script>
<script type="text/javascript" src="/js/code/clip/clipCodeList.js?${dummyData}"></script>
<script type="text/javascript" src="/js/util/memberUtil.js?${dummyData}"></script>

<script type="text/javascript">
    var clipNo = "<%=in_clipNo%>";

    var dateTime = new Date();
    dateTime = moment(dateTime).format("YYYY.MM.DD");
    var week = ['일', '월', '화', '수', '목', '금', '토'];
    var toDay = week[moment(new Date()).day()];
    setTimeDate(dateTime);

    $(function(){
        $("#isChoiceDateArea").append(util.getCommonCodeRadio(-1, clip_isChoiceDate));
        $("#slctTypeArea").append(util.getCommonCodeRadio(-1, clip_slctType));
        // $("#slctTypeArea").find("input:radio[name='slctType'][value='3']").parent().attr('style', 'display:none !important');

        $("#search_platform_aria").html(util.getCommonCodeSelect(-1, clip_platform));
        $("#search_aria").html(util.getCommonCodeSelect(-1, clip_searchType_clipDetail));

        $('input[id="txt_search"]').keydown(function() {
            if (event.keyCode === 13) {
                $("#bt_search").click();
            };
        });

        $('#onedayDate').datepicker("onedayDate", new Date()).on('changeDate', function(dateText, inst){
            var selectDate = moment(dateText.date).format("YYYY.MM.DD");
            $("#startDate").val(selectDate);
            $("#endDate").val(selectDate);
        });

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

        // setRangeDatepicker(moment().format("YYYY.MM.01"), moment())
        setRangeDatepicker(moment(), moment())

        $("#tab_clipInfo").click();

    });

    function setRangeDatepicker(startDate, endDate){
        $('#rangeDate').daterangepicker({
            startDate: startDate,
            endDate: endDate
        }, function(startDate,endDate){
            $("#startDate").val(moment(startDate).format("YYYY.MM.DD"));
            $("#endDate").val(moment(endDate).format("YYYY.MM.DD"));
            $("#displayDate").val($("#startDate").val() + ' - ' + $("#endDate").val());
            $("#bt_search").click();
        });
    }

    function setTimeDate(dateTime){
        $("#onedayDate").val(dateTime);
        $("#startDate").val(dateTime);
        $("#endDate").val(dateTime);
        $("._searchDate").html(dateTime + " (" + toDay + ")");
    }
    function setRangeDate(displayDate, startDate, endDate){
        $("#startDate").val(startDate);
        $("#endDate").val(endDate);
        $("#onedayDate").val(startDate);
        $("#monthDate").val(startDate.substr(0,7));
        $("#yearDate").val(startDate.substr(0,4));
    }

    $(document).on('change', 'input[name="slctType"]', function(){
        radioChange();
        $("#bt_search").click();
    });

    $(document).on('change', 'input[name="isChoiceDate"]', function(){
        var type = $(this).val();

        if(type == -1){ // 전체
            $(".date").hide();
        }else{
            radioChange();
        }

        $("#bt_search").click();
    });

    $(document).on('click', '#search_testId', function(){
        $("#bt_search").click();
    });



    $(document).on('click', '._prevSearch', function(){
        searchDate('prev');
    });

    $(document).on('click', '._nextSearch', function(){
        searchDate('next');
    });

    $(document).on('click', '._todaySearch', function(){
        if(tabId == 'tab_total'){
            toDay = week[moment(new Date()).day()];
            $("input:radio[name='slctType']:radio[value='0']").prop('checked', true);
            setTimeDate(dateTime);
        }else if(tabId == 'tab_history'){
            $("input:radio[name='slctType']:radio[value='0']").prop('checked', true);
            setTimeDate(dateTime);
        }else if(tabId == 'tab_notice'){
            $("input:radio[name='slctType']:radio[value='1']").prop('checked', true);
        }
        radioChange();
        $("#bt_search").click();
    });

    function radioChange(){
        if($('input[name="isChoiceDate"]:checked').val() == -1){
            $("#oneDayDatePicker").hide();
            $("#monthDatepicker").hide();
            $("#yearDatepicker").hide();
            $("#rangeDatepicker").hide();
            $("#startDate").val($("#onedayDate").val());
            $("#endDate").val($("#onedayDate").val());
            return;
        }

        if($('input[name="slctType"]:checked').val() == 0){
            $("#oneDayDatePicker").show();
            $("#monthDatepicker").hide();
            $("#yearDatepicker").hide();
            $("#rangeDatepicker").hide();
            $("#startDate").val($("#onedayDate").val());
            $("#endDate").val($("#onedayDate").val());
        }else{
            if($('input[name="slctType"]:checked').val() == 1){
                // 일별 -----------------------------------
                $("#oneDayDatePicker").hide();
                $("#monthDatepicker").show();
                $("#yearDatepicker").hide();
                $("#rangeDatepicker").hide();

                var monthLastDate = new Date($("#onedayDate").val().substr(0,4),$("#onedayDate").val().substr(5,7),-1);
                $("#startDate").val($("#onedayDate").val().substr(0,8) + "01");
                $("#endDate").val($("#onedayDate").val().substr(0,8) + (monthLastDate.getDate() + 1));
                $("#monthDate").val($("#onedayDate").val().substr(0,7));

                var rangeDate = $("#monthDate").val().split(' - ');
                if(-1 < rangeDate.indexOf(' - ')){
                    $("#startDate").val(rangeDate[0]);
                    $("#endDate").val(rangeDate[1]);
                };
                $("._searchDate").html(moment($("#startDate").val()).format('YYYY년 MM월'));
            }else if($('input[name="slctType"]:checked').val() == 3){
                $("#oneDayDatePicker").hide();
                $("#monthDatepicker").hide();
                $("#yearDatepicker").hide();
                $("#rangeDatepicker").show();

                $("#startDate").val(moment(new Date()).format('YYYY.MM.DD'));
                $("#endDate").val(moment(new Date()).format('YYYY.MM.DD'));
                $("#rangeDate").val($("#startDate").val() + ' - ' + $("#endDate").val());
                setRangeDatepicker($("#startDate").val(), $("#endDate").val());

                var rangeDate = $("#rangeDate").val().split(' - ');
                if(-1 < rangeDate.indexOf(' - ')){
                    $("#startDate").val(rangeDate[0]);
                    $("#endDate").val(rangeDate[1]);
                }

                $("._searchDate").html($("#startDate").val() + ' - ' + $("#endDate").val());
            }else{
                // 월별 ----------------------------------
                $("#oneDayDatePicker").hide();
                $("#monthDatepicker").hide();
                $("#yearDatepicker").show();

                var yearDate = new Date();
                $("#startDate").val(yearDate.getFullYear() + '.01.01');
                $("#endDate").val(yearDate.getFullYear() + ".12.31");
                $("#yearDate").val(yearDate.getFullYear());
                $("._searchDate").html(moment($("#startDate").val()).format('YYYY년'));
            }
        }
    }

    function searchDate(dateType){
        if($('input[name="slctType"]:checked').val() == 0){ //시간별 , 일간
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
        }else if($('input[name="slctType"]:checked').val() == 1){ // 월간
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
        }else if($('input[name="slctType"]:checked').val() == 2){ // 연간
            if(common.isEmpty(dateType)){
                $("#startDate").val(moment(new Date()).format('YYYY.01.01'));
                $("#endDate").val(moment(new Date()).format('YYYY.MM.DD'));
                $("._searchDate").html(moment(new Date()).format('YYYY년'));
                $("#yearDate").val(moment(new Date()).format('YYYY'));
            }else if(dateType == 'prev'){
                setYear(-1);

            }else if(dateType == 'next'){
                setYear(1);
            }
        }else if($('input[name="slctType"]:checked').val() == 3){ // PUSH 발송 이력 달력
            if(common.isEmpty(dateType)){
                $("#startDate").val(moment(new Date()).format('YYYY.MM.01'));
                $("#endDate").val(moment(new Date()).format('YYYY.MM.DD'));
                $("._searchDate").html(moment(new Date()).format('YYYY.MM.DD') + " (" + toDay + ")");
                $("#displayDate").val($("#startDate").val() + ' - ' + $("#endDate").val());
            }else if(dateType == 'prev'){
                setRangeDay(-1);
            }else if(dateType == 'next'){
                setRangeDay(1);
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

    function setRangeDay(days){
        $("#startDate").val(moment($("#startDate").val()).add('days', days).format('YYYY.MM.DD'));
        $("#endDate").val(moment($("#endDate").val()).add('days', days).format('YYYY.MM.DD'));

        setRangeDatepicker($("#startDate").val(), $("#endDate").val())

        $("._searchDate").html($("#startDate").val() + ' - ' + $("#endDate").val());
        $("#rangeDate").val($("#startDate").val() + ' - ' + $("#endDate").val());
    }

    // var slctType = 0;
    // function prevNext(isPrev){
    //     slctType = $('input[name="slctType"]:checked').val();
    //     var targetDate = statUtil.getStatTimeDate($("#startDate").val(), stat_searchType, slctType, isPrev);
    //     var addDate = isPrev ? -1 : 1;
    //
    //     toDay = week[moment($("#startDate").val()).add('days', addDate).day()];
    //
    //     if(slctType == 0){
    //         setTimeDate(targetDate);
    //     }else if(slctType == 1){
    //         $("#startDate").val(moment($("#startDate").val()).add("months", addDate).format('YYYY.MM.DD'));
    //         var monthLastDate = new Date($("#startDate").val().substr(0,4),$("#startDate").val().substr(5,7),-1);
    //         $("#endDate").val($("#startDate").val().substr(0,8) +(monthLastDate.getDate() + 1));
    //         setRangeDate(targetDate, $("#startDate").val(), $("#endDate").val());
    //     }else if(slctType == 2){
    //         $("#startDate").val(moment($("#startDate").val()).add("years", addDate).format('YYYY.MM.DD'));
    //         $("#endDate").val(moment($("#endDate").val()).add("years", addDate).format('YYYY.MM.DD'));
    //         setRangeDate(targetDate, $("#startDate").val(), $("#endDate").val());
    //     }
    //     $("#bt_search").click();
    // }

    // function searchDate(dateType){
    //     var slctType = $('input[name="slctType"]:checked').val();
    //     if(slctType == 0){
    //         if(common.isEmpty(dateType)){
    //             $("#startDate").val(moment(new Date()).format('YYYY.MM.DD'));
    //             $("#endDate").val(moment(new Date()).format('YYYY.MM.DD'));
    //
    //             $("._searchDate").html(moment(new Date()).format('YYYY.MM.DD'));
    //         }else if(dateType == 'prev'){
    //             setDay(-1);
    //         }else{
    //             setDay(1);
    //         }
    //     }else if(slctType == 1){
    //         if(common.isEmpty(dateType)){
    //             $("#startDate").val(moment(new Date()).format('YYYY.MM.01'));
    //             $("#endDate").val(moment(moment(new Date()).format('YYYY.MM.01')).add('months', 1).add('days', -1).format('YYYY.MM.DD'));
    //             $("._searchDate").html(moment(new Date()).format('YYYY년 MM월'));
    //             $("#displayDate").val($("#startDate").val() + ' - ' + $("#endDate").val());
    //         }else if(dateType == 'prev'){
    //             setMonth(-1);
    //         }else if(dateType == 'next'){
    //             setMonth(1);
    //         }
    //     }else{
    //         if(common.isEmpty(dateType)){
    //             $("#startDate").val(moment(new Date()).format('YYYY.01.01'));
    //             $("#endDate").val(moment(new Date()).format('YYYY.12.31'));
    //             $("._searchDate").html(moment(new Date()).format('YYYY년'));
    //             $("#displayDate").val($("#startDate").val() + ' - ' + $("#endDate").val());
    //         }else if(dateType == 'prev'){
    //             setYear(-1);
    //         }else if(dateType == 'next'){
    //             setYear(1);
    //         }
    //     }
    //     $("#bt_search").click();
    // }

    // function setDay(days){
    //     toDay = week[moment($("#startDate").val()).add('days', days).day()];
    //     $("#startDate").val(moment($("#startDate").val()).add('days', days).format('YYYY.MM.DD'));
    //     $("#endDate").val($("#startDate").val());
    //     $("._searchDate").html($("#startDate").val());
    //     $("#onedayDate").val($("#startDate").val());
    // }
    //
    // function setMonth(months){
    //     $("#startDate").val(moment($("#startDate").val()).add('months', months).format('YYYY.MM.01'));
    //     $("#endDate").val(moment($("#startDate").val()).add('months', 1).add('days', -1).format('YYYY.MM.DD'));
    //     $("._searchDate").html(moment($("#startDate").val()).format('YYYY년 MM월'));
    //     $("#displayDate").val($("#startDate").val() + " - " + $("#endDate").val());
    // }
    //
    // function setYear(years){
    //     $("#startDate").val(moment($("#startDate").val()).add('years', years).format('YYYY.01.01'));
    //     $("#endDate").val(moment($("#startDate").val()).add('years', 1).add('days', -1).format('YYYY.12.31'));
    //     $("._searchDate").html(moment($("#startDate").val()).format('YYYY년'));
    //     $("#displayDate").val($("#startDate").val() + " - " + $("#endDate").val());
    // }


</script>
