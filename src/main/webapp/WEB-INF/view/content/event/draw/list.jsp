<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dummyData"><%= java.lang.Math.round(java.lang.Math.random() * 1000000) %>
</c:set>

<style>
    ::-webkit-scrollbar {
        display: none;
    }
</style>

<div id="wrapper">
    <div id="page-wrapper">
        <div id="container-fluid">
            <!-- searchBox -->
            <form id="searchForm">
                <div class="row col-lg-12 form-inline">
                    <div class="widget widget-table searchBoxArea">
                        <table>
                            <tr>
                                <th style="background-color:#4472c4;color:#e9ee17;width: 70px">
                                    <i class="fa fa-search"></i><br/>검색
                                    <jsp:include page="../../../searchArea/daySearchFunction.jsp"/>
                                </th>
                                <td style="text-align: left">

                                    <span id="searchTypeArea"></span>
                                    <jsp:include page="../../../searchArea/dateRangeSearchArea.jsp"/>

                                    <input type="text" class="form-control" id="onedayDate" name="onedayDate">

                                    <input class="hide" name="startDate" id="startDate" style="width: 100px">
                                    <input class="hide" name="endDate" id="endDate" style="width: 100px">
                                    <label><input type="text" class="form-control" name="searchMemNoText"
                                                  id="searchMemNoText" placeholder="검색어를 입력해주세요."></label>

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
            <!-- // searchBox -->

            <div class="row col-lg-12 form-inline">
                <div class="widget widget-table" style="overflow: auto">
                    <div class="widget-header">
                        <h3><i class="fa fa-desktop"></i> 검색결과</h3>
                    </div>
                    <div class="widget-content">
                        <div class="dataTables_paginate paging_full_numbers" id="list_info_paginate_top"></div>
                        <div>
                            <table id="errorList"
                                   class="table table-sorting table-hover table-bordered datatable no-margin"
                                   style="table-layout: fixed">
                                <thead>
                                <th width="60px">No.</th>
                                <th width="180px">회원번호</th>
                                <th width="180px">User ID</th>
                                <th width="220px">닉네임</th>
                                <th width="200px">참여일시</th>
                                <th width="120px">이름</th>
                                <th width="140px">연락처</th>
                                <th>아이템명</th>
                                </thead>
                                <tbody id="tableBody">
                                </tbody>
                            </table>
                        </div>
                        <div class="dataTables_paginate paging_full_numbers" id="list_info_paginate"></div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="/js/code/content/contentCodeList.js?${dummyData}"></script>
<script type="text/javascript">
  var drawEventPagingInfo = new PAGING_INFO(0, 1, 50);

  $(document).ready(function () {
    init();
  });

  $('input[id="searchMemNoText"]').keydown(function (e) {
    if (e.keyCode === 13) {
      drawEventPagingInfo.pageNo = 1;
      getDrawResultList();
    }
    ;
  });

  $('#bt_search').click(function () {
    drawEventPagingInfo.pageNo = 1;
    getDrawResultList();
  });

  function init() {
    $("#searchTypeArea").html(util.getCommonCodeSelect('', event_draw_filter));

    slctType = 3;
    dateType(slctType);

    getDrawResultList();

    Handlebars.registerHelper("calNo", function (value, options) {
      const totalCnt = drawEventPagingInfo.totalCnt;
      const pageNo = drawEventPagingInfo.pageNo;
      const pagePerNo = drawEventPagingInfo.pageCnt;
      return totalCnt - ((pageNo-1) * pagePerNo) - parseInt(value);
    });
  }

  function getDrawResultList() {
    const searchMemNo = ($("#searchMemNoText").val() != "") ? $("#searchMemNoText").val() : 0;
    const startDate = $("#startDate").val().replaceAll(".", "-");
    const endDate = $("#endDate").val().replaceAll(".", "-");
    let searchType = $("#searchTypeArea option:selected").val();
    searchType = (searchType != undefined) ? searchType : 1;

    var data = {
      memNo: searchMemNo.toString()
      , bbopgiGiftSlct: searchType
      , startDate: startDate
      , endDate: endDate
      , pageNo: drawEventPagingInfo.pageNo
      , pagePerCnt: drawEventPagingInfo.pageCnt
    };
    // console.log("data=", data);
    util.getAjaxData("eventDrawList", "/rest/content/event/draw/list", data, fn_success);
  }

  function fn_success(dst_id, response) {
    var template = $('#tmp_errorList').html();
    var templateScript = Handlebars.compile(template);
    var context = response.listData;
    drawEventPagingInfo.totalCnt = response.totalCnt;
    var html = templateScript(context);

    $("#tableBody").html(html);
    console.log("drawEventPagingInfo=", drawEventPagingInfo);
    util.renderPagingNavigation("list_info_paginate_top", drawEventPagingInfo);
    util.renderPagingNavigation("list_info_paginate", drawEventPagingInfo);

    if (common.isEmpty(context) || context.length == 0) {
      $("#list_info_paginate_top").hide();
      $("#list_info_paginate").hide();
    } else {
      $("#list_info_paginate_top").show();
      $("#list_info_paginate").show();
    }
  }

  function handlebarsPaging(targetId, pagingInfo) {
    drawEventPagingInfo = pagingInfo;
    getDrawResultList();
  }

  function dateType(paramSlctType) {
    $("#onedayDate").hide();
    $("#monthDate").hide();
    $("#yearDate").hide();
    $("#div_dayButton").hide();
    $("#div_monthButton").hide();
    $("#div_yearButton").hide();
    $("#th_bottonList").hide();
    $("#rangeDatepicker").hide();

    if (slctType == 0 || slctType == 4) {
      setDayButton();
      $("#onedayDate").show();
      $("#div_dayButton").show();
      $("#th_bottonList").show();
    } else if (slctType == 1) {
      setDayButton();
      $("#monthDate").show();
      $("#div_monthButton").show();
      $("#th_bottonList").show();
    } else if (slctType == 2) {
      setTimeDate(dateTime);
      setDayButton();
      $("#yearDate").show();
      $("#div_yearButton").show();
      $("#th_bottonList").show();
    } else if (slctType == 3) {
      setTimeDate(dateTime);
      $("#rangeDatepicker").show();
      $("#bt_search").click();
    } else if (slctType == 99) {
      setTimeDate(dateTime);
      $("#bt_search").click();
    }
    // }

    $(".labelMonthButton" + common.lpad(month, 2, "0")).addClass('active');
    $(".labelDayButton" + common.lpad(day, 2, "0")).addClass('active');
  }

</script>

<script id="tmp_errorList" type="text/x-handlebars-template">
    {{#each this}}
    <tr>
        <td>{{calNo @key}}</td>
        <td>{{{memNoLink mem_no mem_no}}}</td>
        <td>{{mem_userid}}</td>
        <td>{{mem_nick}}</td>
        <td>{{ins_date}}</td>
        <td>{{mem_name}}</td>
        <td>{{phoneNumHyphen mem_phone}}</td>
        <td>{{bbopgi_gift_name}}</td>
    </tr>
    {{else}}
    <tr>
        <td colspan="8">{{isEmptyData}}</td>
    </tr>
    {{/each}}
</script>
