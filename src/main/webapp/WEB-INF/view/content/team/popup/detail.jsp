<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dummyData"><%= java.lang.Math.round(java.lang.Math.random() * 1000000) %>
</c:set>

<style>
    td.word {
        word-break: break-all;
        position: relative;
    }

    .init-team-conts {
        position: absolute;
        top: 5px;
        right: 5px;
    }

    .basic table td {
        text-align: left;
        padding-left: 5px;
    }

    .table-badge .borderd {
        border: 1px solid #dddddd;
    }

    .table-badge .title {
        background: #f2f2f2;
        font-weight: bold;
        padding: 5px
    }

    .table-badge .content {
        padding: 5px
    }

    #symbol-image {
        position: relative;
        width: 160px;
        height: 160px
    }

    #symbol-image img {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%
    }
</style>

<div class="basic container mb10">
    <c:if test="${param.mode != 'del'}">
        <div class="row">
            <div class="col-sm-12 text-right">
                <button type="button" class="btn btn-sm btn-danger" onclick="teamDetail.deleteTeam();">관리자삭제</button>
            </div>
        </div>
    </c:if>
    <h5 class="font-bold">기본정보</h5>
    <div class="row">
        <div class="col-sm-3">
            <div id="symbol-image"></div>
        </div>
        <div class="col-sm-9" id="team-detail"></div>
    </div>
</div>

<div class="container mb10">
    <div class="row">
        <div class="col-sm-6">
            <h5 class="font-bold">활동중인 맴버</h5>
        </div>
        <div class="col-sm-6 text-right">
            <button type="button" class="btn btn-sm btn-warning" onclick="teamDetail.callDeletedMembers();">탈퇴멤버</button>
        </div>
    </div>
    <div class="container-fluid row" id="team-member"></div>
</div>

<div class="container mb10">
    <div class="row">
        <div class="col-sm-6">
            <h5 class="font-bold">활동배지</h5>
        </div>
    </div>
    <div class="container-fluid row" id="team-badge"></div>
</div>

<div class="modal fade" id="deletedMembers" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" style="width: 700px">
        <div class="modal-content">
            <div class="modal-header">
                <div class="row">
                    <div class="col-sm-6">
                        <h5 class="modal-title font-bold">탈퇴멤버</h5>
                    </div>
                    <div class="col-sm-6">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                </div>
            </div>
            <div class="modal-body">
                <table class="table table-bordered">
                    <colgroup>
                        <col width="10%">
                        <col width="40%">
                        <col width="10%">
                        <col width="40%">
                    </colgroup>
                    <tbody>
                    <tr>
                        <th>팀이름</th>
                        <td><span id="teamNameModal"></span></td>
                        <th>팀번호</th>
                        <td><span id="teamNoModal"></span></td>
                    </tr>
                    </tbody>
                </table>
                <div id="team-deleted-members"></div>
            </div>
        </div>
    </div>
</div>

