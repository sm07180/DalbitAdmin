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
                                <span id="sp_zoneDate"></span>
                                <div class="input-group date" id="event-div-startDate">
                                    <span class="input-group-addon" id="iconStartDate"><i class="fa fa-calendar"></i></span>
                                    <input type="text" class="form-control" name="startDate" id="startDate" style="width:100px; background:white;" readonly>
                                </div>
                                <span> ~ </span>
                                <div class="input-group date" id="event-div-endDate">
                                    <span class="input-group-addon disabled" id="iconEndDate"><i class="fa fa-calendar"></i></span>
                                    <input type="text" class="form-control" name="endDate" id="endDate" style="width:100px; background:white;" readonly>
                                </div>
                                <button type="button" class="btn btn-success" id="bt_search">검색</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>

            <div class="row col-lg-12 form-inline">
                <div class="col-lg-6 pl0 pr5">
                    <!-- 방송 -->
                    <div class="widget widget-table mb10">
                        <div class="widget-header">
                            <h3><i class="fa fa-table"></i> 방송 통계 현황</h3>
                            <div class="btn-group widget-header-toolbar">
                                <a href="#" title="Expand/Collapse" class="btn-borderless btn-toggle-expand"><i class="fa fa-chevron-up"></i></a>
                            </div>
                        </div>
                        <div class="widget-content mt10">
                            <table class="table table-bordered" id="tb_broadSumStatus">
                                <thead>
                                    <tr>
                                        <th></th>
                                        <th>실시간</th>
                                        <th>전일</th>
                                        <th>증감</th>
                                        <th>주간</th>
                                        <th>증감</th>
                                    </tr>
                                </thead>
                                <tbody id="broadSumStatus">
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!-- //방송 -->
                </div>

                <div class="col-lg-6 pr0 pl5">
                    <!-- 선물 -->
                    <div class="widget widget-table mb10">
                        <div class="widget-header">
                            <h3><i class="fa fa-table"></i> 선물 통계 현황</h3>
                            <div class="btn-group widget-header-toolbar">
                                <a href="#" title="Expand/Collapse" class="btn-borderless btn-toggle-expand"><i class="fa fa-chevron-up"></i></a>
                            </div>
                        </div>
                        <div class="widget-content mt10">
                            <table class="table table-bordered" id="tb_giftSumStatus">
                                <thead>
                                <tr>
                                    <th></th>
                                    <th>실시간</th>
                                    <th>전일</th>
                                    <th>증감</th>
                                    <th>주간</th>
                                    <th>증감</th>
                                </tr>
                                </thead>
                                <tbody id="giftSumStatus">
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!-- //선물 -->
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

<script type="text/javascript" src="/js/code/status/statusCodeList.js"></script>

<script type="text/javascript">

    $("#sp_zoneDate").html(util.getCommonCodeRadio(0, zoneDate));
    $(document).ready(function () {
        broadcastStatus.init();
        <!-- 버튼 -->
        $('#bt_search').click( function() {       //검색
            getList();
        });
    });

    var broadcastStatus = {
        // Datapicker
        "dataPickerSrc": {
            startDate: moment(),
            endDate: moment(),
            // dateLimit: { days: 60 },
            showDropdowns: true,
            showWeekNumbers: true,
            timePicker: false,
            timePickerIncrement: 1,
            timePicker12Hour: false,
            ranges: {
                '1일': [moment(), moment()],
                '7일': [moment(), moment().add('days', 6)],
                '30일': [moment(), moment().add('days', 29)]
            },
            opens: 'left',
            format: 'L',
            separator: ' to ',
            locale: {
                customRangeLabel: '직접선택',
            }
        },

        init() {
            this.initDetail();
            getList();
        },
        // 초기 설정
        initDetail() {
            // 캘린더 기능추가
            $("#iconStartDate, #iconEndDate").daterangepicker( this.dataPickerSrc,
                function(start, end, t1) {
                    $("#startDate").val(start.format('YYYY-MM-DD'));
                    $("#endDate").val(end.format('YYYY-MM-DD'));
                }
            );
            // 캘린더 초기값
            $("[name=startDate]").val(moment().format('YYYY-MM-DD'));
            $("[name=endDate]").val(moment().format('YYYY-MM-DD'));

            if($('input:radio[name="zoneDate"]:checked').val() == 0){       // 시간대별이면 종료일자 선택 못하게
                $("#iconEndDate").off("click");
            }
        },
    };

    var endDate;
    var startDate;
    var slctType;

    $("input[name='zoneDate']:radio").change(function () {
        startDate = "";
        endDate = "";
        slctType = this.value;
        endDate = $("#endDate").val();
        startDate = $("#startDate").val();

        if(slctType == 0){
            $("#iconEndDate").addClass("disabled");
            $("#iconEndDate").off("click");
        }else{
            $("#iconEndDate").removeClass("disabled");
            broadcastStatus.init();
        }
        getList();
        $("#tablist_con").find('.active').find('a').click();
    });

    function getList(){
        util.getAjaxData("broadSumStatus", "/rest/status/broadcast/broadcastLive/list", null, fn_broadSumStatus_success);
    }

    function fn_broadSumStatus_success(dst_id, response) {
        dalbitLog(response);

        $( '#tb_broadSumStatus > tbody').empty();
        $( '#tb_giftSumStatus > tbody').empty();

        var template = $('#tmp_broadcastLive').html();
        var templateScript = Handlebars.compile(template);
        var context = response.data.broadCastLiveInfo;
        var html=templateScript(context);
        $("#broadSumStatus").append(html);

        var template = $('#tmp_giftLive').html();
        var templateScript = Handlebars.compile(template);
        var context = response.data.broadCastLiveInfo;
        var html=templateScript(context);
        $("#giftSumStatus").append(html);

    }


