<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form id="rebrand-main" class="searchForm mb5" onsubmit="return false;">
    <div class="widget widget-table searchBoxArea">
        <table>
            <tr>
                <th style="background-color:#4472c4;color:#e9ee17;width: 70px">
                    <i class="fa fa-search"></i><br/>검색
                </th>
                <td style="text-align: left">
                    <label><input type="text" class="form-control" name="searchVal" placeholder="아이디 입력"></label>
                    <button type="button" class="btn btn-success">검색</button>
                </td>
            </tr>
        </table>
    </div>
</form>

<div class="col-lg-12 no-padding mt10 mb10">
    <div class="widget-content">

        <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist" id="stone_con">
            <li class="active"><a href="#stone1st" role="tab" data-toggle="tab" data-seq-no="1">1회차</a></li>
            <li><a href="#stone2st" role="tab" data-toggle="tab" data-seq-no="2">2회차</a></li>
            <li><a href="#stoneTotal" role="tab" data-toggle="tab" data-seq-no="3">종합</a></li>
        </ul>
        <div class="tab-content">
            <div class="tab-pane fade in active" id="stone1st">
                <h5><strong>진행기간: 3/8 ~ 3/17</strong></h5>

                <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist" id="stone1st-inner">
                    <li class="active"><a href="#stone1st-rank" role="tab" data-toggle="tab" data-type="1">순위</a></li>
                    <li><a href="#stone1st-collect" role="tab" data-toggle="tab" data-type="2">다시뽑기</a></li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane fade in active" id="stone1st-rank"></div>
                    <div class="tab-pane fade" id="stone1st-collect">
                        <div id="stone1st-collect-summary"></div>
                        <div id="stone1st-collect-list"></div>
                    </div>
                </div>
            </div>
            <div class="tab-pane fade" id="stone2st">
                <h5><strong>진행기간: 3/18 ~ 3/27</strong></h5>

                <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist" id="stone2st-inner">
                    <li class="active"><a href="#stone2st-rank" role="tab" data-toggle="tab" data-type="1">순위</a></li>
                    <li><a href="#stone2st-collect" role="tab" data-toggle="tab" data-type="2">다시뽑기</a></li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane fade in active" id="stone2st-rank"></div>
                    <div class="tab-pane fade" id="stone2st-collect">
                        <div id="stone2st-collect-summary"></div>
                        <div id="stone2st-collect-list"></div>
                    </div>
                </div>
            </div>
            <div class="tab-pane fade" id="stoneTotal">
                <h5><strong>진행기간: 3/8 ~ 3/27</strong></h5>

                <div id="stone-collect-total"></div>
            </div>
        </div>
    </div>
</div>

