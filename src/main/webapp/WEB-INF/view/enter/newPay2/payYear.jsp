<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 결제환불 > 총계 -->
<div class="widget widget-table mb10">
    <div class="widget-content mt10" id="divYear">
        <%--<a href="javascript://" class="_prevSearch">[이전]</a>--%>
        <span class="_searchDate"></span>
        <%--<a href="javascript://" class="_nextSearch">[다음]</a>--%>
        <div class="col-md-12 no-padding">
            <table class="table table-bordered mb0 _tableHeight" data-height="23px">
                <colgroup>
                    <col width="12.5%"/>
                    <col width="12.5%"/>
                    <col width="12.5%"/>
                    <col width="12.5%"/>
                    <col width="12.5%"/>
                    <col width="12.5%"/>
                </colgroup>
                <thead>
                <tr style="background-color: #b4c7e7">
                    <th rowspan="2"></th>
                    <th class="_totalDate" colspan="5" id="year_th_0"></th>
                </tr>
                <tr style="background-color: #dae3f3">
                    <th>건수</th>
                    <th>수량</th>
                    <th>결제</th>
                    <th>누적</th>
                    <th>취소</th>
                </tr>
                </thead>
                <tbody id="yearTableBody"></tbody>
            </table>
        </div>
        <div class="col-md-12 no-padding">
            <label class="font-bold" style="color: blue">※결제 수단 별</label>
            <table class="table table-bordered" style="font:message-box;">
                <thead>
                <tr>
                    <th rowspan="2" class="_stateTopTh"></th>
                    <th colspan="3" class="_stateTopTh">총계</th>
                    <th colspan="3" class="_stateTopTh">휴대폰<i class="fa fa-tablet"></i></th>
                    <th colspan="3" class="_stateTopTh">카드<i class="fa fa-credit-card"></i></th>
                    <th colspan="3" class="_stateTopTh">인앱결제<br/>(IOS)<i class="fa fa-apple"></i></th>
                    <th colspan="3" class="_stateTopTh">인앱결제<br/>(AOS)<i class="fa fa-android"></i></th>
                    <th colspan="3" class="_stateTopTh">가상계좌이체<i class="fa fa-money"></i></th>
                    <th colspan="3" class="_stateTopTh">문화상품권<i class="fa fa-barcode"></i></th>
                    <th colspan="3" class="_stateTopTh">해피머니<br/>상품권<i class="fa fa-smile-o"></i></th>
                    <th colspan="3" class="_stateTopTh">티머니<i class="fa fa-bus"></i></th>
                    <th colspan="3" class="_stateTopTh">캐시비<i class="fa fa-forumbee"></i></th>
                    <th colspan="3" class="_stateTopTh">페이코<i class="fa fa-paypal"></i></th>
                    <th colspan="3" class="_stateTopTh">카카오페이<i class="fa fa-comment"></i></th>
                    <th colspan="3" class="_stateTopTh">카카오머니<i class="fa fa-comment"></i></th>
                    <th colspan="3" class="_stateTopTh">간편결제<br/>(계좌)<i class="fa fa-money"></i></th>
                </tr>
                <tr>
                    <th class="_stateSubTh">건<br/>(비율)</th>
                    <th class="_stateSubTh">수량<br/>(비율)</th>
                    <th class="_stateSubTh">금액<br/>(비율)</th>
                    <th class="_stateSubTh">건</th>
                    <th class="_stateSubTh">수량</th>
                    <th class="_stateSubTh">금액</th>
                    <th class="_stateSubTh">건</th>
                    <th class="_stateSubTh">수량</th>
                    <th class="_stateSubTh">금액</th>
                    <th class="_stateSubTh">건</th>
                    <th class="_stateSubTh">수량</th>
                    <th class="_stateSubTh">금액</th>
                    <th class="_stateSubTh">건</th>
                    <th class="_stateSubTh">수량</th>
                    <th class="_stateSubTh">금액</th>
                    <th class="_stateSubTh">건</th>
                    <th class="_stateSubTh">수량</th>
                    <th class="_stateSubTh">금액</th>
                    <th class="_stateSubTh">건</th>
                    <th class="_stateSubTh">수량</th>
                    <th class="_stateSubTh">금액</th>
                    <th class="_stateSubTh">건</th>
                    <th class="_stateSubTh">수량</th>
                    <th class="_stateSubTh">금액</th>
                    <th class="_stateSubTh">건</th>
                    <th class="_stateSubTh">수량</th>
                    <th class="_stateSubTh">금액</th>
                    <th class="_stateSubTh">건</th>
                    <th class="_stateSubTh">수량</th>
                    <th class="_stateSubTh">금액</th>
                    <th class="_stateSubTh">건</th>
                    <th class="_stateSubTh">수량</th>
                    <th class="_stateSubTh">금액</th>
                    <th class="_stateSubTh">건</th>
                    <th class="_stateSubTh">수량</th>
                    <th class="_stateSubTh">금액</th>
                    <th class="_stateSubTh">건</th>
                    <th class="_stateSubTh">수량</th>
                    <th class="_stateSubTh">금액</th>
                    <th class="_stateSubTh">건</th>
                    <th class="_stateSubTh">수량</th>
                    <th class="_stateSubTh">금액</th>
                </tr>
                </thead>
                <tbody id="wayYearTableBody"></tbody>
            </table>
        </div>
    </div>
    <div class="col-md-12 no-padding">
        <div class="main-content">
            <div class="widget">
                <div class="widget-content">
                    <div id='barArea' style="display: none"></div>
                </div>
            </div>
        </div>
    </div>
    <div class="widget-footer">
        <span>
            <%--<button class="btn btn-default print-btn pull-right" type="button" id="excelDownBtn"><i class="fa fa-print"></i>Excel Down</button>--%>
        </span>
    </div>
