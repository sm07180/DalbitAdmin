<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dummyData"><%= java.lang.Math.round(java.lang.Math.random() * 1000000) %>
</c:set>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="clearfix widget-content mb5">
                <h4 class="font-bold">키보드 히어로</h4>
                <!-- searchBox -->
                <form id="searchForm">
                    <div class="row col-lg-12 form-inline">
                        <div class="widget widget-table searchBoxArea">
                            <table>
                                <tr>
                                    <th rowspan="2" style="background-color:#4472c4;color:#e9ee17;width: 70px">
                                        <i class="fa fa-search"></i><br/>검색
                                    </th>
                                    <th>
                                        <jsp:include page="../../../searchArea/daySearchFunction.jsp"/>
                                        <div>
                                            <div id="div_dayButton">
                                                <jsp:include page="../../../searchArea/daySearchArea.jsp"/>
                                            </div>
                                            <div id="div_monthButton" style="display: none">
                                                <jsp:include page="../../../searchArea/monthSearchArea.jsp"/>
                                            </div>
                                            <div id="div_yearButton" style="display: none">
                                                <jsp:include page="../../../searchArea/yearSearchArea.jsp"/>
                                            </div>
                                        </div>
                                    </th>
                                </tr>
                                <tr>
                                    <td style="text-align: left">
                                        <input type="text" class="form-control" id="onedayDate" name="onedayDate">

                                        <input id="monthDate" type="text" class="form-control"
                                               style="width: 196px;display: none"/>

                                        <input id="yearDate" type="text" class="form-control"
                                               style="width: 196px;display: none"/>

                                        <input class="hide" name="startDate" id="startDate" style="width: 100px">
                                        <input class="hide" name="endDate" id="endDate" style="width: 100px">
                                        <label><input type="text" class="form-control hide" name="searchText"
                                                      id="searchText" placeholder="검색어를 입력해주세요."></label>

                                        <button type="button" class="btn btn-success" id="bt_search">검색</button>
                                        <a href="javascript://" class="_prevSearch">[이전]</a>
                                        <a href="javascript://" class="_todaySearch">[오늘]</a>
                                        <a href="javascript://" class="_nextSearch">[다음]</a>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </form>
                <!-- //serachBox -->

                <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist" id="tablist_con">
                    <li class="active"><a href="#lucky" role="tab" data-toggle="tab" data-slct="list">당첨자</a></li>
                    <li><a href="#bouns" role="tab" data-toggle="tab" data-slct="bouns">BONUS</a></li>
                </ul>

                <div id="resultArea" class="clearfix"></div>
            </div>
        </div> <!-- //container-fluid -->
    </div> <!-- //page-wrapper -->
</div>
<!-- //wrapper-->

<div class="modal fade" id="lucky-chat-list" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body">
                <div id="modalResultArea"></div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" aria-hidden="true">닫기</button>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="/js/code/menu/menuCodeList.js?${dummyData}"></script>
