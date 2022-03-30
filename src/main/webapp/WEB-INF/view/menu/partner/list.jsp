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
                                    <%--<input name="startDate" id="startDate" style="width: 100px">--%>
                                    <%--<input name="endDate" id="endDate" style="width: 100px">--%>
                                    <span id="searchMemberArea" onchange="btSearchClick();"></span>
                                    <label><input type="text" class="form-control" name="searchText" id="searchText" placeholder="검색어를 입력해주세요."></label>
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

            </div>
            <!-- //tab -->
        </div> <!-- //container-fluid -->
    </div> <!-- //page-wrapper -->
</div>
<!-- //wrapper-->

<script type="text/javascript" src="/js/code/menu/menuCodeList.js?${dummyData}"></script>
<script type="text/javascript">
  const partnerSearch = {
    tMonth: '',
    searchVal: '',
    searchSlct: 1,
    pageNo: 1,
    pageCnt: 50,
  }
  const partnerPagingInfo = new PAGING_INFO(0, 1, 50);

  const partnerEventData = (function () {
    // 파트너 목록
    function callPartnerList() {

    }

    // 파트너 검색 목록
    function callPartnerSearch() {

    }

    return {
      callPartnerList: callPartnerList,
      callPartnerSearch: callPartnerSearch
    }
  }());

  // 이벤트 연동
  function btSearchClick() {
    $("#bt_search").click();
  }

  $(function () {
    $("#searchMemberArea").html(util.getCommonCodeSelect(1, searchMember));
    slctType = 1;
    setDayButton();

    // 파트너 목록 적용
    $('#bt_search').on('click', function () {
      partnerPagingInfo.pageNo = 1;
      partnerEventData.callPartnerList();
    });
  });
</script>
