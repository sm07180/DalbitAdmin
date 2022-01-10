<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dummyData"><%= java.lang.Math.round(java.lang.Math.random() * 1000000) %></c:set>

<div id="wrapper">
    <div id="page-wrapper">
        <!-- serachBox -->
        <div class="row col-lg-12 form-inline">
            <div class="col-md-8 no-padding">
                <div class="widget widget-table searchBoxArea">
                    <table>
                        <tr>
                            <th id="sendMailSearch" rowspan="2" style="background-color:#4472c4;color:#e9ee17;width: 70px; cursor: pointer;">
                                <i class="fa fa-search"></i><br/>검색
                            </th>
                            <th id="th_bottonList">
                                <jsp:include page="../../searchArea/daySearchFunction.jsp"/>
                                <div>
                                    <div id="div_dayButton"><jsp:include page="../../searchArea/daySearchArea.jsp"/></div>
                                </div>
                            </th>
                        </tr>
                        <tr>
                            <td style="text-align: left">
                                <jsp:include page="../../searchArea/dateRangeSearchArea.jsp"/>

                                <input id="onedayDate" type="text" class="form-control" >

                                <input type="hidden" name="startDate" id="startDate">
                                <input type="hidden" name="endDate" id="endDate" />

                                <%--<input name="startDate" id="startDate">--%>
                                <%--<input name="endDate" id="endDate" />--%>
                                <button type="button" class="btn btn-success" id="bt_search">검색</button>
                                <a href="javascript://" class="_prevSearch">[이전]</a>
                                <a href="javascript://" class="_todaySearch">[오늘]</a>
                                <a href="javascript://" class="_nextSearch">[다음]</a>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>

            <div class="col-md-4 no-padding">
                <span id="summaryArea"></span>
            </div>
        </div>
        <!-- //serachBox -->
        <!-- tab -->
        <div class="row col-lg-12 form-inline">
            <select id="sendMailSelect" name="sendMailSelect" class="form-control searchType">
                <option value="" selected="selected">메일 구분</option>
                <option value="a">동의 알림</option>
                <option value="p">결제</option>
                <option value="c">결제 취소</option>
            </select>
        </div>
        <!-- //tab -->
    </div> <!-- //page-wrapper -->
    <div class="row col-lg-12 form-inline">
        <div class="widget widget-table">
            <div class="widget-header">
                <h3><i class="fa fa-desktop"></i> 검색결과</h3>
            </div>
            <div class="row col-md-12 pull-left"><span class="_searchDate pl10"></span></div>
            <div class="tab-content no-padding">

                <!-- 이메일 발송 내역 조회 -->
                <div class="tab-pane fade in active " id="withdrawalList">
                    <jsp:include page="./mailLogMain.jsp"/>
                </div>

            </div>
        </div>
    </div>
</div> <!-- //wrapper -->

<script type="text/javascript" src="/js/code/content/contentCodeList.js?${dummyData}"></script>
<script type="text/javascript">
  $(document).ready(function() {
    slctType = 0;
    dateType();
  });
</script>