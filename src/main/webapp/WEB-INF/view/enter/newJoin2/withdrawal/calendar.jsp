<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="wrapper">
    <div id="page-wrapper">
        <div class="col-md-12 no-padding">
            <div id='barArea'></div>
        </div>
        <div id="container-fluid">
            <div class="widget-content col-md-10">
                <div class="calendar col-md-10 no-padding"></div>
                <div class="col-md-2 no-padding" id="totalTable"></div>

            </div>
        </div>
        <div class="col-md-12 no-padding">
            <div id='lineArea'></div>
        </div>
    </div>
</div>
<!-- /wrapper -->


<!-- Javascript -->
<script src="/template/js/plugins/fullcalendar/fullcalendar.js"></script>
<script src="/template/js/plugins/jquery-simplecolorpicker/jquery.simplecolorpicker.js"></script>
<script src='https://cdn.plot.ly/plotly-latest.min.js'></script>
<script type="text/javascript">

    $(function(){
        //init();
    });

    function getCalendar(){
        $("#summary_today").html(moment(new Date()).format('YYYY-MM-DD'));
        renderCalendar();
    }

    function renderCalendar(){

        var tmp_sDate = $("#startDate").val();

        $('.calendar').fullCalendar('destroy').fullCalendar({
            header: {
                //left: 'month, agendaWeek, agendaDay',
                left: '',
                center: 'prev, title, next',
                right: 'today',
            },
            sundayFontColor:'red',
            saturdayFontColor:'blue',

            year : Number(tmp_sDate.substring(0,4)),
            month : Number(tmp_sDate.substring(5,7)) -1,

            events: function(start, end, timezone, callback) {
                $(".fc-header").hide();
                var month =  $('.fc-day').not('.fc-other-month').first().data('date').replace(/-/gi,".") + " - " + $('.fc-day').not('.fc-other-month').last().data('date').replace(/-/gi,".") + "@";

                $.ajax({
                    url: '/rest/enter/newJoin/info/calender',
                    type: 'post',
                    dataType: 'json',
                    data: {
                        dateList : month,
                        slctType : 1
                    },
                    success: function(response) {
                        console.log("[response] ------- /rest/enter/newJoin/info/calender -------");
                        console.log(response);
                        if(!common.isEmpty(response.data.detailList)){
                            response.data.detailList.forEach(function(detail, detailIndex) {
                                var the_date = detail.the_date;
                                var dayTarget = $('.fc-day[data-date="' + the_date + '"]').find('.fc-day-content');
                                var template = $('#tmp_calendarData').html();
                                var templateScript = Handlebars.compile(template);
                                var context = detail;
                                var html = templateScript(context);
                                dayTarget.append(html);
                            });
                        }

                        $("#totalTable").empty();
                        var template = $('#tmp_totalTable').html();
                        var templateScript = Handlebars.compile(template);
                        var detailContext = response.data.totalInfo;
                        var html=templateScript(detailContext);
                        $("#totalTable").append(html);
                        ui.paintColor();

                        renderChart(response);
                    }
                });
            }
        });
    }


    function renderChart(response){
        var month;

        var day = [];
        var total_join_Cnt = [];

        if(common.isEmpty(response.data)){
            $("#lineArea").empty();
            $("#barArea").empty();
            return ;
        }

        for(var i=0;i<response.data.detailList.length;i++){
            response.data.detailList[i].nowMonth = Number(moment().format("MM"));
            response.data.detailList[i].nowDay = common.lpad(Number(moment().format("DD")),2,"0");
            response.data.detailList[i].nowHour = Number(moment().format("HH"));

            response.data.detailList[i].day = response.data.detailList[i].the_date.substr(8,2);
            response.data.detailList[i].month = response.data.detailList[i].the_date.substr(5,2);
            month = response.data.detailList[i].month;

            toDay = week[moment(response.data.detailList[i].the_date.replace(/-/gi,".")).add('days', 0).day()];
            if(toDay == "토"){
                toDay = '<span class="_fontColor" data-fontColor="blue" style="color:blue">' + response.data.detailList[i].the_date.substr(5).replace(/-/gi,".") + "(" + toDay + ")" + '</span>';
            }else if(toDay == "일"){
                toDay = '<span class="_fontColor" data-fontColor="red" style="color:red">' + response.data.detailList[i].the_date.substr(5).replace(/-/gi,".") + "(" + toDay + ")" + '</span>';
            }else{
                toDay = response.data.detailList[i].the_date.substr(5).replace(/-/gi,".") + "(" + toDay + ")";
            }
            response.data.detailList[i].date = toDay;

            day.unshift(toDay);
            total_join_Cnt.unshift(response.data.detailList[i].total_join_Cnt);

        }

        /* 막대차트 [start] */
        var trace_join_cnt = {
            x: day,
            y: total_join_Cnt,
            mode: 'lines',
            name: '<span>가입</span>',
            type : 'bar',
            marker: {
                color: '#99CCFF'
            }
        };

        var barData = [trace_join_cnt];

        var barLayout = {
            title: month+'월 일자별 - 가입자 현황',
            // height: 500,
            // width: 1300,
            yaxis: {
                range: [0, 100],
                autorange: true
            },
            barmode: 'stack'
        };

        Plotly.newPlot('barArea', barData, barLayout);
        /* 막대차트 [end] */


        /* 라인차트 [start] */
        // var trace_male_reg = {
        //     x: day,
        //     y: maleRegCnt,
        //     mode: 'lines',
        //     name: '<span style="color:blue">남성</span> 등록',
        //     line: {
        //         dash: 'solid',
        //         width: 4,
        //         color: '#99CCFF'
        //     },
        //     marker: {
        //         color: '#99CCFF'
        //     }
        // };
        //
        // var trace_male_del = {
        //     x: day,
        //     y: maledelCnt,
        //     mode: 'lines',
        //     name: '<span style="color:blue">남성</span> 삭제',
        //     line: {
        //         dash: 'dot',
        //         width: 4,
        //         color: '#99CCFF'
        //     },
        //     marker: {
        //         color: '#99CCFF'
        //     }
        //
        // };
        //
        // var trace_female_reg = {
        //     x: day,
        //     y: femaleRegCnt,
        //     mode: 'lines',
        //     name: '<span style="color:red">여성</span> 등록',
        //     line: {
        //         dash: 'solid',
        //         width: 4,
        //         color: '#FF6666'
        //     },
        //     marker: {
        //         color: '#FF6666'
        //     }
        // };
        //
        // var trace_female_del = {
        //     x: day,
        //     y: femaledelCnt,
        //     mode: 'lines',
        //     name: '<span style="color:red">여성</span> 삭제',
        //     line: {
        //         dash: 'dot',
        //         width: 4,
        //         color: '#FF6666'
        //     },
        //     marker: {
        //         color: '#FF6666'
        //     }
        // };
        //
        // var trace_none_reg = {
        //     x: day,
        //     y: noneRegCnt,
        //     mode: 'lines',
        //     name: '알수없음 등록',
        //     line: {
        //         dash: 'solid',
        //         width: 4,
        //         color: '#999999'
        //     },
        //     marker: {
        //         color: '#999999'
        //     }
        // };
        //
        // var trace_none_del = {
        //     x: day,
        //     y: nonedelCnt,
        //     mode: 'lines',
        //     name: '알수없음 삭제',
        //     line: {
        //         dash: 'dot',
        //         width: 4,
        //         color: '#999999'
        //     },
        //     marker: {
        //         color: '#999999'
        //     }
        // };
        //
        // var data = [trace_male_reg, trace_male_del, trace_female_reg, trace_female_del, trace_none_reg, trace_none_del];
        //
        // var layout = {
        //     title: month+'월 일자별 - 등록/삭제',
        //     // height: 500,
        //     // width: 1300,
        //     yaxis: {
        //         range: [0, 100],
        //         autorange: true
        //     },
        //     legend: {
        //         y: 0.5,
        //         traceorder: 'reversed',
        //         font: {
        //             size: 16
        //         }
        //     }
        // };
        //
        // Plotly.newPlot('lineArea', data, layout);
        /* 라인차트 [end] */
    }

