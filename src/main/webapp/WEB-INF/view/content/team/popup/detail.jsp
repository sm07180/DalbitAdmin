<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dummyData"><%= java.lang.Math.round(java.lang.Math.random() * 1000000) %></c:set>

<style>
    .basic table td {
        text-align: left;
        padding-left: 5px;
    }

    .table-badge .borderd {border: 1px solid #dddddd;}
    .table-badge .title {background: #f2f2f2; font-weight: bold; padding: 5px}
    .table-badge .content {padding: 5px}

    #symbol-image {position: relative; width: 160px; height: 160px}
    #symbol-image img {position: absolute; top: 0; left: 0; width: 100%; height: 100%}
</style>

<div class="basic container mb10">
    <h5 class="font-bold">기본정보</h5>
    <div class="container-fluid row">
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
            <button type="button" class="btn btn-sm btn-warning">탈퇴멤버</button>
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

<script>
    let teamNo = ${param.teamNo};

    const teamDetail = (function () {
      function getTeam() {
        let data = {
          teamNo: teamNo
        };
        let apiURL = '/rest/content/team/detail';
        util.getAjaxData("getTeamDetail", apiURL, data, renderTeamDetail, null, {type: 'GET'});
      }

      // 상세정보
      function renderTeamDetail(id, response, params) {
        renderSymbol(response.team);
        renderDetail(response.team);
        rederMemberList(response.memberList);
        rederBadgeList(response.badgeList);
      }

      function renderSymbol(team) {
        if (!team) return;

        let symbolImages = [];
        symbolImages.push('<img src="https://image.dalbitlive.com/team/parts/E/' + team.team_bg_code + '.png">');
        symbolImages.push('<img src="https://image.dalbitlive.com/team/parts/B/' + team.team_edge_code + '.png">');
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

      return {
        getTeam: getTeam
      };
    }());

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
            <td>{{team_name}}</td>
            <th>팀번호</th>
            <td>{{team_no}}</td>
        </tr>
        <tr>
            <th>팀소개</th>
            <td colspan="3">{{team_conts}}</td>
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
            <th>관리</th>
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
            <td>[강퇴]</td>
        </tr>
        {{else}}
        <tr>
            <td colspan="8">{{isEmptyData}}</td>
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