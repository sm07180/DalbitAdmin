<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="col-lg-12 no-padding mt10 mb10" id="playmaker-datail">
    <div class="widget-content">
        <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist" id="detail-type-slct">
            <li class="active"><a href="#detail-day" role="tab" data-toggle="tab" data-type="day">일간</a></li>
            <li><a href="#detail-week" role="tab" data-toggle="tab" data-type="week">주간</a></li>
            <li><a href="#detail-month" role="tab" data-toggle="tab" data-type="month">월간</a></li>
        </ul>
        <div class="tab-content">
            <div class="tab-pane fade in active" id="detail-day">
                <div class="searchBoxArea">
                    <table class="table table-bordered no-margin" style="width: 100%;">
                        <colgroup>
                            <col width="70px">
                            <col width="30px">
                            <col width="auto">
                        </colgroup>
                        <tr>
                            <th rowspan="2">
                                <select name="search_year" class="form-control search_year searchType"></select>
                            </th>
                            <th>월</th>
                            <td>
                                <div class="cal-month-button text-left"></div>
                            </td>
                        </tr>
                        <tr>
                            <th>일</th>
                            <td>
                                <div class="cal-day-button text-left"></div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="tab-pane fade" id="detail-week">
                <div class="form-inline">
                    <button type="button" class="btn btn-sm btn-custom-secondary" id="prevWeek">이전주</button>
                    <b><span class="start-date"></span> ~ <span class="end-date"></span></b>
                    <button type="button" class="btn btn-sm btn-custom-secondary" id="nextWeek">다음주</button>
                </div>
            </div>
            <div class="tab-pane fade" id="detail-month">
                <div class="searchBoxArea">
                    <table class="table table-bordered no-margin" style="width: 100%;">
                        <colgroup>
                            <col width="70px">
                            <col width="30px">
                            <col width="auto">
                        </colgroup>
                        <tr>
                            <th rowspan="2">
                                <select name="search_year" class="form-control search_year searchType"></select>
                            </th>
                            <th>월</th>
                            <td>
                                <div class="cal-month-button text-left"></div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <div style="position: relative; width: 100%; height: 43px; margin-top: 10px" id="admin-search">
            <div style="float: left;"></div>
            <div style="float: right;">
                <div class="form-inline">
                    <select name="ordSlct" class="form-control ordSlct">
                        <option value="b">받은별 높은순</option>
                        <option value="s">선물한 회원많은순</option>
                        <option value="p">방송시간많은순</option>
                    </select>
                    <input type="number" class="form-control teamNo" name="teamNo" value="" placeholder="팀번호">
                    <button type="button" class="btn btn-custom-secondary" onclick="datailEventData.callList();">검색
                    </button>
                </div>
            </div>
        </div>
        <div id="playmaker-detail-list"></div>
    </div>
</div>

