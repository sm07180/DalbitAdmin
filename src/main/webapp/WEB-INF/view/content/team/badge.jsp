<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dummyData"><%= java.lang.Math.round(java.lang.Math.random() * 1000000) %></c:set>

<style>
    .parts-images {
        width: 150px;
        height: 150px;
    }

    .parts-images img {
        width: 100%;
        height: 100%;
        object-fit: contain
    }
</style>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="clearfix widget-content mb5">
                <h4 class="font-bold">팀현황</h4>

                <div class="mb10">
                    <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist">
                        <li>
                            <a href="/content/team/list">전체 팀</a>
                        </li>
                        <li>
                            <a href="/content/team/stat">월간 현황</a>
                        </li>
                        <li>
                            <a href="/content/team/symbol">팀 심볼 관리</a>
                        </li>
                        <li class="active">
                            <a href="/content/team/badge">활동배지 관리</a>
                        </li>
                    </ul>
                </div>

                <div class="mb10">
                    <div class="row mb10">
                        <div class="col-sm-3">
                            * 활동배지 등록/삭제시 DB요청
                        </div>
                        <div class="col-sm-9 text-right">
                            내용수정 변경 후 반드시 적용 버튼을 눌러주세요.
                            <button type="button" class="btn btn-default" onclick="badgeEventData.badgeReload();">취소</button>
                            <button type="button" class="btn btn-success" onclick="badgeEventData.callBadgeUpdate();">적용</button>
                        </div>
                    </div>
                    <div id="resultArea"></div>
                </div>
            </div>
        </div> <!-- //container-fluid -->
    </div>
    <!-- //page-wrapper -->
</div>
<!-- //wrapper-->

<script>
  let badgeList = []; // 배지목록 데이터
  const badgePagingInfo = new PAGING_INFO(0, 1, 50);
  const badgeEventData = (function () {
    // 배지 목록 갱신
    function callBadgeUpdate() {
      if (badgeList.length === 0) {
        alert('적용할 정보가 없습니다.');
        return;
      }

      if(!confirm('정말 적용하시겠습니까?')) return;

      let apiURL = '/rest/content/team/badge-update';
      util.getAjaxData("modifyBadge", apiURL, JSON.stringify(badgeList), function (id, response, params) {
        badgeReload();
      }, null, {type: 'POST', contentType: 'application/json'});
    }

    // 배지 목록
    function callList() {
      $('#resultArea').empty();
      let data = {
        ordSlct: '',
        pageNo: badgePagingInfo.pageNo,
        pagePerCnt: badgePagingInfo.pageCnt
      };
      let apiURL = '/rest/content/team/badges';
      util.getAjaxData("getBadgesList", apiURL, data, renderBadgeList, null, {type: 'GET'});
    }

    function renderBadgeList(id, response, params) {
      badgeList = []; // 배지목록 데이터 초기화
      let template, templateScript, context, html;
      template = $('#tmp-dalla-badge-list').html();
      templateScript = Handlebars.compile(template);
      context = response.listData.map(function (item, index) {
        item.index_no = response.totalCnt - (((badgePagingInfo.pageNo - 1) * badgePagingInfo.pageCnt) + index);
        badgeList.push({
          autoNo: item.auto_no,
          bgCode: item.bg_code,
          bgName: item.bg_name,
          bgConts: item.bg_conts,
          bgColorUrl: item.bg_color_url,
          bgBlackUrl: item.bg_black_url,
          bgBonus: item.bg_bonus,
          useYn: item.use_yn
        });
        return item;
      });
      html = templateScript(context);
      $("#resultArea").html(html);

      badgePagingInfo.totalCnt = response.totalCnt;
      util.renderPagingNavigation('dalla-badge-top', badgePagingInfo);
      util.renderPagingNavigation('dalla-badge-bottom', badgePagingInfo);

      if (response.listData.length === 0) {
        $('#dalla-badge-top').hide();
        $('#dalla-badge-bottom').hide();
      } else {
        $('#dalla-badge-top').show();
        $('#dalla-badge-bottom').show();
      }
    }

    function badgeSearch() {
      badgePagingInfo.pageNo = 1;
      callList();
    }

    function badgeReload() {
      callList();
    }

    // 이미지 미리보기
    function previewImage(slctId, previewId) {
      let bgUrl = $.trim($('#' + slctId).val());
      if (bgUrl === '') {
        alert('이미지 주소를 입력하세요.');
        $('#' + slctId).focus();
        return;
      }
      $('#' + previewId).html('<img src="' + bgUrl + '">');
    }

    return {
      callList: callList,
      callBadgeUpdate: callBadgeUpdate,
      badgeReload: badgeReload,
      badgeSearch: badgeSearch,
      previewImage: previewImage
    }
  }());

  badgeEventData.badgeSearch();

  $(document).ready(function () {
    // color-url 변경시
    $(document).on('change', '.color-urls input[type="text"]', function() {
      let $this = $(this);
      let id = $this.attr('id');
      let index = parseInt(id.split('-')[1], 10);
      badgeList[index].bgColorUrl = $.trim($this.val());
    });

    // gray-url 변경시
    $(document).on('change', '.gray-urls input[type="text"]', function() {
      let $this = $(this);
      let id = $this.attr('id');
      let index = parseInt(id.split('-')[1], 10);
      badgeList[index].bgBlackUrl = $.trim($this.val());
    });

    // 이름
    $(document).on('change', '.bg-names input[type="text"]', function() {
      let $this = $(this);
      let id = $this.attr('id');
      let index = parseInt(id.split('-')[1], 10);
      badgeList[index].bgName = $.trim($this.val());
    });

    // 설명
    $(document).on('change', '.bg-conts input[type="text"]', function() {
      let $this = $(this);
      let id = $this.attr('id');
      let index = parseInt(id.split('-')[1], 10);
      badgeList[index].bgConts = $.trim($this.val());
    });

    // 보너스
    $(document).on('change', '.bg-bonus input[type="text"]', function() {
      let $this = $(this);
      let id = $this.attr('id');
      let index = parseInt(id.split('-')[1], 10);
      badgeList[index].bgBonus = $.trim($this.val());
    });
  });
