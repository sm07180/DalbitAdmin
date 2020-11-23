<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dummyData"><%= java.lang.Math.round(java.lang.Math.random() * 1000000) %></c:set>


<style>
    .divTable{
        display: table;
    }
    .divTable span{
        display: table-cell;
        vertical-align: middle;
    }
</style>


<div id="wrapper">
    <div id="page-wrapper" class="col-lg-12 no-padding">
        <div class="container-fluid">
            <form id="searchForm">
                <div class="row form-inline">
                    <div class="widget widget-table searchBoxArea">
                        <table>
                            <tr>
                                <th rowspan="2" style="background-color:#4472c4;color:#e9ee17;width: 70px">
                                    <i class="fa fa-search"></i><br/>검색
                                    <jsp:include page="../../searchArea/daySearchFunction.jsp"/>
                                </th>
                                <th id="th_bottonList">
                                    <div>
                                        <div id="div_dayButton"><jsp:include page="../../searchArea/daySearchArea.jsp"/></div>
                                        <div id="div_monthButton" style="display: none"><jsp:include page="../../searchArea/monthSearchArea.jsp"/></div>
                                        <div id="div_yearButton" style="display: none"><jsp:include page="../../searchArea/yearSearchArea.jsp"/></div>
                                    </div>
                                </th>
                            </tr>
                            <tr>
                                <td style="text-align: left">
                                    <jsp:include page="../../searchArea/dateRangeSearchArea.jsp"/>

                                    <input id="onedayDate" type="text" class="form-control" >
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

                        <%--<div class="widget-header searchBoxRow">--%>
                            <%--<h3 class="title"><i class="fa fa-search"></i> 검색조건</h3>--%>
                            <%--<div>--%>
                                <%--&lt;%&ndash;<span id="slctTypeArea"></span>&ndash;%&gt;--%>

                                <%--<div class="input-group date" id="oneDayDatePicker">--%>
                                    <%--<label for="onedayDate" class="input-group-addon">--%>
                                        <%--<span><i class="fa fa-calendar" id="onedayDateBtn"></i></span>--%>
                                    <%--</label>--%>
                                    <%--<input type="text" class="form-control" id="onedayDate" name="onedayDate">--%>
                                <%--</div>--%>

                                <%--<div class="input-group date" id="monthDatepicker" style="display:none;">--%>
                                    <%--<label for="monthDate" class="input-group-addon">--%>
                                        <%--<span><i class="fa fa-calendar"></i></span>--%>
                                    <%--</label>--%>
                                    <%--<input id="monthDate" type="text" class="form-control" style="width: 196px;"/>--%>
                                <%--</div>--%>

                                <%--<div class="input-group date" id="yearDatepicker" style="display:none;">--%>
                                    <%--<label for="yearDate" class="input-group-addon">--%>
                                        <%--<span><i class="fa fa-calendar"></i></span>--%>
                                    <%--</label>--%>
                                    <%--<input id="yearDate" type="text" class="form-control" style="width: 196px;"/>--%>
                                <%--</div>--%>

                                <%--<input type="hidden" name="startDate" id="startDate">--%>
                                <%--<input type="hidden" name="endDate" id="endDate" />--%>

                                <%--&lt;%&ndash;<input name="startDate" id="startDate">&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<input name="endDate" id="endDate" />&ndash;%&gt;--%>

                                <%--<button type="button" class="btn btn-success" id="bt_search">검색</button>--%>
                                <%--<a href="javascript://" class="_prevSearch">[이전]</a>--%>
                                <%--<a href="javascript://" class="_todaySearch">[오늘]</a>--%>
                                <%--<a href="javascript://" class="_nextSearch">[다음]</a>--%>

                                <%--<label class="control-inline fancy-checkbox custom-color-green">--%>
                                    <%--<input type="checkbox" name="search_testId" id="search_testId" value="1" checked="true">--%>
                                    <%--<span id="checkTestid" style="display: none">테스트 아이디 제외</span>--%>
                                <%--</label>--%>

                            <%--</div>--%>
                        <%--</div>--%>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <!-- tab -->
    <div class="no-padding" id="infoTab">
        <jsp:include page="infoTab.jsp"/>
    </div>
    <!-- //tab -->
</div>

<script type="text/javascript" src="/js/code/status/statusCodeList.js?${dummyData}"></script>
<script type="text/javascript" src="/js/code/enter/joinCodeList.js?${dummyData}"></script>
<script type="text/javascript" src="/js/util/statUtil.js?${dummyData}"></script>
<script type="text/javascript" src="/js/handlebars/statusHelper.js?${dummyData}"></script>

<script type="text/javascript">

    $(function(){
        slctType = 0;
        setDayButton();
    });

    function dataSet(){
        var startDate = $("#startDate").val();
        var endDate = $("#endDate").val();

        var data = {
            slctType : slctType,
            startDate : startDate,
            endDate : endDate
        };

        return data;
    }

</script>