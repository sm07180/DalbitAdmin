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
    <div class="widget-content mt10" id="div_payY">
        <div class="row form-inline" id="divHisroty">
            <div class="widget widget-table mb10">
                <div class="widget-header" style="height: 66px">
                    <h3><i class="fa fa-table"></i> 결제통계 현황</h3>
                    <div class="widget-header-toolbar">
                        <div>
                            <button type="button" data-code="2" id="btn-inapp-aos"
                                    class="btn-inapp btn btn-sm btn-danger" style="width: 150px">AOS 외부결제 비활성화
                            </button>
                        </div>
                        <div>
                            <button type="button" data-code="1" id="btn-inapp-ios"
                                    class="btn-inapp btn btn-sm btn-danger" style="width: 150px">IOS 외부결제 비활성화
                            </button>
                        </div>
                    </div>
                </div>
                <div id="div_top">
                    <div class="row mt5">
                        <div class="col-md-10 pl5 pr5" id="pay-way-day-stat"></div>
                        <div class="col-md-2 no-padding" id="pay-day-total"></div>
                    </div>
                    <div class="row mt5">
                        <div class="col-md-12 no-padding" id="pay-sex-day-stat"></div>
                        <div class="col-md-12 no-padding mt5" id="pay-web-day-stat"></div>
                        <div class="col-md-12 no-padding mt5" id="pay-aos-day-stat"></div>
                        <div class="col-md-12 no-padding mt5" id="pay-ios-day-stat"></div>
                    </div>
                </div>
            </div>
        </div>

        <a id='historyExcel' type='button' class="btn btn-default print-btn pull-right" download="" href="#"
           onclick="return ExcellentExport.excel(this, 'divHisroty', 'Sheet1');"><i class="fa fa-print"></i>▲ 종합현황 Excel
            Down</a>

        <div class="top-left pull-left dataTable-div col-md-6 no-padding">
            <span class="_searchDate"></span><br/>
            <label id="payPlatformArea" onchange="sel_change_pay();"></label>
            <label id="payWayArea" onchange="sel_change_pay();"></label>
            <label id="payInnerArea" onchange="sel_change_pay();" style="border: 1px solid #632beb"></label>
        </div>

        <div class="col-md-12 no-padding pull-right mb5">
            <div class="no-padding pull-right" style="width: 227px">
                <span id="pay_summaryArea2"></span>
            </div>
            <div class="no-padding mr10 pull-right" style="width: 227px">
                <span id="pay_summaryArea"></span>
            </div>
            <button class="btn btn-default print-btn pull-right historyExcelDown" type="button"><i
                    class="fa fa-print"></i>▼ 내역 Excel Down
            </button>
        </div>

        <div class="row">
            <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist" id="pay-member-con">
                <li class="active"><a href="#history-succ" role="tab" data-toggle="tab" data-paystate="succ">성공내역</a></li>
                <li><a href="#history-cancel" role="tab" data-toggle="tab" data-paystate="cancel">취소내역</a></li>
            </ul>
        </div>

        <div class="row">
            <div id="history-list"></div>
        </div>
    </div>
    <div class="widget-footer">
        <span>
            <button class="btn btn-default print-btn pull-right historyExcelDown" type="button"><i
                    class="fa fa-print"></i>▲ 내역 Excel Down</button>
        </span>
    </div>
</div>

