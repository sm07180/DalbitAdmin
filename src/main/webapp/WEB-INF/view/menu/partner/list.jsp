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
                                    <%--<input name="startDate" id="startDate" style="width: 100px">--%>
                                    <%--<input name="endDate" id="endDate" style="width: 100px">--%>
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
            <!-- tab -->
            <div class="row col-lg-12 form-inline">
                <!-- //serachBox -->
                <h4><b>[파트너DJ]</b></h4>

                <div class="row col-md-12 mt15">
                    <div class="pull-left ml5 mb15">
                        ㆍ 해당 월의 파트너 DJ입니다. <br/>
                        ㆍ 운영자 직접 등록 시 해당 시점부터 수동으로 취소하기 전까지 파트너 DJ가 유지됩니다. <br/>
                        ㆍ 파트너 DJ 자격은 직접 취소하지 않으면 다음 달에도 계속 유지됩니다.
                    </div>

                    <!-- summary & 운영자 등록 버튼 -->
                    <div class="pull-right ml5 mb15">
                        <button type="button" class="btn btn-primary pull-right mt10 mr15" id="memSearch"
                                name="memSearch"><i class="fa fa-search"></i>운영자 직접 등록
                        </button>
                    </div>
                    <!-- //summary -->
                </div>
                <div id="partner-list"></div>
            </div>
            <!-- //tab -->
        </div> <!-- //container-fluid -->
    </div> <!-- //page-wrapper -->
</div>
<!-- //wrapper-->

<div class="modal fade" id="partnerMemberSearch" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body">
                <div class="searchBoxArea">
                    <table class="table table-bordered no-margin" style="width: 100%;">
                        <colgroup>
                            <col width="100px">
                            <col width="auto">
                        </colgroup>
                        <tr>
                            <th><i class="fa fa-search"></i> 회원 검색</th>
                            <td>
                                <div class="form-inline text-left">
                                    <select name="searchSlct" id="partnerSearchSlct" class="form-control searchType">
                                        <option value="1">회원 번호</option>
                                        <option value="2">회원 닉네임</option>
                                        <option value="3">이름</option>
                                        <option value="4">연락처</option>
                                        <option value="5">아이디</option>
                                        <option value="6">IP</option>
                                        <option value="7">모바일ID</option>
                                    </select>
                                    <label><input type="text" name="searchData" id="partnersearchData"
                                                  class="form-control"></label>
                                    <button type="button" class="btn btn-success"
                                            onclick="partnerEventData.callPartnerSearch()">검색
                                    </button>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
                <div id="partner-search-list"></div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="/js/code/menu/menuCodeList.js?${dummyData}"></script>
