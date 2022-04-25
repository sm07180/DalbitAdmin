<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dummyData"><%= java.lang.Math.round(java.lang.Math.random() * 1000000) %>
</c:set>

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
                        <li class="active">
                            <a href="/content/team/symbol">팀 심볼 관리</a>
                        </li>
                        <li>
                            <a href="/content/team/badge">활동배지 관리</a>
                        </li>
                    </ul>
                </div>

                <div class="mb10">
                    <div class="mb10">
                        <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist" id="tabSlct">
                            <li class="active">
                                <a href="#symbol-medal" role="tab" data-toggle="tab" data-item="m">메달</a>
                            </li>
                            <li>
                                <a href="#symbol-edge" role="tab" data-toggle="tab" data-item="e">테두리</a>
                            </li>
                            <li>
                                <a href="#symbol-background" role="tab" data-toggle="tab" data-item="b">배경</a>
                            </li>
                        </ul>
                    </div>
                    <div class="mb10">
                        <span>* 코드가 낮은 순으로 팀 생성 시 선택목록에서 정렬됩니다.</span>
                        <div class="row mb10">
                            <div class="col-sm-3">
                                <button type="button" class="btn btn-primary"
                                        onclick="symbolEventData.openModalSymbolEdit();">등록
                                </button>
                            </div>
                            <div class="col-sm-9 text-right">
                                내용수정, 노출여부 변경 후 반드시 적용 버튼을 눌러주세요.
                                <button type="button" class="btn btn-default" onclick="symbolEventData.symbolReload();">취소</button>
                                <button type="button" class="btn btn-success" onclick="symbolEventData.callSymbolUpdate();">적용</button>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12 text-right">
                                <div class="form-inline">
                                    <select id="ordSlct" name="ordSlct" class="form-control">
                                        <option value="f">선호도순</option>
                                        <option value="c">코드순</option>
                                        <option value="i">갱신일순</option>
                                    </select>
                                </div>
                            </div>
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

<div class="modal fade" id="modalSymbolEdit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <div class="row">
                    <div class="col-sm-6">
                        <h5 class="modal-title font-bold">심볼등록 (<span id="symbolType"></span>)</h5>
                    </div>
                    <div class="col-sm-6">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                </div>
            </div>
            <div class="modal-body">
                <div class="row">
                    <input type="hidden" name="useYn" id="useYn" value="n">
                    <table class="table table-bordered mb0">
                        <colgroup>
                            <col width="30%">
                            <col width="70%">
                        </colgroup>
                        <tbody>
                        <tr>
                            <th>코드</th>
                            <td>
                                <input type="text" name="bgCode" id="bgCode" class="form-control">
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <table class="table table-bordered mb0">
                        <colgroup>
                            <col width="30%">
                            <col width="70%">
                        </colgroup>
                        <thead>
                        <tr>
                            <th>파츠</th>
                            <th>URL</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr style="height: 150px">
                            <td>
                                <div id="partsImg" class="parts-images"></div>
                            </td>
                            <td>
                                <div class="form-inline">
                                    <input type="text" name="bgUrl" id="bgUrl" class="form-control">
                                    <button type="button" class="btn btn-sm btn-default"
                                            onclick="symbolEventData.previewImage('bgUrl', 'partsImg');">미리보기
                                    </button>
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-sm btn-default" data-dismiss="modal" aria-hidden="true">취소</button>
                <button type="button" class="btn btn-sm btn-primary" onclick="symbolEventData.callSymbolReg();">등록
                </button>
            </div>
        </div>
    </div>
</div>

