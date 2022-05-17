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
                        <li class="active">
                            <a href="/content/team/list">전체 팀</a>
                        </li>
                        <li>
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

                <div class="mb10">
                    <div class="mb10">
                        <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist" id="tabSlct">
                            <li class="active">
                                <a href="#activeTeam" role="tab" data-toggle="tab" data-state="on">활동중</a>
                            </li>
                            <li>
                                <a href="#deletedTeam" role="tab" data-toggle="tab" data-state="off">삭제됨</a>
                            </li>
                        </ul>
                    </div>
                    <div class="mb10">
                        <table style="width: 100%">
                            <colgroup>
                                <col width="50%">
                                <col width="50%">
                            </colgroup>
                            <tr>
                                <td class="text-left">
                                    <div class="form-inline">
                                        <select id="srchSlct" name="srchSlct" class="form-control"></select>
                                        <input type="text" id="srchVal" name="srchVal" class="form-control"
                                               placeholder="입력하세요." value="">
                                        <button type="button" class="btn btn-sm btn-primary"
                                                onclick="teamEventData.teamSearch();">검색
                                        </button>
                                    </div>
                                </td>
                                <td class="text-right">
                                    <div class="form-inline">
                                        <select id="ordSlct" name="ordSlct" class="form-control"></select>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div id="resultArea"></div>
                </div>
            </div>
        </div> <!-- //container-fluid -->
    </div> <!-- //page-wrapper -->
</div>
<!-- //wrapper-->

<script>
  // 조회기준
  let srchSlctOptions = [
    {name: '팀 이름', value: 't', selected: true},
    {name: '팀장 회원번호', value: 'm', selected: false},
    {name: '팀장 닉네임', value: 'n', selected: false}
  ];

  // 정렬기준
  let ordSlctOptions = {
    on: [
      {name: '최근 등록순', value: 'i', selected: true},
      {name: '선물달 많은 순', value: 'd', selected: false},
      {name: '받은별 많은 순', value: 'b', selected: false},
      {name: '최근 방송시간 많은 순', value: 'p', selected: false}
    ],
    off: [
      {name: '최근 삭제순', value: 'i', selected: true},
      {name: '선물달 많은 순', value: 'd', selected: false},
      {name: '받은별 많은 순', value: 'b', selected: false},
    ]
  };

  let state = 'on';
  const teamPagingInfo = new PAGING_INFO(0, 1, 50);
  const teamEventData = (function () {
    // 셀렉트박스 설정
    function setSelectBoxOptions(options) {
      let opts = [];
      options.map(function (item) {
        let selected = item.selected ? ' selected' : '';
        opts.push('<option value="' + item.value + '"' + selected + '>' + item.name + '</option>');
      });
      return opts.join('\n');
    }

    // 팀목록 요청 (활동중/삭제됨)
    function callList() {
      $('#resultArea').empty();
      let data = {
        searchSlct: $('#srchSlct').val(),
        searchDate: $('#srchVal').val(),
        ordSlct: $('#ordSlct').val(),
        pageNo: teamPagingInfo.pageNo,
        pagePerCnt: teamPagingInfo.pageCnt
      };
      let route = state === 'on' ? 'list' : 'list-deleted';
      let apiURL = '/rest/content/team/' + route;
      util.getAjaxData("getTeamList", apiURL, data, function(id, response, params) {
        switch(state) {
          case 'on':
            renderTeamList(id, response, params);
            break;
          case 'off':
            renderTeamDeletedList(id, response, params);
            break;
        }
      }, null, {type: 'GET'});
    }

    // 활동중
    function renderTeamList(id, response, params) {
      let template, templateScript, context, html;
      template = $('#tmp-dalla-team-list').html();
      templateScript = Handlebars.compile(template);
      context = response.listData.map(function (item, index) {
        item.index_no = response.totalCnt - (((teamPagingInfo.pageNo - 1) * teamPagingInfo.pageCnt) + index);
        item.master_mem_nick = item.master_mem_nick ? item.master_mem_nick : '-';
        return item;
      });
      html = templateScript(context);
      $("#resultArea").html(html);

      teamPagingInfo.totalCnt = response.totalCnt;
      util.renderPagingNavigation('dalla-team-top', teamPagingInfo);
      util.renderPagingNavigation('dalla-team-bottom', teamPagingInfo);

      if (response.listData.length === 0) {
        $('#dalla-team-top').hide();
        $('#dalla-team-bottom').hide();
      } else {
        $('#dalla-team-top').show();
        $('#dalla-team-bottom').show();
      }
    }

    // 삭제됨
    function renderTeamDeletedList(id, response, params) {
      let template, templateScript, context, html;
      template = $('#tmp-dalla-team-deleted-list').html();
      templateScript = Handlebars.compile(template);
      context = response.listData.map(function (item, index) {
        item.index_no = response.totalCnt - (((teamPagingInfo.pageNo - 1) * teamPagingInfo.pageCnt) + index);
        item.master_mem_nick = item.master_mem_nick ? item.master_mem_nick : '-';
        return item;
      });
      html = templateScript(context);
      $("#resultArea").html(html);

      teamPagingInfo.totalCnt = response.totalCnt;
      util.renderPagingNavigation('dalla-team-deleted-top', teamPagingInfo);
      util.renderPagingNavigation('dalla-team-deleted-bottom', teamPagingInfo);

      if (response.listData.length === 0) {
        $('#dalla-team-deleted-top').hide();
        $('#dalla-team-deleted-bottom').hide();
      } else {
        $('#dalla-team-deleted-top').show();
        $('#dalla-team-deleted-bottom').show();
      }
    }
    // 검색처리
    function teamSearch() {
      teamPagingInfo.pageNo = 1;
      callList();
    }

    return {
      setSelectBoxOptions: setSelectBoxOptions,
      callList: callList,
      teamSearch: teamSearch,
    };
  }());

  function popupAction() {
    teamEventData.callList();
  }

  function handlebarsPaging(targetId, pagingInfo) {
    switch (targetId) {
      case 'dalla-team-top':
      case 'dalla-team-bottom':
        teamPagingInfo.pageNo = pagingInfo.pageNo;
        teamEventData.callList();
        break;
      case 'dalla-team-deleted-top':
      case 'dalla-team-deleted-bottom':
        teamPagingInfo.pageNo = pagingInfo.pageNo;
        teamEventData.callList();
        break;
    }
  }

  $(document).ready(function () {
    // 검색조건
    $('#srchSlct').html(teamEventData.setSelectBoxOptions(srchSlctOptions));
    $('#ordSlct').html(teamEventData.setSelectBoxOptions(ordSlctOptions[state]));
    teamEventData.callList();

    // 탭클릭
    $('#tabSlct li a').on('click', function () {
      let $this = $(this);
      state = $this.data('state');
      $('#srchSlct').val('t');
      $('#ordSlct').html(teamEventData.setSelectBoxOptions(ordSlctOptions[state]));

      teamEventData.teamSearch();
    });

    // 검색어
    $('#srchVal').on('keyup', function (e) {
      if (e.keyCode == 13) {
        teamEventData.teamSearch();
      }
    });

    // 정렬변경
    $('#ordSlct').on('change', function () {
      teamEventData.teamSearch();
    });
  });
