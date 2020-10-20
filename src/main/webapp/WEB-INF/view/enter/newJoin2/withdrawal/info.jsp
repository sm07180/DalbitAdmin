<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dummyData"><%= java.lang.Math.round(java.lang.Math.random() * 1000000) %></c:set>

<%
    String in_tabType = request.getParameter("tabType");
%>

<div id="wrapper">
    <div id="page-wrapper" class="col-lg-8 no-padding">
        <div class="container-fluid">
            <form id="searchForm">
                <div class="row form-inline">
                    <div class="widget widget-table searchBoxArea">
                        <div class="widget-header searchBoxRow">
                            <h3 class="title"><i class="fa fa-search"></i> 검색조건</h3>
                            <div>
                                <%--<span id="slctTypeArea"></span>--%>
                                <span id="searchFormRadio" style="display: none;"></span>

                                <div class="input-group date" id="oneDayDatePicker"  style="display:none;">
                                    <label for="onedayDate" class="input-group-addon">
                                        <span><i class="fa fa-calendar" id="onedayDateBtn"></i></span>
                                    </label>
                                    <input type="text" class="form-control" id="onedayDate" name="onedayDate">
                                </div>

                                <div class="input-group date" id="monthDatepicker">
                                    <label for="monthDate" class="input-group-addon">
                                        <span><i class="fa fa-calendar"></i></span>
                                    </label>
                                    <input id="monthDate" type="text" class="form-control" style="width: 196px;"/>
                                </div>

                                <div class="input-group date" id="yearDatepicker" style="display:none;">
                                    <label for="yearDate" class="input-group-addon">
                                        <span><i class="fa fa-calendar"></i></span>
                                    </label>
                                    <input id="yearDate" type="text" class="form-control" style="width: 196px;"/>
                                </div>

                                <div class="input-group date" id="rangeDatepicker"  style="display:none; width: 200px">
                                    <label for="displayDate" class="input-group-addon">
                                        <span><i class="fa fa-calendar"></i></span>
                                    </label>
                                    <input type="text" name="displayDate" id="displayDate" class="form-control" />
                                </div>

                                <input type="hidden" name="startDate" id="startDate">
                                <input type="hidden" name="endDate" id="endDate" />
                                <%--<input name="startDate" id="startDate">--%>
                                <%--<input name="endDate" id="endDate" />--%>

                                <input type="text" class="form-control" id="txt_search" name="txt_search" style="display:none;width: 100px" >
                                <button type="button" class="btn btn-success" id="bt_search">검색</button>
                                <a href="javascript://" class="_prevSearch">[이전]</a>
                                <a href="javascript://" class="_todaySearch">[오늘]</a>
                                <a href="javascript://" class="_nextSearch">[다음]</a>

                                <span id="searchCheck" style="display: none">
                                    <label class="control-inline fancy-checkbox custom-color-green">
                                        <input type="checkbox" name="search_testId" id="search_testId" value="1" checked="true">
                                        <span>테스트 아이디 제외</span>
                                    </label>

                                    <label class="control-inline fancy-checkbox custom-color-green">
                                        <input type="checkbox" name="search_joinPath" id="search_joinPath" value="1">
                                        <span>광고유입</span>
                                    </label>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <div class="col-lg-4" id="stateSummary">
        <span id="summary"></span>
    </div>

    <div class="col-lg-4" id="joinListSummary" style="display: none">
        <span id="joinList_summaryArea"></span>
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

    var slctType;

    var tabType = <%=in_tabType%>;

    $(function(){
        // $("#slctTypeArea").append(util.getCommonCodeRadio(0, join_slctType));
        $("#searchFormRadio").html(util.getCommonCodeRadio(2, searchFormRadio));

        $('#onedayDate').datepicker("onedayDate", new Date()).on('changeDate', function(dateText, inst){
            var selectDate = moment(dateText.date).format("YYYY.MM.DD");
            $("#startDate").val(selectDate);
            $("#endDate").val(selectDate);
        });

        // 월 선택 -------------------------------------
        $('#monthDate').datepicker({
            minViewMode: 'months',
            format: 'yyyy.mm',
            keyboardNavigation: false,
            forceParse: false,
            autoclose: true,
            language: 'kr',
        });

        $("#monthDate").on('change', function () {
            var monthLastDate = new Date($("#monthDate").val().substr(0,4),$("#monthDate").val().substr(5,6),-1);
            $("#startDate").val($("#monthDate").val() + '.01');
            $("#endDate").val($("#monthDate").val() + "." +  (monthLastDate.getDate() + 1));
        });

        // 년 선택 --------------------------------
        $('#yearDate').datepicker({
            minViewMode: 'years',
            format: 'yyyy',
            keyboardNavigation: false,
            forceParse: false,
            autoclose: true,
            language: 'kr',
        });
        $("#yearDate").on('change', function () {
            $("#startDate").val($("#yearDate").val() + '.01.01');
            $("#endDate").val($("#yearDate").val() + ".12.31");
        });

        $("#displayDate").statsDaterangepicker(
            function(start, end, t1) {
                $("#startDate").val(start.format('YYYY.MM.DD'));
                $("#endDate").val(end.format('YYYY.MM.DD'));
            }
        );

        radioChange();

    });

    function setTimeDate(dateTime){
        $("#onedayDate").val(dateTime);
        $("#startDate").val(dateTime);
        $("#endDate").val(dateTime);
        $("#displayDate").val(dateTime + " - " + dateTime);
        $("._searchDate").html(dateTime + " (" + toDay + ")");
    }

    function setRangeDate(displayDate, startDate, endDate){
        $("#onedayDate").val(startDate);
        $("#startDate").val(startDate);
        $("#endDate").val(endDate);
        $("#displayDate").val(startDate.substr(0,7));
        $("#yearDate").val(startDate.substr(0,4));
    }

    $(document).on('click', '._prevSearch', function(){
        prevNext(true);
    });

    $(document).on('click', '._nextSearch', function(){
        prevNext(false);
    });

    $(document).on('click', '._todaySearch', function(){
        if(tabId == 'tab_time'){
            slctType = "0";
            me = 0;
        }else if(tabId == 'tab_calendar' || tabId == 'tab_month') {
            slctType = "1";
            me = 1;
        }else if(tabId == 'tab_list') {
            slctType = "2";
            me = 2;

            $("input:radio[name='searchFormRadio']:radio[value='2']").prop('checked', true);
            _searchFormRadio = $('input[name="searchFormRadio"]:checked').val();
        }
        setTimeDate(dateTime);
        radioChange();
        $("#bt_search").click();
    });

    var me = 1;
    function radioChange(){
        if(me == 0){
            $("#oneDayDatePicker").show();
            $("#monthDatepicker").hide();
            $("#yearDatepicker").hide();
            $("#rangeDatepicker").hide();
            $("#startDate").val($("#onedayDate").val());
            $("#endDate").val($("#onedayDate").val());
        }else{
            if(me == 1){
                // 일별 -----------------------------------
                $("#oneDayDatePicker").hide();
                $("#monthDatepicker").show();
                $("#yearDatepicker").hide();
                $("#rangeDatepicker").hide();

                var monthLastDate = new Date($("#onedayDate").val().substr(0,4),$("#onedayDate").val().substr(5,7),-1);
                $("#startDate").val($("#onedayDate").val().substr(0,8) + "01");
                $("#endDate").val($("#onedayDate").val().substr(0,8) + (monthLastDate.getDate() + 1));
                $("#monthDate").val($("#onedayDate").val().substr(0,7));

                var rangeDate = $("#monthDate").val().split(' - ');
                if(-1 < rangeDate.indexOf(' - ')){
                    $("#startDate").val(rangeDate[0]);
                    $("#endDate").val(rangeDate[1]);
                };
            }else{
                // 월별 ----------------------------------
                $("#oneDayDatePicker").hide();
                $("#monthDatepicker").hide();
                $("#yearDatepicker").hide();
                $("#rangeDatepicker").show();

                _searchFormRadio = $('input[name="searchFormRadio"]:checked').val();
                setStartDay();
            }
        }
    }

    var slctType = 1;
    function prevNext(isPrev){

        var targetDate = statUtil.getStatTimeDate($("#startDate").val(), stat_searchType, slctType, isPrev);
        var addDate = isPrev ? -1 : 1;

        toDay = week[moment($("#startDate").val()).add('days', addDate).day()];

        if(slctType == 0){
            setTimeDate(targetDate);
            $("#bt_search").click();
        }else if(slctType == 1){
            $("#startDate").val(moment($("#startDate").val()).add("months", addDate).format('YYYY.MM.DD'));
            var monthLastDate = new Date($("#startDate").val().substr(0,4),$("#startDate").val().substr(5,7),-1);
            $("#endDate").val($("#startDate").val().substr(0,8) +(monthLastDate.getDate() + 1));
            setRangeDate(targetDate, $("#startDate").val(), $("#endDate").val());
        // }else if(slctType == 2){
        //     $("#startDate").val(moment($("#startDate").val()).add("years", addDate).format('YYYY.MM.DD'));
        //     $("#endDate").val(moment($("#endDate").val()).add("years", addDate).format('YYYY.MM.DD'));
        //     setRangeDate(targetDate, $("#startDate").val(), $("#endDate").val());
            $("#bt_search").click();
        }else if(slctType == 2){
            $("#startDate").val(moment($("#startDate").val()).add("days", addDate).format('YYYY.MM.DD'));
            $("#endDate").val(moment($("#endDate").val()).add("days", addDate).format('YYYY.MM.DD'));

            $("#displayDate").val($("#startDate").val() + " - " + $("#endDate").val());

            getUserInfo();
        }
    }

    $(document).on('change', 'input[name="searchFormRadio"]', function(){
        radioChange();
    });

    function setStartDay(){
        var date = new Date();
        $("#endDate").val(dateTime);

        if(_searchFormRadio == 1) {     // 일주일 전
            sDate = new Date(Date.parse(date) - 7 * 1000 * 60 * 60 * 24);           // 일주일 전
            sDate = date.getFullYear() +"."+ common.lpad(sDate.getMonth() + 1,2,"0") +"."+ common.lpad(sDate.getDate()+1,2,"0");      // 일주일전
            $("#startDate").val(sDate);
        }else if(_searchFormRadio == 0) {       // 한달전
            $("#startDate").val(date.getFullYear() +"."+ common.lpad(date.getMonth(),2,"0") +"."+ common.lpad(date.getDate(),2,"0"));        // 한달전
        }else if(_searchFormRadio == 2) {       // 날짜선택
            $("#startDate").val(dateTime);
        }
        $("#displayDate").val($("#startDate").val() + " - " + $("#endDate").val());

        getUserInfo();
    }

    function setSummary(response){

        console.log("-------------- setSummary -----------------");
        console.log(response);

        response.totalInfo.accum_total_join_cnt = accum_total_join_cnt;
        response.totalInfo.accum_total_out_cnt = accum_total_out_cnt;
        response.totalInfo.accum_total_join_before_cnt = accum_total_join_before_cnt;
        response.totalInfo.accum_total_out_before_cnt = accum_total_out_before_cnt;

        response.totalInfo.sum_inc_total_cnt = response.totalInfo.sum_total_join_cnt - response.totalInfo.accum_total_join_before_cnt;

        response.totalInfo.sum_total_out_cnt = response.totalInfo.sum_pc_total_out_cnt + response.totalInfo.sum_aos_total_out_cnt + response.totalInfo.sum_ios_total_out_cnt;
        response.totalInfo2.sum_total_out_cnt = response.totalInfo2.sum_pc_total_out_cnt + response.totalInfo2.sum_aos_total_out_cnt + response.totalInfo2.sum_ios_total_out_cnt;

        response.totalInfo.sum_inc_out_total_cnt = response.totalInfo.sum_total_out_cnt - response.totalInfo.accum_total_out_before_cnt;

        var template = $('#tmp_summary').html();
        var templateScript = Handlebars.compile(template);
        var context = response.totalInfo;
        var html=templateScript(context);
        $("#summary").html(html);

        ui.tableHeightSet();
        ui.paintColor();
    }

    function withdrawalListSummary(json){
        var template = $("#joinList_tableSummary").html();
        var templateScript = Handlebars.compile(template);
        var data = {
            content : json.summary
            , length : json.recordsTotal
        }
        var html = templateScript(data);
        $("#joinList_summaryArea").html(html);

        ui.tableHeightSet();
        ui.paintColor();
    }
