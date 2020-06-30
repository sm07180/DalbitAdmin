<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="wrapper">
    <div id="page-wrapper">
        <div id="container-fluid">
            <%@ include file="/WEB-INF/view/content/event/attendance/attendanceTab.jsp"%>
            <div class="widget">
                <div class="widget-header">
                    <h3><i class="fa fa-calendar"></i> 출석체크 이벤트 현황</h3>
                </div>
                <div class="widget-content">
                    <div class="calendar"></div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- /wrapper -->


<!-- Javascript -->
<script src="/template/js/plugins/fullcalendar/fullcalendar.js"></script>
<script src="/template/js/plugins/jquery-simplecolorpicker/jquery.simplecolorpicker.js"></script>
<script type="text/javascript">

    function getAttendanceWeek(startDate, endDate, index){
        var data = {
            search_startDate : startDate
            , search_endDate : endDate
            , index : index
        }
        util.getAjaxData("getCalendarWeekSum", "/rest/content/event/attendance/calendar/list", data, getCalendarWeek_success);
    }

    function getCalendarWeek_success(dst_id, response, param) {

        var date = $(".calendar").fullCalendar('getDate');
        var month_int = date.getMonth() + 1;

        var weekTotal = {
            month : month_int
            , index : 0
            , joinMem : 0
            , sex_man : 0
            , sex_famale : 0
            , sex_unknown : 0
            , joinSum : 0
            , expSum : 0
            , dalSum : 0
        }

        if(!common.isEmpty(response.data)){
            weekTotal.index = param.index;
            response.data.forEach(function(info){
                weekTotal.joinSum += Number(info.joinSum);
                weekTotal.sex_man += Number(info.sex_man);
                weekTotal.sex_famale += Number(info.sex_famale);
                weekTotal.sex_unknown += Number(info.sex_unknown);
                //weekTotal.joinSum += Number(info.joinSum);
                weekTotal.expSum += Number(info.expSum);
                weekTotal.dalSum += Number(info.dalSum);
            });
        }
        console.log(param);

        var weekTarget = $('.fc-week:eq('+param.index+')').find('.fc-day-content:last');
        var template = $('#tmp_weekCalendarData').html();
        var templateScript = Handlebars.compile(template);
        var context = weekTotal;
        var html=templateScript(context);

        weekTarget.append(html);

    }

    $('.calendar').fullCalendar({
        header: {
            //left: 'month, agendaWeek, agendaDay',
            left: '',
            center: 'title',
            right: 'prev, next, today'
        },
        events: function(start, end, timezone, callback) {
            $.ajax({
                url: '/rest/content/event/attendance/calendar/list',
                type: 'post',
                dataType: 'json',
                data: {
                    // our hypothetical feed requires UNIX timestamps
                    search_startDate : $('td.fc-day:first').data('date'),
                    search_endDate: $('td.fc-day:last').data('date')
                },
                success: function(response) {
                    var data = response.data;
                    data.forEach(function(info){
                        var dayTarget = $('.fc-day[data-date="'+info.the_date+'"]').find('.fc-day-content');
                        var template = $('#tmp_calendarData').html();
                        var templateScript = Handlebars.compile(template);
                        var context = info;
                        var html=templateScript(context);
                        dayTarget.append(html);

                    });

                    //주별 합계 구하기
                    $('tr.fc-week').each(function(){
                        var week = $(this);
                        var startDate = week.find('td.fc-day:first').data('date');
                        var endDate = week.find('td.fc-day:last').data('date');
                        var index = $('tr.fc-week').index(week);
                        getAttendanceWeek(startDate, endDate, index);
                    });
                }
            });
        }
    });

    function calendarRenderEvent(title, start, color){
        $('.calendar').fullCalendar('renderEvent', {
            title: title,
            start: start,
            allDay: true,
            color : color,
        });
    }

</script>


<script type="text/x-handlebars-template" id="tmp_calendarData">
    <div>참여자 수 : {{joinSum}} 명</div>
    <div>남성 : {{sex_man}} 명</div>
    <div>여성 : {{sex_famale}} 명</div>
    <div>알수없음 : {{sex_unknown}} 명</div>
    <div>참여건수 : {{joinSum}} 명</div>
    <div>경험치 : {{expSum}} exp</div>
    <div>달 : {{dalSum}} 개</div>
</script>

<script type="text/x-handlebars-template" id="tmp_weekCalendarData">
    <div style="font-weight:bold">{{month}}월 {{math index '+' 1}}주차</div>
    <div>참여자 수 : {{joinSum}} 명</div>
    <div>남성 : {{sex_man}} 명</div>
    <div>여성 : {{sex_famale}} 명</div>
    <div>알수없음 : {{sex_unknown}} 명</div>
    <div>참여건수 : {{joinSum}} 명</div>
    <div>경험치 : {{expSum}} exp</div>
    <div>달 : {{dalSum}} 개</div>
</script>