<script src="/js/lib/excellentexport.js"></script>
<script type="text/javascript" src="/js/code/payment/payCodeList.js?${dummyData}"></script>
<script type="text/javascript">
  var dtList_info;

  var tmp_ostype = -1;
  var tmp_innerType = 0;
  var tmp_payWay = 'all';
  var tmp_paystate = 'succ';

  // 외부결제 버튼코드
  var paymentSetBtnCodes = {
    'y': 'primary',
    'n': 'danger',
  }
  // 외부결제 버튼텍스트
  var paymentSetBtnText = {
    'y': '활성화',
    'n': '비활성화',
  }

  // 페이징
  const historyPagingInfo = new PAGING_INFO(0, 1, 50);

  // 인앱결제 여부
  function getPamentSetInfo() {
    util.getAjaxData("getPamentSetInfo", "/rest/enter/pay/payment", {}, function (data, response) {
      $('.btn-inapp').removeClass('btn-danger').removeClass('btn-primary');
      $('#btn-inapp-aos').addClass('btn-' + paymentSetBtnCodes[response.data.aos_payment_set]);
      $('#btn-inapp-ios').addClass('btn-' + paymentSetBtnCodes[response.data.ios_payment_set]);

      $('#btn-inapp-aos').text('AOS 외부결제 ' + paymentSetBtnText[response.data.aos_payment_set]);
      $('#btn-inapp-ios').text('IOS 외부결제 ' + paymentSetBtnText[response.data.ios_payment_set]);
    }, null, {type: 'GET'});
  }

  // 인앱결제 설정
  function setPamentSetInfo(data) {
    util.getAjaxData("setPamentSetInfo", "/rest/enter/pay/payment", data, function (data, response) {
      getPamentSetInfo();
    }, null, {type: 'POST'});
  }

  function getStatPayInfo() {
    $("#historyExcel").attr('download', "결제현황_일간결제_" + moment($("#startDate").val()).add('days', 0).format('YYYY.MM.DD') + ".xls");
    let data = {
      tDate: $("#startDate").val().replace(/[.]/g, '-')
    };
    util.getAjaxData("statPayInfo", "/v2/rest/enter/pay/day", data, fn_statPayInfo_success1);
  }

  function fn_statPayInfo_success1(data, response) {
    $('#pay-day-total').empty();
    $('#pay-way-day-stat').empty();
    $('#pay-sex-day-stat').empty();
    $('#pay-web-day-stat').empty();
    $('#pay-aos-day-stat').empty();
    $('#pay-ios-day-stat').empty();

    let paycancel = response.paycancel;
    let payway = response.payway;
    let paysex = response.paysex;
    let paycode = response.paycode;

    let template, templateScript, context, html;

    // 총계
    const dayTotal = {
      total_cnt: payway.total_cnt,
      total_cmt: payway.total_cmt,
      total_amt: payway.total_amt,
      canc_cnt: paycancel.canc_cnt,
      canc_cmt: paycancel.canc_cmt,
      canc_amt: paycancel.canc_amt
    };
    template = $('#tmp-pay-day-total').html();
    templateScript = Handlebars.compile(template);
    context = dayTotal;
    html = templateScript(context);
    $("#pay-day-total").html(html);

    // 결제방법
    template = $('#tmp-pay-way-day-stat').html();
    templateScript = Handlebars.compile(template);
    context = payway;
    html = templateScript(context);
    $("#pay-way-day-stat").html(html);

    // 결제성별
    const paysexday = {
      ...paysex,
      total_cnt: payway.total_cnt,
      total_cmt: payway.total_cmt,
      total_amt: payway.total_amt
    };
    template = $('#tmp-pay-sex-day-stat').html();
    templateScript = Handlebars.compile(template);
    context = paysexday;
    html = templateScript(context);
    $("#pay-sex-day-stat").html(html);

    // 결제수단 web
    let webcode = ['code13', 'code01', 'code02', 'code14', 'code03', 'code04', 'code05', 'code06', 'code15', 'code23'];
    let web_total_cnt = 0;
    let web_total_cmt = 0;
    let web_total_amt = 0;
    webcode.map(function (item) {
      web_total_cnt += parseInt(paycode[item + '_cnt'], 10);
      web_total_cmt += parseInt(paycode[item + '_cmt'], 10);
      web_total_amt += parseInt(paycode[item + '_amt'], 10);
    });
    const paywebday = {
      ...paycode,
      web_total_cnt: web_total_cnt,
      web_total_cmt: web_total_cmt,
      web_total_amt: web_total_amt
    };
    template = $('#tmp-pay-web-day-stat').html();
    templateScript = Handlebars.compile(template);
    context = paywebday;
    html = templateScript(context);
    $("#pay-web-day-stat").html(html);

    // 결제수단 aos
    let aoscode = ['code24', 'code25', 'code26', 'code27', 'code28', 'code29', 'code30', 'code31', 'code32'];
    let aos_total_cnt = 0;
    let aos_total_cmt = 0;
    let aos_total_amt = 0;
    aoscode.map(function (item) {
      aos_total_cnt += parseInt(paycode[item + '_cnt'], 10);
      aos_total_cmt += parseInt(paycode[item + '_cmt'], 10);
      aos_total_amt += parseInt(paycode[item + '_amt'], 10);
    });
    const payaosday = {
      ...paycode,
      aos_total_cnt: aos_total_cnt,
      aos_total_cmt: aos_total_cmt,
      aos_total_amt: aos_total_amt
    };
    template = $('#tmp-pay-aos-day-stat').html();
    templateScript = Handlebars.compile(template);
    context = payaosday;
    html = templateScript(context);
    $("#pay-aos-day-stat").html(html);

    // 결제수단 ios
    let ioscode = ['code16', 'code07', 'code17', 'code18', 'code08', 'code09', 'code10', 'code19', 'code11', 'code20', 'code12', 'code21', 'code22'];
    let ios_total_cnt = 0;
    let ios_total_cmt = 0;
    let ios_total_amt = 0;
    ioscode.map(function (item) {
      ios_total_cnt += parseInt(paycode[item + '_cnt'], 10);
      ios_total_cmt += parseInt(paycode[item + '_cmt'], 10);
      ios_total_amt += parseInt(paycode[item + '_amt'], 10);
    });
    const payiosday = {
      ...paycode,
      ios_total_cnt: ios_total_cnt,
      ios_total_cmt: ios_total_cmt,
      ios_total_amt: ios_total_amt
    };
    template = $('#tmp-pay-ios-day-stat').html();
    templateScript = Handlebars.compile(template);
    context = payiosday;
    html = templateScript(context);
    $("#pay-ios-day-stat").html(html);

    ui.paintColor();
    ui.tableHeightSet();
    getPamentSetInfo();
    historyPagingInfo.pageNo = 1;
    getPayHistoryList();

    $("#div_payY").find("#payPlatformArea").html(util.getCommonCodeSelect('-1', payPlatform));
    $("#div_payY").find("#payInnerArea").html(util.getCommonCodeSelect('0', innerType));
    $("#div_payY").find("#payWayArea").html(util.getCommonCodeSelect('all', payWay));
  }

  function getPayHistoryList() {
    $('#history-list').empty();

    let data = {
      tDate: $("#startDate").val().replace(/[.]/g, '-'),
      memNo: 0,
      payInner: tmp_innerType < 0 ? 2 : tmp_innerType,
      payWaySlct: tmp_payWay === 'all' ? '' : tmp_payWay,
      payOs: tmp_ostype === -1 ? 0 : tmp_ostype,
      payTime: '',
      paySex: '',
      payAge: 0,
      pageNo: historyPagingInfo.pageNo,
      pagePerCnt: historyPagingInfo.pageCnt
    };
    util.getAjaxData("getPayHistoryList", "/v2/rest/enter/pay/" + tmp_paystate, data, fn_history_succ);
  }

  function fn_history_succ(data, response) {
    let template, templateScript, context, html;
    template = $('#tmp-history-list').html();
    templateScript = Handlebars.compile(template);
    context = response.listData.map(function (item, index) {
      item.index_no = response.totalCnt - (((historyPagingInfo.pageNo - 1) * historyPagingInfo.pageCnt) + index);
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
      }
      item.pay_dt_ok = item.pay_ok_date + ' ' + item.pay_ok_time.substr(0, 8);
      item.os_text = util.getCommonCodeText(item.os, payPlatform);
      item.pay_yn_uppercase = item.pay_yn.toUpperCase();
      item.chrgr_yn_uppercase = item.inner === 0 ? 'N' : 'Y';
      return item;
    });
    html = templateScript(context);
    $("#history-list").html(html);

    historyPagingInfo.totalCnt = response.totalCnt;
    util.renderPagingNavigation('history-paginate-top', historyPagingInfo);
    util.renderPagingNavigation('history-paginate-bottom', historyPagingInfo);

    if (response.listData.length === 0) {
      $('#history-paginate-top').hide();
      $('#history-paginate-bottom').hide();
    } else {
      $('#history-paginate-top').show();
      $('#history-paginate-bottom').show();
    }
  }

  function sel_change_pay() {
    tmp_ostype = $("#div_payY").find("select[name='ostype']").val();
    tmp_innerType = $("#div_payY").find("select[name='innerType']").val();
    tmp_payWay = $("#div_payY").find("select[name='payWay']").val();

    historyPagingInfo.pageNo = 1;
    getPayHistoryList();
  }

  /*=============엑셀==================*/
  $('.historyExcelDown').on('click', function () {
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
    util.excelDownload($(this), "/v2/rest/enter/pay/" + tmp_paystate + "/excel", formData, fn_excelSuccess, fn_excelFail);
  });

  function fn_excelSuccess(data) {
    alert("다운로드 완료   " + data);
  }

  function fn_excelFail(data) {
    alert("다운로드 실패   " + data);
  }

  function click_way() {
    $("#tablist_con li:eq(7) a").tab("show");   // 수단
    getPayWayList();
  }

  function click_age() {
    $("#tablist_con li:eq(6) a").tab("show");   // 회원별
    getPayAgeList();
  }

  function click_code() {
    $("#tablist_con li:eq(8) a").tab("show");   // 상품별
    getPayCodeList();
  }

  function click_popupGender(tmp) {
    let sDate = $("#startDate").val();
    let eDate = $("#endDate").val();
    var popupUrl = "/enter/newPay/popup/history?sDate=" + sDate + "&eDate=" + eDate + "&gender=" + tmp + "&time=null&age=null";
    util.windowOpen(popupUrl, "1550", "885", "결제목록");
  }

  function click_popupAge(tmp) {
    let sDate = $("#startDate").val();
    let eDate = $("#endDate").val();
    var popupUrl = "/enter/newPay/popup/history?sDate=" + sDate + "&eDate=" + eDate + "&gender=null&time=null&age=" + tmp;
    util.windowOpen(popupUrl, "1550", "885", "결제목록");
  }

  $(document).ready(function () {
    // 인앱결제 토글
    $('.btn-inapp').on('click', function (e) {
      var $this = $(this);
      var paySlct = $this.data('code');
      var setSlct = $this.hasClass('btn-danger') ? 'y' : 'n';
      // 인앱결제 설정변경
      setPamentSetInfo({
        setSlct: setSlct,
        paySlct: paySlct
      });
    });

    // 2회차 하위탭
    $('#pay-member-con > li > a').on('click', function (e) {
      var $this = $(this);

      tmp_paystate = $this.data('paystate');
      historyPagingInfo.pageNo = 1;
      getPayHistoryList();
    });
  });