</script>


<script type="text/x-handlebars-template" id="tmp_summary">
    <table class="table table-bordered _tableHeight no-margin" data-height="23px">
        <colgroup>
            <col width="8.3%"/><col width="8.3%"/><col width="8.3%"/><col width="8.3%"/><col width="8.3%"/>
            <col width="8.3%"/><col width="8.3%"/><col width="10%"/><col width="10%"/>
        </colgroup>

        <tr>
            <th colspan="3" class="_bgColor" data-bgColor="#b3c7e7">성별</th>
            <th colspan="3" class="_bgColor" data-bgColor="#f8cbaa">플랫폼별</th>
            <th colspan="2" class="_bgColor" data-bgColor="#bfbfbf">총합</th>
            <th class="_bgColor" data-bgColor="#bfbfbf">비율</th>
        </tr>
        <tr>
            <th class="_bgColor" data-bgColor="#dbe2f4">{{{sexIcon 'm'}}}</th>
            <th class="_bgColor" data-bgColor="#dbe2f4">{{{sexIcon 'f'}}}</th>
            <th class="_bgColor" data-bgColor="#dbe2f4">{{{sexIcon 'n'}}}</th>
            <th class="_bgColor" data-bgColor="#fde6d8">AOS</th>
            <th class="_bgColor" data-bgColor="#fde6d8">IOS</th>
            <th class="_bgColor" data-bgColor="#fde6d8">PC</th>
            <th class="_bgColor" data-bgColor="#ffe699">가입</th>
            <th class="_bgColor" data-bgColor="#f2f2f2">탈퇴</th>
            <th class="_bgColor" data-bgColor="#f2f2f2">가입 대비 탈퇴</th>
        </tr>
        <tr>
            <td>{{sum_total_out_mcnt}}<br/>({{average  sum_total_out_mcnt sum_total_out_cnt}}%)</td>
            <td>{{sum_total_out_fcnt}}<br/>({{average  sum_total_out_fcnt sum_total_out_cnt}}%)</td>
            <td>{{sum_total_out_ncnt}}<br/>({{average  sum_total_out_ncnt sum_total_out_cnt}}%)</td>
            <td>{{sum_aos_total_out_cnt}}<br/>({{average  sum_aos_total_out_cnt sum_total_out_cnt}}%)</td>
            <td>{{sum_ios_total_out_cnt}}<br/>({{average  sum_ios_total_out_cnt sum_total_out_cnt}}%)</td>
            <td>{{sum_pc_total_out_cnt}}<br/>({{average sum_pc_total_out_cnt sum_total_out_cnt}}%)</td>
            <td class="{{upAndDownClass sum_inc_total_cnt}}"><span style="color: #555555">{{sum_total_join_cnt}}</span> <br/> (<i class="fa {{upAndDownIcon sum_inc_total_cnt}}"></i> <span>{{addComma sum_inc_total_cnt}}</span>)</td>
            <td class="{{upAndDownClass sum_inc_out_total_cnt}}"><span style="color: #555555">{{sum_total_out_cnt}}</span> <br/> (<i class="fa {{upAndDownIcon sum_inc_out_total_cnt}}"></i> <span>{{addComma sum_inc_out_total_cnt}}</span>)</td>
            <td>{{average sum_total_out_cnt sum_total_join_cnt 0}}%</td>
        </tr>

    </table>
