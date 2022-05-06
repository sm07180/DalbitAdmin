<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dummyData"><%= java.lang.Math.round(java.lang.Math.random() * 1000000) %>
</c:set>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="clearfix widget-content mb5">
                <h4 class="font-bold">키보드 히어로</h4>
                <!-- searchBox -->
                <form id="searchForm">
                    <div class="row col-lg-12 form-inline">
                        <div class="widget widget-table searchBoxArea">
                            <table>
                                <tr>
                                    <th rowspan="2" style="background-color:#4472c4;color:#e9ee17;width: 70px">
                                        <i class="fa fa-search"></i><br/>검색
                                    </th>
                                    <th>
                                        <jsp:include page="../../../searchArea/daySearchFunction.jsp"/>
                                        <div>
                                            <div id="div_dayButton">
                                                <jsp:include page="../../../searchArea/daySearchArea.jsp"/>
                                            </div>
                                            <div id="div_monthButton" style="display: none">
                                                <jsp:include page="../../../searchArea/monthSearchArea.jsp"/>
                                            </div>
                                            <div id="div_yearButton" style="display: none">
                                                <jsp:include page="../../../searchArea/yearSearchArea.jsp"/>
                                            </div>
                                        </div>
                                    </th>
                                </tr>
                                <tr>
                                    <td style="text-align: left">
                                        <input type="text" class="form-control" id="onedayDate" name="onedayDate">

                                        <input id="monthDate" type="text" class="form-control"
                                               style="width: 196px;display: none"/>

                                        <input id="yearDate" type="text" class="form-control"
                                               style="width: 196px;display: none"/>

                                        <input class="hide" name="startDate" id="startDate" style="width: 100px">
                                        <input class="hide" name="endDate" id="endDate" style="width: 100px">
                                        <label><input type="text" class="form-control hide" name="searchText"
                                                      id="searchText" placeholder="검색어를 입력해주세요."></label>

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
                <!-- //serachBox -->

                <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist" id="tablist_con">
                    <li class="active"><a href="#lucky" role="tab" data-toggle="tab" data-slct="list">당첨자</a></li>
                    <li><a href="#bouns" role="tab" data-toggle="tab" data-slct="bouns">BONUS</a></li>
                </ul>

                <div id="resultArea" class="clearfix"></div>
            </div>
        </div> <!-- //container-fluid -->
    </div> <!-- //page-wrapper -->
</div>
<!-- //wrapper-->

<script type="text/javascript" src="/js/code/menu/menuCodeList.js?${dummyData}"></script>
<script type="text/javascript">
  let sDate = dateTime.replace(/[.]/g, '-');
  let luckySlct = 'list';
  let chatData = {
    memNo: '',
    theSeq: 0
  };

  const luckyChatPagingInfo = new PAGING_INFO(0, 1, 50);
  const luckyChatModalPagingInfo = new PAGING_INFO(0, 1, 50);
  const luckyChatEventData = (function () {
    // 중복내역
    function getDuplicatMemList() {
      let data = {
        memNo: chatData.memNo,
        theDate: sDate
      };
      util.getAjaxData("getDuplicatMemList", "/rest/content/event/luck-chat/duplicat", data, renderDuplicatMemList, null, {type: 'GET'});
    }

    // 중복내역 - 출력
    function renderDuplicatMemList(data, response) {

    }

    // 채팅내역
    function getChatList() {
      let data = {
        memNo: chatData.memNo,
        theDate: sDate,
        theSeq: chatData.theSeq,
        pageNo: luckyChatModalPagingInfo.pageNo,
        pagePerCnt: luckyChatModalPagingInfo.pageCnt
      };
      util.getAjaxData("getChatList", "/rest/content/event/luck-chat/chat", data, renderChatList, null, {type: 'GET'});
    }

    // 채팅내역 출력
    function renderChatList(data, response) {

    }

    // 당첨자 목록
    function getMemList() {
      let data = {
        theDate: sDate,
        pageNo: luckyChatPagingInfo.pageNo,
        pagePerCnt: luckyChatPagingInfo.pageCnt
      };
      util.getAjaxData("getMemList", "/rest/content/event/luck-chat/list", data, renderMemList, null, {type: 'GET'});
    }

    // 당첨자 목록 출력
    function renderMemList(data, response) {

    }

    // 보너스 목록
    function getBonusMemList() {
      let data = {
        theDate: sDate,
        pageNo: luckyChatPagingInfo.pageNo,
        pagePerCnt: luckyChatPagingInfo.pageCnt
      };
      util.getAjaxData("getBonusMemList", "/rest/content/event/luck-chat/bouns", data, renderBonusMemList, null, {type: 'GET'});
    }

    // 보너스 목록 출력
    function renderBonusMemList(data, response) {

    }

    function callList() {
      $('#resultArea').empty();
      switch (luckySlct) {
        case 'list':
          getMemList();
          break;
        case 'bouns':
          getBonusMemList();
          break;
      }
    }

    return {
      getDuplicatMemList: getDuplicatMemList,
      getChatList: getChatList,
      callList: callList
    }
  }());

  $(function () {
    $('#bt_search').on('click', function () {
      sDate = $("#startDate").val().replace(/[.]/g, '-');

      luckyChatPagingInfo.pageNo = 1;
      luckyChatEventData.callList();
    });

    $('#tablist_con li a').on('click', function () {
      let $this = $(this);
      luckySlct = $this.data('slct');

      slctType = (luckySlct === 'list') ? 0 : 1;
      dateType();
    });

    slctType = 0;
    dateType();
  });
</script>