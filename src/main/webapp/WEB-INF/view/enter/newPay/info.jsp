<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dummyData"><%= java.lang.Math.round(java.lang.Math.random() * 1000000) %></c:set>

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
                                </th>
                                <th>
                                    <jsp:include page="../../searchArea/daySearchFunction.jsp"/>
                                    <div>
                                        <div id="div_dayButton"><jsp:include page="../../searchArea/daySearchArea.jsp"/></div>
                                        <div id="div_monthButton"  style="display: none"><jsp:include page="../../searchArea/monthSearchArea.jsp"/></div>
                                        <div id="div_yearButton" style="display: none"><jsp:include page="../../searchArea/yearSearchArea.jsp"/></div>
                                    </div>
                                </th>
                            </tr>
                            <tr>
                                <td style="text-align: left">
                                    <input type="text" class="form-control" id="onedayDate" name="onedayDate">

                                    <input id="monthDate" type="text" class="form-control" style="width: 196px;display: none"/>

                                    <input id="yearDate" type="text" class="form-control" style="width: 196px;display: none"/>

                                    <input class="hide" name="startDate" id="startDate" style="width: 100px">
                                    <input class="hide" name="endDate" id="endDate" style="width: 100px">
                                    <%--<input name="startDate" id="startDate" style="width: 100px">--%>
                                    <%--<input name="endDate" id="endDate" style="width: 100px">--%>
                                    <label><input type="text" class="form-control hide" name="searchText" id="searchText" placeholder="검색어를 입력해주세요."></label>

                                    <button type="button" class="btn btn-success" id="bt_search">검색</button>
                                    <a href="javascript://" class="_prevSearch">[이전]</a>
                                    <a href="javascript://" class="_todaySearch">[오늘]</a>
                                    <a href="javascript://" class="_nextSearch">[다음]</a>
                                </td>
                            </tr>
                        </table>
                    </div>

                    <%--<div class="widget widget-table searchBoxArea">--%>
                        <%--<div class="widget-header searchBoxRow">--%>
                            <%--<h3 class="title"><i class="fa fa-search"></i> 검색조건</h3>--%>
                            <%--<div>--%>
                                <%--<span id="slctTypeArea" style="display:none;"></span>--%>
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
                                <%--<label><input type="text" class="form-control" id="txt_search" name="txt_search"></label>--%>
                                <%--<button type="button" class="btn btn-success" id="bt_search">검색</button>--%>
                                <%--<a href="javascript://" class="_prevSearch">[이전]</a>--%>
                                <%--<a href="javascript://" class="_todaySearch">[오늘]</a>--%>
                                <%--<a href="javascript://" class="_nextSearch">[다음]</a>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                    <%--</div>--%>
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

<script type="text/javascript" src="/js/code/enter/joinCodeList.js?${dummyData}"></script>
<script type="text/javascript" src="/js/util/statUtil.js?${dummyData}"></script>
<script type="text/javascript" src="/js/handlebars/statusHelper.js?${dummyData}"></script>
<script type="text/javascript">

    var dateTime = new Date();
    dateTime = moment(dateTime).format("YYYY.MM.DD");
    var week = ['일', '월', '화', '수', '목', '금', '토'];
    var toDay = week[moment(new Date()).day()];
    setTimeDate(dateTime);

    var clickTab = false;

    var year;
    var month = moment(dateTime).format("MM");
    var day = moment(dateTime).format("DD");

    var slctType = 0;

    $(function(){
        setDayButton();

        $('input[id="txt_search"]').keydown(function() {
            if (event.keyCode === 13) {
                $("#bt_search").click();
            };
        });
    });

    function setTimeDate(dateTime){
        $("#onedayDate").val(dateTime);
        $("#startDate").val(dateTime);
        $("#endDate").val(dateTime);

        toDay = week[moment($("#startDate").val()).add('days', 0).day()];
        $("._searchDate").html(dateTime + " (" + toDay + ")");
    }

    $(document).on('click', '._prevSearch', function(){
        clickTab = false;
        prevNext(true);
    });

    $(document).on('click', '._nextSearch', function(){
        clickTab = false;
        prevNext(false);
    });

    $(document).on('click', '._todaySearch', function(){
        clickTab = false;
        dateType();
    });

    function radioChange(){
        dateType(slctType);
        if(slctType == 0){
            // 시간대별 ----------------------------
            $("#onedayDate").show();
            $("#monthDate").hide();
            $("#yearDate").hide();
            $("#startDate").val($("#onedayDate").val());
            $("#endDate").val($("#onedayDate").val());
        }else{
            if(slctType == 1){
                // 일자 -----------------------------------
                $("#onedayDate").hide();
                $("#monthDate").show();
                $("#yearDate").hide();

                var monthLastDate = new Date($("#onedayDate").val().substr(0,4),$("#onedayDate").val().substr(5,7),-1);
                $("#startDate").val($("#onedayDate").val().substr(0,8) + "01");
                $("#endDate").val($("#onedayDate").val().substr(0,8) + (monthLastDate.getDate() + 1));
                $("#monthDate").val($("#onedayDate").val().substr(0,7));

                var rangeDate = $("#monthDate").val().split(' - ');
                if(-1 < rangeDate.indexOf(' - ')){
                    $("#startDate").val(rangeDate[0]);
                    $("#endDate").val(rangeDate[1]);
                };
                $("._searchDate").html(moment($("#startDate").val()).format('YYYY년 MM월'));
            }else{
                // 월별 ----------------------------------
                $("#onedayDate").hide();
                $("#monthDate").hide();
                $("#yearDate").show();

                var yearDate = new Date();
                $("#startDate").val(yearDate.getFullYear() + '.01.01');
                $("#endDate").val(yearDate.getFullYear() + ".12.31");
                $("#yearDate").val(yearDate.getFullYear());
                $("._searchDate").html(moment($("#startDate").val()).format('YYYY년'));
            }
        }
    }

    function prevNext(isPrev){
        var targetDate = statUtil.getStatTimeDate($("#startDate").val(), stat_searchType, slctType, isPrev);
        var addDate = isPrev ? -1 : 1;

        if(slctType == 0) {
            dayButtonPrev(addDate);
        }else if(slctType == 1) {
            monthButtonPrev(addDate);
        }else if(slctType == 2) {
            yearButtonPrev(addDate);

        }
    }
</script>

