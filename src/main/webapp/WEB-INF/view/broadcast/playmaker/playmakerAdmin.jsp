<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="col-lg-12 no-padding mt10 mb10" id="playmaker-admin">
    <div class="widget-content">
        <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist" id="admin-end-slct">
            <li class="active"><a href="#play-on" role="tab" data-toggle="tab" data-end-slct="p">활동</a></li>
            <li><a href="#play-off" role="tab" data-toggle="tab" data-end-slct="e">미활동</a></li>
        </ul>
        <div style="position: relative; width: 100%; height: 43px; margin-top: 10px" id="admin-search">
            <div style="float: left;">
                <button type="button" class="btn btn-primary" onclick="adminEventData.onPlaymakerReg();">플레이메이커 등록</button>
            </div>
            <div style="float: right;">
                <div class="form-inline">
                    <select name="ordSlct" class="form-control ordSlct">
                        <option value="b">받은별 높은순</option>
                        <option value="s">선물한 회원많은순</option>
                        <option value="p">방송시간많은순</option>
                    </select>
                    <input type="number" class="form-control teamNo" name="teamNo" value="" placeholder="팀번호">
                    <button type="button" class="btn btn-custom-secondary" onclick="adminEventData.callList();">검색
                    </button>
                </div>
            </div>
        </div>
        <div class="tab-content">
            <div class="tab-pane fade in active" id="play-on">
                <div id="playmaker-list-p"></div>
            </div>
            <div class="tab-pane fade" id="play-off">
                <div id="playmaker-list-e"></div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="playmakerReg" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
                        <th>플레이메이커</th>
                        <td>
                            <div class="form-inline">
                                <input type="text" name="memNicks" id="admin-mem-nicks" class="form-control" value="" readonly>
                                <button type="button" class="btn btn-success" id="playmaker-mem-search">회원검색</button>
                                <button type="button" class="btn btn-default" id="playmaker-mem-init">초기화</button>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th>활동기간</th>
                        <td>
                            <div class="input-group date" id="rangeDatepicker">
                                <label for="rangeDate" class="input-group-addon">
                                    <span><i class="fa fa-calendar"></i></span>
                                </label>
                                <input id="rangeDate" type="text" class="form-control"/>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th>환전 시 수수료(%)</th>
                        <td>
                            <input type="text" maxlength="2" name="exc_cms" class="form-control" style="width: 60px;" value="" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                        </td>
                    </tr>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" aria-hidden="true">닫기</button>
                <button type="button" class="btn btn-primary" onclick="adminEventData.callPlaymakerReg();">등록</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="playmakerEdit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
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
                        <td><span class="admin-team-name"></span></td>
                    </tr>
                    <tr>
                        <th>플레이메이커</th>
                        <td><span class="admin-mem-name"></span></td>
                    </tr>
                    <tr>
                        <th>활동기간</th>
                        <td>
                            <div class="input-group date" id="rangeDatepicker2">
                                <label for="rangeDate2" class="input-group-addon">
                                    <span><i class="fa fa-calendar"></i></span>
                                </label>
                                <input id="rangeDate2" type="text" class="form-control"/>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th>환전 시 수수료(%)</th>
                        <td>
                            <input type="text" maxlength="2" name="exc_cms" class="form-control" style="width: 60px;" value="" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                        </td>
                    </tr>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" aria-hidden="true">닫기</button>
                <button type="button" class="btn btn-danger" onclick="adminEventData.callPlaymakerRemove();">삭제</button>
                <button type="button" class="btn btn-primary" onclick="adminEventData.callPlaymakerEdit();">수정</button>
            </div>
        </div>
    </div>
</div>