</script>

<!-- 총계 -->
<script type="text/x-handlebars-template" id="tmp-pay-day-total">
    <table class="table table-bordered mb0 _tableHeight">
        <colgroup>
            <col width="35%"/>
            <col width="65%"/>
        </colgroup>
        <tr>
            <th colspan="2">총 결제 건/(부가세 제외) 매출</th>
        </tr>
        <tr style="color: #ff5600;">
            <td><b>{{addComma total_cnt}} 건</b></td>
            <td><b>{{vatMinus total_amt}} 원</b></td>
        </tr>
        <tr>
            <th colspan="2">결제 취소(부가세 제외)</th>
        </tr>
        <tr class="font-bold" style="color: #ff5600;">
            <td>{{addComma canc_cnt}}건</td>
            <td>{{vatMinus canc_amt}}원</td>
        </tr>
    </table>
</script>

<!-- 결제방법 -->
<script type="text/x-handlebars-template" id="tmp-pay-way-day-stat">
    <table class="table table-bordered mb0 _tableHeight">
        <colgroup>
            <col width="10.5%"/>
            <col width="6.3%"/>
            <col width="6.3%"/>
            <col width="6.3%"/>
            <col width="6.3%"/>
            <col width="6.3%"/>
            <col width="6.3%"/>
            <col width="6.3%"/>
            <col width="6.3%"/>
            <col width="6.3%"/>
            <col width="6.3%"/>
            <col width="6.3%"/>
            <col width="6.3%"/>
            <col width="6.3%"/>
            <col width="6.3%"/>
        </colgroup>
        <thead>
        <tr>
            <th class="_bgColor" data-bgcolor="#F1E7FB">
                <a href="javascript:void(0);" onclick="click_way();" class="_fontColor" data-fontcolor="black">◈ 결제 방법 별</a>
            </th>
            <th>휴대폰</th>
            <th>카드</th>
            <th>가상<br/>계좌이체</th>
            <th>인앱결제<br/>(AOS)</th>
            <th>인앱결제<br/>(IOS)</th>
            <th>문화상품권</th>
            <th>해피머니<br/>상품권</th>
            <th>티머니</th>
            <th>캐시비</th>
            <th>페이코</th>
            <th>카카오페이<br/>(카드)</th>
            <th>카카오페이<br/>(머니)</th>
            <th>간편결제<br/>(계좌)</th>
            <th style="color: green; font-weight: bold">총합</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <th>결제건수</th>
            <td>{{addComma mc_cnt}}</td>
            <td>{{addComma cn_cnt}}</td>
            <td>{{addComma va_cnt}}</td>
            <td>{{addComma inapp_aos_cnt}}</td>
            <td>{{addComma inapp_cnt}}</td>
            <td>{{addComma gm_cnt}}</td>
            <td>{{addComma hm_cnt}}</td>
            <td>{{addComma tmoney_cnt}}</td>
            <td>{{addComma cashbee_cnt}}</td>
            <td>{{addComma payco_cnt}}</td>
            <td>{{addComma kakaopay_cnt}}</td>
            <td>{{addComma kakaomoney_cnt}}</td>
            <td>{{addComma simple_cnt}}</td>
            <td><b>{{addComma total_cnt}}</b></td>
        </tr>
        <tr>
            <th>결제수량</th>
            <td>{{addComma mc_cmt}}</td>
            <td>{{addComma cn_cmt}}</td>
            <td>{{addComma va_cmt}}</td>
            <td>{{addComma inapp_aos_cmt}}</td>
            <td>{{addComma inapp_cmt}}</td>
            <td>{{addComma gm_cmt}}</td>
            <td>{{addComma hm_cmt}}</td>
            <td>{{addComma tmoney_cmt}}</td>
            <td>{{addComma cashbee_cmt}}</td>
            <td>{{addComma payco_cmt}}</td>
            <td>{{addComma kakaopay_cmt}}</td>
            <td>{{addComma kakaomoney_cmt}}</td>
            <td>{{addComma simple_cmt}}</td>
            <td><b>{{addComma total_cmt}}</b></td>
        </tr>
        <tr style="color: #66a449">
            <th>부가세 포함 금액</th>
            <td>{{addComma mc_amt}}</td>
            <td>{{addComma cn_amt}}</td>
            <td>{{addComma va_amt}}</td>
            <td>{{addComma inapp_aos_amt}}</td>
            <td>{{addComma inapp_amt}}</td>
            <td>{{addComma gm_amt}}</td>
            <td>{{addComma hm_amt}}</td>
            <td>{{addComma tmoney_amt}}</td>
            <td>{{addComma cashbee_amt}}</td>
            <td>{{addComma payco_amt}}</td>
            <td>{{addComma kakaopay_amt}}</td>
            <td>{{addComma kakaomoney_amt}}</td>
            <td>{{addComma simple_amt}}</td>
            <td><b>{{addComma total_amt}}</b></td>
        </tr>
        <tr style="color: #ff5600">
            <th><b>부가세 제외 금액</b></th>
            <td>{{vatMinus mc_amt}}</td>
            <td>{{vatMinus cn_amt}}</td>
            <td>{{vatMinus va_amt}}</td>
            <td>{{vatMinus inapp_aos_amt}}</td>
            <td>{{vatMinus inapp_amt}}</td>
            <td>{{vatMinus gm_amt}}</td>
            <td>{{vatMinus hm_amt}}</td>
            <td>{{vatMinus tmoney_amt}}</td>
            <td>{{vatMinus cashbee_amt}}</td>
            <td>{{vatMinus payco_amt}}</td>
            <td>{{vatMinus kakaopay_amt}}</td>
            <td>{{vatMinus kakaomoney_amt}}</td>
            <td>{{vatMinus simple_amt}}</td>
            <td><b>{{vatMinus total_amt}}</b></td>
        </tr>
        <tr>
            <th>결제 비율</th>
            <td>({{payRate mc_cnt total_cnt}}%)<br/><b>{{payRate mc_amt total_amt}}%</b></td>
            <td>({{payRate cn_cnt total_cnt}}%)<br/><b>{{payRate cn_amt total_amt}}%</b></td>
            <td>({{payRate va_cnt total_cnt}}%)<br/><b>{{payRate va_amt total_amt}}%</b></td>
            <td>({{payRate inapp_aos_cnt total_cnt}}%)<br/><b>{{payRate inapp_aos_amt total_amt}}%</b></td>
            <td>({{payRate inapp_cnt total_cnt}}%)<br/><b>{{payRate inapp_amt total_amt}}%</b></td>
            <td>({{payRate gm_cnt total_cnt}}%)<br/><b>{{payRate gm_amt total_amt}}%</b></td>
            <td>({{payRate hm_cnt total_cnt}}%)<br/><b>{{payRate hm_amt total_amt}}%</b></td>
            <td>({{payRate tmoney_cnt total_cnt}}%)<br/><b>{{payRate tmoney_amt total_amt}}%</b></td>
            <td>({{payRate cashbee_cnt total_cnt}}%)<br/><b>{{payRate cashbee_amt total_amt}}%</b></td>
            <td>({{payRate payco_cnt total_cnt}}%)<br/><b>{{payRate payco_amt total_amt}}%</b></td>
            <td>({{payRate kakaopay_cnt total_cnt}}%)<br/><b>{{payRate kakaopay_amt total_amt}}%</b></td>
            <td>({{payRate kakaomoney_cnt total_cnt}}%)<br/><b>{{payRate kakaomoney_amt total_amt}}%</b></td>
            <td>({{payRate simple_cnt total_cnt}}%)<br/><b>{{payRate simple_amt total_amt}}%</b></td>
            <td>({{payRate total_cnt total_cnt}}%)<br/><b>{{payRate total_amt total_amt}}%</b></td>
        </tr>
        </tbody>
    </table>
