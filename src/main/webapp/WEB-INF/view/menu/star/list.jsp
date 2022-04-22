<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dummyData"><%= java.lang.Math.round(java.lang.Math.random() * 1000000) %>
</c:set>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="container-fluid">
            <!-- serachBox -->
            <form id="searchForm">
                <div class="row col-lg-12 form-inline">
                    <div class="widget widget-table searchBoxArea">

                        <table>
                            <tr>
                                <th rowspan="2" style="background-color:#4472c4;color:#e9ee17;width: 70px">
                                    <i class="fa fa-search"></i><br/>검색
                                    <jsp:include page="../../searchArea/daySearchFunction.jsp"/>
                                </th>
                                <th id="th_bottonList">
                                    <div>
                                        <div id="div_monthButton">
                                            <jsp:include page="../../searchArea/monthSearchArea.jsp"/>
                                        </div>
                                    </div>
                                </th>
                            </tr>
                            <tr>
                                <td style="text-align: left">
                                    <input id="monthDate" type="text" class="form-control"/>
                                    <input class="hide" name="startDate" id="startDate" style="width: 100px">
                                    <input class="hide" name="endDate" id="endDate" style="width: 100px">
                                    <span id="searchMemberArea" onchange="btSearchClick();"></span>
                                    <label><input type="text" class="form-control" name="searchText" id="searchText"
                                                  placeholder="검색어를 입력해주세요."></label>
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

            <!-- tab -->
            <div class="row col-lg-12 form-inline">
                <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist" id="tablist_con">
                    <li class="active"><a href="#dal" role="tab" data-toggle="tab" class="_tab" data-tab="star">스타
                        DJ</a></li>
                    <li><a href="#reqDal" role="tab" data-toggle="tab" class="_tab" data-tab="req">스타 DJ 신청</a></li>
                    <li><a href="#reqManage" role="tab" data-toggle="tab" class="_tab" data-tab="manage">스타 DJ 신청관리</a>
                    </li>
                </ul>
                <div class="tab-content no-padding">
                    <div class="tab-pane fade in active" id="dal">
                        <div class="row col-md-12 mt15">
                            <div class="pull-left ml5 mb15">
                                ㆍ 해당 월의 스타 DJ입니다. <br/>
                                ㆍ 운영자 직접 등록 시 해당 월 1일부터 바로 스타 DJ가 적용됩니다. <br/>
                                ㆍ 스타 DJ 자격은 1개월(당월 1일~당월 말일) 동안 유지됩니다.
                            </div>
                            <div class="pull-right ml5 mb15">
                                <button type="button" class="btn btn-primary pull-right mt10 mr15" id="memSearch"
                                        name="memSearch"><i class="fa fa-search"></i>운영자 직접 등록
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="reqDal">
                        <div class="row col-lg-12 mt15">
                            <div class="pull-left ml5">
                                ㆍ 매달 최소 10일, 20시간 이상 방송한 DJ입니다. <br/>
                                ㆍ 기간 정지 3회 이상 혹은 영구 정지 시 박탈처리 합니다. <br/>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="reqManage">스타 DJ 신청관리</div>
                </div>
            </div>
            <!-- //tab -->
            <div id="result-area"></div>
            <div id="detail-area"></div>
        </div> <!-- //container-fluid -->
    </div> <!-- //page-wrapper -->
</div>
<!-- //wrapper-->

