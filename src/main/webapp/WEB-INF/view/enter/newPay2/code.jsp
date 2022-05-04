<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 결제환불 > 총계 -->
<div class="widget widget-table mb10">
    <div class="widget-content mt10" id="divCode">
        <%--<a href="javascript://" class="_prevSearch">[이전]</a>--%>
        <span class="_searchDate"></span>
        <%--<a href="javascript://" class="_nextSearch">[다음]</a>--%>
        <table class="table table-bordered _tableHeight" data-height="23px">
            <thead>
            <tr>
                <th class="_stateTopTh" colspan="34">Web (외부결제)</th>
            </tr>
            <tr>
                <th class="_stateTopTh" rowspan="2"></th>
                <th class="_stateSubTh" colspan="3">총계</th>
                <th class="_stateSubTh" colspan="3"><img
                        src="https://image.dalbitlive.com/store/charge/200612/charge_item_0010.png" width="25px"
                        height="25px"> 1,100원
                </th>
                <th class="_stateSubTh" colspan="3"><img
                        src="https://image.dalbitlive.com/store/charge/200612/charge_item_0050.png" width="25px"
                        height="25px"> 5,500원
                </th>
                <th class="_stateSubTh" colspan="3"><img
                        src="https://image.dalbitlive.com/store/charge/200612/charge_item_0100.png" width="25px"
                        height="25px"> 11,000원
                </th>
                <th class="_stateSubTh" colspan="3"><img
                        src="https://image.dalbitlive.com/store/charge/200612/charge_item_0300.png" width="25px"
                        height="25px"> 33,000원
                </th>
                <th class="_stateSubTh" colspan="3"><img
                        src="https://image.dalbitlive.com/store/charge/200612/charge_item_0500.png" width="25px"
                        height="25px"> 55,000원
                </th>
                <th class="_stateSubTh" colspan="3"><img
                        src="https://image.dalbitlive.com/store/charge/200612/charge_item_1000.png" width="25px"
                        height="25px"> 110,000원
                </th>
                <th class="_stateSubTh" colspan="3"><img
                        src="https://image.dalbitlive.com/store/charge/200612/charge_item_2000.png" width="25px"
                        height="25px"> 220,000원
                </th>
                <th class="_stateSubTh" colspan="3"><img
                        src="https://image.dalbitlive.com/store/charge/200612/charge_item_3000.png" width="25px"
                        height="25px"> 330,000원
                </th>
                <th class="_stateSubTh" colspan="3"><img
                        src="https://image.dalbitlive.com/store/charge/200612/charge_item_5000.png" width="25px"
                        height="25px"> 550,000원
                </th>
                <th class="_stateSubTh" colspan="3"><img
                        src="https://image.dalbitlive.com/store/charge/200612/charge_item_5000.png" width="25px"
                        height="25px"> 1.100,000원
                </th>
            </tr>
            <tr>
                <th class="_stateSubTh">건<br>(비율)</th>
                <th class="_stateSubTh">수량<br>(비율)</th>
                <th class="_stateSubTh">금액<br>(비율)</th>
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
            <tbody id="webTableBody"></tbody>
        </table>

        <table class="table table-bordered _tableHeight" data-height="23px">
            <thead>
            <tr>
                <th class="_stateTopTh" colspan="43">AOS (인앱결제)</th>
            </tr>
            <tr>
                <th class="_stateTopTh" rowspan="2"></th>
                <th class="_stateSubTh" colspan="3">총계</th>
                <th class="_stateSubTh" colspan="3"><img
                        src="https://image.dalbitlive.com/store/charge/200612/charge_item_0010.png" width="25px"
                        height="25px"> 1,200원
                </th>
                <th class="_stateSubTh" colspan="3"><img
                        src="https://image.dalbitlive.com/store/charge/200612/charge_item_0050.png" width="25px"
                        height="25px"> 5,900원
                </th>
                <th class="_stateSubTh" colspan="3"><img
                        src="https://image.dalbitlive.com/store/charge/200612/charge_item_0100.png" width="25px"
                        height="25px"> 12,000원
                </th>
                <th class="_stateSubTh" colspan="3"><img src="https://image.dalbitlive.com/store/store_3.png"
                                                         width="25px" height="25px"> 26,000원
                </th>
                <th class="_stateSubTh" colspan="3"><img src="https://image.dalbitlive.com/store/store_4.png"
                                                         width="25px" height="25px"> 65,000원
                </th>
                <th class="_stateSubTh" colspan="3"><img
                        src="https://image.dalbitlive.com/store/charge/200612/charge_item_1000.png" width="25px"
                        height="25px"> 109,000원
                </th>
                <th class="_stateSubTh" colspan="3"><img
                        src="https://image.dalbitlive.com/store/charge/200612/charge_item_2000.png" width="25px"
                        height="25px"> 199,000원
                </th>
                <th class="_stateSubTh" colspan="3"><img src="https://image.dalbitlive.com/store/store_6.png"
                                                         width="25px" height="25px"> 299,000원
                </th>
                <th class="_stateSubTh" colspan="3"><img
                        src="https://image.dalbitlive.com/store/charge/200612/charge_item_5000.png" width="25px"
                        height="25px"> 490,000원
                </th>
            </tr>
            <tr>
                <th class="_stateSubTh">건<br>(비율)</th>
                <th class="_stateSubTh">수량<br>(비율)</th>
                <th class="_stateSubTh">금액<br>(비율)</th>
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
            <tbody id="aosTableBody"></tbody>
        </table>

        <table class="table table-bordered _tableHeight" data-height="23px" title="'(판매종료)'는 2020.07.10 이전 결제 아이템 입니다.">
            <thead>
            <tr>
                <th class="_stateTopTh" colspan="43">IOS (인앱결제)</th>
            </tr>
            <tr>
                <th class="_stateTopTh" rowspan="2"></th>
                <th class="_stateSubTh" colspan="3">총계</th>
                <th class="_stateSubTh" colspan="3"><img
                        src="https://image.dalbitlive.com/store/charge/200612/charge_item_0010.png" width="25px"
                        height="25px"> 1,200원
                </th>
                <th class="_stateSubTh" colspan="3"><img src="https://image.dalbitlive.com/store/store_1.png"
                                                         width="25px" height="25px"> 3,900원<br/>(판매종료)
                </th>
                <th class="_stateSubTh" colspan="3"><img
                        src="https://image.dalbitlive.com/store/charge/200612/charge_item_0050.png" width="25px"
                        height="25px"> 5,900원
                </th>
                <th class="_stateSubTh" colspan="3"><img
                        src="https://image.dalbitlive.com/store/charge/200612/charge_item_0100.png" width="25px"
                        height="25px"> 12,000원
                </th>
                <th class="_stateSubTh" colspan="3"><img src="https://image.dalbitlive.com/store/store_3.png"
                                                         width="25px" height="25px"> 26,000원
                </th>
                <th class="_stateSubTh" colspan="3"><img src="https://image.dalbitlive.com/store/store_3.png"
                                                         width="25px" height="25px"> 39,000원<br/>(판매종료)
                </th>
                <th class="_stateSubTh" colspan="3"><img src="https://image.dalbitlive.com/store/store_4.png"
                                                         width="25px" height="25px"> 65,000원
                </th>
                <th class="_stateSubTh" colspan="3"><img
                        src="https://image.dalbitlive.com/store/charge/200612/charge_item_1000.png" width="25px"
                        height="25px"> 109,000원
                </th>
                <th class="_stateSubTh" colspan="3"><img src="https://image.dalbitlive.com/store/store_5.png"
                                                         width="25px" height="25px"> 169,000원<br/>(판매종료)
                </th>
                <th class="_stateSubTh" colspan="3"><img
                        src="https://image.dalbitlive.com/store/charge/200612/charge_item_2000.png" width="25px"
                        height="25px"> 199,000원
                </th>
                <th class="_stateSubTh" colspan="3"><img src="https://image.dalbitlive.com/store/store_6.png"
                                                         width="25px" height="25px"> 299,000원<br/>(판매종료)
                </th>
                <th class="_stateSubTh" colspan="3"><img src="https://image.dalbitlive.com/store/store_6.png"
                                                         width="25px" height="25px"> 299,000원
                </th>
                <th class="_stateSubTh" colspan="3"><img
                        src="https://image.dalbitlive.com/store/charge/200612/charge_item_5000.png" width="25px"
                        height="25px"> 490,000원
                </th>
            </tr>
            <tr>
                <th class="_stateSubTh">건<br>(비율)</th>
                <th class="_stateSubTh">수량<br>(비율)</th>
                <th class="_stateSubTh">금액<br>(비율)</th>
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
            <tbody id="iosTableBody"></tbody>
        </table>
    </div>
    <div class="widget-footer">
        <span>
            <%--<button class="btn btn-default print-btn pull-right" type="button" id="excelDownBtn"><i class="fa fa-print"></i>Excel Down</button>--%>
        </span>
    </div>