</script>

<!-- 결제성별&연령 -->
<script type="text/x-handlebars-template" id="tmp-pay-sex-day-stat">
    <table class="table table-bordered mb0 _tableHeight">
        <colgroup>
            <col width="9%"/>
            <col width="6.3%"/>
            <col width="6.3%"/>
            <col width="6.3%"/>
            <col width="6.3%"/>
            <col width="0.1%"/>
            <col width="9%"/>
            <col width="6.3%"/>
            <col width="6.3%"/>
            <col width="6.3%"/>
            <col width="6.3%"/>
            <col width="6.3%"/>
            <col width="6.3%"/>
            <col width="6.3%"/>
            <col width="8%"/>
        </colgroup>
        <thead>
        <tr>
            <th class="_bgColor" data-bgcolor="#F1E7FB">
                <a href="javascript:void(0);" onclick="click_age();" class="_fontColor" data-fontcolor="black">◈ 결제
                    성별</a>
            </th>
            <th class="_sex_male">{{{sexIcon 'm'}}}</th>
            <th class="_sex_female">{{{sexIcon 'f'}}}</th>
            <th>알수없음</th>
            <th>총 합</th>
            <th style="background-color: white; border-bottom: hidden; border-top: hidden;"></th>
            <th class="_bgColor" data-bgcolor="#F1E7FB">
                <a href="javascript:void(0);" onclick="click_age();" class="_fontColor" data-fontcolor="black">◈ 결제 연령대
                    별</a>
            </th>
            <th>미선택</th>
            <th>10대</th>
            <th>20대</th>
            <th>30대</th>
            <th>40대</th>
            <th>50대</th>
            <th>60대 이상</th>
            <th>총 합</th>
        </tr>
        </thead>
        <tr>
            <th>결제 건 수</th>
            <td onclick="click_popupGender('m')">
                <a href="javascript:void(0);">
                    <span class="font-bold" style="color: blue">{{addComma male_cnt}}</span>
                </a>
            </td>
            <td onclick="click_popupGender('f')">
                <a href="javascript:void(0);">
                    <span class="font-bold" style="color: red">{{addComma female_cnt}}</span>
                </a>
            </td>
            <td onclick="click_popupGender('n')">
                <a href="javascript:void(0);">
                    <span class="font-bold _fontColor" data-fontColor="#555">{{addComma none_cnt}}</span>
                </a>
            </td>
            <td><b>{{addComma total_cnt}}</b></td>
            <td></td>
            <th>결제 건 수</th>
            <td onclick="click_popupAge('00')">
                <a href="javascript:void(0);">
                    <span class="_fontColor" data-fontcolor="#555">{{addComma age_00_cnt}}</span>
                </a>
            </td>
            <td onclick="click_popupAge('10')">
                <a href="javascript:void(0);">
                    <span class="_fontColor" data-fontcolor="#555">{{addComma age_10_cnt}}</span>
                </a>
            </td>
            <td onclick="click_popupAge('20')">
                <a href="javascript:void(0);">
                    <span class="_fontColor" data-fontcolor="#555">{{addComma age_20_cnt}}</span>
                </a>
            </td>
            <td onclick="click_popupAge('30')">
                <a href="javascript:void(0);">
                    <span class="_fontColor" data-fontcolor="#555">{{addComma age_30_cnt}}</span>
                </a>
            </td>
            <td onclick="click_popupAge('40')">
                <a href="javascript:void(0);">
                    <span class="_fontColor" data-fontcolor="#555">{{addComma age_40_cnt}}</span>
                </a>
            </td>
            <td onclick="click_popupAge('50')">
                <a href="javascript:void(0);">
                    <span class="_fontColor" data-fontcolor="#555">{{addComma age_50_cnt}}</span>
                </a>
            </td>
            <td onclick="click_popupAge('60')">
                <a href="javascript:void(0);">
                    <span class="_fontColor" data-fontcolor="#555">{{addComma age_60_cnt}}</span>
                </a>
            </td>
            <td><b>{{addComma total_cnt}}</b></td>
        </tr>
        <tr>
            <th>결제수량</th>
            <td onclick="click_popupGender('m')">
                <a href="javascript:void(0);">
                    <span class="font-bold" style="color: blue">{{addComma male_cmt}}</span>
                </a>
            </td>
            <td onclick="click_popupGender('f')">
                <a href="javascript:void(0);">
                    <span class="font-bold" style="color: red"> {{addComma female_cmt}}</span>
                </a>
            </td>
            <td onclick="click_popupGender('n')">
                <a href="javascript:void(0);">
                    <span class="font-bold _fontColor" data-fontColor="#555">{{addComma none_cmt}}</span>
                </a>
            </td>
            <td><b>{{addComma total_cmt}}</b></td>
            <td></td>
            <th>결제수량</th>
            <td onclick="click_popupAge('00')">
                <a href="javascript:void(0);">
                    <span class="_fontColor" data-fontcolor="#555">{{addComma age_00_cmt}}</span>
                </a>
            </td>
            <td onclick="click_popupAge('10')">
                <a href="javascript:void(0);">
                    <span class="_fontColor" data-fontcolor="#555">{{addComma age_10_cmt}}</span>
                </a>
            </td>
            <td onclick="click_popupAge('20')">
                <a href="javascript:void(0);">
                    <span class="_fontColor" data-fontcolor="#555">{{addComma age_20_cmt}}</span>
                </a>
            </td>
            <td onclick="click_popupAge('30')">
                <a href="javascript:void(0);">
                    <span class="_fontColor" data-fontcolor="#555">{{addComma age_30_cmt}}</span>
                </a>
            </td>
            <td onclick="click_popupAge('40')">
                <a href="javascript:void(0);">
                    <span class="_fontColor" data-fontcolor="#555">{{addComma age_40_cmt}}</span>
                </a>
            </td>
            <td onclick="click_popupAge('50')">
                <a href="javascript:void(0);">
                    <span class="_fontColor" data-fontcolor="#555">{{addComma age_50_cmt}}</span>
                </a>
            </td>
            <td onclick="click_popupAge('60')">
                <a href="javascript:void(0);">
                    <span class="_fontColor" data-fontcolor="#555">{{addComma age_60_cmt}}</span>
                </a>
            </td>
            <td><b>{{addComma total_cmt}}</b></td>
        </tr>
        <tr style="color: #66a449;">
            <th>부가세 포함 금액</th>
            <td><label style="color: blue">{{addComma male_amt}}</label></td>
            <td><label style="color: red">{{addComma female_amt}}</label></td>
            <td>{{addComma none_amt}}</td>
            <td><b>{{addComma total_amt}}</b></td>
            <td style="border-bottom: hidden;border-top: hidden"></td>
            <th>부가세 포함 금액</th>
            <td>{{addComma age_00_amt}}</td>
            <td>{{addComma age_10_amt}}</td>
            <td>{{addComma age_20_amt}}</td>
            <td>{{addComma age_30_amt}}</td>
            <td>{{addComma age_40_amt}}</td>
            <td>{{addComma age_50_amt}}</td>
            <td>{{addComma age_60_amt}}</td>
            <td><b>{{addComma total_amt}}</b></td>
        </tr>
        <tr style="color: #ff5600;">
            <th><b>부가세 제외 금액</b></th>
            <td style="color: blue;">{{vatMinus male_amt}}</td>
            <td style="color: red;">{{vatMinus female_amt}}</td>
            <td>{{vatMinus none_amt}}</td>
            <td><b>{{vatMinus total_amt}}</b></td>
            <td style="border-bottom: hidden;border-top: hidden"></td>
            <th>부가세 제외 금액</th>
            <td>{{vatMinus age_00_amt}}</td>
            <td>{{vatMinus age_10_amt}}</td>
            <td>{{vatMinus age_20_amt}}</td>
            <td>{{vatMinus age_30_amt}}</td>
            <td>{{vatMinus age_40_amt}}</td>
            <td>{{vatMinus age_50_amt}}</td>
            <td>{{vatMinus age_60_amt}}</td>
            <td><b>{{vatMinus total_amt}}</b></td>
        </tr>
        <tr>
            <th>결제 비율</th>
            <td>
                <label style="color: blue">
                    ({{payRate male_cnt total_cnt}}%)<br>
                    <b>{{payRate male_amt total_amt}}%</b>
                </label>
            </td>
            <td>
                <label style="color: red">
                    ({{payRate female_cnt total_cnt}}%)<br>
                    <b>{{payRate female_amt total_amt}}%</b>
                </label>
            </td>
            <td>({{payRate none_cnt none_cnt}}%)<br><b>{{payRate none_amt total_amt}}%</b></td>
            <td>({{payRate total_cnt total_cnt}}%)<br><b>{{payRate total_amt total_amt}}%</b></td>
            <td style="border-bottom: hidden;border-top: hidden"></td>
            <th>결제 비율</th>
            <td>({{payRate age_00_cnt total_cnt}}%)<br><b>{{payRate age_00_amt total_amt}}%</b></td>
            <td>({{payRate age_10_cnt total_cnt}}%)<br><b>{{payRate age_10_amt total_amt}}%</b></td>
            <td>({{payRate age_20_cnt total_cnt}}%)<br><b>{{payRate age_20_amt total_amt}}%</b></td>
            <td>({{payRate age_30_cnt total_cnt}}%)<br><b>{{payRate age_30_amt total_amt}}%</b></td>
            <td>({{payRate age_40_cnt total_cnt}}%)<br><b>{{payRate age_40_amt total_amt}}%</b></td>
            <td>({{payRate age_50_cnt total_cnt}}%)<br><b>{{payRate age_50_amt total_amt}}%</b></td>
            <td>({{payRate age_60_cnt total_cnt}}%)<br><b>{{payRate age_60_amt total_amt}}%</b></td>
            <td>({{payRate total_cnt total_cnt}}%)<br><b>{{payRate total_amt total_amt}}%</b></td>
        </tr>
        </tbody>
    </table>
