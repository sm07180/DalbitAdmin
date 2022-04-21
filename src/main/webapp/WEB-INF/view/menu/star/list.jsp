<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dummyData"><%= java.lang.Math.round(java.lang.Math.random() * 1000000) %>
</c:set>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="container-fluid">
            <!-- serachBox -->
            <form id="searchForm">
                <div class="row col-lg-12 form-inline">
                    <div class="widget widget-table searchBoxArea">

                        <table>
                            <tr>
                                <th rowspan="2" style="background-color:#4472c4;color:#e9ee17;width: 70px">
                                    <i class="fa fa-search"></i><br/>검색
                                    <jsp:include page="../../searchArea/daySearchFunction.jsp"/>
                                </th>
                                <th id="th_bottonList">
                                    <div>
                                        <div id="div_monthButton">
                                            <jsp:include page="../../searchArea/monthSearchArea.jsp"/>
                                        </div>
                                    </div>
                                </th>
                            </tr>
                            <tr>
                                <td style="text-align: left">
                                    <input id="monthDate" type="text" class="form-control"/>
                                    <input class="hide" name="startDate" id="startDate" style="width: 100px">
                                    <input class="hide" name="endDate" id="endDate" style="width: 100px">
                                    <span id="searchMemberArea" onchange="btSearchClick();"></span>
                                    <label><input type="text" class="form-control" name="searchText" id="searchText"
                                                  placeholder="검색어를 입력해주세요."></label>
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

            <!-- tab -->
            <div class="row col-lg-12 form-inline">
                <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist" id="tablist_con">
                    <li class="active"><a href="#dal" role="tab" data-toggle="tab" class="_tab" data-tab="list">스타
                        DJ</a></li>
                    <li><a href="#reqDal" role="tab" data-toggle="tab" class="_tab" data-tab="req">스타 DJ 신청</a></li>
                    <li><a href="#reqManage" role="tab" data-toggle="tab" class="_tab" data-tab="manage">스타 DJ 신청관리</a>
                    </li>
                </ul>
                <div class="tab-content no-padding">
                    <div class="tab-pane fade in active" id="dal">스타 DJ</div>
                    <div class="tab-pane fade" id="reqDal">스타 DJ 신청</div>
                    <div class="tab-pane fade" id="reqManage">스타 DJ 신청관리</div>
                </div>
            </div>
            <!-- //tab -->
        </div> <!-- //container-fluid -->
    </div> <!-- //page-wrapper -->
</div>
<!-- //wrapper-->

<script type="text/javascript" src="/js/code/menu/menuCodeList.js?${dummyData}"></script>
<script type="text/javascript">
  let tabSlct = 'list';
  const starPagingInfo = new PAGING_INFO(0, 1, 50);
  const starEventData = (function () {
    // 스타DJ 목록
    function starList() {

    }

    // 스타DJ 신청 목록
    function reqList() {

    }

    // 스타 DJ 신청관리
    function manageList() {

    }

    return {
      starList: starList,
      reqList: reqList,
      manageList: manageList,
    }
  }());

  function handlebarsPaging(targetId, pagingInfo) {
  }

  function btSearchClick() {
    $("#bt_search").click();
  }

  $(function () {
    $("#searchMemberArea").html(util.getCommonCodeSelect(1, searchMember));

    slctType = 1;
    setDayButton();

    $('#bt_search').on('click', function () {
      if ($.isFunction(starEventData[tabSlct + 'List'])) {
        starPagingInfo.pageNo = 1;
        starEventData[tabSlct + 'List']();
      }
    });

    $('input[id="searchText"]').keydown(function (e) {
      if (e.keyCode == 13) {
        if ($.isFunction(starEventData[tabSlct + 'List'])) {
          starPagingInfo.pageNo = 1;
          starEventData[tabSlct + 'List']();
        }
      }
    });

    $('#tablist_con li a').on('click', function () {
      const $this = $(this);
      tabSlct = $this.data('tab');

      if ($.isFunction(starEventData[tabSlct + 'List'])) {
        starPagingInfo.pageNo = 1;
        starEventData[tabSlct + 'List']();
      }
    });
  });
</script>
