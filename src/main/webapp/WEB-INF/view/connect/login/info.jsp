<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="wrapper">
    <div id="page-wrapper" class="col-lg-8">
        <div id="container-fluid">
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
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            <!-- //serachBox -->
            <!-- 접속 관련 통계 데이터-->
            <div class="row col-lg-12 form-inline">
                <div class="widget widget-table mb10">
                    <div class="widget-header">
                        <h3><i class="fa fa-table"></i> 로그인 통계 현황</h3>
                        <div class="btn-group widget-header-toolbar">
                            <a href="#" title="Expand/Collapse" class="btn-borderless btn-toggle-expand"><i class="fa fa-chevron-up"></i></a>
                        </div>
                    </div>
                    <div class="widget-content mt10">
                        <table class="table table-bordered">
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
                            <tbody id="loginLiveTableBody"></tbody>
                        </table>
                    </div>
                </div>
            <!-- // 접속 관련 통계 데이터 -->
            <!-- tab -->
            <div class="no-padding" id="infoTab">
                <jsp:include page="infoTab.jsp"/>
            </div>
            <!-- //tab -->

        </div> <!-- // container-fluid -->
    </div> <!-- // page-wrapper -->
</div> <!-- // wrapper -->

<script type="text/javascript" src="/js/code/enter/joinCodeList.js?${dummyData}"></script>
<script type="text/javascript" src="/js/util/statUtil.js?${dummyData}"></script>

<script type="text/javascript">
    var dateTime = new Date();
    dateTime = moment(dateTime).format("YYYY.MM.DD");
    setTimeDate(dateTime);

    $(function() {
        $("#slctTypeArea").append(util.getCommonCodeRadio(0, join_slctType));

        $('#onedayDate').datepicker("onedayDate", new Date()).on('changeDate', function (dateText, inst) {
            var selectDate = moment(dateText.date).format("YYYY.MM.DD");
            $("#displayDate").val(selectDate + ' - ' + selectDate);
            $("#startDate").val(selectDate);
            $("#endDate").val(selectDate);
        });

        // 월 선택 -------------------------------------
        $('#displayDate').datepicker({
            minViewMode: 'months',
            format: 'yyyy.mm',
            keyboardNavigation: false,
            forceParse: false,
            autoclose: true,
            language: 'kr',
        });

        $("#displayDate").on('change', function () {
            var monthLastDate = new Date($("#displayDate").val().substr(0,4),$("#displayDate").val().substr(5,6),-1);
            $("#startDate").val($("#displayDate").val() + '.01');
            $("#endDate").val($("#displayDate").val() + "." +  (monthLastDate.getDate() + 1));
            $("._searchDate").html(moment($("#startDate").val()).format('YYYY년 MM월'));
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
            $("._searchDate").html(moment($("#startDate").val()).format('YYYY년'));
        });

        //로그인 통계 현황
        getStatJoinInfo();

        $("#tablist_con li.active a").click();
    });

    function setTimeDate(dateTime){
        $("#onedayDate").val(dateTime);
        $("#startDate").val(dateTime);
        $("#endDate").val(dateTime);
        $("._searchDate").html(dateTime);
    }

    function setRangeDate(displayDate, startDate, endDate){
        $("#onedayDate").val(startDate);
        $("#startDate").val(startDate);
        $("#endDate").val(endDate);
        $("._searchDate").html(displayDate);
        $("#displayDate").val(startDate.substr(0,7));
        $("#yearDate").val(startDate.substr(0,4));
    }

    $(document).on('change', 'input[name="slctType"]', function(){
        var me = $(this);
        if(me.val() == 0){
            $("#oneDayDatePicker").show();
            $("#rangeDatepicker").hide();
            $("#yearDatepicker").hide();

            $("#startDate").val($("#onedayDate").val());
            $("#endDate").val($("#onedayDate").val());

            $("._searchDate").html($("#onedayDate").val());
        }else{
            if(me.val() == 1){
                // 일별 -----------------------------------
                $("#oneDayDatePicker").hide();
                $("#rangeDatepicker").show();
                $("#yearDatepicker").hide();

                var monthLastDate = new Date($("#onedayDate").val().substr(0,4),$("#onedayDate").val().substr(5,7),-1);
                $("#startDate").val($("#onedayDate").val().substr(0,8) + "01");
                $("#endDate").val($("#onedayDate").val().substr(0,8) + (monthLastDate.getDate() + 1));
                $("#displayDate").val($("#onedayDate").val().substr(0,7));

                var rangeDate = $("#displayDate").val().split(' - ');
                if(-1 < rangeDate.indexOf(' - ')){
                    $("#startDate").val(rangeDate[0]);
                    $("#endDate").val(rangeDate[1]);
                };
                $("._searchDate").html(moment($("#startDate").val()).format('YYYY년 MM월'));
            }else{
                // 월별 ----------------------------------
                $("#oneDayDatePicker").hide();
                $("#rangeDatepicker").hide();
                $("#yearDatepicker").show();

                var yearDate = new Date();
                $("#startDate").val(yearDate.getFullYear() + '.01.01');
                $("#endDate").val(yearDate.getFullYear() + ".12.31");
                $("#yearDate").val(yearDate.getFullYear());
                $("._searchDate").html(moment($("#startDate").val()).format('YYYY년'));
            }
        }
        $("#tablist_con li.active a").click();
    });

    function getStatJoinInfo(){
        util.getAjaxData("infoLive", "/rest/connect/login/info/live", null, fn_loginLive_success);
    }

    function fn_loginLive_success(data, response){
        var template = $('#tmp_loginLive').html();
        var templateScript = Handlebars.compile(template);
        var context = response.data;
        var html=templateScript(context);
        $("#loginLiveTableBody").append(html);
    }

    $(document).on('click', '._prevSearch', function(){
        prevNext(true);
    });

    $(document).on('click', '._nextSearch', function(){
        prevNext(false);
    });

    function prevNext(isPrev){
        var slctType = $('input[name="slctType"]:checked').val();
        var targetDate = statUtil.getStatTimeDate($("#startDate").val(), stat_searchType, slctType, isPrev);
        var addDate = isPrev ? -1 : 1;

        if(slctType == 0){
            setTimeDate(targetDate);
        }else if(slctType == 1){
            $("#startDate").val(moment($("#startDate").val()).add("months", addDate).format('YYYY.MM.DD'));
            var monthLastDate = new Date($("#startDate").val().substr(0,4),$("#startDate").val().substr(5,7),-1);
            $("#endDate").val($("#startDate").val().substr(0,8) +(monthLastDate.getDate() + 1));
            setRangeDate(targetDate, $("#startDate").val(), $("#endDate").val());
        }else{
            $("#startDate").val(moment($("#startDate").val()).add("years", addDate).format('YYYY.MM.DD'));
            $("#endDate").val(moment($("#endDate").val()).add("years", addDate).format('YYYY.MM.DD'));
            setRangeDate(targetDate, $("#startDate").val(), $("#endDate").val());
        }
        $("#tablist_con li.active a").click();
    }