<script>
  let teamNo = ${param.teamNo};
  let mode = '${param.mode}';

  let teamInfo = null;
  const teamPagingInfo = new PAGING_INFO(0, 1, 10);
  const teamDetail = (function () {
    function getTeam() {
      let data = {
        teamNo: teamNo
      };

      let apiURL = '/rest/content/team/detail';
      if (mode === 'del') apiURL += '-deleted';
      util.getAjaxData("getTeamDetail", apiURL, data, renderTeamDetail, null, {type: 'GET'});
    }

    // 상세정보
    function renderTeamDetail(id, response, params) {
      teamInfo = response.team;
      renderSymbol(response.team);
      renderDetail(response.team);
      rederMemberList(response.memberList);
      rederBadgeList(response.badgeList);
    }

    function renderSymbol(team) {
      if (!team) return;

      let symbolImages = [];
      symbolImages.push('<img src="https://image.dalbitlive.com/team/parts/B/' + team.team_bg_code + '.png">');
      symbolImages.push('<img src="https://image.dalbitlive.com/team/parts/E/' + team.team_edge_code + '.png">');
      symbolImages.push('<img src="https://image.dalbitlive.com/team/parts/M/' + team.team_medal_code + '.png">');
      $('#symbol-image').html(symbolImages.join('\n'));
    }

    function renderDetail(team) {
      if (!team) return;

      let template, templateScript, context, html;
      template = $('#tmp-team-detail').html();
      templateScript = Handlebars.compile(template);
      context = team;
      html = templateScript(context);
      $("#team-detail").html(html);
    }

    function rederMemberList(memberList) {
      if (!memberList) return;

      let template, templateScript, context, html;
      template = $('#tmp-team-member-list').html();
      templateScript = Handlebars.compile(template);
      context = memberList;
      html = templateScript(context);
      $("#team-member").html(html);
    }

    function rederBadgeList(badgeList) {
      if (!badgeList) return;

      let template, templateScript, context, html;
      template = $('#tmp-team-badge-list').html();
      templateScript = Handlebars.compile(template);
      context = badgeList;
      html = templateScript(context);
      $("#team-badge").html(html);
    }

    // 팀관리자 삭제
    function deleteTeam() {
      if (!teamInfo || !teamInfo.team_no) return;
      if (!confirm('팀정보를 삭제하시겠습니까?')) return;

      let data = {
        teamNo: teamInfo.team_no,
        masterMemNo: teamInfo.master_mem_no
      };
      let apiURL = '/rest/content/team/delete';
      util.getAjaxData("deleteTeam", apiURL, data, function (id, response, params) {
        if (response.s_return == 1) {
          alert('삭제하였습니다.');
          try {
            window.opener.popupAction();
            self.close();
          } catch (e) {}
        }
      }, null, {type: 'POST'});
    }

    // 팀소개글 초기화
    function initTeamConts() {
      if (!teamInfo || !teamInfo.team_no) return;
      if (!confirm('소개글을 초기화하시겠습니까?')) return;

      let data = {
        memNo: teamInfo.master_mem_no,
        updSlct: 'b',
        teamNo: teamInfo.team_no,
        teamName: teamInfo.team_name,
        teamConts: '',
        teamMedalCode: teamInfo.team_medal_code,
        teamEdgeCode: teamInfo.team_edge_code,
        teamBgCode: teamInfo.team_bg_code,
        reqMemYn: teamInfo.req_mem_yn ? teamInfo.req_mem_yn : 'n'
      };
      let apiURL = '/rest/content/team/modify';
      util.getAjaxData("initTeamConts", apiURL, data, function (id, response, params) {
        if (response.s_return == 1) {
          alert('소개글을 초기화 하였습니다..');
          try {
            getTeam();
          } catch (e) {}
        }
      }, null, {type: 'POST'});
    }

    // 멤버강퇴
    function withdrawal(json) {
      if (!json || !json.team_no) return;
      if (!teamInfo || !teamInfo.team_no) return;
      if (!confirm('멤버를 강퇴하시겠습니까?')) return;

      let data = {
        teamNo: json.team_no,
        delSclt: 'c',
        tmMemNo: json.tm_mem_no,
        masterMemNo: teamInfo.master_mem_no
      };
      let apiURL = '/rest/content/team/withdrawal';
      util.getAjaxData("withdrawal", apiURL, data, function (id, response, params) {
        if (response.s_return == 1) {
          getTeam();
        }
      }, null, {type: 'POST'});
    }

    // 탈퇴멤버
    function callDeletedMembers() {
      if (!teamInfo || !teamInfo.team_no) return;
      $('#team-deleted-members').empty();

      $('#teamNameModal').text(teamInfo.team_name);
      $('#teamNoModal').text(teamInfo.team_no);

      teamPagingInfo.pageNo = 1;
      deletedMembers();
    }

    // 탈퇴멤버
    function deletedMembers() {
      if (!teamInfo || !teamInfo.team_no) return;

      let data = {
        teamNo: teamInfo.team_no,
        pageNo: teamPagingInfo.pageNo,
        pagePerCnt: teamPagingInfo.pageCnt
      };
      let apiURL = '/rest/content/team/member-deleted';
      util.getAjaxData("deletedMembers", apiURL, data, rederdeletedMemberList, null, {type: 'GET'});
    }

    // 탈퇴멤버 목록
    let delProcNameCode = {
      m: '팀장탈퇴',
      t: '본인탈퇴',
      c: '관리자탈퇴',
      e: '회원탈퇴',
      d: '팀삭제'
    };
    function rederdeletedMemberList(id, response, params) {
      let template, templateScript, context, html;
      template = $('#tmp-dalla-team-list').html();
      templateScript = Handlebars.compile(template);
      context = response.listData.map(function (item, index) {
        item.delProcName = delProcNameCode[item.del_proc_slct];
        return item;
      });
      html = templateScript(context);
      $("#team-deleted-members").html(html);

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

      $('#deletedMembers').modal('show');
    }

    return {
      getTeam: getTeam,
      deleteTeam: deleteTeam,
      initTeamConts: initTeamConts,
      withdrawal: withdrawal,
      deletedMembers: deletedMembers,
      callDeletedMembers: callDeletedMembers
    };
  }());

  function handlebarsPaging(targetId, pagingInfo) {
    teamPagingInfo.pageNo = pagingInfo.pageNo;
    teamDetail.deletedMembers();
  }

  $(document).ready(function () {
    teamDetail.getTeam();
  });
</script>

