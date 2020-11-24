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
                        <table>
                            <tr>
                                <th style="background-color:#4472c4;color:#e9ee17;width: 70px">
                                    <i class="fa fa-search"></i><br/>검색
                                    <jsp:include page="../searchArea/daySearchFunction.jsp"/>
                                </th>
                                <td style="text-align: left">

                                    <span id="statusTypeArea"></span>
                                    <span id="searchTypeArea"></span>
                                    <jsp:include page="../searchArea/dateRangeSearchArea.jsp"/>

                                    <input type="text" class="form-control" id="onedayDate" name="onedayDate">

                                    <input class="hide" name="startDate" id="startDate" style="width: 100px">
                                    <input class="hide" name="endDate" id="endDate" style="width: 100px">
                                    <%--<input name="startDate" id="startDate" style="width: 100px">--%>
                                    <%--<input name="endDate" id="endDate" style="width: 100px">--%>
                                    <label><input type="text" class="form-control" name="searchText" id="searchText" placeholder="검색어를 입력해주세요."></label>

                                    <button type="button" class="btn btn-success" id="bt_search">검색</button>
                                    <a href="javascript://" class="_prevSearch">[이전]</a>
                                    <a href="javascript://" class="_todaySearch">[오늘]</a>
                                    <a href="javascript://" class="_nextSearch">[다음]</a>

                                    <span id="searchCheck">
                                        <label class="control-inline fancy-checkbox custom-color-green">
                                            <input type="checkbox" name="search_testId" id="search_testId" value="1">
                                            <span>테스트 아이디 제외</span>
                                        </label>
                                    </span>
                                </td>
                            </tr>
                        </table>
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

    $('input[id="searchText"]').keydown(function(e) {
        if (e.keyCode === 13) {
            alarmTalkPagingInfo.pageNo = 1;
            getAlarmTalkList();
        };
    });

    $('#bt_search').click( function() {       //검색
        alarmTalkPagingInfo.pageNo = 1;
        getAlarmTalkList();
    });

    function init() {
        $("#statusTypeArea").html(util.getCommonCodeSelect('', search_alarmTalk_status));
        $("#searchTypeArea").html(util.getCommonCodeSelect('', search_alarmTalk_seachType));

        slctType = 3;
        dateType(slctType);

        getAlarmTalkList(); //20.05.09 검색해야지만 노출되게 이재은
    }

    function getAlarmTalkList(){
        $("#pageStart").val(alarmTalkPagingInfo.pageNo);
        $("#pageCnt").val(alarmTalkPagingInfo.pageCnt);

        var data = {
            txt_startSel : $("#startDate").val()
            ,txt_endSel : $("#endDate").val()
            ,searchText : $("#searchText").val()
            ,result_code :  $("#result_code").val()
            ,pageStart : alarmTalkPagingInfo.pageNo
            ,pageCnt : alarmTalkPagingInfo.pageCnt
        };
        util.getAjaxData("alarmTalkLogList", "/rest/administrate/alarmtalk/logs", data, fn_success);
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