<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dummyData"><%= java.lang.Math.round(java.lang.Math.random() * 1000000) %></c:set>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="container-fluid">
            <!-- serachBox -->
            <div class="col-md-12 no-padding">
                <div class="row col-lg-8 form-inline">
                    <form id="searchForm">
                        <div class="widget widget-table searchBoxArea">
                            <div class="widget-header searchBoxRow">
                                <h3 class="title"><i class="fa fa-search"></i> 테스트아이디 검색</h3>

                                <div>
                                    <span id="searchFormRadio"></span>

                                    <div class="input-group date" id="rangeDatepicker">
                                        <label for="displayDate" class="input-group-addon">
                                            <span><i class="fa fa-calendar"></i></span>
                                        </label>
                                        <input type="text" name="displayDate" id="displayDate" class="form-control" />
                                    </div>

                                    <input type="hidden" name="startDate" id="startDate">
                                    <input type="hidden" name="endDate" id="endDate" />

                                    <%--<input name="startDate" id="startDate">--%>
                                    <%--<input name="endDate" id="endDate" />--%>

                                    <label><input type="text" class="form-control" id="searchText" name="searchText"></label>
                                    <button type="button" class="btn btn-success" id="bt_search">검색</button>
                                    <a href="javascript://" class="_prevSearch">[이전]</a>
                                    <a href="javascript://" class="_todaySearch">[오늘]</a>
                                    <a href="javascript://" class="_nextSearch">[다음]</a>

                                </div>
                            </div>
                        </div>
                    </form>
                    <span>
                        * 테스트 계정의 달/별 사용 정보를 확인하는 페이지입니다.<br/>
                        * 해당 페이지는 별도 권한으로 확인 및 관리가 가능합니다.
                    </span>
                </div>
                <div class="col-md-4 no-padding pull-right">
                    <span id="testDalByeolSummary"></span>
                </div>
            </div>
            <!-- //serachBox -->
            <!-- DATA TABLE -->
            <div class="row">
                <!-- 테스트 계정 현황 -->
                <div class="col-lg-2">
                    <div class="widget widget-table mb10">
                        <div class="widget-header">
                            <h3><i class="fa fa-table"></i> 테스트 계정 현황</h3>
                        </div>
                        <div class="widget-content mt10">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>직원명 <span id="summaryTotalArea_mem"></span></th>
                                        <th>총 <span id="summaryTotalArea">0</span>개</th>
                                    </tr>
                                </thead>
                                <tbody id="summaryArea"></tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <!-- //테스트 계정 현황 -->
                <div class="col-md-10 no-padding">
                    <div class="col-md-2 no-padding">
                        <span id="testDalByeollistSort" onchange="testDalByeollistSort_change();"></span>
                    </div>
                    <span id="tb_list"></span>
                </div>
            </div>
            <!-- #DataTable -->

        </div>
    </div>
</div>