<script type="text/javascript">
  const partnerParam = {
    tMonth: '',
    searchVal: '',
    searchSlct: 1,
    pageNo: 1,
    pageCnt: 50,
  }
  const partnerSearch = {
    searchVal: '',
    searchSlct: 1,
    pageNo: 1,
    pageCnt: 50,
  }
  let partnerEditMode = 'create'; // 등록 / 수정판단
  const partnerPagingInfo = new PAGING_INFO(0, 1, 50);
  const partnerSearchPagingInfo = new PAGING_INFO(0, 1, 10);
  const partnerEventData = (function () {
    // 파트너 목록
    function callPartnerList() {
      $("#partner-list").empty();

      partnerParam.tMonth = [common.substr($("#startDate").val(), 0, 4), common.substr($("#startDate").val(), 5, 2), '01'].join('-');
      partnerParam.searchVal = $.trim($('#searchText').val());
      partnerParam.searchSlct = $('#searchMember').val();
      partnerParam.pageNo = partnerPagingInfo.pageNo;
      partnerParam.pageCnt = partnerPagingInfo.pageCnt;
      let apiURL = '/rest/menu/partner/list';
      util.getAjaxData("getPartnerList", apiURL, partnerParam, function (id, response, params) {
        renderPartnerList(id, response, params);
      }, null, {type: 'GET'});
    }

    function renderPartnerList(id, response, params) {
      let template, templateScript, context, html;
      template = $('#tmp-partner-list').html();
      templateScript = Handlebars.compile(template);
      context = response.listData.map(function (item, index) {
        item.index_no = response.totalCnt - (((partnerPagingInfo.pageNo - 1) * partnerPagingInfo.pageCnt) + index);
        return item;
      });
      html = templateScript(context);
      $("#partner-list").html(html);

      partnerPagingInfo.totalCnt = response.totalCnt;
      util.renderPagingNavigation('partner-top', partnerPagingInfo);
      util.renderPagingNavigation('partner-bottom', partnerPagingInfo);

      if (response.listData.length === 0) {
        $('#partner-top').hide();
        $('#partner-bottom').hide();
      } else {
        $('#partner-top').show();
        $('#partner-bottom').show();
      }
    }

    // 파트너 등록 검색창 열기
    function openPartnerSearch(mem_no) {
      partnerEditMode = 'create';
      $("#partner-search-list").empty();
      $('#partnersearchData').val('');
      $('#partnerSearchSlct').val(1);

      $('#partnerMemberSearch').modal('show');
      if (mem_no) {
        partnerEditMode = 'modify';
        $('#partnersearchData').val(mem_no);
        $('#partnerSearchSlct').val(1);
        callPartnerSearch();
      }
    }

    // 파트너 검색 목록
    function callPartnerSearch() {
      $("#partner-search-list").empty();

      partnerSearch.searchVal = $.trim($('#partnersearchData').val());
      partnerSearch.searchSlct = $('#partnerSearchSlct').val();
      partnerSearch.pageNo = partnerSearchPagingInfo.pageNo;
      partnerSearch.pageCnt = partnerSearchPagingInfo.pageCnt;
      let apiURL = '/rest/menu/partner/search';
      util.getAjaxData("getPartnerSearchList", apiURL, partnerSearch, function (id, response, params) {
        renderPartnerSearchList(id, response, params);
      }, null, {type: 'GET'});
    }

    function renderPartnerSearchList(id, response, params) {
      let template, templateScript, context, html;
      template = $('#tmp-partner-search-list').html();
      templateScript = Handlebars.compile(template);
      context = response.listData.map(function (item, index) {
        item.index_no = response.totalCnt - (((partnerSearchPagingInfo.pageNo - 1) * partnerSearchPagingInfo.pageCnt) + index);
        return item;
      });
      html = templateScript(context);
      $("#partner-search-list").html(html);

      partnerSearchPagingInfo.totalCnt = response.totalCnt;
      util.renderPagingNavigation('partner-search-top', partnerSearchPagingInfo);
      util.renderPagingNavigation('partner-search-bottom', partnerSearchPagingInfo);

      if (response.listData.length === 0) {
        $('#partner-search-top').hide();
        $('#partner-search-bottom').hide();
      } else {
        $('#partner-search-top').show();
        $('#partner-search-bottom').show();
      }
    }

    // 파트너 등록
    function createPartner(data) {
      if (!data) return;
      let $benefit = $('#benefit-' + data.mem_no);
      if ($.trim($benefit.val()) == '') {
        alert('혜택정보가 없습니다.');
        $benefit.focus();
        return;
      }

      if (partnerEditMode === 'modify' && !confirm('혜택정보를 수정하시겠습니까?')) {
        return;
      }

      let param = {
        memNo: data.mem_no,
        partnerBenefit: $.trim($benefit.val())
      };
      let apiURL = '/rest/menu/partner/' + partnerEditMode;
      util.getAjaxData("updatePartner", apiURL, param, function (id, response, params) {
        $('#partnerMemberSearch').modal('hide');
        if (partnerEditMode === 'create') {
          partnerPagingInfo.pageNo = 1;
        }
        callPartnerList();
      }, null, {type: 'POST'});
    }

    // 파트너 삭제(취소)
    function deletePartner(mem_no) {
      if (!mem_no) return;
      if (!confirm('파트너DJ를 삭제하시겠습니까?')) {
        return;
      }

      let param = {
        memNo: mem_no,
        cancelDetail: '관리자 삭제'
      };
      let apiURL = '/rest/menu/partner/cancel';
      util.getAjaxData("deletePartner", apiURL, param, function (id, response, params) {
        callPartnerList();
      }, null, {type: 'POST'});
    }

    return {
      callPartnerList: callPartnerList,
      callPartnerSearch: callPartnerSearch,
      openPartnerSearch: openPartnerSearch,
      createPartner: createPartner,
      deletePartner: deletePartner,
    }
  }());

  function handlebarsPaging(targetId, pagingInfo) {
    switch (targetId) {
      case 'partner-top':
      case 'partner-bottom':
        partnerPagingInfo.pageNo = pagingInfo.pageNo;
        partnerEventData.callPartnerList();
        break;
      case 'partner-search-top':
      case 'partner-search-bottom':
        partnerSearchPagingInfo.pageNo = pagingInfo.pageNo;
        partnerEventData.callPartnerSearch();
        break;
    }
  }

  // 이벤트 연동
  function btSearchClick() {
    $("#bt_search").click();
  }

  $(function () {
    $("#searchMemberArea").html(util.getCommonCodeSelect(1, searchMember));
    slctType = 1;
    setDayButton();

    // 목록페이지
    partnerEventData.callPartnerList();

    // 파트너 목록 적용
    $('#bt_search').on('click', function () {
      partnerPagingInfo.pageNo = 1;
      partnerEventData.callPartnerList();
    });

    // 파트너DJ 운영자 등록
    $('#memSearch').on('click', function () {
      partnerSearchPagingInfo.pageNo = 1;
      partnerEventData.openPartnerSearch();
    });
  });
