<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dummyData"><%= java.lang.Math.round(java.lang.Math.random() * 1000000) %></c:set>

<div id="wrapper">
    <div id="page-wrapper" class="col-lg-12 no-padding">
        <div class="container-fluid">
            <form id="searchForm">
                <div class="row form-inline">
                    <div class="widget widget-table searchBoxArea">
                        <div class="widget-header searchBoxRow">
                            <h3 class="title"><i class="fa fa-search"></i> 검색조건</h3>
                            <div>
                                <div class="input-group date" id="oneDayDatePicker">
                                    <label for="onedayDate" class="input-group-addon">
                                        <span><i class="fa fa-calendar" id="onedayDateBtn"></i></span>
                                    </label>
                                    <input type="text" class="form-control" id="onedayDate" name="onedayDate">
                                </div>

                                <div class="input-group date" id="monthDatepicker" style="display:none;">
                                    <label for="monthDate" class="input-group-addon">
                                        <span><i class="fa fa-calendar"></i></span>
                                    </label>
                                    <input id="monthDate" type="text" class="form-control"/>
                                </div>

                                <div class="input-group date" id="yearDatepicker" style="display:none;">
                                    <label for="yearDate" class="input-group-addon">
                                        <span><i class="fa fa-calendar"></i></span>
                                    </label>
                                    <input id="yearDate" type="text" class="form-control"/>
                                </div>


                                <input type="hidden" name="startDate" id="startDate">
                                <input type="hidden" name="endDate" id="endDate" />

                                <%--<input name="startDate" id="startDate">--%>
                                <%--<input name="endDate" id="endDate" />--%>
                                <input type="text" class="form-control" id="txt_search" name="txt_search" style="display: none">

                                <button type="button" class="btn btn-success" id="bt_search">검색</button>
                                <a href="javascript://" class="_prevSearch">[이전]</a>
                                <a href="javascript://" class="_todaySearch">[오늘]</a>
                                <a href="javascript://" class="_nextSearch">[다음]</a>

                                <label class="control-inline fancy-checkbox custom-color-green">
                                    <input type="checkbox" name="search_testId" id="search_testId" value="1" checked="true">
                                    <span id="checkTestid" style="display: none">테스트 아이디 제외</span>
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <!-- tab -->
    <div class="widget-content">
        <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist">
            <li class="active"><a href="#resourceState" role="tab" data-toggle="tab" onclick="infoTabClick(0);">시간대별</a></li>
            <li><a href="#resourceState" role="tab" data-toggle="tab" onclick="infoTabClick(1);">월간별</a></li>
            <li><a href="#resourceState" role="tab" data-toggle="tab" onclick="infoTabClick(2);">연간별</a></li>
            <li><a href="#memberDataList" role="tab" data-toggle="tab" onclick="memberDataListTabClick();">회원Data</a></li>
        </ul>
        <div class="tab-pane fade in active" id="resourceState" >
            <div class="tab-content no-padding">
                <div id="infoTable_dal"></div>
                <div id="infoTable_byeol" style="display: none"></div>
            </div>
            <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist">
                <li class="active" style="width: 60px;text-align: center;"><a href="#dal" role="tab" data-toggle="tab" onclick="itemTabClick(0);">달</a></li>
                <li style="width: 60px;text-align: center;"><a href="#byeol" role="tab" data-toggle="tab" onclick="itemTabClick(1);">별</a></li>
            </ul>
            <div class="tab-content no-padding">
                <div class="tab-pane fade in active" id="dal">
                    <div id="dalListTable">
                    </div>
                </div>              <!-- 달 -->
                <div class="tab-pane fade" id="byeol">
                    <div id="byeolListTable"></div>
                </div>          <!-- 별 -->
            </div>
        </div>
        <div class="tab-pane fade" id="memberDataList"><jsp:include page="memberDataList.jsp"/></div>
        <%--<div class="tab-pane fade" id="resourceState" ></div>--%>

    </div>
    <!-- //tab -->
</div>