<script type="text/javascript" src="/js/code/money/exchangeCodeList.js?${dummyData}"></script>
<script>
  let $datailRoot = null;
  let pyear = moment().format('YYYY');
  let pmonth = moment().format('MM');
  let pday = moment().format('DD');
  let ptoday = moment().format('YYYY-MM-DD');
  const datailSearch = {
    type: 'day',
    teamNo: '',
    ordSlct: 'b',
    tDate: [pyear, pmonth, pday].join('-'),
    pageNo: 1,
    pagePerCnt: 50
  }
  const datailPagingInfo = new PAGING_INFO(0, 1, 50);
  const datailEventData = (function () {
    function callList() {
      $("#playmaker-detail-list").empty();
      datailSearch.teamNo = datailSearch.teamNo ? parseInt(datailSearch.teamNo, 10) : 0;
      datailSearch.tDate = [pyear, pmonth, pday].join('-');
      datailSearch.pageNo = datailPagingInfo.pageNo;
      datailSearch.pagePerCnt = datailPagingInfo.pageCnt;
      let apiURL = '/rest/broadcast/playmaker/' + datailSearch.type;
      util.getAjaxData("getDetailList", apiURL, datailSearch, function (id, response, params) {
        renderPlaymakerDetail(id, response, params);
      }, null, {type: 'GET'});
    }

    function renderPlaymakerDetail(id, response, params) {
      let template, templateScript, context, html;

      template = $('#tmp-playmaker-detail-list').html();
      templateScript = Handlebars.compile(template);
      context = response.listData.map(function (item, index) {
        item.index_no = response.totalCnt - (((datailPagingInfo.pageNo - 1) * datailPagingInfo.pageCnt) + index);
        return item;
      });
      html = templateScript(context);
      $("#playmaker-detail-list").html(html);

      datailPagingInfo.totalCnt = response.totalCnt;
      util.renderPagingNavigation('playmaker-detail-top', datailPagingInfo);
      util.renderPagingNavigation('playmaker-detail-bottom', datailPagingInfo);

      if (response.listData.length === 0) {
        $('#playmaker-detail-top').hide();
        $('#playmaker-detail-bottom').hide();
      } else {
        $('#playmaker-detail-top').show();
        $('#playmaker-detail-bottom').show();
      }
    }

    function intSearchForm() {
    }

    return {
      intSearchForm: intSearchForm,
      callList: callList
    }
  }());

  function createWeek() {
    let currentDate = moment([pyear, parseInt(pmonth, 10) -1, pday]);
    let startDate = moment(currentDate).startOf('week').format('YYYY-MM-DD');
    let endDate = moment(currentDate).endOf('week').format('YYYY-MM-DD');

    $('#detail-week .start-date').html(startDate);
    $('#detail-week .end-date').html(endDate);
  }

  // 월버튼 생성
  function createMonthButton() {
    let btnHtml = '';
    for(let i = 1; i <= 12; i++) {
      let num = i > 9 ? i : '0' + i;
      let active = (num == pmonth) ? ' active' : '';
      btnHtml += '<button type="button" class="btn btn-xs mr5 btn-default btn-search btn-pmonth' + active + '" style="border-radius: 4px;" data-month="' + i + '">' + i + '</button>';
    }
    $('.cal-month-button').html(btnHtml)
  }

  // 날짜 생성
  function createDayButton() {
    let btnHtml = '';
    let startDate = moment([pyear, parseInt(pmonth, 10) - 1]);
    let endDate = moment(startDate).endOf('month').format('DD');

    for(let i = 1; i <= endDate; i++) {
      let num = i > 9 ? i : '0' + i;
      let active = (num == pday) ? ' active' : '';
      btnHtml += '<button type="button" class="btn btn-xs mr5 btn-default btn-search btn-pday' + active + '" style="border-radius: 4px;" data-day="' + i + '">' + i + '</button>';
    }
    $('.cal-day-button').html(btnHtml)
  }

  // 플레이메이커 관리
  function initPlaymakerDetailEvent() {
    $(document).ready(function () {
      datailEventData.intSearchForm();
      datailEventData.callList();
    });
  }

  $(function () {
    $datailRoot = $('#playmaker-datail');
    $('.search_year').html(util.getCommonCodeSelect(moment(new Date()).format('YYYY'), search_exchange_years));
    createMonthButton();
    createDayButton();
    createWeek();

    // 셀랙트박스 변경
    $datailRoot.find('select[name="ordSlct"]').on('change', function () {
      var $this = $(this);
      datailSearch.ordSlct = $this.val();

      datailPagingInfo.pageNo = 1;
      datailEventData.callList();
    });

    // 팀번호 변경
    $datailRoot.find('input[name="teamNo"]').on('change', function () {
      var $this = $(this);
      datailSearch.teamNo = $this.val();
    });

    $('#detail-type-slct > li > a').on('click', function (e) {
      var $this = $(this);
      datailSearch.type = $this.data('type');
      createMonthButton();
      createDayButton();
      createWeek();

      datailPagingInfo.pageNo = 1;
      datailEventData.callList();
    });

    // 이전주
    $('#prevWeek').on('click', function () {
      let prevDate = moment([pyear, parseInt(pmonth, 10) -1, pday]).subtract(1, 'weeks');
      pmonth = prevDate.format('MM');
      pday = prevDate.format('DD');
      createWeek();

      datailPagingInfo.pageNo = 1;
      datailEventData.callList();
    });

    // 다음주
    $('#nextWeek').on('click', function () {
      let nextDate = moment([pyear, parseInt(pmonth, 10) -1, pday]).add(1, 'weeks');
      pmonth = nextDate.format('MM');
      pday = nextDate.format('DD');
      createWeek();

      datailPagingInfo.pageNo = 1;
      datailEventData.callList();
    });

    // 년선택
    $('.search_year').on('change', function () {
      let $this = $(this);
      pyear = parseInt($this.val(), 10);
    });

    // 월선택
    $(document).on('click', '.btn-pmonth', function () {
      let $this = $(this);
      let month = parseInt($this.data('month'), 10);
      pmonth = month > 9 ? month : '0' + month;
      createMonthButton();
      createDayButton();

      datailPagingInfo.pageNo = 1;
      datailEventData.callList();
    });

    // 일선택
    $(document).on('click', '.btn-pday', function () {
      let $this = $(this);
      let day = parseInt($this.data('day'), 10);
      pday = day > 9 ? day : '0' + day;
      createDayButton();

      datailPagingInfo.pageNo = 1;
      datailEventData.callList();
    });
  });