<script>
  let $adminRoot = null;
  let adminMemNos = [];
  let adminMemNicks = [];
  let adminMemNoMaxCount = 10;
  const adminSearch = {
    teamNo: '',
    ordSlct: 'b',
    endSlct: 'p',
    pageNo: 1,
    pagePerCnt: 50
  }
  const playMakerMemVo = {
    memNo: '',
    memNos: '',
    excCms: 0,
    sDate: '',
    eDate: ''
  }
  const adminPagingInfo = new PAGING_INFO(0, 1, 50);
  const adminEventData = (function () {
    // 플레이메이커 목록
    function callList() {
      $("#playmaker-list-" + adminSearch.endSlct).empty();
      adminSearch.teamNo = adminSearch.teamNo ? parseInt(adminSearch.teamNo, 10) : 0;
      adminSearch.pageNo = adminPagingInfo.pageNo;
      adminSearch.pagePerCnt = adminPagingInfo.pageCnt;
      let apiURL = '/rest/broadcast/playmaker/list';
      util.getAjaxData("getPlaymakerList", apiURL, adminSearch, function (id, response, params) {
        renderPlaymakerList(id, response, params);
      }, null, {type: 'GET'});
    }

    // 플레이메이커 목록 출력
    function renderPlaymakerList(id, response, params) {
      let template, templateScript, context, html;
      template = $('#tmp-playmaker-admin-' + adminSearch.endSlct + '-list').html();
      templateScript = Handlebars.compile(template);
      context = response.listData.map(function (item, index) {
        item.index_no = response.totalCnt - (((adminPagingInfo.pageNo - 1) * adminPagingInfo.pageCnt) + index);
        return item;
      });
      html = templateScript(context);
      $("#playmaker-list-" + adminSearch.endSlct).html(html);

      adminPagingInfo.totalCnt = response.totalCnt;
      util.renderPagingNavigation('playmaker-admin-' + adminSearch.endSlct + '-top', adminPagingInfo);
      util.renderPagingNavigation('playmaker-admin-' + adminSearch.endSlct + '-bottom', adminPagingInfo);

      if (response.listData.length === 0) {
        $('#playmaker-admin-' + adminSearch.endSlct + '-top').hide();
        $('#playmaker-admin-' + adminSearch.endSlct + '-bottom').hide();
      } else {
        $('#playmaker-admin-' + adminSearch.endSlct + '-top').show();
        $('#playmaker-admin-' + adminSearch.endSlct + '-bottom').show();
      }
    }

    // 검색 초기화
    function intSearchForm() {
      adminSearch.teamNo = '';
      adminSearch.ordSlct = 'b';
      adminPagingInfo.pageNo = 1;
    }

    function initPlayMakerMemVo() {
      playMakerMemVo.memNo = '';
      playMakerMemVo.memNos = '';
      playMakerMemVo.excCms = 0;
      playMakerMemVo.sDate = '';
      playMakerMemVo.eDate = '';
    }

    // 플레이메이커 등록 모달 열기
    function onPlaymakerReg() {
      adminMemNos = [];
      adminMemNicks = [];
      playMakerMemVo.memNos = '';
      $('#admin-mem-nicks').val('');

      initPlayMakerMemVo();
      setRangeDatepicker(moment(), moment().add(90, 'days'), 'rangeDate');
      $('#playmakerReg').find('input[name="exc_cms"]').val('');
      $('#playmakerReg').modal();

      $('#playmakerReg').find('input[name="exc_cms"]').off().on('change', function(e) {
        let $this = $(this);
        playMakerMemVo.excCms = $this.val();
      });
    }

    // 플레이메이커 수정 모달 열기
    function onPlaymakerEdit(data) {
      let $playmakerEditModal = $('#playmakerEdit');
      initPlayMakerMemVo();
      playMakerMemVo.memNo = data.mem_no;
      setRangeDatepicker(moment(data.start_date), moment(data.end_date), 'rangeDate2');
      $playmakerEditModal.find('.admin-team-name').html(data.team_name);
      $playmakerEditModal.find('.admin-mem-name').html(data.mem_nick + ' (' + data.mem_userid + ')');
      $playmakerEditModal.find('input[name="exc_cms"]').val(data.exc_cms);
      $playmakerEditModal.modal();

      $playmakerEditModal.find('input[name="exc_cms"]').off().on('change', function(e) {
        let $this = $(this);
        playMakerMemVo.excCms = $this.val();
      });
    }

    // 플레이메이커 등록/수정 모달 - 캘린더 선택
    function setRangeDatepicker(startDate, endDate, fnId){
      playMakerMemVo.sDate = moment(startDate).format("YYYY-MM-DD");
      playMakerMemVo.eDate = moment(endDate).format("YYYY-MM-DD");

      $('#' + fnId).daterangepicker({
        startDate: startDate,
        endDate: endDate
      }, function(startDate, endDate){
        playMakerMemVo.sDate = moment(startDate).format("YYYY-MM-DD");
        playMakerMemVo.eDate = moment(endDate).format("YYYY-MM-DD");
      });
    }

    // 플레이메이커 등록
    function callPlaymakerReg() {
      let $playmakerRegModal = $('#playmakerReg');

      // 플레이메이커 - 검증
      if ($.trim(playMakerMemVo.memNos) == '') {
        alert('등록할 플레이메이커를 선택하세요.');
        return;
      }

      // 기간 - 검증
      if ($.trim(playMakerMemVo.sDate) == '') {
        alert('플레이메이커 시작일을 선택하세요.');
        return;
      }
      if ($.trim(playMakerMemVo.eDate) == '') {
        alert('플레이메이커 종료일을 선택하세요.');
        return;
      }

      // 수수료 - 검증
      playMakerMemVo.excCms = playMakerMemVo.excCms ? parseInt(playMakerMemVo.excCms, 10) : 0;
      if (playMakerMemVo.excCms === 0) {
        alert('수수료를 입력하여 주세요.');
        $playmakerRegModal.find('input[name="exc_cms"]').focus();
        return;
      }

      let apiURL = '/rest/broadcast/playmaker/player';
      util.getAjaxData("createPlaymaker", apiURL, playMakerMemVo, function (id, response, params) {
        alert('성공: ' + response.success + '건\n실패: ' + response.fail + '건 처리되었습니다.');
        adminEventData.callList();
        $playmakerRegModal.modal('hide');
      }, null, {type: 'POST'});
    }

    // 플레이메이커 수정
    function callPlaymakerEdit() {
      let $playmakerEditModal = $('#playmakerEdit');

      // 플레이메이커 - 검증
      if ($.trim(playMakerMemVo.memNo) == '') {
        alert('플레이메이커 정보가 없습니다.');
        $playmakerEditModal.modal('hide');
        return;
      }

      // 기간 - 검증
      if ($.trim(playMakerMemVo.sDate) == '') {
        alert('플레이메이커 시작일을 선택하세요.');
        return;
      }
      if ($.trim(playMakerMemVo.eDate) == '') {
        alert('플레이메이커 종료일을 선택하세요.');
        return;
      }

      // 수수료 - 검증
      playMakerMemVo.excCms = playMakerMemVo.excCms ? parseInt(playMakerMemVo.excCms, 10) : 0;
      if (playMakerMemVo.excCms === 0) {
        alert('수수료를 입력하여 주세요.');
        $playmakerEditModal.find('input[name="exc_cms"]').focus();
        return;
      }

      let apiURL = '/rest/broadcast/playmaker/player-update';
      util.getAjaxData("updatePlayer", apiURL, playMakerMemVo, function (id, response, params) {
        $playmakerEditModal.modal('hide');
        if (response.s_return === 1) {
          adminEventData.callList();
        }
      }, null, {type: 'POST'});
    }

    // 플레이메이커 삭제
    function callPlaymakerRemove() {
      if (!confirm('삭제하면 복구할 수 없습니다.\n정말 삭제하시겠습니까?')) return;
      let $playmakerEditModal = $('#playmakerEdit');

      // 플레이메이커 - 검증
      if ($.trim(playMakerMemVo.memNo) == '') {
        alert('플레이메이커 정보가 없습니다.');
        $playmakerEditModal.modal('hide');
        return;
      }

      let apiURL = '/rest/broadcast/playmaker/player-delete';
      util.getAjaxData("removePlayer", apiURL, playMakerMemVo, function (id, response, params) {
        $playmakerEditModal.modal('hide');
        if (response.s_return === 1) {
          adminEventData.callList();
        }
      }, null, {type: 'POST'});
    }

    return {
      intSearchForm,
      onPlaymakerReg,
      onPlaymakerEdit,
      setRangeDatepicker,
      callList,
      callPlaymakerReg,
      callPlaymakerEdit,
      callPlaymakerRemove
    }
  }());

  // 플레이메이커 관리
  function initPlaymakerAdminEvent() {
    $(document).ready(function () {
      adminEventData.intSearchForm();
      adminEventData.callList();
    });
  }

  $(document).ready(function () {
    $adminRoot = $('#playmaker-admin');
    adminEventData.callList();

    // 탭변경
    $('#admin-end-slct > li > a').on('click', function (e) {
      var $this = $(this);
      adminSearch.endSlct = $this.data('end-slct');
      adminEventData.intSearchForm();
      adminEventData.callList();
    });

    // 셀랙트박스 변경
    $adminRoot.find('select[name="ordSlct"]').on('change', function () {
      var $this = $(this);
      adminSearch.ordSlct = $this.val();
      adminEventData.callList();
    });

    // 팀번호 변경
    $adminRoot.find('input[name="teamNo"]').on('change', function () {
      var $this = $(this);
      adminSearch.teamNo = $this.val();
    });

    // 회원검색
    $('#playmaker-mem-search').on('click', function () {
      showPopMemberList(function(data) {
        if (data.mem_no && !adminMemNos.includes(data.mem_no)) {
          adminMemNicks.push($.trim(data.mem_nick));
          adminMemNos.push($.trim(data.mem_no));
        }
        $('#admin-mem-nicks').val(adminMemNicks.join(','));
        playMakerMemVo.memNos = adminMemNos.join(',');
      });
    });

    // 선택된 플레이메이커 초기화
    $('#playmaker-mem-init').on('click', function () {
      adminMemNos = [];
      adminMemNicks = [];
      playMakerMemVo.memNos = '';
      $('#admin-mem-nicks').val('');
    });
  });
