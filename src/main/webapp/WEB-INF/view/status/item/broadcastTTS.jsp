<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 아이템 방송-TTS 현황 -->
<div class="widget widget-table mb10">
    <div class="widget-content mt10">
        <span class="_searchDate2"></span>
        <table class="table table-bordered">
            <colgroup>
                <col width="6.2%"/>
                <col width="13.4%"/>
                <col width="13.4%"/>
                <col width="13.4%"/>
                <col width="13.4%"/>
                <col width="13.4%"/>
                <col width="13.4%"/>
            </colgroup>
            <thead>
            <tr>
                <th>No</th>
                <th>아이템 이미지</th>
                <th>아이템 명</th>
                <th>아이템 달</th>
                <th>아이템 판매 수</th>
                <th>아이템 판매 달</th>
                <th>아이템 누적 판매량</th>
            </tr>
            </thead>
            <tbody id="broadTTSTableBody"></tbody>
        </table>
        <div class="dataTables_paginate paging_full_numbers" id="list_broadcastTTS_paginate"></div>
    </div>
    <div class="widget-footer">
    </div>
</div>

<script type="text/javascript">
  $(function () {
    getBroadTTSList();
  });

  giftBroadcastTTSListPagingInfo = new PAGING_INFO(0, 1, 50);

  function getBroadTTSList() {

    $("#searchForm #pageNo").val(giftBroadcastTTSListPagingInfo.pageNo);
    $("#searchForm #pageCnt").val(giftBroadcastTTSListPagingInfo.pageCnt);

    var data = {};
    data.slctType = $('input[name="slctType2"]:checked').val();
    data.startDate = $("#startDate").val();
    data.endDate = $("#endDate").val();
    data.pageNo = giftBroadcastTTSListPagingInfo.pageNo;
    data.pageCnt = giftBroadcastTTSListPagingInfo.pageCnt;
    data.itemType = $('select[name=itemType_broad]').val();
    util.getAjaxData("memberList", "/rest/status/item/broad/list", data, fn_broadTTS_success);
  }

  function fn_broadTTS_success(data, response) {
    var isDataEmpty = response.data.detailList == null;
    $("#broadTTSTableBody").empty();
    if (!isDataEmpty) {
      var template = $('#tmp_broadTTSTotal').html();
      var templateScript = Handlebars.compile(template);
      var totalContext = response.data.totalInfo;
      var totalHtml = templateScript(totalContext);
      $("#broadTTSTableBody").append(totalHtml);

      response.data.detailList.slctType = $('input[name="slctType"]:checked').val()
    }

    var template = $('#tmp_broadTTSList').html();
    var templateScript = Handlebars.compile(template);
    var detailContext = response.data.detailList;
    var html = templateScript(detailContext);
    $("#broadTTSTableBody").append(html);

    if (response.data != '') {
      var pagingInfo = response.data.totalInfo;
      giftBroadcastTTSListPagingInfo.totalCnt = pagingInfo.totalCnt;
      util.renderPagingNavigation('list_broadcastTTS_paginate', giftBroadcastTTSListPagingInfo);

      detailContext.totalCnt = pagingInfo.totalCnt;
    }

    if (isDataEmpty) {
      $("#broadTTSTableBody td:last").remove();
    } else {
      $("#broadTTSTableBody").append(totalHtml);
    }
  }
</script>

<script type="text/x-handlebars-template" id="tmp_broadTTSTotal">
    <tr class="success font-bold">
        <td>소계</td>
        <td></td>
        <td></td>
        <td></td>
        <td>{{addComma sum_itemCnt}}</td>
        <td>{{addComma sum_itemAmt}}</td>
        <td>{{addComma sum_totalItemCnt}}</td>
        <!--<td>{{addComma sum_totalItemAmt}}</td>-->
    </tr>
</script>

<script type="text/x-handlebars-template" id="tmp_broadTTSList">
    {{#each this as |data|}}
    <tr>
        <td class="font-bold">{{rowNum}}</td>
        <td><img class="_webpImage" src="{{data.item_thumbnail}}" width="50" height="50"
                 data-webpImage="{{webp_image}}"/></td>
        <td>{{item_name}}</td>
        <td>{{sale_price}}</td>
        <td>{{addComma itemCnt}}</td>
        <td>{{addComma itemAmt}}</td>
        <td>{{addComma totalItemCnt}}</td>
        <!--<td>{{addComma totalItemAmt}}</td>-->
    </tr>
    {{else}}
    <%--<tr>--%>
    <td colspan="11" class="noData">{{isEmptyData}}
    <td>
        <%--</tr>--%>
        {{/each}}
</script>