<script type="text/javascript">

    var dateTime = new Date();
    dateTime = moment(dateTime).format("YYYY.MM.DD");
    var week = ['일', '월', '화', '수', '목', '금', '토'];
    var toDay = week[moment(new Date()).day()];
    setTimeDate(dateTime);

    $(function(){
        $('#onedayDate').datepicker("onedayDate", new Date()).on('changeDate', function (dateText) {
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
    });

    $("#bt_search").on('click', function(){
        getResourceInfo();
        memberDataListTabClick();
    });

    function setTimeDate(dateTime){
        $("#onedayDate").val(dateTime);
        $("#startDate").val(dateTime);
        $("#endDate").val(dateTime);

        $("._searchDate").html(dateTime + " (" + toDay + ")");
    }

    $(document).on('change', 'input[name="slctType"]', function(){
        console.log($('input[name="slctType"]:checked').val());
        if($('input[name="slctType"]:checked').val() == 0){
            _datePicker = 0;
        }else if($('input[name="slctType"]:checked').val() == 1){
            _datePicker = 1;
        }else{
            _datePicker = 2;
        }
        changeDatepicker();
        $("#bt_search").click();
    });

    $(document).on('click', '._prevSearch', function(){
        searchDate('prev');
    });

    $(document).on('click', '._nextSearch', function(){
        searchDate('next');
    });

    $(document).on('click', '._todaySearch', function(){
        toDay = week[moment(new Date()).day()];
        changeDatepicker();

        setTimeDate(dateTime);
    });

    var _datePicker = 0;

    function changeDatepicker(){
        if(_datePicker == 0){
            $("#oneDayDatePicker").show();
            $("#monthDatepicker").hide();
            $("#yearDatepicker").hide();
        }else if(_datePicker == 1) {
            $("#oneDayDatePicker").hide();
            $("#monthDatepicker").show();
            $("#yearDatepicker").hide();
        }else if(_datePicker == 2) {
            $("#oneDayDatePicker").hide();
            $("#monthDatepicker").hide();
            $("#yearDatepicker").show();
        }
        searchDate();
    }

    function searchDate(dateType){
        if(_datePicker == 0){ //시간별 , 일간
            if(common.isEmpty(dateType)){
                $("#startDate").val(moment(new Date()).format('YYYY.MM.DD'));
                $("#endDate").val(moment(new Date()).format('YYYY.MM.DD'));
                $("._searchDate").html(moment(new Date()).format('YYYY.MM.DD') + " (" + toDay + ")");
                $("#onedayDate").val(moment(new Date()).format('YYYY.MM.DD'));
            }else if(dateType == 'prev'){
                setDay(-1);
            }else{
                setDay(1);
            }
        }else if(_datePicker == 1){ // 월간
            if(common.isEmpty(dateType)){
                $("#startDate").val(moment(new Date()).format('YYYY.MM.01'));
                $("#endDate").val(moment(moment(new Date()).format('YYYY.MM.01')).add('months', 1).add('days', -1).format('YYYY.MM.DD'));
                $("._searchDate").html(moment(new Date()).format('YYYY년 MM월'));
                $("#monthDate").val(moment(new Date()).format('YYYY.MM'));
            }else if(dateType == 'prev'){
                setMonth(-1);
            }else if(dateType == 'next'){
                setMonth(1);
            }
        }else if(_datePicker == 2){ // 연간
            if(common.isEmpty(dateType)){
                $("#startDate").val(moment(new Date()).format('YYYY.01.01'));
                $("#endDate").val(moment(new Date()).format('YYYY.12.31'));
                $("._searchDate").html(moment(new Date()).format('YYYY년'));
                $("#yearDate").val(moment(new Date()).format('YYYY'));
            }else if(dateType == 'prev'){
                setYear(-1);

            }else if(dateType == 'next'){
                setYear(1);
            }
        }
        getResourceInfo();
    }

    function setDay(days){
        toDay = week[moment($("#startDate").val()).add('days', days).day()];
        $("#startDate").val(moment($("#startDate").val()).add('days', days).format('YYYY.MM.DD'));
        $("#endDate").val($("#startDate").val());
        $("._searchDate").html($("#startDate").val() + " (" + toDay + ")");
        $("#onedayDate").val($("#startDate").val());
    }

    function setMonth(months){
        $("#startDate").val(moment($("#startDate").val()).add('months', months).format('YYYY.MM.01'));
        $("#endDate").val(moment($("#startDate").val()).add('months', 1).add('days', -1).format('YYYY.MM.DD'));
        $("._searchDate").html(moment($("#startDate").val()).format('YYYY년 MM월'));
        $("#monthDate").val(moment($("#startDate").val()).format('YYYY.MM'));
    }

    function setYear(years){
        $("#startDate").val(moment($("#startDate").val()).add('years', years).format('YYYY.01.01'));
        $("#endDate").val(moment($("#startDate").val()).add('years', 1).add('days', -1).format('YYYY.12.31'));
        $("._searchDate").html(moment($("#startDate").val()).format('YYYY년'));
        $("#yearDate").val(moment($("#startDate").val()).format('YYYY'));
    }

    getResourceInfo();
    function infoTabClick(tmp){
        _datePicker = tmp;
        $("#resourceState").show();
        $("._prevSearch").show();
        $("._todaySearch").show();
        $("._nextSearch").show();
        $("#txt_search").hide();
        $("#checkTestid").hide();
        changeDatepicker();
    }
    var _itemClick = 0;
    function itemTabClick(tmp){
        _itemClick = tmp;
        if(tmp == 0){
            $("#infoTable_dal").show();
            $("#infoTable_byeol").hide();
        }else{
            $("#infoTable_dal").hide();
            $("#infoTable_byeol").show();
        }
        getResourceInfo();
    }

    function getResourceInfo(){
        var data = {};
        data.slctType = _datePicker;
        data.startDate = $("#startDate").val();
        data.endDate = $("#endDate").val();
        data.type=_itemClick;
        util.getAjaxData("statResourceInfo", "/rest/money/resource/info", data, fn_info_success);
        util.getAjaxData("statResourceDetail", "/rest/money/resource/detail", data, fn_detail_success);

        // fn_info_success();
    }
    function fn_info_success(dst_id, response) {

        var template = $('#tmp_infoTable_dal').html();
        var templateScript = Handlebars.compile(template);
        var context = response.data.totalInfo;
        var html = templateScript(context);
        $("#infoTable_dal").html(html);

        var template = $('#tmp_infoTable_byeol').html();
        var templateScript = Handlebars.compile(template);
        var context = response.data.totalInfo;
        var html = templateScript(context);
        $("#infoTable_byeol").html(html);

        ui.paintColor();

    }
    function fn_detail_success(dst_id, response) {

        response.data.detailList.slctType = _datePicker;

        response.data.detailList.nowMonth = Number(moment().format("MM"));
        response.data.detailList.nowDay = Number(moment().format("DD"));
        response.data.detailList.nowHour = Number(moment().format("HH"));

        var template = $('#tmp_dalListTable').html();
        var templateScript = Handlebars.compile(template);
        var context = response.data;
        var html = templateScript(context);
        $("#dalListTable").html(html);

        var template = $('#tmp_byeolListTable').html();
        var templateScript = Handlebars.compile(template);
        var context = response.data;
        var html = templateScript(context);
        $("#byeolListTable").html(html);

        ui.paintColor();
    }

</script>
<script type="text/x-handlebars-template" id="tmp_infoTable_dal">
    <div class="col-md-12 no-padding">
        <table class="table table-bordered mb10 mt5">
            <tr>
                <th rowspan="5" class="_bgColor" data-bgcolor="#8faadc">달 증가</th>
                <th class="_bgColor" data-bgcolor="#b4c7e7">구분</th>
                <th class="_bgColor" data-bgcolor="#dae3f3">달 구매</th>
                <th class="_bgColor" data-bgcolor="#dae3f3">달 직접 선물</th>
                <th class="_bgColor" data-bgcolor="#dae3f3">달 교환</th>
                <th class="_bgColor" data-bgcolor="#dae3f3">가입 보상</th>
                <th class="_bgColor" data-bgcolor="#dae3f3">레벨 보상</th>
                <th class="_bgColor" data-bgcolor="#dae3f3">랭킹 보상</th>
                <th class="_bgColor" data-bgcolor="#dae3f3">출석이멘트</th>
                <th class="_bgColor" data-bgcolor="#dae3f3">소실금액 복구<br/>(운영자 직접지급)</th>
                <th class="_bgColor" data-bgcolor="#dae3f3">이벤트 지급<br/>(운영자 직접지급)</th>
                <th class="_bgColor" data-bgcolor="#dae3f3">스페셜DJ</th>
                <th class="_bgColor" data-bgcolor="#dae3f3">테스트 지급</th>
                <th class="_bgColor" data-bgcolor="#d9d9d9">소계</th>
                <th class="_bgColor" data-bgcolor="#d9d9d9">증가 합</th>
                <th class="_bgColor _fontColor" data-bgcolor="#000000" data-fontcolor="white">총 합</th>
            </tr>
            <tr>
                <th class="_bgColor" data-bgcolor="#b4c7e7">{{{sexIcon 'm'}}}</th>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td rowspan="4">{{addComma aa}}</td>
                <td rowspan="9">{{addComma aa}}</td>
            </tr>
            <tr>
                <th class="_bgColor" data-bgcolor="#b4c7e7">{{{sexIcon 'f'}}}</th>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
            </tr>
            <tr>
                <th class="_bgColor" data-bgcolor="#b4c7e7">{{{sexIcon 'n'}}}</th>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
            </tr>
            <tr>
                <th class="_bgColor" data-bgcolor="#b4c7e7">테스트</th>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
            </tr>
            <tr>
                <th rowspan="5" class="_bgColor" data-bgcolor="#f4b183">달 감소</th>
                <th class="_bgColor" data-bgcolor="#f8cbad">구분</th>
                <th class="_bgColor" data-bgcolor="#fbe5d6">달 직접 선물<br/>(비밀 선물)</th>
                <th class="_bgColor" data-bgcolor="#fbe5d6">아이템 사용</th>
                <th class="_bgColor" data-bgcolor="#fbe5d6">결제 취소</th>
                <th class="_bgColor" data-bgcolor="#fbe5d6">영구정지</th>
                <th class="_bgColor" data-bgcolor="#fbe5d6">탈퇴</th>
                <td colspan="5" rowspan="5"></td>
                <th class="_bgColor" data-bgcolor="#fbe5d6">테스트 회수</th>
                <th class="_bgColor" data-bgcolor="#d9d9d9">소계</th>
                <th class="_bgColor" data-bgcolor="#d9d9d9">감소 합</th>
            </tr>
            <tr>
                <th class="_bgColor" data-bgcolor="#f8cbad">{{{sexIcon 'm'}}}</th>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td rowspan="4">{{addComma aa}}</td>
            </tr>
            <tr>
                <th class="_bgColor" data-bgcolor="#f8cbad">{{{sexIcon 'f'}}}</th>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
            </tr>
            <tr>
                <th class="_bgColor" data-bgcolor="#f8cbad">{{{sexIcon 'n'}}}</th>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
            </tr>
            <tr>
                <th class="_bgColor" data-bgcolor="#f8cbad">테스트</th>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
            </tr>
        </table>
    </div>
</script>

<script type="text/x-handlebars-template" id="tmp_infoTable_byeol">
    <div class="col-md-12 no-padding">
        <table class="table table-bordered mb10 mt5">
            <tr>
                <th rowspan="5" class="_bgColor" data-bgcolor="#8faadc">별 증가</th>
                <th class="_bgColor" data-bgcolor="#b4c7e7">구분</th>
                <th class="_bgColor" data-bgcolor="#dae3f3">레벨업 보상</th>
                <th class="_bgColor" data-bgcolor="#dae3f3">아이템 선물<br/>(비밀선물)</th>
                <th class="_bgColor" data-bgcolor="#dae3f3">이벤트 지급<br/>(운영자 직접 지급)</th>
                <th class="_bgColor" data-bgcolor="#dae3f3">환전 불가</th>
                <th class="_bgColor" data-bgcolor="#dae3f3">소실금액 복구<br/>(운영자 직접지급)</th>
                <th class="_bgColor" data-bgcolor="#dae3f3">테스트 지급</th>
                <th class="_bgColor" data-bgcolor="#d9d9d9">소계</th>
                <th class="_bgColor" data-bgcolor="#d9d9d9">증가 합</th>
                <th class="_bgColor _fontColor" data-bgcolor="#000000" data-fontcolor="white">총 합</th>
            </tr>
            <tr>
                <th class="_bgColor" data-bgcolor="#b4c7e7">{{{sexIcon 'm'}}}</th>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td rowspan="4">{{addComma aa}}</td>
                <td rowspan="9">{{addComma aa}}</td>
            </tr>
            <tr>
                <th class="_bgColor" data-bgcolor="#b4c7e7">{{{sexIcon 'f'}}}</th>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
            </tr>
            <tr>
                <th class="_bgColor" data-bgcolor="#b4c7e7">{{{sexIcon 'n'}}}</th>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
            </tr>
            <tr>
                <th class="_bgColor" data-bgcolor="#b4c7e7">테스트</th>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
            </tr>

            <tr>
                <th rowspan="5" class="_bgColor" data-bgcolor="#f4b183">별 감소</th>
                <th class="_bgColor" data-bgcolor="#f8cbad">구분</th>
                <th class="_bgColor" data-bgcolor="#fbe5d6">환전 승인</th>
                <th class="_bgColor" data-bgcolor="#fbe5d6">교환</th>
                <th class="_bgColor" data-bgcolor="#fbe5d6">영구정지</th>
                <th class="_bgColor" data-bgcolor="#fbe5d6">탈퇴</th>
                <td rowspan="5"></td>
                <th class="_bgColor" data-bgcolor="#fbe5d6">테스트 회수</th>
                <th class="_bgColor" data-bgcolor="#d9d9d9">소계</th>
                <th class="_bgColor" data-bgcolor="#d9d9d9">감소 합</th>
            </tr>
            <tr>
                <th class="_bgColor" data-bgcolor="#f8cbad">{{{sexIcon 'm'}}}</th>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td rowspan="4">{{addComma aa}}</td>
            </tr>
            <tr>
                <th class="_bgColor" data-bgcolor="#f8cbad">{{{sexIcon 'f'}}}</th>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
            </tr>
            <tr>
                <th class="_bgColor" data-bgcolor="#f8cbad">{{{sexIcon 'n'}}}</th>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
            </tr>
            <tr>
                <th class="_bgColor" data-bgcolor="#f8cbad">테스트</th>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
                <td>{{addComma aa}}</td>
            </tr>
        </table>
    </div>
</script>


<script type="text/x-handlebars-template" id="tmp_dalListTable">
    <div class="col-md-12 no-padding">
        <table class="table table-bordered">
            <%--<colgroup>--%>
                <%--<col width="7.6%"/><col width="7.6%"/><col width="7.6%"/><col width="7.6%"/><col width="7.6%"/>--%>
                <%--<col width="7.6%"/><col width="7.6%"/><col width="7.6%"/><col width="7.6%"/><col width="7.6%"/>--%>
                <%--<col width="7.6%"/><col width="7.6%"/><col width="7.6%"/>--%>
            <%--</colgroup>--%>
            <thead>
            <tr>
                <th colspan="13" class="_bgColor" data-bgcolor="#8faadc">달증가</th>
                <th style="background-color: white; border-bottom: hidden;border-top: hidden;"></th>
                <th colspan="8" class="_bgColor" data-bgcolor="#f4b183">운영자</th>
            </tr>
            <tr>
                <th class="_bgColor" data-bgcolor="#b4c7e7">구분</th>
                <th class="_bgColor" data-bgcolor="#dae3f3">달 구매</th>
                <th class="_bgColor" data-bgcolor="#dae3f3">달 직접 선물</th>
                <th class="_bgColor" data-bgcolor="#dae3f3">달 교환</th>
                <th class="_bgColor" data-bgcolor="#dae3f3">가입보상</th>
                <th class="_bgColor" data-bgcolor="#dae3f3">레벨 보상</th>
                <th class="_bgColor" data-bgcolor="#dae3f3">랭킹 보상</th>
                <th class="_bgColor" data-bgcolor="#dae3f3">출석이벤트</th>
                <th class="_bgColor" data-bgcolor="#dae3f3">소실금액 복구<br/>(운영자 직접지급)</th>
                <th class="_bgColor" data-bgcolor="#dae3f3">이벤트 지급<br/>(운영자 직접지급)</th>
                <th class="_bgColor" data-bgcolor="#dae3f3">스페셜DJ</th>
                <th class="_bgColor" data-bgcolor="#dae3f3">테스트 지급</th>
                <th class="_bgColor" data-bgcolor="#d9d9d9">소계</th>
                <th style="background-color: white; border-bottom: hidden;border-top: hidden;"></th>
                <th class="_bgColor" data-bgcolor="#f8cbad">구분</th>
                <th class="_bgColor" data-bgcolor="#fbe5d6">달 직접 선물(비밀선물)</th>
                <th class="_bgColor" data-bgcolor="#fbe5d6">아이템 선물</th>
                <th class="_bgColor" data-bgcolor="#fbe5d6">결제 취소</th>
                <th class="_bgColor" data-bgcolor="#fbe5d6">영구정지</th>
                <th class="_bgColor" data-bgcolor="#fbe5d6">탈퇴</th>
                <th class="_bgColor" data-bgcolor="#fbe5d6">테스트 회수</th>
                <th class="_bgColor" data-bgcolor="#d9d9d9">소계</th>
            </tr>
            </thead>
            <tbody>
                <tr class="font-bold" style="background-color: #d9d9d9">
                    <td>총합</td>
                    <td>{{addComma aa}}</td>
                    <td>{{addComma aa}}</td>
                    <td>{{addComma aa}}</td>
                    <td>{{addComma aa}}</td>
                    <td>{{addComma aa}}</td>
                    <td>{{addComma aa}}</td>
                    <td>{{addComma aa}}</td>
                    <td>{{addComma aa}}</td>
                    <td>{{addComma aa}}</td>
                    <td>{{addComma aa}}</td>
                    <td>{{addComma aa}}</td>
                    <td>{{addComma aa}}</td>
                    <td style="background-color: white; border-bottom: hidden;border-top: hidden;"></td>
                    <td>총합</td>
                    <td>{{addComma aa}}</td>
                    <td>{{addComma aa}}</td>
                    <td>{{addComma aa}}</td>
                    <td>{{addComma aa}}</td>
                    <td>{{addComma aa}}</td>
                    <td>{{addComma aa}}</td>
                    <td>{{addComma aa}}</td>
                </tr>
                {{#each detailList}}
                <tr
                    {{#dalbit_if ../detailList.slctType '==' '0'}}{{#dalbit_if ../detailList.nowHour '==' hour}} class="font-bold _bgColor" data-bgcolor="#fff2cc" {{/dalbit_if}}{{/dalbit_if}}
                    {{#dalbit_if ../detailList.slctType '==' '1'}}{{#dalbit_if ../detailList.nowDay '==' day}} class="font-bold _bgColor" data-bgcolor="#fff2cc" {{/dalbit_if}}{{/dalbit_if}}
                    {{#dalbit_if ../detailList.slctType '==' '2'}}{{#dalbit_if ../detailList.nowMonth '==' monthly}} class="font-bold _bgColor" data-bgcolor="#fff2cc" {{/dalbit_if}}{{/dalbit_if}}
                >
                    <td class="font-bold _bgColor" data-bgcolor="#dae3f3">
                        {{#dalbit_if ../detailList.slctType '==' '0'}}{{hour}}시{{/dalbit_if}}
                        {{#dalbit_if ../detailList.slctType '==' '1'}}{{substr daily 5}}{{/dalbit_if}}
                        {{#dalbit_if ../detailList.slctType '==' '2'}}{{monthly}}월{{/dalbit_if}}
                    </td>
                    <td>{{addComma aa}}</td>
                    <td>{{addComma aa}}</td>
                    <td>{{addComma aa}}</td>
                    <td>{{addComma aa}}</td>
                    <td>{{addComma aa}}</td>
                    <td>{{addComma aa}}</td>
                    <td>{{addComma aa}}</td>
                    <td>{{addComma aa}}</td>
                    <td>{{addComma aa}}</td>
                    <td>{{addComma aa}}</td>
                    <td>{{addComma aa}}</td>
                    <td class="_bgColor" data-bgcolor="#d9d9d9">{{addComma aa}}</td>
                    <td style="background-color: white; border-bottom: hidden;border-top: hidden;"></td>
                    <td class="font-bold _bgColor" data-bgcolor="#fbe5d6">
                        {{#dalbit_if ../detailList.slctType '==' '0'}}{{hour}}시{{/dalbit_if}}
                        {{#dalbit_if ../detailList.slctType '==' '1'}}{{substr daily 5}}{{/dalbit_if}}
                        {{#dalbit_if ../detailList.slctType '==' '2'}}{{monthly}}월{{/dalbit_if}}
                    </td>
                    <td>{{addComma aa}}</td>
                    <td>{{addComma aa}}</td>
                    <td>{{addComma aa}}</td>
                    <td>{{addComma aa}}</td>
                    <td>{{addComma aa}}</td>
                    <td>{{addComma aa}}</td>
                    <td class="_bgColor" data-bgcolor="#d9d9d9">{{addComma aa}}</td>
                </tr>
                {{else}}
                <td colspan="23" class="noData">{{isEmptyData}}<td>
                {{/each}}
                <tr class="font-bold" style="background-color: #d9d9d9">
                    <td>총합</td>
                    <td>{{addComma aa}}</td>
                    <td>{{addComma aa}}</td>
                    <td>{{addComma aa}}</td>
                    <td>{{addComma aa}}</td>
                    <td>{{addComma aa}}</td>
                    <td>{{addComma aa}}</td>
                    <td>{{addComma aa}}</td>
                    <td>{{addComma aa}}</td>
                    <td>{{addComma aa}}</td>
                    <td>{{addComma aa}}</td>
                    <td>{{addComma aa}}</td>
                    <td>{{addComma aa}}</td>
                    <td style="background-color: white; border-bottom: hidden;border-top: hidden;"></td>
                    <td>총합</td>
                    <td>{{addComma aa}}</td>
                    <td>{{addComma aa}}</td>
                    <td>{{addComma aa}}</td>
                    <td>{{addComma aa}}</td>
                    <td>{{addComma aa}}</td>
                    <td>{{addComma aa}}</td>
                    <td>{{addComma aa}}</td>
                </tr>
            </tbody>
        </table>
    </div>
</script>

<script type="text/x-handlebars-template" id="tmp_byeolListTable">
    <div class="col-md-12 no-padding">
        <table class="table table-bordered">
            <%--<colgroup>--%>
                <%--<col width="9%"/><col width="9%"/><col width="9%"/><col width="9%"/><col width="9%"/>--%>
                <%--<col width="9%"/><col width="9%"/><col width="9%"/><col width="9%"/><col width="9%"/>--%>
                <%--<col width="9%"/>--%>
            <%--</colgroup>--%>
            <thead>
            <tr>
                <th colspan="8" class="_bgColor" data-bgcolor="#8faadc">별 증가</th>
                <th style="background-color: white; border-bottom: hidden;border-top: hidden;"></th>
                <th colspan="7" class="_bgColor" data-bgcolor="#f4b183">별 감소</th>
            </tr>
            <tr>
                <th class="_bgColor" data-bgcolor="#b4c7e7">구분</th>
                <th class="_bgColor" data-bgcolor="#dae3f3">레벨업 보상</th>
                <th class="_bgColor" data-bgcolor="#dae3f3">아이템 선물(비밀 선물)</th>
                <th class="_bgColor" data-bgcolor="#dae3f3">이벤트 지급(운영자 직접지급)</th>
                <th class="_bgColor" data-bgcolor="#dae3f3">환전 불가</th>
                <th class="_bgColor" data-bgcolor="#dae3f3">소실금액 복구(운영자 직접지급)</th>
                <th class="_bgColor" data-bgcolor="#dae3f3">테스트 지급</th>
                <th class="_bgColor" data-bgcolor="#d9d9d9">소계</th>
                <th style="background-color: white; border-bottom: hidden;border-top: hidden;"></th>
                <th class="_bgColor" data-bgcolor="#f8cbad">구분</th>
                <th class="_bgColor" data-bgcolor="#fbe5d6">환전 승인</th>
                <th class="_bgColor" data-bgcolor="#fbe5d6">교환</th>
                <th class="_bgColor" data-bgcolor="#fbe5d6">영구정지</th>
                <th class="_bgColor" data-bgcolor="#fbe5d6">탈퇴</th>
                <th class="_bgColor" data-bgcolor="#fbe5d6">테스트 회수</th>
                <th class="_bgColor" data-bgcolor="#d9d9d9">소계</th>
            </tr>
            </thead>
            <tbody>
                <tr class="font-bold" style="background-color: #d9d9d9">
                    <td>총합</td>
                    <td>{{addComma aa}}</td>
                    <td>{{addComma aa}}</td>
                    <td>{{addComma aa}}</td>
                    <td>{{addComma aa}}</td>
                    <td>{{addComma aa}}</td>
                    <td>{{addComma aa}}</td>
                    <td>{{addComma aa}}</td>
                    <td style="background-color: white; border-bottom: hidden;border-top: hidden;"></td>
                    <td>총합</td>
                    <td>{{addComma aa}}</td>
                    <td>{{addComma aa}}</td>
                    <td>{{addComma aa}}</td>
                    <td>{{addComma aa}}</td>
                    <td>{{addComma aa}}</td>
                    <td>{{addComma aa}}</td>
                </tr>
            {{#each detailList}}
                <tr
                    {{#dalbit_if ../detailList.slctType '==' '0'}}{{#dalbit_if ../detailList.nowHour '==' hour}} class="font-bold _bgColor" data-bgcolor="#fff2cc" {{/dalbit_if}}{{/dalbit_if}}
                    {{#dalbit_if ../detailList.slctType '==' '1'}}{{#dalbit_if ../detailList.nowDay '==' day}} class="font-bold _bgColor" data-bgcolor="#fff2cc" {{/dalbit_if}}{{/dalbit_if}}
                    {{#dalbit_if ../detailList.slctType '==' '2'}}{{#dalbit_if ../detailList.nowMonth '==' monthly}} class="font-bold _bgColor" data-bgcolor="#fff2cc" {{/dalbit_if}}{{/dalbit_if}}
                >
                    <td class="font-bold _bgColor" data-bgcolor="#b4c7e7">
                        {{#dalbit_if ../detailList.slctType '==' '0'}}{{hour}}시{{/dalbit_if}}
                        {{#dalbit_if ../detailList.slctType '==' '1'}}{{substr daily 5}}{{/dalbit_if}}
                        {{#dalbit_if ../detailList.slctType '==' '2'}}{{monthly}}월{{/dalbit_if}}
                    </td>
                    <td>{{addComma aa}}</td>
                    <td>{{addComma aa}}</td>
                    <td>{{addComma aa}}</td>
                    <td>{{addComma aa}}</td>
                    <td>{{addComma aa}}</td>
                    <td>{{addComma aa}}</td>
                    <td class="_bgColor" data-bgcolor="#d9d9d9">{{addComma aa}}</td>
                    <td style="background-color: white; border-bottom: hidden;border-top: hidden;"></td>
                    <td class="font-bold _bgColor" data-bgcolor="#f8cbad">
                        {{#dalbit_if ../detailList.slctType '==' '0'}}{{hour}}시{{/dalbit_if}}
                        {{#dalbit_if ../detailList.slctType '==' '1status/push/info'}}{{substr daily 5}}{{/dalbit_if}}
                        {{#dalbit_if ../detailList.slctType '==' '2'}}{{monthly}}월{{/dalbit_if}}
                    </td>
                    <td>{{addComma aa}}</td>
                    <td>{{addComma aa}}</td>
                    <td>{{addComma aa}}</td>
                    <td>{{addComma aa}}</td>
                    <td>{{addComma aa}}</td>
                    <td class="_bgColor" data-bgcolor="#d9d9d9">{{addComma aa}}</td>
                </tr>
                {{/each}}
                <tr class="font-bold" style="background-color: #d9d9d9">
                    <td>총합</td>
                    <td>{{addComma aa}}</td>
                    <td>{{addComma aa}}</td>
                    <td>{{addComma aa}}</td>
                    <td>{{addComma aa}}</td>
                    <td>{{addComma aa}}</td>
                    <td>{{addComma aa}}</td>
                    <td>{{addComma aa}}</td>
                    <td style="background-color: white; border-bottom: hidden;border-top: hidden;"></td>
                    <td>총합</td>
                    <td>{{addComma aa}}</td>
                    <td>{{addComma aa}}</td>
                    <td>{{addComma aa}}</td>
                    <td>{{addComma aa}}</td>
                    <td>{{addComma aa}}</td>
                    <td>{{addComma aa}}</td>
                </tr>
            </tbody>
        </table>
    </div>
</script>