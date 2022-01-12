<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dummyData" value="<%= java.lang.Math.round(java.lang.Math.random() * 1000000) %>"/>

<div id="condition5">
    <div class="col-lg-12">
        <div class="widget widget-table">
            <form id="searchForm">
                <div class="widget widget-table searchBoxArea" style="margin-bottom: 0">
                    <table style="width: 100%">
                        <tr>
                            <th rowspan="2" style="background-color:#4472c4;color:#e9ee17;width: 70px">
                                <i class="fa fa-search"></i><br/>검색
                            </th>
                            <td style="text-align: left">
                                <label><input type="text" class="form-control" name="searchMemNoText" id="searchMemNoText"
                                              placeholder="회원번호 검색"></label>
                                <button type="button" class="btn btn-success" id="bt_search">검색</button>
                            </td>
                        </tr>
                    </table>
                </div>
            </form>
        </div>
        <div class="clearfix widget-content mt5 mb5">
            <h4 class="font-bold">■ 굿스타트 이벤트</h4>
            <h5 id="eventDuration"></h5>
            <div id="goodNo_tabContainer" class="mb15">
                <ul class="nav nav-tabs nav-tabs-custom-colored" id="goodstart_no">
                    <li class="active"><a href="#detail_event" role="tab" data-toggle="tab" aria-expanded="false" data-goodno="1" class="_tab">1회차</a></li>
                    <li><a href="#detail_event" role="tab" data-toggle="tab" aria-expanded="false" data-goodno="2" class="_tab">2회차</a></li>
                    <li><a href="#detail_event" role="tab" data-toggle="tab" aria-expanded="false" data-goodno="3" class="_tab">3회차</a></li>
                    <li><a href="#detail_event" role="tab" data-toggle="tab" aria-expanded="false" data-goodno="4" class="_tab">4회차</a></li>
                    <li><a href="#detail_event" role="tab" data-toggle="tab" aria-expanded="false" data-goodno="5" class="_tab">5회차</a></li>
                </ul>
            </div>

            <div id="rankType_tabContainer" class="mb15">
                <ul class="nav nav-tabs nav-tabs-custom-colored" id="goodstart_rank_type">
                    <li class="active"><a href="#detail_event" role="tab" data-toggle="tab" data-rank_type="dj" aria-expanded="false" class="_tab">DJ</a></li>
                    <li><a href="#detail_event" role="tab" data-toggle="tab" data-rank_type="fan" aria-expanded="false" class="_tab">팬</a></li>
                </ul>
            </div>

            <div id="rankSlct_tabContainer" class="mb15">
                <ul class="nav nav-tabs nav-tabs-custom-colored" id="goodstart_rank_slct">
                    <li class="active"><a href="#detail_event" role="tab" data-toggle="tab" data-rank_slct="b" aria-expanded="false" class="_tab">종합랭킹</a></li>
                    <li><a href="#detail_event" role="tab" data-toggle="tab" data-rank_slct="n" aria-expanded="false" class="_tab">신인랭킹</a></li>
                </ul>
            </div>
            <div id="tableArea"></div>
        </div>
    </div>
