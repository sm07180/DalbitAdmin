<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    #actor-list {list-style: none;padding:0;}
</style>

<!-- 아이템 방송-TTS 현황 -->
<div class="widget widget-table mb10">
    <div class="widget-content mt10">
        <span class="_searchDate2"></span><br>
        <br>
        <span class="font-bold">[성우코드]</span>
        <ul id="actor-list"></ul>
        <div id="tts-summary"></div>
        <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist" id="tts_con">
            <li class="active"><a href="#tts-total" role="tab" data-toggle="tab" data-slctno="">전체</a></li>
            <li><a href="#tts-use" role="tab" data-toggle="tab" data-slctno="y">TTS 사용 건</a></li>
            <li><a href="#tts-nouse" role="tab" data-toggle="tab" data-slctno="n">TTS 미사용 건</a></li>
        </ul>
        <div id="tts-reault"></div>
    </div>
</div>

<script type="text/javascript">
  let actor = {
    a: '빠다가이',
    b: '하나'
  }
  let slctNo = '';
  giftBroadcastTTSListPagingInfo = new PAGING_INFO(0, 1, 50);

  $(function () {
    getBroadTTSList();
    actorList();

    $('#tts_con > li > a').on('click', function(e) {
      var $this = $(this);
      slctNo = $this.data('slctno');
      giftBroadcastTTSListPagingInfo.pageNo = 1;
      getBroadTTSList();
    });
  });

  function actorList() {
    $('#actor-list').empty();
    let actorList = [];
    for (const key in actor) {
      actorList.push('<li>' + key + ': ' + actor[key] + '</li>');
    }
    $('#actor-list').html(actorList.join('\n'));
  }

  function getBroadTTSList() {
    $('#tts-summary').empty();
    $("#tts-reault").empty();
    $("#searchForm #pageNo").val(giftBroadcastTTSListPagingInfo.pageNo);
    $("#searchForm #pageCnt").val(giftBroadcastTTSListPagingInfo.pageCnt);

    var tDate = $("#startDate").val().replace(/[.]/g, '-');
    var data = {
      slctType: $('input[name="slctType2"]:checked').val(),
      tDate: tDate,
      ttsMsgYn: slctNo,
      pageNo: giftBroadcastTTSListPagingInfo.pageNo,
      pagePerCnt: giftBroadcastTTSListPagingInfo.pageCnt
    };
    util.getAjaxData("memberList", "/rest/status/item/broad-tts/list", data, fn_broadTTS_success);
  }

  function fn_broadTTS_success(data, response) {
    let template, templateScript, context, html;
    template = $('#tmp-tts-summary').html();
    templateScript = Handlebars.compile(template);

    // 전체 아이템 사용 건 수: totalItemCnt
    // TTS 옵션이 있는 아이템 사용 건 수: totalTTSItemCnt
    // TTS 옵션이 있는 아이템 사용 달 수: totalTTSItemDalCnt
    // TTS 옵션 사용 건 수: totalTTSOptCnt
    // TTS 옵션 사용 건 수: totalTTSOptText
    // TTS 옵션 사용 달 수: totalTTSOptDalCnt
    // TTS 옵션 사용 달 수: totalTTSOptDalText
    // 전체 대비 TTS 옵션 사용률: totalTTSRate
    let summaryData = {
      totalItemCnt: 0,
      totalTTSItemCnt: 0,
      totalTTSItemDalCnt: 0,
      totalTTSOptCnt: 0,
      totalTTSOptText: '',
      totalTTSOptDalCnt: 0,
      totalTTSOptDalText: '',
      totalTTSRate: 0
    };

    // the_date: "2022-04-18"
    // tot_send_cnt: 1
    // tot_send_dal_cnt: 100
    // tot_tts_dal_cnt: 100
    // tot_tts_send_cnt: 1
    // tts_crt_slct: "a"
    // tts_dal_cnt: 0
    // tts_msg_dal_cnt: 100
    // tts_msg_send_cnt: 1
    // tts_send_cnt: 0
    let optText = [];
    let optDalText = [];
    response.summary.map(function (item, index) {
      summaryData.totalItemCnt += item.tot_send_cnt;
      summaryData.totalTTSItemCnt += item.tts_msg_send_cnt + item.tts_send_cnt;
      summaryData.totalTTSItemDalCnt += item.tts_msg_dal_cnt + item.tts_dal_cnt;
      summaryData.totalTTSOptCnt += item.tts_msg_send_cnt;
      optText.push(actor[item.tts_crt_slct] + ': ' + common.addComma(item.tts_msg_send_cnt));
      summaryData.totalTTSOptDalCnt += item.tts_msg_dal_cnt;
      optDalText.push(actor[item.tts_crt_slct] + ': ' + common.addComma(item.tts_msg_dal_cnt));
      return item;
    });
    summaryData.totalTTSOptText = optText.join(', ');
    summaryData.totalTTSOptDalText = optDalText.join(', ');
    if (summaryData.totalTTSOptCnt > 0 && summaryData.totalItemCnt > 0) {
      summaryData.totalTTSRate = ((summaryData.totalTTSOptCnt / summaryData.totalItemCnt) * 100).toFixed(2);
    }

    context = summaryData;
    html = templateScript(context);
    $("#tts-summary").html(html);

    template = $('#tmp-tts-list').html();
    templateScript = Handlebars.compile(template);
    context = response.listData.map(function (item, index) {
      item.index_no = response.totalCnt - (((giftBroadcastTTSListPagingInfo.pageNo - 1) * giftBroadcastTTSListPagingInfo.pageCnt) + index);
      item.actor_name = actor[item.tts_crt_slct];
      return item;
    });
    html = templateScript(context);
    $("#tts-reault").html(html);

    giftBroadcastTTSListPagingInfo.totalCnt = response.totalCnt;
    util.renderPagingNavigation('tts-top', giftBroadcastTTSListPagingInfo);
    util.renderPagingNavigation('tts-bottom', giftBroadcastTTSListPagingInfo);

    if (response.listData.length === 0) {
      $('#tts-top').hide();
      $('#tts-bottom').hide();
    } else {
      $('#tts-top').show();
      $('#tts-bottom').show();
    }
  }