</script>

<script type="text/x-handlebars-template" id="tmp_calendarData">
    <div class="font-bold" style="color: #ff5600;">가입 총계 : {{addComma total_join_Cnt}}</div>
    <div class="font-bold">탈퇴 총계 :{{addComma total_out_Cnt}} <br/> (탈퇴 비율 : {{average total_out_Cnt total_join_Cnt 0}}%)</div>
</script>

<script type="text/x-handlebars-template" id="tmp_totalTable">
    <table class="table table-bordered" style="width: 100%">
        <colgroup>
            <col width="33%"/><col width="33%"/><col width="33%"/>
        </colgroup>
        <tbody>
            <tr>
                <th>구분</th>
                <th>가입수</th>
                <th>탈퇴수</th>
            </tr>
            <tr class="font-bold" style="color: #ff5600">
                <td>총합</td>
                <td>{{addComma total_join_Cnt}}</td>
                <td>{{addComma total_out_Cnt}}</td>
            </tr>
            <tr>
                <td>일평균</td>
                <td>0%</td>
                <td>0%</td>
            </tr>
            <tr>
                <td>전달 대비</td>
                <td>0</td>
                <td>0</td>
            </tr>
            <tr>
                <td>가입 대비 <br/> 탈퇴 비율</td>
                <td>{{average total_join_Cnt total_out_Cnt 0}}%</td>
                <td>{{average total_out_Cnt total_join_Cnt 0}}%</td>
            </tr>
        </tbody>
    </table>
</script>