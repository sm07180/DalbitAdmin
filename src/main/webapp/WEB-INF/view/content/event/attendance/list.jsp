<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="wrapper">
    <div id="page-wrapper">
        <div id="container-fluid">
            <!-- serachBox -->
            <form id="searchForm">
                <div class="row col-lg-12 form-inline">
                    <div class="widget widget-table searchBoxArea">
                        <div class="widget-header searchBoxRow">
                            <h3 class="title"><i class="fa fa-search"></i> 회원검색</h3>
                            <div class="input-group date" id="date_startSel">
                                <input type="text" class="form-control " id="txt_startSel" name="txt_startSel"><span class="input-group-addon"><i class="glyphicon glyphicon-calendar" id="i_startSel"></i></span>
                            </div>
                            <label>~</label>
                            <div class="input-group date" id="date_endSel">
                                <input type="text" class="form-control" id="txt_endSel" name="txt_endSel"><span class="input-group-addon"><i class="glyphicon glyphicon-calendar" id="i_endSel"></i></span>
                            </div>
                            <span id="attendanceTypeArea"></span>
                            <span id="searchTypeArea"></span>
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
    $(function() {
       init();
       getList();
    });

    $('#bt_search').click(function() {
        getList();
        dateCompare();

    });

    $('input[id="txt_search"]').keydown(function(e) {
       if(e.keyCode === 13) {
           getList();
           dateCompare();
       }
    });

    function init() {
        // 검색조건 불러오기
        $('#attendanceTypeArea').html(util.getCommonCodeSelect('-1', attendance_dayType));
        $('#searchTypeArea').html(util.getCommonCodeSelect('-1', attendance_searchType));

        $('#txt_startSel').datepicker("setDate", new Date());
        $('#txt_endSel').datepicker("setDate", new Date());

        $('#txt_startSel').datepicker().on('dp.change', function(e) {
           $(this).html($(this).val());
        });
        $('#txt_endSel').datepicker().on('dp.change', function(e) {
           $(this).html($(this).val());
        });
    }

    function getList() {
        var dtList_info_data = function (data) {
            data.attendanceType = $('#attendanceTypeArea').val();   // 참여 구분
            data.searchType = $('#attendance_searchType').val();    // 검색 조건
            data.search = $('#txt_search').val();                   // 검색 창
        };

        dtList_info = new DalbitDataTable($('#attendanceList'), dtList_info_data, EventDataTableSource.attendance, $('#searchForm'));
        dtList_info.useCheckBox(false);
        dtList_info.useIndex(true);
        dtList_info.setPageLength(50);
        dtList_info.createDataTable();
    }

    function dateCompare() {
        var startSel =  moment($('#txt_startSel').val()).format('YYYYMMDD');
        var endSel = moment($('#txt_endSel').val()).format('YYYYMMDD');
        if(startSel > endSel) {
            alert('날짜를 확인해주세요.');
            init();
            getList();
        }
    }
</script>