</div>
<a id='codeExcel' type='button' class="btn btn-default print-btn pull-right" download="" href="#"
   onclick="return ExcellentExport.excel(this, 'divCode', 'Sheet1');"><i class="fa fa-print"></i>Excel Down</a>

<script type="text/javascript">
  function getPayCodeList() {
    $("#codeExcel").attr('download', "결제현황_결제상품별_" + moment($("#startDate").val()).add('days', 0).format('YYYY.MM.DD') + "_" + moment($("#endDate").val()).add('days', 0).format('YYYY.MM.DD') + ".xls");

    let data = {
      tDate: $("#startDate").val().replace(/[.]/g, '-')
    };
    util.getAjaxData("getPayCodeList", "/v2/rest/enter/pay/month/paycode", data, fn_codePay_success);
  }

  function fn_codePay_success(data, response) {
    // 웹 (외부결제)
    let webcode = ['code13', 'code01', 'code02', 'code14', 'code03', 'code04', 'code05', 'code06', 'code15', 'code23'];
    let monthPaycodeWebCellData = response.data.map(function (codeData) {
      let result = {
        total_cnt: 0,
        total_cmt: 0,
        total_amt: 0
      };
      webcode.map(function (item) {
        result.total_cnt += parseInt(codeData[item + '_cnt'], 10);
        result.total_cmt += parseInt(codeData[item + '_cmt'], 10);
        result.total_amt += parseInt(codeData[item + '_amt'], 10);
        result[item + '_cnt'] = parseInt(codeData[item + '_cnt'], 10);
        result[item + '_cmt'] = parseInt(codeData[item + '_cmt'], 10);
        result[item + '_amt'] = parseInt(codeData[item + '_amt'], 10);
      });
      result.the_date = codeData.the_date;
      return result;
    });
    // 웹 (외부결제) 소계
    let monthPaycodeWebSumData = {}; // 총합 및 소계
    monthPaycodeWebCellData.map(function (item) {
      for (let k in item) {
        if (k !== 'the_date') {
          if (!monthPaycodeWebSumData[k + '_sum']) monthPaycodeWebSumData[k + '_sum'] = 0;
          monthPaycodeWebSumData[k + '_sum'] += item[k];
        }
      }
    });
    monthPaycodeWebCellData = monthPaycodeWebCellData.map(function (item) {
      item.total_cnt_sum = monthPaycodeWebSumData.total_cnt_sum;
      item.total_cmt_sum = monthPaycodeWebSumData.total_cmt_sum;
      item.total_amt_sum = monthPaycodeWebSumData.total_amt_sum;

      // 날짜분리
      let date = item.the_date.split('-');
      item.year = date[0];
      item.month = date[1];
      item.day = date[2];
      return item;
    });

    // 인앱결제 (AOS)
    let aoscode = ['code24', 'code25', 'code26', 'code27', 'code28', 'code29', 'code30', 'code31', 'code32'];
    let monthPaycodeAosCellData = response.data.map(function (codeData) {
      let result = {
        total_cnt: 0,
        total_cmt: 0,
        total_amt: 0
      };
      aoscode.map(function (item) {
        result.total_cnt += parseInt(codeData[item + '_cnt'], 10);
        result.total_cmt += parseInt(codeData[item + '_cmt'], 10);
        result.total_amt += parseInt(codeData[item + '_amt'], 10);
        result[item + '_cnt'] = parseInt(codeData[item + '_cnt'], 10);
        result[item + '_cmt'] = parseInt(codeData[item + '_cmt'], 10);
        result[item + '_amt'] = parseInt(codeData[item + '_amt'], 10);
      });
      result.the_date = codeData.the_date;
      return result;
    });
    // 인앱결제 (AOS) 소계
    let monthPaycodeAosSumData = {}; // 총합 및 소계
    monthPaycodeAosCellData.map(function (item) {
      for (let k in item) {
        if (k !== 'the_date') {
          if (!monthPaycodeAosSumData[k + '_sum']) monthPaycodeAosSumData[k + '_sum'] = 0;
          monthPaycodeAosSumData[k + '_sum'] += item[k];
        }
      }
    });
    monthPaycodeAosCellData = monthPaycodeAosCellData.map(function (item) {
      item.total_cnt_sum = monthPaycodeAosSumData.total_cnt_sum;
      item.total_cmt_sum = monthPaycodeAosSumData.total_cmt_sum;
      item.total_amt_sum = monthPaycodeAosSumData.total_amt_sum;

      // 날짜분리
      let date = item.the_date.split('-');
      item.year = date[0];
      item.month = date[1];
      item.day = date[2];
      return item;
    });

    // 인앱결제 (IOS)
    let ioscode = ['code16', 'code07', 'code17', 'code18', 'code08', 'code09', 'code10', 'code19', 'code11', 'code20', 'code12', 'code21', 'code22'];
    let monthPaycodeIosCellData = response.data.map(function (codeData) {
      let result = {
        total_cnt: 0,
        total_cmt: 0,
        total_amt: 0
      };
      ioscode.map(function (item) {
        result.total_cnt += parseInt(codeData[item + '_cnt'], 10);
        result.total_cmt += parseInt(codeData[item + '_cmt'], 10);
        result.total_amt += parseInt(codeData[item + '_amt'], 10);
        result[item + '_cnt'] = parseInt(codeData[item + '_cnt'], 10);
        result[item + '_cmt'] = parseInt(codeData[item + '_cmt'], 10);
        result[item + '_amt'] = parseInt(codeData[item + '_amt'], 10);
      });
      result.the_date = codeData.the_date;
      return result;
    });
    // 인앱결제 (IOS) 소계
    let monthPaycodeIosSumData = {}; // 총합 및 소계
    monthPaycodeIosCellData.map(function (item) {
      for (let k in item) {
        if (k !== 'the_date') {
          if (!monthPaycodeIosSumData[k + '_sum']) monthPaycodeIosSumData[k + '_sum'] = 0;
          monthPaycodeIosSumData[k + '_sum'] += item[k];
        }
      }
    });
    monthPaycodeIosCellData = monthPaycodeIosCellData.map(function (item) {
      item.total_cnt_sum = monthPaycodeIosSumData.total_cnt_sum;
      item.total_cmt_sum = monthPaycodeIosSumData.total_cmt_sum;
      item.total_amt_sum = monthPaycodeIosSumData.total_amt_sum;

      // 날짜분리
      let date = item.the_date.split('-');
      item.year = date[0];
      item.month = date[1];
      item.day = date[2];
      return item;
    });

    renderPaycodeWeb(monthPaycodeWebSumData, monthPaycodeWebCellData);
    renderPaycodeAos(monthPaycodeAosSumData, monthPaycodeAosCellData);
    renderPaycodeIos(monthPaycodeIosSumData, monthPaycodeIosCellData);
    ui.tableHeightSet();
  }

  // 웹 (외부결제) 출력
  function renderPaycodeWeb(sumData, cellData) {
    $('#webTableBody').empty();
    let template, templateScript, context, html;

    // 상단 소계
    template = $('#tmp_web').html();
    templateScript = Handlebars.compile(template);
    context = sumData;
    let total_html = templateScript(context);
    $("#webTableBody").append(total_html);

    // 통계
    template = $('#tmp_webDetailList').html();
    templateScript = Handlebars.compile(template);
    context = cellData;
    html = templateScript(context);
    $("#webTableBody").append(html);

    // 하단 소계
    $("#webTableBody").append(total_html);
  }

  // AOS (인앱결제) 출력
  function renderPaycodeAos(sumData, cellData) {
    $('#aosTableBody').empty();
    let template, templateScript, context, html;

    // 상단 소계
    template = $('#tmp_aos').html();
    templateScript = Handlebars.compile(template);
    context = sumData;
    let total_html = templateScript(context);
    $("#aosTableBody").append(total_html);

    // 통계
    template = $('#tmp_aosDetailList').html();
    templateScript = Handlebars.compile(template);
    context = cellData;
    html = templateScript(context);
    $("#aosTableBody").append(html);

    // 하단 소계
    $("#aosTableBody").append(total_html);
  }

  // IOS (인앱결제) 출력
  function renderPaycodeIos(sumData, cellData) {
    $('#iosTableBody').empty();
    let template, templateScript, context, html;

    // 상단 소계
    template = $('#tmp_ios').html();
    templateScript = Handlebars.compile(template);
    context = sumData;
    let total_html = templateScript(context);
    $("#iosTableBody").append(total_html);

    // 통계
    template = $('#tmp_iosDetailList').html();
    templateScript = Handlebars.compile(template);
    context = cellData;
    html = templateScript(context);
    $("#iosTableBody").append(html);

    // 하단 소계
    $("#iosTableBody").append(total_html);
  }
