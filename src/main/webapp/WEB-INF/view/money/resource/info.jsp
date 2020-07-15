<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
                                <button type="button" class="btn btn-success" id="bt_search">검색</button>
                                <a href="javascript://" class="_prevSearch">[이전]</a>
                                <a href="javascript://" class="_todaySearch">[오늘]</a>
                                <a href="javascript://" class="_nextSearch">[다음]</a>
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
            <li class="active"><a href="#resourceTime" role="tab" data-toggle="tab" onclick="infoTabClick(0);">시간대별</a></li>
            <li><a href="#resourceDay" role="tab" data-toggle="tab" onclick="infoTabClick(1);">일간별</a></li>
            <li><a href="#resourceMonth" role="tab" data-toggle="tab" onclick="infoTabClick(2);">월간별</a></li>
        </ul>
        <div class="tab-content no-padding">
            <div id="intoTable"></div>
        </div>
    </div>
    <div class="widget-content">
        <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist">
            <li class="active"><a href="#dal" role="tab" data-toggle="tab" onclick="itemTabClick(0);">달</a></li>
            <li><a href="#byeol" role="tab" data-toggle="tab" onclick="itemTabClick(1);">별</a></li>
        </ul>
        <div class="tab-content no-padding">
            <div class="tab-pane fade in active" id="dal"><div id="dalListTable"></div></div>              <!-- 달 -->
            <div class="tab-pane fade" id="byeol"><div id="byeolListTable"></div></div>          <!-- 별 -->
        </div>
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

    function infoTabClick(tmp){
        _datePicker = tmp;
        changeDatepicker();
    }
    var _itemClick;
    function itemTabClick(tmp){
        _itemClick = tmp;
        getResourceInfo();
    }

    function getResourceInfo(){
        // var data = {};
        // data.slctType = _datePicker;
        // data.startDate = $("#startDate").val();
        // data.endDate = $("#endDate").val();
        // util.getAjaxData("statPayInfo", "/rest/enter/pay/info", data, fn_info_success);

        fn_info_success();
    }
    function fn_info_success(){
        var template = $('#tmp_infoTable').html();
        var templateScript = Handlebars.compile(template);
        var html = templateScript();
        $("#intoTable").html(html);

        var template = $('#tmp_dalListTable').html();
        var templateScript = Handlebars.compile(template);
        var html = templateScript();
        $("#dalListTable").html(html);

        var template = $('#tmp_byeolListTable').html();
        var templateScript = Handlebars.compile(template);
        var html = templateScript();
        $("#byeolListTable").html(html);

    }

</script>
<script type="text/x-handlebars-template" id="tmp_infoTable">
    <div class="col-md-12 no-padding">
        <table class="table table-bordered mb10">
            <colgroup>
                <col width="7.6%"/><col width="7.6%"/><col width="7.6%"/><col width="7.6%"/><col width="7.6%"/>
                <col width="7.6%"/><col width="7.6%"/><col width="7.6%"/><col width="7.6%"/><col width="7.6%"/>
                <col width="7.6%"/><col width="7.6%"/><col width="7.6%"/>
            </colgroup>
            <tr>
                <th colspan="13">6월 서비스 자원 현황</th>
            </tr>
            <tr>
                <th rowspan="2">달</th>
                <th>충전</th>
                <th>가입보상</th>
                <th>방송방 선물</th>
                <th>달 교환</th>
                <th>이벤드 지급</th>
                <th>레벨업 보상</th>
                <th>출석체크</th>
                <th>관리자<br/>지급 및 회수</th>
                <th>테스트 계정<br/>지급 및 회수</th>
                <th>테스트 계정<br/>방송방 선물</th>
                <th>탈퇴 회원 보유 달</th>
                <th style="background-color: #dbeef4">총합</th>
            </tr>
            <tr>
                <td>0</td>
                <td>0</td>
                <td>0</td>
                <td>0</td>
                <td>0</td>
                <td>0</td>
                <td>0</td>
                <td>0</td>
                <td>0</td>
                <td>0</td>
                <td>0</td>
                <td style="background-color: #dbeef4">0</td>
            </tr>
            <tr>
                <th rowspan="2">별</th>
                <th>방송방 선물</th>
                <th>달 교환</th>
                <th>레벨업 보상</th>
                <th>이벤트 지급</th>
                <th>환전</th>
                <th colspan="2">관리자 지급 및 회수</th>
                <th>테스트 계정<br/>지급 및 회수</th>
                <th>테스트 계정<br/>환전</th>
                <th colspan="2">탈퇴 회원 보유 별</th>
                <th style="background-color: #fdeada">총합</th>
            </tr>
            <tr>
                <td>0</td>
                <td>0</td>
                <td>0</td>
                <td>0</td>
                <td>0</td>
                <td colspan="2">0</td>
                <td>0</td>
                <td>0</td>
                <td colspan="2">0</td>
                <td style="background-color: #fdeada">0</td>
            </tr>
        </table>
    </div>
