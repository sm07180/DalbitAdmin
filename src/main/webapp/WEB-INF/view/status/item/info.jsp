<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dummyData"><%= java.lang.Math.round(java.lang.Math.random() * 1000000) %>
</c:set>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="container-fluid col-lg-9 no-padding">
            <form id="searchForm">
                <div class="row col-lg-12 form-inline">
                    <div class="widget widget-table searchBoxArea">
                        <table>
                            <tr>
                                <th rowspan="2" style="background-color:#4472c4;color:#e9ee17;width: 70px">
                                    <i class="fa fa-search"></i><br/>검색
                                </th>
                                <th id="th_bottonList">
                                    <jsp:include page="../../searchArea/daySearchFunction.jsp"/>
                                    <div>
                                        <div id="div_dayButton">
                                            <jsp:include page="../../searchArea/daySearchArea.jsp"/>
                                        </div>
                                        <div id="div_monthButton" style="display: none">
                                            <jsp:include page="../../searchArea/monthSearchArea.jsp"/>
                                        </div>
                                        <div id="div_yearButton" style="display: none">
                                            <jsp:include page="../../searchArea/yearSearchArea.jsp"/>
                                        </div>
                                    </div>
                                </th>
                            </tr>
                            <tr>
                                <td style="text-align: left">
                                    <span id="slctTypeArea"></span>
                                    <span id="slctTypeArea2" style="display: none"></span>

                                    <input id="onedayDate" type="text" class="form-control">
                                    <input id="monthDate" type="text" class="form-control" style="display: none"/>
                                    <input id="yearDate" type="text" class="form-control" style="display: none"/>

                                    <input class="hide" name="startDate" id="startDate" style="width: 100px">
                                    <input class="hide" name="endDate" id="endDate" style="width: 100px">
                                    <%--<input name="startDate" id="startDate" style="width: 100px">--%>
                                    <%--<input name="endDate" id="endDate" style="width: 100px">--%>

                                    <button type="button" class="btn btn-success" id="bt_search">검색</button>
                                    <a href="javascript://" class="_prevSearch">[이전]</a>
                                    <a href="javascript://" class="_todaySearch">[오늘]</a>
                                    <a href="javascript://" class="_nextSearch">[다음]</a>

                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </form>

            <div class="row col-lg-12 form-inline" id="div_live">
                <!-- 가입자수 -->
                <div class="widget widget-table mb10">
                    <div class="widget-header">
                        <h3><i class="fa fa-table"></i> 아이템 통계 현황</h3>
                    </div>
                    <div class="widget-content mt10">
                        <table class="table table-bordered">
                            <colgroup>
                                <col width="10%"/>
                                <col width="10%"/>
                                <col width="10%"/>
                                <col width="7%"/>
                                <col width="10%"/>
                                <col width="10%"/>
                                <col width="7%"/>
                                <col width="10%"/>
                                <col width="10%"/>
                                <col width="7%"/>
                            </colgroup>
                            <thead>
                            <tr>
                                <th></th>
                                <th id="th_beforLive"></th>
                                <th id="th_live" style="background-color: #fff2cc"></th>
                                <th>증감</th>
                                <th id="th_liveBeforWeek"></th>
                                <th id="th_liveWeek" style="background-color: #fff2cc"></th>
                                <th>증감</th>
                                <th id="th_liveBeforMonth"></th>
                                <th id="th_liveMonth" style="background-color: #fff2cc"></th>
                                <th>증감</th>
                            </tr>
                            </thead>
                            <tbody id="liveTableBody"></tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <!-- tab -->
        <div class="no-padding" id="infoTab">
            <jsp:include page="infoTab.jsp"/>
        </div>
        <!-- //tab -->
    </div>
</div>

