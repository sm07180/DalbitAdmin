<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dummyData" value="<%= java.lang.Math.round(java.lang.Math.random() * 1000000) %>"/>

<%--<form id="condition5">--%>
<div class="col-lg-12 form-inline mt0 mb0">
    <div class="widget widget-table">
        <%--            <form id="searchForm">--%>
        <%--                <div class="row col-lg-12 form-inline">--%>
        <%--                    <div class="widget widget-table searchBoxArea">--%>
        <%--                        <table>--%>
        <%--                            <tr>--%>
        <%--                                <th rowspan="2" style="background-color:#4472c4;color:#e9ee17;width: 70px">--%>
        <%--                                    <i class="fa fa-search"></i><br/>검색--%>
        <%--                                </th>--%>
        <%--                            </tr>--%>
        <%--                            <tr>--%>
        <%--                                <td style="text-align: left">--%>
        <%--                                    <label><input type="text" class="form-control" name="searchMemNoText"--%>
        <%--                                                  id="searchMemNoText"--%>
        <%--                                                  placeholder="회원번호 검색"></label>--%>
        <%--                                    <button type="button" class="btn btn-success" id="bt_search">검색</button>--%>
        <%--                                </td>--%>
        <%--                            </tr>--%>
        <%--                        </table>--%>
        <%--                    </div>--%>
        <%--                </div>--%>
        <%--            </form>--%>
        <div class="widget-content mt10">
            <div id="like_tree_container" class="mb15">
                <ul class="nav nav-tabs nav-tabs-custom-colored" id="tree_lover_tab">
                    <li class="active">
                        <a href="#detail_event" role="tab" data-toggle="tab" data-slct_type="1"
                           aria-expanded="false" class="_tab">좋아요 트리만들기!</a>
                    </li>
                    <li>
                        <a href="#detail_event" role="tab" data-toggle="tab"
                           data-slct_type="2" aria-expanded="false" class="_tab">사랑꾼 선발대회</a>
                    </li>
                </ul>
            </div>

            <div id="section_tab_container" class="mb15">
                <ul class="nav nav-tabs nav-tabs-custom-colored" id="lover_section_tab_list">
                    <li class="active">
                        <a href="#detail_event" role="tab" data-toggle="tab" id="tab_event_1"
                           data-section_no="1" aria-expanded="false" class="_tab">1회차</a>
                    </li>
                    <li>
                        <a href="#detail_event" role="tab" data-toggle="tab" id="tab_event_2"
                           data-section_no="2" aria-expanded="false" class="_tab">2회차</a>
                    </li>
                </ul>
            </div>

            <div id="subscribe_status_area"></div>
            <div id="table_area"></div>
            <div id="story_list_tab_container" style="display: flex; margin-top: 25px;">
                <ul class="nav nav-tabs nav-tabs-custom-colored" id="section_tab_stroy_list">
                    <li class="active">
                        <a href="#detail_event" role="tab" data-toggle="tab" id="tab_story"
                           data-section_no="1" aria-expanded="false" class="_tab_story">사연리스트</a>
                    </li>
                    <li>
                        <a href="#detail_event" role="tab" data-toggle="tab" id="tab_del_stroy"
                           data-section_no="2" aria-expanded="false" class="_tab_story">삭제사연리스트</a>
                    </li>
                </ul>
                <button type="button" style="margin-left: 15px" onclick="popReportStory()">신고사연</button>
            </div>
            <div id="table_area2" style="margin-top: 0px"></div>
        </div>
    </div>