</script>

<script type="text/x-handlebars-template" id="tmp-tts-summary">
    <table class="table table-hover table-bordered">
        <colgroup>
            <col width="240px">
            <col width="auto">
            <col width="240px">
            <col width="auto">
        </colgroup>
        <tbody>
        <tr>
            <th class="text-left">전체 아이템 사용 건 수</th>
            <td class="text-left" colspan="3">{{addComma totalItemCnt}}</td>
        </tr>
        <tr>
            <th class="text-left"`>TTS 옵션이 있는 아이템 사용 건 수</th>
            <td class="text-left">{{addComma totalTTSItemCnt}}</td>
            <th class="text-left">TTS 옵션이 있는 아이템 사용 달 수</th>
            <td class="text-left">{{addComma totalTTSItemDalCnt}}</td>
        </tr>
        <tr>
            <th class="text-left">TTS 옵션 사용 건 수</th>
            <td class="text-left">
                {{addComma totalTTSOptCnt}}
                ({{totalTTSOptText}})
            </td>
            <th class="text-left">TTS 옵션 사용 달 수</th>
            <td class="text-left">
                {{addComma totalTTSOptDalCnt}}
                ({{totalTTSOptDalText}})
            </td>
        </tr>
        <tr>
            <th class="text-left">전체 대비 TTS 옵션 사용률</th>
            <td class="text-left" colspan="3">{{totalTTSRate}}%</td>
        </tr>
        </tbody>
    </table>
</script>

<script type="text/x-handlebars-template" id="tmp-tts-list">
    <div class="dataTables_paginate paging_full_numbers" id="tts-top"></div>
    <table id="tts-table" class="table table-sorting table-hover table-bordered">
        <colgroup>
            <col width="60px"/>
            <col width="120px"/>
            <col width="100px"/>
            <col width="100px"/>
            <col width="100px"/>
            <col width="100px"/>
            <col width="auto"/>
            <col width="100px"/>
            <col width="100px"/>
            <col width="100px"/>
        </colgroup>
        <thead>
        <tr>
            <th>No.</th>
            <th>선물일시</th>
            <th>보낸 회원 번호</th>
            <th>닉네임</th>
            <th>보낸선물</th>
            <th>달 사용</th>
            <th>TTS메시지</th>
            <th>목소리</th>
            <th>받은 회원 번호</th>
            <th>닉네임</th>
        </tr>
        </thead>
        <tbody id="tts-table-body">
        {{#each this as |data|}}
        <tr>
            <td>{{index_no}}</td>
            <td>{{ins_date}}</td>
            <td>{{{memNoLink send_mem_no send_mem_no}}}</td>
            <td>{{send_mem_nick}}</td>
            <td>{{item_name}}</td>
            <td>{{addComma send_dal_cnt}}</td>
            <td>{{tts_msg}}</td>
            <td>{{actor_name}}</td>
            <td>{{{memNoLink rcv_mem_no rcv_mem_no}}}</td>
            <td>{{rcv_mem_nick}}</td>
        </tr>
        {{else}}
        <tr>
            <td colspan="10">{{isEmptyData}}</td>
        </tr>
        {{/each}}
        </tbody>
    </table>
    <div class="dataTables_paginate paging_full_numbers" id="tts-bottom"></div>
</script>