</script>


<script type="text/x-handlebars-template" id="tmp_dalListTable">
    <div class="col-md-12 no-padding">
        <table class="table table-bordered">
            <colgroup>
                <col width="7.6%"/><col width="7.6%"/><col width="7.6%"/><col width="7.6%"/><col width="7.6%"/>
                <col width="7.6%"/><col width="7.6%"/><col width="7.6%"/><col width="7.6%"/><col width="7.6%"/>
                <col width="7.6%"/><col width="7.6%"/><col width="7.6%"/>
            </colgroup>
            <thead>
            <tr>
                <th colspan="13">달 현황</th>
            </tr>
            <tr>
                <th></th>
                <th>충전</th>
                <th>가입보상</th>
                <th>방송방선물</th>
                <th>달 교환</th>
                <th>이벤트 지급</th>
                <th>레벨업 보상</th>
                <th>출석체크</th>
                <th>관리자 지급<br/>(미지급,소실)</th>
                <th>테스트 계정<br/>지급 및 회수</th>
                <th>테스트 계정<br/>방송방 선물</th>
                <th>탈퇴 회원<br/>보유 달</th>
                <th>소계</th>
            </tr>
            </thead>
            <tbody>
                <tr class="font-bold" style="background-color: #dbeef4">
                    <td>총합</td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                {{#each this as |data|}}
                <tr>
                    <td class="font-bold _stateSubTh">
                        {{#equal ../slctType 0}}{{data.hour}}시{{/equal}}
                        {{#equal ../slctType 1}}{{substr data.daily 5}}{{/equal}}
                        {{#equal ../slctType 2}}{{data.monthly}}월{{/equal}}
                    </td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td style="background-color: #dbeef4"></td>
                </tr>
                {{else}}
                <td colspan="12" class="noData">{{isEmptyData}}<td>
                {{/each}}
            </tbody>
        </table>
    </div>
</script>

<script type="text/x-handlebars-template" id="tmp_byeolListTable">
    <div class="col-md-12 no-padding">
        <table class="table table-bordered">
            <colgroup>
                <col width="9%"/><col width="9%"/><col width="9%"/><col width="9%"/><col width="9%"/>
                <col width="9%"/><col width="9%"/><col width="9%"/><col width="9%"/><col width="9%"/>
                <col width="9%"/>
            </colgroup>
            <thead>
            <tr>
                <th colspan="11">별 현황</th>
            </tr>
            <tr>
                <th></th>
                <th>방송방선물</th>
                <th>달 교환</th>
                <th>레벨업 보상</th>
                <th>이벤트 지급</th>
                <th>관리자 지급 및 회수</th>
                <th>환전</th>
                <th>테스트 계정<br/>지급 및 회수</th>
                <th>테스트 계성 환전</th>
                <th>탈퇴 회원<br/>보유 별</th>
                <th>소계</th>
            </tr>
            </thead>
            <tbody>
            <tr class="font-bold" style="background-color: #fdeada">
                <td>총합</td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            {{#each this as |data|}}
            <tr>
                <td class="font-bold _stateSubTh">
                    {{#equal ../slctType 0}}{{data.hour}}시{{/equal}}
                    {{#equal ../slctType 1}}{{substr data.daily 5}}{{/equal}}
                    {{#equal ../slctType 2}}{{data.monthly}}월{{/equal}}
                </td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td style="background-color: #fdeada"></td>
            </tr>
            {{else}}
            <td colspan="10" class="noData">{{isEmptyData}}<td>
            {{/each}}
            </tbody>
        </table>
    </div>
</script>