<script>
  let $mainRoot = null;
  const mainSearch = {
    seqNo: 1,
    type: 1,
    searchData: ''
  }
  const mainPagingInfo = new PAGING_INFO(0, 1, 50);
  const mainEventData = (function () {
    // 회차별 순위 목록
    function getRankList() {
      let data = {
        memId: mainSearch.searchData,
        seqNo: mainSearch.seqNo,
        pageNo: mainPagingInfo.pageNo,
        pagePerCnt: mainPagingInfo.pageCnt
      };
      let apiURL = '/rest/content/event/rebrand/collect-ranks';
      util.getAjaxData("getRankList", apiURL, data, function (id, response, params) {
        renderRankList(id, response, params);
      }, null, {type: 'GET'});
    }

    // 회차별 순위 목록 출력
    function renderRankList(id, response, params) {
      let template, templateScript, context, html;
      template = $('#tmp-collect-ranks-list').html();
      templateScript = Handlebars.compile(template);
      context = response.listData.map(function (item, index) {
        item.rank_no = ((mainPagingInfo.pageNo - 1) * mainPagingInfo.pageCnt) + index + 1;
        return item;
      });
      html = templateScript(context);
      $("#stone" + mainSearch.seqNo + "st-rank").html(html);

      mainPagingInfo.totalCnt = response.totalCnt;
      util.renderPagingNavigation('collect-ranks-top', mainPagingInfo);
      util.renderPagingNavigation('collect-ranks-bottom', mainPagingInfo);

      if (response.listData.length === 0) {
        $('#collect-ranks-top').hide();
        $('#collect-ranks-bottom').hide();
      } else {
        $('#collect-ranks-top').show();
        $('#collect-ranks-bottom').show();
      }
    }

    // 뽑기 목록
    function getCollectList() {
      let data = {
        memId: mainSearch.searchData,
        seqNo: mainSearch.seqNo,
        pageNo: mainPagingInfo.pageNo,
        pagePerCnt: mainPagingInfo.pageCnt
      };
      let apiURL = '/rest/content/event/rebrand/collects';
      util.getAjaxData("getCollectList", apiURL, data, function (id, response, params) {
        renderCollectList(id, response, params);
      }, null, {type: 'GET'});
    }

    // 뽑기목록 출력
    function renderCollectList(id, response, params) {
      let template, templateScript, context, html;
      template = $('#tmp-collect-summary').html();
      templateScript = Handlebars.compile(template);
      context = response.summary;
      html = templateScript(context);
      $("#stone" + mainSearch.seqNo + "st-collect-summary").html(html);

      template = $('#tmp-collect-list').html();
      templateScript = Handlebars.compile(template);
      context = response.listData.map(function (item, index) {
        item.rank_no = ((mainPagingInfo.pageNo - 1) * mainPagingInfo.pageCnt) + index + 1;
        return item;
      });
      html = templateScript(context);
      $("#stone" + mainSearch.seqNo + "st-collect-list").html(html);

      mainPagingInfo.totalCnt = response.totalCnt;
      util.renderPagingNavigation('collect-top', mainPagingInfo);
      util.renderPagingNavigation('collect-bottom', mainPagingInfo);

      if (response.listData.length === 0) {
        $('#collect-top').hide();
        $('#collect-bottom').hide();
      } else {
        $('#collect-top').show();
        $('#collect-bottom').show();
      }
    }

    // 회원종합리스트
    function getTotalCollectList() {
      let data = {
        memId: mainSearch.searchData,
        pageNo: mainPagingInfo.pageNo,
        pagePerCnt: mainPagingInfo.pageCnt
      };
      let apiURL = '/rest/content/event/rebrand/collect-totals';
      util.getAjaxData("getTotalCollectList", apiURL, data, function (id, response, params) {
        renderTotalCollectList(id, response, params);
      }, null, {type: 'GET'});
    }

    // 회원종합리스트 출력
    function renderTotalCollectList(id, response, params) {
      let template, templateScript, context, html;
      template = $('#tmp-collect-ranks-list').html();
      templateScript = Handlebars.compile(template);
      context = response.listData.map(function (item, index) {
        item.rank_no = ((mainPagingInfo.pageNo - 1) * mainPagingInfo.pageCnt) + index + 1;
        return item;
      });
      html = templateScript(context);
      $("#stone-collect-total").html(html);

      mainPagingInfo.totalCnt = response.totalCnt;
      util.renderPagingNavigation('collect-ranks-top', mainPagingInfo);
      util.renderPagingNavigation('collect-ranks-bottom', mainPagingInfo);

      if (response.listData.length === 0) {
        $('#collect-ranks-top').hide();
        $('#collect-ranks-bottom').hide();
      } else {
        $('#collect-ranks-top').show();
        $('#collect-ranks-bottom').show();
      }
    }

    function callList() {
      $("#stone1st-collect-summary").empty();
      $("#stone1st-collect-list").empty();
      $("#stone1st-rank").empty();
      $("#stone2st-collect-summary").empty();
      $("#stone2st-collect-list").empty();
      $("#stone2st-rank").empty();
      $("#stone-collect-total").empty();

      switch(mainSearch.seqNo) {
        case 1:
        case 2:
          switch(mainSearch.type) {
            case 1:
              getRankList();
              break;
            case 2:
              getCollectList();
              break;
          }
          break;
        case 3:
          getTotalCollectList();
          break;
      }
    }

    function intSearchForm() {
      mainSearch.seqNo = 1;
      mainSearch.type = 1;
      mainSearch.searchData = '';
      mainPagingInfo.pageNo = 1;
      mainPagingInfo.pageCnt = 50;
      $mainRoot.find('input[name="searchVal"]').val(mainSearch.searchData);
    }

    return {
      intSearchForm,
      callList
    }
  }());

  // 달라졌어요 이벤트~
  function initStoneEvent() {
    setTimeout(function() {
      mainEventData.intSearchForm();
      mainEventData.callList();
    }, 0);
  }

  $(document).ready(function () {
    $mainRoot = $('#rebrand-main');
    $mainRoot.find('input[name="searchVal"]').on('change', function () {
      mainSearch.searchData = this.value;
    });
    $mainRoot.find('input[name="searchVal"]').on('keypress', function (e) {
      var keycode = e.keyCode ? e.keyCode : e.which;
      if(keycode == '13'){
        mainPagingInfo.pageNo = 1;
        mainEventData.callList();
      }
      e.stopPropagation();
    });

    // 메인이벤트: 회차탭 클릭이벤트
    $('#stone_con > li > a').on('click', function(e) {
        var $this = $(this);
        mainSearch.seqNo = parseInt($this.data('seq-no'), 10);
        mainSearch.type = 1;
        mainPagingInfo.pageNo = 1;

        if (mainSearch.seqNo === 1 || mainSearch.seqNo === 2) {
          $('#stone' + mainSearch.seqNo + 'st-inner > li > a').eq(0).click();
        } else {
          mainEventData.callList();
        }
    });

    // 검색버튼 클릭
    $mainRoot.find('button[type="button"]').on('click', function () {
      mainPagingInfo.pageNo = 1;
      mainEventData.callList();
    });

    // 1회차 하위탭
    $('#stone1st-inner > li > a').on('click', function(e) {
      var $this = $(this);
      mainSearch.type = parseInt($this.data('type'), 10);
      mainPagingInfo.pageNo = 1;
      mainEventData.callList();
    });

    // 2회차 하위탭
    $('#stone2st-inner > li > a').on('click', function(e) {
      var $this = $(this);
      mainSearch.type = parseInt($this.data('type'), 10);
      mainPagingInfo.pageNo = 1;
      mainEventData.callList();
    });
  });