<script type="text/javascript" src="/js/code/enter/joinCodeList.js?${dummyData}"></script>
<script type="text/javascript" src="/js/util/statUtil.js?${dummyData}"></script>
<script type="text/javascript">
  $(function () {
    $("#slctTypeArea").append(util.getCommonCodeRadio(0, join_slctType3));
    $("#slctTypeArea2").append(util.getCommonCodeRadio(0, join_slctType2));
    slctType = 0;
    setDayButton();
  });


  $(document).on('change', 'input[name="slctType"]', function () {
    radioChange();
  });
  $(document).on('change', 'input[name="slctType2"]', function () {
    radioChange();
  });

  function getList() {
    var data = {
      startDate: $("#startDate").val()
      , endDate: $("#endDate").val()
    };
    util.getAjaxData("itemLive", "/rest/status/item/live/list", data, fn_live_success);
  }

  function fn_live_success(data, response) {
    $("#liveTableBody").empty();
    var template = $('#tmp_live').html();
    var templateScript = Handlebars.compile(template);
    var context = response.data.liveInfo;
    var html = templateScript(context);
    $("#liveTableBody").append(html);


    var tmp_date = new Date();
    tmp_date = moment(tmp_date).format("YYYY.MM.DD HH:mm:SS");
    var tmp_day = tmp_date.split(" ")[0];
    var tmp_total = tmp_date.split(" ")[1];

    $("#th_beforLive").html('전일<br/>(' + moment($("#startDate").val()).add('days', -1).format('MM/DD') + ' 0시~' + tmp_total.split(":")[0] + "시)");
    $("#th_live").html('실시간<br/>(' + moment($("#startDate").val()).add('days', 0).format('MM/DD') + ' 0시~' + tmp_total.split(":")[0] + "시)");
    $("#th_liveBeforWeek").html('전주<br/>(' + common.substr(response.data.liveInfo.bweek_startDate, 5, 5) + "~" + common.substr(response.data.liveInfo.bweek_endDate, 5, 5) + ')');
    $("#th_liveWeek").html('주간<br/>(' + common.substr(response.data.liveInfo.week_startDate, 5, 5) + "~" + common.substr(response.data.liveInfo.week_endDate, 5, 5) + ')');
    $("#th_liveBeforMonth").html('전월<br/>(' + moment($("#startDate").val()).add('months', -1).format('MM/01') + "~" + tmp_day.split(".")[2] + ')');
    $("#th_liveMonth").html('월간<br/>(' + moment($("#startDate").val()).add('months', 0).format('MM/01') + '~' + tmp_day.split(".")[2] + ')');

  }

  function radioChange() {
    if (tabId != 'tab_broadcastDetail' && tabId != 'tab_broadcastTTS' && tabId != 'tab_broadcastTTS' && tabId != 'tab_clipDetail' && tabId != 'tab_mailbox') {

      console.log(tabId);
      slctType = $('input[name="slctType"]:checked').val();
      console.log(slctType);
      if (slctType == 0 || slctType == 4) {
        if ($('input[name="slctType"]:checked').val() == 4) {
          slctType = 1;
        }
        $("#oneDayDatePicker").show();
      } else {
        $("#oneDayDatePicker").hide();
      }
    } else {
      slctType = $('input[name="slctType2"]:checked').val();
      if (slctType == 2) {
        slctType = 1;
      }
      if (slctType == 0) {
        $("#oneDayDatePicker").show();
      } else {
        $("#oneDayDatePicker").hide();
      }
    }
    dateType();
  }

  function handlebarsPaging(targetId, pagingInfo) {
    if (targetId == 'list_broadcast_paginate') {
      giftClipListPagingInfo = pagingInfo;
      getBroadList();
    } else if (targetId == 'tts-top' || targetId == 'tts-bottom') {
      giftBroadcastTTSListPagingInfo = pagingInfo;
      getBroadTTSList();
    } else if (targetId == 'list_clip_paginate') {
      giftClipListPagingInfo = pagingInfo;
      getClipList();
    } else if (targetId == 'list_mailbox_paginate') {
      giftMailboxListPagingInfo = pagingInfo;
      getMailboxList();
    }
  }

  function itemTypeChange() {
    $("#bt_search").click();
  }

</script>

<script type="text/x-handlebars-template" id="tmp_live">
    <tr>
        <th>건수</th>
        <td>{{addComma yes_item_cnt}}</td>
        <td>{{addComma now_item_cnt}}</td>
        <td class="{{upAndDownClass now_inc_cnt}}"><i class="fa {{upAndDownIcon now_inc_cnt}}"></i> {{addComma
            now_inc_cnt}}
        </td>
        <td>{{addComma bweek_item_cnt}}</td>
        <td>{{addComma week_item_cnt}}</td>
        <td class="{{upAndDownClass week_inc_cnt}}"><i class="fa {{upAndDownIcon week_inc_cnt}}"></i> {{addComma
            week_inc_cnt}}
        </td>
        <td>{{addComma bmonth_item_cnt}}</td>
        <td>{{addComma month_item_cnt}}</td>
        <td class="{{upAndDownClass month_inc_cnt}}"><i class="fa {{upAndDownIcon month_inc_cnt}}"></i> {{addComma
            month_inc_cnt}}
        </td>
    </tr>
    <tr>
        <th>달수</th>
        <td>{{addComma yes_item_amt}}</td>
        <td>{{addComma now_item_amt}}</td>
        <td class="{{upAndDownClass now_inc_amt}}"><i class="fa {{upAndDownIcon now_inc_amt}}"></i> {{addComma
            now_inc_amt}}
        </td>
        <td>{{addComma bweek_item_amt}}</td>
        <td>{{addComma week_item_amt}}</td>
        <td class="{{upAndDownClass week_inc_amt}}"><i class="fa {{upAndDownIcon week_inc_amt}}"></i> {{addComma
            week_inc_amt}}
        </td>
        <td>{{addComma bmonth_item_amt}}</td>
        <td>{{addComma month_item_amt}}</td>
        <td class="{{upAndDownClass month_inc_amt}}"><i class="fa {{upAndDownIcon month_inc_amt}}"></i> {{addComma
            month_inc_amt}}
        </td>
    </tr>
</script>