<script type="text/javascript">
  let sDate = dateTime.replace(/[.]/g, '-');
  let luckySlct = 'list';
  let chatData = {
    memNo: '',
    theSeq: 0
  };

  let giftPreCode = {
    r01: 1, // 10달
    r02: 2, // 50달
    r03: 3, // 100달
    k01: 4, // 스타벅스 아메리카노
    k02: 5, // GS25 교환권 5000원
    k03: 7, // 네이버페이 1만원 포인트
    k04: 6, // 맘스터치 싸이버거 세트
    k05: 8, // 배스킨라빈스31 2만원 교환권
  }
  const luckyChatPagingInfo = new PAGING_INFO(0, 1, 50);
  const luckyChatModalPagingInfo = new PAGING_INFO(0, 1, 50);
  const luckyChatEventData = (function () {
    // 중복내역 호출실행
    function callDuplicatMemList(memNo) {
      if (!memNo) return;
      chatData.memNo = memNo;
      chatData.theSeq = 0;

      getDuplicatMemList();
      $('#lucky-chat-list').modal('show');
    }
    // 중복내역
    function getDuplicatMemList() {
      $('#modalResultArea').empty();
      let data = {
        memNo: chatData.memNo,
        theDate: sDate
      };
      util.getAjaxData("getDuplicatMemList", "/rest/content/event/luck-chat/duplicat", data, renderDuplicatMemList, null, {type: 'GET'});
    }

    // 중복내역 - 출력
    function renderDuplicatMemList(data, response) {
      let template, templateScript, context, html;

      let totalCnt = response.listData ? response.listData.length : 0;
      template = $('#tmp-duplicat-list').html();
      templateScript = Handlebars.compile(template);
      context = response.listData.map(function (item, index) {
        item.index_no = totalCnt - index;
        item.rcv_text = item.rcv_yn === 'y' ? 'O' : 'X';
        item.the_day = item.the_date.substring(0, 10);
        return item;
      });
      html = templateScript(context);
      $("#modalResultArea").html(html);
    }

    // 채팅내역 호출
    function callChatList(memNo, theSeq) {
      if (!(memNo && theSeq)) return;
      chatData.memNo = memNo;
      chatData.theSeq = theSeq;

      luckyChatModalPagingInfo.pageNo = 1;
      getChatList();
      $('#lucky-chat-list').modal('show');
    }

    // 채팅내역
    function getChatList() {
      $('#modalResultArea').empty();
      let data = {
        memNo: chatData.memNo,
        theDate: sDate,
        theSeq: chatData.theSeq,
        pageNo: luckyChatModalPagingInfo.pageNo,
        pagePerCnt: luckyChatModalPagingInfo.pageCnt
      };
      util.getAjaxData("getChatList", "/rest/content/event/luck-chat/chat", data, renderChatList, null, {type: 'GET'});
    }

    // 채팅내역 출력
    function renderChatList(data, response) {
      let template, templateScript, context, html;
      template = $('#tmp-chat-list').html();
      templateScript = Handlebars.compile(template);
      context = response.listData.map(function (item, index) {
        item.index_no = response.totalCnt - (((luckyChatModalPagingInfo.pageNo - 1) * luckyChatModalPagingInfo.pageCnt) + index);
        return item;
      });
      html = templateScript(context);
      $("#modalResultArea").html(html);

      luckyChatModalPagingInfo.totalCnt = response.totalCnt;
      util.renderPagingNavigation('chat-paginate-top', luckyChatModalPagingInfo);
      util.renderPagingNavigation('chat-paginate-bottom', luckyChatModalPagingInfo);

      if (response.listData.length === 0) {
        $('#chat-paginate-top').hide();
        $('#chat-paginate-bottom').hide();
      } else {
        $('#chat-paginate-top').show();
        $('#chat-paginate-bottom').show();
      }
    }

    // 당첨자 목록
    function getMemList() {
      let data = {
        theDate: sDate,
        pageNo: luckyChatPagingInfo.pageNo,
        pagePerCnt: luckyChatPagingInfo.pageCnt
      };
      util.getAjaxData("getMemList", "/rest/content/event/luck-chat/list", data, renderMemList, null, {type: 'GET'});
    }

    // 당첨자 목록 출력
    function renderMemList(data, response) {
      let template, templateScript, context, html;
      template = $('#tmp-mem-list').html();
      templateScript = Handlebars.compile(template);
      context = response.listData.map(function (item, index) {
        item.index_no = response.totalCnt - (((luckyChatPagingInfo.pageNo - 1) * luckyChatPagingInfo.pageCnt) + index);
        item.rcv_text = item.rcv_yn === 'y' ? 'O' : 'X';
        item.image_num = giftPreCode[item.pre_code];
        return item;
      });
      html = templateScript(context);
      $("#resultArea").html(html);

      luckyChatPagingInfo.totalCnt = response.totalCnt;
      util.renderPagingNavigation('mem-paginate-top', luckyChatPagingInfo);
      util.renderPagingNavigation('mem-paginate-bottom', luckyChatPagingInfo);

      if (response.listData.length === 0) {
        $('#mem-paginate-top').hide();
        $('#mem-paginate-bottom').hide();
      } else {
        $('#mem-paginate-top').show();
        $('#mem-paginate-bottom').show();
      }
    }

    // 보너스 목록
    function getBonusMemList() {
      let data = {
        theDate: sDate,
        pageNo: luckyChatPagingInfo.pageNo,
        pagePerCnt: luckyChatPagingInfo.pageCnt
      };
      util.getAjaxData("getBonusMemList", "/rest/content/event/luck-chat/bouns", data, renderBonusMemList, null, {type: 'GET'});
    }

    // 보너스 목록 출력
    function renderBonusMemList(data, response) {
      let template, templateScript, context, html;
      template = $('#tmp-bouns-list').html();
      templateScript = Handlebars.compile(template);
      context = response.listData.map(function (item, index) {
        item.index_no = response.totalCnt - (((luckyChatPagingInfo.pageNo - 1) * luckyChatPagingInfo.pageCnt) + index);
        item.one_step_rcv_text = item.one_step_rcv_yn === 'y' ? 'O' : 'X';
        item.two_step_rcv_text = item.two_step_rcv_yn === 'y' ? 'O' : 'X';
        return item;
      });

      html = templateScript(context);
      $("#resultArea").html(html);

      luckyChatPagingInfo.totalCnt = response.totalCnt;
      util.renderPagingNavigation('bouns-paginate-top', luckyChatPagingInfo);
      util.renderPagingNavigation('bouns-paginate-bottom', luckyChatPagingInfo);

      if (response.listData.length === 0) {
        $('#bouns-paginate-top').hide();
        $('#bouns-paginate-bottom').hide();
      } else {
        $('#bouns-paginate-top').show();
        $('#bouns-paginate-bottom').show();
      }

      let totalBonusCnt = common.addComma(response.totalBonusCnt);
      $('#total-dal-cnt').text(totalBonusCnt);
    }

    function callList() {
      $('#resultArea').empty();
      switch (luckySlct) {
        case 'list':
          getMemList();
          break;
        case 'bouns':
          getBonusMemList();
          break;
      }
    }

    return {
      getDuplicatMemList: getDuplicatMemList,
      callDuplicatMemList: callDuplicatMemList,
      getChatList: getChatList,
      callChatList: callChatList,
      callList: callList
    }
  }());

  function handlebarsPaging(targetId, pagingInfo) {
    switch (targetId) {
      case 'mem-paginate-top':
      case 'mem-paginate-bottom':
      case 'bouns-paginate-top':
      case 'bouns-paginate-bottom':
        luckyChatPagingInfo.pageNo = pagingInfo.pageNo;
        luckyChatEventData.callList();
        break;
      case 'chat-paginate-top':
      case 'chat-paginate-bottom':
        luckyChatModalPagingInfo.pageNo = pagingInfo.pageNo;
        luckyChatEventData.getChatList();
        break;
    }
  }

  $(function () {
    $('#bt_search').on('click', function () {
      sDate = $("#startDate").val().replace(/[.]/g, '-');

      luckyChatPagingInfo.pageNo = 1;
      luckyChatEventData.callList();
    });

    $('#tablist_con li a').on('click', function () {
      let $this = $(this);
      luckySlct = $this.data('slct');

      slctType = (luckySlct === 'list') ? 0 : 1;
      dateType();
    });

    slctType = 0;
    dateType();
  });