</div>
<%--</form>--%>
<div class="modal fade" id="allReportModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" style="width: 90%; display: table;">
        <div class="modal-content">
            <div class="modal-header">
                <lable>
                    <h4><b>신고 사연 리스트</b>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </h4>
                </lable>

            </div>
            <div class="modal-body">
                <div id="report_table_area"></div>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="detailLoverScoreModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" style="width: 90%; display: table;">
        <div class="modal-content">
            <div class="modal-header">
                <lable>
                    <h4><b><span class="center-block" id="user_id_nick">()</span></b>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </h4>
                </lable>
            </div>
            <div class="modal-body">
                <div id="section_tab_container" class="mb15">
                    <ul class="nav nav-tabs nav-tabs-custom-colored" id="lover_score_section_tab_list">
                        <li class="active">
                            <a href="#detail_event" role="tab" data-toggle="tab" id="tab_event_1"
                               data-section_no="0" aria-expanded="false" class="_tab_detail_score">전체</a>
                        </li>
                        <li>
                            <a href="#detail_event" role="tab" data-toggle="tab" id="tab_event_2"
                               data-section_no="1" aria-expanded="false" class="_tab_detail_score">좋아요</a>
                        </li>
                        <li>
                            <a href="#detail_event" role="tab" data-toggle="tab" id="tab_event_3"
                               data-section_no="2" aria-expanded="false" class="_tab_detail_score">라이브부스트</a>
                        </li>
                    </ul>
                </div>
                <div id="detail_lover_score_table_area"></div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="/js/code/content/contentCodeList.js?${dummyData}"></script>