</script>

<script type="text/x-handlebars-template" id="tmp_web">
    <tr class="font-bold _stateSumTd">
        <td>소계</td>
        <td style="color:red;font-weight: bold;color: #ff5600">{{addComma total_cnt_sum}}<br>({{average total_cnt_sum total_cnt_sum}}%)</td>
        <td style="color:red;font-weight: bold;color: #ff5600">{{addComma total_cmt_sum}}<br>({{average total_cmt_sum total_cmt_sum}}%)</td>
        <td style="color:red;font-weight: bold;color: #ff5600">{{vatMinus total_amt_sum}}<br>({{average total_amt_sum total_amt_sum}}%)</td>
        <td>{{addComma code13_cnt_sum}}</td>
        <td>{{addComma code13_cmt_sum}}</td>
        <td>{{vatMinus code13_amt_sum}}</td>
        <td>{{addComma code01_cnt_sum}}</td>
        <td>{{addComma code01_cmt_sum}}</td>
        <td>{{vatMinus code01_amt_sum}}</td>
        <td>{{addComma code02_cnt_sum}}</td>
        <td>{{addComma code02_cmt_sum}}</td>
        <td>{{vatMinus code02_amt_sum}}</td>
        <td>{{addComma code14_cnt_sum}}</td>
        <td>{{addComma code14_cmt_sum}}</td>
        <td>{{vatMinus code14_amt_sum}}</td>
        <td>{{addComma code03_cnt_sum}}</td>
        <td>{{addComma code03_cmt_sum}}</td>
        <td>{{vatMinus code03_amt_sum}}</td>
        <td>{{addComma code04_cnt_sum}}</td>
        <td>{{addComma code04_cmt_sum}}</td>
        <td>{{vatMinus code04_amt_sum}}</td>
        <td>{{addComma code05_cnt_sum}}</td>
        <td>{{addComma code05_cmt_sum}}</td>
        <td>{{vatMinus code05_amt_sum}}</td>
        <td>{{addComma code06_cnt_sum}}</td>
        <td>{{addComma code06_cmt_sum}}</td>
        <td>{{vatMinus code06_amt_sum}}</td>
        <td>{{addComma code15_cnt_sum}}</td>
        <td>{{addComma code15_cmt_sum}}</td>
        <td>{{vatMinus code15_amt_sum}}</td>
        <td>{{addComma code23_cnt_sum}}</td>
        <td>{{addComma code23_cmt_sum}}</td>
        <td>{{vatMinus code23_amt_sum}}</td>
    </tr>
