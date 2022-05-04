<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 결제환불 > 총계 -->
<div class="widget widget-table mb10">
    <div class="widget-content mt10" id="divAge">
        <%--<a href="javascript://" class="_prevSearch">[이전]</a>--%>
        <span class="_searchDate"></span>
        <%--<a href="javascript://" class="_nextSearch">[다음]</a>--%>
        <table class="table table-bordered">
            <thead>
            <tr>
                <th colspan="13" class="_stateTopTh">성별</th>
                <th style="background-color: white; border-bottom: hidden;border-top: hidden;"></th>
                <th colspan="25" class="_stateTopTh">연령대별</th>
            </tr>
            <tr>
                <th rowspan="2" class="_stateTopTh"></th>
                <th colspan="3" class="_stateSubTh">총계</th>
                <th colspan="3" class="_stateSubTh _sex_male"></th>
                <th colspan="3" class="_stateSubTh _sex_female"></th>
                <th colspan="3" class="_stateSubTh _sex_none"></th>
                <th rowspan="2" style="background-color: white; border-bottom: hidden;"></th>
                <th rowspan="2" class="_stateTopTh"></th>
                <th colspan="3" class="_stateSubTh">총계</th>
                <th colspan="3" class="_stateSubTh">미선택</th>
                <th colspan="3" class="_stateSubTh">10대</th>
                <th colspan="3" class="_stateSubTh">20대</th>
                <th colspan="3" class="_stateSubTh">30대</th>
                <th colspan="3" class="_stateSubTh">40대</th>
                <th colspan="3" class="_stateSubTh">50대</th>
                <th colspan="3" class="_stateSubTh">60대이상</th>
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
            </tr>
            </thead>
            <tbody id="ageTableBody"></tbody>
        </table>
    </div>
    <div class="widget-footer">
        <span>
            <%--<button class="btn btn-default print-btn pull-right" type="button" id="excelDownBtn"><i class="fa fa-print"></i>Excel Down</button>--%>
        </span>
    </div>
</div>
<a id='ageExcel' type='button' class="btn btn-default print-btn pull-right" download="" href="#"
   onclick="return ExcellentExport.excel(this, 'divAge', 'Sheet1');"><i class="fa fa-print"></i>Excel Down</a>

<script type="text/javascript">
  function getPayAgeList() {
    $("#ageExcel").attr('download', "결제현황_결제회원별_" + moment($("#startDate").val()).add('days', 0).format('YYYY.MM.DD') + "_" + moment($("#endDate").val()).add('days', 0).format('YYYY.MM.DD') + ".xls");

    let data = {
      tDate: $("#startDate").val().replace(/[.]/g, '-')
    };
    util.getAjaxData("getPayAgeList", "/v2/rest/enter/pay/month/paysex", data, fn_agePay_success);
  }

  function fn_agePay_success(data, response) {
    $("#ageTableBody").empty();
    let template, templateScript, context, html;

    let monthPaysexSumData = {}; // 총합 및 소계
    response.data.map(function (item) {
      for (let k in item) {
        if (k !== 'the_date') {
          if (!monthPaysexSumData[k + '_sum']) monthPaysexSumData[k + '_sum'] = 0;
          monthPaysexSumData[k + '_sum'] += item[k];
        }
      }
    });

    let monthPaysexCellData = response.data.map(function (item) {
      item.total_cnt_sum = monthPaysexSumData.total_cnt_sum;
      item.total_cmt_sum = monthPaysexSumData.total_cmt_sum;
      item.total_amt_sum = monthPaysexSumData.total_amt_sum;

      // 날짜분리
      let date = item.the_date.split('-');
      item.year = date[0];
      item.month = date[1];
      item.day = date[2];
      return item;
    });

    // 상단 소계
    template = $('#tmp_age').html();
    templateScript = Handlebars.compile(template);
    context = monthPaysexSumData;
    let total_html = templateScript(context);
    $("#ageTableBody").append(total_html);

    // 회원별 통계내용
    template = $('#tmp_ageDetailList').html();
    templateScript = Handlebars.compile(template);
    context = monthPaysexCellData;
    html = templateScript(context);
    $("#ageTableBody").append(html);

    // 하단 소계
    $("#ageTableBody").append(total_html);

    ui.tableHeightSet();
    ui.paintColor();
  }

  function genderAgeClick(tmp) {
    var popupUrl = "/enter/newPay2/popup/history?sDate=" + tmp.daily + "&eDate=" + tmp.daily + "&gender=" + tmp.gender + "&time=null" + "&age=" + tmp.age;
    util.windowOpen(popupUrl, "1550", "885", "결제목록");
  }
