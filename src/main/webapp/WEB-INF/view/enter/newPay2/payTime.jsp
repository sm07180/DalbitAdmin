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
  $(function () {
  });

  function getPayTimeList() {
    let data = {
      tDate: $("#startDate").val().replace(/[.]/g, '-')
    };
    util.getAjaxData("total", "/v2/rest/enter/pay/time", data, fn_payTime_success);
  }

  function fn_payTime_success(data, response) {

  }

  function hourClick(tmp) {
    if (tmp.hour > -1) {
      var popupUrl = "/enter/newPay/popup/history?sDate=" + tmp.sDate + "&eDate=" + tmp.sDate + "&gender=null&time=" + tmp.hour + "&age=null";
      util.windowOpen(popupUrl, "1550", "885", "결제목록");
    } else {
      alert('데이터가 없습니다.');
    }
  }

</script>

<script type="text/x-handlebars-template" id="tmp_timeTableBody">
    <tr class="_tr_{{this}} font-bold" style="color: #ff5600;">
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
    <tr class="_tr_{{this}}" style="background-color: #f2f2f2">
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
    <tr class="_tr_{{this}}" style="background-color: #f2f2f2">
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
        <td class="font-bold" style="background-color: #dae3f3">{{this}}</td>
        <td onclick="hourClick($(this).data())"><a href="javascript://"><span class="_data _fontColor"
                                                                              data-fontcolor="#555"></span></a></td>
        <td onclick="hourClick($(this).data())"><a href="javascript://"><span class="_data _fontColor"
                                                                              data-fontcolor="#555"></span></a></td>
        <td></td>
        <td></td>
        <td></td>
        <td style="border-bottom: hidden;border-top: hidden"></td>
        <td onclick="hourClick($(this).data())"><a href="javascript://"><span class="_data _fontColor"
                                                                              data-fontcolor="#555"></span></a></td>
        <td onclick="hourClick($(this).data())"><a href="javascript://"><span class="_data _fontColor"
                                                                              data-fontcolor="#555"></span></a></td>
        <td></td>
        <td></td>
        <td></td>
        <td style="border-bottom: hidden;border-top: hidden"></td>
        <td onclick="hourClick($(this).data())" style="background-color: #FFF7E5"><a href="javascript://"><span
                class="_data _fontColor" data-fontcolor="#555"></span></td>
        <td onclick="hourClick($(this).data())" style="background-color: #FFF7E5"><a href="javascript://"><span
                class="_data _fontColor" data-fontcolor="#555"></span></td>
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
    <tr class="_tr_{{this}} font-bold" style="color: #ff5600;">
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
    <tr class="_tr_{{this}}" style="background-color: #f2f2f2">
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
    <tr class="_tr_{{this}}" style="background-color: #f2f2f2">
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
        <td class="font-bold" style="background-color: #dae3f3">{{this}}</td>
        <td onclick="hourClick($(this).data())"><a href="javascript://"><span class="_data _fontColor"
                                                                              data-fontcolor="#555"></span></a></td>
        <td onclick="hourClick($(this).data())"><a href="javascript://"><span class="_data _fontColor"
                                                                              data-fontcolor="#555"></span></a>
        <td></td>
        <td></td>
        <td></td>
        <td style="border-bottom: hidden;border-top: hidden"></td>
        <td onclick="hourClick($(this).data())"><a href="javascript://"><span class="_data _fontColor"
                                                                              data-fontcolor="#555"></span></a></td>
        <td onclick="hourClick($(this).data())"><a href="javascript://"><span class="_data _fontColor"
                                                                              data-fontcolor="#555"></span></a>
        <td></td>
        <td></td>
        <td></td>
        <td style="border-bottom: hidden;border-top: hidden"></td>
        <td onclick="hourClick($(this).data())"><a href="javascript://"><span class="_data _fontColor"
                                                                              data-fontcolor="#555"></span></a></td>
        <td onclick="hourClick($(this).data())"><a href="javascript://"><span class="_data _fontColor"
                                                                              data-fontcolor="#555"></span></a>
        <td></td>
        <td></td>
        <td></td>
        <td style="border-bottom: hidden;border-top: hidden"></td>
        <td onclick="hourClick($(this).data())"><a href="javascript://"><span class="_data _fontColor"
                                                                              data-fontcolor="#555"></span></a></td>
        <td onclick="hourClick($(this).data())"><a href="javascript://"><span class="_data _fontColor"
                                                                              data-fontcolor="#555"></span></a>
        <td></td>
        <td></td>
        <td></td>
    </tr>
    {{/each}}
</script>

