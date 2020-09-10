<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dummyData"><%= java.lang.Math.round(java.lang.Math.random() * 1000000) %></c:set>

<style>
    ::-webkit-scrollbar{
        display: none;
    }
</style>

<div id="wrapper">
    <div id="page-wrapper">
        <div id="container-fluid">
            <!-- searchBox -->
            <form id="searchForm">
                <div class="row col-lg-12 form-inline">
                    <div class="widget widget-table searchBoxArea">
                        <div class="widget-header searchBoxRow">
                            <h3 class="title"><i class="fa fa-search"></i> 알림톡 이력 검색</h3>
                            <input type="hidden" name="pageStart" id="pageStart">
                            <input type="hidden" name="pageCnt" id="pageCnt">
                            <div>
                                <div class="input-group date" id="date_startSel">
                                    <input type="text" class="form-control " id="txt_startSel" name="txt_startSel"><span class="input-group-addon"><i class="glyphicon glyphicon-calendar" id="i_startSel"></i></span>
                                </div>
                                <label>~</label>
                                <div class="input-group date" id="date_endSel">
                                    <input type="text" class="form-control" id="txt_endSel" name="txt_endSel"><span class="input-group-addon"><i class="glyphicon glyphicon-calendar" id="i_endSel"></i></span>
                                </div>
                                <span id="statusTypeArea"></span>
                                <span id="searchTypeArea"></span>
                                <label><input type="text" class="form-control" name="searchText" id="searchText" placeholder=""></label>
                                <button type="button" class="btn btn-success" id="bt_search">검색</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            <!-- // searchBox -->

            <!-- alarmTalk log table-->
            <div class="row col-lg-12 form-inline">
                <div class="widget widget-table"  style="overflow: auto">
                    <div class="widget-header">
                        <h3><i class="fa fa-desktop"></i> 검색결과</h3>
                    </div>
                    <div class="widget-content">
                        <div class="dataTables_paginate paging_full_numbers" id="list_info_paginate_top"></div>
                        <div>
                            <table id="errorList" class="table table-sorting table-hover table-bordered datatable no-margin" style="table-layout: fixed">
                                <thead>
                                    <th width="50px">No.</th>
                                    <th width="160px">그룹 코드</th>
                                    <th width="60px">대상<br>직원번호</th>
                                    <th width="60px">대상<br>직원명</th>
                                    <th width="110px">대상<br>핸드폰번호</th>
                                    <th>내용</th>
                                    <th width="150px">발송 시간</th>
                                    <th width="50px">결과</th>
                                    <th width="500px">결과 상세</th>
                                </thead>
                                <tbody id="tableBody">
                                </tbody>
                            </table>
                        </div>
                        <div class="dataTables_paginate paging_full_numbers" id="list_info_paginate"></div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="/js/code/sample/sampleCodeList.js?${dummyData}"></script>
<script type="text/javascript">
    var alarmTalkPagingInfo = new PAGING_INFO(0, 1, 100);

    $(document).ready(function() {
        init();
    });

    function compare() {
        var startDate = $('#txt_startSel').val();
        var startDateArr = startDate.split('.');
        var endDate = $('#txt_endSel').val();
        var endDateArr = endDate.split('.');

        var startDateCompare = new Date(startDateArr[0], parseInt(startDateArr[1])-1, startDateArr[2]);
        var endDateCompare = new Date(endDateArr[0], parseInt(endDateArr[1])-1, endDateArr[2]);

        if(startDateCompare.getTime() > endDateCompare.getTime()) {
            alert('시작날짜와 종료날짜를 확인해주세요');
        }
    }

    $('input[id="searchText"]').keydown(function(e) {
        if (e.keyCode === 13) {
            compare();
            alarmTalkPagingInfo.pageNo = 1;
            getAlarmTalkList();
        };
    });

    $('#bt_search').click( function() {       //검색
        compare();
        alarmTalkPagingInfo.pageNo = 1;
        getAlarmTalkList();
    });

    function init() {
        $("#statusTypeArea").html(util.getCommonCodeSelect('', search_alarmTalk_status));
        $("#searchTypeArea").html(util.getCommonCodeSelect('', search_alarmTalk_seachType));

        var now = new Date();

        $('#txt_startSel').datepicker("setDate", new Date(now.getFullYear(), now.getMonth(), 1));
        $('#txt_endSel').datepicker("setDate", now);

        $('#txt_startSel').datepicker().on('dp.change',function(e){
            $(this).html($(this).val());
        });
        $('#txt_endSel').datepicker().on('dp.change',function(e){
            $(this).html($(this).val());
        });

        getAlarmTalkList(); //20.05.09 검색해야지만 노출되게 이재은
    }

    function getAlarmTalkList(){
        $("#pageStart").val(alarmTalkPagingInfo.pageNo);
        $("#pageCnt").val(alarmTalkPagingInfo.pageCnt);
        util.getAjaxData("alarmTalkLogList", "/rest/administrate/alarmtalk/logs", $('#searchForm').serialize(), fn_success);
    }

    function fn_success(dst_id, response) {
        var template = $('#tmp_errorList').html();
        var templateScript = Handlebars.compile(template);
        var context = response.data;
        var html = templateScript(context);

        $("#tableBody").html(html);


        $("#total").html(response.pagingVo.totalCnt);

        var pagingInfo = response.pagingVo;
        alarmTalkPagingInfo.totalCnt = pagingInfo.totalCnt;
        console.log(alarmTalkPagingInfo);
        util.renderPagingNavigation("list_info_paginate_top", alarmTalkPagingInfo);
        util.renderPagingNavigation("list_info_paginate", alarmTalkPagingInfo);

        if(common.isEmpty(response.data) || response.data.length == 0) {
            $("#list_info_paginate_top").hide();
            $("#list_info_paginate").hide();
        } else {
            $("#list_info_paginate_top").show();
            $("#list_info_paginate").show();
        }

    }

    function handlebarsPaging(targetId, pagingInfo){
        alarmTalkPagingInfo = pagingInfo;
        getAlarmTalkList();
    }

</script>

<script id="tmp_errorList" type="text/x-handlebars-template">
    {{#each this}}
    <tr>
        <td>{{rowNum}}</td>
        <td>{{group_idx}}</td>
        <td>{{emp_no}}</td>
        <td>{{staff_name}}</td>
        <td>{{staff_hphone}}</td>
        <td class="al">{{{replaceNewLineToBr msg}}}</td>
        <td>{{send_date}}</td>
        <td>{{result_code_kr}}</td>
        <td class="al" style="overflow-x:scroll;white-space:nowrap;" title="{{result_cont}}">{{result_cont}}</td>
    </tr>
    {{else}}
    <tr>
        <td colspan="9">{{isEmptyData}}</td>
    </tr>
    {{/each}}
</script>