</script>

<script type="text/x-handlebars-template" id="tmp-dalla-badge-list">
    <div class="dataTables_paginate paging_full_numbers" id="dalla-badge-top"></div>
    <table id="dalla-badge-table" class="table table-sorting table-hover table-bordered">
        <colgroup>
            <col width="60px"/>
            <col width="100px"/>
            <col width="150px"/>
            <col width="300px"/>
            <col width="200px"/>
            <col width="auto"/>
            <col width="100px"/>
            <col width="100px"/>
        </colgroup>
        <thead>
        <tr>
            <th>No.</th>
            <th>코드</th>
            <th>배지</th>
            <th>URL</th>
            <th>이름</th>
            <th>배지설명</th>
            <th>보너스경험치</th>
            <th>획득한 팀수</th>
        </tr>
        </thead>
        <tbody id="dalla-badge-table-body">
        {{#each this as |data|}}
        <tr>
            <td>{{index_no}}</td>
            <td>{{bg_code}}</td>
            <td>
                <div id="partsImg-{{@key}}" class="parts-images">
                    <img src="{{bg_color_url}}" />
                </div>
            </td>
            <td style="padding: 5px 0">
                <div class="color-urls form-inline mb5">
                    컬러
                    <input type="text" name="colorUrl" id="colorUrl-{{@key}}" class="form-control" value="{{bg_color_url}}">
                    <button type="button" class="btn btn-sm btn-default" onclick="badgeEventData.previewImage('colorUrl-{{@key}}', 'partsImg-{{@key}}');">미리보기</button>
                </div>
                <div class="gray-urls form-inline">
                    흑백
                    <input type="text" name="grayUrl" id="grayUrl-{{@key}}" class="form-control" value="{{bg_black_url}}">
                    <button type="button" class="btn btn-sm btn-default" onclick="badgeEventData.previewImage('grayUrl-{{@key}}', 'partsImg-{{@key}}');">미리보기</button>
                </div>
            </td>
            <td class="bg-names">
                <input type="text" name="bgName" id=bgName-{{@key}}" class="form-control" value="{{bg_name}}">
            </td>
            <td class="bg-conts">
                <input type="text" name="bgConts" id="bgConts-{{@key}}" class="form-control" value="{{bg_conts}}">
            </td>
            <td class="bg-bonus">
                <input type="text" name="bgBonus" id="bgBonus-{{@key}}" class="form-control" value="{{bg_bonus}}">
            </td>
            <td>{{addComma bg_cnt}}</td>
        </tr>
        {{else}}
        <tr>
            <td colspan="8">{{isEmptyData}}</td>
        </tr>
        {{/each}}
        </tbody>
    </table>
    <div class="dataTables_paginate paging_full_numbers" id="dalla-badge-bottom"></div>
</script>