</script>

<script type="text/x-handlebars-template" id="tmp-partner-list">
    <div class="dataTables_paginate paging_full_numbers" id="partner-top"></div>
    <table id="partner-table" class="table table-sorting table-hover table-bordered">
        <colgroup>
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
            <th>No.</th>
            <th>파트너DJ<br>횟수</th>
            <th>프로필</th>
            <th>회원번호</th>
            <th>User닉네임</th>
            <th>성별</th>
            <th>이름</th>
            <th>연락처</th>
            <th>이번달 방송 시간</th>
            <th>이번달 받은 별</th>
            <th>이번달 받은 좋아요</th>
            <th>등록일자</th>
            <th>등록자</th>
            <th>혜택</th>
            <th>관리</th>
        </tr>
        </thead>
        <tbody id="partner-body">
        {{#each this as |data|}}
        <tr>
            <td>{{index_no}}</td>
            <td>{{addComma partnerdj_badge}}</td>
            <td style="width: 65px;height:65px;">
                <img class="thumbnail" src="{{renderProfileImage image_profile mem_sex}}"
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
            <td>{{timeStampDay partner_dj_play_cnt}}</td>
            <td>{{addComma partner_dj_rcv_byeol_cnt}}</td>
            <td>{{addComma partner_dj_rcv_like_cnt}}</td>
            <td>{{ins_date}}</td>
            <td>{{chrgr_name}}</td>
            <td>{{partner_benefit}}</td>
            <td>
                {{#dalbit_if ins_date '!=' ''}}
                <button type="button" class="btn btn-xs btn-primary"
                        onclick="partnerEventData.openPartnerSearch('{{mem_no}}')">수정
                </button>
                <button type="button" class="btn btn-xs btn-danger"
                        onclick="partnerEventData.deletePartner('{{mem_no}}')">삭제
                </button>
                {{/dalbit_if}}
                {{#dalbit_if ins_date '==' ''}}
                [취소]
                {{/dalbit_if}}
            </td>
        </tr>
        {{else}}
        <tr>
            <td colspan="15">{{isEmptyData}}</td>
        </tr>
        {{/each}}
        </tbody>
    </table>
    <div class="dataTables_paginate paging_full_numbers" id="partner-bottom"></div>
</script>

<script type="text/x-handlebars-template" id="tmp-partner-search-list">
    <div class="dataTables_paginate paging_full_numbers" id="partner-search-top"></div>
    <table id="playmaker-team-members-table" class="table table-sorting table-hover table-bordered">
        <colgroup>
            <col width="60px"/>
            <col width="auto"/>
            <col width="auto"/>
            <col width="auto"/>
            <col width="auto"/>
            <col width="auto"/>
        </colgroup>
        <thead>
        <tr>
            <th>UserID</th>
            <th>닉네임</th>
            <th>연락처</th>
            <th>혜택</th>
            <th>관리</th>
        </tr>
        </thead>
        <tbody id="partner-search-table-body">
        {{#each this as |data|}}
        <tr>
            <td>{{mem_userid}}</td>
            <td>{{mem_nick}}</td>
            <td>{{phoneNumHyphen mem_phone}}</td>
            <td><input type="text" class="form-control" name="benefit" id="benefit-{{mem_no}}"
                       value="{{partner_benefit}}"></td>
            <td><a href="javascript:void(0);" onclick="partnerEventData.createPartner({{json this}})">[등록하기]</a></td>
        </tr>
        {{else}}
        <tr>
            <td colspan="15">{{isEmptyData}}</td>
        </tr>
        {{/each}}
        </tbody>
    </table>
    <div class="dataTables_paginate paging_full_numbers" id="partner-search-bottom"></div>
</script>