<script type="text/javascript">
  let treeTabPagingInfo = new PAGING_INFO(0, 1, 30); //트리(사연,삭제사연)
  let loverTabPagingInfo = new PAGING_INFO(0, 1, 50); //사랑꾼 리스트
  let allReportPagingInfo = new PAGING_INFO(0, 1, 20);  //신고사연 팝업
  let detailLoverScorePagingInfo = new PAGING_INFO(0, 1, 20); //사랑꾼상세점수 팝업
  let popDetailLoverScoreMemNo = 0;
  let popDetailLoverScoreMemNick = 0;

  function getXmasEventList(pagingNo = 1) {
    if (!common.isEmpty(pagingNo)) {
      treeTabPagingInfo.pageNo = pagingNo;
      loverTabPagingInfo.pageNo = pagingNo;
    } else {
      treeTabPagingInfo.pageNo = 1;
      loverTabPagingInfo.pageNo = 1;
    }

    const treeLoverMainTab = $('#tree_lover_tab li.active a');
    const treeLoverTabNo = treeLoverMainTab.data('slct_type');

    if (treeLoverTabNo === 1) { //좋아요트리
      $('#story_list_tab_container').removeClass('hidden');
      $('#table_area2').removeClass('hidden');
      $('#section_tab_container').addClass('hidden');

      let data = {
        pageNo: pagingNo,
        pagePerCnt: treeTabPagingInfo.pageCnt,
      }

      let apiURL = "/rest/content/event/xmas/treeList";
      let resData;
      let resData2;
      util.getAjaxData("getXmasEventList", apiURL, data, function (dstId, response) {
        resData = response;
        compileHtml("#tmpl_like_tree", dstId, resData);
        if (currentStoryTabNo() == 2) { //삭제사연 리스트는 별도 restapi 에 있어서.
          apiURL = "/rest/content/event/xmas/delTreeStoryList";
          util.getAjaxData("getXmasEventList", apiURL, data, function (dstId, response) {
            resData2 = response;
            compileHtml("#tmpl_like_tree_story_list", dstId, resData, resData2);
          });
        }
      });
    } else { //사랑꾼선발대회
      $('#story_list_tab_container').addClass('hidden');
      $('#table_area2').addClass('hidden');
      $('#section_tab_container').removeClass('hidden');
      const loverSectionTab = $('#lover_section_tab_list li.active a');
      const loverSectionNo = loverSectionTab.data('section_no');
      // console.log("loverSectionNo=", loverSectionNo);
      let data = {
        seqNo: loverSectionNo,
        pageNo: pagingNo,
        pagePerCnt: loverTabPagingInfo.pageCnt,
      }

      util.getAjaxData("getXmasEventList", "/rest/content/event/xmas/loverList", data, function (dstId, response) {
        compileHtml("#tmpl_lover", dstId, response);
      });
    }
  }

  function currentStoryTabNo() {
    const storyListTab = $('#section_tab_stroy_list li.active a');
    const storyListNo = storyListTab.data('section_no');
    if (storyListNo == 1 || storyListNo == undefined) {
      return 1;
    }
    return 2;
  }

  function compileHtml(target, dstId, resData, resData2 = "") {
    // console.log("compileHtml====>", target, resData, resData2);
    let template, templateScript, context, html
    if (target == "#tmpl_like_tree" || target == "tmpl_like_tree_story_list") {
      template = $('#tmp_subscribe_status').html();
      templateScript = Handlebars.compile(template);
      context = resData.treeStatusData;
      html = templateScript(context);
      $("#subscribe_status_area").removeClass("hidden");
      $("#subscribe_status_area").html(html);

      template = $('#tmpl_like_tree_story_list').html();
      templateScript = Handlebars.compile(template);
      treeTabPagingInfo.totalCnt = resData.totalCnt;
      context = resData.listData;
      html = templateScript(context);
      $("#table_area2").html(html);

    } else if (target == "#tmpl_lover") {
      $("#subscribe_status_area").addClass("hidden");
    }

    template = $(target).html();
    templateScript = Handlebars.compile(template);

    if (target == "#tmpl_like_tree_story_list") {  //좋아요트리>삭제사연 리스트
      treeTabPagingInfo.totalCnt = resData2.totalCnt;
      context = resData2.listData;
      html = templateScript(context);
      $("#table_area2").html(html);
      // console.log("treeTabPagingInfo.totalCnt=", treeTabPagingInfo.totalCnt);
    } else if (target == "#tmpl_like_tree") {  //좋아요트리>사연 리스트
      treeTabPagingInfo.totalCnt = resData.totalCnt;
      context = resData.listData;
      html = templateScript(context);
      $("#table_area").html(html);
      // console.log("treeTabPagingInfo.totalCnt=", treeTabPagingInfo.totalCnt);
    } else { //사랑꾼 탭
      loverTabPagingInfo.totalCnt = resData.totalCnt;
      context = resData.listData;
      html = templateScript(context);
      $("#table_area").html(html);
      // console.log("loverTabPagingInfo.totalCnt=", loverTabPagingInfo.totalCnt);
    }
    util.renderPagingNavigation('nav_paginate_top', treeTabPagingInfo);
    util.renderPagingNavigation('nav_paginate_bottom', treeTabPagingInfo);
    util.renderPagingNavigation('nav_lover_paginate_top', loverTabPagingInfo);
    util.renderPagingNavigation('nav_lover_paginate_bottom', loverTabPagingInfo);
  }

  function handlebarsPaging(targetId, pagingInfo) {
    if (targetId === "nav_paginate_top" || targetId === "nav_paginate_bottom"
      || targetId === "nav_lover_paginate_top" || targetId === "nav_lover_paginate_bottom") {
      treeTabPagingInfo = pagingInfo;
      getXmasEventList(pagingInfo.pageNo);
    }

    if (targetId === "nav_report_paginate_top" || targetId === "nav_report_paginate_bottom") {
      allReportPagingInfo = pagingInfo;
      popReportStory(pagingInfo.pageNo);
    }

    if (targetId === "nav_lover_score_paginate_top" || targetId === "nav_lover_score_paginate_bottom") {
      detailLoverScorePagingInfo = pagingInfo;
      popDetailLoverScore(false, pagingInfo.pageNo);
    }
  }

  $(document).on('click', '._tab', function () {
    getXmasEventList(1);
  });

  $(document).on('click', '._tab_story', function () {
    getXmasEventList(1);
  });

  $(document).on('click', '._tab_detail_score', function () {
    popDetailLoverScore(false, 1);
  });

  // $("#bt_search").on('click', function () {
  //   getXmasEventList(1);
  // });


  function delStory(target, type) {
    const storyNo = target.story_no;
    const decoNo = target.story_decoration_no;
    if (decoNo != 0 && decoNo != undefined) {
      alert('현재 ' + decoNo + '번 트리에 장식되어 있습니다. 내린 후 삭제해 주세요.');
      return;
    }
    if (confirm('해당 사연을 삭제하겠습니까?')) {
      // console.log("delStory=", storyNo);
      let data = {
        storyNo: storyNo * 1,
      }
      util.getAjaxData("getXmasEventList", "/rest/content/event/xmas/delStory", data, function (dstId, response) {
        // console.log("delStory=", response);
        if (response.result.result != 'success') {
          alert('비정상 처리!, 다시 시도해 주세요');
          return;
        }
        if (type === 'storyList') {
          getXmasEventList(1);
        } else if (type === 'reportList') {
          popReportStory(1);
        }
      });
    }
  }

  function setDecoStory(target) {
    const storyNo = target.story_no;
    const decoNo = $("#story_select_no_" + storyNo).val();
    if (confirm('해당 사연을 ' + decoNo + '번 트리에 등록하시겠습니까?')) {
      // console.log("setDecoStory=", storyNo, decoNo);
      let data = {
        storyNo: storyNo * 1,
        decorationNo: decoNo * 1
      }
      callDecoApi(data)
    }

  }

  function setUnDecoStory(target) {
    if (confirm('해당 사연을 ' + target.story_decoration_no + '번 트리에서 내리겠습니까?')) {
      const storyNo = target.story_no;
      const decoNo = 0;
      // console.log("setUnDecoStory=", storyNo, decoNo);

      let data = {
        storyNo: storyNo * 1,
        decorationNo: decoNo
      }
      callDecoApi(data)
    }
  }

  function callDecoApi(data) {
    util.getAjaxData("getXmasEventList", "/rest/content/event/xmas/setDecoStory", data, function (dstId, response) {
      // console.log("callDecoApi=", response);
      if (response.result.result != 'success') {
        alert('비정상 처리!, 다시 시도해 주세요');
        return;
      }
      getXmasEventList(1);
    });
  }

  function popReportStory(pagingNo = 1) {
    if (!common.isEmpty(pagingNo)) {
      allReportPagingInfo.pageNo = pagingNo;
    } else {
      allReportPagingInfo.pageNo = 1;
    }

    let data = {
      pageNo: pagingNo,
      pagePerCnt: allReportPagingInfo.pageCnt,
    }

    util.getAjaxData("getXmasEventList", "/rest/content/event/xmas/getReportList", data, function (dstId, response) {
      // console.log("popReportStory=", response);

      $('#allReportModal').modal('show');

      template = $('#tmpl_pop_report').html();
      templateScript = Handlebars.compile(template);
      allReportPagingInfo.totalCnt = response.totalCnt;
      context = response.listData;
      html = templateScript(context);

      $("#report_table_area").html(html);
      util.renderPagingNavigation('nav_report_paginate_top', allReportPagingInfo);
      util.renderPagingNavigation('nav_report_paginate_bottom', allReportPagingInfo);
    });
  }

  function popDetailLoverScore(isInitPop, pagingNo = 1, memNo = "", memNick = "") {
    if (!common.isEmpty(pagingNo)) {
      detailLoverScorePagingInfo.pageNo = pagingNo;
    } else {
      detailLoverScorePagingInfo.pageNo = 1;
    }

    const loverSectionTab = $('#lover_section_tab_list li.active a');
    const loverSectiontNo = loverSectionTab.data('section_no');

    if (isInitPop) {  //모달창은 새로 열때마다 탭 초기화.
      $('#lover_score_section_tab_list li').eq(0).addClass('active');
      $('#lover_score_section_tab_list li').eq(1).removeClass('active');
      $('#lover_score_section_tab_list li').eq(2).removeClass('active');
    }
    const detailSectionTab = $('#lover_score_section_tab_list li.active a');
    const detailSectiontNo = detailSectionTab.data('section_no');
    if (memNo != "")
      popDetailLoverScoreMemNo = memNo;
    if (memNick != "")
      popDetailLoverScoreMemNick = memNick;

    let data = {
      scoreSlct: (detailSectiontNo !== undefined) ? detailSectiontNo : 0,
      memNo: popDetailLoverScoreMemNo,
      seqNo: loverSectiontNo,
      pageNo: pagingNo,
      pagePerCnt: detailLoverScorePagingInfo.pageCnt,
    }

    // console.log("popDetailLoverScore=", data);

    getDetailLoverScore(data);
  }

  function getDetailLoverScore(data) {
    util.getAjaxData("getXmasEventList", "/rest/content/event/xmas/getDetailLoverScoreList", data, function (dstId, response) {
      // console.log("getDetailScoreList=", response);

      $('#user_id_nick').html(popDetailLoverScoreMemNo.toString() + "(" + popDetailLoverScoreMemNick + ")");
      $('#detailLoverScoreModal').modal('show');

      detailLoverScorePagingInfo.totalCnt = response.totalCnt;
      template = $('#tmpl_pop_lover_score').html();

      templateScript = Handlebars.compile(template);
      context = response.listData;
      html = templateScript(context);

      $("#detail_lover_score_table_area").html(html);
      util.renderPagingNavigation('nav_lover_score_paginate_top', detailLoverScorePagingInfo);
      util.renderPagingNavigation('nav_lover_score_paginate_bottom', detailLoverScorePagingInfo);
    });
  }

  $(function () {
    Handlebars.registerHelper("genDecoSelect", function (storyNo, decoNo, options) {
      // console.warn('storyNo=', storyNo, 'decoNo=', decoNo, 'options=', options);

      let selectHtml = '<select id=story_select_no_' + storyNo + ' class="form-control searchType">';
      for (let i = 1; i <= 3; i++) {
        if (decoNo == i) {
          // selectHtml += "<option disabled>" + i + "</option>";
        } else {
          selectHtml += "<option>" + i + "</option>";
        }
      }
      selectHtml += " </select>";
      return selectHtml;
    });

    Handlebars.registerHelper('isStoryList', function (options) {
      if (currentStoryTabNo() === 1) {
        return options.fn(this);
      } else {
        return options.inverse(this);
      }
    });

    Handlebars.registerHelper('treeStep', function (value, options) {
      let treeStep;
      if (value >= 250000) {
        treeStep = 3;
      } else if (value >= 120000) {
        treeStep = 2;
      } else {
        treeStep = 1;
      }
      return treeStep + "단계 트리";
    });

    Handlebars.registerHelper("calReverseNoForStoryList", function (value, options) {
      const totalCnt = treeTabPagingInfo.totalCnt;
      const pageNo = treeTabPagingInfo.pageNo;
      const pagePerNo = treeTabPagingInfo.pageCnt;
      return totalCnt - ((pageNo - 1) * pagePerNo) - parseInt(value);
    });
    Handlebars.registerHelper("calReverseNoForDetailScore", function (value, options) {
      const totalCnt = detailLoverScorePagingInfo.totalCnt;
      const pageNo = detailLoverScorePagingInfo.pageNo;
      const pagePerNo = detailLoverScorePagingInfo.pageCnt;
      return totalCnt - ((pageNo - 1) * pagePerNo) - parseInt(value);
    });
    Handlebars.registerHelper("calReverseNoForReportList", function (value, options) {
      const totalCnt = allReportPagingInfo.totalCnt;
      const pageNo = allReportPagingInfo.pageNo;
      const pagePerNo = allReportPagingInfo.pageCnt;
      return totalCnt - ((pageNo - 1) * pagePerNo) - parseInt(value);
    });
    Handlebars.registerHelper("calNo", function (value, options) {
      const totalCnt = loverTabPagingInfo.totalCnt;
      const pageNo = loverTabPagingInfo.pageNo;
      const pagePerNo = loverTabPagingInfo.pageCnt;
      return ((pageNo - 1) * pagePerNo) + parseInt(value) + 1;
    });
    Handlebars.registerHelper("calNoPlus1", function (value, options) {
      return parseInt(value) + 1;
    });

    getXmasEventList(1);

  });

