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
                                <input type="text" name="memNick" id="playmaker-team-mem-nick" class="form-control" value="" readonly>
                                <button type="button" class="btn btn-success playmaker-team-mem-search">회원검색</button>
                                <button type="button" class="btn btn-default" id="playmaker-team-mem-init">초기화</button>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th>팀원(필수)</th>
                        <td>
                            <div>
                                <button type="button" class="btn btn-block btn-success playmaker-team-mem-search">회원검색</button>
                                <div></div>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" onclick="teamEventData.callPlaymakerTeamRemove();">삭제</button>
                <button type="button" class="btn btn-default" data-dismiss="modal" aria-hidden="true">닫기</button>
                <button type="button" class="btn btn-primary" onclick="teamEventData.callPlaymakerTeamEdit();">저장</button>
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
  const playMakerTeamMems = [];
  const playMakerTeamMemDelVo = {
    teamNo: '',
    memNo: ''
  }
  const teamPagingInfo = new PAGING_INFO(0, 1, 50);
  const teamEventData = (function () {
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
      let $playmakerEditModal = $('#playmakerEdit');

      console.log(playMakerTeamMemDelVo);
      // let apiURL = '/rest/broadcast/playmaker/teams/members-delete';
      // util.getAjaxData("removeTeam", apiURL, playMakerMemVo, function (id, response, params) {
      //   $playmakerEditModal.modal('hide');
      //   if (response.s_return === 1) {
      //     teamEventData.callList();
      //   }
      // }, null, {type: 'POST'});
    }

    // 팀원 등록
    function callPlaymakerTeamEdit() {
      teamPagingInfo.pageNo = 1;
      callList();
    }

    // 팀수정
    function onPlaymakerTeamEdit(data) {
      let $playmakerEditModal = $('#playmakerTeamEdit');
      $playmakerEditModal.find('.playmaker-team-name').html(data.team_name);
      $('#playmaker-team-mem-nick').val(data.mem_nick);
      playMakerTeamMemDelVo.teamNo = data.team_no;
      $playmakerEditModal.modal();
    }

    function intSearchForm() {
      teamPagingInfo.pageNo = 1;
    }

    return {
      intSearchForm: intSearchForm,
      onPlaymakerTeamEdit: onPlaymakerTeamEdit,
      callTeamReg: callTeamReg,
      callPlaymakerTeamRemove: callPlaymakerTeamRemove,
      callPlaymakerTeamEdit: callPlaymakerTeamEdit,
      callList: callList
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
  });
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
            <td>{{mem_nick}}<br>({{{memNoLink mem_userid mem_no}}})</td>
            <td>{{addComma team_mem_cnt}}</td>
            <td>{{addComma team_avg_level}}</td>
            <td>{{addComma tot_rcv_byeol}}</td>
            <td>{{timeStampAllKor tot_play_time}}</td>
            <td><a href="javascript:void(0);" onclick="teamEventData.onPlaymakerTeamEdit({{json this}});">[수정]</a><br>{{chrgr_name}}</td>
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