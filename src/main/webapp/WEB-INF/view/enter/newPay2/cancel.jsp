<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dummyData"><%= java.lang.Math.round(java.lang.Math.random() * 1000000) %>
</c:set>
<%
    Date nowTime = new Date();
    SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
%>

<!-- 결제/환불 > 결제내역 -->
<div class="widget widget-table mb10">
    <div class="widget-content mt10" id="div_canselY">
        <%--<a href="javascript://" class="_prevSearch">[이전]</a>--%>
        <span class="_searchDate"></span>
        <%--<a href="javascript://" class="_nextSearch">[다음]</a>--%>
        <br/>
        <label id="payPlatformArea" onchange="sel_change_pay_cancel();"></label>
        <label id="payWayArea" onchange="sel_change_pay_cancel();"></label>
        <label id="payInnerArea" onchange="sel_change_pay_cancel();" style="border: 1px solid #632beb"></label>

        <div class="pull-right mb5 col-md-3">
            <span id="pay_cancel_summaryArea"></span>
        </div>

        <div class="row">
            <div id="history-cancel-list"></div>
        </div>
    </div>
    <div class="widget-footer">
        <span>
            <button class="btn btn-default print-btn pull-right cancelExcelDownBtn" type="button">
                <i class="fa fa-print"></i>Excel Down
            </button>
        </span>
    </div>
</div>

<script type="text/javascript" src="/js/code/payment/payCodeList.js?${dummyData}"></script>

