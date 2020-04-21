<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="container-fluid">
            <!-- serachBox -->
            <form id="searchForm">
                <div class="row col-lg-12 form-inline">
                    <div class="widget widget-table searchBoxArea">
                        <div class="widget-header searchBoxRow">
                            <h3 class="title"><i class="fa fa-search"></i>검색조건</h3>
                            <input type="hidden" name="pageStart" id="pageStart">
                            <input type="hidden" name="pageCnt" id="pageCnt">
                            <div>
                                <span id="smsArea"></span>
                                <label><input type="text" class="form-control" name="searchText" id="searchText" placeholder="검색할 정보를 입력하세요"></label>
                                <button type="button" class="btn btn-success" id="bt_search">검색</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            <!-- // serachBox -->

            <!-- data table -->
            <div class="row col-lg-12 form-inline">
                <div class="widget widget-table">
                    <div class="widget-content">
                        <table id="smsList" class="table table-sorting table-hover table-bordered datatable">
                            <thead>
                                <th>No</th>
                                <th>발신번호</th>
                                <th>수신번호</th>
                                <th>발송일</th>
                                <th>발송내용</th>
                                <th>구분</th>
                            </thead>
                            <tbody id="tableBody"></tbody>
                        </table>
                    </div>
                    <div class="dataTables_paginate paging_full_numbers" id="list_info_paginate"></div>
                </div>
            </div>
            <!-- // data table -->

        </div> <!-- // container-fluid -->
    </div> <!-- // page-wrapper -->
</div> <!-- //wrapper -->

<script type="text/javascript" src="/js/code/customer/customerCodeList.js"></script>
<script type="text/javascript">
    var listPagingInfo = new PAGING_INFO(0,1,20);

    $(document).ready(function() {
       init();
    });

    function init() {
        $("#smsArea").html(util.getCommonCodeSelect(-1, sms_code));
        smsList();
    }

    $('input[id="searchText"]').keydown(function(e) {
       if(e.keyCode == 13) {
           smsList();
       }
    });
    $("#bt_search").on('click', function() {
       smsList();
    });

    function smsList() {
        $("#pageStart").val(listPagingInfo.pageNo);
        $("#pageCnt").val(listPagingInfo.pageCnt);
        util.getAjaxData("list", "/rest/customer/sms/list", $("#searchForm").serialize(), fn_success_list, fn_fail);
    }

    function fn_success_list(dst_id, response) {
        dalbitLog(response);
        var template = $("#tmp_smsList").html();
        var templateScript = Handlebars.compile(template);
        var context = response.data;
        var html = templateScript(context);

        $("#tableBody").html(html);

        var pagingInfo = response.pagingVo;
        listPagingInfo.totalCnt = pagingInfo.totalCnt;
        dalbitLog(listPagingInfo);
        util.renderPagingNavigation("list_info_paginate", listPagingInfo);
    }

    function handlebarsPaging(targetId, pagingInfo) {
        listPagingInfo = pagingInfo;
        smsList();
    }

    function fn_fail(){
        dalbitLog("#####실패");
    }
</script>

<script id="tmp_smsList" type="text/x-handlebars-template">
    {{#each this}}
    <tr>
        <td>{{cmid}}</td>
        <td>{{send_phone}}</td>
        <td>{{wap_info}} / {{dest_phone}}</td>
        <td>{{report_time}}</td>
        <td>{{msg_body}}</td>
        <td>{{{getCommonCodeLabel vxml_file 'sms_code'}}}</td>
    </tr>
    {{/each}}
</script>