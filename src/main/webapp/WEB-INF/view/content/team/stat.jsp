<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dummyData"><%= java.lang.Math.round(java.lang.Math.random() * 1000000) %>
</c:set>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="clearfix widget-content mb5">
                <h4 class="font-bold">팀현황</h4>

                <div class="mb10">
                    <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist">
                        <li>
                            <a href="/content/team/list">전체 팀</a>
                        </li>
                        <li class="active">
                            <a href="/content/team/stat">월간 현황</a>
                        </li>
                        <li>
                            <a href="/content/team/symbol">팀 심볼 관리</a>
                        </li>
                        <li>
                            <a href="/content/team/badge">활동배지 관리</a>
                        </li>
                    </ul>
                </div>

                <div>
                    <form id="searchForm">
                        <div class="row col-lg-12 form-inline">
                            <div class="widget widget-table searchBoxArea">
                                <table>
                                    <tr>
                                        <th rowspan="2" style="background-color:#4472c4;color:#e9ee17;width: 70px">
                                            <i class="fa fa-search"></i><br/>검색
                                            <jsp:include page="../../searchArea/daySearchFunction.jsp"/>
                                        </th>
                                        <th id="th_bottonList">
                                            <div>
                                                <div id="div_monthButton">
                                                    <jsp:include page="../../searchArea/monthSearchArea.jsp"/>
                                                </div>
                                            </div>
                                        </th>
                                    </tr>
                                    <tr>
                                        <td style="text-align: left; padding-left: 4px;">
                                            <input id="monthDate" type="text" class="form-control" style="width: 75px"
                                                   readonly/>
                                            <input class="hide" name="startDate" id="startDate" style="width: 100px">
                                            <input class="hide" name="endDate" id="endDate" style="width: 100px">
                                            <button type="button" class="btn btn-success" id="bt_search">검색</button>
                                            <a href="javascript://" class="_prevSearch">[이전]</a>
                                            <a href="javascript://" class="_todaySearch">[오늘]</a>
                                            <a href="javascript://" class="_nextSearch">[다음]</a>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </form>
                </div>
            </div>

            <div class="container no-padding clearfix">
                <div id="line-chart"></div>
            </div>

            <div class="container no-padding clearfix">
                <div id="calendar" class="calendar"></div>
            </div>
        </div> <!-- //container-fluid -->
    </div>
    <!-- //page-wrapper -->
</div>
<!-- //wrapper-->