</script>

<script type="text/x-handlebars-template" id="tmp-collect-ranks-list">
    <div class="dataTables_paginate paging_full_numbers" id="collect-ranks-top"></div>
    <table id="collect-ranks-table" class="table table-sorting table-hover table-bordered">
        <colgroup>
            <col width="60px"/>
            <col width="120px"/>
            <col width="200px"/>
            <col width="120px"/>
            <col width="150px"/>
            <col width="120px"/>
            <col width="auto"/>
            <col width="auto"/>
        </colgroup>
        <thead>
        <tr>
            <th>순위</th>
            <th>아이디</th>
            <th>닉네임</th>
            <th>연락처</th>
            <th>스톤 d(누적)</th>
            <th>스톤 a(누적)</th>
            <th>스톤 l(누적)</th>
            <th>완성</th>
        </tr>
        </thead>
        <tbody id="collect-ranks-table-body">
        {{#each this as |data|}}
        <tr>
            <td>{{rank_no}}</td>
            <td>{{{memNoLink mem_userid mem_no}}}</td>
            <td>{{mem_nick}}</td>
            <td>{{phoneNumHyphen mem_phone}}</td>
            <td>{{addComma ins_d_cnt}}</td>
            <td>{{addComma ins_a_cnt}}</td>
            <td>{{addComma ins_l_cnt}}</td>
            <td>{{addComma dalla_cnt}}</td>
        </tr>
        {{else}}
        <tr>
            <td colspan="8">{{isEmptyData}}</td>
        </tr>
        {{/each}}
        </tbody>
    </table>
    <div class="dataTables_paginate paging_full_numbers" id="collect-ranks-bottom"></div>
</script>

<script type="text/x-handlebars-template" id="tmp-collect-summary">
    <table class="table table-sorting table-hover table-bordered">
        <tbody>
        <tr>
            <td colspan="3">총 뽑기 횟수: {{addComma tot_cnt}}회</td>
        </tr>
        <tr>
            <td>d 사용: {{addComma use_d_cnt}}개</td>
            <td>a 사용: {{addComma use_a_cnt}}개</td>
            <td>l 사용: {{addComma use_l_cnt}}개</td>
        </tr>
        <tr>
            <td>d 지급: {{addComma ins_d_cnt}}개</td>
            <td>a 지급: {{addComma ins_a_cnt}}개</td>
            <td>l 지급: {{addComma ins_l_cnt}}개</td>
        </tr>
        </tbody>
    </table>
</script>

<script type="text/x-handlebars-template" id="tmp-collect-list">
    <div class="dataTables_paginate paging_full_numbers" id="collect-top"></div>
    <table id="collect-table" class="table table-sorting table-hover table-bordered">
        <colgroup>
            <col width="60px"/>
            <col width="120px"/>
            <col width="200px"/>
            <col width="auto"/>
            <col width="120px"/>
            <col width="150px"/>
        </colgroup>
        <thead>
        <tr>
            <th>순위</th>
            <th>아이디</th>
            <th>닉네임</th>
            <th>사용스톤</th>
            <th>지급스톤(1개)</th>
            <th>참여일시</th>
        </tr>
        </thead>
        <tbody id="collect-table-body">
        {{#each this as |data|}}
        <tr>
            <td>{{rank_no}}</td>
            <td>{{{memNoLink mem_userid mem_no}}}</td>
            <td>{{mem_nick}}</td>
            <td>
                d: <b>{{use_d_cnt}}</b>,&nbsp;&nbsp;
                a: <b>{{use_a_cnt}}</b>,&nbsp;&nbsp;
                l: <b>{{use_l_cnt}}</b>
            </td>
            <td><b>{{dalla_gubun}}</b></td>
            <td>{{ins_date}}</td>
        </tr>
        {{else}}
        <tr>
            <td colspan="6">{{isEmptyData}}</td>
        </tr>
        {{/each}}
        </tbody>
    </table>
    <div class="dataTables_paginate paging_full_numbers" id="collect-bottom"></div>
</script>