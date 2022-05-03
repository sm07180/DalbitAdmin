<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 결제취소 > 총계 -->
<div class="widget widget-table mb10">
    <div class="widget-content mt10" id="divMonth_new">
        <%--<a href="javascript://" class="_prevSearch">[이전]</a>--%>
        <span class="_searchDate"></span>
        <div id="_paywayType" style="width:150px;"></div>
        <%--<a href="javascript://" class="_nextSearch">[다음]</a>--%>
        <table class="table table-bordered mb0 _tableHeight" data-height="23px">
            <colgroup>
                <col width="5%"/>
                <col width="4%"/>
                <col width="4%"/>
                <col width="4%"/>
                <col width="4%"/>
                <col width="4%"/>
                <col width="0.1%"/>
                <col width="4%"/>
                <col width="4%"/>
                <col width="4%"/>
                <col width="4%"/>
                <col width="4%"/>
                <col width="0.1%"/>
                <col width="4%"/>
                <col width="4%"/>
                <col width="4%"/>
                <col width="4%"/>
                <col width="4%"/>
                <col width="0.1%"/>
                <col width="4%"/>
                <col width="4%"/>
                <col width="4%"/>
                <col width="4%"/>
                <col width="4%"/>
            </colgroup>
            <thead>
            <tr style="background-color: #b4c7e7">
                <th rowspan="2"></th>
                <th class="_totalDate" colspan="5" id="month_new_th_2"></th>
                <td class="_noBorder"></td>
                <th class="_totalDate" colspan="5" id="month_new_th_1"></th>
                <td class="_noBorder"></td>
                <th class="_totalDate" colspan="5" id="month_new_th_0" style="background-color: #ffe699"></th>
                <td class="_noBorder"></td>
                <th colspan="5" title="평균 합계의 경우 반올림된 평균 데이터의 총합이라&#10;항목별 합계와 다소 오차가 생길 수 있습니다.">평균</th>
            </tr>
            <tr style="background-color: #dae3f3">
                <th>건수</th>
                <th>수량</th>
                <th>결제</th>
                <th>누적</th>
                <th>취소</th>
                <td class="_noBorder"></td>

                <th>건수</th>
                <th>수량</th>
                <th>결제</th>
                <th>누적</th>
                <th>취소</th>
                <td class="_noBorder"></td>

                <th style="background-color: #fff2cc">건수</th>
                <th style="background-color: #fff2cc">수량</th>
                <th style="background-color: #fff2cc">결제</th>
                <th style="background-color: #fff2cc">누적</th>
                <th style="background-color: #fff2cc">취소</th>
                <td class="_noBorder"></td>

                <th title="평균 합계의 경우 반올림된 평균 데이터의 총합이라&#10;항목별 합계와 다소 오차가 생길 수 있습니다.">건수</th>
                <th title="평균 합계의 경우 반올림된 평균 데이터의 총합이라&#10;항목별 합계와 다소 오차가 생길 수 있습니다.">수량</th>
                <th title="평균 합계의 경우 반올림된 평균 데이터의 총합이라&#10;항목별 합계와 다소 오차가 생길 수 있습니다.">결제</th>
                <th title="평균 합계의 경우 반올림된 평균 데이터의 총합이라&#10;항목별 합계와 다소 오차가 생길 수 있습니다.">누적</th>
                <th title="평균 합계의 경우 반올림된 평균 데이터의 총합이라&#10;항목별 합계와 다소 오차가 생길 수 있습니다.">취소</th>

            </tr>
            </thead>
            <tbody id="monthTableBody_new"></tbody>
        </table>

        <table class="table table-bordered _tableHeight" data-height="23px">
            <colgroup>
                <col width="5%"/>
                <col width="4%"/>
                <col width="4%"/>
                <col width="4%"/>
                <col width="4%"/>
                <col width="4%"/>
                <col width="0.1%"/>
                <col width="4%"/>
                <col width="4%"/>
                <col width="4%"/>
                <col width="4%"/>
                <col width="4%"/>
                <col width="0.1%"/>
                <col width="4%"/>
                <col width="4%"/>
                <col width="4%"/>
                <col width="4%"/>
                <col width="4%"/>
                <col width="0.1%"/>
                <col width="4%"/>
                <col width="4%"/>
                <col width="4%"/>
                <col width="4%"/>
                <col width="4%"/>
            </colgroup>
            <thead>
            <tr style="background-color: #b4c7e7">
                <th rowspan="2"></th>
                <th class="_totalDate" colspan="5" id="month_new_th_6"></th>
                <td class="_noBorder"></td>
                <th class="_totalDate" colspan="5" id="month_new_th_5"></th>
                <td class="_noBorder"></td>
                <th class="_totalDate" colspan="5" id="month_new_th_4"></th>
                <td class="_noBorder"></td>
                <th class="_totalDate" colspan="5" id="month_new_th_3"></th>
            </tr>
            <tr style="background-color: #dae3f3">
                <th>건수</th>
                <th>수량</th>
                <th>결제</th>
                <th>누적</th>
                <th>취소</th>
                <td class="_noBorder"></td>

                <th>건수</th>
                <th>수량</th>
                <th>결제</th>
                <th>누적</th>
                <th>취소</th>
                <td class="_noBorder"></td>

                <th>건수</th>
                <th>수량</th>
                <th>결제</th>
                <th>누적</th>
                <th>취소</th>
                <td class="_noBorder"></td>

                <th>건수</th>
                <th>수량</th>
                <th>결제</th>
                <th>누적</th>
                <th>취소</th>

            </tr>
            </thead>
            <tbody id="monthTableBody_new2"></tbody>
        </table>
    </div>
    <div class="widget-footer">
        <span>
            <%--<button class="btn btn-default print-btn pull-right" type="button" id="excelDownBtn"><i class="fa fa-print"></i>Excel Down</button>--%>
        </span>
    </div>