</script>

<script type="text/x-handlebars-template" id="tmp_webDetailList">
    {{#each this as |data|}}
    <tr>
        <td class="font-bold _stateSubTh">
            {{data.day}}일
        </td>
        <td>{{addComma total_cnt}}<br>({{average total_cnt total_cnt_sum}}%)</td>
        <td>{{addComma total_cmt}}<br>({{average total_cmt total_cmt_sum}}%)</td>
        <td style="font-weight: bold">{{vatMinus total_amt}}<br>({{average total_amt total_amt_sum}}%)</td>
        <td>{{addComma code13_cnt}}</td>
        <td>{{addComma code13_cmt}}</td>
        <td>{{vatMinus code13_amt}}</td>
        <td>{{addComma code01_cnt}}</td>
        <td>{{addComma code01_cmt}}</td>
        <td>{{vatMinus code01_amt}}</td>
        <td>{{addComma code02_cnt}}</td>
        <td>{{addComma code02_cmt}}</td>
        <td>{{vatMinus code02_amt}}</td>
        <td>{{addComma code14_cnt}}</td>
        <td>{{addComma code14_cmt}}</td>
        <td>{{vatMinus code14_amt}}</td>
        <td>{{addComma code03_cnt}}</td>
        <td>{{addComma code03_cmt}}</td>
        <td>{{vatMinus code03_amt}}</td>
        <td>{{addComma code04_cnt}}</td>
        <td>{{addComma code04_cmt}}</td>
        <td>{{vatMinus code04_amt}}</td>
        <td>{{addComma code05_cnt}}</td>
        <td>{{addComma code05_cmt}}</td>
        <td>{{vatMinus code05_amt}}</td>
        <td>{{addComma code06_cnt}}</td>
        <td>{{addComma code06_cmt}}</td>
        <td>{{vatMinus code06_amt}}</td>
        <td>{{addComma code15_cnt}}</td>
        <td>{{addComma code15_cmt}}</td>
        <td>{{vatMinus code15_amt}}</td>
        <td>{{addComma code23_cnt}}</td>
        <td>{{addComma code23_cmt}}</td>
        <td>{{vatMinus code23_amt}}</td>
    </tr>
    {{else}}
    <td colspan="11" class="noData">{{isEmptyData}}<td>
    {{/each}}
</script>

<script type="text/x-handlebars-template" id="tmp_aos">
    <tr class="font-bold _stateSumTd">
        <td>소계</td>
        <td style="color:red;font-weight: bold;color: #ff5600">{{addComma total_cnt_sum}}<br>({{average total_cnt_sum total_cnt_sum}}%)</td>
        <td style="color:red;font-weight: bold;color: #ff5600">{{addComma total_cmt_sum}}<br>({{average total_cmt_sum total_cmt_sum}}%)</td>
        <td style="color:red;font-weight: bold;color: #ff5600">{{vatMinus total_amt_sum}}<br>({{average total_amt_sum total_amt_sum}}%)</td>
        <td>{{addComma code24_cnt_sum}}</td>
        <td>{{addComma code24_cmt_sum}}</td>
        <td>{{vatMinus code24_amt_sum}}</td>
        <td>{{addComma code25_cnt_sum}}</td>
        <td>{{addComma code25_cmt_sum}}</td>
        <td>{{vatMinus code25_amt_sum}}</td>
        <td>{{addComma code26_cnt_sum}}</td>
        <td>{{addComma code26_cmt_sum}}</td>
        <td>{{vatMinus code26_amt_sum}}</td>
        <td>{{addComma code27_cnt_sum}}</td>
        <td>{{addComma code27_cmt_sum}}</td>
        <td>{{vatMinus code27_amt_sum}}</td>
        <td>{{addComma code28_cnt_sum}}</td>
        <td>{{addComma code28_cmt_sum}}</td>
        <td>{{vatMinus code28_amt_sum}}</td>
        <td>{{addComma code29_cnt_sum}}</td>
        <td>{{addComma code29_cmt_sum}}</td>
        <td>{{vatMinus code29_amt_sum}}</td>
        <td>{{addComma code30_cnt_sum}}</td>
        <td>{{addComma code30_cmt_sum}}</td>
        <td>{{vatMinus code30_amt_sum}}</td>
        <td>{{addComma code31_cnt_sum}}</td>
        <td>{{addComma code31_cmt_sum}}</td>
        <td>{{vatMinus code31_amt_sum}}</td>
        <td>{{addComma code32_cnt_sum}}</td>
        <td>{{addComma code32_cmt_sum}}</td>
        <td>{{vatMinus code32_amt_sum}}</td>
    </tr>
</script>

<script type="text/x-handlebars-template" id="tmp_aosDetailList">
    {{#each this as |data|}}
    <tr>
        <td class="font-bold _stateSubTh">
            {{data.day}}일
        </td>
        <td>{{addComma total_cnt}}<br>({{average total_cnt total_cnt_sum}}%)</td>
        <td>{{addComma total_cmt}}<br>({{average total_cmt total_cmt_sum}}%)</td>
        <td style="font-weight: bold">{{vatMinus total_amt}}<br>({{average total_amt total_amt_sum}}%)</td>
        <td>{{addComma code24_cnt}}</td>
        <td>{{addComma code24_cmt}}</td>
        <td>{{vatMinus code24_amt}}</td>
        <td>{{addComma code25_cnt}}</td>
        <td>{{addComma code25_cmt}}</td>
        <td>{{vatMinus code25_amt}}</td>
        <td>{{addComma code26_cnt}}</td>
        <td>{{addComma code26_cmt}}</td>
        <td>{{vatMinus code26_amt}}</td>
        <td>{{addComma code27_cnt}}</td>
        <td>{{addComma code27_cmt}}</td>
        <td>{{vatMinus code27_amt}}</td>
        <td>{{addComma code28_cnt}}</td>
        <td>{{addComma code28_cmt}}</td>
        <td>{{vatMinus code28_amt}}</td>
        <td>{{addComma code29_cnt}}</td>
        <td>{{addComma code29_cmt}}</td>
        <td>{{vatMinus code29_amt}}</td>
        <td>{{addComma code30_cnt}}</td>
        <td>{{addComma code30_cmt}}</td>
        <td>{{vatMinus code30_amt}}</td>
        <td>{{addComma code31_cnt}}</td>
        <td>{{addComma code31_cmt}}</td>
        <td>{{vatMinus code31_amt}}</td>
        <td>{{addComma code32_cnt}}</td>
        <td>{{addComma code32_cmt}}</td>
        <td>{{vatMinus code32_amt}}</td>
    </tr>
    {{else}}
    <td colspan="11" class="noData">{{isEmptyData}}<td>
    {{/each}}
</script>

<script type="text/x-handlebars-template" id="tmp_ios">
    let ioscode = ['code16', 'code07', 'code17', 'code18', 'code08', 'code09', 'code10', 'code19', 'code11', 'code20', 'code12', 'code21', 'code22'];
    <tr class="font-bold _stateSumTd">
        <td>소계</td>
        <td style="color:red;font-weight: bold;color: #ff5600">{{addComma total_cnt_sum}}<br>({{average total_cnt_sum total_cnt_sum}}%)</td>
        <td style="color:red;font-weight: bold;color: #ff5600">{{addComma total_cmt_sum}}<br>({{average total_cmt_sum total_cmt_sum}}%)</td>
        <td style="color:red;font-weight: bold;color: #ff5600">{{vatMinus total_amt_sum}}<br>({{average total_amt_sum total_amt_sum}}%)</td>
        <td>{{addComma code16_cnt_sum}}</td>
        <td>{{addComma code16_cmt_sum}}</td>
        <td>{{vatMinus code16_amt_sum}}</td>
        <td>{{addComma code07_cnt_sum}}</td>
        <td>{{addComma code07_cmt_sum}}</td>
        <td>{{vatMinus code07_amt_sum}}</td>
        <td>{{addComma code17_cnt_sum}}</td>
        <td>{{addComma code17_cmt_sum}}</td>
        <td>{{vatMinus code17_amt_sum}}</td>
        <td>{{addComma code18_cnt_sum}}</td>
        <td>{{addComma code18_cmt_sum}}</td>
        <td>{{vatMinus code18_amt_sum}}</td>
        <td>{{addComma code08_cnt_sum}}</td>
        <td>{{addComma code08_cmt_sum}}</td>
        <td>{{vatMinus code08_amt_sum}}</td>
        <td>{{addComma code09_cnt_sum}}</td>
        <td>{{addComma code09_cmt_sum}}</td>
        <td>{{vatMinus code09_amt_sum}}</td>
        <td>{{addComma code10_cnt_sum}}</td>
        <td>{{addComma code10_cmt_sum}}</td>
        <td>{{vatMinus code10_amt_sum}}</td>
        <td>{{addComma code19_cnt_sum}}</td>
        <td>{{addComma code19_cmt_sum}}</td>
        <td>{{vatMinus code19_amt_sum}}</td>
        <td>{{addComma code11_cnt_sum}}</td>
        <td>{{addComma code11_cmt_sum}}</td>
        <td>{{vatMinus code11_amt_sum}}</td>
        <td>{{addComma code20_cnt_sum}}</td>
        <td>{{addComma code20_cmt_sum}}</td>
        <td>{{vatMinus code20_amt_sum}}</td>
        <td>{{addComma code12_cnt_sum}}</td>
        <td>{{addComma code12_cmt_sum}}</td>
        <td>{{vatMinus code12_amt_sum}}</td>
        <td>{{addComma code21_cnt_sum}}</td>
        <td>{{addComma code21_cmt_sum}}</td>
        <td>{{vatMinus code21_amt_sum}}</td>
        <td>{{addComma code22_cnt_sum}}</td>
        <td>{{addComma code22_cmt_sum}}</td>
        <td>{{vatMinus code22_amt_sum}}</td>
    </tr>
</script>

<script type="text/x-handlebars-template" id="tmp_iosDetailList">
    {{#each this as |data|}}
    <tr>
        <td class="font-bold _stateSubTh">
            {{data.day}}일
        </td>
        <td>{{addComma total_cnt}}<br>({{average total_cnt total_cnt_sum}}%)</td>
        <td>{{addComma total_cmt}}<br>({{average total_cmt total_cmt_sum}}%)</td>
        <td style="font-weight: bold">{{vatMinus total_amt}}<br>({{average total_amt total_amt_sum}}%)</td>
        <td>{{addComma code16_cnt}}</td>
        <td>{{addComma code16_cmt}}</td>
        <td>{{vatMinus code16_amt}}</td>
        <td>{{addComma code07_cnt}}</td>
        <td>{{addComma code07_cmt}}</td>
        <td>{{vatMinus code07_amt}}</td>
        <td>{{addComma code17_cnt}}</td>
        <td>{{addComma code17_cmt}}</td>
        <td>{{vatMinus code17_amt}}</td>
        <td>{{addComma code18_cnt}}</td>
        <td>{{addComma code18_cmt}}</td>
        <td>{{vatMinus code18_amt}}</td>
        <td>{{addComma code08_cnt}}</td>
        <td>{{addComma code08_cmt}}</td>
        <td>{{vatMinus code08_amt}}</td>
        <td>{{addComma code09_cnt}}</td>
        <td>{{addComma code09_cmt}}</td>
        <td>{{vatMinus code09_amt}}</td>
        <td>{{addComma code10_cnt}}</td>
        <td>{{addComma code10_cmt}}</td>
        <td>{{vatMinus code10_amt}}</td>
        <td>{{addComma code19_cnt}}</td>
        <td>{{addComma code19_cmt}}</td>
        <td>{{vatMinus code19_amt}}</td>
        <td>{{addComma code11_cnt}}</td>
        <td>{{addComma code11_cmt}}</td>
        <td>{{vatMinus code11_amt}}</td>
        <td>{{addComma code20_cnt}}</td>
        <td>{{addComma code20_cmt}}</td>
        <td>{{vatMinus code20_amt}}</td>
        <td>{{addComma code12_cnt}}</td>
        <td>{{addComma code12_cmt}}</td>
        <td>{{vatMinus code12_amt}}</td>
        <td>{{addComma code21_cnt}}</td>
        <td>{{addComma code21_cmt}}</td>
        <td>{{vatMinus code21_amt}}</td>
        <td>{{addComma code22_cnt}}</td>
        <td>{{addComma code22_cmt}}</td>
        <td>{{vatMinus code22_amt}}</td>
    </tr>
    {{else}}
    <td colspan="11" class="noData">{{isEmptyData}}<td>
    {{/each}}
</script>