</script>

<script type="text/x-handlebars-template" id="tmp-playmaker-detail-list">
    <div class="dataTables_paginate paging_full_numbers" id="playmaker-detail-top"></div>
    <table id="playmaker-detail-table" class="table table-sorting table-hover table-bordered">
        <colgroup>
            <col width="auto"/>
            <col width="auto"/>
            <col width="auto"/>
            <col width="auto"/>
            <col width="auto"/>
            <col width="auto"/>
            <col width="auto"/>
            <col width="auto"/>
            <col width="auto"/>
            <col width="auto"/>
            <col width="auto"/>
            <col width="auto"/>
            <col width="auto"/>
            <col width="auto"/>
        </colgroup>
        <thead>
        <tr>
            <th>UID</th>
            <th>닉네임</th>
            <th>소속팀</th>
            <th>받은별</th>
            <th>방송방_cnt</th>
            <th>방송시간</th>
            <th>방송시간<br>(하루최대2시간)</th>
            <th>뷰어</th>
            <th>유니크 뷰어</th>
            <th>게스트</th>
            <th>senders</th>
            <th>sender 비율</th>
            <th>팔로워</th>
            <th>부스터</th>
        </tr>
        </thead>
        <tbody id="playmaker-detail-table-body">
        {{#each this as |data|}}
        <tr>
            <td>{{{memNoLink mem_userid mem_no}}}</td>
            <td>{{mem_nick}}</td>
            <td>{{team_name}}</td>
            <td>{{addComma rcv_byeol}}</td>
            <td>{{addComma play_cnt}}</td>
            <td>{{timeStampAllKor max_play_time}}</td>
            <td>{{timeStampAllKor play_time}}</td>
            <td>{{addComma tot_view_mem_cnt}}</td>
            <td>{{addComma view_mem_cnt}}</td>
            <td>{{addComma view_guest_cnt}}</td>
            <td>{{addComma send_mem_cnt}}</td>
            <td>{{addComma send_mem_rate}}%</td>
            <td>{{addComma new_fan_cnt}}</td>
            <td>{{addComma booster_cnt}}</td>
        </tr>
        {{else}}
        <tr>
            <td colspan="14">{{isEmptyData}}</td>
        </tr>
        {{/each}}
        </tbody>
    </table>
    <div class="dataTables_paginate paging_full_numbers" id="playmaker-detail-bottom"></div>
</script>