</div>

<a id='yearExcel' type='button' class="btn btn-default print-btn pull-right" download="" href="#"
   onclick="return ExcellentExport.excel(this, 'divYear', 'Sheet1');"><i class="fa fa-print"></i>Excel Down</a>

<script src='/js/lib/plotly-latest.min.js'></script>
<script type="text/javascript">
  $(function () {
  });

  let curMonth = moment().format('M');

  function preRenderYearTable() {
    $("#yearExcel").attr('download', "결제현황_연간결제_" + moment($("#startDate").val()).add('days', 0).format('YYYY.MM.DD') + ".xls");
    $("#year_th_0").text(moment($("#startDate").val()).add('years', 0).format('YYYY'));

    $("#yearTableBody").empty();
    $("#wayYearTableBody").empty();
    $("#barArea").hide();
  }

  function getPayYearList() {
    preRenderYearTable();

    let data = {
      tDate: $("#startDate").val().replace(/[.]/g, '-'),
    };
    util.getAjaxData("getPayYearList", "/v2/rest/enter/pay/year", data, fn_payYear_success);
  }

  let yearStateData = {
    monthSum: {},
    monthStateList: [],
    monthPaywayList: [],
    monthStep: [],
  };

  function fn_payYear_success(data, response) {
    yearStateData.monthSum = response.state;
    yearStateData.monthStateList = response.stateList;
    yearStateData.monthPaywayList = response.paywayList;
    yearStateData.monthStep = Array.from({length: response.stateList.length}, (v, k) => (k + 1) + ' 월').reverse();

    renderYearState();
    renderYearPayway();
    chart();
    ui.tableHeightSet();
  }

  // 연간결제 통계
  function renderYearState() {
    $('#yearTableBody').empty();
    let template, templateScript, context, html;

    let data = {
      slctType_date: yearStateData.monthStep
    }
    template = $('#tmp_yearTableBody').html();
    templateScript = Handlebars.compile(template);
    context = data;
    html = templateScript(context);
    $("#yearTableBody").html(html);

    let canc_amt_sum = 0;
    let pay_amt_sum = 0;
    let succ_cmt_sum = 0;
    let succ_cnt_sum = 0;

    let yearCellData = yearStateData.monthStateList.map(function (item) {
      canc_amt_sum += item.canc_amt;
      pay_amt_sum += item.pay_amt;
      succ_cmt_sum += item.succ_cmt;
      succ_cnt_sum += item.succ_cnt;

      item.canc_amt_sum = canc_amt_sum;
      item.pay_amt_sum = pay_amt_sum;
      item.succ_cmt_sum = succ_cmt_sum;
      item.succ_cnt_sum = succ_cnt_sum;
      return item;
    });

    // 연간 - 월별 데이터
    yearCellData.map(function (item) {
      if (item.succ_cnt > 0) $("#yearTableBody tr._tr_" + item.the_date + " td:eq(1)").html(common.addComma(item.succ_cnt));
      if (item.succ_cmt > 0) $("#yearTableBody tr._tr_" + item.the_date + " td:eq(2)").html(common.addComma(item.succ_cmt));
      if (item.pay_amt > 0) $("#yearTableBody tr._tr_" + item.the_date + " td:eq(3)").html(common.vatMinus(item.pay_amt));
      if (item.pay_amt_sum > 0) $("#yearTableBody tr._tr_" + item.the_date + " td:eq(4)").html(common.vatMinus(item.pay_amt_sum));
      if (item.canc_amt > 0) $("#yearTableBody tr._tr_" + item.the_date + " td:eq(5)").html(common.vatMinus(item.canc_amt));

      if (curMonth == item.the_date) {
        for (let i = 1; i < 6; i++) {
          $("#yearTableBody tr._tr_" + curMonth + " td:eq(" + (i) + ")").css("font-weight", "bold");
        }
      }
    });

    // 총합
    $("#yearTableBody tr._tr_sum td:eq(1)").html(common.addComma(succ_cnt_sum));
    $("#yearTableBody tr._tr_sum td:eq(2)").html(common.addComma(succ_cmt_sum));
    $("#yearTableBody tr._tr_sum td:eq(3)").html(common.vatMinus(pay_amt_sum));
    $("#yearTableBody tr._tr_sum td:eq(4)").html(common.addComma(canc_amt_sum));

    // 첫구매
    $("#yearTableBody tr._tr_first_buy td:eq(1)").html(common.addComma(yearStateData.monthSum.first_cnt));
    $("#yearTableBody tr._tr_first_buy td:eq(2)").html(common.addComma(yearStateData.monthSum.first_cmt));
    $("#yearTableBody tr._tr_first_buy td:eq(3)").html(common.vatMinus(yearStateData.monthSum.first_amt));

    // 재구매
    $("#yearTableBody tr._tr_re_buy td:eq(1)").html(common.addComma(yearStateData.monthSum.re_cnt));
    $("#yearTableBody tr._tr_re_buy td:eq(2)").html(common.addComma(yearStateData.monthSum.re_cmt));
    $("#yearTableBody tr._tr_re_buy td:eq(3)").html(common.vatMinus(yearStateData.monthSum.re_amt));
  }

  // 결제수단별
  function renderYearPayway() {
    $('#wayYearTableBody').empty();
    let template, templateScript, context, html;

    let monthPaywaySumData = {}; // 총합 및 소계
    yearStateData.monthPaywayList.map(function (item) {
      for (let k in item) {
        if (k !== 'the_date') {
          if (!monthPaywaySumData[k + '_sum']) monthPaywaySumData[k + '_sum'] = 0;
          monthPaywaySumData[k + '_sum'] += item[k];
        }
      }
    });

    // 월별 총합 추가
    let monthPaywayCellData = yearStateData.monthPaywayList.map(function (item) {
      item.total_cnt_sum = monthPaywaySumData.total_cnt_sum;
      item.total_cmt_sum = monthPaywaySumData.total_cmt_sum;
      item.total_amt_sum = monthPaywaySumData.total_amt_sum;
      return item;
    });

    // 상단 소계
    template = $('#tmp_wayYear').html();
    templateScript = Handlebars.compile(template);
    context = monthPaywaySumData;
    let total_html = templateScript(context);
    $("#wayYearTableBody").append(total_html);

    // 월별 데이터
    template = $('#tmp_wayYearDetailList').html();
    templateScript = Handlebars.compile(template);
    context = monthPaywayCellData;
    html = templateScript(context);
    $("#wayYearTableBody").append(html);

    // 하단 소계
    $("#wayYearTableBody").append(total_html);
  }

  function chart() {
    return;
    $("#barArea").show();

    yearResponseData = yearResponseData[1].detailList;
    var sortingField = "monthly";
    yearResponseData.sort(function (a, b) { // 오름차순
      return a[sortingField] - b[sortingField];
    });

    var xList = [];
    var yList = [];
    for (var i = 0; i < (yearResponseData.length); i++) {
      if (yearResponseData[i].monthly != 0) {
        xList.push(yearResponseData[i].monthly + "월");
        yList.push(common.vatMinus(yearResponseData[i].succAmt));
      }
    }
    //console.log(yList);
    var year = {
      type: 'bar',
      x: xList,
      y: yList,
      marker: {
        color: '#e48701',
        line: {
          width: 0
        }
      }
    };
    var data = [year];
    var layout = {
      autosize: true,
      /*width:'100%',
      height:500,*/
      font: {size: 13},
      xaxis: {
        autorange: true,
      },
      yaxis: {
        tickformat: ",d"
      },
      separators: '.,',
      legend: {
        y: 1,
        y: 1,
        traceorder: 'reversed',
      }
    };
    var config = {responsive: false};
    Plotly.newPlot('barArea', data, layout, config);
  }