</script>



<script id="joinList_tableSummary" type="text/x-handlebars-template">
    <table class="table table-bordered _tableHeight no-margin" data-height="23px">
        <colgroup>
            <col width="8.3%"/><col width="8.3%"/><col width="8.3%"/><col width="8.3%"/><col width="8.3%"/>
            <col width="8.3%"/><col width="8.3%"/><col width="8.3%"/>
        </colgroup>

        <colgroup>
            <col width="8.3%"/><col width="8.3%"/><col width="8.3%"/><col width="8.3%"/><col width="8.3%"/>
            <col width="8.3%"/><col width="8.3%"/><col width="10%"/><col width="10%"/>
        </colgroup>

        <tr>
            <th colspan="3" class="_bgColor" data-bgColor="#b3c7e7">성별</th>
            <th colspan="3" class="_bgColor" data-bgColor="#f8cbaa">플랫폼별</th>
            <th class="_bgColor" data-bgColor="#bfbfbf">총합</th>
        </tr>
        <tr>
            <th class="_bgColor" data-bgColor="#dbe2f4">{{{sexIcon 'm'}}}</th>
            <th class="_bgColor" data-bgColor="#dbe2f4">{{{sexIcon 'f'}}}</th>
            <th class="_bgColor" data-bgColor="#dbe2f4">{{{sexIcon 'n'}}}</th>
            <th class="_bgColor" data-bgColor="#fde6d8">AOS</th>
            <th class="_bgColor" data-bgColor="#fde6d8">IOS</th>
            <th class="_bgColor" data-bgColor="#fde6d8">PC</th>
            <th class="_bgColor" data-bgColor="#f2f2f2">탈퇴</th>
        </tr>
        <tr>
            <td>{{content.maleCnt}}<br/>({{average content.maleCnt content.allCnt}}%)</td>
            <td>{{content.femaleCnt}}<br/>({{average content.femaleCnt content.allCnt}}%)</td>
            <td>{{content.noneCnt}}<br/>({{average content.noneCnt content.allCnt}}%)</td>
            <td>{{content.aosCnt}}<br/>({{average content.aosCnt content.allCnt}}%)</td>
            <td>{{content.iosCnt}}<br/>({{average content.iosCnt content.allCnt}}%)</td>
            <td>{{content.pcCnt}}<br/>({{average content.pcCnt content.allCnt}}%)</td>
            <td>{{content.allCnt}}</td>
        </tr>
    </table>
</script>