</div>
<script type="text/javascript" src="/js/code/content/contentCodeList.js?${dummyData}"></script>
<script type="text/javascript">
  let eventInfos = [
    '진행기간: 1/13 ~ 1/19, 발표: 1/20',
    '진행기간: 1/20 ~ 1/26, 발표: 1/27',
    '진행기간: 1/27 ~ 2/2, 발표: 2/3',
    '진행기간: 2/3 ~ 2/9, 발표: 2/10',
    '진행기간: 2/10 ~ 2/16, 발표: 2/17',
  ]
  $(document).ready(function() {
    const goodNo = 1; // 회차
    const rankType = 'dj' // dj / fan
    const rankSlct = 'b' // b: 종합 / n: 신인

    getGoodStartData(goodNo, rankType, rankSlct);
  });

  // data
  function getGoodStartData(goodNo, rankType, rankSlct) {
    const searchVal = $('#searchMemNoText').val();
    let good_no = 1;
    if(goodNo) good_no = goodNo;

    const goodDataParam = {
      goodNo: good_no,
      memNo: searchVal === "" ? "0" : searchVal,
      bjSlct: rankSlct,
      pageNo: 1,
      pagePerCnt: 200
    }

    util.getAjaxData('goodStartData', '/rest/content/event/goodstart/event/' + rankType +'/page', goodDataParam
      , getSuccessCallback, errorFunc, {type: 'GET'}
    )
  }

  // 상단 진행 기간 value ins
  function setEventDuration(goodNo) {
    $('#eventDuration').html(eventInfos[goodNo-1]);
  }

  function getSuccessCallback(id, response, params) {
    let template, templateScript, context, html, $tableId;
    const slctType = $('#goodstart_rank_type .active a')[0].dataset.rank_type; // dj / fan
    const goodNo = parseInt($('#goodstart_no .active a')[0].dataset.goodno); // 선택된 회차
    let isOverGoodNo = false;

    response = JSON.parse(response);
    setEventDuration(goodNo); // 회차별 이벤트 기간 set

    if(slctType === 'dj') {
      if(params.bjSlct === 'b') {
        $tableId = $('#goodStart_dj_table');
      }else {
        $tableId = $('#goodStart_newDj_table');
      }
    }else {
      $tableId = $('#goodStart_fan_table');
    }

    // 선택된 회차가 이미 지난 회차인가? (팬에서만 체크)
    if(response.currentInfo && parseInt(response.currentInfo.good_no) > goodNo) {
      isOverGoodNo = true;
    }

    template = $tableId.html();
    templateScript = Handlebars.compile(template);
    if(params.memNo === "0") {
      context = response.rankList.map(function (item, index) {
        item.rank_no = index + 1;
        item.isOverGoodNo = isOverGoodNo;
        return item;
      });
    }else {
      context = response.rankList.map(function (item, index) {
        item.rank_no = item.my_rank_no;
        item.isOverGoodNo = isOverGoodNo;
        return item;
      });
    }
    html = templateScript(context);
    $("#tableArea").html(html);
  }

  function errorFunc() {
    console.log('굿스타트 이벤트 api error');
  }

  // 종합랭킹 / 신인랭킹 탭 show, hide
  function rankSlctShowHide(slctType) {
    if(slctType === 'dj') {
      $('#rankSlct_tabContainer').css("display", "block");
    }else {
      $('#rankSlct_tabContainer').css("display", "none");
    }
  }

  // 회차 탭
  $('#goodstart_no li a').on('click', function(e) {
    const slctType = $('#goodstart_rank_type .active a')[0].dataset.rank_type;
    const goodNo = e.currentTarget.dataset.goodno;
    const rankSlct = $('#goodstart_rank_slct .active a')[0].dataset.rank_slct;
    getGoodStartData(goodNo, slctType, rankSlct);
  });

  // dj / fan 탭
  $('#goodstart_rank_type li a').on('click', function(e) {
    const slctType = e.currentTarget.dataset.rank_type;
    const goodNo = $('#goodstart_no .active a')[0].dataset.goodno;
    const rankSlct = $('#goodstart_rank_slct .active a')[0].dataset.rank_slct;
    getGoodStartData(goodNo, slctType, rankSlct);
    rankSlctShowHide(slctType);
  });

  // 종합랭킹 신인 랭킹
  $('#goodstart_rank_slct li a').on('click', function(e) {
    const slctType = $('#goodstart_rank_type .active a')[0].dataset.rank_type;
    const goodNo = $('#goodstart_no .active a')[0].dataset.goodno;
    const rankSlct = e.currentTarget.dataset.rank_slct;
    getGoodStartData(goodNo, slctType, rankSlct);
  });

  // 검색
  $('#bt_search').on('click', function() {
    const slctType = $('#goodstart_rank_type .active a')[0].dataset.rank_type;
    const goodNo = $('#goodstart_no .active a')[0].dataset.goodno;
    const rankSlct = $('#goodstart_rank_slct .active a')[0].dataset.rank_slct;
    console.log('goodNo, slctType, rankSlct : ', goodNo, slctType, rankSlct);
    getGoodStartData(goodNo, slctType, rankSlct);
  });