</script>

<script type="text/x-handlebars-template" id="tmp_yearTableBody">
    <tr class="_tr_sum font-bold" style="color: #ff5600;">
        <td style="background-color: #dae3f3">총합</td>
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
    </tr>
    <tr class="_tr_re_buy" style="background-color: #f2f2f2">
        <td class="font-bold">재구매</td>
        <td></td>
        <td></td>
        <td colspan="2"></td>
        <td></td>
    </tr>
    {{#each this.slctType_date}}
    <tr class="_tr_{{this}}">
        <td class="font-bold" style="background-color: #dae3f3">{{this}}</td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
    </tr>
    {{/each}}
</script>

<script type="text/x-handlebars-template" id="tmp_wayYear">
    <tr class="font-bold _stateSumTd">
        <td>소계</td>
        <td style="font-weight:bold;color: #ff5600;">{{addComma total_cnt_sum}}<br/>({{average total_cnt_sum total_cnt_sum}}%)</td>
        <td style="font-weight:bold;color: #ff5600;"><b>{{addComma total_cmt_sum}}<br/>({{average total_cmt_sum total_cmt_sum}}%)</b></td>
        <td style="font-weight:bold;color: #ff5600;"><b>{{vatMinus total_amt_sum}}<br/>({{average total_amt_sum total_amt_sum}}%)</b></td>
        <td>{{addComma mc_cnt_sum}}</td>
        <td>{{addComma mc_cmt_sum}}</td>
        <td>{{vatMinus mc_amt_sum}}</td>
        <td>{{addComma cn_cnt_sum}}</td>
        <td>{{addComma cn_cmt_sum}}</td>
        <td>{{vatMinus cn_amt_sum}}</td>
        <td>{{addComma inapp_cnt_sum}}</td>
        <td>{{addComma inapp_cmt_sum}}</td>
        <td>{{vatMinus inapp_amt_sum}}</td>
        <td>{{addComma inapp_aos_cnt_sum}}</td>
        <td>{{addComma inapp_aos_cmt_sum}}</td>
        <td>{{vatMinus inapp_aos_amt_sum}}</td>
        <td>{{addComma va_cnt_sum}}</td>
        <td>{{addComma va_cmt_sum}}</td>
        <td>{{vatMinus va_amt_sum}}</td>
        <td>{{addComma gm_cnt_sum}}</td>
        <td>{{addComma gm_cmt_sum}}</td>
        <td>{{vatMinus gm_amt_sum}}</td>
        <td>{{addComma hm_cnt_sum}}</td>
        <td>{{addComma hm_cmt_sum}}</td>
        <td>{{vatMinus hm_amt_sum}}</td>
        <td>{{addComma tmoney_cnt_sum}}</td>
        <td>{{addComma tmoney_cmt_sum}}</td>
        <td>{{vatMinus tmoney_amt_sum}}</td>
        <td>{{addComma cashbee_cnt_sum}}</td>
        <td>{{addComma cashbee_cmt_sum}}</td>
        <td>{{vatMinus cashbee_amt_sum}}</td>
        <td>{{addComma payco_cnt_sum}}</td>
        <td>{{addComma payco_cmt_sum}}</td>
        <td>{{vatMinus payco_amt_sum}}</td>
        <td>{{addComma kakaopay_cnt_sum}}</td>
        <td>{{addComma kakaopay_cmt_sum}}</td>
        <td>{{vatMinus kakaopay_amt_sum}}</td>
        <td>{{addComma kakaomoney_cnt_sum}}</td>
        <td>{{addComma kakaomoney_cmt_sum}}</td>
        <td>{{vatMinus kakaomoney_amt_sum}}</td>
        <td>{{addComma simple_cnt_sum}}</td>
        <td>{{addComma simple_cmt_sum}}</td>
        <td>{{vatMinus simple_amt_sum}}</td>
    </tr>
</script>

<script type="text/x-handlebars-template" id="tmp_wayYearDetailList">
    {{#each this as |data|}}
    <tr>
        <td class="font-bold _stateSubTh">
            {{data.the_date}}월
        </td>
        <td>{{addComma total_cnt}}<br/>({{average total_cnt total_cnt_sum}}%)</td>
        <td>{{addComma total_cmt}}<br/>({{average total_cmt total_cmt_sum}}%)</td>
        <td style="font-weight:bold">{{vatMinus total_amt}}<br/>({{average total_amt total_amt_sum}}%)</td>
        <td>{{addComma mc_cnt}}</td>
        <td>{{addComma mc_cmt}}</td>
        <td>{{vatMinus mc_amt}}</td>
        <td>{{addComma cn_cnt}}</td>
        <td>{{addComma cn_cmt}}</td>
        <td>{{vatMinus cn_amt}}</td>
        <td>{{addComma inapp_cnt}}</td>
        <td>{{addComma inapp_cmt}}</td>
        <td>{{vatMinus inapp_amt}}</td>
        <td>{{addComma inapp_aos_cnt}}</td>
        <td>{{addComma inapp_aos_cmt}}</td>
        <td>{{vatMinus inapp_aos_amt}}</td>
        <td>{{addComma va_cnt}}</td>
        <td>{{addComma va_cmt}}</td>
        <td>{{vatMinus va_amt}}</td>
        <td>{{addComma gm_cnt}}</td>
        <td>{{addComma gm_cmt}}</td>
        <td>{{vatMinus gm_amt}}</td>
        <td>{{addComma hm_cnt}}</td>
        <td>{{addComma hm_cmt}}</td>
        <td>{{vatMinus hm_amt}}</td>
        <td>{{addComma tmoney_cnt}}</td>
        <td>{{addComma tmoney_cmt}}</td>
        <td>{{vatMinus tmoney_amt}}</td>
        <td>{{addComma cashbee_cnt}}</td>
        <td>{{addComma cashbee_cmt}}</td>
        <td>{{vatMinus cashbee_amt}}</td>
        <td>{{addComma payco_cnt}}</td>
        <td>{{addComma payco_cmt}}</td>
        <td>{{vatMinus payco_amt}}</td>
        <td>{{addComma kakaopay_cnt}}</td>
        <td>{{addComma kakaopay_cmt}}</td>
        <td>{{vatMinus kakaopay_amt}}</td>
        <td>{{addComma kakaomoney_cnt}}</td>
        <td>{{addComma kakaomoney_cmt}}</td>
        <td>{{vatMinus kakaomoney_amt}}</td>
        <td>{{addComma simple_cnt}}</td>
        <td>{{addComma simple_cmt}}</td>
        <td>{{vatMinus simple_amt}}</td>
    </tr>
    {{else}}
    <td colspan="11" class="noData">{{isEmptyData}}
    <td>
        {{/each}}
</script>
