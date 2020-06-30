<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="wrapper">
    <div id="page-wrapper">
        <div id="container-fluid">
            <%@ include file="/WEB-INF/view/content/event/attendance/attendanceTab.jsp"%>

            <div class="widget widget-table mb10">
                <div class="widget-header">
                    <h3><i class="fa fa-table"></i> 2020-06-30 기준</h3>
                </div>
                <div class="col-md-12 no-padding">
                    <div class="widget-content mt10 no-padding ml10 mr10">
                        <table class="table table-bordered">
                            <colgroup>
                                <col width="10%"><col width="10%"><col width="10%"><col width="10%"><col width="10%">
                                <col width="10%"><col width="10%"><col width="10%"><col width="10%"><col width="10%">
                            </colgroup>
                            <thead>
                                <tr>
                                    <th>구분</th>
                                    <th>로그인 수</th>
                                    <th>참여자 수</th>
                                    <th>참여비율</th>
                                    <th>남성</th>
                                    <th>여성</th>
                                    <th>알 수 없음</th>
                                    <th>참여 건수</th>
                                    <th>경험치</th>
                                    <th>달</th>
                                </tr>
                            </thead>
                            <tbody id="loginLiveTableBody">
                                <tr class="today_summary">
                                    <th>오늘</th>
                                    <td class="loginCnt">0</td>
                                    <td class="joinCnt">0</td>
                                    <td class="joinRate">0</td>
                                    <td class="sex_man">0</td>
                                    <td class="sex_female">0</td>
                                    <td class="sex_unknown">0</td>
                                    <td class="sex_joinSum">0</td>
                                    <td class="expSum">0</td>
                                    <td class="dalSum">0</td>
                                </tr>
                                <tr class="yesterday_summary">
                                    <th>전일</th>
                                    <td class="loginCnt">0</td>
                                    <td class="joinCnt">0</td>
                                    <td class="joinRate">0</td>
                                    <td class="sex_man">0</td>
                                    <td class="sex_female">0</td>
                                    <td class="sex_unknown">0</td>
                                    <td class="sex_joinSum">0</td>
                                    <td class="expSum">0</td>
                                    <td class="dalSum">0</td>
                                </tr>
                                <tr class="thisWeek_summary">
                                    <th>이번주</th>
                                    <td class="loginCnt">0</td>
                                    <td class="joinCnt">0</td>
                                    <td class="joinRate">0</td>
                                    <td class="sex_man">0</td>
                                    <td class="sex_female">0</td>
                                    <td class="sex_unknown">0</td>
                                    <td class="sex_joinSum">0</td>
                                    <td class="expSum">0</td>
                                    <td class="dalSum">0</td>
                                </tr>
                                <tr class="prevWeek_summary">
                                    <th>지난주</th>
                                    <td class="loginCnt">0</td>
                                    <td class="joinCnt">0</td>
                                    <td class="joinRate">0</td>
                                    <td class="sex_man">0</td>
                                    <td class="sex_female">0</td>
                                    <td class="sex_unknown">0</td>
                                    <td class="sex_joinSum">0</td>
                                    <td class="expSum">0</td>
                                    <td class="dalSum">0</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div class="widget">
                <div class="widget-header mb10">
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
            , index : param.index
            , joinMem : 0
            , sex_man : 0
            , sex_female : 0
            , sex_unknown : 0
            , joinCnt : 0
            , joinSum : 0
            , expSum : 0
            , dalSum : 0
        }

        if(!common.isEmpty(response.data)){
            response.data.forEach(function(info){
                weekTotal.joinCnt = Number(info.joinCnt);

                weekTotal.sex_man += Number(info.sex_man);
                weekTotal.sex_female += Number(info.sex_female);
                weekTotal.sex_unknown += Number(info.sex_unknown);
                weekTotal.joinSum += Number(info.joinSum);
                weekTotal.expSum += Number(info.expSum);
                weekTotal.dalSum += Number(info.dalSum);
            });
        }

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
            center: 'prev, title, next',
            right: 'today'
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
                    response.data.forEach(function(info){
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

</script>


<script type="text/x-handlebars-template" id="tmp_calendarData">
    <div>참여자 수 : {{joinSum}} 명</div>
    <div>남성 : {{sex_man}} 명</div>
    <div>여성 : {{sex_female}} 명</div>
    <div>알수없음 : {{sex_unknown}} 명</div>
    <div>참여건수 : {{joinSum}} 명</div>
    <div>경험치 : {{expSum}} exp</div>
    <div>달 : {{dalSum}} 개</div>
</script>

<script type="text/x-handlebars-template" id="tmp_weekCalendarData">
    <div style="font-weight:bold">{{month}}월 {{math index '+' 1}}주차</div>
    <div>참여자 수 : {{joinCnt}} 명</div>
    <div>남성 : {{sex_man}} 명</div>
    <div>여성 : {{sex_female}} 명</div>
    <div>알수없음 : {{sex_unknown}} 명</div>
    <div>참여건수 : {{joinSum}} 명</div>
    <div>경험치 : {{expSum}} exp</div>
    <div>달 : {{dalSum}} 개</div>
</script>