</script>

<script type="text/x-handlebars-template" id="goodStart_dj_table">
    <table id="djRankTable" class="table table-sorting table-hover table-bordered">
        <colgroup>
            <col width="10%"/>
            <col width="15%"/>
            <col width="15%"/>
            <col width="10%"/>
            <col width="10%"/>
            <col width="40%"/>
        </colgroup>
        <thead>
        <tr>
            <th>종합순위</th>
            <th>회원번호</th>
            <th>닉네임</th>
            <th>이벤트 시작시 레벨</th>
            <th>점수</th>
            <th>상세내역(받은선물 / 좋아요 / 부스터)</th>
        </tr>
        </thead>
        <tbody id="djRankTableBody">
        {{#each this as |data|}}
        <tr>
            <td>{{rank_no}}</td>
            <td>{{{memNoLink mem_no}}}</td>
            <td>{{mem_nick}}</td>
            <td>{{mem_ins_level}}</td>
            <td>{{addComma tot_mem_score}}</td>
            <td>{{addComma mem_dal_score}} / {{addComma mem_tot_like_score}} / {{addComma mem_booster_score}}</td>
        </tr>
        {{else}}
        <tr>
            <td colspan="12">{{isEmptyData}}</td>
        </tr>
        {{/each}}
        </tbody>
    </table>
</script>

<script type="text/x-handlebars-template" id="goodStart_newDj_table">
    <table id="newDjRankTable" class="table table-sorting table-hover table-bordered">
        <colgroup>
            <col width="10%"/>
            <col width="15%"/>
            <col width="15%"/>
            <col width="10%"/>
            <col width="10%"/>
            <col width="40%"/>
        </colgroup>
        <thead>
        <tr>
            <th>신인순위</th>
            <th>회원번호</th>
            <th>닉네임</th>
            <th>이벤트 시작시 레벨</th>
            <th>점수</th>
            <th>상세내역(받은선물 / 좋아요 / 부스터)</th>
        </tr>
        </thead>
        <tbody id="newDjRankTableBody">
        {{#each this as |data|}}
        <tr>
            <td>{{rank_no}}</td>
            <td>{{{memNoLink mem_no}}}</td>
            <td>{{mem_nick}}</td>
            <td>{{mem_ins_level}}</td>
            <td>{{addComma tot_mem_score}}</td>
            <td>{{addComma mem_dal_score}} / {{addComma mem_tot_like_score}} / {{addComma mem_booster_score}}</td>
        </tr>
        {{else}}
        <tr>
            <td colspan="12">{{isEmptyData}}</td>
        </tr>
        {{/each}}
        </tbody>
    </table>
</script>

<script type="text/x-handlebars-template" id="goodStart_fan_table">
    <table id="fanRankTable" class="table table-sorting table-hover table-bordered">
        <colgroup>
            <col width="10%"/>
            <col width="15%"/>
            <col width="15%"/>
            <col width="10%"/>
            <col width="10%"/>
            <col width="40%"/>
        </colgroup>
        <thead>
        <tr>
            <th>순위</th>
            <th>회원번호</th>
            <th>닉네임</th>
            <th>획득 경험치</th>
            <th>특별점수(20%)</th>
            <th>합산 점수</th>
        </tr>
        </thead>
        <tbody id="fanRankTableBody">
        {{#each this as |data|}}
        <tr>
            <td>{{rank_no}}</td>
            <td>{{{memNoLink mem_no}}}</td>
            <td>{{mem_nick}}</td>
            <td>{{addComma mem_exp_score}}</td>
            <td>
                {{addComma mem_special_score}}
                {{#dalbit_if isOverGoodNo "==" false}}
                <a class="_openGoodStartScoreDetail" data-info="{{json this}}" style="cursor: pointer;">[확인]</a>
                {{/dalbit_if}}
            </td>
            <td>{{addComma tot_mem_score}}</td>
        </tr>
        {{else}}
        <tr>
            <td colspan="12">{{isEmptyData}}</td>
        </tr>
        {{/each}}
        </tbody>
    </table>
</script>