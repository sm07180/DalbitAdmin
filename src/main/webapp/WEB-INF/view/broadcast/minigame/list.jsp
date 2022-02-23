<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div class="col-lg-12 no-padding">
    <div class="widget-content">
        <div class="col-md-8 no-padding">
            <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist" id="tablist_con">
                <li class="active"><a href="#minigameMemberList" role="tab" data-toggle="tab">게임 참여내역</a></li>
                <li><a href="#voteHistory" role="tab" data-toggle="tab">투표진행내역</a></li>
                <li><a href="#minigameEditHistory" role="tab" data-toggle="tab">정보수정내역</a></li>
            </ul>
        </div>
        <div class="col-md-4 no-padding">
            <span id="minigame_summaryArea"></span>
        </div>
        <div class="tab-content">
            <div class="tab-pane fade in active" id="minigameMemberList">
                <div class="col-lg-12 no-padding">
                    <div class="widget widget-table">
                        <div class="widget-content">
                            <table id="tb_minigameMemberlist"
                                   class="table table-sorting table-hover table-bordered datatable">
                                <thead>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane fade" id="voteHistory">
                <div class="col-lg-12 no-padding">
                    <div class="widget widget-table">
                        <div class="widget-content">
                            <table id="tb_voteHistory" class="table table-sorting table-hover table-bordered datatable">
                                <thead>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane fade" id="minigameEditHistory">
                <div class="col-lg-12 no-padding">
                    <div class="widget widget-table">
                        <div class="widget-content">
                            <table id="tb_minigameEditHistory"
                                   class="table table-sorting table-hover table-bordered datatable">
                                <thead>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="vote-item-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <div class="vote-item-list"></div>
            </div>
        </div>
    </div>
</div>

<script>
  $(document).ready(function () {
  });

  function getBroadHistory_minigame(tmp) {     // 상세보기
    var dtList_info_detail_data = function (data) {
      data.searchText = room_no;
      data.slctType = 2;
      data.startDate = '1900.01.01';
      data.endDate = '2999.12.31';
    };
    dtList_info_detail = new DalbitDataTable($("#tb_minigameMemberlist"), dtList_info_detail_data, BroadcastDataTableSource.minigameMemberList);
    dtList_info_detail.useCheckBox(false);
    dtList_info_detail.useIndex(true);
    dtList_info_detail.setPageLength(50);
    dtList_info_detail.createDataTable(minigame_summary_table);
    // dtList_info_detail.createDataTable();

    var dtList_info_detail_data = function (data) {
      data.searchText = room_no;
      data.slctType = 2;
      data.startDate = '1900.01.01';
      data.endDate = '2999.12.31';
      data.newSearchType = 8;
    };
    dtList_info_detail2 = new DalbitDataTable($("#tb_minigameEditHistory"), dtList_info_detail_data, BroadcastDataTableSource.minigameEditHistory);
    dtList_info_detail2.useCheckBox(false);
    dtList_info_detail2.useIndex(true);
    dtList_info_detail2.setPageLength(50);
    dtList_info_detail2.createDataTable();

    // 투표하기 목록
    var dtList_info_detail_data = function (data) {
      data.memNo = mem_no;
      data.roomNo = room_no;
      data.voteSlct = 'a';
    };
    dtList_info_detail3 = new DalbitDataTable($("#tb_voteHistory"), dtList_info_detail_data, BroadcastDataTableSource.voteHistory);
    dtList_info_detail2.useCheckBox(false);
    dtList_info_detail3.useIndex(true);
    dtList_info_detail3.setPageLength(100);
    dtList_info_detail3.createDataTable();
  }

  function minigame_summary_table(json) {
    var template = $("#minigame_tableSummary").html();
    var templateScript = Handlebars.compile(template);
    var data = json.summary;
    var html = templateScript(data);
    $("#minigame_summaryArea").html(html);
  }

  // 투표상세 목록
  function callItemList(voteNo) {
    let data = {
      memNo: mem_no,
      roomNo: room_no,
      voteNo: voteNo
    };
    let apiURL = '/rest/broadcast/vote/items';
    util.getAjaxData("callItemList", apiURL, data, function (id, response, params) {
      let template, templateScript, context, html;
      template = $('#tmp_item_list').html();
      templateScript = Handlebars.compile(template);
      context = response.data;
      html = templateScript(context);
      $(".vote-item-list").html(html);

      $('#vote-item-modal').modal('show');
    }, null, {type: 'GET'});
  }
</script>

<script id="minigame_tableSummary" type="text/x-handlebars-template">
    <table class="table table-bordered table-summary pull-right no-margin">
        <thead>
        <tr>
            <th>게임 진행/참여 총합</th>
            <th>차감 달 총합</th>
        </tr>
        </thead>
        <tbody>
        <td>{{totalGoCnt}} / {{totalCnt}} 회</td>
        <td>{{totalPayAmt}} 달</td>
        </tbody>
    </table>
</script>

<script type="text/x-handlebars-template" id="tmp_item_list">
    <table class="table table-sorting table-hover table-bordered mb0">
        <colgroup>
            <col width="auto"/>
            <col width="100px"/>
        </colgroup>
        <thead>
        <tr>
            <th>항목명</th>
            <th>참여인원</th>
        </tr>
        </thead>
        <tbody>
        {{#each this as |data|}}
        <tr>
            <td>{{vote_item_name}}</td>
            <td>{{vote_mem_cnt}}명</td>
        </tr>
        {{else}}
        <tr>
            <td colspan="2">{{isEmptyData}}</td>
        </tr>
        {{/each}}
        </tbody>
    </table>
</script>