<script type="text/javascript">
  let tmp_ostype_cancel = -1;
  let tmp_innerType_cancel = 0;
  let tmp_payWay_cancel = 'all';

  // 페이징
  const cancelPagingInfo = new PAGING_INFO(0, 1, 50);

  // 상태값 변경
  function sel_change_pay_cancel() {
    tmp_ostype_cancel = $("#div_canselY").find("select[name='ostype']").val();
    tmp_innerType_cancel = $("#div_canselY").find("select[name='innerType']").val();
    tmp_payWay_cancel = $("#div_canselY").find("select[name='payWay']").val();

    cancelPagingInfo.pageNo = 1;
    getPayCancelDataList();
  }

  // 취소목록 실행
  function getPayCancelList() {
    $("#div_canselY").find("#payPlatformArea").html(util.getCommonCodeSelect('-1', payPlatform));
    $("#div_canselY").find("#payWayArea").html(util.getCommonCodeSelect('all', payWay));
    $("#div_canselY").find("#payInnerArea").html(util.getCommonCodeSelect('0', innerType));

    let data = {
      tDate: $("#startDate").val().replace(/[.]/g, '-')
    };
    util.getAjaxData("getPayCancelPage", "/v2/rest/enter/pay/day", data, fn_pay_day_succ);
  }

  // 요청일 결제 데이터
  function fn_pay_day_succ(data, response) {
    renderCancelSummary(response.paycancel);

    cancelPagingInfo.pageNo = 1;
    getPayCancelDataList();
  }

  function renderCancelSummary(payCancel) {
    $("#pay_cancel_summaryArea").empty();
    let payCancelData = {
      canc_amt: 0,
      canc_cmt: 0,
      canc_cnt: 0,
    }
    payCancelData = payCancel ? payCancel : payCancelData;

    let template, templateScript, context, html;
    template = $("#pay_cancel_tableSummary").html();
    templateScript = Handlebars.compile(template);
    context = payCancelData;
    html = templateScript(context);
    $("#pay_cancel_summaryArea").html(html);

    ui.tableHeightSet();
    ui.paintColor();
  }

  // 취소목록
  function getPayCancelDataList() {
    $('#history-cancel-list').empty();

    let data = {
      tDate: $("#startDate").val().replace(/[.]/g, '-'),
      memNo: 0,
      payInner: tmp_innerType_cancel < 0 ? 2 : tmp_innerType_cancel,
      payWaySlct: tmp_payWay === 'all' ? '' : tmp_payWay,
      payOs: tmp_ostype_cancel === -1 ? 0 : tmp_ostype_cancel,
      payTime: '',
      paySex: '',
      payAge: 0,
      pageNo: cancelPagingInfo.pageNo,
      pagePerCnt: cancelPagingInfo.pageCnt
    };
    util.getAjaxData("getPayCancelList", "/v2/rest/enter/pay/cancel", data, fn_history_cancel);
  }

  function fn_history_cancel(data, response) {
    let template, templateScript, context, html;
    template = $('#tmp-history-cancel-list').html();
    templateScript = Handlebars.compile(template);
    context = response.listData.map(function (item, index) {
      item.index_no = response.totalCnt - (((cancelPagingInfo.pageNo - 1) * cancelPagingInfo.pageCnt) + index);
      item.birth = item.mem_birth_year + '-' + item.mem_birth_month.padStart(2, '0') + '-' + item.mem_birth_day.padStart(2, '0');
      item.age_text = common.calcAge(item.birth) < 20 ? '<span style="color:red">미성년자</span>' : '-';
      item.pay_way_text = util.getCommonCodeText(item.pay_way, payWay);
      item.info = '-';
      switch (item.pay_way) {
        case 'MC':
          item.info = common.phoneNumHyphen(item.pay_info_no);
          break;
        case 'CN':
          item.info = common.cardNo(item.pay_info_no) + '<br/>' + item.pay_info_nm;
          break;
        case 'VA':
          item.info = item.pay_info_no + '<br/>' + util.getCommonCodeText(item.pay_info_nm, bankList);
          break;
        case 'cashbee':
        case 'tmoney':
        case 'payco':
        case 'toss':
        case 'kakaopay':
        case 'kakaoMoney':
          item.info = item.pay_info;
          break;
        case 'simple':
          item.info = item.account_no + '<br/>' + util.getCommonCodeText(item.bank_code, bankList);
          break;
        case 'InAppAos':
          item.info = item.pay_info;
      }
      item.pay_dt_ok = item.pay_ok_date + ' ' + item.pay_ok_time.substr(0, 8);
      item.os_text = util.getCommonCodeText(item.os, payPlatform);
      item.pay_yn_uppercase = item.pay_yn.toUpperCase();
      item.chrgr_yn_uppercase = item.inner === 0 ? 'N' : 'Y';
      return item;
    });
    html = templateScript(context);
    $("#history-cancel-list").html(html);

    cancelPagingInfo.totalCnt = response.totalCnt;
    util.renderPagingNavigation('history-cancel-paginate-top', cancelPagingInfo);
    util.renderPagingNavigation('history-cancel-paginate-bottom', cancelPagingInfo);

    if (response.listData.length === 0) {
      $('#history-cancel-paginate-top').hide();
      $('#history-cancel-paginate-bottom').hide();
    } else {
      $('#history-cancel-paginate-top').show();
      $('#history-cancel-paginate-bottom').show();
    }
  }

  /*=============엑셀==================*/
  $('.cancelExcelDownBtn').on('click', function () {
    var formElement = document.querySelector("form");
    var formData = new FormData(formElement);

    formData.append("tDate", $("#startDate").val().replace(/[.]/g, '-'));
    formData.append("memNo", 0);
    formData.append("payInner", 2);
    formData.append("payWaySlct", "");
    formData.append("payOs", 0);
    formData.append("payTime", '');
    formData.append("paySex", '');
    formData.append("payAge", 0);
    formData.append("pageNo", 1);
    formData.append("pagePerCnt", 99999);
    util.excelDownload($(this), "/v2/rest/enter/pay/cancel/excel", formData, fn_excelSuccess, fn_excelFail);
  });

  function fn_excelSuccess() {
    alert("다운로드 완료");
  }

  function fn_excelFail() {
    alert("다운로드 실패");
  }
</script>

