<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dummyData"><%= java.lang.Math.round(java.lang.Math.random() * 1000000) %></c:set>

<div id="wrapper">
    <div id="page-wrapper">
        <div id="container-fluid">
            <h3>쿠콘 현금영수증 발행내역</h3>
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
                                <span id="searchTypeArea"></span>
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
                <div class="widget widget-table">
                    <div class="widget-content">
                        <table class="table table-bordered table-summary" id="Summary">
                            <thead>
                            <tr>
                                <th><span id="type">총</span> : <span id="total"></span> 건 </th>
                            </tr>
                            </thead>
                            <tbody id="summaryDataTable">
                            </tbody>
                        </table>
                        <table id="receiptList" class="table table-sorting table-hover table-bordered datatable">
                            <thead>
                            <th>no</th>
                            <th>일시</th>
                            <th>이름</th>
                            <th>주문번호</th>
                            <th>승인번호</th>
                            <th>금액</th>
                            <th>증빙종류</th>
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

<script type="text/javascript" src="/js/code/payment/payCodeList.js?${dummyData}"></script>
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
            getReceiptList();
        };
    });

    $('#bt_search').click( function() {       //검색
        compare();
        errorPagingInfo.pageNo = 1;
        getReceiptList();
    });

    function init() {
        $("#searchTypeArea").html(util.getCommonCodeSelect(-1, receiptSearchType));


        $('#txt_startSel').datepicker("setDate", new Date());
        $('#txt_endSel').datepicker("setDate", new Date());

        $('#txt_startSel').datepicker().on('dp.change',function(e){
            $(this).html($(this).val());
        });
        $('#txt_endSel').datepicker().on('dp.change',function(e){
            $(this).html($(this).val());
        });
    }

    function getReceiptList(){
        $("#pageStart").val(errorPagingInfo.pageNo);
        $("#pageCnt").val(errorPagingInfo.pageCnt);
        util.getAjaxData("receiptList", "/rest/payment/pay/cooconReceiptList", $('#searchForm').serialize(), fn_success);
    }

    function fn_success(dst_id, response) {
        var template = $('#tmp_receiptList').html();
        var templateScript = Handlebars.compile(template);
        var context = response.data;
        var html = templateScript(context);

        $("#tableBody").html(html);
        $("#total").html(response.data.receiptCnt);

        errorPagingInfo.totalCnt = response.data.totalCnt;
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
        getReceiptList();
    }

    $("#excelDownBtn").on('click', function() {
        var formElement = document.querySelector("form");
        var formData = new FormData(formElement);
        formData.append("pageStart", $("#pageStart").val());
        formData.append("pageCnt", $("#pageCnt").val());
        formData.append("txt_startSel", $("#txt_startSel").val());
        formData.append("txt_endSel", $("#txt_endSel").val());
        formData.append("searchText", $("#searchText").val());

        util.excelDownload($(this), "/rest/payment/pay/receiptListExcel", formData);
    });

</script>

<script id="tmp_receiptList" type="text/x-handlebars-template">
    {{#each this.receiptList}}
        <tr>
            <td>{{indexDesc ../receiptCnt rowNum}}</td>
            <td>{{pay_ok_date}}</td>
            <td>{{rcpt_nm}}</td>
            <td>{{order_id}}</td>
            <td>{{receipt_ok_number}}</td>
            <td>{{addComma pay_amt}}원</td>
            <td>{{receipt_code}}</td>
        </tr>
    {{else}}
        <tr>
            <td colspan="9">{{isEmptyData}}</td>
        </tr>
    {{/each}}
</script>