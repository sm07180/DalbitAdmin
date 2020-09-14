<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dummyData"><%= java.lang.Math.round(java.lang.Math.random() * 1000000) %></c:set>

<%
    String in_tabType = request.getParameter("tabType");
%>
<div id="wrapper">
    <div id="page-wrapper">
        <div id="container-fluid" class="col-lg-12 no-padding">
            <!-- searchBox -->
            <form id="searchForm">
                <div class="row col-lg-12 form-inline">
                    <div class="widget widget-table searchBoxArea">
                        <div class="widget-header searchBoxRow">
                            <h3 class="title"><i class="fa fa-search"></i> 검색조건</h3>
                            <div>
                                <span id="slctTypeArea"></span>

                                <div class="input-group date" id="oneDayDatePicker">
                                    <label for="onedayDate" class="input-group-addon">
                                        <span><i class="fa fa-calendar" id="onedayDateBtn"></i></span>
                                    </label>
                                    <input type="text" class="form-control" id="onedayDate" name="onedayDate">
                                </div>

                                <div class="input-group date" id="rangeDatepicker" style="display:none;">
                                    <label for="displayDate" class="input-group-addon">
                                        <span><i class="fa fa-calendar"></i></span>
                                    </label>
                                    <input id="displayDate" type="text" class="form-control" style="width: 196px;"/>
                                </div>

                                <div class="input-group date" id="yearDatepicker" style="display:none;">
                                    <label for="yearDate" class="input-group-addon">
                                        <span><i class="fa fa-calendar"></i></span>
                                    </label>
                                    <input id="yearDate" type="text" class="form-control" style="width: 196px;"/>
                                </div>

                                <input class="hide" name="startDate" id="startDate" style="width: 100px">
                                <input class="hide" name="endDate" id="endDate" style="width: 100px">
                                <%--<input name="startDate" id="startDate" style="width: 100px">--%>
                                <%--<input name="endDate" id="endDate" style="width: 100px">--%>

                                <button type="button" class="btn btn-success" id="bt_search">검색</button>
                                <a href="javascript://" class="_prevSearch">[이전]</a>
                                <a href="javascript://" class="_todaySearch">[오늘]</a>
                                <a href="javascript://" class="_nextSearch">[다음]</a>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            <!-- //serachBox -->
            <!-- 접속 관련 통계 데이터-->
            <div class="row col-lg-12 form-inline hide">
                <div class="widget widget-table mb10">
                    <div class="widget-header">
                        <h3><i class="fa fa-table"></i> 1:1 통계 현황</h3>
                    </div>
                    <div class="widget-content mt10">
                        <table class="table table-bordered">
                            <colgroup>
                                <col width="10%"/><col width="10%"/><col width="10%"/><col width="10%"/><col width="10%"/>
                                <col width="10%"/><col width="10%"/><col width="10%"/><col width="10%"/><col width="10%"/>
                            </colgroup>
                            <thead>
                            <tr>
                                <th></th>
                                <th>실시간</th>
                                <th>전일</th>
                                <th>증감</th>
                                <th>주간</th>
                                <th>전주</th>
                                <th>증감</th>
                                <th>월간</th>
                                <th>전월</th>
                                <th>증감</th>
                            </tr>
                            </thead>
                            <tbody id="infoTableBody"></tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!-- // 접속 관련 통계 데이터 -->
        </div> <!-- // container-fluid -->
        <!-- tab -->
        <div class="no-padding col-lg-12" id="infoTab">
            <jsp:include page="infoTab.jsp"/>
        </div>
        <!-- //tab -->
    </div> <!-- // page-wrapper -->
</div> <!-- // wrapper -->

<script type="text/javascript" src="/js/code/enter/joinCodeList.js?${dummyData}"></script>
<script type="text/javascript" src="/js/util/statUtil.js?${dummyData}"></script>