<script id="pay_cancel_tableSummary" type="text/x-handlebars-template">
    <table class="table table-condensed table-dark-header table-bordered no-margin" style="margin-right:0px">
        <colgroup>
            <%--<col width="35%"/><col width="65%"/>--%>
        </colgroup>
        <tr>
            <th class="_bgColor" data-bgcolor="#bfbfbf">구분</th>
            <th colspan="2" class="_bgColor" data-bgcolor="#f8cbad">결제 취소</th>
        </tr>
        <tr>
            <th class="_bgColor" data-bgcolor="#d9d9d9">부가세</th>
            <th class="_bgColor" data-bgcolor="#fbe5d6">건</th>
            <th class="_bgColor" data-bgcolor="#fbe5d6">금액</th>
        </tr>
        <tr>
            <td>포함</td>
            <td>{{addComma canc_cnt}}건</td>
            <td>{{addComma canc_amt}}원</td>
        </tr>
        <tr>
            <td class="_fontColor font-bold" data-fontcolor="red">제외</td>
            <td>{{addComma canc_cnt}}건</td>
            <td>{{vatMinus canc_amt}}원</td>
        </tr>
    </table>
</script>

<script type="text/x-handlebars-template" id="tmp-history-cancel-list">
    <div class="dataTables_paginate paging_full_numbers" id="history-cancel-paginate-top"></div>
    <table id="history-cancel-table" class="table table-sorting table-hover table-bordered">
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
            <col width="auto"/>
            <col width="auto"/>
            <col width="auto"/>
            <col width="auto"/>
            <col width="auto"/>
        </colgroup>
        <thead>
        <tr>
            <th>No.</th>
            <th>회원번호<br/>닉네임</th>
            <th>거래번호</th>
            <th>미성년자<br>여부</th>
            <th>성별</th>
            <th>수단</th>
            <th>결제정보</th>
            <th>시도일시</th>
            <th>완료일시</th>
            <th>구매<br>횟수</th>
            <th>총 구매<br>금액</th>
            <th>결제<br>아이템</th>
            <th>결제<br>수량</th>
            <th>금액</th>
            <th>취소 시<br>차감 달</th>
            <th>보유 달</th>
            <th>직원<br>여부</th>
            <th>플랫폼</th>
            <th>취소일시</th>
            <th>취소<br/>실패사유</th>
            <th>처리자</th>
        </tr>
        </thead>
        <tbody id="history-cancel-table-body">
        {{#each this as |data|}}
        <tr>
            <td>{{index_no}}</td>
            <td>
                {{{memNoLink mem_no mem_no}}}<br>
                {{mem_nick}}
            </td>
            <td>{{order_id}}</td>
            <td>{{{age_text}}}</td>
            <td>{{{sexIcon mem_sex mem_birth_year}}}</td>
            <td>{{{pay_way_text}}}</td>
            <td>{{{info}}}</td>
            <td>{{pay_dt_comein}}</td>
            <td>{{pay_dt_ok}}</td>
            <td>{{addComma tot_pay_cnt}}</td>
            <td>{{addComma tot_pay_amt}}원</td>
            <td>{{pay_code}}</td>
            <td>{{addComma item_amt}}</td>
            <td>{{addComma pay_amt}}{{#dalbit_if pay_slct '==' 'KRW'}}원{{/dalbit_if}}</td>
            <td>{{addComma dal_cnt}}</td>
            <td>{{addComma tot_dal_cnt}}</td>
            <td>{{chrgr_yn_uppercase}}</td>
            <td>{{{os_text}}}</td>
            <td>{{cancel_dt}}</td>
            <td>{{fail_msg}}</td>
            <td>{{op_name}}</td>
        </tr>
        {{else}}
        <tr>
            <td colspan="21">{{isEmptyData}}</td>
        </tr>
        {{/each}}
        </tbody>
    </table>
    <div class="dataTables_paginate paging_full_numbers" id="history-cancel-paginate-bottom"></div>
</script>