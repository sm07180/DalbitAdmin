<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dummyData"><%= java.lang.Math.round(java.lang.Math.random() * 1000000) %></c:set>

<div id="wrapper">
    <div id="page-wrapper">
        <div id="container-fluid">

            <%@ include file="/WEB-INF/view/content/event/attendance/attendanceTab.jsp"%>

            <div class="widget widget-table mb10">
                <div class="row col-lg-12 form-inline">
                        <div class="searchBoxRow mt10" style="text-align: center">
                            <span class="fc-button fc-button-prev fc-state-default fc-corner-left fc-corner-right">
                                <span class="fc-text-arrow">‹</span>
                            </span>
                            <span class="fc-header-title" style="margin-top:4px;"><h2><span id="date_title"></span></h2></span>
                            <span class="fc-button fc-button-next fc-state-default fc-corner-left fc-corner-right">
                                <span class="fc-text-arrow">›</span>
                            </span>
                        </div>
                </div>
            </div>


            <div class="widget widget-table mb10">
                <div class="widget-header">
                    <h3><i class="fa fa-table"></i> 더줘 현황</h3>
                </div>
                <div class="col-md-12 no-padding">
                    <div class="widget-content mt10 no-padding ml10 mr10">
                        <table class="table table-bordered">
                            <colgroup>
                                <col width="10%"><col width="10%"><col width="10%"><col width="10%"><col width="10%">
                                <col width="10%"><col width="10%"><col width="10%"><col width="10%">
                            </colgroup>
                            <thead>
                            <tr>
                                <th>구분</th>
                                <th>기간</th>
                                <th>조건 충족자 수</th>
                                <th>남성</th>
                                <th>여성</th>
                                <th>알 수 없음</th>
                                <th>참여 건수</th>
                                <th>경험치</th>
                                <th>달</th>
                            </tr>
                            </thead>
                            <tbody id="bonus_status" class="_status"></tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div class="widget widget-table mb10">
                <div class="widget-header">
                    <h3><i class="fa fa-table"></i> 경험치 지급</h3>
                </div>
                <div class="col-md-12 no-padding">
                    <div class="widget-content mt10 no-padding ml10 mr10">
                        <table class="table table-bordered">
                            <colgroup>
                                <col width="10%"><col width="10%"><col width="10%"><col width="10%"><col width="10%">
                                <col width="10%"><col width="10%"><col width="10%"><col width="10%">
                            </colgroup>
                            <thead>
                                <tr>
                                    <th>구분</th>
                                    <th>기간</th>
                                    <th>경험치 50</th>
                                    <th>경험치 70</th>
                                    <th>경험치 100</th>
                                    <th>경험치 200</th>
                                    <th>경험치 300</th>
                                    <th>경험치 500</th>
                                    <th>소계</th>
                                </tr>
                            </thead>
                            <tbody id="exp_status" class="_status">
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div class="widget widget-table mb10">
                <div class="widget-header">
                    <h3><i class="fa fa-table"></i> 달 지급</h3>
                </div>
                <div class="col-md-12 no-padding">
                    <div class="widget-content mt10 no-padding ml10 mr10">
                        <table class="table table-bordered">
                            <colgroup>
                                <col width="7%"><col width="7%"><col width="7%"><col width="7%"><col width="7%">
                                <col width="7%"><col width="7%"><col width="7%"><col width="7%"><col width="7%">
                                <col width="7%"><col width="7%"><col width="7%">
                            </colgroup>
                            <thead>
                                <tr>
                                    <th>구분</th>
                                    <th>기간</th>
                                    <th>달 1</th>
                                    <th>달 2</th>
                                    <th>달 3</th>
                                    <th>달 4</th>
                                    <th>달 5</th>
                                    <th>달 6</th>
                                    <th>달 7</th>
                                    <th>달 8</th>
                                    <th>달 9</th>
                                    <th>달 10</th>
                                    <th>소계</th>
                                </tr>
                            </thead>
                            <tbody id="dal_status" class="_status">
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!-- // DATA TABLE -->
        </div> <!-- //container-fluid -->
    </div> <!-- //page-wrapper -->
</div> <!-- //wrapper -->

<script src="../../../js/lib/jquery.table2excel.js"></script>
<script type="text/javascript" src="/js/code/content/contentCodeList.js?${dummyData}"></script>
<script type="text/javascript" src="/js/code/member/memberCodeList.js?${dummyData}"></script>
<script type="text/javascript" src="/js/dataTablesSource/content/eventDataTableSource.js?${dummyData}"></script>