<script type="text/javascript">

    var tabType = common.isEmpty(<%=in_tabType%>) ? 1 : <%=in_tabType%>;

    var dateTime = new Date();
    dateTime = moment(dateTime).format("YYYY.MM.DD");
    var week = ['일', '월', '화', '수', '목', '금', '토'];
    var toDay = week[moment(new Date()).day()];
    setTimeDate(dateTime);

    $(function(){
        $("#slctTypeArea").append(util.getCommonCodeRadio(0, join_slctType));

        $('#onedayDate').datepicker("onedayDate", new Date()).on('changeDate', function(dateText, inst){
            var selectDate = moment(dateText.date).format("YYYY.MM.DD");
            $("#displayDate").val(selectDate+ ' - ' + selectDate);
            $("#startDate").val(selectDate);
            $("#endDate").val(selectDate);
        });

        $("#displayDate").statsDaterangepicker(
            function(start, end, t1) {
                $("#startDate").val(start.format('YYYY.MM.DD'));
                $("#endDate").val(end.format('YYYY.MM.DD'));

                $("#onedayDate").val($("#startDate").val());
            }
        );
        //방송 통계 현황

        if(!common.isEmpty(tabType)){
            if(tabType == 1){
                $('.nav-tabs li:eq(0) a').tab('show')
            }else if(tabType == 2){
                $('.nav-tabs li:eq(1) a').tab('show')
            }else if(tabType == 3){
                $('.nav-tabs li:eq(2) a').tab('show')
            }else if(tabType == 4){
                $('.nav-tabs li:eq(3) a').tab('show')
            }
        }else{
            getList();
        }
    });

    function setTimeDate(dateTime){
        $("#onedayDate").val(dateTime);
        $("#startDate").val(dateTime);
        $("#endDate").val(dateTime);
        $("._searchDate").html(dateTime + " (" + toDay + ")");
    }

    $(document).on('change', 'input[name="slctType"]', function(){
        radioChange();
    });

    function getList(){
        // util.getAjaxData("info", "/rest/status/question/info", null, fn_info_success);
    }

    function fn_info_success(data, response){
        $("#infoTableBody").empty();
        var template = $('#tmp_info').html();
        var templateScript = Handlebars.compile(template);
        var context = response.data.info;
        var html=templateScript(context);
        $("#infoTableBody").append(html);
    }

    $(document).on('click', '._prevSearch', function(){
        searchDate('prev');
    });

    $(document).on('click', '._nextSearch', function(){
        searchDate('next');
    });

    $(document).on('click', '._todaySearch', function(){
        toDay = week[moment(new Date()).day()];
        $("input:radio[name='slctType']:radio[value='0']").prop('checked', true);
        radioChange();

        setTimeDate(dateTime);
        getList();
        $("#bt_search").click();
    });

    function radioChange(){
        if($('input[name="slctType"]:checked').val() == 0){
            $("#oneDayDatePicker").show();
            $("#rangeDatepicker").hide();
        }else {
            $("#oneDayDatePicker").hide();
            $("#rangeDatepicker").show();
        }
        searchDate();
    }

    function searchDate(dateType){
        var slctType = $('input[name="slctType"]:checked').val();
        //시간별
        if(slctType == 0){
            if(common.isEmpty(dateType)){
                $("#startDate").val(moment(new Date()).format('YYYY.MM.DD'));
                $("#endDate").val(moment(new Date()).format('YYYY.MM.DD'));

                $("._searchDate").html(moment(new Date()).format('YYYY.MM.DD'));

            }else if(dateType == 'prev'){
                setDay(-1);

            }else{
                setDay(1);
            }

            //일별
        }else if(slctType == 1){

            if(common.isEmpty(dateType)){
                $("#startDate").val(moment(new Date()).format('YYYY.MM.01'));
                $("#endDate").val(moment(moment(new Date()).format('YYYY.MM.01')).add('months', 1).add('days', -1).format('YYYY.MM.DD'));

                $("._searchDate").html(moment(new Date()).format('YYYY년 MM월'));
                $("#displayDate").val($("#startDate").val() + ' - ' + $("#endDate").val());

            }else if(dateType == 'prev'){
                setMonth(-1);

            }else if(dateType == 'next'){
                setMonth(1);
            }

            //월별
        }else{

            if(common.isEmpty(dateType)){
                $("#startDate").val(moment(new Date()).format('YYYY.01.01'));
                $("#endDate").val(moment(new Date()).format('YYYY.12.31'));

                $("._searchDate").html(moment(new Date()).format('YYYY년'));
                $("#displayDate").val($("#startDate").val() + ' - ' + $("#endDate").val());

            }else if(dateType == 'prev'){
                setYear(-1);

            }else if(dateType == 'next'){
                setYear(1);
            }
        }
        $("#bt_search").click();
    }

    function setDay(days){
        toDay = week[moment($("#startDate").val()).add('days', days).day()];
        $("#startDate").val(moment($("#startDate").val()).add('days', days).format('YYYY.MM.DD'));
        $("#endDate").val($("#startDate").val());

        $("._searchDate").html($("#startDate").val());
        $("#onedayDate").val($("#startDate").val());
    }

    function setMonth(months){
        $("#startDate").val(moment($("#startDate").val()).add('months', months).format('YYYY.MM.01'));
        $("#endDate").val(moment($("#startDate").val()).add('months', 1).add('days', -1).format('YYYY.MM.DD'));

        $("._searchDate").html(moment($("#startDate").val()).format('YYYY년 MM월'));
        $("#displayDate").val($("#startDate").val() + " - " + $("#endDate").val());
    }

    function setYear(years){
        $("#startDate").val(moment($("#startDate").val()).add('years', years).format('YYYY.01.01'));
        $("#endDate").val(moment($("#startDate").val()).add('years', 1).add('days', -1).format('YYYY.12.31'));

        $("._searchDate").html(moment($("#startDate").val()).format('YYYY년'));
        $("#displayDate").val($("#startDate").val() + " - " + $("#endDate").val());
    }