</script>

<!-- 아이템별 WEB -->
<script type="text/x-handlebars-template" id="tmp-pay-web-day-stat">
    <table class="table table-bordered mb0 _tableHeight">
        <colgroup>
            <col width="9.5%"/>
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
            <col width="8%"/>
        </colgroup>
        <tbody>
        <tr>
            <th class="_bgColor" data-bgcolor="#F1E7FB">
                <a href="javascript:void(0);" onclick="click_code();" class="_fontColor" data-fontcolor="black">
                    ◈ 아이템별 Web
                </a>
            </th>
            <th>
                <img src="https://image.dalbitlive.com/store/charge/200612/charge_item_0010.png" width="25px"
                     height="25px">
                달 10
            </th>
            <th>
                <img src="https://image.dalbitlive.com/store/charge/200612/charge_item_0050.png" width="25px"
                     height="25px">
                달 50
            </th>
            <th>
                <img src="https://image.dalbitlive.com/store/charge/200612/charge_item_0100.png" width="25px"
                     height="25px">
                달 100
            </th>
            <th>
                <img src="https://image.dalbitlive.com/store/charge/200612/charge_item_0300.png" width="25px"
                     height="25px">
                달 300
            </th>
            <th>
                <img src="https://image.dalbitlive.com/store/charge/200612/charge_item_0500.png" width="25px"
                     height="25px">
                달 500
            </th>
            <th>
                <img src="https://image.dalbitlive.com/store/charge/200612/charge_item_1000.png" width="25px"
                     height="25px">
                달 1,000
            </th>
            <th>
                <img src="https://image.dalbitlive.com/store/charge/200612/charge_item_2000.png" width="25px"
                     height="25px">
                달 2,000<br/>(판매종료)
            </th>
            <th>
                <img src="https://image.dalbitlive.com/store/charge/200612/charge_item_3000.png" width="25px"
                     height="25px">
                달 3,000
            </th>
            <th>
                <img src="https://image.dalbitlive.com/store/charge/200612/charge_item_5000.png" width="25px"
                     height="25px">
                달 5,000
            </th>
            <th>
                <img src="https://image.dalbitlive.com/store/charge/200612/charge_item_5000.png" width="25px"
                     height="25px">
                달 11,000
            </th>
            <th>총합</th>
        </tr>
        <tr>
            <th>결제 건 수</th>
            <td>{{addComma code13_cnt}}</td>
            <td>{{addComma code01_cnt}}</td>
            <td>{{addComma code02_cnt}}</td>
            <td>{{addComma code14_cnt}}</td>
            <td>{{addComma code03_cnt}}</td>
            <td>{{addComma code04_cnt}}</td>
            <td>{{addComma code05_cnt}}</td>
            <td>{{addComma code06_cnt}}</td>
            <td>{{addComma code15_cnt}}</td>
            <td>{{addComma code23_cnt}}</td>
            <td><b>{{addComma web_total_cnt}}</b></td>
        </tr>
        <tr>
            <th>결제수량</th>
            <td>{{addComma code13_cmt}}</td>
            <td>{{addComma code01_cmt}}</td>
            <td>{{addComma code02_cmt}}</td>
            <td>{{addComma code14_cmt}}</td>
            <td>{{addComma code03_cmt}}</td>
            <td>{{addComma code04_cmt}}</td>
            <td>{{addComma code05_cmt}}</td>
            <td>{{addComma code06_cmt}}</td>
            <td>{{addComma code15_cmt}}</td>
            <td>{{addComma code23_cmt}}</td>
            <td><b>{{addComma web_total_cmt}}</b></td>
        </tr>
        <tr style="color: #66a449;">
            <th>부가세 포함 금액</th>
            <td>{{addComma code13_amt}}</td>
            <td>{{addComma code01_amt}}</td>
            <td>{{addComma code02_amt}}</td>
            <td>{{addComma code14_amt}}</td>
            <td>{{addComma code03_amt}}</td>
            <td>{{addComma code04_amt}}</td>
            <td>{{addComma code05_amt}}</td>
            <td>{{addComma code06_amt}}</td>
            <td>{{addComma code15_amt}}</td>
            <td>{{addComma code23_amt}}</td>
            <td><b>{{addComma android_total_amt}}</b></td>
        </tr>
        <tr style="color: #ff5600;">
            <th>부가세 제외 금액</th>
            <td>{{vatMinus code13_amt}}</td>
            <td>{{vatMinus code01_amt}}</td>
            <td>{{vatMinus code02_amt}}</td>
            <td>{{vatMinus code14_amt}}</td>
            <td>{{vatMinus code03_amt}}</td>
            <td>{{vatMinus code04_amt}}</td>
            <td>{{vatMinus code05_amt}}</td>
            <td>{{vatMinus code06_amt}}</td>
            <td>{{vatMinus code15_amt}}</td>
            <td>{{vatMinus code23_amt}}</td>
            <td><b>{{vatMinus web_total_amt}}</b></td>
        </tr>
        <tr>
            <th>결제 비율</th>
            <td>({{payRate code13_cnt web_total_cnt}}%)<br><b>{{payRate code13_amt web_total_amt}}%</b></td>
            <td>({{payRate code01_cnt web_total_cnt}}%)<br><b>{{payRate code01_amt web_total_amt}}%</b></td>
            <td>({{payRate code02_cnt web_total_cnt}}%)<br><b>{{payRate code02_amt web_total_amt}}%</b></td>
            <td>({{payRate code14_cnt web_total_cnt}}%)<br><b>{{payRate code14_amt web_total_amt}}%</b></td>
            <td>({{payRate code03_cnt web_total_cnt}}%)<br><b>{{payRate code03_amt web_total_amt}}%</b></td>
            <td>({{payRate code04_cnt web_total_cnt}}%)<br><b>{{payRate code04_amt web_total_amt}}%</b></td>
            <td>({{payRate code05_cnt web_total_cnt}}%)<br><b>{{payRate code05_amt web_total_amt}}%</b></td>
            <td>({{payRate code06_cnt web_total_cnt}}%)<br><b>{{payRate code06_amt web_total_amt}}%</b></td>
            <td>({{payRate code15_cnt web_total_cnt}}%)<br><b>{{payRate code15_amt web_total_amt}}%</b></td>
            <td>({{payRate code23_cnt web_total_cnt}}%)<br><b>{{payRate code23_amt web_total_amt}}%</b></td>
            <td>({{payRate web_total_cnt web_total_cnt}}%)<br><b>{{payRate web_total_amt web_total_amt}}%</b></td>
        </tr>
    </table>
