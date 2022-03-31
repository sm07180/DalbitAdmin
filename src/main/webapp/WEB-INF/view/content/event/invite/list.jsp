<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dummyData"><%= java.lang.Math.round(java.lang.Math.random() * 1000000) %></c:set>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="container-fluid">
            <!-- serachBox -->
            <form id="searchForm" class="clearfix">
                <div class="row col-lg-12 form-inline">
                    <div class="widget widget-table searchBoxArea">
                        <table>
                            <tr>
                                <td style="text-align: left; padding-left: 4px;">
                                    <label><input type="text" class="form-control" name="searchText" id="searchText" placeholder="회원번호 검색"></label>
                                    <button type="button" class="btn btn-success" id="bt_search">검색</button>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </form>
            <!-- //serachBox -->
            <div class="clearfix widget-content mt5 mb5">
                <h4 class="font-bold">친구초대 이벤트</h4>
                <h5 class="font-bold">진행기간: 2022-02-21 ~ 2022-03-07, 발표: 2022-03-08</h5>

                <div class="mb15">
                    <ul class="nav nav-tabs nav-tabs-custom-colored" id="invite-slct-tabs">
                        <li class="active"><a href="#detail_event" role="tab" data-toggle="tab" data-slct_type="1" aria-expanded="false" class="_tab">초대현황</a></li>
                        <li><a href="#detail_event" role="tab" data-toggle="tab" data-slct_type="2" aria-expanded="false" class="_tab">참여자목록</a></li>
                    </ul>
                </div>

                <img id="ccc" src="https://devphoto2.dalbitlive.com/clip_3/clipbg_200910_0.jpg" style="display: none" />

                <div class="content-area"></div>
                <div class="calendar"></div>
                <!-- // content area -->
            </div>
        </div> <!-- //container-fluid -->
    </div> <!-- //page-wrapper -->
</div> <!-- //wrapper-->

<div class="modal fade" id="recv-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 1000px">
        <div class="modal-content">
            <div class="modal-body">
                <div class="recv-modal-list"></div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="/js/code/menu/menuCodeList.js?${dummyData}"></script>