</script>

<script type="text/x-handlebars-template" id="tmp-dalla-team-list">
    <div class="dataTables_paginate paging_full_numbers" id="dalla-team-top"></div>
    <table id="dalla-team-table" class="table table-sorting table-hover table-bordered">
        <colgroup>
            <col width="60px"/>
            <col width="120px"/>
            <col width="200px"/>
            <col width="150px"/>
            <col width="auto"/>
            <col width="auto"/>
            <col width="auto"/>
            <col width="120px"/>
            <col width="150px"/>
            <col width="auto"/>
            <col width="auto"/>
        </colgroup>
        <thead>
        <tr>
            <th>No.</th>
            <th>팀번호</th>
            <th>팀이름</th>
            <th>생성일시</th>
            <th>팀장</th>
            <th>멤버수</th>
            <th>선물달</th>
            <th>받은별</th>
            <th>팀 방송시간</th>
            <th>신규팬</th>
            <th>팀 스코어</th>
        </tr>
        </thead>
        <tbody id="dalla-team-table-body">
        {{#each this as |data|}}
        <tr>
            <td>{{index_no}}</td>
            <td>{{{teamLink team_no team_no 'use'}}}</td>
            <td>{{{teamLink team_name team_no 'use'}}}</td>
            <td>{{ins_date}}</td>
            <td>{{{memNoLink mem_nick master_mem_no}}}</td>
            <td>{{addComma team_mem_cnt}}</td>
            <td>{{addComma tot_send_dal_cnt}}</td>
            <td>{{addComma tot_rcv_byeol_cnt}}</td>
            <td>{{timeStampDay tot_play_time}}</td>
            <td>{{addComma tot_new_fan_cnt}}</td>
            <td>{{addComma team_tot_score}}</td>
        </tr>
        {{else}}
        <tr>
            <td colspan="11">{{isEmptyData}}</td>
        </tr>
        {{/each}}
        </tbody>
    </table>
    <div class="dataTables_paginate paging_full_numbers" id="dalla-team-bottom"></div>
</script>

<script type="text/x-handlebars-template" id="tmp-dalla-team-deleted-list">
    <div class="dataTables_paginate paging_full_numbers" id="dalla-team-deleted-top"></div>
    <table id="dalla-team-deleted-table" class="table table-sorting table-hover table-bordered">
        <colgroup>
            <col width="60px"/>
            <col width="120px"/>
            <col width="200px"/>
            <col width="150px"/>
            <col width="auto"/>
            <col width="auto"/>
            <col width="auto"/>
            <col width="auto"/>
            <col width="150px"/>
        </colgroup>
        <thead>
        <tr>
            <th>No.</th>
            <th>팀번호</th>
            <th>팀이름</th>
            <th>생성일시</th>
            <th>선물달</th>
            <th>받은별</th>
            <th>팀 방송시간</th>
            <th>신규팬</th>
            <th>삭제일시</th>
        </tr>
        </thead>
        <tbody id="dalla-team-deleted-table-body">
        {{#each this as |data|}}
        <tr>
            <td>{{index_no}}</td>
            <td>{{{teamLink team_no team_no 'del'}}}</td>
            <td>{{team_name}}</td>
            <td>{{ins_date}}</td>
            <td>{{addComma tot_send_dal_cnt}}</td>
            <td>{{addComma tot_rcv_byeol_cnt}}</td>
            <td>{{timeStampDay tot_play_time}}</td>
            <td>{{addComma tot_new_fan_cnt}}</td>
            <td>
                {{del_date}}<br/>
                {{#dalbit_if del_chrgr_name '==' ''}}
                (사용자삭제)
                {{else}}
                ({{del_chrgr_name}})
                {{/dalbit_if}}
            </td>
        </tr>
        {{else}}
        <tr>
            <td colspan="9">{{isEmptyData}}</td>
        </tr>
        {{/each}}
        </tbody>
    </table>
    <div class="dataTables_paginate paging_full_numbers" id="dalla-team-deleted-bottom"></div>
</script>