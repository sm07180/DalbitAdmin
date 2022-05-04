<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 결제수단별 -->
<div class="widget widget-table mb10">
    <div class="widget-content mt10" id="divWay">
        <%--<a href="javascript://" class="_prevSearch">[이전]</a>--%>
        <span class="_searchDate"></span>
        <%--<a href="javascript://" class="_nextSearch">[다음]</a>--%>
        <table class="table table-bordered">
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
            <tbody id="wayTableBody"></tbody>
        </table>
    </div>
    <div class="widget-footer">
        <span>
            <%--<button class="btn btn-default print-btn pull-right" type="button" id="excelDownBtn"><i class="fa fa-print"></i>Excel Down</button>--%>
        </span>
    </div>
</div>
<a id='wayExcel' type='button' class="btn btn-default print-btn pull-right" download="" href="#"
   onclick="return ExcellentExport.excel(this, 'divWay', 'Sheet1');"><i class="fa fa-print"></i>Excel Down</a>

<script type="text/javascript">

  function getPayWayList() {
    $("#wayExcel").attr('download', "결제현황_결제수단별_" + moment($("#startDate").val()).add('days', 0).format('YYYY.MM.DD') + "_" + moment($("#endDate").val()).add('days', 0).format('YYYY.MM.DD') + ".xls");

    let data = {
      tDate: $("#startDate").val().replace(/[.]/g, '-')
    };
    util.getAjaxData("getPayWayList", "/v2/rest/enter/pay/month/payway", data, fn_wayPay_success);
  }

  function fn_wayPay_success(data, response) {
    $("#wayTableBody").empty();
    let template, templateScript, context, html;

    let monthPaywaySumData = {}; // 총합 및 소계
    response.data.map(function (item) {
      for (let k in item) {
        if (k !== 'the_date') {
          if (!monthPaywaySumData[k + '_sum']) monthPaywaySumData[k + '_sum'] = 0;
          monthPaywaySumData[k + '_sum'] += item[k];
        }
      }
    });

    let monthPaywayCellData = response.data.map(function (item) {
      item.total_cnt_sum = monthPaywaySumData.total_cnt_sum;
      item.total_cmt_sum = monthPaywaySumData.total_cmt_sum;
      item.total_amt_sum = monthPaywaySumData.total_amt_sum;

      // 날짜분리
      let date = item.the_date.split('-');
      item.year = date[0];
      item.month = date[1];
      item.day = date[2];
      return item;
    });

    // 상단 소계
    template = $('#tmp_way').html();
    templateScript = Handlebars.compile(template);
    context = monthPaywaySumData;
    let total_html = templateScript(context);
    $("#wayTableBody").append(total_html);

    // 수단별 통계
    template = $('#tmp_wayDetailList').html();
    templateScript = Handlebars.compile(template);
    context = monthPaywayCellData;
    html = templateScript(context);
    $("#wayTableBody").append(html);

    // 하단 소계
    $("#wayTableBody").append(total_html);

    ui.tableHeightSet();
  }
</script>
<script type="text/x-handlebars-template" id="tmp_way">
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

<script type="text/x-handlebars-template" id="tmp_wayDetailList">
    {{#each this as |data|}}
    <tr>
        <td class="font-bold _stateSubTh">
            {{data.day}}일
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