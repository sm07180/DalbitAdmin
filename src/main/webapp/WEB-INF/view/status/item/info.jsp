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

<script type="text/javascript" src="/js/code/enter/joinCodeList.?${dummyData}"></script>
<script type="text/javascript" src="/js/util/statUtil.js?${dummyData}"></script>
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
        util.getAjaxData("itemLive", "/rest/status/item/live/list", null, fn_live_success);
    }

    function fn_live_success(data, response){
        var template = $('#tmp_live').html();
        var templateScript = Handlebars.compile(template);
        var context = response.data.liveInfo;
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
        <th>건수</th>
        <td>{{addComma now_item_cnt}}</td>
        <td>{{addComma yes_item_cnt}}</td>
        <td class="{{upAndDownClass now_inc_cnt}}"><i class="fa {{upAndDownIcon now_inc_cnt}}"></i> {{addComma now_inc_cnt}}</td>
        <td>{{addComma week_item_cnt}}</td>
        <td>{{addComma bweek_item_cnt}}</td>
        <td class="{{upAndDownClass week_inc_cnt}}"><i class="fa {{upAndDownIcon week_inc_cnt}}"></i> {{addComma week_inc_cnt}}</td>
        <td>{{addComma month_item_cnt}}</td>
        <td>{{addComma bmonth_item_cnt}}</td>
        <td class="{{upAndDownClass month_inc_cnt}}"><i class="fa {{upAndDownIcon month_inc_cnt}}"></i> {{addComma month_inc_cnt}}</td>
    </tr>
    <tr>
        <th>금액</th>
        <td>{{addComma now_item_amt}}</td>
        <td>{{addComma yes_item_amt}}</td>
        <td class="{{upAndDownClass now_inc_amt}}"><i class="fa {{upAndDownIcon now_inc_amt}}"></i> {{addComma now_inc_amt}}</td>
        <td>{{addComma week_item_amt}}</td>
        <td>{{addComma bweek_item_amt}}</td>
        <td class="{{upAndDownClass week_inc_amt}}"><i class="fa {{upAndDownIcon week_inc_amt}}"></i> {{addComma week_inc_amt}}</td>
        <td>{{addComma month_item_amt}}</td>
        <td>{{addComma bmonth_item_amt}}</td>
        <td class="{{upAndDownClass month_inc_amt}}"><i class="fa {{upAndDownIcon month_inc_amt}}"></i> {{addComma month_inc_amt}}</td>
    </tr>
    <%--<tr>
        <th>합계</th>
        <td>{{addComma }}</td>
        <td>{{addComma }}</td>
        <td class="{{upAndDownClass }}"><i class="fa {{upAndDownIcon }}"></i> {{addComma }}</td>
        <td>{{addComma }}</td>
        <td>{{addComma }}</td>
        <td class="{{upAndDownClass }}"><i class="fa {{upAndDownIcon }}"></i> {{addComma }}</td>
        <td>{{addComma }}</td>
        <td>{{addComma }}</td>
        <td class="{{upAndDownClass }}"><i class="fa {{upAndDownIcon }}"></i> {{addComma }}</td>
    </tr>--%>
</script>