</script>

<script type="text/x-handlebars-template" id="tmp_broadcastLive">
    <tr>
        <th>방송개설건</th>
        <td>{{addComma create_now_cnt}}</td>
        <td>{{addComma create_yes_cnt}}</td>
        <td class="{{upAndDownClass create_now_inc_cnt}}"><i class="fa {{upAndDownIcon create_now_inc_cnt}}"></i> {{addComma create_now_inc_cnt}}</td>
        <td>{{addComma create_week_cnt}}</td>
        <td class="{{upAndDownClass create_week_inc_cnt}}"><i class="fa {{upAndDownIcon create_week_inc_cnt}}"></i> {{addComma create_week_inc_cnt}}</td>
    </tr>
    <tr>
        <th>방송시간</th>
        <td>{{addComma broadcast_now_time}}</td>
        <td>{{addComma broadcast_yes_time}}</td>
        <td class="{{upAndDownClass broadcast_now_inc_time}}"><i class="fa {{upAndDownIcon broadcast_now_inc_time}}"></i> {{addComma broadcast_now_inc_time}}</td>
        <td>{{addComma broadcast_week_time}}</td>
        <td class="{{upAndDownClass broadcast_week_inc_time}}"><i class="fa {{upAndDownIcon broadcast_week_inc_time}}"></i> {{addComma broadcast_week_inc_time}}</td>
    </tr>
</script>

<script type="text/x-handlebars-template" id="tmp_giftLive">
    <tr>
        <th>선물 건</th>
        <td>{{addComma gift_now_cnt}}</td>
        <td>{{addComma gift_yes_cnt}}</td>
        <td class="{{upAndDownClass gift_now_inc_cnt}}"><i class="fa {{upAndDownIcon gift_now_inc_cnt}}"></i> {{addComma gift_now_inc_cnt}}</td>
        <td>{{addComma gift_week_cnt}}</td>
        <td class="{{upAndDownClass gift_week_inc_cnt}}"><i class="fa {{upAndDownIcon gift_week_inc_cnt}}"></i> {{addComma gift_week_inc_cnt}}</td>
    </tr>
    <tr>
        <th>선물 금액</th>
        <td>{{addComma gift_now_amt}}</td>
        <td>{{addComma gift_yes_amt}}</td>
        <td class="{{upAndDownClass gift_now_inc_amt}}"><i class="fa {{upAndDownIcon gift_now_inc_amt}}"></i> {{addComma gift_now_inc_amt}}</td>
        <td>{{addComma gift_week_amt}}</td>
        <td class="{{upAndDownClass gift_week_inc_amt}}"><i class="fa {{upAndDownIcon gift_week_inc_amt}}"></i> {{addComma gift_week_inc_amt}}</td>
    </tr>
</script>