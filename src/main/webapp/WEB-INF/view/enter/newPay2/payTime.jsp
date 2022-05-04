<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 결제환불 > 총계 -->
<div class="widget widget-table mb10">
    <div class="widget-content mt10" id="divTime">
        <%--<a href="javascript://" class="_prevSearch">[이전]</a>--%>
        <span class="_searchDate"></span>
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
                <th class="_totalDate" colspan="5" id="time_th_2"></th>
                <td class="_noBorder"></td>
                <th class="_totalDate" colspan="5" id="time_th_1"></th>
                <td class="_noBorder"></td>
                <th class="_totalDate" colspan="5" id="time_th_0" style="background-color: #ffe699"></th>
                <td class="_noBorder"></td>
                <th colspan="5" id="time_th_avg" title="평균 합계의 경우 반올림된 평균 데이터의 총합이라&#10;항목별 합계와 다소 오차가 생길 수 있습니다.">평균
                </th>
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
            <tbody id="timeTableBody"></tbody>
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
                <th class="_totalDate" colspan="5" id="time_th_6"></th>
                <td class="_noBorder"></td>
                <th class="_totalDate" colspan="5" id="time_th_5"></th>
                <td class="_noBorder"></td>
                <th class="_totalDate" colspan="5" id="time_th_4"></th>
                <td class="_noBorder"></td>
                <th class="_totalDate" colspan="5" id="time_th_3"></th>
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
            <tbody id="timeTableBody2"></tbody>
        </table>
    </div>
    <div class="widget-footer">
        <span>
        </span>
    </div>
</div>
<a id='payTimeExcel' type='button' class="btn btn-default print-btn pull-right" download="" href="#"
   onclick="return ExcellentExport.excel(this, 'divTime', 'Sheet1');"><i class="fa fa-print"></i>Excel Down</a>

