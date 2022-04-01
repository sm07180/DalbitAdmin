<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="col-lg-12 no-padding mt10 mb10" id="playmaker-team">
    <div class="widget-content">
        <div class="form-inline">
            <input type="text" name="teamName" class="form-control" maxlength="20" placeholder="등록 할 팀 이름(최대 20자)">
            <button type="button" class="btn btn-primary" onclick="teamEventData.callTeamReg();">팀등록</button>
        </div>
        <div id="playmaker-team-list"></div>
    </div>
</div>

<div class="modal fade" id="playmakerTeamEdit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body">
                <table style="wdith:100%;">
                    <colgroup>
                        <col width="150px">
                        <col width="auto">
                    </colgroup>
                    <tr>
                        <th>소속팀</th>
                        <td><span class="playmaker-team-name"></span></td>
                    </tr>
                    <tr>
                        <th>팀장(선택)</th>
                        <td>
                            <div class="form-inline">
                                <input type="text" name="memNick" id="playmaker-team-mem-nick" class="form-control"
                                       value="" readonly>
                                <button type="button" class="btn btn-success playmaker-team-mem-search" data-action="1">
                                    회원검색
                                </button>
                                <button type="button" class="btn btn-default" id="playmaker-team-mem-init">초기화</button>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th>팀원(필수)</th>
                        <td>
                            <div>
                                <button type="button" class="btn btn-block btn-success playmaker-team-mem-search"
                                        data-action="2">회원검색
                                </button>
                                <div id="playmakerTeamMembers"></div>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" onclick="teamEventData.callPlaymakerTeamRemove();">삭제
                </button>
                <button type="button" class="btn btn-default" data-dismiss="modal" aria-hidden="true">닫기</button>
                <button type="button" class="btn btn-primary" onclick="teamEventData.callPlaymakerTeamEdit();">저장
                </button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="playmakerTeamMemberSearch" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                등록된 플레이메이커를 검색합니다.
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body">
                <div class="searchBoxArea">
                    <table class="table table-bordered no-margin" style="width: 100%;">
                        <colgroup>
                            <col width="100px">
                            <col width="auto">
                        </colgroup>
                        <tr>
                            <th><i class="fa fa-search"></i> 회원 검색</th>
                            <td>
                                <div class="form-inline text-left">
                                    <select name="searchSlct" class="form-control searchType">
                                        <option value="1">회원 번호</option>
                                        <option value="2">아이디</option>
                                        <option value="3">회원 닉네임</option>
                                    </select>
                                    <label><input type="text" name="searchData" class="form-control"></label>
                                    <button type="button" class="btn btn-success"
                                            onclick="teamEventData.callPlaymaker()">검색
                                    </button>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
                <div id="playmaker-team-members-list"></div>
            </div>
        </div>
    </div>
</div>