<script src="/template/js/plugins/fullcalendar/fullcalendar.js"></script>
<script src='https://cdn.plot.ly/plotly-latest.min.js'></script>
<script type="text/javascript" src="/js/code/menu/menuCodeList.js?${dummyData}"></script>
<script type="text/javascript">
  let currentDate = moment();
  let days = [];
  let daysText = [];
  let teamCreateCnt = [];
  let teamDelCnt = [];
  let teamMemInsCnt = [];
  let teamMemDelCnt = [];

  const statEventData = (function () {
    // 캘린더 출력
    function getCalendar() {
      days = [];
      $('#line-chart').empty();
      $('#calendar').empty();

      let tmp_sDate = $("#startDate").val();
      let startDate = tmp_sDate.replace(/[.]/gi, "-");
      let selectDate = moment(startDate);
      let lastDay = parseInt(selectDate.daysInMonth(), 10);
      if (selectDate.format('MM') === currentDate.format('MM')) {
        lastDay = parseInt(currentDate.format('D'), 10);
      }
      let procDate = moment(selectDate.format('YYYY-MM') + '-01');
      for (let i=0; i < lastDay; i++) {
        days.push(procDate.format('YYYY-MM-DD'));

        let dayTitle = procDate.format('MM.DD') + '(' + week[procDate.day()] +')';
        if (procDate.day() == 0) {
          dayTitle = '<span class="_fontColor" data-fontColor="red" style="color:red">' + dayTitle + '</span>';
        } else if (procDate.day() == 6) {
          dayTitle = '<span class="_fontColor" data-fontColor="blue" style="color:blue">' + dayTitle + '</span>';
        }
        daysText.push(dayTitle);

        procDate.add(1, "d");
        teamCreateCnt.push(0);
        teamDelCnt.push(0);
        teamMemInsCnt.push(0);
        teamMemDelCnt.push(0);
      }
      $('.calendar').fullCalendar('destroy').fullCalendar({
        header: {
          left: '',
          center: '',
          right: '',
        },
        sundayFontColor: 'red',
        saturdayFontColor: 'blue',
        year: Number(tmp_sDate.substring(0, 4)),
        month: Number(tmp_sDate.substring(5, 7)) - 1,
        events: function(start, end, timezone, callback) {
          let cal = $('.calendar').fullCalendar('getDate');
          let year = cal.getFullYear();
          let month = (cal.getMonth() + 1).toString().padStart(2, '0');
          let tDate = year + '-' + month + '-01';

          let data = {
            tDate: tDate
          };
          let apiURL = '/rest/content/team/stat';
          util.getAjaxData("getCalendar", apiURL, data, function(id, response, params) {
            if (!response.data || response.data.length === 0) return;
            response.data.forEach(function(info) {
              let fcDay = info.the_date.substring(0, 10);
              let dayTarget = $('.fc-day[data-date="' + fcDay + '"]').find('.fc-day-content');
              let template = $('#tmp_calendarData').html();
              let templateScript = Handlebars.compile(template);
              let context = info;
              let html = templateScript(context);
              dayTarget.append(html);

              let fcIndex = days.indexOf(fcDay);
              teamCreateCnt[fcIndex] = parseInt(info.team_create_cnt, 10);
              teamDelCnt[fcIndex] = parseInt(info.team_del_cnt, 10);
              teamMemInsCnt[fcIndex] = parseInt(info.team_mem_ins_cnt, 10);
              teamMemDelCnt[fcIndex] = parseInt(info.team_mem_del_cnt, 10);
            });
            renderChart();
          }, null, {type: 'GET'});
        }
      });
    }

    // 월간현황 그래프 출력
    function renderChart() {
      // 생성
      let traceCreate = {
        x: daysText,
        y: teamCreateCnt,
        mode: 'lines',
        name: '<span style="color:#7030a0">생성</span>',
        line: {
          dash: 'solid',
          width: 4,
          color: '#7030a0'
        },
        marker: {
          color: '#7030a0'
        }
      };

      // 삭제
      let traceDel = {
        x: daysText,
        y: teamDelCnt,
        mode: 'lines',
        name: '<span style="color:#ffc000">삭제</span>',
        line: {
          dash: 'dot',
          width: 4,
          color: '#ffc000'
        },
        marker: {
          color: '#ffc000'
        }
      };

      // 가입
      let traceMemIns = {
        x: daysText,
        y: teamMemInsCnt,
        mode: 'lines',
        name: '<span style="color:#548235">가입</span>',
        line: {
          dash: 'solid',
          width: 4,
          color: '#548235'
        },
        marker: {
          color: '#548235'
        }
      };

      // 탈퇴
      let traceMemDel = {
        x: daysText,
        y: teamMemDelCnt,
        mode: 'lines',
        name: '<span style="color:#4472c4">탈퇴</span>',
        line: {
          dash: 'dot',
          width: 4,
          color: '#4472c4'
        },
        marker: {
          color: '#4472c4'
        }
      };

      let layout = {
        title: month + '월 일자별 - 팀현황',
        yaxis: {
          range: [0, 100],
          autorange: true,
          fixedrange: true
        },
        xaxis : {fixedrange: true},
        legend: {
          y: 0.5,
          traceorder: 'reversed',
          font: {
            size: 16
          }
        }
      };
      var data = [traceCreate, traceDel, traceMemIns, traceMemDel];
      var myPlot = document.getElementById('line-chart');
      Plotly.newPlot(myPlot, data, layout);
    }

    return {
      getCalendar: getCalendar
    };
  }());

  $(function () {
    slctType = 1;
    setDayButton();

    // 월간현황
    statEventData.getCalendar();

    $('#bt_search').on('click', function () {
      statEventData.getCalendar();
    });
  });
</script>

<script type="text/x-handlebars-template" id="tmp_calendarData">
    <div>활동 팀수 : {{addComma tot_team_cnt}} 건</div>
    <div>생성 : {{addComma team_create_cnt}} 건</div>
    <div>삭제 : {{addComma team_del_cnt}} 건</div>
    <div>가입 : {{addComma team_mem_ins_cnt}} 건</div>
    <div>탈퇴 : {{addComma team_mem_del_cnt}} 건</div>
</script>