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

                            <div class="input-group date" id="data_startSel">
                                <input type="text" class="form-control" id="txt_startSel" name="txt_startSel"><span class="input-group-addon"><i class="glyphicon glyphicon-calendar" id="i_startSel"></i></span>
                            </div>
                            <label>~</label>
                            <div class="input-group date" id="data_endSel">
                                <input type="text" class="form-control" id="txt_endSel" name="txt_endSel"><span class="input-group-addon"><i class="glyphicon glyphicon-calendar" id="i_endSel"></i></span>
                            </div>

                            <span id="smsArea"></span>
                            <label><input type="text" class="form-control" name="searchText" id="searchText" placeholder="검색할 정보를 입력하세요"></label>
                            <button type="button" class="btn btn-success" id="bt_search">검색</button>
                        </div>
                    </div>
                </div>
            </form>
            <!-- // serachBox -->

            <!-- data table -->
            <div class="row col-lg-12 form-inline">
                <div class="mb15" id="htmlTag"></div>
                <div class="widget widget-table">
                    <div class="widget-content mt10">
                        <div class="dataTables_paginate paging_full_numbers" id="list_info_paginate_top"></div>
                        <table id="smsList" class="table table-sorting table-hover table-bordered datatable">
                            <thead>
                            <th>No</th>
                            <th>발신번호</th>
                            <th>통신사</th>
                            <th>수신번호</th>
                            <th>발송일</th>
                            <th>발송내용</th>
                            <th>구분</th>
                            </thead>
                            <tbody id="tableBody"></tbody>
                        </table>
                        <div class="dataTables_paginate paging_full_numbers" id="list_info_paginate"></div>
                    </div>
                    <span>
                        <button class="btn btn-default btn-sm print-btn pull-right mr10" type="button" id="excelDownBtn"><i class="fa fa-print"></i>Excel Down</button>
                    </span>
                </div>
            </div>
            <!-- // data table -->

        </div> <!-- // container-fluid -->
    </div> <!-- // page-wrapper -->
</div> <!-- //wrapper -->

<script type="text/javascript" src="/js/code/customer/customerCodeList.js?${dummyData}"></script>
<script type="text/javascript">
    var listPagingInfo = new PAGING_INFO(0, 1, 50);

    $("#htmlTag").html("ㆍ서비스를 위한 문자 발송 대기/완료 상태 및 발송 내역을 확인할 수 있습니다. " +
        "<br>ㆍ대기 상태가 수일을 경과한 경우 SMS 발송 담당자에게 문의하여 주시기 바랍니다. " +
        "<br> ㆍ서비스를 위한 문자 발송 상태 실패 내역을 확인 할 수 있습니다.");

    $(document).ready(function() {
        init();
    });

    $('input[id="searchText"]').keydown(function(e) {
        if(e.keyCode == 13) {
            listPagingInfo.pageNo = 1;
            smsList();
        }
    });
    $("#bt_search").on('click', function() {
        listPagingInfo.pageNo = 1;
        smsList();
    });

    function init() {
        var date = new Date();
        var thisYear = date.getFullYear();
        var thisMonth = date.getMonth() + 1;
        $("#txt_startSel").datepicker("setDate", thisYear + '.' + thisMonth + '.01');
        $("#txt_endSel").datepicker("setDate", date);

        $("#txt_startSel").on("dp.change", function() {
            $(this).html($(this).val());
        });
        $("#txt_endSel").on("dp.change", function() {
            $(this).html($(this).val());
        });

        $("#smsArea").html(util.getCommonCodeSelect(-1, sms_code));
        smsList();
    }

    function compare() {
        var startDate = $("#txt_startSel").val();
        var startDateArr = startDate.split('.');
        var endDate = $("#txt_endSel").val();
        var endDateArr = endDate.split('.');

        var startDateCompare = new Date(startDateArr[0], startDateArr[1]-1, startDateArr[2]);
        var endDateCompare = new Date(endDateArr[0], endDateArr[1]-1, endDateArr[2]);

        if(startDateCompare.getTime() > endDateCompare.getTime()) {
            alert('시작날짜와 종료날짜를 확인해주세요');
        }
    }

    function smsList() {
        compare();

        $("#pageStart").val(listPagingInfo.pageNo);
        $("#pageCnt").val(listPagingInfo.pageCnt);
        util.getAjaxData("list", "/rest/customer/sms/list", $("#searchForm").serialize(), fn_success_list, fn_fail);
    }

    function fn_success_list(dst_id, response) {
        var template = $("#tmp_smsList").html();
        var templateScript = Handlebars.compile(template);

        if(!common.isEmpty(response.data)){
            response.data.totalCnt = response.pagingVo.totalCnt;
        }

        var context = response.data;
        var html = templateScript(context);

        $("#tableBody").html(html);

        var pagingInfo = response.pagingVo;
        listPagingInfo.totalCnt = pagingInfo.totalCnt;
        dalbitLog(listPagingInfo);
        util.renderPagingNavigation("list_info_paginate_top", listPagingInfo);
        util.renderPagingNavigation("list_info_paginate", listPagingInfo);

        var btn = $(".paginate_button");
        btn.find('a').click(function() {
            $(this).addClass("active");
        });

        if(response.data.length == 0) {
            $("#list_info_paginate").hide();
        } else {
            $("#list_info_paginate").show();
        }
    }

    function handlebarsPaging(targetId, pagingInfo) {
        listPagingInfo = pagingInfo;
        smsList();
    }

    function fn_fail(){
        dalbitLog("#####실패");
    }

    $("#excelDownBtn").on('click', function() {
        var formElement = document.querySelector("form");
        var formData = new FormData(formElement);
        formData.append("pageStart", $("#pageStart").val());
        formData.append("pageCnt", $("#pageCnt").val());
        formData.append("txt_startSel", $("#txt_startSel").val());
        formData.append("txt_endSel", $("#txt_endSel").val());
        formData.append("vxml_file", $('select[name="sms_code"]').val());
        formData.append("searchText", $("#searchText").val());

        util.excelDownload($(this), "/rest/customer/sms/listExcel", formData, fn_success_excel);
    });

    function fn_success_excel() {
        dalbitLog("excel down 성공");
    }

</script>

<script id="tmp_smsList" type="text/x-handlebars-template">
    {{#each this as |data|}}
    <tr>
        <td>{{indexDesc ../totalCnt rowNum}}</td>
        <td>{{data.send_phone}}</td>
        <td>{{wap_info}}</td>
        <td>{{phoneNumHyphen dest_phone}}</td>
        <td>{{report_time}}</td>
        <td>{{replaceHtml msg_body}}</td>
        <td>{{{getCommonCodeLabel vxml_file 'sms_code'}}}</td>
    </tr>
    {{else}}
    <tr>
        <td colspan="7">{{isEmptyData}}</td>
    </tr>
    {{/each}}
</script>