<script>
  let $teamRoot = null;
  const teamSearch = {
    ordSlct: 'i',
    pageNo: 1,
    pagePerCnt: 50
  }
  const teamData = {
    teamName: ''
  }
  let isModifyMode = false;
  let playMakerTeamMemMaxCount = 10;
  const playMakerTeamMemLeader = {
    teamNo: 0,
    memNo: '',
    memNick: '',
    memSlct: 'l'
  }
  let playMakerTeamMems = [];
  const playMakerTeamMemDelVo = {
    teamNo: '',
    memNo: ''
  }
  const teamPlayamkerSearch = {
    searchSlct: 1,
    searchData: ''
  }
  let teamPlayamkerSlctType = 1; // 1: 팀장검색, 2: 일반검색
  const teamPagingInfo = new PAGING_INFO(0, 1, 50);
  const teamPlaymakerPagingInfo = new PAGING_INFO(0, 1, 50);
  const teamEventData = (function () {
    // 플레이메이커 정보
    function callPlaymaker() {
      let apiURL = '/rest/broadcast/playmaker/player';
      util.getAjaxData("getPlaymaker", apiURL, teamPlayamkerSearch, function (id, response, params) {
        renderPlaymaker(id, response, params);
      }, null, {type: 'GET'});
    }

    // 플레이메이커 출력
    function renderPlaymaker(id, response, params) {
      let template, templateScript, context, html;
      template = $('#tmp-playmaker-team-members-list').html();
      templateScript = Handlebars.compile(template);
      context = response.data ? response.data : {mem_no: ''};
      html = templateScript(context);
      $('#playmaker-team-members-list').html(html);
    }

    // 플레이메이커 (팀장) 등록
    function selectPlaymakerLeader(data) {
      playMakerTeamMemLeader.teamNo = playMakerTeamMemDelVo.teamNo;
      playMakerTeamMemLeader.memNo = data.mem_no;
      playMakerTeamMemLeader.memNick = data.mem_nick;
      $('#playmaker-team-mem-nick').val(data.mem_nick);
      $('#playmakerTeamMemberSearch').modal('hide');
    }

    // 플레이메이커 (일반) 등록
    function selectPlaymaker(data) {
      if (playMakerTeamMemLeader.memNo && playMakerTeamMemLeader.memNo === data.mem_no) {
        alert('팀장으로 선택된 회원입니다.\n다시 선택해 주세요.');
        return;
      }

      if (playMakerTeamMems.length >= playMakerTeamMemMaxCount) {
        alert('한번에 최대 ' + playMakerTeamMemMaxCount + '명까지만 추가 할 수 있습니다.');
        return;
      }

      let isDup = false;
      for (let k in playMakerTeamMems) {
        if (playMakerTeamMems[k].memNo === data.mem_no) {
          isDup = true;
        }
      }
      if (isDup) {
        alert('동일한 회원정보를 선택하셨습니다');
        return;
      }

      playMakerTeamMems.push({
        teamNo: playMakerTeamMemDelVo.teamNo,
        memNo: data.mem_no,
        memNick: data.mem_nick,
        memSlct: 'm'
      });

      $("#playmakerTeamMembers").empty();
      renderPlayMakerTeamMems();
      $('#playmakerTeamMemberSearch').modal('hide');
    }

    // 선택한 팀맴버 목록
    function renderPlayMakerTeamMems() {
      let template, templateScript, context, html;
      template = $('#tmp-playmaker-team-slct-list').html();
      templateScript = Handlebars.compile(template);
      context = playMakerTeamMems;
      html = templateScript(context);
      $("#playmakerTeamMembers").html(html);
    }

    function callTeamMemberRemove(index) {
      if (isModifyMode) {
        playMakerTeamMemDelVo.teamNo = playMakerTeamMems[index].teamNo;
        playMakerTeamMemDelVo.memNo = playMakerTeamMems[index].memNo;
        let apiURL = '/rest/broadcast/playmaker/teams/members-delete';
        util.getAjaxData("removeTeamMember", apiURL, playMakerTeamMemDelVo, function (id, response, params) {
        }, null, {type: 'POST'});
      }
      playMakerTeamMems.splice(index, 1);
      $("#playmakerTeamMembers").empty();
      renderPlayMakerTeamMems();
    }

    // 플레이메이커 등록(팀장/일반)
    function callPlaymakerReg(data) {
      switch (teamPlayamkerSlctType) {
        case 1:
          selectPlaymakerLeader(data);
          break;
        case 2:
          selectPlaymaker(data);
          break;
      }
    }

    function callList() {
      teamSearch.pageNo = teamPagingInfo.pageNo;
      teamSearch.pagePerCnt = teamPagingInfo.pageCnt;
      let apiURL = '/rest/broadcast/playmaker/teams';
      util.getAjaxData("getTeamlList", apiURL, teamSearch, function (id, response, params) {
        renderPlaymakerTeamList(id, response, params);
      }, null, {type: 'GET'});
    }

    function renderPlaymakerTeamList(id, response, params) {
      let template, templateScript, context, html;
      template = $('#tmp-playmaker-team-list').html();
      templateScript = Handlebars.compile(template);
      context = response.listData.map(function (item, index) {
        item.index_no = response.totalCnt - (((teamPagingInfo.pageNo - 1) * teamPagingInfo.pageCnt) + index);
        return item;
      });
      html = templateScript(context);
      $("#playmaker-team-list").html(html);

      teamPagingInfo.totalCnt = response.totalCnt;
      util.renderPagingNavigation('playmaker-team-top', teamPagingInfo);
      util.renderPagingNavigation('playmaker-team-bottom', teamPagingInfo);

      if (response.listData.length === 0) {
        $('#playmaker-team-top').hide();
        $('#playmaker-team-bottom').hide();
      } else {
        $('#playmaker-team-top').show();
        $('#playmaker-team-bottom').show();
      }
    }

    function callTeamReg() {
      if ($.trim(teamData.teamName) == '') {
        alert('팀이름을 등록하세요.');
        $teamRoot.find('input[name="teamName"]').focus();
        return;
      }
      let apiURL = '/rest/broadcast/playmaker/teams';
      util.getAjaxData("createTeams", apiURL, teamData, function (id, response, params) {
        if (response.s_return < 1) {
          alert('중복되는 팀이 존재합니다.');
          $teamRoot.find('input[name="teamName"]').focus();
          return;
        }
        teamPagingInfo.pageNo = 1;
        callList();
      }, null, {type: 'POST'});
    }

    // 팀삭제
    function callPlaymakerTeamRemove() {
      if (!confirm('삭제하면 복구할 수 없습니다.\n정말 삭제하시겠습니까?')) return;
      let $playmakerEditModal = $('#playmakerTeamEdit');
      $playmakerEditModal.modal('hide');

      let apiURL = '/rest/broadcast/playmaker/teams/team-delete';
      util.getAjaxData("removeTeam", apiURL, playMakerTeamMemDelVo, function (id, response, params) {
        $playmakerEditModal.modal('hide');
        if (response.s_return === 1) {
          teamEventData.callList();
        }
      }, null, {type: 'POST'});
    }

    // 팀원 등록
    function callPlaymakerTeamEdit() {
      let $playmakerEditModal = $('#playmakerTeamEdit');
      if (playMakerTeamMemLeader.memNo) {
        playMakerTeamMems.push(playMakerTeamMemLeader);
      }
      let apiURL = '/rest/broadcast/playmaker/teams/members';
      util.getAjaxData("createTeamMembers", apiURL, JSON.stringify(playMakerTeamMems), function (id, response, params) {
        $playmakerEditModal.modal('hide');
        teamPagingInfo.pageNo = 1;
        callList();
      }, null, {type: 'POST', contentType: 'application/json'});
    }

    // 팀수정
    function onPlaymakerTeamEdit(data) {
      isModifyMode = false;
      playMakerTeamMems = [];
      $('#playmakerTeamMembers').empty();
      let $playmakerEditModal = $('#playmakerTeamEdit');
      $playmakerEditModal.find('.playmaker-team-name').html(data.team_name);

      if (data.mem_no) {
        playMakerTeamMemLeader.teamNo = data.team_no;
        playMakerTeamMemLeader.memNo = data.mem_no;
        playMakerTeamMemLeader.memNick = data.mem_nick;
        $('#playmaker-team-mem-nick').val(data.mem_nick);

        let apiURL = '/rest/broadcast/playmaker/teams/' + data.team_no;
        util.getAjaxData("getTeamSel", apiURL, {teamNo: data.team_no}, function (id, response, params) {
          if (response.listData) {
            response.listData.forEach(function (item) {
              if (item.mem_no !== '' && item.team_oner_yn === 'n') {
                playMakerTeamMems.push({
                  teamNo: item.team_no,
                  memNo: item.mem_no,
                  memNick: item.mem_nick,
                  memSlct: 'm'
                });
                isModifyMode = true;
              }
            });

            renderPlayMakerTeamMems();
          }
        }, null, {type: 'GET'});
      }
      playMakerTeamMemDelVo.teamNo = data.team_no;
      $playmakerEditModal.modal();
    }

    function intSearchForm() {
      teamPagingInfo.pageNo = 1;
    }

    return {
      intSearchForm: intSearchForm,
      onPlaymakerTeamEdit: onPlaymakerTeamEdit,
      callTeamMemberRemove: callTeamMemberRemove,
      callTeamReg: callTeamReg,
      callPlaymakerTeamRemove: callPlaymakerTeamRemove,
      callPlaymakerTeamEdit: callPlaymakerTeamEdit,
      callList: callList,
      callPlaymaker: callPlaymaker,
      callPlaymakerReg: callPlaymakerReg,
    }
  }());

  // 플레이메이커 팀
  function initPlaymakerTeamEvent() {
    $(document).ready(function () {
      teamEventData.intSearchForm();
      teamEventData.callList();
    });
  }

  $(function () {
    $teamRoot = $('#playmaker-team');
    $teamRoot.find('input[name="teamName"]').on('change', function () {
      let $this = $(this);
      teamData.teamName = $this.val();
    });

    let $playmakerTeamMemberSearch = $('#playmakerTeamMemberSearch');
    $('.playmaker-team-mem-search').on('click', function (e) {
      let $this = $(this);
      teamPlayamkerSlctType = parseInt($this.data('action'), 10);

      teamPlayamkerSearch.searchSlct = 1;
      teamPlayamkerSearch.searchData = '';
      $playmakerTeamMemberSearch.find('select[name="searchSlct"]').val(teamPlayamkerSearch.searchSlct);
      $playmakerTeamMemberSearch.find('input[name="searchData"]').val(teamPlayamkerSearch.searchData);
      $('#playmaker-team-members-list').empty();
      $playmakerTeamMemberSearch.modal();
    });

    // 초기화 (팀장)
    $('#playmaker-team-mem-init').on('click', function () {
      playMakerTeamMemLeader.teamNo = 0;
      playMakerTeamMemLeader.memNo = '';
      playMakerTeamMemLeader.memNick = '';
      $('#playmaker-team-mem-nick').val('');
    });

    $playmakerTeamMemberSearch.find('select[name="searchSlct"]').on('change', function () {
      let $this = $(this);
      teamPlayamkerSearch.searchSlct = parseInt($this.val(), 10);
    });

    $playmakerTeamMemberSearch.find('input[name="searchData"]').on('change', function () {
      let $this = $(this);
      teamPlayamkerSearch.searchData = $.trim($this.val());
    });
  });
