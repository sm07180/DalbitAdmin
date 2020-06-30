<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="wrapper">

    <!-- BOTTOM: LEFT NAV AND RIGHT MAIN CONTENT -->
    <div class="bottom">
        <div class="container">
            <div class="row">
                <!-- content-wrapper -->
                <div class="col-md-10 content-wrapper">
                    <!-- main -->
                    <div class="content">
                        <div class="main-header">
                            <h2>Calendar</h2>
                        </div>

                        <div class="main-content">
                            <!-- WIDGET CALENDAR -->
                            <div class="widget">
                                <div class="widget-header">
                                    <h3><i class="fa fa-calendar"></i> Calendar</h3>
                                </div>
                                <div class="widget-content">
                                    <div class="calendar"></div>
                                </div>
                            </div>
                            <!-- END WIDGET CALENDAR -->

                        </div>
                        <!-- /main-content -->
                    </div>
                    <!-- /main -->
                </div>
                <!-- /content-wrapper -->
            </div>
            <!-- /row -->
        </div>
        <!-- /container -->
    </div>
    <!-- END BOTTOM: LEFT NAV AND RIGHT MAIN CONTENT -->
</div>
<!-- /wrapper -->


<!-- Javascript -->
<script src="/template/js/plugins/fullcalendar/fullcalendar.js"></script>
<script src="/template/js/plugins/jquery-simplecolorpicker/jquery.simplecolorpicker.js"></script>
<script type="text/javascript">

    $(function(){
       //getAttendanceList();
    });

    function getAttendanceWeek(startDate, endDate, index){
        var data = {
            search_startDate : startDate
            , search_endDate : endDate
            , index : index
        }
        util.getAjaxData("getCalendarWeekSum", "/rest/content/event/attendance/calendar/list", data, getCalendarWeek_success);
    }

    function getCalendarWeek_success(dst_id, response, param) {
        var weekTotal = {
            joinMem : 0
            , sex_man : 0
            , sex_famale : 0
            , sex_unknown : 0
            , joinSum : 0
            , expSum : 0
            , dalSum : 0
        }
        if(!common.isEmpty(response.data)){
            response.data.forEach(function(info){
                weekTotal.joinSum += Number(info.joinSum);
                weekTotal.sex_man += Number(info.sex_man);
                weekTotal.sex_famale += Number(info.sex_famale);
                weekTotal.sex_unknown += Number(info.sex_unknown);
                weekTotal.joinSum += Number(info.joinSum);
                weekTotal.expSum += Number(info.expSum);
                weekTotal.dalSum += Number(info.dalSum);
            });
        }
        console.log(param);
        //console.log(weekTotal);

        var weekTarget = $('.fc-week:eq('+param.index+')').find('.fc-day-content:last');
        weekTarget.html('6월 '+(param.index + 1)+'주차' );

        var template = $('#tmp_calendarData').html();
        var templateScript = Handlebars.compile(template);
        var context = weekTotal;
        var html=templateScript(context);

        weekTarget.append(html);


    }

    $('.calendar').fullCalendar({
        header: {
            left: 'month, agendaWeek, agendaDay',
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
                    console.log('response');
                    console.log(response);
                    var data = response.data;
                    data.forEach(function(info){
                        var dayTarget = $('.fc-day[data-date="'+info.the_date+'"]');
                        calendarRenderEvent('1.참여자 수: ' + common.addComma(info.joinSum), info.the_date, '#b64e1d');
                        calendarRenderEvent('3.남성 : ' + common.addComma(info.sex_men), info.the_date, '#b64e1d');
                        calendarRenderEvent('4.여성 : ' + common.addComma(info.sex_female), info.the_date, '#b64e1d');
                        calendarRenderEvent('5.알수없음 : ' + common.addComma(info.sex_unknown), info.the_date, '#b64e1d');
                        calendarRenderEvent('6.참여 건수: ' + common.addComma(info.joinSum), info.the_date, '#b64e1d');
                        calendarRenderEvent('7.경험치 : ' + common.addComma(info.expSum), info.the_date, '#b64e1d');
                        calendarRenderEvent('8.달 : ' + common.addComma(info.dalSum), info.the_date, '#b64e1d');
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
    <div>참여자 수 : {{joinSum}}</div>
    <div>남성 : {{sex_man}}</div>
    <div>여성 : {{sex_famale}}</div>
    <div>알수없음 : {{sex_unknown}}</div>
    <div>참여건수 : {{joinSum}}</div>
    <div>경험치 : {{expSum}}</div>
    <div>달 : {{dalSum}}</div>
</script>