</script>

<!-- 아이템별 AOS -->
<script type="text/x-handlebars-template" id="tmp-pay-aos-day-stat">
    <table class="table table-bordered mb0 _tableHeight">
        <colgroup>
            <col width="9.5%"/>
            <col width="auto"/>
            <col width="auto"/>
            <col width="auto"/>
            <col width="auto"/>
            <col width="auto"/>
            <col width="auto"/>
            <col width="auto"/>
            <col width="auto"/>
            <col width="auto"/>
            <col width="8%"/>
        </colgroup>
        <tbody>
        <tr>
            <th class="_bgColor" data-bgcolor="#F1E7FB">
                <a href="javascript:void(0);" onclick="click_code();" class="_fontColor" data-fontcolor="black">◈ 아이템별 AOS</a>
            </th>
            <th>
                <img src="https://image.dalbitlive.com/store/charge/200612/charge_item_0010.png" width="25px"
                     height="25px">
                달 9
            </th>
            <th>
                <img src="https://image.dalbitlive.com/store/charge/200612/charge_item_0050.png" width="25px"
                     height="25px">
                달 45
            </th>
            <th>
                <img src="https://image.dalbitlive.com/store/charge/200612/charge_item_0100.png" width="25px"
                     height="25px">
                달 92
            </th>
            <th>
                <img src="https://image.dalbitlive.com/store/store_3.png" width="25px" height="25px">
                달 200
            </th>
            <th>
                <img src="https://image.dalbitlive.com/store/store_3.png" width="25px" height="25px">
                달 300
            </th>
            <th>
                <img src="https://image.dalbitlive.com/store/store_4.png" width="25px" height="25px">
                달 500
            </th>
            <th>
                <img src="https://image.dalbitlive.com/store/charge/200612/charge_item_1000.png" width="25px"
                     height="25px">
                달 838
            </th>
            <th>
                <img src="https://image.dalbitlive.com/store/charge/200612/charge_item_2000.png" width="25px"
                     height="25px">
                달 1,530
            </th>
            <th>
                <img src="https://image.dalbitlive.com/store/store_6.png" width="25px" height="25px">
                달 2,300
            </th>
            <th>총합</th>
        </tr>
        <tr>
            <th>결제 건 수</th>
            <td>{{addComma code24_cnt}}</td>
            <td>{{addComma code25_cnt}}</td>
            <td>{{addComma code26_cnt}}</td>
            <td>{{addComma code27_cnt}}</td>
            <td>{{addComma code28_cnt}}</td>
            <td>{{addComma code29_cnt}}</td>
            <td>{{addComma code30_cnt}}</td>
            <td>{{addComma code31_cnt}}</td>
            <td>{{addComma code32_cnt}}</td>
            <td><b>{{addComma aos_total_cnt}}</b></td>
        </tr>
        <tr>
            <th>결제 수량</th>
            <td>{{addComma code24_cmt}}</td>
            <td>{{addComma code25_cmt}}</td>
            <td>{{addComma code26_cmt}}</td>
            <td>{{addComma code27_cmt}}</td>
            <td>{{addComma code28_cmt}}</td>
            <td>{{addComma code29_cmt}}</td>
            <td>{{addComma code30_cmt}}</td>
            <td>{{addComma code31_cmt}}</td>
            <td>{{addComma code32_cmt}}</td>
            <td><b>{{addComma aos_total_cmt}}</b></td>
        </tr>
        <tr style="color: #66a449;">
            <th>부가세 포함 금액</th>
            <td>{{addComma code24_amt}}</td>
            <td>{{addComma code25_amt}}</td>
            <td>{{addComma code26_amt}}</td>
            <td>{{addComma code27_amt}}</td>
            <td>{{addComma code28_amt}}</td>
            <td>{{addComma code29_amt}}</td>
            <td>{{addComma code30_amt}}</td>
            <td>{{addComma code31_amt}}</td>
            <td>{{addComma code32_amt}}</td>
            <td><b>{{addComma aos_total_amt}}</b></td>
        </tr>
        <tr style="color: #ff5600;">
            <th>부가세 제외 금액</th>
            <td>{{vatMinus code24_amt}}</td>
            <td>{{vatMinus code25_amt}}</td>
            <td>{{vatMinus code26_amt}}</td>
            <td>{{vatMinus code27_amt}}</td>
            <td>{{vatMinus code28_amt}}</td>
            <td>{{vatMinus code29_amt}}</td>
            <td>{{vatMinus code30_amt}}</td>
            <td>{{vatMinus code31_amt}}</td>
            <td>{{vatMinus code32_amt}}</td>
            <td><b>{{vatMinus aos_total_amt}}</b></td>
        </tr>
        <tr>
            <th>결제 비율</th>
            <td>({{payRate code24_cnt aos_total_cnt}}%)<br><b>{{payRate code24_amt aos_total_amt}}%</b></td>
            <td>({{payRate code25_cnt aos_total_cnt}}%)<br><b>{{payRate code25_amt aos_total_amt}}%</b></td>
            <td>({{payRate code26_cnt aos_total_cnt}}%)<br><b>{{payRate code26_amt aos_total_amt}}%</b></td>
            <td>({{payRate code27_cnt aos_total_cnt}}%)<br><b>{{payRate code27_amt aos_total_amt}}%</b></td>
            <td>({{payRate code28_cnt aos_total_cnt}}%)<br><b>{{payRate code28_amt aos_total_amt}}%</b></td>
            <td>({{payRate code29_cnt aos_total_cnt}}%)<br><b>{{payRate code29_amt aos_total_amt}}%</b></td>
            <td>({{payRate code30_cnt aos_total_cnt}}%)<br><b>{{payRate code30_amt aos_total_amt}}%</b></td>
            <td>({{payRate code31_cnt aos_total_cnt}}%)<br><b>{{payRate code31_amt aos_total_amt}}%</b></td>
            <td>({{payRate code32_cnt aos_total_cnt}}%)<br><b>{{payRate code32_amt aos_total_amt}}%</b></td>
            <td>({{payRate aos_total_cnt aos_total_cnt}}%)<br><b>{{payRate aos_total_amt aos_total_amt}}%</b></td>
        </tr>
        </tbody>
    </table>
