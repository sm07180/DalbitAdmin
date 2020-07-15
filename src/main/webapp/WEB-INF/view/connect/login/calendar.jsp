<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="wrapper">
    <div id="page-wrapper">
        <div id="container-fluid">
            <div class="widget-content">
                <div class="calendar"></div>
            </div>
        </div>
    </div>
</div>
<!-- /wrapper -->


<!-- Javascript -->
<script src="/template/js/plugins/fullcalendar/fullcalendar.js"></script>
<script src="/template/js/plugins/jquery-simplecolorpicker/jquery.simplecolorpicker.js"></script>
<script type="text/javascript">

    $(function(){
        init();
    });

    function init(){
        $("#summary_today").html(moment(new Date()).format('YYYY-MM-DD'));

    }

    // function getAttendanceWeek(startDate, endDate, index){
    //     var data = {
    //         search_startDate : startDate
    //         , search_endDate : endDate
    //         , index : index
    //     }
    //     util.getAjaxData("getCalendarWeekSum", "/rest/content/event/attendance/calendar/week", data, getCalendarWeek_success);
    // }

    // function getCalendarWeek_success(dst_id, response, param) {
    //
    //     var date = $(".calendar").fullCalendar('getDate');
    //     var month_int = date.getMonth() + 1;
    //
    //     var weekTotal = {
    //         month : month_int
    //         , index : param.index
    //         , loginCnt : 0
    //         , joinMem : 0
    //         , sex_man : 0
    //         , sex_female : 0
    //         , sex_unknown : 0
    //         , joinCnt : 0
    //         , joinSum : 0
    //         , expSum : 0
    //         , dalSum : 0
    //     }
    //
    //     if(!common.isEmpty(response.data)){
    //         weekTotal.loginCnt = response.data.loginCnt;
    //         weekTotal.joinCnt = response.data.joinCnt;
    //         weekTotal.sex_man = response.data.sex_man;
    //         weekTotal.sex_female += response.data.sex_female;
    //         weekTotal.sex_unknown += response.data.sex_unknown;
    //         weekTotal.joinSum += response.data.joinSum;
    //         weekTotal.expSum += response.data.expSum;
    //         weekTotal.dalSum += response.data.dalSum;
    //     }
    //
    //     var weekTarget = $('.fc-week:eq('+param.index+')').find('.fc-day-content:last');
    //     var template = $('#tmp_weekCalendarData').html();
    //     var templateScript = Handlebars.compile(template);
    //     var context = weekTotal;
    //     var html=templateScript(context);
    //
    //     weekTarget.append(html);
    //
    // }

    $('.calendar').fullCalendar({
        header: {
            //left: 'month, agendaWeek, agendaDay',
            left: '',
            center: 'prev, title, next',
            right: 'today'
        },
        events: function(start, end, timezone, callback) {
            $.ajax({
                url: '/rest/content/event/attendance/calendar/list',
                type: 'post',
                dataType: 'json',
                data: {
                    search_startDate : $('td.fc-day:first').data('date'),
                    search_endDate: $('td.fc-day:last').data('date')
                },
                success: function(response) {

                    // console.log('response');
                    // console.log(response);
                    response.data.forEach(function(info){
                        var dayTarget = $('.fc-day[data-date="'+info.the_date+'"]').find('.fc-day-content');
                        var template = $('#tmp_calendarData').html();
                        var templateScript = Handlebars.compile(template);
                        var context = info;
                        var html=templateScript(context);
                        dayTarget.append(html);

                    });

                    //주별 합계 구하기
                    // $('tr.fc-week').each(function(){
                    //     var week = $(this);
                    //     var startDate = week.find('td.fc-day:first').data('date');
                    //     var endDate = week.find('td.fc-day:last').data('date');
                    //     var index = $('tr.fc-week').index(week);
                    //     getAttendanceWeek(startDate, endDate, index);
                    // });
                }
            });
        }
    });

</script>

<script type="text/x-handlebars-template" id="tmp_calendarData">
    <div>참여자 수 : {{addComma joinSum}} 명</div>
    <div>로그인 수 : {{addComma loginCnt}} 명</div>
    <div>남성 : {{addComma sex_man}} 명</div>
    <div>여성 : {{addComma sex_female}} 명</div>
    <div>알수없음 : {{addComma sex_unknown}} 명</div>
    <div>참여건수 : {{addComma joinSum}} 건</div>
    <div>경험치 : {{addComma expSum}} exp</div>
    <div>달 : {{addComma dalSum}} 개</div>
</script>

<script type="text/x-handlebars-template" id="tmp_weekCalendarData">
    <div style="font-weight:bold">{{month}}월 {{math index '+' 1}}주차</div>
    <div>참여자 수 : {{addComma joinCnt}} 명</div>
    <div>로그인 수 : {{addComma loginCnt}} 명</div>
    <div>남성 : {{addComma sex_man}} 명</div>
    <div>여성 : {{addComma sex_female}} 명</div>
    <div>알수없음 : {{addComma sex_unknown}} 명</div>
    <div>참여건수 : {{addComma joinSum}} 건</div>
    <div>경험치 : {{addComma expSum}} exp</div>
    <div>달 : {{addComma dalSum}} 개</div>
</script>