<script type="text/javascript">

    var curMonth = moment(new Date()).format('YYYY-MM');
    var week_no = 0;
    var week_index = [];

    $(function(){
        init();
    });

    function renderTitle(){
        $('#date_title').html(moment(curMonth).format('YYYY년 MM월'))
    }

    $('.fc-button-prev').on('click', function(){
        curMonth = moment(curMonth).add(-1, 'months').format('YYYY-MM');
        init();
    });

    $('.fc-button-next').on('click', function(){
        curMonth = moment(curMonth).add(1, 'months').format('YYYY-MM');
        init();
    });

    function init(){
        week_no = 1;
        week_index = [];

        renderTitle();

        var startMonth = moment(curMonth).format('YYYY-MM-01');
        var endMonth = moment(startMonth).add(1, 'months').subtract(1, 'days').format('YYYY-MM-DD');

        //월요일을 구하기 위해 차이 가져오기
        var mondayTerm = moment(startMonth).day() - 1;

        var startWeek = moment(startMonth).subtract(mondayTerm, 'days').format('YYYY-MM-DD');
        var endWeek = moment(startWeek).add('6', 'days').format('YYYY-MM-DD');

        var renderTable = true;
        $("._status").empty();
        while(renderTable){
            var render_month = moment(startWeek).add(week_no -1, 'weeks').format('YYYY-MM');
            if(curMonth < render_month){
                renderTable = false;
            }else{
                var s_week = moment(startWeek).add(week_no -1, 'weeks').format('YYYY-MM-DD');
                var e_week = moment(endWeek).add(week_no -1, 'weeks').format('YYYY-MM-DD');

                util.getAjaxData("bonus_status" , "/rest/content/event/attendance/bonus/status"
                    , {
                        search_startDate : s_week
                        , search_endDate : moment(e_week).add(1, 'days').format('YYYY-MM-DD')
                        , s_week : s_week
                        , e_week : e_week
                        , cur_month : curMonth
                        , week_no : week_no
                    }
                    , bonusStatus_success);
                week_no++;
            }

        }
    }

    function bonusStatus_success(dst_id, response, param){
        var data = response.data;
        data.s_week = param.s_week;
        data.e_week = param.e_week;
        data.cur_month = param.cur_month;
        data.week_no = param.week_no;
        week_index[param.week_no-1] = data;

        var count = 0;
        week_index.forEach(function(a){
            count ++;
        });
        if((week_no-1) == count){
            var template = $('#tmp_bonus_status').html();
            var templateScript = Handlebars.compile(template);
            var totalContext = week_index;
            var bonusHtml = templateScript(totalContext);
            $("#bonus_status").append(bonusHtml);

            var template = $('#tmp_exp_status').html();
            var templateScript = Handlebars.compile(template);
            var totalContext = week_index;
            var expHtml = templateScript(totalContext);
            $("#exp_status").append(expHtml);

            var template = $('#tmp_dal_status').html();
            var templateScript = Handlebars.compile(template);
            var totalContext = week_index;
            var dalHtml = templateScript(totalContext);
            $("#dal_status").append(dalHtml);
        }
    }
</script>

<script type="text/x-handlebars-template" id="tmp_bonus_status">
    {{#each this}}
        <tr data-week='{{week_no}}'>
            <th>{{moment cur_month 'MM'}}월 {{week_no}}주차</th>
            <th>{{moment s_week 'MM.DD'}} - {{moment e_week 'MM.DD'}}</th>
            <td>{{addComma target_cnt}}명</td>
            <td>{{addComma sex_man}}명</td>
            <td>{{addComma sex_female}}명</td>
            <td>{{addComma sex_unkwown}}명</td>
            <td>{{addComma join_cnt}}명</td>
            <td>{{addComma expSum}}exp</td>
            <td>{{addComma dalSum}}달</td>
        </tr>
    {{/each}}
</script>

<script type="text/x-handlebars-template" id="tmp_exp_status">
    {{#each this}}
        <tr data-week='{{week_no}}'>
            <th>{{moment cur_month 'MM'}}월 {{week_no}}주차</th>
            <th>{{moment s_week 'MM.DD'}} - {{moment e_week 'MM.DD'}}</th>
            <td>{{addComma exp50}}</td>
            <td>{{addComma exp70}}</td>
            <td>{{addComma exp100}}</td>
            <td>{{addComma exp200}}</td>
            <td>{{addComma exp300}}</td>
            <td>{{addComma exp500}}</td>
            <td>{{addComma expSum}}</td>
        </tr>
    {{/each}}
</script>

<script type="text/x-handlebars-template" id="tmp_dal_status">
    {{#each this}}
        <tr data-week='{{week_no}}'>
            <th>{{moment cur_month 'MM'}}월 {{week_no}}주차</th>
            <th>{{moment s_week 'MM.DD'}} - {{moment e_week 'MM.DD'}}</th>
            <td>{{addComma dal1}}</td>
            <td>{{addComma dal2}}</td>
            <td>{{addComma dal3}}</td>
            <td>{{addComma dal4}}</td>
            <td>{{addComma dal5}}</td>
            <td>{{addComma dal6}}</td>
            <td>{{addComma dal7}}</td>
            <td>{{addComma dal8}}</td>
            <td>{{addComma dal9}}</td>
            <td>{{addComma dal10}}</td>
            <td>{{addComma dalSum}}</td>
        </tr>
    {{/each}}
</script>