</script>

<script type="text/x-handlebars-template" id="tmp-playmaker-team-slct-list">
    <ul class="text-left">
        {{#each this as |data index|}}
        <li class="text-left mt5 mb5">
            {{memNick}}
            <a href="javascript:void(0);" onclick="teamEventData.callTeamMemberRemove({{index}});">[삭제]</a>
        </li>
        {{/each}}
    </ul>
</script>

<script type="text/x-handlebars-template" id="tmp-playmaker-team-list">
    <div class="dataTables_paginate paging_full_numbers" id="playmaker-team-top"></div>
    <table id="playmaker-team-table" class="table table-sorting table-hover table-bordered">
        <colgroup>
            <col width="60px"/>
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
            <th>No.</th>
            <th>팀고유번호</th>
            <th>이름</th>
            <th>등록일</th>
            <th>팀장</th>
            <th>팀원수</th>
            <th>평균레벨</th>
            <th>총받은별<br>(플레이메이커기간)</th>
            <th>최근7일 인당 방송시간</th>
            <th>수정</th>
        </tr>
        </thead>
        <tbody id="playmaker-team-body">
        {{#each this as |data|}}
        <tr>
            <td>{{index_no}}</td>
            <td>{{team_no}}</td>
            <td>{{team_name}}</td>
            <td>{{ins_date}}</td>
            <td>
                {{#dalbit_if mem_nick '!=' ''}}
                {{mem_nick}}<br>({{{memNoLink mem_userid mem_no}}})
                {{/dalbit_if}}
                {{#dalbit_if mem_nick '==' ''}}
                -
                {{/dalbit_if}}
            </td>
            <td>{{addComma team_mem_cnt}}</td>
            <td>{{addComma team_avg_level}}</td>
            <td>{{addComma tot_rcv_byeol}}</td>
            <td>{{timeStampAllKor tot_play_time}}</td>
            <td><a href="javascript:void(0);" onclick="teamEventData.onPlaymakerTeamEdit({{json this}});">[수정]</a><br>{{chrgr_name}}
            </td>
        </tr>
        {{else}}
        <tr>
            <td colspan="11">{{isEmptyData}}</td>
        </tr>
        {{/each}}
        </tbody>
    </table>
    <div class="dataTables_paginate paging_full_numbers" id="playmaker-team-bottom"></div>
</script>

<script type="text/x-handlebars-template" id="tmp-playmaker-team-members-list">
    <table id="playmaker-team-members-table" class="table table-sorting table-hover table-bordered">
        <colgroup>
            <col width="60px"/>
            <col width="auto"/>
            <col width="auto"/>
            <col width="auto"/>
            <col width="auto"/>
            <col width="auto"/>
        </colgroup>
        <thead>
        <tr>
            <th>No.</th>
            <th>UserID</th>
            <th>닉네임</th>
            <th>연락처</th>
            <th>관리</th>
        </tr>
        </thead>
        <tbody id="playmaker-team-members-table-body">
        {{#dalbit_if mem_no '!=' ''}}
        <tr>
            <td>1</td>
            <td>{{mem_userid}}</td>
            <td>{{mem_nick}}</td>
            <td>{{phoneNumHyphen mem_phone}}</td>
            <td><a href="javascript:void(0);" onclick="teamEventData.callPlaymakerReg({{json this}})">[등록하기]</a></td>
        </tr>
        {{/dalbit_if}}
        {{#dalbit_if mem_no '==' ''}}
        <tr>
            <td colspan="5">{{isEmptyData}}</td>
        </tr>
        {{/dalbit_if}}
        </tbody>
    </table>
</script>