</div>
<a id='monthExcel_new' type='button' class="btn btn-default print-btn pull-right" download="" href="#"
   onclick="return ExcellentExport.excel(this, 'divMonth_new', 'Sheet1');"><i class="fa fa-print"></i>Excel Down</a>

<script type="text/javascript" src="/js/code/payment/payCodeList.js?${dummyData}"></script>
<script type="text/javascript">
  $(function () {
    $('#_paywayType').html(util.getCommonCodeSelect('all', payWay));

    $('#_paywayType').on('change', function () {
      getPayMonthWayList();
    });
  });

  // 31일 배열
  let monthWayDateDays = Array.from({length: 31}, (v, k) => k + 1).reverse();
  let monthWayMonth = [...Array(7).keys()];
  let curDay = moment().format('D');

  function preRenderMonthWayTable() {
    $("#monthExcel_new").attr('download', "결제현황_월간결제_" + moment($("#startDate").val()).add('days', 0).format('YYYY.MM.DD') + ".xls");

    let data = {
      slctType_date: monthWayDateDays
    };
    let template, templateScript, context, html

    template = $('#tmp_monthTableBody_new').html();
    templateScript = Handlebars.compile(template);
    context = data;
    html = templateScript(context);
    $("#monthTableBody_new").html(html);

    template = $('#tmp_monthTableBody_new2').html();
    templateScript = Handlebars.compile(template);
    context = data;
    html = templateScript(context);
    $("#monthTableBody_new2").html(html);

    let curDate = moment($("#startDate").val());
    monthWayMonth.map(function (item) {
      $('#month_new_th_' + item).text(curDate.format('YYYY.MM'));
      curDate.add('months', -1);
    });
  }

  function getPayMonthWayList() {
    preRenderMonthWayTable();

    let payWaySlct = $('#_paywayType select[name="payWay"]').val();
    let data = {
      tDate: $("#startDate").val().replace(/[.]/g, '-'),
      payWaySlct: payWaySlct === 'all' ? '' : payWaySlct,
    };
    util.getAjaxData("getPayTimeList", "/v2/rest/enter/pay/month", data, fn_paywayMonth_success);
  }

  function fn_paywayMonth_success(data, response) {
    let payWaySlct = $('#_paywayType select[name="payWay"]').val();
    payWaySlct === 'all' ? $('._totalHidden').show() : $('._totalHidden').hide();

    let canc_amt_sum = 0;   // 결제 취소 금액 누적합
    let canc_cmt_sum = 0;   // 결제 취소 수량 누적합
    let canc_cnt_sum = 0;   // 결제 취소 건 누적합
    let pay_amt_sum = 0;    // 결제 금액 누적합
    let succ_cmt_sum = 0;   // 결제 성공 수량 누적합
    let succ_cnt_sum = 0;   // 결제 성공 건 누적합
    let first_cnt_sum = 0;  // 첫구매 건 누적합
    let first_cmt_sum = 0;  // 첫구매 수량 누적합
    let first_amt_sum = 0;  // 첫구매 금액 누적합
    let re_cnt_sum = 0;     // 첫구매 건 누적합
    let re_cmt_sum = 0;     // 첫구매 건 누적합
    let re_amt_sum = 0;     // 첫구매 건 누적합

    let monthBody = {};
    let avgMonthBody = {};
    response.listData.map(function (item, index) {
      let the_month = item.the_date.substr(0, 7);
      let the_day = parseInt(item.the_date.substr(8, 2), 10);
      if (!monthBody[the_month]) {
        canc_amt_sum = 0;
        canc_cmt_sum = 0;
        canc_cnt_sum = 0;
        pay_amt_sum = 0;
        succ_cmt_sum = 0;
        succ_cnt_sum = 0;
        first_cnt_sum = 0;
        first_cmt_sum = 0;
        first_amt_sum = 0;
        re_cnt_sum = 0;
        re_cmt_sum = 0;
        re_amt_sum = 0;
        monthBody[the_month] = [];
      }
      if (!avgMonthBody[the_day]) {
        avgMonthBody[the_day] = {
          canc_amt_sum: 0,
          canc_amt: 0,
          canc_cmt_sum: 0,
          canc_cmt: 0,
          canc_cnt_sum: 0,
          canc_cnt: 0,
          pay_amt_sum: 0,
          pay_amt: 0,
          succ_cmt_sum: 0,
          succ_cmt: 0,
          succ_cnt_sum: 0,
          succ_cnt: 0,
          first_cnt_sum: 0,
          first_cnt: 0,
          first_cmt_sum: 0,
          first_cmt: 0,
          first_amt_sum: 0,
          first_amt: 0,
          re_cnt_sum: 0,
          re_cnt: 0,
          re_cmt_sum: 0,
          re_cmt: 0,
          re_amt_sum: 0,
          re_amt: 0
        };
      }

      canc_amt_sum += item.canc_amt;
      canc_cmt_sum += item.canc_cmt;
      canc_cnt_sum += item.canc_cnt;
      pay_amt_sum += item.pay_amt;
      succ_cmt_sum += item.succ_cmt;
      succ_cnt_sum += item.succ_cnt;
      first_cnt_sum += item.first_cnt;
      first_cmt_sum += item.first_cmt;
      first_amt_sum += item.first_amt;
      re_cnt_sum += item.re_cnt;
      re_cmt_sum += item.re_cmt;
      re_amt_sum += item.re_amt;

      item.canc_amt_sum = canc_amt_sum;
      item.canc_cmt_sum = canc_cmt_sum;
      item.canc_cnt_sum = canc_cnt_sum;
      item.pay_amt_sum = pay_amt_sum;
      item.succ_cmt_sum = succ_cmt_sum;
      item.succ_cnt_sum = succ_cnt_sum;
      item.first_cnt_sum = first_cnt_sum;
      item.first_cmt_sum = first_cmt_sum;
      item.first_amt_sum = first_amt_sum;
      item.re_cnt_sum = re_cnt_sum;
      item.re_cmt_sum = re_cmt_sum;
      item.re_amt_sum = re_amt_sum;

      item.the_month = the_month;
      item.the_day = the_day;
      monthBody[the_month].push(item)

      for (let k in avgMonthBody[the_day]) {
        avgMonthBody[the_day][k] += parseInt(item[k], 10);
      }
    });

    renderMonthWayData(monthBody, avgMonthBody);
    ui.paintColor();
    ui.tableHeightSet();
  }

  function renderMonthWayData(monthData, avgMonthData) {
    let step = 0;
    let totStep = 0;
    let index = 6;
    for (let k in monthData) {
      let monthCellData = monthData[k];
      let bodyName = (index > 2) ? 'monthTableBody_new2' : 'monthTableBody_new';
      step = (index === 2) ? 0 : step;
      totStep = (index === 2) ? 0 : totStep;

      monthCellData.map(function (item) {
        if (item.succ_cnt > 0) $("#" + bodyName + " tr.__tr_" + item.the_day + " td:eq(" + (step + 1) + ")").html(common.addComma(item.succ_cnt));
        if (item.succ_cnt > 0) $("#" + bodyName + " tr.__tr_" + item.the_day + " td:eq(" + (step + 2) + ")").html(common.addComma(item.succ_cmt));
        if (item.succ_cnt > 0) $("#" + bodyName + " tr.__tr_" + item.the_day + " td:eq(" + (step + 3) + ")").html(common.vatMinus(item.pay_amt));
        if (item.succ_cnt > 0) $("#" + bodyName + " tr.__tr_" + item.the_day + " td:eq(" + (step + 4) + ")").html(common.vatMinus(item.pay_amt_sum));
        if (item.canc_amt > 0) $("#" + bodyName + " tr.__tr_" + item.the_day + " td:eq(" + (step + 5) + ")").html(common.vatMinus(item.canc_amt));

        // 현재시간 스타일 적용
        if (curDay == item.the_day) {
          for (let m=1; m<6; m++) {
            $("#" + bodyName + " tr.__tr_" + item.the_day + " td:eq(" + (step + m) +  ")").css("background-color", "#e3ecfb");
            $("#" + bodyName + " tr.__tr_" + item.the_day + " td:eq(" + (step + m) +  ")").css("font-weight", "bold");
          }
          for (let m=1; m<6; m++) {
            $("#" + bodyName + " tr.__tr_" + item.the_day + " td:eq(" + (18 + m) +  ")").css("background-color", "#e3ecfb");
            $("#" + bodyName + " tr.__tr_" + item.the_day + " td:eq(" + (18 + m) +  ")").css("font-weight", "bold");
          }
        }

        // _tr_sum: 총계
        if (item.succ_cnt_sum > 0)  $("#" + bodyName + " tr.__tr_sum td:eq(" + (totStep + 1) + ")").html(common.addComma(item.succ_cnt_sum));
        if (item.succ_cmt_sum > 0)  $("#" + bodyName + " tr.__tr_sum td:eq(" + (totStep + 2) + ")").html(common.addComma(item.succ_cmt_sum));
        if (item.pay_amt_sum > 0)   $("#" + bodyName + " tr.__tr_sum td:eq(" + (totStep + 3) + ")").html(common.vatMinus(item.pay_amt_sum));
        if (item.canc_amt_sum > 0)  $("#" + bodyName + " tr.__tr_sum td:eq(" + (totStep + 4) + ")").html(common.vatMinus(item.canc_amt_sum));

        // _tr_first_buy: 첫구매
        if (item.first_cnt_sum > 0)  $("#" + bodyName + " tr.__tr_first_buy td:eq(" + (totStep + 1) + ")").html(common.addComma(item.first_cnt_sum));
        if (item.first_cmt_sum > 0)  $("#" + bodyName + " tr.__tr_first_buy td:eq(" + (totStep + 2) + ")").html(common.addComma(item.first_cmt_sum));
        if (item.first_amt_sum > 0)  $("#" + bodyName + " tr.__tr_first_buy td:eq(" + (totStep + 3) + ")").html(common.vatMinus(item.first_amt_sum));

        // _tr_re_buy: 재구매
        if (item.re_cnt_sum > 0)  $("#" + bodyName + " tr.__tr_re_buy td:eq(" + (totStep + 1) + ")").html(common.addComma(item.re_cnt_sum));
        if (item.re_cmt_sum > 0)  $("#" + bodyName + " tr.__tr_re_buy td:eq(" + (totStep + 2) + ")").html(common.addComma(item.re_cmt_sum));
        if (item.re_amt_sum > 0)  $("#" + bodyName + " tr.__tr_re_buy td:eq(" + (totStep + 3) + ")").html(common.vatMinus(item.re_amt_sum));
      });

      step += 6;
      totStep += 5;
      index--;
    }

    // 평균출력
    for (let e in avgMonthData) {
      let item = avgMonthData[e];
      if (item.succ_cnt > 0) $("#monthTableBody_new tr.__tr_" + e + " td:eq(" + (18 + 1) + ")").html(common.addComma((item.succ_cnt/7).toFixed(1)));
      if (item.succ_cnt > 0) $("#monthTableBody_new tr.__tr_" + e + " td:eq(" + (18 + 2) + ")").html(common.addComma((item.succ_cmt/7).toFixed(1)));
      if (item.succ_cnt > 0) $("#monthTableBody_new tr.__tr_" + e + " td:eq(" + (18 + 3) + ")").html(common.vatMinus((item.pay_amt/7).toFixed(1)));
      if (item.succ_cnt > 0) $("#monthTableBody_new tr.__tr_" + e + " td:eq(" + (18 + 4) + ")").html(common.vatMinus((item.pay_amt_sum/7).toFixed(1)));
      if (item.canc_amt > 0) $("#monthTableBody_new tr.__tr_" + e + " td:eq(" + (18 + 5) + ")").html(common.vatMinus((item.canc_amt/7).toFixed(1)));

      // _tr_sum: 총계
      if (item.succ_cnt_sum > 0)  $("#monthTableBody_new tr.__tr_sum td:eq(" + (15 + 1) + ")").html(common.addComma((item.succ_cnt_sum/7).toFixed(1)));
      if (item.succ_cmt_sum > 0)  $("#monthTableBody_new tr.__tr_sum td:eq(" + (15 + 2) + ")").html(common.addComma((item.succ_cmt_sum/7).toFixed(1)));
      if (item.pay_amt_sum > 0)   $("#monthTableBody_new tr.__tr_sum td:eq(" + (15 + 3) + ")").html(common.vatMinus((item.pay_amt_sum/7).toFixed(1)));
      if (item.canc_amt_sum > 0)  $("#monthTableBody_new tr.__tr_sum td:eq(" + (15 + 4) + ")").html(common.vatMinus((item.canc_amt_sum/7).toFixed(1)));

      // _tr_first_buy: 첫구매
      if (item.first_cnt_sum > 0)  $("#monthTableBody_new tr.__tr_first_buy td:eq(" + (15 + 1) + ")").html(common.addComma((item.first_cnt_sum/7).toFixed(1)));
      if (item.first_cmt_sum > 0)  $("#monthTableBody_new tr.__tr_first_buy td:eq(" + (15 + 2) + ")").html(common.addComma((item.first_cmt_sum/7).toFixed(1)));
      if (item.first_amt_sum > 0)  $("#monthTableBody_new tr.__tr_first_buy td:eq(" + (15 + 3) + ")").html(common.vatMinus((item.first_amt_sum/7).toFixed(1)));

      // _tr_re_buy: 재구매
      if (item.re_cnt_sum > 0)  $("#monthTableBody_new tr.__tr_re_buy td:eq(" + (15 + 1) + ")").html(common.addComma((item.re_cnt_sum/7).toFixed(1)));
      if (item.re_cmt_sum > 0)  $("#monthTableBody_new tr.__tr_re_buy td:eq(" + (15 + 2) + ")").html(common.addComma((item.re_cmt_sum/7).toFixed(1)));
      if (item.re_amt_sum > 0)  $("#monthTableBody_new tr.__tr_re_buy td:eq(" + (15 + 3) + ")").html(common.vatMinus((item.re_amt_sum/7).toFixed(1)));
    }
  }