<script type="text/javascript" src="/js/lib/jquery.table2excel.js"></script>
<script type="text/javascript" src="/js/code/administrate/adminCodeList.js?${dummyData}"></script>
<script type="text/javascript" src="/js/code/customer/customerCodeList.js?${dummyData}"></script>
<script type="text/javascript" src="/js/handlebars/administrateHelper.js?${dummyData}"></script>
<script>

    var dateTime = new Date();
    dateTime = moment(dateTime).format("YYYY.MM.DD");
    setTimeDate(dateTime);

    var sDate;
    var eDate;
    var _searchFormRadio ="";
    var empName;
    var listSort;
    var pagingInfo = new PAGING_INFO(0,1,50);

    $(document).ready(function() {

        $("#displayDate").statsDaterangepicker(
            function(start, end, t1) {
                $("#startDate").val(start.format('YYYY.MM.DD'));
                $("#endDate").val(end.format('YYYY.MM.DD'));
            }
        );
        $("#searchFormRadio").html(util.getCommonCodeRadio(0, searchFormRadio));

        $('#testDalByeollistSort').html(util.getCommonCodeSelect(-1, testDalByeollistSort));

        init();
        radioChange();
    });


    $(document).on('change', 'input[name="searchFormRadio"]', function(){
        radioChange();
    });

    function radioChange(){
        _searchFormRadio = $('input[name="searchFormRadio"]:checked').val();
        if(_searchFormRadio == 2){
            setTimeDate(dateTime);
        }
        setStartDay();
    }

    $(document).on('click', '._prevSearch', function(){
        searchDate('prev');
    });

    $(document).on('click', '._nextSearch', function(){
        searchDate('next');
    });

    $(document).on('click', '._todaySearch', function(){
        $("input:radio[name='searchFormRadio']:radio[value='2']").prop('checked', true);
        _searchFormRadio = $('input[name="searchFormRadio"]:checked').val();
        setTimeDate(dateTime);
        setStartDay();
    });

    function setTimeDate(dateTime){
        $("#startDate").val(dateTime);
        $("#endDate").val(dateTime);
        $("#displayDate").val(dateTime + " - " + dateTime);
    }

    function searchDate(dateType){
        if(dateType == 'prev'){
            setDay(-1);
        }else if(dateType == 'next'){
            setDay(1);
        }
    }

    function setDay(days){
        $("#startDate").val(moment($("#startDate").val()).add('days', days).format('YYYY.MM.DD'));
        $("#endDate").val(moment($("#endDate").val()).add('days', days).format('YYYY.MM.DD'));

        $("#displayDate").val($("#startDate").val() + " - " + $("#endDate").val());

        getList();
    }
    function setStartDay() {
        var date = new Date();
        $("#endDate").val(dateTime);

        if (_searchFormRadio == 1) {     // 일주일 전
            sDate = new Date(Date.parse(date) - 7 * 1000 * 60 * 60 * 24);           // 일주일 전
            sDate = date.getFullYear() + "." + common.lpad(sDate.getMonth() + 1, 2, "0") + "." + common.lpad(sDate.getDate() + 1, 2, "0");      // 일주일전
            $("#startDate").val(sDate);
        } else if (_searchFormRadio == 0) {       // 한달전
            var setMonthDate;
            var cal = common.lpad(date.getMonth(), 2, "0") + "." + common.lpad(new Date(date.getFullYear(), date.getMonth(), 0).getDate(), 2, "0");

            if (common.lpad(date.getMonth(), 2, "0") + "." + common.lpad(date.getDate(), 2, "0") > cal) {
                setMonthDate = cal;
            } else {
                setMonthDate = common.lpad(date.getMonth(), 2, "0") + "." + common.lpad(date.getDate(), 2, "0");
            }

            sDate = date.getFullYear() + "." + setMonthDate;
            $('#startDate').val(sDate);
        }
        $("#displayDate").val($("#startDate").val() + " - " + $("#endDate").val());

        getList();
    }

    function init(){
        getSummary();
    }

    function getSummary(){
        util.getAjaxData("summary", "/rest/administrate/testId/summary", $("#searchForm").serialize(), fn_summary_success);
    }

    function fn_summary_success(dst_id, response){

        if(response.result == 'success'){
            var totalCnt = 0;
            response.data.forEach(function(summary){
                totalCnt += summary.cnt;
            });
            $("#summaryTotalArea").html(totalCnt);
            $("#summaryTotalArea_mem").html("(" + response.data.length + "명)");

            var template = $('#tmp_summary').html();
            var templateScript = Handlebars.compile(template);
            var context = response.data;
            var html=templateScript(context);
            $("#summaryArea").html(html);


            sDate = $("#startDate").val();
            eDate = $("#endDate").val();

            getList();
        }else{
            $("#summaryTotalArea_mem").html("(0명)");
        }
    }

    $('input[id="searchText"]').keydown(function() {
        if (event.keyCode === 13) {
            sDate = $("#startDate").val();
            eDate = $("#endDate").val();
            getList();
        };
    });

    $("#bt_search").on('click', function(){
       getList();
    });

    function getList(){
        var data = {
            emp_name : $("#searchText").val()
            ,sDate : sDate
            ,eDate : eDate
            ,pageStart : pagingInfo.pageNo
            ,pageCnt : pagingInfo.pageCnt
            ,listSort : listSort
        };
        console.log(data);

        util.getAjaxData("summary", "/rest/administrate/testDalByeol/list", data , fn_list_success);
    }

    function fn_list_success(dst_id, response) {

        var template = $('#tmp_testDalByeolSummary').html();
        var templateScript = Handlebars.compile(template);
        var context = response.data;
        var html = templateScript(context);
        $("#testDalByeolSummary").html(html);

        if (!common.isEmpty(response.data.list)) {
            for (var i = 0; i < response.data.list.length; i++) {
                response.data.list[i].rowNum = response.data.totalCnt - response.data.list[i].rowNum + 1;
            }
        }

        var template = $('#tmp_list').html();
        var templateScript = Handlebars.compile(template);
        var context = response.data.list;
        var html=templateScript(context);
        $("#tb_list").html(html);

        pagingInfo.totalCnt = response.data.totalCnt;

        if (!common.isEmpty(response.data.list)) {
            if (response.data.list.length > 0) {
                util.renderPagingNavigation("list_info_paginate_top", pagingInfo);
                util.renderPagingNavigation("list_info_paginate", pagingInfo);
            }
        }else{
            util.renderPagingNavigation("list_info_paginate_top", 0);
            util.renderPagingNavigation("list_info_paginate", 0);
        }

        ui.paintColor();
        ui.tableHeightSet();
    }

    $(document).on('click', '._empName', function(){
        empName = $(this).data("empname");
        $("#searchText").val(empName);
        sDate = "";
        eDate = "";
        $("#bt_search").click();
        ui.topScroll();
    });

    function handlebarsPaging(targetId, pagingInfo){
        pagingInfo = pagingInfo;
        getList();
    }
    function testDalByeollistSort_change(){
        listSort = $("#testDalByeollistSort").find("select").val();
        getList();
    }

    function resourceClick(data){
        var popupUrl = "/administrate/testDalByeol/popup/resourceList?sDate=" + $("#startDate").val() + "&eDate=" + $("#endDate").val() + "&memno=" + data.memno + "&type=" + data.type;
        util.windowOpen(popupUrl,"900","550","데이터");
    }