</script>

<!-- 아이템별 IOS -->
<script type="text/x-handlebars-template" id="tmp-pay-ios-day-stat">
    <table class="table table-bordered mb0 _tableHeight">
        <colgroup>
            <col width="9.5%"/>
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
            <col width="8%"/>
        </colgroup>
        <tbody>
        <tr>
            <th class="_bgColor" data-bgcolor="#F1E7FB">
                <a href="javascript:void(0);" onclick="click_code();" class="_fontColor" data-fontcolor="black">◈ 아이템별 IOS</a>
            </th>
            <th>
                <img src="https://image.dalbitlive.com/store/charge/200612/charge_item_0010.png" width="25px"
                     height="25px">
                달 9
            </th>
            <th>
                <img src="https://image.dalbitlive.com/store/store_1.png" width="25px" height="25px">
                달 30<br/>(판매종료)
            </th>
            <th>
                <img src="https://image.dalbitlive.com/store/charge/200612/charge_item_0050.png" width="25px"
                     height="25px">
                달 45
            </th>
            <th>
                <img src="https://image.dalbitlive.com/store/charge/200612/charge_item_0100.png" width="25px"
                     height="25px">
                달 92
            </th>
            <th>
                <img src="https://image.dalbitlive.com/store/store_3.png" width="25px" height="25px">
                달 200
            </th>
            <th>
                <img src="https://image.dalbitlive.com/store/store_3.png" width="25px" height="25px">
                달 300<br/>(판매종료)
            </th>
            <th>
                <img src="https://image.dalbitlive.com/store/store_4.png" width="25px" height="25px">
                달 500
            </th>
            <th>
                <img src="https://image.dalbitlive.com/store/charge/200612/charge_item_1000.png" width="25px"
                     height="25px">
                달 838
            </th>
            <th>
                <img src="https://image.dalbitlive.com/store/store_5.png" width="25px" height="25px">
                달 1030<br/>(판매종료)
            </th>
            <th>
                <img src="https://image.dalbitlive.com/store/charge/200612/charge_item_2000.png" width="25px"
                     height="25px">
                달 1,530
            </th>
            <th>
                <img src="https://image.dalbitlive.com/store/store_6.png" width="25px" height="25px">
                달 2,080<br/>(판매종료)
            </th>
            <th>
                <img src="https://image.dalbitlive.com/store/store_6.png" width="25px" height="25px">
                달 2,300
            </th>
            <th>
                <img src="https://image.dalbitlive.com/store/charge/200612/charge_item_5000.png" width="25px"
                     height="25px">
                달 3,770
            </th>
            <th>총합</th>
        </tr>
        <tr>
            <th>결제 건 수</th>
            <td>{{addComma code16_cnt}}</td>
            <td>{{addComma code07_cnt}}</td>
            <td>{{addComma code17_cnt}}</td>
            <td>{{addComma code18_cnt}}</td>
            <td>{{addComma code08_cnt}}</td>
            <td>{{addComma code09_cnt}}</td>
            <td>{{addComma code10_cnt}}</td>
            <td>{{addComma code19_cnt}}</td>
            <td>{{addComma code11_cnt}}</td>
            <td>{{addComma code20_cnt}}</td>
            <td>{{addComma code12_cnt}}</td>
            <td>{{addComma code21_cnt}}</td>
            <td>{{addComma code22_cnt}}</td>
            <td><b>{{addComma ios_total_cnt}}</b></td>
        </tr>
        <tr>
            <th>결제 수량</th>
            <td>{{addComma code16_cmt}}</td>
            <td>{{addComma code07_cmt}}</td>
            <td>{{addComma code17_cmt}}</td>
            <td>{{addComma code18_cmt}}</td>
            <td>{{addComma code08_cmt}}</td>
            <td>{{addComma code09_cmt}}</td>
            <td>{{addComma code10_cmt}}</td>
            <td>{{addComma code19_cmt}}</td>
            <td>{{addComma code11_cmt}}</td>
            <td>{{addComma code20_cmt}}</td>
            <td>{{addComma code12_cmt}}</td>
            <td>{{addComma code21_cmt}}</td>
            <td>{{addComma code22_cmt}}</td>
            <td><b>{{addComma ios_total_cmt}}</b></td>
        </tr>
        <tr style="color: #66a449;">
            <th>부가세 포함 금액</th>
            <td>{{addComma code16_amt}}</td>
            <td>{{addComma code07_amt}}</td>
            <td>{{addComma code17_amt}}</td>
            <td>{{addComma code18_amt}}</td>
            <td>{{addComma code08_amt}}</td>
            <td>{{addComma code09_amt}}</td>
            <td>{{addComma code10_amt}}</td>
            <td>{{addComma code19_amt}}</td>
            <td>{{addComma code11_amt}}</td>
            <td>{{addComma code20_amt}}</td>
            <td>{{addComma code12_amt}}</td>
            <td>{{addComma code21_amt}}</td>
            <td>{{addComma code22_amt}}</td>
            <td><b>{{addComma ios_total_amt}}</b></td>
        </tr>
        <tr style="color: #ff5600;">
            <th>부가세 제외 금액</th>
            <td>{{vatMinus code16_amt}}</td>
            <td>{{vatMinus code07_amt}}</td>
            <td>{{vatMinus code17_amt}}</td>
            <td>{{vatMinus code18_amt}}</td>
            <td>{{vatMinus code08_amt}}</td>
            <td>{{vatMinus code09_amt}}</td>
            <td>{{vatMinus code10_amt}}</td>
            <td>{{vatMinus code19_amt}}</td>
            <td>{{vatMinus code11_amt}}</td>
            <td>{{vatMinus code20_amt}}</td>
            <td>{{vatMinus code12_amt}}</td>
            <td>{{vatMinus code21_amt}}</td>
            <td>{{vatMinus code22_amt}}</td>
            <td><b>{{vatMinus ios_total_amt}}</b></td>
        </tr>
        <tr>
            <th>결제 비율</th>
            <td>({{payRate code16_cnt ios_total_cnt}}%)<br><b>{{payRate code16_amt ios_total_amt}}%</b></td>
            <td>({{payRate code07_cnt ios_total_cnt}}%)<br><b>{{payRate code07_amt ios_total_amt}}%</b></td>
            <td>({{payRate code17_cnt ios_total_cnt}}%)<br><b>{{payRate code17_amt ios_total_amt}}%</b></td>
            <td>({{payRate code18_cnt ios_total_cnt}}%)<br><b>{{payRate code18_amt ios_total_amt}}%</b></td>
            <td>({{payRate code08_cnt ios_total_cnt}}%)<br><b>{{payRate code08_amt ios_total_amt}}%</b></td>
            <td>({{payRate code09_cnt ios_total_cnt}}%)<br><b>{{payRate code09_amt ios_total_amt}}%</b></td>
            <td>({{payRate code10_cnt ios_total_cnt}}%)<br><b>{{payRate code10_amt ios_total_amt}}%</b></td>
            <td>({{payRate code19_cnt ios_total_cnt}}%)<br><b>{{payRate code19_amt ios_total_amt}}%</b></td>
            <td>({{payRate code11_cnt ios_total_cnt}}%)<br><b>{{payRate code11_amt ios_total_amt}}%</b></td>
            <td>({{payRate code20_cnt ios_total_cnt}}%)<br><b>{{payRate code20_amt ios_total_amt}}%</b></td>
            <td>({{payRate code12_cnt ios_total_cnt}}%)<br><b>{{payRate code12_amt ios_total_amt}}%</b></td>
            <td>({{payRate code21_cnt ios_total_cnt}}%)<br><b>{{payRate code21_amt ios_total_amt}}%</b></td>
            <td>({{payRate code22_cnt ios_total_cnt}}%)<br><b>{{payRate code22_amt ios_total_amt}}%</b></td>
            <td>({{payRate ios_total_cnt ios_total_cnt}}%)<br><b>{{payRate ios_total_amt ios_total_amt}}%</b></td>
        </tr>
        </tbody>
    </table>
</script>

<script type="text/x-handlebars-template" id="tmp-history-list">
    <div class="dataTables_paginate paging_full_numbers" id="history-paginate-top"></div>
    <table id="history-table" class="table table-sorting table-hover table-bordered">
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
        </tr>
        </thead>
        <tbody id="history-table-body">
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
        </tr>
        {{else}}
        <tr>
            <td colspan="18">{{isEmptyData}}</td>
        </tr>
        {{/each}}
        </tbody>
    </table>
    <div class="dataTables_paginate paging_full_numbers" id="history-paginate-bottom"></div>
</script>
