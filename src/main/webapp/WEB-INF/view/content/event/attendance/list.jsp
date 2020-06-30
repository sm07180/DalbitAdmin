<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="wrapper">
    <div id="page-wrapper">
        <div id="container-fluid">

            <%@ include file="/WEB-INF/view/content/event/attendance/attendanceTab.jsp"%>
            <!-- serachBox -->
            <form id="searchForm">
                <div class="row col-lg-12 form-inline">
                    <div class="widget widget-table searchBoxArea">
                        <div class="widget-header searchBoxRow">
                            <h3 class="title"><i class="fa fa-search"></i> 회원검색</h3>
                            <span id="attendanceTypeArea"></span>
                            <span id="searchTypeArea"></span>
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

                            <a href="javascript://" class="_prevSearch">[이전]</a>
                            <a href="javascript://" class="_todaySearch">[오늘]</a>
                            <a href="javascript://" class="_nextSearch">[다음]</a>

                            <label><input type="text" class="form-control" id="txt_search" name="txt_search" placeholder="검색할 정보를 입력하세요"/></label>
                            <button type="button" class="btn btn-success" id="bt_search">검색</button>
                        </div>
                    </div>
                </div>
            </form>
            <!-- //searchForm -->

            <!-- DATA TABLE -->
            <div class="row col-lg-12 form-inline">
                <div class="widget widget-table">
                    <div class="widget-content">
                        <table id="attendanceList" class="table table-sorting table-hover table-bordered">
                            <thead></thead>
                            <tbody id="tableBody"></tbody>
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

    var dateTime = new Date();
    dateTime = moment(dateTime).format("YYYY.MM.DD");
    setTimeDate(dateTime);
    $(document).ready(function() {
        $("#displayDate").statsDaterangepicker(
            function(start, end, t1) {
                $("#startDate").val(start.format('YYYY.MM.DD'));
                $("#endDate").val(end.format('YYYY.MM.DD'));
            }
        );
        getList();
    });
    $(document).on('click', '._prevSearch', function(){
        searchDate('prev');
    });
    $(document).on('click', '._nextSearch', function(){
        searchDate('next');
    });
    $(document).on('click', '._todaySearch', function(){
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
    function setStartDay(){
        $("#endDate").val(dateTime);
        $("#displayDate").val($("#startDate").val() + " - " + $("#endDate").val());

        getList();
    }


    $(function() {
       init();
       getList();
    });

    $('#bt_search').click(function() {
        getList();

    });

    $('input[id="txt_search"]').keydown(function(e) {
       if(e.keyCode === 13) {
           getList();
       }
    });

    function init() {
        // 검색조건 불러오기
        $('#attendanceTypeArea').html(util.getCommonCodeSelect('-1', attendance_dayType));
        $('#searchTypeArea').html(util.getCommonCodeSelect('-1', attendance_searchType));
    }

    function getList() {
        var dtList_info;
        var dtList_info_data = function (data) {
            data.attendanceType = $('#attendanceTypeArea').val();   // 참여 구분
            data.searchType = $('#attendance_searchType').val();    // 검색 조건
            data.search = $('#txt_search').val();                   // 검색 창
            data.txt_startSel =  $("#startDate").val().replace(/\./gi,'');
            data.txt_endSel =  $("#endDate").val().replace(/\./gi,'');
        };

        dtList_info = new DalbitDataTable($('#attendanceList'), dtList_info_data, EventDataTableSource.attendance, $('#searchForm'));
        dtList_info.useCheckBox(false);
        dtList_info.useIndex(true);
        dtList_info.setPageLength(50);
        dtList_info.createDataTable();

        dtList_info.reload();
    }

</script>