<jsp:include page="../../common/util/select_specialList.jsp" />
<script type="text/javascript" src="/js/code/menu/menuCodeList.js?${dummyData}"></script>
<script type="text/javascript">
  let tabSlct = 'star';
  const starPagingInfo = new PAGING_INFO(0, 1, 50);
  const starEventData = (function () {
    // 스타DJ 목록
    function starList() {
      $('#result-area').empty();
      $('#detail-area').empty();

      let tDate = $("#startDate").val().replace(/[.]/g, '-');
      let searchVal = $('#searchText').val();
      let searchSlct = $('#searchMember').val();

      let data = {
        tDate: tDate,
        searchVal: searchVal,
        searchSlct: searchSlct,
        pageNo: starPagingInfo.pageNo,
        pagePerCnt: starPagingInfo.pageCnt
      };
      let apiURL = '/rest/menu/star/list';
      util.getAjaxData("findStarList", apiURL, data, renderStarList, null, {type: 'GET'});
    }

    function renderStarList(id, response, params) {
      let template, templateScript, context, html;
      template = $('#tmp-star-list').html();
      templateScript = Handlebars.compile(template);
      context = response.listData.map(function (item, index) {
        item.index_no = response.totalCnt - (((starPagingInfo.pageNo - 1) * starPagingInfo.pageCnt) + index);
        return item;
      });
      html = templateScript(context);
      $("#result-area").html(html);

      starPagingInfo.totalCnt = response.totalCnt;
      util.renderPagingNavigation('star-top', starPagingInfo);
      util.renderPagingNavigation('star-bottom', starPagingInfo);

      if (response.listData.length === 0) {
        $('#star-top').hide();
        $('#star-bottom').hide();
      } else {
        $('#star-top').show();
        $('#star-bottom').show();
      }
    }

    // 스타DJ 상세
    function starDetail(params) {
      if (!(params && params.mem_no)) return;
      $('#detail-area').empty();
      let data = {
        req_idx : params.req_idx,
        mem_no : params.mem_no,
        select_year:  common.substr($("#startDate").val(),0,4),
        select_month: common.substr($("#startDate").val(),5,2),
      };
      util.getAjaxData("starDetail", "/rest/menu/special/dalDetail", data, renderStarDetail);
    }
    function renderStarDetail(id, response, params) {
      let template, templateScript, context, html;
      template = $('#tmp-star-detail').html();
      templateScript = Handlebars.compile(template);
      context = response.data;
      html = templateScript(context);
      $("#detail-area").html(html);
    }

    // 스타DJ 신청 목록
    function reqList() {
      $('#result-area').empty();
      $('#detail-area').empty();

      let tDate = $("#startDate").val().replace(/[.]/g, '-');
      let searchVal = $('#searchText').val();
      let searchSlct = $('#searchMember').val();

      let data = {
        tDate: tDate,
        searchVal: searchVal,
        searchSlct: searchSlct,
        pageNo: starPagingInfo.pageNo,
        pagePerCnt: starPagingInfo.pageCnt
      };
      let apiURL = '/rest/menu/star/req-list';
      util.getAjaxData("findReqList", apiURL, data, renderReqList, null, {type: 'GET'});
    }

    function renderReqList(id, response, params) {
      let template, templateScript, context, html;
      template = $('#tmp-req-list').html();
      templateScript = Handlebars.compile(template);
      context = response.listData.map(function (item, index) {
        item.index_no = response.totalCnt - (((starPagingInfo.pageNo - 1) * starPagingInfo.pageCnt) + index);
        return item;
      });
      html = templateScript(context);
      $("#result-area").html(html);

      starPagingInfo.totalCnt = response.totalCnt;
      util.renderPagingNavigation('req-top', starPagingInfo);
      util.renderPagingNavigation('req-bottom', starPagingInfo);

      if (response.listData.length === 0) {
        $('#req-top').hide();
        $('#req-bottom').hide();
      } else {
        $('#req-top').show();
        $('#req-bottom').show();
      }
    }

    // 스타 DJ 신청관리
    function manageList() {
      $('#result-area').empty();
      $('#detail-area').empty();

      let data = {};
      let apiURL = '/rest/menu/special/selectManageList';
      util.getAjaxData("findManageList", apiURL, data, function (id, response, params) {

      }, null, {type: 'POST'});
    }

    // 스타 DJ 신청 등록
    function createManage() {

    }

    // 스타DJ 가산점 점수 수정
    function modifyPoint(json) {
      if (!(json && json.memNo && json.scoreCnt !== 0)) return;
      if(!confirm('가산점을 등록하시겠습니까?')) return;

      let apiURL = '/rest/menu/star/modify-point';
      util.getAjaxData("modifyPoint", apiURL, json, function (id, response, params) {
        if (response && response.data !== 1) {
          alert('가산점을 등록할 수 없습니다.');
        }
        reqList();
      }, null, {type: 'POST'});
    }

    // 스타DJ 등록
    function createStar(params) {
      if (!(params && params.mem_no)) return;
      if(!confirm(common.substr($("#startDate").val(),5,2) + '월의 스타 DJ로 등록하시겠습니까?')) return;

      let tDate = $("#startDate").val().replace(/[.]/g, '-');
      let data = {
        tDate: tDate,
        memNo: params.mem_no
      };
      let apiURL = '/rest/menu/star/create';
      util.getAjaxData("createStar", apiURL, data, function (id, response, params) {
        if (response && response.data !== 1) {
          alert('스타 DJ로 등록할 수 없습니다.');
        }
        starList();
      }, null, {type: 'POST'});
    }

    // 스타DJ 삭제
    function removeStar(memNo) {
      if(!confirm("스타 DJ에서 일반 DJ로 승인 취소하시겠습니까?")) return;

      let tDate = $("#startDate").val().replace(/[.]/g, '-');
      let data = {
        tDate: tDate,
        memNo: memNo
      };
      let apiURL = '/rest/menu/star/remove';
      util.getAjaxData("removeStar", apiURL, data, function (id, response, params) {
        if (response && response.data === 1) {
          starList();
        }
      }, null, {type: 'POST'});
    }

    // 기본실행
    function initSearch() {
      starPagingInfo.pageNo = 1;
      starPagingInfo.pageCnt = 50;
      switch (tabSlct) {
        case 'star':
          starList();
          break;
        case 'req':
          reqList();
          break;
        case 'manage':
          starPagingInfo.pageCnt = 20;
          manageList();
          break;
      }
    }

    return {
      starList: starList,
      starDetail: starDetail,
      reqList: reqList,
      manageList: manageList,
      createManage: createManage,
      modifyPoint: modifyPoint,
      createStar: createStar,
      removeStar: removeStar,
      initSearch: initSearch
    }
  }());

  function handlebarsPaging(targetId, pagingInfo) {
    switch (targetId) {
      case 'star-top':
      case 'star-bottom':
        starPagingInfo.pageNo = pagingInfo.pageNo;
        starEventData.starList();
        break;
    }
  }

  function btSearchClick() {
    $("#bt_search").click();
  }

  $(function () {
    $("#searchMemberArea").html(util.getCommonCodeSelect(1, searchMember));

    slctType = 1;
    setDayButton();

    // 기본실행
    starEventData.initSearch();

    $('#bt_search').on('click', function () {
      starEventData.initSearch();
    });

    $('input[id="searchText"]').keydown(function (e) {
      if (e.keyCode == 13) {
        starEventData.initSearch();
      }
    });

    $('#tablist_con li a').on('click', function () {
      const $this = $(this);
      tabSlct = $this.data('tab');
      starEventData.initSearch();
    });

    // 체크박스 클릭 - 스타DJ 상세
    $(document).on('click', '#star-body input[type="checkbox"]', function () {
      $('#detail-area').empty();

      let $this = $(this);
      if ($this.prop('checked')) {
        $('#result-area input[type="checkbox"]').removeAttr('checked');
        $this.prop('checked', true);

        starEventData.starDetail({
          req_idx: $this.val(),
          mem_no: $this.data('memno')
        });
      }
    });

    // 운영자 직접등록
    $(document).on('click', '#memSearch', function() {
      showPopMemberList(starEventData.createStar);
    });

    // 가산점
    $(document).on('click', '#req-body .modify-point', function() {
      let $this = $(this);
      let slctIndex = $('#req-body .modify-point').index($this);

      let memNo = $this.data('memno');
      let admin_score_cnt = parseInt($('#req-body .admin_score_cnt').eq(slctIndex).val(), 10);
      $('#req-body .admin_score_cnt').eq(slctIndex).val(admin_score_cnt);
      starEventData.modifyPoint({
        memNo: memNo,
        scoreCnt: admin_score_cnt,
        selectYear: common.substr($("#startDate").val(),0,4),
        selectMonth: common.substr($("#startDate").val(),5,2)
      });
    });
  });