<script src="/js/lib/excellentexport.js"></script>
<script type="text/javascript">
  let dateHours = [...Array(24).keys()].reverse();
  let dateDays = [...Array(7).keys()];

  // 현재시간
  let curHour = moment().format('H');

    // 시간별 매출표 미리작성
  function preRenderTimeTable() {
    $("#payTimeExcel").attr('download', "결제현황_시간대별_" + moment($("#startDate").val()).add('days', 0).format('YYYY.MM.DD') + ".xls");

    let data = {
      slctType_date: dateHours
    };
    let template, templateScript, context, html;

    // tmp_timeTableBody 시간 내역 추가
    template = $('#tmp_timeTableBody').html();
    templateScript = Handlebars.compile(template);
    context = data;
    html = templateScript(context);
    $("#timeTableBody").html(html);

    // tmp_timeTableBody2 시간 내역 추가
    template = $('#tmp_timeTableBody2').html();
    templateScript = Handlebars.compile(template);
    context = data;
    html = templateScript(context);
    $("#timeTableBody2").html(html);

    // 각 표에 타이틀 추가: 현재날짜 -6 부터 0 까지
    let curDate = moment($("#startDate").val());
    dateDays.map(function (item) {
      $('#time_th_' + item).text(curDate.format('YYYY.MM.DD') + " (" + week[curDate.day()] + ")");
      curDate.add('days', -1);
    });
  }

  function getPayTimeList() {
    preRenderTimeTable();
    let data = {
      tDate: $("#startDate").val().replace(/[.]/g, '-')
    };
    util.getAjaxData("getPayTimeList", "/v2/rest/enter/pay/time", data, fn_payTime_success);
  }

  function fn_payTime_success(data, response) {
    let canc_amt_sum = 0;   // 일자별 결제 취소 금액 누적합
    let canc_cmt_sum = 0;   // 일자별 결제 취소 수량 누적합
    let canc_cnt_sum = 0;   // 일자별 결제 취소 건 누적합
    let fail_cnt_sum = 0;   // 일자별 결제 실패 건 누적합
    let pay_amt_sum = 0;    // 일자별 결제 금액 누적합
    let succ_cmt_sum = 0;   // 일자별 결제 성공 수량 누적합
    let succ_cnt_sum = 0;   // 일자별 결제 성공 건 누적합
    let try_cnt_sum = 0;    // 일자별 결제 시도 건 누적합
    let first_cnt_sum = 0;  // 일자별 첫구매 건 누적합
    let first_cmt_sum = 0;  // 일자별 첫구매 수량 누적합
    let first_amt_sum = 0;  // 일자별 첫구매 금액 누적합
    let re_cnt_sum = 0;     // 일자별 첫구매 건 누적합
    let re_cmt_sum = 0;     // 일자별 첫구매 건 누적합
    let re_amt_sum = 0;     // 일자별 첫구매 건 누적합

    let dayBody = {};
    let avgBody = {};
    response.listData.map(function (item, index) {
      if (!dayBody[item.the_date]) {
        canc_amt_sum = 0;
        canc_cmt_sum = 0;
        canc_cnt_sum = 0;
        fail_cnt_sum = 0;
        pay_amt_sum = 0;
        succ_cmt_sum = 0;
        succ_cnt_sum = 0;
        try_cnt_sum = 0;
        first_cnt_sum = 0;
        first_cmt_sum = 0;
        first_amt_sum = 0;
        re_cnt_sum = 0;
        re_cmt_sum = 0;
        re_amt_sum = 0;
        dayBody[item.the_date] = [];
      }
      if (!avgBody[item.the_hr]) {
        avgBody[item.the_hr] = {
          canc_amt_sum: 0,
          canc_amt: 0,
          canc_cmt_sum: 0,
          canc_cmt: 0,
          canc_cnt_sum: 0,
          canc_cnt: 0,
          fail_cnt_sum: 0,
          fail_cnt: 0,
          pay_amt_sum: 0,
          pay_amt: 0,
          succ_cmt_sum: 0,
          succ_cmt: 0,
          succ_cnt_sum: 0,
          succ_cnt: 0,
          try_cnt_sum: 0,
          try_cnt: 0,
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
      fail_cnt_sum += item.fail_cnt;
      pay_amt_sum += item.pay_amt;
      succ_cmt_sum += item.succ_cmt;
      succ_cnt_sum += item.succ_cnt;
      try_cnt_sum += item.try_cnt;
      first_cnt_sum += item.first_cnt;
      first_cmt_sum += item.first_cmt;
      first_amt_sum += item.first_amt;
      re_cnt_sum += item.re_cnt;
      re_cmt_sum += item.re_cmt;
      re_amt_sum += item.re_amt;

      item.canc_amt_sum = canc_amt_sum;
      item.canc_cmt_sum = canc_cmt_sum;
      item.canc_cnt_sum = canc_cnt_sum;
      item.fail_cnt_sum = fail_cnt_sum;
      item.pay_amt_sum = pay_amt_sum;
      item.succ_cmt_sum = succ_cmt_sum;
      item.succ_cnt_sum = succ_cnt_sum;
      item.try_cnt_sum = try_cnt_sum;
      item.first_cnt_sum = first_cnt_sum;
      item.first_cmt_sum = first_cmt_sum;
      item.first_amt_sum = first_amt_sum;
      item.re_cnt_sum = re_cnt_sum;
      item.re_cmt_sum = re_cmt_sum;
      item.re_amt_sum = re_amt_sum;
      dayBody[item.the_date].push(item)

      for (let k in avgBody[item.the_hr]) {
        avgBody[item.the_hr][k] += parseInt(item[k], 10);
      }
    });

    // 데이터 출력
    renderTimeData(dayBody, avgBody, response.avgState);
    ui.paintColor();
    ui.tableHeightSet();
  }

  // 시간별 데이터 출력
  function renderTimeData(dayData, avgData, avgState) {
    let step = 0;
    let totStep = 0;
    let index = 6;
    for (let k in dayData) {
      let dayCellData = dayData[k];
      let bodyName = (index > 2) ? 'timeTableBody2' : 'timeTableBody';
      step = (index === 2) ? 0 : step;
      totStep = (index === 2) ? 0 : totStep;

      dayCellData.map(function (item) {
        if (item.succ_cnt > 0) {
          $("#" + bodyName + " tr._tr_" + item.the_hr + " td:eq(" + (step + 1) + ")").find('._data').html(common.addComma(item.succ_cnt));
          $("#" + bodyName + " tr._tr_" + item.the_hr + " td:eq(" + (step + 1) + ")").data("hour", item.the_hr);
          $("#" + bodyName + " tr._tr_" + item.the_hr + " td:eq(" + (step + 1) + ")").data("sDate", item.the_date);
        }
        if (item.succ_cnt > 0) $("#" + bodyName + " tr._tr_" + item.the_hr + " td:eq(" + (step + 2) + ")").html(common.addComma(item.succ_cmt));
        if (item.succ_cnt > 0) $("#" + bodyName + " tr._tr_" + item.the_hr + " td:eq(" + (step + 3) + ")").html(common.vatMinus(item.pay_amt));
        if (item.succ_cnt > 0) $("#" + bodyName + " tr._tr_" + item.the_hr + " td:eq(" + (step + 4) + ")").html(common.vatMinus(item.pay_amt_sum));
        if (item.canc_amt > 0) $("#" + bodyName + " tr._tr_" + item.the_hr + " td:eq(" + (step + 5) + ")").html(common.vatMinus(item.canc_amt));

        // 현재시간 스타일 적용
        if (curHour == item.the_hr) {
          for (let m=1; m<6; m++) {
            $("#" + bodyName + " tr._tr_" + item.the_hr + " td:eq(" + (step + m) +  ")").css("background-color", "#e3ecfb");
            $("#" + bodyName + " tr._tr_" + item.the_hr + " td:eq(" + (step + m) +  ")").css("font-weight", "bold");
          }
          for (let m=1; m<6; m++) {
            $("#" + bodyName + " tr._tr_" + item.the_hr + " td:eq(" + (18 + m) +  ")").css("background-color", "#e3ecfb");
            $("#" + bodyName + " tr._tr_" + item.the_hr + " td:eq(" + (18 + m) +  ")").css("font-weight", "bold");
          }
        }

        // _tr_sum: 총계
        if (item.succ_cnt_sum > 0)  $("#" + bodyName + " tr._tr_sum td:eq(" + (totStep + 1) + ")").html(common.addComma(item.succ_cnt_sum));
        if (item.succ_cmt_sum > 0)  $("#" + bodyName + " tr._tr_sum td:eq(" + (totStep + 2) + ")").html(common.addComma(item.succ_cmt_sum));
        if (item.pay_amt_sum > 0)   $("#" + bodyName + " tr._tr_sum td:eq(" + (totStep + 3) + ")").html(common.vatMinus(item.pay_amt_sum));
        if (item.canc_amt_sum > 0)  $("#" + bodyName + " tr._tr_sum td:eq(" + (totStep + 4) + ")").html(common.vatMinus(item.canc_amt_sum));

        // _tr_first_buy: 첫구매
        if (item.first_cnt_sum > 0)  $("#" + bodyName + " tr._tr_first_buy td:eq(" + (totStep + 1) + ")").html(common.addComma(item.first_cnt_sum));
        if (item.first_cmt_sum > 0)  $("#" + bodyName + " tr._tr_first_buy td:eq(" + (totStep + 2) + ")").html(common.addComma(item.first_cmt_sum));
        if (item.first_amt_sum > 0)  $("#" + bodyName + " tr._tr_first_buy td:eq(" + (totStep + 3) + ")").html(common.vatMinus(item.first_amt_sum));

        // _tr_re_buy: 재구매
        if (item.re_cnt_sum > 0)  $("#" + bodyName + " tr._tr_re_buy td:eq(" + (totStep + 1) + ")").html(common.addComma(item.re_cnt_sum));
        if (item.re_cmt_sum > 0)  $("#" + bodyName + " tr._tr_re_buy td:eq(" + (totStep + 2) + ")").html(common.addComma(item.re_cmt_sum));
        if (item.re_amt_sum > 0)  $("#" + bodyName + " tr._tr_re_buy td:eq(" + (totStep + 3) + ")").html(common.vatMinus(item.re_amt_sum));
      });

      step += 6;
      totStep += 5;
      index--;
    }

    // #time_th_avg 총합
    // 평균출력
    for (let e in avgData) {
      let item = avgData[e];
      if (item.succ_cnt > 0) $("#timeTableBody tr._tr_" + e + " td:eq(" + (18 + 1) + ")").html(common.addComma((item.succ_cnt/7).toFixed(1)));
      if (item.succ_cnt > 0) $("#timeTableBody tr._tr_" + e + " td:eq(" + (18 + 2) + ")").html(common.addComma((item.succ_cmt/7).toFixed(1)));
      if (item.succ_cnt > 0) $("#timeTableBody tr._tr_" + e + " td:eq(" + (18 + 3) + ")").html(common.vatMinus((item.pay_amt/7).toFixed(1)));
      if (item.succ_cnt > 0) $("#timeTableBody tr._tr_" + e + " td:eq(" + (18 + 4) + ")").html(common.vatMinus((item.pay_amt_sum/7).toFixed(1)));
      if (item.canc_amt > 0) $("#timeTableBody tr._tr_" + e + " td:eq(" + (18 + 5) + ")").html(common.vatMinus((item.canc_amt/7).toFixed(1)));

      // _tr_sum: 총계
      if (item.succ_cnt_sum > 0)  $("#timeTableBody tr._tr_sum td:eq(" + (15 + 1) + ")").html(common.addComma((item.succ_cnt_sum/7).toFixed(1)));
      if (item.succ_cmt_sum > 0)  $("#timeTableBody tr._tr_sum td:eq(" + (15 + 2) + ")").html(common.addComma((item.succ_cmt_sum/7).toFixed(1)));
      if (item.pay_amt_sum > 0)   $("#timeTableBody tr._tr_sum td:eq(" + (15 + 3) + ")").html(common.vatMinus((item.pay_amt_sum/7).toFixed(1)));
      if (item.canc_amt_sum > 0)  $("#timeTableBody tr._tr_sum td:eq(" + (15 + 4) + ")").html(common.vatMinus((item.canc_amt_sum/7).toFixed(1)));

      // _tr_first_buy: 첫구매
      if (item.first_cnt_sum > 0)  $("#timeTableBody tr._tr_first_buy td:eq(" + (15 + 1) + ")").html(common.addComma((item.first_cnt_sum/7).toFixed(1)));
      if (item.first_cmt_sum > 0)  $("#timeTableBody tr._tr_first_buy td:eq(" + (15 + 2) + ")").html(common.addComma((item.first_cmt_sum/7).toFixed(1)));
      if (item.first_amt_sum > 0)  $("#timeTableBody tr._tr_first_buy td:eq(" + (15 + 3) + ")").html(common.vatMinus((item.first_amt_sum/7).toFixed(1)));

      // _tr_re_buy: 재구매
      if (item.re_cnt_sum > 0)  $("#timeTableBody tr._tr_re_buy td:eq(" + (15 + 1) + ")").html(common.addComma((item.re_cnt_sum/7).toFixed(1)));
      if (item.re_cmt_sum > 0)  $("#timeTableBody tr._tr_re_buy td:eq(" + (15 + 2) + ")").html(common.addComma((item.re_cmt_sum/7).toFixed(1)));
      if (item.re_amt_sum > 0)  $("#timeTableBody tr._tr_re_buy td:eq(" + (15 + 3) + ")").html(common.vatMinus((item.re_amt_sum/7).toFixed(1)));
    }
  }

  function hourClick(tmp) {
    if (tmp.hour > -1) {
      var popupUrl = "/enter/newPay2/popup/history?sDate=" + tmp.sDate + "&eDate=" + tmp.sDate + "&gender=null&time=" + tmp.hour + "&age=null";
      util.windowOpen(popupUrl, "1550", "885", "결제목록");
    } else {
      alert('데이터가 없습니다.');
    }
  }

  $(document).ready(function () {

  });
</script>

<script type="text/x-handlebars-template" id="tmp_timeTableBody">
    <tr class="_tr_sum font-bold" style="color: #ff5600;">
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
        <td title="평균 합계의 경우 반올림된 평균 데이터의 총합이라&#10;항목별 합계와 다소 오차가 생길 수 있습니다." colspan="2"></td>
        <td title="평균 합계의 경우 반올림된 평균 데이터의 총합이라&#10;항목별 합계와 다소 오차가 생길 수 있습니다."></td>
    </tr>
    <tr class="_tr_first_buy" style="background-color: #f2f2f2">
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
        <td title="평균 합계의 경우 반올림된 평균 데이터의 총합이라&#10;항목별 합계와 다소 오차가 생길 수 있습니다." colspan="2"></td>
        <td title="평균 합계의 경우 반올림된 평균 데이터의 총합이라&#10;항목별 합계와 다소 오차가 생길 수 있습니다."></td>
    </tr>
    <tr class="_tr_re_buy" style="background-color: #f2f2f2">
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
        <td title="평균 합계의 경우 반올림된 평균 데이터의 총합이라&#10;항목별 합계와 다소 오차가 생길 수 있습니다." colspan="2"></td>
        <td title="평균 합계의 경우 반올림된 평균 데이터의 총합이라&#10;항목별 합계와 다소 오차가 생길 수 있습니다."></td>
    </tr>
    {{#each this.slctType_date}}
    <tr class="_tr_{{this}}">
        <td class="font-bold" style="background-color: #dae3f3">{{this}}시</td>
        <td onclick="hourClick($(this).data())">
            <a href="javascript://"><span class="_data _fontColor" data-fontcolor="#555"></span></a>
        </td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td style="border-bottom: hidden;border-top: hidden"></td>
        <td onclick="hourClick($(this).data())">
            <a href="javascript://"><span class="_data _fontColor" data-fontcolor="#555"></span></a>
        </td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td style="border-bottom: hidden;border-top: hidden"></td>
        <td onclick="hourClick($(this).data())" style="background-color: #FFF7E5">
            <a href="javascript://"><span class="_data _fontColor" data-fontcolor="#555"></span></a>
        </td>
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

<script type="text/x-handlebars-template" id="tmp_timeTableBody2">
    <tr class="_tr_sum font-bold" style="color: #ff5600;">
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
    <tr class="_tr_first_buy" style="background-color: #f2f2f2">
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
    <tr class="_tr_re_buy" style="background-color: #f2f2f2">
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
    <tr class="_tr_{{this}}">
        <td class="font-bold" style="background-color: #dae3f3">{{this}}시</td>
        <td onclick="hourClick($(this).data())">
            <a href="javascript://"><span class="_data _fontColor" data-fontcolor="#555"></span></a>
        </td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td style="border-bottom: hidden;border-top: hidden"></td>
        <td onclick="hourClick($(this).data())">
            <a href="javascript://"><span class="_data _fontColor" data-fontcolor="#555"></span></a>
        </td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td style="border-bottom: hidden;border-top: hidden"></td>
        <td onclick="hourClick($(this).data())">
            <a href="javascript://"><span class="_data _fontColor" data-fontcolor="#555"></span></a>
        </td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td style="border-bottom: hidden;border-top: hidden"></td>
        <td onclick="hourClick($(this).data())">
            <a href="javascript://"><span class="_data _fontColor" data-fontcolor="#555"></span></a>
        </td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
    </tr>
    {{/each}}
</script>