<script>
  let symbolType = {
    m: '메달',
    e: '테두리',
    b: '배경'
  }
  let symbolSlct = 'm';
  let symbolList = []; // 심볼목록 데이터
  const symbolPagingInfo = new PAGING_INFO(0, 1, 50);
  const symbolEventData = (function () {
    function callList() {
      $('#resultArea').empty();
      let data = {
        symbolSlct: symbolSlct,
        ordSlct: $('#ordSlct').val(),
        pageNo: symbolPagingInfo.pageNo,
        pagePerCnt: symbolPagingInfo.pageCnt
      };
      let apiURL = '/rest/content/team/symbols';
      util.getAjaxData("getSymbolList", apiURL, data, renderSymbolList, null, {type: 'GET'});
    }

    function renderSymbolList(id, response, params) {
      symbolList = []; // 심볼목록 데이터 초기화
      let template, templateScript, context, html;
      template = $('#tmp-dalla-symbol-list').html();
      templateScript = Handlebars.compile(template);
      context = response.listData.map(function (item, index) {
        item.index_no = response.totalCnt - (((symbolPagingInfo.pageNo - 1) * symbolPagingInfo.pageCnt) + index);
        item.useYnKey = 'userYn-' + index;
        item.useYnValue = item.use_yn === 'y' ? 1 : 0;
        symbolList.push({
          autoNo: item.auto_no,
          symbolSlct: symbolSlct,
          bgCode: item.bg_code,
          bgName: item.bg_name,
          bgConts: item.bg_conts,
          bgUrl: item.bg_url,
          useYn: item.use_yn
        });
        return item;
      });
      html = templateScript(context);
      $("#resultArea").html(html);

      symbolPagingInfo.totalCnt = response.totalCnt;
      util.renderPagingNavigation('dalla-symbol-top', symbolPagingInfo);
      util.renderPagingNavigation('dalla-symbol-bottom', symbolPagingInfo);

      if (response.listData.length === 0) {
        $('#dalla-symbol-top').hide();
        $('#dalla-symbol-bottom').hide();
      } else {
        $('#dalla-symbol-top').show();
        $('#dalla-symbol-bottom').show();
      }
    }

    function symbolSearch() {
      symbolPagingInfo.pageNo = 1;
      callList();
    }

    function symbolReload() {
      callList();
    }

    // 심볼등록 모달 열기
    function openModalSymbolEdit() {
      $('#useYn').val('n');
      $('#bgCode').val('');
      $('#bgUrl').val('');
      $('#symbolType').text(symbolType[symbolSlct]);
      $('#modalSymbolEdit').modal('show');
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

    // 심볼등록
    function callSymbolReg() {
      let bgCode = $.trim($('#bgCode').val());
      let bgUrl = $.trim($('#bgUrl').val());

      let symbolData = {
        symbolSlct: symbolSlct,
        bgCode: bgCode,
        bgName: bgCode,
        bgConts: bgCode,
        bgUrl: bgUrl,
        useYn: $('#useYn').val()
      }

      if (symbolData.bgCode === '') {
        alert('코드를 입력하세요.');
        $('#bgCode').focus();
        return;
      }

      if (!symbolData.bgUrl) {
        alert('이미지 주소를 입력하세요.');
        $('#bgUrl').focus();
        return;
      }

      let apiURL = '/rest/content/team/symbols';
      util.getAjaxData("createSymbol", apiURL, symbolData, function (id, response, params) {
        if (response.s_return == 1) {
          symbolSearch();
        }
        $('#modalSymbolEdit').modal('hide');
      }, null, {type: 'POST'});
    }

    // 심볼 목록 갱신
    function callSymbolUpdate() {
      if (symbolList.length === 0) {
        alert('적용할 정보가 없습니다.');
        return;
      }

      if(!confirm('정말 적용하시겠습니까?')) return;

      let apiURL = '/rest/content/team/symbol-update';
      util.getAjaxData("modifySymbol", apiURL, JSON.stringify(symbolList), function (id, response, params) {
        symbolReload();
      }, null, {type: 'POST', contentType: 'application/json'});
    }

    return {
      callList: callList,
      callSymbolUpdate: callSymbolUpdate,
      callSymbolReg: callSymbolReg,
      symbolSearch: symbolSearch,
      symbolReload: symbolReload,
      openModalSymbolEdit: openModalSymbolEdit,
      previewImage: previewImage
    }
  }());

  function handlebarsPaging(targetId, pagingInfo) {
    symbolPagingInfo.pageNo = pagingInfo.pageNo;
    symbolPagingInfo.callList();
  }

  symbolEventData.symbolSearch();

  $(document).ready(function () {
    $('#tabSlct li a').on('click', function () {
      let $this = $(this);
      symbolSlct = $this.data('item');
      symbolEventData.symbolSearch();
    });

    // 순서정렬
    $('#ordSlct').on('change', function() {
      symbolEventData.symbolSearch();
    });

    // url 변경시
    $(document).on('change', '.bg-urls input[type="text"]', function() {
      let $this = $(this);
      let id = $this.attr('id');
      let index = parseInt(id.split('-')[1], 10);
      symbolList[index].bgUrl = $this.val();
    });

    // 노출여부 변경시
    $(document).on('click', '.switch-turn input[type="checkbox"]', function() {
      let $this = $(this);
      let id = $this.attr('id');
      let index = parseInt(id.split('-')[1], 10);
      symbolList[index].useYn = $this.is(':checked') ? 'y' : 'n';
    });
  });
</script>

<script type="text/x-handlebars-template" id="tmp-dalla-symbol-list">
    <div class="dataTables_paginate paging_full_numbers" id="dalla-symbol-top"></div>
    <table id="dalla-symbol-table" class="table table-sorting table-hover table-bordered">
        <colgroup>
            <col width="60px"/>
            <col width="100px"/>
            <col width="150px"/>
            <col width="auto"/>
            <col width="100px"/>
            <col width="100px"/>
            <col width="150px"/>
        </colgroup>
        <thead>
        <tr>
            <th>No.</th>
            <th>코드</th>
            <th>파츠</th>
            <th>URL</th>
            <th>누적 사용팀 수</th>
            <th>노출여부<br>(팀생성화면)</th>
            <th>갱신일시</th>
        </tr>
        </thead>
        <tbody id="dalla-symbol-table-body">
        {{#each this as |data|}}
        <tr>
            <td>{{index_no}}</td>
            <td>{{bg_code}}</td>
            <td>
                <div id="partsImg-{{@key}}" class="parts-images">
                    <img src="{{bg_url}}" />
                </div>
            </td>
            <td>
                <div class="bg-urls form-inline">
                    <input type="text" name="bgUrl" id="bgUrl-{{@key}}" class="form-control" style="width: 300px" value="{{bg_url}}">
                    <button type="button" class="btn btn-sm btn-default"
                            onclick="symbolEventData.previewImage('bgUrl-{{@key}}', 'partsImg-{{@key}}');">미리보기
                    </button>
                </div>
            </td>
            <td>{{addComma bg_cnt}}</td>
            <td class="switch-turn">
                {{{getOnOffSwitch useYnValue useYnKey}}}
            </td>
            <td>
                <div>{{upd_date}}</div>
                <div>({{chrgr_name}})</div>
            </td>
        </tr>
        {{else}}
        <tr>
            <td colspan="7">{{isEmptyData}}</td>
        </tr>
        {{/each}}
        </tbody>
    </table>
    <div class="dataTables_paginate paging_full_numbers" id="dalla-symbol-bottom"></div>
</script>
