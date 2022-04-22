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
                    <div class="tab-pane fade" id="reqManage">
                        <div class="row col-lg-12">
                            <div class="pull-left mt15 ml5">
                                ㆍ 매달 스타 DJ 신청조건을 관리합니다.
                            </div>
                            <div class="top-right pull-right dataTable-div">
                                <button type="button" class="btn btn-danger btn-sm" style="margin-right: 3px;"
                                        onclick="starEventData.createManage();"><i
                                        class="fa fa-plus-circle"></i>추가
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- //tab -->
            <div class="row col-lg-12">
                <div id="result-area"></div>
                <div id="detail-area"></div>
            </div>
        </div> <!-- //container-fluid -->
    </div> <!-- //page-wrapper -->
</div>
<!-- //wrapper-->

<jsp:include page="../../common/util/select_specialList.jsp"/>
<script type="text/javascript" src="/js/util/specialDjUtil.js?${dummyData}"></script>
<script type="text/javascript" src="/js/code/menu/menuCodeList.js?${dummyData}"></script>
<script type="text/javascript" src="/js/code/content/contentCodeList.js?${dummyData}"></script>
<script type="text/javascript">
  let tabSlct = 'star';
  let reqDetail = null;
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
        req_idx: params.req_idx,
        mem_no: params.mem_no,
        select_year: common.substr($("#startDate").val(), 0, 4),
        select_month: common.substr($("#startDate").val(), 5, 2),
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

    // 스타DJ 상세
    function reqDetail(params) {
      reqDetail = null;
      if (!(params && params.mem_no)) return;
      $('#detail-area').empty();

      var data = {
        idx: params.idx
      };
      util.getAjaxData("detail", "/rest/menu/special/reqDalDetail", data, renderReqDetail);
    }

    function renderReqDetail(id, response, params) {
      response.data.select_year = moment(new Date()).format('YYYY');
      response.data.select_month = moment(new Date()).add('1', 'months').format('MM');

      // 선택정보
      reqDetail = response.data;

      let template, templateScript, context, html;
      template = $('#tmp-req-detail').html();
      templateScript = Handlebars.compile(template);
      context = response.data;
      html = templateScript(context);
      $("#detail-area").html(html);

      if (response.data.state == 2 || response.data.state == 3) {
        $('select[name=reqSelectYear]').attr("disabled", "disabled");
        $('select[name=reqSelectMonth]').attr("disabled", "disabled");
      }
      ui.scrollIntoView('detail-area');
    }

    // 신청 승인거부
    function reqReject() {
      if (!reqDetail) return;
      if (!confirm("승인 거부 하시겠습니까?")) return;
      var data = {
        idx: reqDetail.idx,
        mem_no: reqDetail.mem_no
      };
      util.getAjaxData("ok", "/rest/menu/special/reqReject", data, function () {
        reqList();
      });
    }

    // 신청 승인완료
    function reqOk() {
      if (!reqDetail) return;
      if (!confirm(reqDetail.select_month + '월의 스타 DJ로 등록하시겠습니까?')) return;

      let tDate = reqDetail.select_year + '-' + reqDetail.select_month + '-01';
      let data = {
        tDate: tDate,
        memNo: reqDetail.mem_no
      };
      let apiURL = '/rest/menu/star/create';
      util.getAjaxData("createStar", apiURL, data, function (id, response, params) {
        if (response && response.data !== 1) {
          alert('스타 DJ로 등록할 수 없습니다.');
        }
        reqList();
      }, null, {type: 'POST'});
    }

    // 스타 DJ 신청관리
    function manageList() {
      $('#result-area').empty();
      $('#detail-area').empty();

      let data = {};
      let apiURL = '/rest/menu/special/selectManageList';
      util.getAjaxData("findManageList", apiURL, data, renderManageList, null, {type: 'POST'});
    }

    function renderManageList(id, response, params) {
      let template, templateScript, context, html;
      template = $('#tmp-manage-list').html();
      templateScript = Handlebars.compile(template);
      context = response.data.map(function (item, index) {
        item.req_term = moment(item.req_start_date).format('YYYY.MM.DD') + ' ~<br />' + moment(item.req_end_date).format('YYYY.MM.DD');
        item.condi_term = moment(item.condition_start_date).format('YYYY.MM.DD') + ' ~<br />' + moment(item.condition_end_date).format('YYYY.MM.DD');
        item.condi = item.condition_codeName1 == '' ? '' : item.condition_codeName1 + ' : ' + specialDjUtil.getConditionData(item.condition_code1, item.condition_data1) + '<br />';
        item.condi += item.condition_codeName2 == '' ? '' : item.condition_codeName2 + ' : ' + specialDjUtil.getConditionData(item.condition_code2, item.condition_data2) + '<br />';
        item.condi += item.condition_codeName3 == '' ? '' : item.condition_codeName3 + ' : ' + specialDjUtil.getConditionData(item.condition_code3, item.condition_data3) + '<br />';
        item.condi += item.condition_codeName4 == '' ? '' : item.condition_codeName4 + ' : ' + specialDjUtil.getConditionData(item.condition_code4, item.condition_data4);
        return item;
      });
      html = templateScript(context);
      $("#result-area").html(html);
    }

    // 스타 DJ 신청 검증
    function validationCheck() {
      var round_no = $("#round_no");
      if (common.isEmpty(round_no.val())) {
        alert('기수를 선택해주세요.');
        return false;
      }

      var title = $("#title-manage");
      if (common.isEmpty(title.val())) {
        alert('제목을 입력해주세요.');
        title.focus();
        return false;
      }

      var req_start_date = $("#req_start_date");
      if (common.isEmpty(req_start_date.val())) {
        alert('신청기간 시작일을 선택해주세요.');
        req_start_date.focus();
        return false;
      }

      var req_end_date = $("#req_end_date");
      if (common.isEmpty(req_end_date.val())) {
        alert('신청기간 종료일을 선택해주세요.');
        req_end_date.focus();
        return false;
      }

      var condition_start_date = $("#condition_start_date");
      if (common.isEmpty(condition_start_date.val())) {
        alert('데이터 수집기간 시작일을 선택해주세요.');
        condition_start_date.focus();
        return false;
      }

      var condition_end_date = $("#condition_end_date");
      if (common.isEmpty(condition_end_date.val())) {
        alert('데이터 수집기간 종료일을 선택해주세요.');
        condition_end_date.focus();
        return false;
      }

      var condition_data1 = $("#condition_data1");
      if (common.isEmpty(condition_data1.val())) {
        alert('자격요건을 입력해주세요.');
        condition_data1.focus();
        return false;
      }

      var condition_data2 = $("#condition_data2");
      if (common.isEmpty(condition_data2.val())) {
        alert('자격요건을 입력해주세요.');
        condition_data2.focus();
        return false;
      }

      var condition_data3 = $("#condition_data3");
      if (common.isEmpty(condition_data3.val())) {
        alert('자격요건을 입력해주세요.');
        condition_data3.focus();
        return false;
      }

      var condition_data4 = $("#condition_data4");
      if (common.isEmpty(condition_data4.val())) {
        alert('자격요건을 입력해주세요.');
        condition_data4.focus();
        return false;
      }
      if (0 == $('input[name="is_view"]:radio:checked').length) {
        alert('게시여부를 선택해주세요.');
        return false;
      }

      if (0 == $('input[name="platform"]:radio:checked').length) {
        alert('플랫폼을 선택해주세요.');
        return false;
      }

      var platform = $('input:radio[name="platform"]:checked').val();
      var is_pc = (platform == 0 || platform == 1) ? true : false;
      var is_mobile = (platform == 0 || platform == 2) ? true : false;

      var contentCheck = true;
      $('._manageContent').each(function () {
        var me = $(this);
        var contentType = me.find('.content_type:checked').val();
        if (contentType == 'image') {

          if (is_pc) {
            var imagePcUrl = me.find('.image_pc_url');
            if (common.isEmpty(imagePcUrl.val())) {
              alert('pc 이미지 url을 입력해주세요.');
              imagePcUrl.focus();
              contentCheck = false;
              return false;
            }
          }

          if (is_mobile) {
            var imageMobileUrl = me.find('.image_mobile_url');
            if (common.isEmpty(imageMobileUrl.val())) {
              alert('모바일 이미지 url을 입력해주세요.');
              imageMobileUrl.focus();
              contentCheck = false;
              return false;
            }
          }

        } else if (contentType == 'button') {
          var buttonType = me.find('.button_type:checked');
          if (common.isEmpty(buttonType.val())) {
            alert('버튼타입을 선택해주세요.');
            buttonType.focus();
            contentCheck = false;
            return false;
          }

          var buttonColor = me.find('.button_color');
          if (common.isEmpty(buttonColor.val())) {
            alert('버튼색상을 입력해주세요.');
            buttonColor.focus();
            contentCheck = false;
            return false;
          }

          var buttonName = me.find('.button_name');
          if (common.isEmpty(buttonName.val())) {
            alert('버튼명을 입력해주세요.');
            buttonName.focus();
            contentCheck = false;
            return false;
          }

          var buttonNameColor = me.find('.button_name_color');
          if (common.isEmpty(buttonNameColor.val())) {
            alert('버튼명 색상을 입력해주세요.');
            buttonNameColor.focus();
            contentCheck = false;
            return false;
          }

          if (is_pc) {
            var buttonPcLink = me.find('.button_pc_link');
            if (common.isEmpty(buttonPcLink.val())) {
              alert('pc 링크를 입력해주세요.');
              buttonPcLink.focus();
              contentCheck = false;
              return false;
            }
          }

          if (is_mobile) {
            var buttonMobileLink = me.find('.button_mobile_link');
            if (common.isEmpty(buttonMobileLink.val())) {
              alert('모바일 링크를 입력해주세요.');
              buttonMobileLink.focus();
              contentCheck = false;
              return false;
            }
          }
        }
      });
      return contentCheck;
    }

    // 스타 DJ 신청 등록
    function callCreateManage(mode) {
      if (!validationCheck()) return;
      if (!confirm('저장하시겠습니까?')) return;

      let saveUrl = '/rest/menu/special/updateManageInfo';
      if (mode === 'insert') {
        $('input[type="hidden"][name="select_year"]').val($('#content_select_year').val());
        $('input[type="hidden"][name="select_month"]').val($('#content_select_month').val());
        saveUrl = '/rest/menu/special/insertManageInfo';
      }

      let contentList = [];
      let formData = util.serializeToJson($("#reqManageDetail"))
      formData.contentList = contentList;

      let json = {
        jsonData: JSON.stringify(formData)
      }
      util.getAjaxData(mode, saveUrl, json, function (id, response, params) {
        if (response.result == 'success') {
          alert('스타DJ 신청관리가 저장 되었습니다.');
          manageList();
        }
      });
    }

    // 스타 DJ 신청 등록 화면
    function createManage() {
      $("#detail-area").empty();

      let data = {
        select_year: null,
        select_month: null
      };
      util.getAjaxData("createManage", "/rest/menu/special/selectManageInfo", data, renderManageDetail);
    }

    // 스타 DJ 신청 상세
    function manageDetail(json) {
      $("#detail-area").empty();

      let data = {
        select_year: json.select_year,
        select_month: json.select_month
      };
      util.getAjaxData("manageDetail", "/rest/menu/special/selectManageInfo", data, renderManageDetail);
    }

    // 스타 DJ 신청 코드
    function getCondiName(el, code) {
      if (!code) return "";

      let nameEl = el.find(item => item.cd == code && item.isUse === 1);
      return nameEl.cdNm;
    }

    // 스타 DJ 신청 상세
    function renderManageDetail(id, response, params) {
      if (id === 'createManage') {
        response.data.specialDjManageInfo.condition_code1 = 8;
        response.data.specialDjManageInfo.condition_code2 = 6;
        response.data.specialDjManageInfo.condition_code3 = 3;
        response.data.specialDjManageInfo.condition_code4 = 7;
      }
      response.data.specialDjManageInfo.condition_codeName1 = getCondiName(response.data.specialDjCondition, response.data.specialDjManageInfo.condition_code1);
      response.data.specialDjManageInfo.condition_codeName2 = getCondiName(response.data.specialDjCondition, response.data.specialDjManageInfo.condition_code2);
      response.data.specialDjManageInfo.condition_codeName3 = getCondiName(response.data.specialDjCondition, response.data.specialDjManageInfo.condition_code3);
      response.data.specialDjManageInfo.condition_codeName4 = getCondiName(response.data.specialDjCondition, response.data.specialDjManageInfo.condition_code4);

      let template, templateScript, context, html;
      template = $('#tmp_manage_detail').html();
      templateScript = Handlebars.compile(template);
      context = response.data;
      html = templateScript(context);
      $("#detail-area").html(html);
      ui.scrollIntoView('detail-area');
      calendarInit();
    }

    function calendarInit() {
      $('#req_start_date').datepicker();
      $('#req_end_date').datepicker();
      $('#condition_start_date').datepicker();
      $('#condition_end_date').datepicker();
    }

    // 스타DJ 가산점 점수 수정
    function modifyPoint(json) {
      if (!(json && json.memNo && json.scoreCnt !== 0)) return;
      if (!confirm('가산점을 등록하시겠습니까?')) return;

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
      if (!confirm(common.substr($("#startDate").val(), 5, 2) + '월의 스타 DJ로 등록하시겠습니까?')) return;

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
      if (!confirm("스타 DJ에서 일반 DJ로 승인 취소하시겠습니까?")) return;

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
      reqDetail: reqDetail,
      reqReject: reqReject,
      reqOk: reqOk,
      manageList: manageList,
      createManage: createManage,
      callCreateManage: callCreateManage,
      manageDetail: manageDetail,
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
      case 'req-top':
      case 'req-bottom':
        starPagingInfo.pageNo = pagingInfo.pageNo;
        starEventData.reqList();
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
    $(document).on('click', '#memSearch', function () {
      showPopMemberList(starEventData.createStar);
    });

    // 가산점
    $(document).on('click', '#req-body .modify-point', function () {
      let $this = $(this);
      let slctIndex = $('#req-body .modify-point').index($this);

      let memNo = $this.data('memno');
      let admin_score_cnt = parseInt($('#req-body .admin_score_cnt').eq(slctIndex).val(), 10);
      $('#req-body .admin_score_cnt').eq(slctIndex).val(admin_score_cnt);
      starEventData.modifyPoint({
        memNo: memNo,
        scoreCnt: admin_score_cnt,
        selectYear: common.substr($("#startDate").val(), 0, 4),
        selectMonth: common.substr($("#startDate").val(), 5, 2)
      });
    });

    // 체크박스 클릭 - 스타DJ 신청상세
    $(document).on('click', '#req-body input[type="checkbox"]', function () {
      $('#detail-area').empty();

      let $this = $(this);
      if ($this.prop('checked')) {
        $('#result-area input[type="checkbox"]').removeAttr('checked');
        $this.prop('checked', true);
        starEventData.reqDetail({
          idx: $this.val(),
          mem_no: $this.data('memno')
        });
      }
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
                        <td>{{select_year}}년 {{select_month}}월</td>
                        <th>관리자 등록 여부</th>
                        <td>
                            {{#equal is_force '0'}}N{{/equal}}
                            {{^equal is_force '0'}}Y{{/equal}}
                        </td>
                    </tr>
                </table>
                <!-- 승인취소-->
                <button type="button" class="btn btn-danger btn-sm mb15" id="bt_reqCancel"
                        onclick="starEventData.removeStar({{mem_no}})">승인취소
                </button>
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
        <tr {{#dalbit_if inner
        '==' 1}} class="_noTr bg-testMember" {{else}} class="_noTr" {{/dalbit_if}} id="row_{{order}}">
        <td>
            <input type="checkbox" value="{{idx}}" data-memno="{{mem_no}}"/>
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
                <input type="number" name="admin_score" class="form-control admin_score_cnt" style="width: 80px;"
                       value="{{admin_score_cnt}}">
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

<script type="text/x-handlebars-template" id="tmp-req-detail">
    <div class="widget widget-table">
        <div class="widget-header">
            <h3><i class="fa fa-desktop"></i> 스페셜 DJ 신청 세부사항</h3>
        </div>
        <div class="widget-content mt15">
            <div class="row col-lg-12 form-inline">
                <table class="table table-bordered table-dalbit">
                    <input type="hidden" name="idx" data-idx="{{idx}}"/>
                    <colgroup>
                        <col width="20%"/>
                        <col width="20%"/>
                        <col width="20%"/>
                        <col width="20%"/>
                        <col width="10%"/>
                        <col width="10%"/>
                    </colgroup>
                    <tr>
                        <th>신청일시</th>
                        <td>{{convertToDate reg_date 'YYYY-MM-DD HH:mm:ss'}}</td>
                        <th>승인일시</th>
                        <td>{{convertToDate last_upd_date 'YYYY-MM-DD HH:mm:ss'}}</td>
                    </tr>
                    <tr>
                        <th>이름</th>
                        <td>{{mem_name}}</td>
                        <th>주요방송시간</th>
                        <td>
                            {{broadcast_time1}}<br/>
                            {{broadcast_time2}}
                        </td>
                    </tr>
                    <tr>
                        <th>방송소개</th>
                        <td colspan="3" style="height:200px">
                            <textarea type="textarea" class="form-control" id="title" name="title"
                                      style="width: 100%; height: 100%" disabled>{{title}}</textarea>
                        </td>
                    </tr>
                    <tr>
                        <th>내가 스타 DJ가 된다면?!</th>
                        <td colspan="3" style="height:200px">
                            <textarea type="textarea" class="form-control" id="contents" name="contents"
                                      style="width: 100%; height: 100%" disabled>{{contents}}</textarea>
                        </td>
                    </tr>
                    <colgroup>
                        <col width="25%"/>
                        <col width="25%"/>
                        <col width="25%"/>
                        <col width="25%"/>
                    </colgroup>
                    <tr>
                        <th>스타 DJ 선정 연도</th>
                        <td id="reqSelectYear">{{{getCommonCodeSelect select_year 'special_selectYears' 'Y'
                            'reqSelectYear'}}}
                        </td>
                        <th>선정 월</th>
                        <td id="reqSelectMonth">{{{getCommonCodeSelect select_month 'special_selectMonths' 'Y'
                            'reqSelectMonth'}}}
                        </td>
                    </tr>
                </table>
                <!-- 승인완료 승인거부-->
                {{^equal state '3'}}
                <button type="button" class="btn btn-danger btn-sm pull-right mb15"
                        onclick="starEventData.reqReject();">승인거부
                </button>
                {{/equal}}
                {{^equal state '2'}}
                <button type="button" class="btn btn-success btn-sm pull-right mb15 mr10"
                        onclick="starEventData.reqOk();">승인완료
                </button>
                {{/equal}}
            </div>
        </div>
    </div>
</script>

<script type="text/x-handlebars-template" id="tmp-manage-list">
    <table id="manage-table" class="table table-sorting table-hover table-bordered">
        <colgroup>
            <col width="60px"/>
            <col width="60px"/>
            <col width="60px"/>
            <col width="210px"/>
            <col width="90px"/>
            <col width="90px"/>
            <col width="auto"/>
            <col width="90px"/>
            <col width="90px"/>
            <col width="90px"/>
            <col width="90px"/>
        </colgroup>
        <thead>
        <tr>
            <th>년</th>
            <th>월</th>
            <th>기수</th>
            <th>제목</th>
            <th>신청기간</th>
            <th>데이터<br>수집기간</th>
            <th>스타DJ 지원요건</th>
            <th>등록일</th>
            <th>등록자</th>
            <th>수정일</th>
            <th>수정자</th>
        </tr>
        </thead>
        <tbody id="manage-body">
        {{#each this as |data|}}
        <tr {{#dalbit_if inner
        '==' 1}} class="_noTr bg-testMember" {{else}} class="_noTr" {{/dalbit_if}} id="row_{{order}}">
        <td>{{select_year}}</td>
        <td>{{select_month}}</td>
        <td>{{round_no}}</td>
        <td><a href="javascript:void(0);" onclick="starEventData.manageDetail({{json data}});">{{title}}</a></td>
        <td>{{{req_term}}}</td>
        <td>{{{condi_term}}}</td>
        <td>{{{condi}}}</td>
        <td>{{reg_date}}</td>
        <td>{{op_name}}</td>
        <td>{{last_upd_date}}</td>
        <td>{{last_op_name}}</td>
        </tr>
        {{else}}
        <tr>
            <td colspan="11">{{isEmptyData}}</td>
        </tr>
        {{/each}}
        </tbody>
    </table>
</script>

<script type="text/x-handlebars-template" id="tmp_manage_detail">
    <form id="reqManageDetail">
        <div class="widget widget-table">
            <div class="widget-header">
                <h3><i class="fa fa-desktop"></i> 스타 DJ 신청 관리</h3>
            </div>
            <div class="widget-content mt15">
                <div class="row col-lg-12 form-inline">
                    <table class="table table-bordered table-dalbit">
                        <input type="hidden" name="idx" value="{{this.idx}}"/>
                        <colgroup>
                            <col width="15%"/>
                            <col width="35%"/>
                            <col width="15%"/>
                            <col width="35%"/>
                        </colgroup>
                        <tr>
                            <th>선정기간</th>
                            <td>
                                {{#equal this.specialDjManageInfo.select_year ''}}
                                {{{getCommonCodeSelect '2020' 'special_selectYears' 'N' 'content_select_year'}}}
                                {{{getCommonCodeSelect '08' 'special_selectMonths' 'N' 'content_select_month'}}}
                                {{else}}
                                {{../this.specialDjManageInfo.select_year}}년
                                {{../this.specialDjManageInfo.select_month}}월
                                {{/equal}}
                                <input type="hidden" name="select_year" id="select_year"
                                       value="{{this.specialDjManageInfo.select_year}}"/>
                                <input type="hidden" name="select_month" id="select_month"
                                       value="{{this.specialDjManageInfo.select_month}}"/>
                            </td>

                            <th>기수</th>
                            <td>
                                <input type="text" class="form-control" style="width:100px;" id="round_no"
                                       name="round_no"
                                       value="{{this.specialDjManageInfo.round_no}}"/>
                            </td>
                        </tr>
                        <tr>
                            <th>제목</th>
                            <td>
                                <input type="text" class="form-control" style="width:100%" id="title-manage"
                                       name="title"
                                       value="{{this.specialDjManageInfo.title}}"/>
                            </td>

                            <th>공지사항 번호</th>
                            <td>
                                <input type="text" class="form-control" style="width:100px;" id="notice_idx"
                                       name="notice_idx" value="{{this.specialDjManageInfo.notice_idx}}"/>
                            </td>
                        </tr>
                        <tr>
                            <th>신청 기간</th>
                            <td>
                                <div class="form-inline">
                                    <div class="input-group date">
                                        <span class="input-group-addon" id="view-iconStartDate"><i
                                                class="fa fa-calendar"></i></span>
                                        <input type="text" class="form-control" name="req_start_date"
                                               id="req_start_date"
                                               style="width:100px; background:white;" readonly=""
                                               value="{{this.specialDjManageInfo.req_start_date}}"/>
                                    </div>
                                    <span> ~ </span>
                                    <div class="input-group date">
                                        <span class="input-group-addon" id="view-iconEndDate"><i
                                                class="fa fa-calendar"></i></span>
                                        <input type="text" class="form-control" name="req_end_date" id="req_end_date"
                                               style="width:100px; background:white;" readonly=""
                                               value="{{this.specialDjManageInfo.req_end_date}}"/>
                                    </div>
                                </div>
                            </td>
                            <th>데이터 수집 기간</th>
                            <td>
                                <div class="form-inline">
                                    <div class="input-group date">
                                        <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                        <input type="text" class="form-control" name="condition_start_date"
                                               id="condition_start_date" style="width:100px; background:white;"
                                               readonly=""
                                               value="{{this.specialDjManageInfo.condition_start_date}}">
                                    </div>
                                    <span> ~ </span>
                                    <div class="input-group date">
                                        <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                        <input type="text" class="form-control" name="condition_end_date"
                                               id="condition_end_date" style="width:100px; background:white;"
                                               readonly=""
                                               value="{{this.specialDjManageInfo.condition_end_date}}">
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4"></td>
                        </tr>
                        <tr>
                            <th>{{this.specialDjManageInfo.condition_codeName1}}</th>
                            <td>
                                <input type="hidden" id="condition_code1" name="condition_code1"
                                       value="{{this.specialDjManageInfo.condition_code1}}"/>
                                <input type="text" class="form-control" id="condition_data1" name="condition_data1"
                                       value="{{this.specialDjManageInfo.condition_data1}}"/>
                            </td>
                            <th>{{this.specialDjManageInfo.condition_codeName2}}</th>
                            <td>
                                <input type="hidden" id="condition_code2" name="condition_code2"
                                       value="{{this.specialDjManageInfo.condition_code2}}"/>
                                <input type="text" class="form-control" id="condition_data2" name="condition_data2"
                                       value="{{this.specialDjManageInfo.condition_data2}}"/>
                            </td>
                        </tr>
                        <tr>
                            <th>{{this.specialDjManageInfo.condition_codeName3}}</th>
                            <td>
                                <input type="hidden" id="condition_code3" name="condition_code3"
                                       value="{{this.specialDjManageInfo.condition_code3}}"/>
                                <input type="text" class="form-control" id="condition_data3" name="condition_data3"
                                       value="{{this.specialDjManageInfo.condition_data3}}"/>
                            </td>
                            <th>{{this.specialDjManageInfo.condition_codeName4}}</th>
                            <td>
                                <input type="hidden" id="condition_code4" name="condition_code4"
                                       value="{{this.specialDjManageInfo.condition_code4}}"/>
                                <input type="text" class="form-control" id="condition_data4" name="condition_data4"
                                       value="{{this.specialDjManageInfo.condition_data4}}"/>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4"></td>
                        </tr>
                        <tr>
                            <th>게시여부</th>
                            <td>{{{getCommonCodeRadio this.specialDjManageInfo.is_view 'content_viewOn' null
                                'is_view'}}}
                            </td>
                            <th>플랫폼</th>
                            <td>{{{getCommonCodeRadio this.specialDjManageInfo.platform 'content_platform4' null
                                'platform'}}}
                            </td>
                        </tr>
                        {{#if this.specialDjManageInfo.op_name}}
                        <tr>
                            <th>등록자</th>
                            <td>{{this.specialDjManageInfo.op_name}}</td>
                            <th>등록일</th>
                            <td>{{this.specialDjManageInfo.reg_date}}</td>
                        </tr>
                        {{/if}}
                        {{#if this.specialDjManageInfo.last_op_name}}
                        <tr>
                            <th>수정자</th>
                            <td>{{this.specialDjManageInfo.last_op_name}}</td>
                            <th>수정일</th>
                            <td>{{this.specialDjManageInfo.last_upd_date}}</td>
                        </tr>
                        {{/if}}
                    </table>

                    {{#each this.specialDjManageInfo.contentList as |item|}}
                    <table class="table table-bordered table-dalbit _manageContent">
                        <colgroup>
                            <col width="10%"/>
                            <col width="40%"/>
                            <col width="10%"/>
                            <col width="40%"/>
                        </colgroup>
                        <tr>
                            <th>컨텐츠 타입</th>
                            <td>
                                {{{getCommonCodeRadioMulti item.content_type 'special_manage_contentType' 'Y' null
                                @index}}}
                            </td>
                            <th>순서변경</th>
                            <td>
                                <button type="button" class="btn btn-info _down"><i
                                        class="toggle-icon fa fa-angle-down"></i></button>
                                <button type="button" class="btn btn-danger _up"><i
                                        class="toggle-icon fa fa-angle-up"></i>
                                </button>

                                <button type="button" class="btn btn-default btn-sm pull-right _delete"><i
                                        class="toggle-icon fa fa-delete"></i><i class="fa fa-trash-o"></i>삭제
                                </button>
                            </td>
                        </tr>
                        <!-- 이미지 영역 start -->
                        <tr style="{{#equal item.content_type 'button'}}display:none;{{/equal}}" class="_tr_imageArea">
                            <th>pc 이미지</th>
                            <td colspan="2">
                                <input type="text" class="form-control image_pc_url" style="width:80%"
                                       value="{{item.image_pc_url}}"/>
                                <button type="button" class="previewImage">미리보기</button>
                            </td>
                            <td>
                                <img src="{{item.image_pc_url}}" height="70px" class="thumbnail fullSize_background"/>
                            </td>
                        </tr>

                        <tr style="{{#equal item.content_type 'button'}}display:none;{{/equal}}" class="_tr_imageArea">
                            <th>모바일 이미지</th>
                            <td colspan="2">
                                <input type="text" class="form-control image_mobile_url" style="width:80%"
                                       value="{{item.image_mobile_url}}"/>
                                <button type="button" class="previewImage">미리보기</button>
                            </td>
                            <td id="mobileImgPrevTd">
                                <img src="{{item.image_mobile_url}}" height="70px"
                                     class="thumbnail fullSize_background"/>
                            </td>
                        </tr>
                        <!-- 이미지 영역 end -->

                        <!-- 버튼 영역 start -->
                        <tr style="{{#equal item.content_type 'image'}}display:none;{{/equal}}" class="_tr_buttonArea">
                            <th>버튼 타입</th>
                            <td>
                                {{{getCommonCodeRadioMulti item.button_type 'special_manage_content_button_type' 'Y'
                                null
                                @index}}}
                            </td>
                            <th>버튼색상</th>
                            <td>
                                <input type="text" class="form-control button_color" style="width:80%"
                                       value="{{item.button_color}}"/>
                            </td>
                        </tr>
                        <tr style="{{#equal item.content_type 'image'}}display:none;{{/equal}}" class="_tr_buttonArea">
                            <th>버튼명</th>
                            <td>
                                <input type="text" class="form-control button_name" style="width:80%"
                                       value="{{item.button_name}}"/>
                            </td>
                            <th>버튼명 색상</th>
                            <td>
                                <input type="text" class="form-control button_name_color" style="width:80%"
                                       value="{{item.button_name_color}}"/>
                            </td>
                        </tr>
                        <tr style="{{#equal item.content_type 'image'}}display:none;{{/equal}}" class="_tr_buttonArea">
                            <th>PC 링크</th>
                            <td>
                                <input type="text" class="form-control button_pc_link" style="width:80%"
                                       value="{{item.button_pc_link}}"/>
                            </td>
                            <th>모바일 링크</th>
                            <td>
                                <input type="text" class="form-control button_mobile_link" style="width:80%"
                                       value="{{item.button_mobile_link}}"/>
                            </td>
                        </tr>
                        <!-- 버튼 영역 end -->
                    </table>
                    {{/each}}

                    {{#equal this.specialDjManageInfo.select_year ''}}
                    <button type="button" class="btn btn-success btn-sm pull-right mb15 mr10"
                            onclick="starEventData.callCreateManage('insert');">
                        <i class="fa fa-floppy-o"></i>저장
                    </button>
                    {{else}}
                    <button type="button" class="btn btn-success btn-sm pull-right mb15 mr10"
                            onclick="starEventData.callCreateManage('update');">
                        <i class="fa fa-floppy-o"></i>저장
                    </button>
                    {{/equal}}
                </div>
            </div>
        </div>
    </form>
</script>