<script src="/template/js/plugins/fullcalendar/fullcalendar.js"></script>
<script type="text/javascript">
  let inviteSlctType = 1;
  let invitePagingInfo = new PAGING_INFO(0, 1, 50);
  let inviteRecvPagingInfo = new PAGING_INFO(0, 1, 10);
  let rectMemNo = '';
  let isModal = false;

  const inviteEventData = (function() {
    // 초대현황
    function getState(_memNo) {
      $('.calendar').fullCalendar({
        header: {
          left: '',
          center: 'prev, title, next',
          right: 'today'
        },
        firstDay: 1, //월요일부터 시작
        showTotal: true, //합계 노출여부
        events: function(start, end, timezone, callback) {
          let cal = $('.calendar').fullCalendar('getDate');
          let year = cal.getFullYear();
          let month = (cal.getMonth() + 1).toString().padStart(2, '0');
          let tDate = year + '-' + month + '-01';

          let data = {
            memNo: _memNo,
            tDate: tDate,
          };
          let apiURL = '/rest/content/event/invite/state';
          util.getAjaxData("getState", apiURL, data, function (id, response, params) {
            // 결과정보를 날짜셀에 표기
            response.listData.forEach(function(info) {
              let dayTarget = $('.fc-day[data-date="'+info.the_date+'"]').find('.fc-day-content');
              let template = $('#tmp_calendarData').html();
              let templateScript = Handlebars.compile(template);
              let context = info;
              let html = templateScript(context);
              dayTarget.append(html);
            });

            // 해당 주차 합계를 표기
            $('tr.fc-week').each(function() {
              let week = $(this);
              let startDate = week.find('td.fc-day:first').data('date');
              let endDate = week.find('td.fc-day:last').data('date');
              let index = $('tr.fc-week').index(week);

              let weekSumData = {
                month: month,
                index: index,
                invitation_mem_cnt: 0,
                invitation_rcv_mem_cnt: 0,
                invitation_dal_cnt: 0
              };
              response.listData.forEach(function(info) {
                if (startDate <= info.the_date && info.the_date <= endDate) {
                  weekSumData.invitation_mem_cnt += info.invitation_mem_cnt;
                  weekSumData.invitation_rcv_mem_cnt += info.invitation_rcv_mem_cnt;
                  weekSumData.invitation_dal_cnt += info.invitation_dal_cnt;
                }
              });

              let weekTarget = $('.fc-week:eq(' + index + ')').find('.fc-day-content:last');
              let template = $('#tmp_weekCalendarData').html();
              let templateScript = Handlebars.compile(template);
              let context = weekSumData;
              let html = templateScript(context);
              weekTarget.append(html);
            });
          }, null, {type: 'GET'});
        }
      });
    }

    // 참여자목록
    function getList(_memNo, pageInfo) {
      _memNo = _memNo ? _memNo : '';
      let data = {
        searchVal: _memNo,
        searchSlct: 1,
        pageNo: pageInfo.pageNo,
        pagePerCnt: pageInfo.pageCnt
      };
      let apiURL = '/rest/content/event/invite/list';
      util.getAjaxData("getList", apiURL, data, function (id, response, params) {
        renderList(id, response, pageInfo);
      }, null, {type: 'GET'});
    }

    // 참여자 목록 그리기
    function renderList(id, response, pageInfo) {
      let template, templateScript, context, html;
      template = $('#tmp_invite_list').html();
      templateScript = Handlebars.compile(template);
      context = response.listData.map(function (item, index) {
        item.rank_no = ((pageInfo.pageNo - 1) * pageInfo.pageCnt) + index + 1;
        return item;
      });
      html = templateScript(context);
      $(".content-area").html(html);

      pageInfo.totalCnt = response.totalCnt;
      util.renderPagingNavigation('total_paginate_top', pageInfo);
      util.renderPagingNavigation('total_paginate_bottom', pageInfo);

      if (response.listData.length === 0) {
        $('#total_paginate_top').hide();
        $('#total_paginate_bottom').hide();
      } else {
        $('#total_paginate_top').show();
        $('#total_paginate_bottom').show();
      }
    }

    // 피참여자 목록
    function getRecvList(_memNo, pageInfo) {
      $('.recv-modal-list').empty();

      rectMemNo = _memNo;
      if (!rectMemNo) {
        alert('요청할 정보가 없습니다.');
        return;
      }

      let data = {
        memNo: rectMemNo,
        pageNo: pageInfo.pageNo,
        pagePerCnt: pageInfo.pageCnt
      };
      let apiURL = '/rest/content/event/invite/recv-list';
      util.getAjaxData("getRecvList", apiURL, data, function (id, response, params) {
        renderRecvList(id, response, pageInfo);
      }, null, {type: 'GET'});
    }

    // 피참여자 목록 그리기
    function renderRecvList(id, response, pageInfo) {
      let template, templateScript, context, html;
      template = $('#tmp_invite_recv_list').html();
      templateScript = Handlebars.compile(template);
      context = response.listData;
      html = templateScript(context);
      $(".recv-modal-list").html(html);

      pageInfo.totalCnt = response.totalCnt;
      util.renderPagingNavigation('recv_paginate_top', pageInfo);
      util.renderPagingNavigation('recv_paginate_bottom', pageInfo);

      if (response.listData.length === 0) {
        $('#recv_paginate_top').hide();
        $('#recv_paginate_bottom').hide();
      } else {
        $('#recv_paginate_top').show();
        $('#recv_paginate_bottom').show();
      }

      if (!isModal) {
        isModal = true;
        $('#recv-modal').modal('show');
      }
    }

    function callList(pageInfo) {
      let memNo = document.getElementById('searchText').value;
      memNo = memNo ? parseInt(memNo, 10) : 0;

      $('.content-area').empty();
      $('.calendar').empty();

      switch (inviteSlctType) {
        case 1:
          getState(memNo);
          break;
        case 2:
          getList(memNo, pageInfo);
          break;
      }
    }

    function callRecvList(memNo) {
      isModal = false;
      $('#recv-modal').modal('hide');

      inviteRecvPagingInfo.pageNo = 1;
      getRecvList(memNo, inviteRecvPagingInfo);
    }

    return {
      callRecvList: callRecvList,
      getRecvList: getRecvList,
      callList: callList
    }
  }());

  // 페이징 이벤트
  function handlebarsPaging(targetId, pagingInfo) {
    if (targetId === 'total_paginate_top' ||  targetId === 'total_paginate_bottom') {
      inviteEventData.callList(pagingInfo);
    }

    if (targetId === 'recv_paginate_top' ||  targetId === 'recv_paginate_bottom') {
      inviteEventData.getRecvList(rectMemNo, pagingInfo);
    }
  }

  $(function() {
    // 기본실행
    inviteEventData.callList(invitePagingInfo);

    $('#bt_search').on('click', function () {
      inviteEventData.callList(pagingInfo);
    });

    // 탭클릭
    $('#invite-slct-tabs li a').on('click', function() {
      const $this = $(this);
      inviteSlctType = parseInt($this.data('slct_type'), 10);

      invitePagingInfo.pageNo = 1;
      inviteEventData.callList(invitePagingInfo);
    });
  });