</script>

<script type="text/x-handlebars-template" id="tmp-star-list">
    <div class="dataTables_paginate paging_full_numbers" id="star-top"></div>
    <table id="star-table" class="table table-sorting table-hover table-bordered">
        <colgroup>
            <col width="30px"/>
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
            <col width="auto"/>
            <col width="auto"/>
            <col width="auto"/>
            <col width="90px"/>
        </colgroup>
        <thead>
        <tr>
            <th></th>
            <th>No.</th>
            <th>스타DJ<br>횟수</th>
            <th>프로필</th>
            <th>회원번호</th>
            <th>User닉네임</th>
            <th>성별</th>
            <th>이름</th>
            <th>연락처</th>
            <th>월간(팬방제외)<br>방송시간</th>
            <th>월간 받은 별</th>
            <th>월간 좋아요 합계</th>
            <th>월간 누적 청취자 수</th>
            <th>월간 순수 청취자 수</th>
            <th>경고 / 정지</th>
            <th>등록자</th>
        </tr>
        </thead>
        <tbody id="star-body">
        {{#each this as |data|}}
        <tr {{#dalbit_if inner
        '==' 1}} class="_noTr bg-testMember" {{else}} class="_noTr" {{/dalbit_if}} id="row_{{order}}">
        <td>
            <input type="checkbox" value="{{req_idx}}" data-memno="{{mem_no}}"/>
        </td>
        <td>{{index_no}}</td>
        <td>{{addComma specialdj_cnt}}</td>
        <td style="width: 65px;height:65px;">
            <img class="thumbnail" src="{{renderProfileImage data.image_profile data.mem_sex}}"
                 style="width: 65px;height:65px; margin-bottom: 0px;" onclick="fullSize_background(this.src);"/>
        </td>
        <td>
            {{{memNoLink mem_no mem_no}}}
            {{#equal exitYn 'y'}}
            <br>
            [탈퇴회원]
            {{/equal}}
        </td>
        <td>{{mem_nick}}</td>
        <td>{{{sexIcon mem_sex mem_birth_year}}}</td>
        <td>{{mem_name}}</td>
        <td>{{phoneNumHyphen mem_phone}}</td>
        <td>{{timeStampDay play_cnt}}</td>
        <td>{{addComma byeol_cnt}} 개</td>
        <td>{{addComma like_cnt}} 개</td>
        <td>{{addComma tot_view_cnt}}</td>
        <td>{{addComma view_cnt}}</td>
        <td>{{warm_cnt}} / {{block_cnt}}</td>
        <td>{{op_name}}</td>
        </tr>
        {{else}}
        <tr>
            <td colspan="16">{{isEmptyData}}</td>
        </tr>
        {{/each}}
        </tbody>
    </table>
    <div class="dataTables_paginate paging_full_numbers" id="star-bottom"></div>
</script>

<script type="text/x-handlebars-template" id="tmp-star-detail">
    <div class="widget widget-table">
        <div class="widget-header">
            <h3><i class="fa fa-desktop"></i> 스타DJ 세부사항</h3>
        </div>
        <div class="widget-content mt15">
            <div class="row col-lg-12 form-inline">
                <table class="table table-bordered table-dalbit">
                    <input type="hidden" name="reqIdx" data-idx="{{req_idx}}"/>
                    <colgroup>
                        <col width="15%"/>
                        <col width="15%"/>
                        <col width="15%"/>
                        <col width="15%"/>
                        <col width="15%"/>
                        <col width="15%"/>
                    </colgroup>
                    <tr>
                        <th>등록일시</th>
                        <td>{{convertToDate reg_date 'YYYY-MM-DD HH:mm:ss'}}</td>
                        <th>스타DJ 선정 년/월</th>
                        <td >{{select_year}}년 {{select_month}}월</td>
                        <th>관리자 등록 여부</th>
                        <td>
                            {{#equal is_force '0'}}N{{/equal}}
                            {{^equal is_force '0'}}Y{{/equal}}
                        </td>
                    </tr>
                </table>
                <!-- 승인취소-->
                <button type="button" class="btn btn-danger btn-sm mb15" id="bt_reqCancel" onclick="starEventData.removeStar({{mem_no}})">승인취소</button>
            </div>
        </div>
    </div>
</script>

<script type="text/x-handlebars-template" id="tmp-req-list">
    <div class="dataTables_paginate paging_full_numbers" id="req-top"></div>
    <table id="req-table" class="table table-sorting table-hover table-bordered">
        <colgroup>
            <col width="30px"/>
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
            <col width="auto"/>
            <col width="auto"/>
            <col width="180px">
            <col width="100px"/>
            <col width="90px"/>
        </colgroup>
        <thead>
        <tr>
            <th></th>
            <th>No.</th>
            <th>스타DJ<br>횟수</th>
            <th>회원번호</th>
            <th>닉네임</th>
            <th>성별</th>
            <th>이름</th>
            <th>연락처</th>
            <th>월간(팬방제외)<br>방송시간</th>
            <th>월간 받은 별</th>
            <th>월간 좋아요 합계</th>
            <th>월간 평균 청취자 수</th>
            <th>경고 / 정지</th>
            <th>타임랭킹 가산점</th>
            <th>가산점</th>
            <th>총 점수</th>
            <th>등록자</th>
        </tr>
        </thead>
        <tbody id="req-body">
        {{#each this as |data|}}
        <tr {{#dalbit_if inner '==' 1}} class="_noTr bg-testMember" {{else}} class="_noTr" {{/dalbit_if}} id="row_{{order}}">
            <td>
                <input type="checkbox" value="{{req_idx}}" data-memno="{{mem_no}}"/>
            </td>
            <td>{{index_no}}</td>
            <td>{{addComma specialdj_cnt}}</td>
            <td>
                {{{memNoLink mem_no mem_no}}}
                {{#equal exitYn 'y'}}
                <br>
                [탈퇴회원]
                {{/equal}}
            </td>
            <td>{{mem_nick}}</td>
            <td>{{{sexIcon mem_sex mem_birth_year}}}</td>
            <td>{{mem_name}}</td>
            <td>{{phoneNumHyphen mem_phone}}</td>
            <td>{{timeStampDay play_cnt}}</td>
            <td>{{addComma byeol_cnt}} 개</td>
            <td>{{addComma like_cnt}} 개</td>
            <td>{{view_cnt}} 명</td>
            <td>{{warm_cnt}} / {{block_cnt}}</td>
            <td>{{time_rank_score_cnt}} 점</td>
            <td>
                <div class="form-inline">
                    <input type="number" name="admin_score" class="form-control admin_score_cnt" style="width: 80px;" value="{{admin_score_cnt}}">
                    <button type="button" class="btn btn-sm btn-success modify-point" data-memno="{{mem_no}}">적용</button>
                </div>
            </td>
            <td>{{addComma tot_score_cnt}} 점</td>
            <td>{{op_name}}</td>
        </tr>
        {{else}}
        <tr>
            <td colspan="17">{{isEmptyData}}</td>
        </tr>
        {{/each}}
        </tbody>
    </table>
    <div class="dataTables_paginate paging_full_numbers" id="req-bottom"></div>
</script>