</script>

<script type="text/x-handlebars-template" id="tmp_age">
    <tr class="font-bold _stateSumTd">
        <td>소계</td>
        <td style="color:#ff5600;"><b>{{addComma total_cnt_sum}}<br/>({{average total_cnt_sum total_cnt_sum}}%)</b></td>
        <td style="color:#ff5600;"><b>{{addComma total_cmt_sum}}<br/>({{average total_cmt_sum total_cmt_sum}}%)</b></td>
        <td style="color:#ff5600;"><b>{{vatMinus total_amt_sum}}<br/>({{average total_amt_sum total_amt_sum}}%)</b></td>
        <td style="color: blue;">{{addComma male_cnt_sum}}</td>
        <td style="color: blue;">{{vatMinus male_cmt_sum}}</td>
        <td style="color: blue;">{{vatMinus male_amt_sum}}</td>
        <td style="color: red;">{{addComma female_cnt_sum}}</td>
        <td style="color: red;">{{vatMinus female_cmt_sum}}</td>
        <td style="color: red;">{{vatMinus female_amt_sum}}</td>
        <td>{{addComma none_cnt_sum}}</td>
        <td>{{vatMinus none_cmt_sum}}</td>
        <td>{{vatMinus none_amt_sum}}</td>
        <td style="background-color: white;border-bottom: hidden;"></td>
        <td>소계</td>
        <td style="color:#ff5600;"><b>{{addComma total_cnt_sum}}<br/>({{average total_cnt_sum total_cnt_sum}}%)</b></td>
        <td style="color:#ff5600;"><b>{{addComma total_cmt_sum}}<br/>({{average total_cmt_sum total_cmt_sum}}%)</b></td>
        <td style="color:#ff5600;"><b>{{vatMinus total_amt_sum}}<br/>({{average total_amt_sum total_amt_sum}}%)</b></td>
        <td>{{addComma age_00_cnt_sum}}</td>
        <td>{{addComma age_00_cmt_sum}}</td>
        <td>{{vatMinus age_00_amt_sum}}</td>
        <td>{{addComma age_10_cnt_sum}}</td>
        <td>{{addComma age_10_cmt_sum}}</td>
        <td>{{vatMinus age_10_amt_sum}}</td>
        <td>{{addComma age_20_cnt_sum}}</td>
        <td>{{addComma age_20_cmt_sum}}</td>
        <td>{{vatMinus age_20_amt_sum}}</td>
        <td>{{addComma age_30_cnt_sum}}</td>
        <td>{{addComma age_30_cmt_sum}}</td>
        <td>{{vatMinus age_30_amt_sum}}</td>
        <td>{{addComma age_40_cnt_sum}}</td>
        <td>{{addComma age_40_cmt_sum}}</td>
        <td>{{vatMinus age_40_amt_sum}}</td>
        <td>{{addComma age_50_cnt_sum}}</td>
        <td>{{addComma age_50_cmt_sum}}</td>
        <td>{{vatMinus age_50_amt_sum}}</td>
        <td>{{addComma age_60_cnt_sum}}</td>
        <td>{{addComma age_60_cmt_sum}}</td>
        <td>{{vatMinus age_60_amt_sum}}</td>
    </tr>
</script>