</script>

<script type="text/x-handlebars-template" id="tmp-duplicat-list">
    <table id="duplicat-table" class="table table-sorting table-hover table-bordered">
        <colgroup>
            <col width="3%"/>
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
            <th>회원번호</th>
            <th>집계일자</th>
            <th>회차</th>
            <th>UserId</th>
            <th>닉네임</th>
            <th>상품 수령<br/>여부</th>
        </tr>
        </thead>
        <tbody id="duplicat-table-body">
        {{#each this as |data|}}
        <tr>
            <td>{{index_no}}</td>
            <td>{{{memNoLink mem_no mem_no}}}</td>
            <td>{{the_day}}</td>
            <td>{{the_seq}}</td>
            <td>{{mem_userid}}</td>
            <td>{{mem_nick}}</td>
            <td>{{rcv_text}}</td>
        </tr>
        {{else}}
        <tr>
            <td colspan="7">{{isEmptyData}}</td>
        </tr>
        {{/each}}
        </tbody>
    </table>
</script>

<script type="text/x-handlebars-template" id="tmp-chat-list">
    <div class="dataTables_paginate paging_full_numbers" id="chat-paginate-top"></div>
    <table id="chat-table" class="table table-sorting table-hover table-bordered">
        <colgroup>
            <col width="150px"/>
            <col width="auto"/>
        </colgroup>
        <thead>
        <tr>
            <th>채팅 시작 일시</th>
            <th>채팅 내용</th>
        </tr>
        </thead>
        <tbody id="chat-table-body">
        {{#each this as |data|}}
        <tr>
            <td>{{last_upd_date}}</td>
            <td class="text-left">{{msg}}</td>
        </tr>
        {{else}}
        <tr>
            <td colspan="2">{{isEmptyData}}</td>
        </tr>
        {{/each}}
        </tbody>
    </table>
    <div class="dataTables_paginate paging_full_numbers" id="chat-paginate-bottom"></div>
</script>

<script type="text/x-handlebars-template" id="tmp-mem-list">
    <div class="dataTables_paginate paging_full_numbers" id="mem-paginate-top"></div>
    <table id="mem-table" class="table table-sorting table-hover table-bordered">
        <colgroup>
            <col width="3%"/>
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
            <th>회원번호</th>
            <th>UserId</th>
            <th>연락처</th>
            <th>닉네임</th>
            <th>성별(나이)</th>
            <th>당첨 상품</th>
            <th>당첨 일시</th>
            <th>번호 중복<br/>여부</th>
            <th>상품 수령<br/>여부</th>
            <th>채팅 내역<br/>확인</th>
        </tr>
        </thead>
        <tbody id="mem-table-body">
        {{#each this as |data|}}
        <tr>
            <td>{{index_no}}</td>
            <td>{{{memNoLink mem_no mem_no}}}</td>
            <td>{{mem_userid}}</td>
            <td>{{phoneNumHyphen mem_phone}}</td>
            <td>{{mem_nick}}</td>
            <td>{{{sexIcon mem_sex mem_birth_year}}}</td>
            <td>
                <div><img src="https://image.dalbitlive.com/event/keyboardHero/present-{{image_num}}.png" width="52px"></div>
                <div>{{code_name}}</div>
            </td>
            <td>{{ins_date}}</td>
            <td>
                <button type="button" class="btn btn-sm btn-danger" onclick="luckyChatEventData.callDuplicatMemList({{mem_no}})">확인</button>
            </td>
            <td>{{rcv_text}}</td>
            <td>
                <button type="button" class="btn btn-sm btn-success" onclick="luckyChatEventData.callChatList({{mem_no}}, {{the_seq}})">채팅내역</button>
            </td>
        </tr>
        {{else}}
        <tr>
            <td colspan="11">{{isEmptyData}}</td>
        </tr>
        {{/each}}
        </tbody>
    </table>
    <div class="dataTables_paginate paging_full_numbers" id="mem-paginate-bottom"></div>
</script>

<script type="text/x-handlebars-template" id="tmp-bouns-list">
    <div class="row col-md-12">
        <h5>총지급 달 수 : <span id="total-dal-cnt" class="text-danger font-bold">0</span>건</h5>
    </div>
    <div class="dataTables_paginate paging_full_numbers" id="bouns-paginate-top"></div>
    <table id="bouns-table" class="table table-sorting table-hover table-bordered">
        <colgroup>
            <col width="3%"/>
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
            <th>회원번호</th>
            <th>UserId</th>
            <th>닉네임</th>
            <th>방송 시청 시간</th>
            <th>1단계</th>
            <th>2단계</th>
        </tr>
        </thead>
        <tbody id="bouns-table-body">
        {{#each this as |data|}}
        <tr>
            <td>{{index_no}}</td>
            <td>{{{memNoLink mem_no mem_no}}}</td>
            <td>{{mem_userid}}</td>
            <td>{{mem_nick}}</td>
            <td>{{timeStampAllKor play_time}}</td>
            <td>{{one_step_rcv_text}}</td>
            <td>{{two_step_rcv_text}}</td>
        </tr>
        {{else}}
        <tr>
            <td colspan="7">{{isEmptyData}}</td>
        </tr>
        {{/each}}
        </tbody>
    </table>
    <div class="dataTables_paginate paging_full_numbers" id="bouns-paginate-bottom"></div>
</script>
