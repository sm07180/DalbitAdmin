<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="wrapper">
    <div id="page-wrapper">
        <div id="container-fluid">
            <%@ include file="/WEB-INF/view/content/event/roulette/rouletteTab.jsp"%>

            <div class="widget widget-table mb10">
                <div class="widget-header">
                    <h3><i class="fa fa-table"></i> <span id="summary_today"></span> 기준</h3>
                </div>
                <div class="col-md-12 no-padding">
                    <div class="widget-content mt10 no-padding ml10 mr10">
                        <table class="table table-bordered">
                            <colgroup>
                                <col width="5%">
                                <col width="5%">
                                <col width="5%">
                                <col width="5%">
                                <col width="5%">
                                <col width="5%">
                                <col width="5%">
                                <col width="5%">
                                <col width="5%">
                                <col width="5%">
                                <col width="5%">
                                <col width="5%">
                                <col width="5%">
                                <col width="5%">
                                <col width="5%">
                                <col width="5%">
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
                                    <th>꽝</th>
                                    <th>달 A</th>
                                    <th>달 B</th>
                                    <th>상품 A</th>
                                    <th>상품 B</th>
                                    <th>상품 C</th>
                                    <th>상품 D</th>
                                    <th>상품 E</th>
                                </tr>
                            </thead>
                            <tbody id="loginLiveTableBody">
                                <tr class="today_summary">
                                    <th>오늘</th>
                                    <td class="loginCnt">0명</td>
                                    <td class="joinCnt">0명</td>
                                    <td class="joinRate" style="color:red;">0%</td>
                                    <td class="sex_man">0명</td>
                                    <td class="sex_female">0명</td>
                                    <td class="sex_unknown">0명</td>
                                    <td class="joinSum">0건</td>
                                    <td class="expSum">0exp</td>
                                    <td class="dalSum">0달</td>
                                    <td class="dalSum">0달</td>
                                    <td class="dalSum">0달</td>
                                    <td class="dalSum">0달</td>
                                    <td class="dalSum">0달</td>
                                    <td class="dalSum">0달</td>
                                    <td class="dalSum">0달</td>
                                </tr>
                                <tr class="yesterday_summary">
                                    <th>전일</th>
                                    <td class="loginCnt">0명</td>
                                    <td class="joinCnt">0명</td>
                                    <td class="joinRate" style="color:red;">0%</td>
                                    <td class="sex_man">0명</td>
                                    <td class="sex_female">0명</td>
                                    <td class="sex_unknown">0명</td>
                                    <td class="joinSum">0건</td>
                                    <td class="expSum">0exp</td>
                                    <td class="dalSum">0달</td>
                                    <td class="dalSum">0달</td>
                                    <td class="dalSum">0달</td>
                                    <td class="dalSum">0달</td>
                                    <td class="dalSum">0달</td>
                                    <td class="dalSum">0달</td>
                                    <td class="dalSum">0달</td>
                                </tr>
                                <tr class="thisWeek_summary">
                                    <th>이번주</th>
                                    <td class="loginCnt">0명</td>
                                    <td class="joinCnt">0명</td>
                                    <td class="joinRate" style="color:red;">0%</td>
                                    <td class="sex_man">0명</td>
                                    <td class="sex_female">0명</td>
                                    <td class="sex_unknown">0명</td>
                                    <td class="joinSum">0건</td>
                                    <td class="expSum">0exp</td>
                                    <td class="dalSum">0달</td>
                                    <td class="dalSum">0달</td>
                                    <td class="dalSum">0달</td>
                                    <td class="dalSum">0달</td>
                                    <td class="dalSum">0달</td>
                                    <td class="dalSum">0달</td>
                                    <td class="dalSum">0달</td>
                                </tr>
                                <tr class="prevWeek_summary">
                                    <th>지난주</th>
                                    <td class="loginCnt">0명</td>
                                    <td class="joinCnt">0명</td>
                                    <td class="joinRate" style="color:red;">0%</td>
                                    <td class="sex_man">0명</td>
                                    <td class="sex_female">0명</td>
                                    <td class="sex_unknown">0명</td>
                                    <td class="joinSum">0건</td>
                                    <td class="expSum">0exp</td>
                                    <td class="dalSum">0달</td>
                                    <td class="dalSum">0달</td>
                                    <td class="dalSum">0달</td>
                                    <td class="dalSum">0달</td>
                                    <td class="dalSum">0달</td>
                                    <td class="dalSum">0달</td>
                                    <td class="dalSum">0달</td>
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

    $(function(){
        init();
    });

    function init(){
        $("#summary_today").html(moment(new Date()).format('YYYY-MM-DD'));

        getSummary();
    }

    function getSummary(){
        util.getAjaxData("today_summary" , "/rest/content/event/attendance/calendar/week"
            , {
                search_startDate : moment(new Date()).format('YYYY-MM-DD')
                , search_endDate : moment(new Date()).format('YYYY-MM-DD')
            }
            , getSummary_success);

        util.getAjaxData("yesterday_summary" , "/rest/content/event/attendance/calendar/week"
            , {
                search_startDate : moment(new Date()).add('days', -1).format('YYYY-MM-DD')
                , search_endDate : moment(new Date()).add('days', -1).format('YYYY-MM-DD')
            }
            , getSummary_success);

        var thisWeekStartDate = moment().startOf('week').add('days', 1).format('YYYY-MM-DD');
        util.getAjaxData("thisWeek_summary" , "/rest/content/event/attendance/calendar/week"
            , {
                search_startDate : thisWeekStartDate
                , search_endDate : moment(thisWeekStartDate).add('days', 6).format('YYYY-MM-DD')
            }
            , getSummary_success);

        var prevWeekStartDate = moment().startOf('week').add('days', -6).format('YYYY-MM-DD')
        util.getAjaxData("prevWeek_summary" , "/rest/content/event/attendance/calendar/week"
            , {
                search_startDate : moment().startOf('week').add('days', -6).format('YYYY-MM-DD')
                , search_endDate : moment(prevWeekStartDate).add('days', 6).format('YYYY-MM-DD')
            }
            , getSummary_success);
    }

    function getSummary_success(dst_id, response, param){
        var data = response.data;
        var target = $("#loginLiveTableBody").find('.'+dst_id);
        target.find('.loginCnt').html(common.addComma(data.loginCnt) + '명');
        target.find('.joinCnt').html(common.addComma(data.joinCnt) + '명');

        var loginCnt = common.isEmpty(data.loginCnt) ? 0 : data.loginCnt;
        var joinCnt = common.isEmpty(data.joinCnt) ? 0 : data.joinCnt;

        var joinRate = joinCnt == 0 ? 0 : (joinCnt / loginCnt * 100).toFixed(1);

        target.find('.joinRate').html(joinRate + "%");
        target.find('.sex_man').html(common.addComma(data.sex_man) + '명');
        target.find('.sex_female').html(common.addComma(data.sex_female) + '명');
        target.find('.sex_unknown').html(common.addComma(data.sex_unknown) + '명');
        target.find('.joinSum').html(common.addComma(data.joinSum) + '건');
        target.find('.expSum').html(common.addComma(data.expSum) + 'exp');
        target.find('.dalSum').html(common.addComma(data.dalSum) + '개');
    }

    function getAttendanceWeek(startDate, endDate, index){
        var data = {
            search_startDate : startDate
            , search_endDate : endDate
            , index : index
        }
        util.getAjaxData("getCalendarWeekSum", "/rest/content/event/attendance/calendar/week", data, getCalendarWeek_success);
    }

    function getCalendarWeek_success(dst_id, response, param) {

        var date = $(".calendar").fullCalendar('getDate');
        var month_int = date.getMonth() + 1;

        var weekTotal = {
            month : month_int
            , index : param.index
            , loginCnt : 0
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
            weekTotal.loginCnt = response.data.loginCnt;
            weekTotal.joinCnt = response.data.joinCnt;
            weekTotal.sex_man = response.data.sex_man;
            weekTotal.sex_female += response.data.sex_female;
            weekTotal.sex_unknown += response.data.sex_unknown;
            weekTotal.joinSum += response.data.joinSum;
            weekTotal.expSum += response.data.expSum;
            weekTotal.dalSum += response.data.dalSum;
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

        firstDay: 1, //월요일부터 시작
        showTotal: true, //합계 노출여부

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

