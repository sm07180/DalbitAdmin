<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="wrapper">
    <div id="page-wrapper">
        <div id="container-fluid">
            <div class="widget-content">
                <div class="calendar col-md-10 no-padding"></div>
                <div class="col-md-2 no-padding" id="totalTable"></div>
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
        //init();
    });

    function getCalendarInfo(){
        $("#summary_today").html(moment(new Date()).format('YYYY-MM-DD'));
        setTimeout(function(){
            renderCalendar();
        },160)
    }

    function renderCalendar(){
        $('.calendar').fullCalendar('destroy').fullCalendar({
            header: {
                //left: 'month, agendaWeek, agendaDay',
                left: '',
                center: 'prev, title, next',
                right: 'today',
            },
            sundayFontColor:'red',
            saturdayFontColor:'blue',
            events: function(start, end, timezone, callback) {
                var month =  $('.fc-day').not('.fc-other-month').first().data('date').replace(/-/gi,".") + " - " + $('.fc-day').not('.fc-other-month').last().data('date').replace(/-/gi,".") + "@";
                $.ajax({
                    url: '/rest/connect/login/info/total',
                    type: 'post',
                    dataType: 'json',
                    data: {
                        dateList : month,
                        slctType : 1
                    },
                    success: function(response) {
                        response.data.forEach(function(info){
                            info.detailList.forEach(function(detail, detailIndex) {
                                var the_date = moment($('.fc-day').not('.fc-other-month').first().data('date')).format('YYYY-MM-') + common.lpad(detail.day, 2, "0");
                                var dayTarget = $('.fc-day[data-date="' + the_date + '"]').find('.fc-day-content');
                                var template = $('#tmp_calendarData').html();
                                var templateScript = Handlebars.compile(template);
                                var context = detail;
                                var html = templateScript(context);
                                dayTarget.append(html);
                            });

                            $("#totalTable").empty();
                            var template = $('#tmp_totalTable').html();
                            var templateScript = Handlebars.compile(template);
                            var detailContext = info.totalInfo;
                            var html=templateScript(detailContext);
                            $("#totalTable").append(html);

                        });
                        ui.paintColor();
                    }
                });
            }
        });
    }

</script>

<script type="text/x-handlebars-template" id="tmp_calendarData">
    <div class="font-bold" style="color: black">비중복</div>
    <div style="color: blue;">{{{sexIcon 'm'}}} : {{addComma maleCnt}}({{average maleCnt totalCnt}}%)</div>
    <div style="color: red;">{{{sexIcon 'f'}}} : {{addComma femaleCnt}}({{average femaleCnt totalCnt}}%)</div>
    <div style="color: black">{{{sexIcon 'n'}}} : {{addComma noneCnt}}({{average noneCnt totalCnt}}%)</div>
    <div class="font-bold" style="color: #ff5600;">총계 : {{addComma totalCnt}} 명({{average totalCnt totalCnt}}%)</div>
</script>

<script type="text/x-handlebars-template" id="tmp_totalTable">
    <br/><br/>
    <table class="table table-bordered" style="width: 100%">
        <colgroup>
            <col width="33%"/><col width="33%"/><col width="33%"/>
        </colgroup>
        <tbody>
            <tr>
                <th>구분</th>
                <th>비중복</th>
                <th>중복</th>
            </tr>
            <tr style="color: blue">
                <td>{{{sexIcon 'm'}}}</td>
                <td>{{addComma sum_umaleCnt}}({{average sum_umaleCnt sum_utotalCnt}}%)</td>
                <td>{{addComma sum_maleCnt}}({{average sum_maleCnt sum_totalCnt}}%)</td>
            </tr>
            <tr style="color: red">
                <td>{{{sexIcon 'f'}}}</td>
                <td>{{addComma sum_ufemaleCnt}}({{average sum_ufemaleCnt sum_utotalCnt}}%)</td>
                <td>{{addComma sum_femaleCnt}}({{average sum_femaleCnt sum_totalCnt}}%)</td>
            </tr>
            <tr>
                <td>{{{sexIcon 'n'}}}</td>
                <td>{{addComma sum_unoneCnt}}({{average sum_unoneCnt sum_utotalCnt}}%)</td>
                <td>{{addComma sum_noneCnt}}({{average sum_noneCnt sum_totalCnt}}%)</td>
            </tr>
            <tr class="font-bold" style="color: #ff5600">
                <td>총합</td>
                <td>{{addComma sum_utotalCnt}}({{average sum_utotalCnt sum_utotalCnt}}%)</td>
                <td>{{addComma sum_totalCnt}}({{average sum_totalCnt sum_totalCnt}}%)</td>
            </tr>
        </tbody>
    </table>
</script>