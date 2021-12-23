<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dummyData"><%= java.lang.Math.round(java.lang.Math.random() * 1000000) %></c:set>

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
                                    <jsp:include page="../../../searchArea/daySearchFunction.jsp"/>
                                </th>
                                <th id="th_bottonList">
                                    <div>
                                        <div id="div_monthButton"><jsp:include page="../../../searchArea/monthSearchArea.jsp"/></div>
                                    </div>
                                </th>
                            </tr>
                            <tr>
                                <td style="text-align: left; padding-left: 4px;">
                                    <input id="monthDate" type="text" class="form-control" style="width: 75px" readonly />
                                    <input class="hide" name="startDate" id="startDate" style="width: 100px">
                                    <input class="hide" name="endDate" id="endDate" style="width: 100px">
                                    <label><input type="text" class="form-control" name="searchText" id="searchText" placeholder="회원번호 검색"></label>
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

        </div> <!-- //container-fluid -->
    </div> <!-- //page-wrapper -->
</div> <!-- //wrapper-->

<script type="text/javascript" src="/js/code/menu/menuCodeList.js?${dummyData}"></script>
<script type="text/javascript">
    let welcomeSlctType = 0;    // 0: 청취자, 1: DJ
    let welcomeSectionNo = 0;   // 0: 전체, 1: 1단계, 2: 2단계, 3: 3단계, 4: ALL

    const welcomeEventData = (function() {
        function callList(pageInfo) {

        }

        function reqGift() {

        }

        return {
            callList: callList,
            reqGift: reqGift
        }
    }());

    $(function() {
        let welcomePagingInfo = new PAGING_INFO(0, 1, 50);

        slctType = 1;
        setDayButton();

        $('#bt_search').on('click', function () {
            welcomePagingInfo.pageNo = 1;
            welcomeEventData.callList(welcomePagingInfo);
        });
    });
</script>