</script>

<script type="text/x-handlebars-template" id="tmp-playmaker-admin-p-list">
    <div class="dataTables_paginate paging_full_numbers" id="playmaker-admin-p-top"></div>
    <table id="playmaker-admin-p-table" class="table table-sorting table-hover table-bordered">
        <colgroup>
            <col width="60px"/>
            <col width="120px"/>
            <col width="auto"/>
            <col width="200px"/>
            <col width="auto"/>
            <col width="120px"/>
            <col width="150px"/>
            <col width="120px"/>
            <col width="120px"/>
            <col width="120px"/>
        </colgroup>
        <thead>
        <tr>
            <th>No.</th>
            <th>UID</th>
            <th>닉네임</th>
            <th>활동기간</th>
            <th>소속팀</th>
            <th>환전수수료</th>
            <th>최근 방송일시</th>
            <th>최근7일 방송시간</th>
            <th>누적환전금액</th>
            <th>수정</th>
        </tr>
        </thead>
        <tbody id="playmaker-admin-p-table-body">
        {{#each this as |data|}}
        <tr>
            <td>{{index_no}}</td>
            <td>{{{memNoLink mem_userid mem_no}}}</td>
            <td>{{mem_nick}}</td>
            <td>{{convertToDate start_date "YYYY-MM-DD"}} ~ {{convertToDate end_date "YYYY-MM-DD"}}</td>
            <td>
                {{team_name}}
                {{#dalbit_if team_oner_yn '==' 'y'}}<br><span style="color:blue;">(팀장)</span>{{/dalbit_if}}
            </td>
            <td>{{exc_cms}}%</td>
            <td>{{last_play_date}}</td>
            <td>{{addComma tot_play_time}}</td>
            <td>{{addComma tot_req_money}}</td>
            <td><a href="javascript:void(0);" onclick="adminEventData.onPlaymakerEdit({{json this}});">[수정]</a><br>{{chrgr_name}}</td>
        </tr>
        {{else}}
        <tr>
            <td colspan="10">{{isEmptyData}}</td>
        </tr>
        {{/each}}
        </tbody>
    </table>
    <div class="dataTables_paginate paging_full_numbers" id="playmaker-admin-p-bottom"></div>
</script>

<script type="text/x-handlebars-template" id="tmp-playmaker-admin-e-list">
    <div class="dataTables_paginate paging_full_numbers" id="playmaker-admin-e-top"></div>
    <table id="playmaker-admin-e-table" class="table table-sorting table-hover table-bordered">
        <colgroup>
            <col width="60px"/>
            <col width="120px"/>
            <col width="auto"/>
            <col width="200px"/>
            <col width="auto"/>
            <col width="120px"/>
            <col width="150px"/>
            <col width="120px"/>
            <col width="120px"/>
            <col width="120px"/>
        </colgroup>
        <thead>
        <tr>
            <th>No.</th>
            <th>UID</th>
            <th>닉네임</th>
            <th>활동기간</th>
            <th>소속팀</th>
            <th>환전수수료</th>
            <th>최근 방송일시</th>
            <th>최근7일 방송시간</th>
            <th>누적환전금액</th>
            <th>수정</th>
            <th>비고</th>
        </tr>
        </thead>
        <tbody id="playmaker-admin-e-table-body">
        {{#each this as |data|}}
        <tr>
            <td>{{index_no}}</td>
            <td>{{{memNoLink mem_userid mem_no}}}</td>
            <td>{{mem_nick}}</td>
            <td>{{convertToDate start_date "YYYY-MM-DD"}} ~ {{convertToDate end_date "YYYY-MM-DD"}}</td>
            <td>
                {{team_name}}
                {{#dalbit_if team_oner_yn '==' 'y'}}<br><span style="color:blue;">(팀장)</span>{{/dalbit_if}}
            </td>
            <td>{{exc_cms}}%</td>
            <td>{{last_play_date}}</td>
            <td>{{addComma tot_play_time}}</td>
            <td>{{addComma tot_req_money}}</td>
            <td><a href="javascript:void(0);" onclick="adminEventData.onPlaymakerEdit({{json this}});">[수정]</a><br>{{chrgr_name}}</td>
            <td>
                {{#dalbit_if del_date '!=' ''}}삭제{{/dalbit_if}}
                {{#dalbit_if del_date '==' ''}}
                {{#dalbit_if end_yn '==' 'y'}}기간만료{{/dalbit_if}}
                {{/dalbit_if}}
            </td>
        </tr>
        {{else}}
        <tr>
            <td colspan="11">{{isEmptyData}}</td>
        </tr>
        {{/each}}
        </tbody>
    </table>
    <div class="dataTables_paginate paging_full_numbers" id="playmaker-admin-e-bottom"></div>
</script>