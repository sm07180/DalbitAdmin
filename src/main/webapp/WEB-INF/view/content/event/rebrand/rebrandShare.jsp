<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form id="rebrand-share" class="searchForm mb5" onsubmit="return false;">
    <div class="widget widget-table">
        <table>
            <tr>
                <th style="background-color:#4472c4;color:#e9ee17;width: 70px">
                    <i class="fa fa-search"></i><br/>검색
                </th>
                <td>
                    <div class="form-inline">
                        <select name="slct" class="form-control searchType">
                            <option value="1" selected="selected">회원 번호</option>
                            <option value="5">아이디</option>
                            <option value="3">회원 닉네임</option>
                            <option value="4">연락처</option>
                        </select>
                        <label><input type="text" class="form-control" name="searchVal" placeholder="검색어 입력"></label>
                        <button type="button" class="btn btn-success">검색</button>
                    </div>
                </td>
            </tr>
        </table>
    </div>
</form>

<div class="col-lg-12 no-padding mt10 mb10">
    <div class="widget-content">
        <div id="share-list"></div>
    </div>
</div>

<script>
  let $shareRoot = null;
  const shareSearch = {
    slct: 1,
    searchData: ''
  }
  const sharePagingInfo = new PAGING_INFO(0, 1, 50);
  const shareEventData = (function () {
    function callList() {
      let data = {
        slct: shareSearch.slct,
        searchData: shareSearch.searchData,
        pageNo: sharePagingInfo.pageNo,
        pagePerCnt: sharePagingInfo.pageCnt
      };
      let apiURL = '/rest/content/event/rebrand/shares';
      util.getAjaxData("shareEventList", apiURL, data, function (id, response, params) {
        renderList(id, response, params);
      }, null, {type: 'GET'});
    }

    // 목록 그리기
    function renderList(id, response, params) {
      let template, templateScript, context, html;
      template = $('#tmp-share-list').html();
      templateScript = Handlebars.compile(template);
      context = response.listData.map(function (item, index) {
        item.index_no = response.totalCnt - (((sharePagingInfo.pageNo - 1) * sharePagingInfo.pageCnt) + index);
        return item;
      });
      html = templateScript(context);
      $("#share-list").html(html);

      sharePagingInfo.totalCnt = response.totalCnt;
      util.renderPagingNavigation('share-paginate-top', sharePagingInfo);
      util.renderPagingNavigation('share-paginate-bottom', sharePagingInfo);

      if (response.listData.length === 0) {
        $('#share-paginate-top').hide();
        $('#share-paginate-bottom').hide();
      } else {
        $('#share-paginate-top').show();
        $('#share-paginate-bottom').show();
      }
    }

    function intSearchForm() {
      shareSearch.slct = 1;
      shareSearch.searchData = '';

      $shareRoot.find('select[name="slct"]').val(shareSearch.slct);
      $shareRoot.find('input[name="searchVal"]').val(shareSearch.searchData);
    }

    return {
      intSearchForm,
      callList
    }
  }());

  // 댓글이벤트 클릭시 목록 초기화
  function initShareEvent() {
    shareEventData.intSearchForm();
    shareEventData.callList();
  }

  $(document).ready(function () {
    $shareRoot = $('#rebrand-share');

    $shareRoot.find('select[name="slct"]').on('change', function () {
      shareSearch.slct = this.value;
    });
    $shareRoot.find('input[name="searchVal"]').on('change paste keyup', function () {
      shareSearch.searchData = this.value;
    });
    $shareRoot.find('input[name="searchVal"]').on('keypress', function (e) {
      var keycode = e.keyCode ? e.keyCode : e.which;
      if(keycode == '13'){
        sharePagingInfo.pageNo = 1;
        shareEventData.callList();
      }
      e.stopPropagation();
    });
    $shareRoot.find('button[type="button"]').on('click', function () {
      sharePagingInfo.pageNo = 1;
      shareEventData.callList();
    });
  });
</script>

<script type="text/x-handlebars-template" id="tmp-share-list">
    <div class="dataTables_paginate paging_full_numbers" id="share-paginate-top"></div>
    <table id="share-table" class="table table-sorting table-hover table-bordered">
        <colgroup>
            <col width="60px"/>
            <col width="120px"/>
            <col width="200px"/>
            <col width="120px"/>
            <col width="150px"/>
            <col width="120px"/>
            <col width="auto"/>
            <col width="150px"/>
        </colgroup>
        <thead>
        <tr>
            <th>No.</th>
            <th>회원번호</th>
            <th>아이디</th>
            <th>연락처</th>
            <th>닉네임</th>
            <th>성별(나이)</th>
            <th>인증URL</th>
            <th>등록일시</th>
        </tr>
        </thead>
        <tbody id="share-table-body">
        {{#each this as |data|}}
        <tr>
            <td>{{index_no}}</td>
            <td>{{{memNoLink tail_mem_no tail_mem_no}}}</td>
            <td>{{tail_mem_id}}</td>
            <td>{{phoneNumHyphen ptr_mem_phone}}</td>
            <td>{{mem_nick}}</td>
            <td>
                {{#dalbit_if tail_mem_sex '==' 'm'}}
                <label class="font-bold" style="color: blue;margin-bottom: 0px"><i class="fa fa-male"></i> 남성</label>
                {{/dalbit_if}}
                {{#dalbit_if tail_mem_sex '==' 'f'}}
                <label class="font-bold" style="color: red;margin-bottom: 0px"><i class="fa fa-female"></i> 여성</label>
                {{/dalbit_if}}
                {{#dalbit_if tail_mem_sex '==' ''}}
                <label class="font-bold" style="margin-bottom: 0px;">미선택</label>
                {{/dalbit_if}}
                ({{ptr_mem_age}}세)
            </td>
            <td><div style="word-break: break-all; word-wrap: break-word; padding: 5px; text-align: left">{{tail_conts}}</div></td>
            <td>{{ins_date}}</td>
        </tr>
        {{else}}
        <tr>
            <td colspan="8">{{isEmptyData}}</td>
        </tr>
        {{/each}}
        </tbody>
    </table>
    <div class="dataTables_paginate paging_full_numbers" id="share-paginate-bottom"></div>
</script>