</script>

<%--좋아요 트리만들기 상단 상태--%>
<script type="text/x-handlebars-template" id="tmp_subscribe_status">
    <div>좋아요 점수 : {{addComma send_like_score_cnt}}점 ({{addComma send_like_cnt}})개</div>
    <div>라이브 부스트 점수 : {{addComma send_booster_score_cnt}}점 ({{addComma send_booster_cnt}})개</div>
    <div style="margin-bottom: 5px"><b>총점 : {{addComma tot_score_cnt}}점 ({{treeStep tot_score_cnt}})</b></div>
</script>

<%--좋아요 트리만들기 1,2,3트리별 장식 사연--%>
<script type="text/x-handlebars-template" id="tmpl_like_tree">
    1번 트리 장식 사연
    <table class="table table-sorting table-hover table-bordered" style="margin-bottom: 8px;">
        <colgroup>
            <col width="50px"/>
            <col width="150px"/>
            <col width="200px"/>
            <col/>
            <col width="150px"/>
            <col width="80px"/>
        </colgroup>
        <thead>
        <tr>
            <th>No</th>
            <th>회원번호</th>
            <th>닉네임</th>
            <th>사연</th>
            <th>장식 등록 일자</th>
            <th>내리기</th>
        </tr>
        </thead>
        <tbody>
        {{#each tree1StoryList}}
        <tr>
            <td>{{calNoPlus1 @key}}</td>
            <td>{{{memNoLink mem_no mem_no}}}</td>
            <td>{{mem_nick}}</td>
            <td>{{story_conts}}</td>
            <td>{{decoration_date}}</td>
            <td>
                <button type="button" class="btn btn-warning btn-xs" onclick="setUnDecoStory($(this).data());"
                        data-story_no='{{auto_no}}' data-story_decoration_no='{{story_decoration_no}}'>내리기
                </button>
            </td>
        </tr>

        {{else}}
        <tr>
            <td colspan="6">{{isEmptyData}}</td>
        </tr>
        {{/each}}
        </tbody>
    </table>
    2번 트리 장식 사연
    <table class="table table-sorting table-hover table-bordered" style="margin-bottom: 8px;">
        <colgroup>
            <col width="50px"/>
            <col width="150px"/>
            <col width="200px"/>
            <col/>
            <col width="150px"/>
            <col width="80px"/>
        </colgroup>
        <thead>
        <tr>
            <th>No</th>
            <th>회원번호</th>
            <th>닉네임</th>
            <th>사연</th>
            <th>장식 등록 일자</th>
            <th>내리기</th>
        </tr>
        </thead>
        <tbody>
        {{#each tree2StoryList}}
        <tr>
            <td>{{calNoPlus1 @key}}</td>
            <td>{{{memNoLink mem_no mem_no}}}</td>
            <td>{{mem_nick}}</td>
            <td>{{story_conts}}</td>
            <td>{{decoration_date}}</td>
            <td>
                <button type="button" class="btn btn-warning btn-xs" onclick="setUnDecoStory($(this).data());"
                        data-story_no='{{auto_no}}' data-story_decoration_no='{{story_decoration_no}}'>내리기
                </button>
            </td>
        </tr>

        {{else}}
        <tr>
            <td colspan="6">{{isEmptyData}}</td>
        </tr>
        {{/each}}
        </tbody>
    </table>
    3번 트리 장식 사연
    <table class="table table-sorting table-hover table-bordered" style="margin-bottom: 8px;">
        <colgroup>
            <col width="50px"/>
            <col width="150px"/>
            <col width="200px"/>
            <col/>
            <col width="150px"/>
            <col width="80px"/>
        </colgroup>
        <thead>
        <tr>
            <th>No</th>
            <th>회원번호</th>
            <th>닉네임</th>
            <th>사연</th>
            <th>장식 등록 일자</th>
            <th>내리기</th>
        </tr>
        </thead>
        <tbody>
        {{#each tree3StoryList}}
        <tr>
            <td>{{calNoPlus1 @key}}</td>
            <td>{{{memNoLink mem_no mem_no}}}</td>
            <td>{{mem_nick}}</td>
            <td>{{story_conts}}</td>
            <td>{{decoration_date}}</td>
            <td>
                <button type="button" class="btn btn-warning btn-xs" onclick="setUnDecoStory($(this).data());"
                        data-story_no='{{auto_no}}' data-story_decoration_no='{{story_decoration_no}}'>내리기
                </button>
            </td>
        </tr>

        {{else}}
        <tr>
            <td colspan="6">{{isEmptyData}}</td>
        </tr>
        {{/each}}
        </tbody>
    </table>

</script>
<%--좋아요 트리만들기 전체 사연/삭제사연 리스트--%>
<script type="text/x-handlebars-template" id="tmpl_like_tree_story_list">
    <div id="story_list">
        <div class="dataTables_paginate paging_full_numbers" id="nav_paginate_top"></div>
        {{#isStoryList}}
        <table class="table table-sorting table-hover table-bordered">
            <colgroup>
                <col width="50px"/>
                <col width="150px"/>
                <col width="200px"/>
                <col/>
                <col width="150px"/>
                <col width="80px"/>
                <col width="80px"/>
                <col width="150px"/>
            </colgroup>
            <thead>
            <tr>
                <th>No</th>
                <th>회원번호</th>
                <th>닉네임</th>
                <th>사연</th>
                <th>사연 등록 일자</th>
                <th>삭제</th>
                <th>등록된 트리</th>
                <th>등록</th>
            </tr>
            </thead>
            <tbody>
            {{#each allStoryList}}
            <tr>
                <td>{{calReverseNoForStoryList @key}}</td>
                <td>{{{memNoLink mem_no mem_no}}}</td>
                <td>{{mem_nick}}</td>
                <td>{{story_conts}}</td>
                <td>{{ins_date}}</td>
                <td>
                    <button type="button" class="btn btn-danger btn-xs" onclick="delStory($(this).data(), 'storyList');"
                            data-story_no='{{auto_no}}' data-story_decoration_no='{{story_decoration_no}}'>삭제하기
                    </button>
                </td>
                {{#dalbit_if story_decoration_no "==" "0"}}
                <td>-</td>
                {{else}}
                <td>{{story_decoration_no}}</td>
                {{/dalbit_if}}
                <td>
                    {{{genDecoSelect auto_no story_decoration_no}}}
                    <button type="button" class="btn btn-info btn-xs" onclick="setDecoStory($(this).data());"
                            data-story_no='{{auto_no}}' data-story_decoration_no='{{story_decoration_no}}'>등록하기
                    </button>
                </td>
            </tr>

            {{else}}
            <tr>
                <td colspan="8">{{isEmptyData}}</td>
            </tr>
            {{/each}}
            </tbody>
        </table>
        {{else}}
        <table class="table table-sorting table-hover table-bordered">
            <colgroup>
                <col width="50px"/>
                <col width="150px"/>
                <col width="200px"/>
                <col/>
                <col width="150px"/>
                <col width="150px"/>
                <col width="150px"/>
            </colgroup>
            <thead>
            <tr>
                <th>No</th>
                <th>회원번호</th>
                <th>닉네임</th>
                <th>사연</th>
                <th>사연 등록 일자</th>
                <th>사연 삭제 일자</th>
                <th>삭제자</th>
            </tr>
            </thead>
            <tbody>
            {{#each this}}
            <tr>
                <td>{{calReverseNoForStoryList @key}}</td>
                <td>{{{memNoLink mem_no mem_no}}}</td>
                <td>{{mem_nick}}</td>
                <td>{{story_conts}}</td>
                <td>{{ins_date}}</td>
                <td>{{del_date}}</td>
                {{#dalbit_if del_slct "==" "1"}}
                <td>본인삭제</td>
                {{else}}
                <td>관리자({{del_chrgr_name}})삭제</td>
                {{/dalbit_if}}
            </tr>

            {{else}}
            <tr>
                <td colspan="7">{{isEmptyData}}</td>
            </tr>
            {{/each}}
            </tbody>
        </table>
        {{/isStoryList}}
        <div class="dataTables_paginate paging_full_numbers" id="nav_paginate_bottom"></div>
    </div>
</script>

<%--좋아요>신고사연 팝업--%>
<script type="text/x-handlebars-template" id="tmpl_pop_report">
    <div class="dataTables_paginate paging_full_numbers" id="nav_report_paginate_top"></div>
    <table class="table table-sorting table-hover table-bordered">
        <colgroup>
            <col width="50px"/>
            <col width="150px"/>
            <col width="150px"/>
            <col/>
            <col width="150px"/>
            <col width="80px"/>
        </colgroup>
        <thead>
        <tr>
            <th>No</th>
            <th>신고자</th>
            <th>대상자</th>
            <th>사연내용</th>
            <th>신고일자</th>
            <th>삭제하기</th>
        </tr>
        </thead>
        <tbody>
        {{#each this}}
        <tr>
            <td>{{calReverseNoForReportList @key}}</td>
            <td>{{{memNoLink mem_no mem_no}}}</td>
            <td>{{{memNoLink rpt_mem_no rpt_mem_no}}}</td>
            <td>{{rpt_story_conts}}</td>
            <td>{{rpt_ins_date}}</td>
            <td>
                <button type="button" class="btn btn-danger btn-xs" onclick="delStory($(this).data(), 'reportList');"
                        data-story_no='{{rpt_story_no}}'>삭제하기
                </button>
            </td>
        </tr>

        {{else}}
        <tr>
            <td colspan="6">{{isEmptyData}}</td>
        </tr>
        {{/each}}
        </tbody>
    </table>
    <div class="dataTables_paginate paging_full_numbers" id="nav_report_paginate_bottom"></div>
</script>

<%--사랑꾼 선발대회--%>
<script type="text/x-handlebars-template" id="tmpl_lover">
    <div class="dataTables_paginate paging_full_numbers" id="nav_lover_paginate_top"></div>
    <table class="table table-sorting table-hover table-bordered">
        <colgroup>
            <col width="50px"/>
            <col width="150px"/>
            <col/>
            <col width="150px"/>
            <col width="150px"/>
            <col width="150px"/>
            <col width="250px"/>
        </colgroup>
        <thead>
        <tr>
            <th>순위</th>
            <th>회원번호</th>
            <th>닉네임</th>
            <th>총점</th>
            <th>좋아요 점수</th>
            <th>라이브 부스트 점수</th>
            <th>보상 달 지급(일자)</th>
        </tr>
        </thead>
        <tbody>
        {{#each this}}
        <tr>
            <td>{{calNo @key}}</td>
            <td>{{{memNoLink mem_no mem_no}}}</td>
            <td>{{mem_nick}}</td>
            <td><a href="#" onclick="popDetailLoverScore(true, 1, {{mem_no}}, '{{mem_nick}}')">{{addComma
                tot_score_cnt}}점</a>
            </td>
            <td><a href="#" onclick="popDetailLoverScore(true, 1, {{mem_no}}, '{{mem_nick}}')">{{addComma
                send_like_score_cnt}}점</a></td>
            <td><a href="#" onclick="popDetailLoverScore(true, 1, {{mem_no}}, '{{mem_nick}}')">{{addComma
                send_booster_score_cnt}}점</a></td>
            {{#dalbit_if rcv_reword_cnt "!=" 0}}
            <td>{{addComma rcv_reword_cnt}}달 ({{rcv_date}})</td>
            {{/dalbit_if}}
            {{#dalbit_if rcv_reword_cnt "==" 0}}
            <td>-</td>
            {{/dalbit_if}}
        </tr>

        {{else}}
        <tr>
            <td colspan="7">{{isEmptyData}}</td>
        </tr>
        {{/each}}
        </tbody>
    </table>
    <div class="dataTables_paginate paging_full_numbers" id="nav_lover_paginate_bottom"></div>
</script>

<%--사랑꾼>상세점수 팝업--%>
<script type="text/x-handlebars-template" id="tmpl_pop_lover_score">
    <div class="dataTables_paginate paging_full_numbers" id="nav_lover_score_paginate_top"></div>
    <table class="table table-sorting table-hover table-bordered">
        <colgroup>
            <col width="50px"/>
            <col/>
            <col width="250px"/>
            <col width="200px"/>
            <col width="80px"/>
            <col width="150px"/>
        </colgroup>
        <thead>
        <tr>
            <th>No</th>
            <th>방송제목</th>
            <th>BJ(닉네임)</th>
            <th>좋아요/라이브부스트</th>
            <th>점수</th>
            <th>일자</th>
        </tr>
        </thead>
        <tbody>
        {{#each this}}
        <tr>
            <td>{{calReverseNoForDetailScore @key}}</td>
            <td>{{{roomNoLink room_title room_no}}}</td>
            <td>{{{memNoLink dj_mem_no dj_mem_no}}}({{dj_mem_nick}})</td>
            {{#dalbit_if score_slct "==" 1}}
            <td>좋아요 X {{tot_cnt}}</td>
            {{/dalbit_if}}
            {{#dalbit_if score_slct "==" 2}}
            <td>라이브부스트 X {{tot_cnt}}</td>
            {{/dalbit_if}}
            <td>+{{addComma score_cnt}}</td>
            <td>{{ins_date}}</td>
        </tr>

        {{else}}
        <tr>
            <td colspan="6">{{isEmptyData}}</td>
        </tr>
        {{/each}}
        </tbody>
    </table>
    <div class="dataTables_paginate paging_full_numbers" id="nav_lover_score_paginate_bottom"></div>
</script>
