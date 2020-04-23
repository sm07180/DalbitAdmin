<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="wrapper">
    <div id="page-wrapper">
        <div id="container-fluid">
            <h3>log - error data 확인</h3>
            <!-- searchBox -->
            <form id="searchForm">
                <div class="row col-lg-12 form-inline">
                    <div class="widget widget-table searchBoxArea">
                        <div class="widget-header searchBoxRow">
                            <h3 class="title"><i class="fa fa-search"></i> 검색조건</h3>
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
                                <span id="osTypeArea"></span>
                                <label><input type="text" class="form-control" name="searchText" id="searchText" placeholder="description 검색창"></label>
                                <button type="button" class="btn btn-success" id="bt_search">검색</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            <!-- // searchBox -->

            <!-- error log table-->
            <div class="row col-lg-12 form-inline">
                <span>
                    <button class="btn btn-default print-btn" type="button" id="excelDownBtn"><i class="fa fa-print"></i>Excel Down</button>
                </span>
                <div class="widget widget-table"  style="width:5000px; overflow: scroll">
                    <div class="widget-content">
                        <table class="table table-bordered table-summary" id="Summary">
                            <thead>
                            <tr>
                                <th>총 : <span id="total"></span> 건 </th>
                            </tr>
                            </thead>
                            <tbody id="summaryDataTable">
                            </tbody>
                        </table>
                        <table id="errorList" class="table table-sorting table-hover table-bordered datatable">
                            <thead>
                            <th width="100px">idx</th>
                            <th width="200px">mem_no</th>
                            <th width="100px">ostype</th>
                            <th width="100px">version</th>
                            <th width="100px">build</th>
                            <th width="100px">dtype</th>
                            <th width="500px">ctype</th>
                            <th width="8000px">desc</th>
                            <th width="100px">upd_date</th>
                            </thead>
                            <tbody id="tableBody">
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="dataTables_paginate paging_full_numbers" id="list_info_paginate"></div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="/js/code/sample/sampleCodeList.js"></script>
<script type="text/javascript">
    var errorPagingInfo = new PAGING_INFO(0, 1, 500);

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
            errorPagingInfo.pageNo = 1;
            getErrorList();
        };
    });

    $('#bt_search').click( function() {       //검색
        compare();
        errorPagingInfo.pageNo = 1;
        getErrorList();
    });

    function init() {
        $("#osTypeArea").html(util.getCommonCodeSelect(-1, search_osType));

        $('#txt_startSel').datepicker("setDate", new Date());
        $('#txt_endSel').datepicker("setDate", new Date());

        $('#txt_startSel').datepicker().on('dp.change',function(e){
            $(this).html($(this).val());
        });
        $('#txt_endSel').datepicker().on('dp.change',function(e){
            $(this).html($(this).val());
        });

        getErrorList();
    }

    function getErrorList(){
        $("#pageStart").val(errorPagingInfo.pageNo);
        $("#pageCnt").val(errorPagingInfo.pageCnt);
        util.getAjaxData("errorList", "/rest/sample/errorList", $('#searchForm').serialize(), fn_success);
    }

    function fn_success(dst_id, response) {
        dalbitLog(response);
        var template = $('#tmp_errorList').html();
        var templateScript = Handlebars.compile(template);
        var context = response.data;
        var html = templateScript(context);

        $("#tableBody").html(html);

        $("#total").html(response.pagingVo.totalCnt);

        var pagingInfo = response.pagingVo;
        errorPagingInfo.totalCnt = pagingInfo.totalCnt;
        console.log(errorPagingInfo);
        util.renderPagingNavigation("list_info_paginate", errorPagingInfo);

        if(response.data.length == 0) {
            $("#list_info_paginate").hide();
        } else {
            $("#list_info_paginate").show();
        }

    }

    function handlebarsPaging(targetId, pagingInfo){
        errorPagingInfo = pagingInfo;
        getErrorList();
    }

    $("#excelDownBtn").on('click', function() {
        var formElement = document.querySelector("form");
        var formData = new FormData(formElement);
        formData.append("pageStart", $("#pageStart").val());
        formData.append("pageCnt", $("#pageCnt").val());
        formData.append("txt_startSel", $("#txt_startSel").val());
        formData.append("txt_endSel", $("#txt_endSel").val());
        formData.append("ostype", $("#ostype").val());
        formData.append("searchText", $("#searchText").val());

        util.excelDownload($(this), "/rest/sample/errorListExcel", formData);
    });

</script>

<script id="tmp_errorList" type="text/x-handlebars-template">
    {{#each this}}
    <tr>
        <td>{{idx}}</td>
        <td>{{mem_no}}</td>
        <td>{{ostype}}</td>
        <td>{{version}}</td>
        <td>{{build}}</td>
        <td>{{dtype}}</td>
        <td>{{ctype}}</td>
        <td style="text-align:left">{{desc}}</td>
        <td>{{upd_date}}</td>
    </tr>
    {{else}}
    <tr>
        <td colspan="7">{{isEmptyData}}</td>
    </tr>
    {{/each}}
</script>