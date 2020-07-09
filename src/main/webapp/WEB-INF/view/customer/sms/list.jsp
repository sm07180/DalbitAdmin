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
                            <input type="hidden" name="tabType" id="tabType">

                                <div class="input-group date" id="data_startSel">
                                    <input type="text" class="form-control" id="input_startSel" name="input_startSel"><span class="input-group-addon"><i class="glyphicon glyphicon-calendar" id="i_startSel"></i></span>
                                    <input type="hidden" id="txt_startSel" name="txt_startSel">
                                </div>
                                <label>~</label>
                                <div class="input-group date" id="data_endSel">
                                    <input type="text" class="form-control" id="input_endSel" name="input_endSel"><span class="input-group-addon"><i class="glyphicon glyphicon-calendar" id="i_endSel"></i></span>
                                    <input type="hidden" id="txt_endSel" name="txt_endSel">
                                </div>

                                <%--<span id="smsArea"></span>--%>      <%-- 2020.07.06  조회조건 탭으로 화면을 변경하여 검색 조건에서 제거  --%>
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
                    <ul class="nav nav-tabs nav-tabs-custom-colored" id="smsTab" role="tablist">
                        <li><a href="#smsDetail" role="tab" data-toggle="tab" data-tabType="2" id="tab_pay" onclick="smsList(2)">가상계좌 발송</a></li>
                        <li><a href="#smsDetail" role="tab" data-toggle="tab" data-tabType="1" id="tab_certification" onclick="smsList(1)">인증번호 발송</a></li>
                        <li><a href="#smsDetail" role="tab" data-toggle="tab" data-tabType="7" id="tab_admin" onclick="smsList(7)">운영자 발송</a></li>
                        <li style="display: none;"><a href="#smsDetail" role="tab" data-toggle="tab" data-tabType="3" id="tab_etc" onclick="smsList(3)">기타 발송</a></li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane fade" id="smsDetail">
                            <div class="widget widget-table">
                                <div class="widget-content mt10">
                                    <button type="button" id="bt_smsSend" class="btn btn-success btn-sm pull-right _openSmsSendPop" data-cmid="" data-rownum="">운영자 문자발송</button>
                                    <div class="dataTables_paginate paging_full_numbers" id="list_info_paginate_top"></div>
                                    <table id="smsList" class="table table-sorting table-hover table-bordered datatable">
                                        <colgroup>
                                            <col width="30px"/>      <!-- No -->
                                            <col width="120px"/>    <!-- 발신번호 -->
                                            <col width="50px"/>     <!-- 통신사 -->
                                            <col width="140px"/>    <!-- 수신번호 -->
                                            <col width="140px"/>    <!-- 회원 ID -->
                                            <col width="140px"/>    <!-- 회원 닉네임 -->
                                            <col width="70px"/>    <!-- 발송상태 -->
                                            <col width="180px"/>    <!-- 발송일 -->
                                            <col width="250px"/>    <!-- LMS 제목 -->
                                            <col width="450px"/>    <!-- 발송내용 -->
                                            <col width="110px"/>    <!-- 구분 -->
                                            <col width="100px"/>    <!-- 발신자 -->
                                        </colgroup>
                                        <thead>
                                            <th>No</th>
                                            <th>발신번호</th>
                                            <th>통신사</th>
                                            <th>수신번호</th>
                                            <th>회원 ID</th>
                                            <th>회원 닉네임</th>
                                            <th>상태</th>
                                            <th>발송일</th>
                                            <th>문자제목</th>
                                            <th>문자내용</th>
                                            <th>구분</th>
                                            <th>발신자</th>
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
        "<br>ㆍ대기 상태가 수일을 경과한 경우 SMS 발신자에게 문의하여 주시기 바랍니다. " +
        "<br> ㆍ서비스를 위한 문자 발송 상태 실패 내역을 확인 할 수 있습니다.");

    $(document).ready(function() {
        init();
       $("#tab_pay").click();
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
        $("#input_endSel").datepicker("setDate", date);
        $("#input_startSel").datepicker("setDate", thisYear + '.' + thisMonth + '.01');
        $("#txt_endSel").val($("#input_endSel").val());
        $("#txt_startSel").val($("#input_startSel").val());

        $("#input_startSel").off('change').on("change", function() {
            var start = $("#input_startSel").val();
            var end = $("#input_endSel").val();
            var splitEndDate = end.split("\.");
            var splitStartDate = start.split("\.");

            if(splitStartDate[2] > splitEndDate[2]){
                $("#input_endSel").datepicker("setDate", new Date(splitStartDate[0], splitStartDate[1], 0));
                $("#input_startSel").datepicker("setDate", start);
            }

            if(start.toString().replace("\.","").substr(0,6) != end.toString().replace("\.","").substr(0,6)){
                var date = new Date(splitStartDate[0], (splitStartDate[1]), 0);
                var thisYear = date.getFullYear();
                var thisMonth = date.getMonth() + 1;
                var thisDay = date.getDate();

                // alert("동일 월만 조회 가능 합니다.");
                $("#input_endSel").val(thisYear + '.' + thisMonth + '.' + thisDay);
                $("#input_startSel").val(start);

                $("#input_endSel").datepicker("setDate", thisYear + '.' + thisMonth + '.' + thisDay);
                $("#input_startSel").datepicker("setDate", start);
                return false;
            }else{
                $("#txt_endSel").val(end);
                $("#txt_startSel").val(start);
            }
        });
        $("#input_endSel").off('change').on("change", function() {
            var end = $("#input_endSel").val();
            var start = $("#input_startSel").val();
            var splitEndDate = end.split("\.");
            var splitStartDate = start.split("\.");

            if(splitStartDate[2] > splitEndDate[2]){
                $("#input_startSel").datepicker("setDate", new Date(splitEndDate[0], (splitEndDate[1] -1) , 1));
                $("#input_endSel").datepicker("setDate", end);
            }

            if(start.toString().replace("\.","").substr(0,6) != end.toString().replace("\.","").substr(0,6)){
                var date = new Date(splitEndDate[0], (splitEndDate[1]-1), 1);
                var thisYear = date.getFullYear();
                var thisMonth = date.getMonth() + 1;

                // alert("동일 월만 조회 가능 합니다.");
                $("#input_endSel").val(end);
                $("#input_startSel").val(thisYear + '.' + thisMonth + '.01');

                $("#input_startSel").datepicker("setDate", thisYear + '.' + thisMonth + '.01');
                $("#input_endSel").datepicker("setDate", end);
                return false;
            }else{
                $("#txt_startSel").val(start);
                $("#txt_endSel").val(end);
            }
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

    function smsList(type) {
        type = common.isEmpty(type) ? "2" : type
        $("#tabType").val(type);

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
        formData.append("vxml_file", $('select[name="vxml_file"]').val());
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
        {{#if mem_no}}
            <td>
                <a href="javascript://" class="_openMemberPop" data-memNo="{{mem_no}}">{{mem_no}}</a>
                <p class="no-margin">{{mem_level}} / {{mem_grade}}</p>
            </td>
        {{else}}
            <td>개별발송</td>
        {{/if}}
        {{#if mem_nick}}
            <td>{{mem_nick}}</td>
        {{else}}
            <td></td>
        {{/if}}
        {{#dalbit_if sms_status '>' '3'}}
            <td>오류</td>
        {{else}}
            <td>{{{getCommonCodeLabel status 'sms_status'}}}</td>
        {{/dalbit_if}}
        {{#if report_time}}
            <td>{{report_time}}</td>
        {{else}}
            <td>{{substr send_time '0' '19'}}</td>
        {{/if}}
        <%--<td><a class="_openSmsSendPop" data-cmid="{{cmid}}" data-rownum="{{../totalCnt rowNum}}">{{subject}}</a></td>--%>
        <td><a href="javascript://" class="_openSmsSendPop" data-cmid="{{cmid}}" data-rownum="{{indexDesc ../totalCnt rowNum}}" data-logtable="{{logDateTableName}}">{{subject}}</a></td>
        <td class="al pl5">{{{replaceNewLineToBr msg_body}}}</td>
        <td>{{{getCommonCodeLabel vxml_file 'sms_code'}}}</td>
        {{#if send_name}}
            <td>{{send_name}}</td>
        {{else}}
            <td>자동</td>
        {{/if}}
    </tr>
    {{else}}
        <tr>
            <td colspan="12">{{isEmptyData}}</td>
        </tr>
    {{/each}}
</script>