</script>

<script id="tmp_summary" type="text/x-handlebars-template">
    {{#each this}}
    <tr>
        <td>
            <a href="javascript://" class="_empName" title="'{{emp_name}}'(으)로 검색" data-empname="{{emp_name}}">{{emp_name}}
        </td>
        <td>{{cnt}}개</td>
    </tr>
    {{else}}
    <tr>
        <td colspan="2">{{isEmptyData}}</td>
    </tr>
    {{/each}}
</script>


<script id="tmp_testDalByeolSummary" type="text/x-handlebars-template">
    <table class="table table-sorting table-hover table-bordered">
        <thead>
            <tr>
                <th colspan="7" class="_bgColor _fontColor" data-bgcolor="#000000" data-fontcolor="white">달/별 지급 회수 현황</th>
            </tr>
            <tr>
                <th rowspan="2">구분</th>
                <th colspan="2" class="_bgColor" data-bgcolor="#b4c7e7">달</th>
                <th rowspan="2">소계</th>
                <th colspan="2" class="_bgColor" data-bgcolor="#f8cbad">별</th>
                <th rowspan="2">소계</th>
            </tr>
            <tr>
                <th class="_bgColor" data-bgcolor="#dae3f3">지급</th>
                <th class="_bgColor" data-bgcolor="#dae3f3">회수</th>
                <th class="_bgColor" data-bgcolor="#fbe5d6">지급</th>
                <th class="_bgColor" data-bgcolor="#fbe5d6">회수</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <th>인원</th>
                <td>{{addComma summary1.sendDalMem}} 명</td>
                <td>{{addComma summary1.recvDalMem}} 명</td>
                <td>{{addComma summary1.dalTotalMem}} 명</td>
                <td>{{addComma summary1.sendByeolMem}} 명</td>
                <td>{{addComma summary1.recvByeolMem}} 명</td>
                <td>{{addComma summary1.byeolTotalMem}} 명</td>
            </tr>
            <tr>
                <th>수량</th>
                <td>{{addComma summary2.dalSend}} 개</td>
                <td>{{addComma summary2.dalRecv}} 개</td>
                <td>{{addComma summary2.totalDal}} 개</td>
                <td>{{addComma summary2.byeolSend}} 개</td>
                <td>{{addComma summary2.byeolRecv}} 개</td>
                <td>{{addComma summary2.totalByeol}} 개</td>
            </tr>
        </tbody>
    </table>
</script>


<script id="tmp_list" type="text/x-handlebars-template">
    <div class="col-md-12 no-padding">
        <div class="dataTables_paginate paging_full_numbers" id="list_info_paginate_top"></div>
        <table id="list_info" class="table table-sorting table-hover table-bordered">
            <thead>
            <tr>
                <th rowspan="2">No</th>
                <th rowspan="2">직원명</th>
                <th rowspan="2">회원번호</th>
                <th colspan="2" class="_bgColor" data-bgcolor="#b4c7e7">달</th>
                <th rowspan="2" class="_bgColor" data-bgcolor="#b4c7e7">총 보유 달</th>
                <th colspan="2" class="_bgColor" data-bgcolor="#f8cbad">별</th>
                <th rowspan="2" class="_bgColor" data-bgcolor="#f8cbad">총 보유 별</th>
                <th rowspan="2">지급자</th>
                <th rowspan="2">지급/회수 일시</th>
                <th rowspan="2">최근 사용 일시</th>
            </tr>
            <tr>
                <th class="_bgColor" data-bgcolor="#dae3f3">지급</th>
                <th class="_bgColor" data-bgcolor="#dae3f3">회수</th>
                <th class="_bgColor" data-bgcolor="#fbe5d6">지급</th>
                <th class="_bgColor" data-bgcolor="#fbe5d6">회수</th>
            </tr>
            </thead>
            <tbody id="tableBody">
                {{#each this as |data|}}
                <tr>
                    <td>{{rowNum}}</td>
                    <td>{{emp_name}}</td>
                    <td><a href="javascript://" class="_openMemberPop" data-memno="{{memNo}}" data-tabid="tab_walletDetail">{{memNo}}</a></td>
                    <td>{{addComma dalSend}}</td>
                    <td>{{addComma dalRecv}}</td>
                    <td><a onclick="resourceClick($(this).data())" data-memno="{{memNo}}" data-type="d">{{addComma dal}}</a></td>
                    <td>{{addComma byeolSend}}</td>
                    <td>{{addComma byeolRecv}}</td>
                    <td><a onclick="resourceClick($(this).data())" data-memno="{{memNo}}" data-type="b">{{addComma byeol}}</a></td>
                    <td>{{op_name}}</td>
                    <td>{{substr last_upd_date 0 19}}</td>
                    <td>{{substr lastUpdDate 0 19}}</td>
                </tr>
                {{else}}
                <tr>
                    <td colspan="12">{{isEmptyData}}</td>
                </tr>
                {{/each}}
            </tbody>
        </table>
        <div class="dataTables_paginate paging_full_numbers" id="list_info_paginate"></div>
    </div>
</script>
