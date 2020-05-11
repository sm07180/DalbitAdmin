<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="container-fluid">
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
                                    <input type="text" name="displayDate" id="displayDate" class="form-control" />
                                </div>
                                <input type="hidden" name="startDate" id="startDate">
                                <input type="hidden" name="endDate" id="endDate" />
                                <button type="button" class="btn btn-success" id="bt_search">검색</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>

            <div class="row col-lg-12 form-inline">
                <!-- 가입자수 -->
                <div class="widget widget-table mb10">
                    <div class="widget-header">
                        <h3><i class="fa fa-table"></i> 아이템 통계 현황</h3>
                        <div class="btn-group widget-header-toolbar">
                            <a href="#" title="Expand/Collapse" class="btn-borderless btn-toggle-expand"><i class="fa fa-chevron-up"></i></a>
                        </div>
                    </div>
                    <div class="widget-content mt10">
                        <table class="table table-bordered">
                            <thead>
                            <tr>
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
                            <tbody id="liveTableBody"></tbody>
                        </table>
                    </div>
                </div>
            </div>

            <!-- tab -->
            <div class="no-padding" id="infoTab">
                <jsp:include page="infoTab.jsp"/>
            </div>
            <!-- //tab -->
        </div>
    </div>
</div>

<script type="text/javascript" src="/js/code/enter/joinCodeList.js"></script>
<script type="text/javascript" src="/js/util/statUtil.js"></script>
<script type="text/javascript">
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

        var dateTime = new Date();
        dateTime = moment(dateTime).format("YYYY.MM.DD");
        setTimeDate(dateTime);

        getInfo();
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
        $("#displayDate").val(startDate + ' - ' + endDate);
    }

    $(document).on('change', 'input[name="slctType"]', function(){
        var me = $(this);
        if(me.val() == 0){
            $("#oneDayDatePicker").show();
            $("#rangeDatepicker").hide();

            $("#startDate").val($("#onedayDate").val());
            $("#endDate").val($("#onedayDate").val());

            $("._searchDate").html($("#onedayDate").val());

        }else{
            $("#oneDayDatePicker").hide();
            $("#rangeDatepicker").show();

            var rangeDate = $("#displayDate").val().split(' - ')
            if(-1 < rangeDate.indexOf(' - ')){
                $("#startDate").val(rangeDate[0]);
                $("#endDate").val(rangeDate[1]);
            };

            if(me.val() == 1){
                $("._searchDate").html(moment($("#onedayDate").val()).format('YYYY년 MM월'));
            }else{
                $("._searchDate").html(moment($("#onedayDate").val()).format('YYYY년'));
            }
        }
    });

    function getInfo(){
        util.getAjaxData("statJoin", "/rest/enter/join/stat/join", null, fn_live_success);
    }

    function fn_live_success(data, response){
        var template = $('#tmp_live').html();
        var templateScript = Handlebars.compile(template);
        var context = response.data.joinInfo;
        var html=templateScript(context);
        $("#liveTableBody").append(html);
    }

    $(document).on('click', '._prevSearch', function(){
        prevNext(true);
    });

    $(document).on('click', '._nextSearch', function(){
        prevNext(false);
    });

    function prevNext(isPrev){
        var slctType = $('input[name="slctType"]:checked').val();
        var targetDate = statUtil.getStatTimeDate($("#onedayDate").val(), stat_searchType, slctType, isPrev);
        var addDate = isPrev ? -1 : 1;

        if(slctType == 0){
            setTimeDate(targetDate);
        }else if(slctType == 1){
            $("#startDate").val(moment($("#startDate").val()).add("months", addDate).format('YYYY.MM.DD'));
            $("#endDate").val(moment($("#endDate").val()).add("months", addDate).format('YYYY.MM.DD'));
            setRangeDate(targetDate, $("#startDate").val(), $("#endDate").val());
        }else{
            $("#startDate").val(moment($("#startDate").val()).add("years", addDate).format('YYYY.MM.DD'));
            $("#endDate").val(moment($("#endDate").val()).add("years", addDate).format('YYYY.MM.DD'));
            setRangeDate(targetDate, $("#startDate").val(), $("#endDate").val());
        }
        $("#bt_search").click();
    }
</script>

<script type="text/x-handlebars-template" id="tmp_live">
    <tr>
        <th>남</th>
        <td>{{addComma m_now_Cnt}}</td>
        <td>{{addComma m_yes_Cnt}}</td>
        <td class="{{upAndDownClass m_now_inc_cnt}}"><i class="fa {{upAndDownIcon m_now_inc_cnt}}"></i> {{addComma m_now_inc_cnt}}</td>
        <td>{{addComma m_week_cnt}}</td>
        <td class="{{upAndDownClass m_week_inc_cnt}}"><i class="fa {{upAndDownIcon m_week_inc_cnt}}"></i> {{addComma m_week_inc_cnt}}</td>
    </tr>
    <tr>
        <th>여</th>
        <td>{{addComma f_now_Cnt}}</td>
        <td>{{addComma f_yes_Cnt}}</td>
        <td class="{{upAndDownClass f_now_inc_cnt}}"><i class="fa {{upAndDownIcon f_now_inc_cnt}}"></i> {{addComma f_now_inc_cnt}}</td>
        <td>{{addComma f_week_cnt}}</td>
        <td class="{{upAndDownClass f_week_inc_cnt}}"><i class="fa {{upAndDownIcon f_week_inc_cnt}}"></i> {{addComma f_week_inc_cnt}}</td>
    </tr>
    <tr>
        <th>알수없음</th>
        <td>{{addComma n_now_Cnt}}</td>
        <td>{{addComma n_yes_Cnt}}</td>
        <td class="{{upAndDownClass n_now_inc_cnt}}"><i class="fa {{upAndDownIcon n_now_inc_cnt}}"></i> {{addComma n_now_inc_cnt}}</td>
        <td>{{addComma n_week_cnt}}</td>
        <td class="{{upAndDownClass n_week_inc_cnt}}"><i class="fa {{upAndDownIcon n_week_inc_cnt}}"></i> {{addComma n_week_inc_cnt}}</td>
    </tr>
    <tr>
        <th>총계</th>
        <td>{{addComma t_now_Cnt}}</td>
        <td>{{addComma t_yes_Cnt}}</td>
        <td class="{{upAndDownClass t_now_inc_cnt}}"><i class="fa {{upAndDownIcon t_now_inc_cnt}}"></i> {{addComma t_now_inc_cnt}}</td>
        <td>{{addComma t_week_cnt}}</td>
        <td class="{{upAndDownClass t_week_inc_cnt}}"><i class="fa {{upAndDownIcon t_week_inc_cnt}}"></i> {{addComma t_week_inc_cnt}}</td>
    </tr>
</script>