<script type="text/x-handlebars-template" id="tmp-team-detail">
    <table class="table table-bordered">
        <colgroup>
            <col width="15%"/>
            <col width="35%"/>
            <col width="15%"/>
            <col width="35%"/>
        </colgroup>
        <tbody>
        <tr>
            <th>팀이름</th>
            <td class="word">{{team_name}}</td>
            <th>팀번호</th>
            <td>{{team_no}}</td>
        </tr>
        <tr>
            <th>팀소개</th>
            <td colspan="3" class="word">
                {{team_conts}}
                <c:if test="${param.mode != 'del'}">
                    <div class="init-team-conts"><a href="javascript:void(0);" onclick="teamDetail.initTeamConts();">[초기화]</a></div>
                </c:if>
            </td>
        </tr>
        <tr>
            <th>생성일시</th>
            <td>{{ins_date}}</td>
            <th>삭제일시</th>
            <td>{{del_date}}</td>
        </tr>
        <tr>
            <th>선물달</th>
            <td>{{addComma tot_send_dal_cnt}}</td>
            <th>받은별</th>
            <td>{{addComma tot_rcv_byeol_cnt}}</td>
        </tr>
        <tr>
            <th>최근 7일<br>방송시간</th>
            <td colspan="3">{{timeStampDay tot_play_time}}</td>
        </tr>
        </tbody>
    </table>
</script>

<script type="text/x-handlebars-template" id="tmp-team-member-list">
    <table class="table table-bordered">
        <thead>
        <tr>
            <th>회원번호</th>
            <th>닉네임</th>
            <th>기여도</th>
            <th>가입일</th>
            <th>받은별</th>
            <th>선물달</th>
            <th>최근 7일<br>방송시간</th>
            <c:if test="${param.mode != 'del'}">
                <th>관리</th>
            </c:if>
        </tr>
        </thead>
        <tbody>
        {{#each this as |data|}}
        <tr>
            <td>{{{memNoLink tm_mem_no tm_mem_no}}}</td>
            <td>
                {{tm_mem_nick}}
                {{#dalbit_if team_mem_type '==' 'm'}}<br><span style="color: #0A6AA1">(팀장)</span> {{/dalbit_if}}
            </td>
            <td>{{addComma tm_mem_score}}</td>
            <td>{{ins_date}}</td>
            <td>{{addComma send_dal_cnt}}</td>
            <td>{{addComma rcv_byeol_cnt}}</td>
            <td>{{timeStampDay play_time}}</td>
            <c:if test="${param.mode != 'del'}">
                <td><a href="javascript:void(0);" onclick="teamDetail.withdrawal({{json data}});">[강퇴]</a></td>
            </c:if>
        </tr>
        {{else}}
        <tr>
            <c:choose>
                <c:when test="${param.mode != 'del'}">
                    <td colspan="8">{{isEmptyData}}</td>
                </c:when>
                <c:otherwise>
                    <td colspan="7">{{isEmptyData}}</td>
                </c:otherwise>
            </c:choose>
        </tr>
        {{/each}}
        </tbody>
    </table>
</script>

<script type="text/x-handlebars-template" id="tmp-team-badge-list">
    {{#each this as |data|}}
    <div class="col-sm-6 table-badge">
        <div class="row">
            <div class="col-sm-4 borderd title">{{bg_name}}</div>
            <div class="col-sm-8 borderd content">{{addComma bg_achieve}} / {{addComma bg_objective}}</div>
        </div>
    </div>
    {{else}}
    <div class="col-sm-12 text-center">
        {{isEmptyData}}
    </div>
    {{/each}}
</script>

<script type="text/x-handlebars-template" id="tmp-dalla-team-list">
    <div class="dataTables_paginate paging_full_numbers" id="dalla-team-top"></div>
    <table id="dalla-team-table" class="table table-sorting table-hover table-bordered">
        <colgroup>
            <col width="auto"/>
            <col width="auto"/>
            <col width="150px"/>
            <col width="150px"/>
            <col width="100px"/>
        </colgroup>
        <thead>
        <tr>
            <th>회원번호</th>
            <th>닉네임</th>
            <th>가입일시</th>
            <th>탈퇴일시</th>
            <th>탈퇴구분</th>
        </tr>
        </thead>
        <tbody id="dalla-team-table-body">
        {{#each this as |data|}}
        <tr>
            <td>{{{memNoLink tm_mem_no tm_mem_no}}}</td>
            <td>{{tm_mem_nick}}</td>
            <td>{{ins_date}}</td>
            <td>{{del_date}}</td>
            <td>{{delProcName}}</td>
        </tr>
        {{else}}
        <tr>
            <td colspan="5">{{isEmptyData}}</td>
        </tr>
        {{/each}}
        </tbody>
    </table>
    <div class="dataTables_paginate paging_full_numbers" id="dalla-team-bottom"></div>
</script>