</script>

<script type="text/x-handlebars-template" id="tmp_monthTableBody_new">
    <tr class="__tr_sum font-bold" style="color: #ff5600;">
        <td style="background-color: #dae3f3">총합</td>
        <td></td>
        <td></td>
        <td colspan="2"></td>
        <td></td>
        <td style="border-bottom: hidden;border-top: hidden"></td>
        <td></td>
        <td></td>
        <td colspan="2"></td>
        <td></td>
        <td style="border-bottom: hidden;border-top: hidden"></td>
        <td style="background-color: #FFF7E5"></td>
        <td style="background-color: #FFF7E5"></td>
        <td colspan="2" style="background-color: #FFF7E5"></td>
        <td style="background-color: #FFF7E5"></td>
        <td style="border-bottom: hidden;border-top: hidden"></td>
        <td title="평균 합계의 경우 반올림된 평균 데이터의 총합이라&#10;항목별 합계와 다소 오차가 생길 수 있습니다."></td>
        <td title="평균 합계의 경우 반올림된 평균 데이터의 총합이라&#10;항목별 합계와 다소 오차가 생길 수 있습니다."></td>
        <td colspan="2" title="평균 합계의 경우 반올림된 평균 데이터의 총합이라&#10;항목별 합계와 다소 오차가 생길 수 있습니다."></td>
        <td title="평균 합계의 경우 반올림된 평균 데이터의 총합이라&#10;항목별 합계와 다소 오차가 생길 수 있습니다."></td>
    </tr>
    <tr class="__tr_first_buy _totalHidden" style="background-color: #f2f2f2">
        <td class="font-bold">첫구매</td>
        <td></td>
        <td></td>
        <td colspan="2"></td>
        <td></td>
        <td style="border-bottom: hidden;border-top: hidden;background-color: white"></td>
        <td></td>
        <td></td>
        <td colspan="2"></td>
        <td></td>
        <td style="border-bottom: hidden;border-top: hidden;background-color: white"></td>
        <td style="background-color: #FFF7E5"></td>
        <td style="background-color: #FFF7E5"></td>
        <td colspan="2" style="background-color: #FFF7E5"></td>
        <td style="background-color: #FFF7E5"></td>
        <td style="border-bottom: hidden;border-top: hidden;background-color: white"></td>
        <td title="평균 합계의 경우 반올림된 평균 데이터의 총합이라&#10;항목별 합계와 다소 오차가 생길 수 있습니다."></td>
        <td title="평균 합계의 경우 반올림된 평균 데이터의 총합이라&#10;항목별 합계와 다소 오차가 생길 수 있습니다."></td>
        <td colspan="2" title="평균 합계의 경우 반올림된 평균 데이터의 총합이라&#10;항목별 합계와 다소 오차가 생길 수 있습니다."></td>
        <td title="평균 합계의 경우 반올림된 평균 데이터의 총합이라&#10;항목별 합계와 다소 오차가 생길 수 있습니다."></td>
    </tr>
    <tr class="__tr_re_buy _totalHidden" style="background-color: #f2f2f2">
        <td class="font-bold">재구매</td>
        <td></td>
        <td></td>
        <td colspan="2"></td>
        <td></td>
        <td style="border-bottom: hidden;border-top: hidden;background-color: white"></td>
        <td></td>
        <td></td>
        <td colspan="2"></td>
        <td></td>
        <td style="border-bottom: hidden;border-top: hidden;background-color: white"></td>
        <td style="background-color: #FFF7E5"></td>
        <td style="background-color: #FFF7E5"></td>
        <td colspan="2" style="background-color: #FFF7E5"></td>
        <td style="background-color: #FFF7E5"></td>
        <td style="border-bottom: hidden;border-top: hidden;background-color: white"></td>
        <td title="평균 합계의 경우 반올림된 평균 데이터의 총합이라&#10;항목별 합계와 다소 오차가 생길 수 있습니다."></td>
        <td title="평균 합계의 경우 반올림된 평균 데이터의 총합이라&#10;항목별 합계와 다소 오차가 생길 수 있습니다."></td>
        <td colspan="2" title="평균 합계의 경우 반올림된 평균 데이터의 총합이라&#10;항목별 합계와 다소 오차가 생길 수 있습니다."></td>
        <td title="평균 합계의 경우 반올림된 평균 데이터의 총합이라&#10;항목별 합계와 다소 오차가 생길 수 있습니다."></td>
    </tr>
    {{#each this.slctType_date}}
    <tr class="__tr_{{this}}">
        <td class="font-bold" style="background-color: #dae3f3">{{this}}</td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td style="border-bottom: hidden;border-top: hidden"></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td style="border-bottom: hidden;border-top: hidden"></td>
        <td style="background-color: #FFF7E5"></td>
        <td style="background-color: #FFF7E5"></td>
        <td style="background-color: #FFF7E5"></td>
        <td style="background-color: #FFF7E5"></td>
        <td style="background-color: #FFF7E5"></td>
        <td style="border-bottom: hidden;border-top: hidden"></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
    </tr>
    {{/each}}
</script>

<script type="text/x-handlebars-template" id="tmp_monthTableBody_new2">
    <tr class="__tr_sum font-bold" style="color: #ff5600;">
        <td style="background-color: #dae3f3">총합</td>
        <td></td>
        <td></td>
        <td colspan="2"></td>
        <td></td>
        <td style="border-bottom: hidden;border-top: hidden"></td>
        <td></td>
        <td></td>
        <td colspan="2"></td>
        <td></td>
        <td style="border-bottom: hidden;border-top: hidden"></td>
        <td></td>
        <td></td>
        <td colspan="2"></td>
        <td></td>
        <td style="border-bottom: hidden;border-top: hidden"></td>
        <td></td>
        <td></td>
        <td colspan="2"></td>
        <td></td>
    </tr>
    <tr class="__tr_first_buy _totalHidden" style="background-color: #f2f2f2">
        <td class="font-bold">첫구매</td>
        <td></td>
        <td></td>
        <td colspan="2"></td>
        <td></td>
        <td style="border-bottom: hidden;border-top: hidden;background-color: white"></td>
        <td></td>
        <td></td>
        <td colspan="2"></td>
        <td></td>
        <td style="border-bottom: hidden;border-top: hidden;background-color: white"></td>
        <td></td>
        <td></td>
        <td colspan="2"></td>
        <td></td>
        <td style="border-bottom: hidden;border-top: hidden;background-color: white"></td>
        <td></td>
        <td></td>
        <td colspan="2"></td>
        <td></td>
    </tr>
    <tr class="__tr_re_buy _totalHidden" style="background-color: #f2f2f2">
        <td class="font-bold">재구매</td>
        <td></td>
        <td></td>
        <td colspan="2"></td>
        <td></td>
        <td style="border-bottom: hidden;border-top: hidden;background-color: white"></td>
        <td></td>
        <td></td>
        <td colspan="2"></td>
        <td></td>
        <td style="border-bottom: hidden;border-top: hidden;background-color: white"></td>
        <td></td>
        <td></td>
        <td colspan="2"></td>
        <td></td>
        <td style="border-bottom: hidden;border-top: hidden;background-color: white"></td>
        <td></td>
        <td></td>
        <td colspan="2"></td>
        <td></td>
    </tr>
    {{#each this.slctType_date}}
    <tr class="__tr_{{this}}">
        <td class="font-bold" style="background-color: #dae3f3">{{this}}</td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td style="border-bottom: hidden;border-top: hidden"></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td style="border-bottom: hidden;border-top: hidden"></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td style="border-bottom: hidden;border-top: hidden"></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
    </tr>
    {{/each}}
</script>