<script type="text/x-handlebars-template" id="tmp_ageDetailList">
    {{#each this as |data|}}
    <tr>
        <td class="font-bold _stateSubTh">
            {{data.day}}일
        </td>
        <td onclick="genderAgeClick($(this).data());" data-hour="" data-daily="{{data.the_date}}"
            data-monthly="{{data.month}}">
            <a href="javascript://"><span class="_fontColor" data-fontcolor="#555">{{addComma total_cnt}}<br/>({{average total_cnt total_cnt_sum}}%)</span></a>
        </td>
        <td><b>{{addComma total_cmt}}<br/>({{average total_cmt total_cmt_sum}}%)</b></td>
        <td><b>{{vatMinus total_amt}}<br/>({{average total_amt total_amt_sum}}%)</b></td>
        <td onclick="genderAgeClick($(this).data());" data-hour="" data-daily="{{data.the_date}}"
            data-monthly="{{data.month}}" data-gender="m" style="color: blue;">
            <a href="javascript://"><span class="_fontColor" data-fontcolor="#555">{{addComma male_cnt}}</span></a>
        </td>
        <td style="color: blue;">{{addComma male_cmt}}</td>
        <td style="color: blue;">{{vatMinus male_amt}}</td>
        <td onclick="genderAgeClick($(this).data());" data-hour="" data-daily="{{data.the_date}}"
            data-monthly="{{data.month}}" data-gender="f" style="color: red;">
            <a href="javascript://"><span class="_fontColor" data-fontcolor="#555">{{addComma female_cnt}}</span></a>
        </td>
        <td style="color: red;">{{addComma female_cmt}}</td>
        <td style="color: red;">{{vatMinus female_amt}}</td>
        <td onclick="genderAgeClick($(this).data());" data-hour="" data-daily="{{data.the_date}}"
            data-monthly="{{data.month}}" data-gender="n">
            <a href="javascript://"><span class="_fontColor" data-fontcolor="#555">{{addComma none_cnt}}</span></a>
        </td>
        <td>{{addComma none_cmt}}</td>
        <td>{{vatMinus none_amt}}</td>
        <td style="border-bottom: hidden;"></td>
        <td class="font-bold _stateSubTh">
            {{data.day}}일
        </td>
        <td onclick="genderAgeClick($(this).data());" data-hour="" data-daily="{{data.the_date}}"
            data-monthly="{{data.month}}"><a href="javascript://"><span class="_fontColor" data-fontcolor="#555">{{addComma total_cnt}}<br/>({{average total_cnt total_cnt_sum}}%)</span></a>
        </td>
        <td><b>{{addComma total_cmt}}<br/>({{average total_cmt total_cmt_sum}}%)</b></td>
        <td><b>{{vatMinus total_amt}}<br/>({{average total_amt total_amt_sum}}%)</b></td>
        <td onclick="genderAgeClick($(this).data());" data-hour="" data-daily="{{data.the_date}}"
            data-monthly="{{data.month}}" data-age="00"><a href="javascript://"><span class="_fontColor"
                                                                                        data-fontcolor="#555">{{addComma age_00_cnt}}</span></a>
        </td>
        <td>{{addComma age_00_cmt}}</td>
        <td>{{vatMinus age_00_amt}}</td>
        <td onclick="genderAgeClick($(this).data());" data-hour="" data-daily="{{data.the_date}}"
            data-monthly="{{data.month}}" data-age="10"><a href="javascript://"><span class="_fontColor"
                                                                                        data-fontcolor="#555">{{addComma age_10_cnt}}</span></a>
        </td>
        <td>{{addComma age_10_cmt}}</td>
        <td>{{vatMinus age_10_amt}}</td>
        <td onclick="genderAgeClick($(this).data());" data-hour="" data-daily="{{data.the_date}}"
            data-monthly="{{data.month}}" data-age="20"><a href="javascript://"><span class="_fontColor"
                                                                                        data-fontcolor="#555">{{addComma age_20_cnt}}</span></a>
        </td>
        <td>{{addComma age_20_cmt}}</td>
        <td>{{vatMinus age_20_amt}}</td>
        <td onclick="genderAgeClick($(this).data());" data-hour="" data-daily="{{data.the_date}}"
            data-monthly="{{data.month}}" data-age="30"><a href="javascript://"><span class="_fontColor"
                                                                                        data-fontcolor="#555">{{addComma age_30_cnt}}</span></a>
        </td>
        <td>{{addComma age_30_cmt}}</td>
        <td>{{vatMinus age_30_amt}}</td>
        <td onclick="genderAgeClick($(this).data());" data-hour="" data-daily="{{data.the_date}}"
            data-monthly="{{data.month}}" data-age="40"><a href="javascript://"><span class="_fontColor"
                                                                                        data-fontcolor="#555">{{addComma age_40_cnt}}</span></a>
        </td>
        <td>{{addComma age_40_cmt}}</td>
        <td>{{vatMinus age_40_amt}}</td>
        <td onclick="genderAgeClick($(this).data());" data-hour="" data-daily="{{data.the_date}}"
            data-monthly="{{data.month}}" data-age="50"><a href="javascript://"><span class="_fontColor"
                                                                                        data-fontcolor="#555">{{addComma age_50_cnt}}</span></a>
        </td>
        <td>{{addComma age_50_cmt}}</td>
        <td>{{vatMinus age_50_amt}}</td>
        <td onclick="genderAgeClick($(this).data());" data-hour="" data-daily="{{data.the_date}}"
            data-monthly="{{data.month}}" data-age="60"><a href="javascript://"><span class="_fontColor"
                                                                                        data-fontcolor="#555">{{addComma age_60_cnt}}</span></a>
        </td>
        <td>{{addComma age_60_cmt}}</td>
        <td>{{vatMinus age_60_amt}}</td>
    </tr>
    {{else}}
    <td colspan="11" class="noData">{{isEmptyData}}
    <td>
        {{/each}}
</script>