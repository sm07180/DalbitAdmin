<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dummyData"><%= java.lang.Math.round(java.lang.Math.random() * 1000000) %></c:set>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="container-fluid">
            <!-- serachBox -->
            <form id="searchForm">
                <div class="row col-lg-12 form-inline">
                    <div class="widget widget-table searchBoxArea">
                        <table>
                            <tr>
                                <th rowspan="2" style="background-color:#4472c4;color:#e9ee17;width: 70px">
                                    <i class="fa fa-search"></i><br/>검색
                                </th>
                                <th>
                                    <jsp:include page="../../searchArea/daySearchFunction.jsp"/>
                                    <div>
                                        <div id="div_monthButton"><jsp:include page="../../searchArea/monthSearchArea.jsp"/></div>
                                    </div>
                                </th>
                            </tr>
                            <tr>
                                <td style="text-align: left">
                                    <input id="monthDate" type="text" class="form-control" style="width: 196px;"/>

                                    <input class="hide" name="startDate" id="startDate" style="width: 100px">
                                    <input class="hide" name="endDate" id="endDate" style="width: 100px">
                                    <%--<input name="startDate" id="startDate" style="width: 100px">--%>
                                    <%--<input name="endDate" id="endDate" style="width: 100px">--%>
                                    <label><input type="text" class="form-control hide" name="searchText" id="searchText" placeholder="검색어를 입력해주세요."></label>

                                    <button type="button" class="btn btn-success" id="bt_search">검색</button>
                                    <a href="javascript://" class="_prevSearch">[이전]</a>
                                    <a href="javascript://" class="_todaySearch">[오늘]</a>
                                    <a href="javascript://" class="_nextSearch">[다음]</a>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </form>
            <!-- // serachBox -->

            <!-- data table -->
            <div class="row col-lg-12 form-inline">
                <div class="mb15" id="htmlTag"></div>
                    <ul class="nav nav-tabs nav-tabs-custom-colored" id="smsTab" role="tablist">
                        <li class="active"><a href="#smsDetail" role="tab" data-toggle="tab" data-tabType="2" id="tab_pay" onclick="smsList(2, 'S')">가상계좌 발송</a></li>
                        <li><a href="#smsDetail" role="tab" data-toggle="tab" data-tabType="1" id="tab_certification" onclick="smsList(1, 'S')">인증번호 발송</a></li>
                        <li><a href="#smsDetail" role="tab" data-toggle="tab" data-tabType="7" id="tab_admin" onclick="smsList(7, 'S')">운영자 발송</a></li>
                        <li style="display: none;"><a href="#smsDetail" role="tab" data-toggle="tab" data-tabType="3" id="tab_etc" onclick="smsList(3)">기타 발송</a></li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane fade in active" id="smsDetail">
                            <div class="widget widget-table">
                                <div class="widget-content mt10">
                                    <span onchange="selChange();">
                                        <select id="msgSlctSel" value="msgSlct" class="form-control searchType">
                                            <option value="S">SMS</option>
                                            <option value="L">LMS</option>
                                        </select>
                                    </span>
                                    <div class="col-md-12 no-padding">
                                        <button type="button" id="bt_smsSend" class="btn btn-success btn-sm pull-right _openSmsSendPop" data-cmid="" data-rownum="">운영자 문자발송</button>
                                    </div>
                                    <div class="dataTables_paginate paging_full_numbers" id="list_info_paginate_top"></div>
                                    <table id="smsList" class="table table-sorting table-hover table-bordered datatable">
                                        <colgroup>
                                            <col width="30px"/>      <!-- No -->
                                            <col width="120px"/>    <!-- 발신번호 -->
                                            <col width="150px"/>    <!-- 수신번호 -->
                                            <col width="150px"/>    <!-- 회원 ID -->
                                            <col width="150px"/>    <!-- 회원 닉네임 -->
                                            <col width="70px"/>    <!-- 발송상태 -->
                                            <col width="180px"/>    <!-- 발송일 -->
                                            <col width="260px"/>    <!-- LMS 제목 -->
                                            <col width="460px"/>    <!-- 발송내용 -->
                                            <col width="110px"/>    <!-- 구분 -->
                                            <col width="100px"/>    <!-- 발신자 -->
                                        </colgroup>
                                        <thead>
                                            <th>No</th>
                                            <th>발신번호</th>
                                            <th>수신번호</th>
                                            <th>회원번호</th>
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
    var tabType = 2;
    var msgSlct = "S";

    $("#htmlTag").html("ㆍ서비스를 위한 문자 발송 대기/완료 상태 및 발송 내역을 확인할 수 있습니다. " +
        "<br>ㆍ대기 상태가 수일을 경과한 경우 SMS 발신자에게 문의하여 주시기 바랍니다. " +
        "<br> ㆍ서비스를 위한 문자 발송 상태 실패 내역을 확인 할 수 있습니다.");

    $(document).ready(function() {
        $("#smsArea").html(util.getCommonCodeSelect(-1, sms_code));
        // $("#tabType").val("2");

        slctType = 1;
        setDayButton();
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

    function smsList(type, slct) {
        if(!common.isEmpty(type)){
            listPagingInfo.pageNo = 1;
            tabType = type;
	        msgSlct = slct;
        }

	    if(!common.isEmpty(slct)){
		    msgSlct = slct;
		    if (slct === 'S') $("#msgSlctSel").val("S");
	    }

        // $("#tabType").val(type);
        $("#pageStart").val(listPagingInfo.pageNo);
        $("#pageCnt").val(listPagingInfo.pageCnt);

        console.log("-----------------------------");
        console.log(tabType, msgSlct);
        var data = {
            txt_startSel : $("#startDate").val()
            , txt_endSel : $("#endDate").val()
            , searchText : $("#searchText").val()
            , tabType : tabType
            , msgSlct : msgSlct
            , pageStart : listPagingInfo.pageNo
            , pageCnt : listPagingInfo.pageCnt
        };

        util.getAjaxData("list", "/rest/customer/sms/list", data, fn_success_list, fn_fail);
    }

    function fn_success_list(dst_id, response) {
        var template = $("#tmp_smsList").html();
        var templateScript = Handlebars.compile(template);

        if(response.result == "success") {
            console.log("-------------------- 1");
            response.data.totalCnt = response.pagingVo.totalCnt;
            var context = response.data;
            var html = templateScript(context);
        }else{
            var html = templateScript();
        }

        $("#tableBody").html(html);

        if(response.result == "success") {
            console.log("-------------------- 2");
            var pagingInfo = response.pagingVo;
            listPagingInfo.totalCnt = pagingInfo.totalCnt;
            dalbitLog(listPagingInfo);
            util.renderPagingNavigation("list_info_paginate_top", listPagingInfo);
            util.renderPagingNavigation("list_info_paginate", listPagingInfo);
        }

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

    function smsDelClick(data){
        if(confirm('예약문자를 삭제 하시겠습니까?')){
            util.getAjaxData("del", "/rest/customer/sms/del", data, alert('삭제 완료'), fn_fail);
            smsList(7);
        }
    }

    function fn_fail(){
        dalbitLog("#####실패");
    }

    $("#excelDownBtn").on('click', function() {
        console.log(tabType);
        var formElement = document.querySelector("form");
        var formData = new FormData(formElement);
        formData.append("pageStart", listPagingInfo.pageNo);
        formData.append("pageCnt", listPagingInfo.pageCnt);
        formData.append("txt_startSel", $("#startDate").val());
        formData.append("txt_endSel", $("#endDate").val());
        formData.append("tabType", tabType);
        formData.append("searchText", $("#searchText").val());

        util.excelDownload($(this), "/rest/customer/sms/listExcel", formData, fn_success_excel);
    });

    function fn_success_excel() {
        dalbitLog("excel down 성공");
    }

    function selChange(){
	    msgSlct = $("#msgSlctSel").val();
	    smsList(tabType, msgSlct);
    }

</script>

<script id="tmp_smsList" type="text/x-handlebars-template">
    {{#each this as |data|}}
    <tr>
        <td>{{indexDesc ../totalCnt rowNum}}</td>
        <td>{{data.callback}}</td>
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
        <td>완료</td>
        {{#if report_time}}
            <td>{{report_time}}</td>`
        {{else}}
            <td>{{substr send_time '0' '19'}}</td>
        {{/if}}
        <%--<td><a class="_openSmsSendPop" data-cmid="{{cmid}}" data-rownum="{{../totalCnt rowNum}}">{{subject}}</a></td>--%>
        <td>{{subject}}</td>
        <td class="al pl5">{{{replaceNewLineToBr sms_msg}}}</td>
        <td>{{{getCommonCodeLabel reserved2 'sms_code'}}}</td>
        {{#if send_name}}
            <td>{{send_name}}</td>
        {{else}}
            <td>자동</td>
        {{/if}}
    </tr>
    {{else}}
        <tr>
            <td colspan="13">{{isEmptyData}}</td>
        </tr>
    {{/each}}
</script>