</script>

<script type="text/x-handlebars-template" id="tmp_calendarData">
    <div>참여자 수 : {{addComma invitation_mem_cnt}} 명</div>
    <div>피 초대인 수 : {{addComma invitation_rcv_mem_cnt}} 명</div>
    <div>달 : {{addComma invitation_dal_cnt}} 개</div>
</script>

<script type="text/x-handlebars-template" id="tmp_weekCalendarData">
    <div style="font-weight:bold">{{month}}월 {{math index '+' 1}}주차</div>
    <div>참여자 수 : {{addComma invitation_mem_cnt}} 명</div>
    <div>피 초대인 수 : {{addComma invitation_rcv_mem_cnt}} 명</div>
    <div>달 : {{addComma invitation_dal_cnt}} 개</div>
</script>

<script type="text/x-handlebars-template" id="tmp_invite_list">
    <div class="dataTables_paginate paging_full_numbers" id="total_paginate_top"></div>
    <table class="table table-sorting table-hover table-bordered mb0">
        <colgroup>
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
            <th>순위</th>
            <th>회원번호</th>
            <th>닉네임</th>
            <th>연락처</th>
            <th>디바이스번호</th>
            <th>IP</th>
            <th>초대인원</th>
            <th>적립달 현황</th>
        </tr>
        </thead>
        <tbody>
        {{#each this as |data|}}
        <tr>
            <td>{{rank_no}}</td>
            <td>{{{memNoLink mem_no mem_no}}}</td>
            <td>{{mem_nick}}</td>
            <td>{{phoneNumHyphen mem_phone}}</td>
            <td>{{last_device_uuid}}</td>
            <td>{{ip}}</td>
            <td><a href="javascript:void(0)" onclick="inviteEventData.callRecvList('{{mem_no}}');">{{invitation_cnt}}</a></td>
            <td>{{invitation_dal_cnt}}</td>
        </tr>
        {{else}}
        <tr>
            <td colspan="8">{{isEmptyData}}</td>
        </tr>
        {{/each}}
        </tbody>
    </table>
    <div class="dataTables_paginate paging_full_numbers" id="total_paginate_bottom"></div>
</script>

<script type="text/x-handlebars-template" id="tmp_invite_recv_list">
    <div class="dataTables_paginate paging_full_numbers" id="recv_paginate_top"></div>
    <table class="table table-sorting table-hover table-bordered mb0">
        <colgroup>
            <col width="auto"/>
            <col width="auto"/>
            <col width="auto"/>
            <col width="auto"/>
            <col width="150"/>
        </colgroup>
        <thead>
        <tr>
            <th>회원번호</th>
            <th>닉네임</th>
            <th>연락처</th>
            <th>디바이스번호</th>
            <th>IP</th>
            <th>탈퇴여부</th>
        </tr>
        </thead>
        <tbody>
        {{#each this as |data|}}
        <tr {{#dalbit_if ip_chk_yn '==' 'y'}} style="background: #ffefd5" {{/dalbit_if}}>
        <td>{{{memNoLink rcv_mem_no rcv_mem_no}}}</td>
        <td>{{rcv_mem_nick}}</td>
        <td>{{phoneNumHyphen rcv_mem_phone}}</td>
        <td>{{rcv_last_device_uuid}}</td>
        <td>{{rcv_mem_ip}}</td>
        <td>{{rcv_mem_exit_yn}}</td>
        </tr>
        {{else}}
        <tr>
            <td colspan="5">{{isEmptyData}}</td>
        </tr>
        {{/each}}
        </tbody>
    </table>
    <div class="dataTables_paginate paging_full_numbers" id="recv_paginate_bottom"></div>
</script>