</script>

<script type="text/x-handlebars-template" id="tmp_loginLive">
    <tr>
        <th>남성</th>
        <td>{{addComma m_now_cnt}}</td>
        <td>{{addComma m_yes_cnt}}</td>
        <td class="{{upAndDownClass m_now_inc_cnt}}"><i class="fa {{upAndDownIcon m_now_inc_cnt}}"></i> {{addComma m_now_inc_cnt}}</td>
        <td>{{addComma m_week_cnt}}</td>
        <td>{{addComma m_bweek_cnt}}</td>
        <td class="{{upAndDownClass m_week_inc_cnt}}"><i class="fa {{upAndDownIcon m_week_inc_cnt}}"></i> {{addComma m_week_inc_cnt}}</td>
        <td>{{addComma m_month_cnt}}</td>
        <td>{{addComma m_bmonth_cnt}}</td>
        <td class="{{upAndDownClass m_month_inc_cnt}}"><i class="fa {{upAndDownIcon m_month_inc_cnt}}"></i> {{addComma m_month_inc_cnt}}</td>
    </tr>
    <tr>
        <th>여성</th>
        <td>{{addComma f_now_cnt}}</td>
        <td>{{addComma f_yes_cnt}}</td>
        <td class="{{upAndDownClass f_now_inc_cnt}}"><i class="fa {{upAndDownIcon f_now_inc_cnt}}"></i> {{addComma f_now_inc_cnt}}</td>
        <td>{{addComma f_week_cnt}}</td>
        <td>{{addComma f_bweek_cnt}}</td>
        <td class="{{upAndDownClass f_week_inc_cnt}}"><i class="fa {{upAndDownIcon f_week_inc_cnt}}"></i> {{addComma f_week_inc_cnt}}</td>
        <td>{{addComma f_month_cnt}}</td>
        <td>{{addComma f_bmonth_cnt}}</td>
        <td class="{{upAndDownClass f_month_inc_cnt}}"><i class="fa {{upAndDownIcon f_month_inc_cnt}}"></i> {{addComma f_month_inc_cnt}}</td>
    </tr>
    <tr>
        <th>알수없음</th>
        <td>{{addComma n_now_cnt}}</td>
        <td>{{addComma n_yes_cnt}}</td>
        <td class="{{upAndDownClass n_now_inc_cnt}}"><i class="fa {{upAndDownIcon n_now_inc_cnt}}"></i> {{addComma n_now_inc_cnt}}</td>
        <td>{{addComma n_week_cnt}}</td>
        <td>{{addComma n_bweek_cnt}}</td>
        <td class="{{upAndDownClass n_week_inc_cnt}}"><i class="fa {{upAndDownIcon n_week_inc_cnt}}"></i> {{addComma n_week_inc_cnt}}</td>
        <td>{{addComma n_month_cnt}}</td>
        <td>{{addComma n_bmonth_cnt}}</td>
        <td class="{{upAndDownClass n_month_inc_cnt}}"><i class="fa {{upAndDownIcon n_month_inc_cnt}}"></i> {{addComma n_month_inc_cnt}}</td>
    </tr>
    <tr>
        <th>합계</th>
        <td>{{addComma t_now_cnt}}</td>
        <td>{{addComma t_yes_cnt}}</td>
        <td class="{{upAndDownClass t_now_inc_cnt}}"><i class="fa {{upAndDownIcon t_now_inc_cnt}}"></i> {{addComma t_now_inc_cnt}}</td>
        <td>{{addComma t_week_cnt}}</td>
        <td>{{addComma t_bweek_cnt}}</td>
        <td class="{{upAndDownClass t_week_inc_cnt}}"><i class="fa {{upAndDownIcon t_week_inc_cnt}}"></i> {{addComma t_week_inc_cnt}}</td>
        <td>{{addComma t_month_cnt}}</td>
        <td>{{addComma t_bmonth_cnt}}</td>
        <td class="{{upAndDownClass t_month_inc_cnt}}"><i class="fa {{upAndDownIcon t_month_inc_cnt}}"></i> {{addComma t_month_inc_cnt}}</td>
    </tr>
</script>