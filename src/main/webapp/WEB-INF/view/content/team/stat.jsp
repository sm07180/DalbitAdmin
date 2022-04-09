<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dummyData"><%= java.lang.Math.round(java.lang.Math.random() * 1000000) %>
</c:set>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="clearfix widget-content mb5">
                <h4 class="font-bold">팀현황</h4>

                <div class="mb10">
                    <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist">
                        <li>
                            <a href="/content/team/list">전체 팀</a>
                        </li>
                        <li class="active">
                            <a href="/content/team/stat">월간 현황</a>
                        </li>
                        <li>
                            <a href="/content/team/symbol">팀 심볼 관리</a>
                        </li>
                        <li>
                            <a href="/content/team/badge">활동배지 관리</a>
                        </li>
                    </ul>
                </div>

                <div>
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
                                        <td style="text-align: left; padding-left: 4px;">
                                            <input id="monthDate" type="text" class="form-control" style="width: 75px"
                                                   readonly/>
                                            <input class="hide" name="startDate" id="startDate" style="width: 100px">
                                            <input class="hide" name="endDate" id="endDate" style="width: 100px">
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
                </div>
            </div>
        </div> <!-- //container-fluid -->
    </div>
    <!-- //page-wrapper -->
</div>
<!-- //wrapper-->

<script type="text/javascript" src="/js/code/menu/menuCodeList.js?${dummyData}"></script>
<script type="text/javascript">
  $(function () {
    slctType = 1;
    setDayButton();

    $('#bt_search').on('click', function () {

    });
  });
</script>