</script>

<script type="text/x-handlebars-template" id="tmp_info">
    <tr>
        <th>등록건수</th>
        <td>{{addComma now_reg_cnt}}</td>
        <td>{{addComma yes_reg_cnt}}</td>
        <td class="{{upAndDownClass now_inc_cnt}}"><i class="fa {{upAndDownIcon now_inc_cnt}}"></i> {{addComma now_inc_cnt}}</td>
        <td>{{addComma week_reg_cnt}}</td>
        <td>{{addComma bweek_reg_cnt}}</td>
        <td class="{{upAndDownClass week_inc_cnt}}"><i class="fa {{upAndDownIcon week_inc_cnt}}"></i> {{addComma week_inc_cnt}}</td>
        <td>{{addComma month_reg_cnt}}</td>
        <td>{{addComma bmonth_reg_cnt}}</td>
        <td class="{{upAndDownClass month_inc_cnt}}"><i class="fa {{upAndDownIcon month_inc_cnt}}"></i> {{addComma month_inc_cnt}}</td>
    </tr>
    <tr>
        <th>미처리</th>
        <td>{{addComma now_nop_cnt}}</td>
        <td>{{addComma yes_nop_cnt}}</td>
        <td class="{{upAndDownClass now_inc_amt}}"><i class="fa {{upAndDownIcon now_inc_amt}}"></i> {{addComma now_inc_amt}}</td>
        <td>{{addComma week_nop_cnt}}</td>
        <td>{{addComma bweek_nop_cnt}}</td>
        <td class="{{upAndDownClass week_inc_amt}}"><i class="fa {{upAndDownIcon week_inc_amt}}"></i> {{addComma week_inc_amt}}</td>
        <td>{{addComma month_nop_cnt}}</td>
        <td>{{addComma bmonth_nop_cnt}}</td>
        <td class="{{upAndDownClass month_inc_amt}}"><i class="fa {{upAndDownIcon month_inc_amt}}"></i> {{addComma month_inc_amt}}</td>
    </tr>
</script>