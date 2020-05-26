<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="container-fluid">
            <!-- serachBox -->
            <form id="searchForm">
                <div class="row col-lg-12 form-inline">
                    <input type="hidden" name="pageStart" id="pageStart">
                    <input type="hidden" name="pageCnt" id="pageCnt">
                    <div class="widget widget-table searchBoxArea">
                        <div class="widget-header searchBoxRow">
                            <h3 class="title"><i class="fa fa-search"></i> 환전 검색</h3>
                            <div>
                                <span id="searchYearArea"></span>
                                <span id="searchMonthArea"></span>
                                <span id="searchTypeArea"></span>
                                <label><input type="text" class="form-control" id="txt_search" name="txt_search"></label>
                                <button type="button" class="btn btn-success" id="bt_search">검색</button>

                                <%--<button type="button" class="btn btn-primary" id="bt_search_special">600달 이상 보유 회원</button>
                                <label class="control-inline fancy-checkbox custom-color-green">
                                    <input type="checkbox" name="platform" id="platform-1" value="-1" checked="true">
                                    <span>스페셜 DJ 포함</span>
                                </label>--%>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            <!-- //serachBox -->

            <!-- DATA TABLE -->
            <div class="row col-lg-12 form-inline block">
                <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist">
                    <li class="_tab active">
                        <a href="#recommend" id="tab_specialDj" name="tab_specialDj" role="tab" data-toggle="tab" data-specialDj="1"><i class="fa fa-home"></i> 스페셜DJ</a>
                    </li>
                    <li class="_tab">
                        <a href="#recommend" id="tab_user" name="tab_user" role="tab" data-toggle="tab" data-specialDj="0"><i class="fa fa-home"></i> 일반회원</a>
                    </li>
                </ul>

                <div>
                    <div>

                        <div class="pt10">
                            <div>- 환전완료 정보를 확인하고, 처리 불가 회원에 대한 응대를 할 수 있습니다.</div>
                            <div>- 경영지원부에서 환전 처리를 완료한 후, 운영 담당자가 최종 확인하여 [SMS 발송]으로 회원에게 환전결과를 알립니다.</div>
                            <div>- [SMS발송]이 완료된 후 [최종완료] 처리를 하면 더 이상 변경이 불가합니다.</div>
                            <div>- 환전 불가처리 시 신청한 환전별은 환불처리 됩니다.</div>
                        </div>

                        <div class="d-flex justify-content-center">
                            <div class="spinner-border" role="status">
                                <span class="sr-only">Loading...</span>
                            </div>
                        </div>

                        <div>
                            <table class="table table-bordered table-summary pull-right">
                                <thead>
                                <tr>
                                    <th colspan="5">일반회원</th>
                                </tr>
                                <tr>
                                    <th>신청인원</th>
                                    <th>신청 별 수</th>
                                    <th>신청 완료금액</th>
                                    <th>불가 별 수</th>
                                    <th>불가 처리금액</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>100명</td>
                                    <td>100,000별</td>
                                    <td>97,600원</td>
                                    <td>200,000별</td>
                                    <td>188,000원</td>
                                </tr>
                                </tbody>
                            </table>

                            <table class="table table-bordered table-summary pull-right">
                                <thead>
                                <tr>
                                    <th colspan="5">스페셜DJ</th>
                                </tr>
                                <tr>
                                    <th>신청인원</th>
                                    <th>신청 별 수</th>
                                    <th>신청 완료금액</th>
                                    <th>불가 별 수</th>
                                    <th>불가 처리금액</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>100명</td>
                                    <td>100,000별</td>
                                    <td>97,600원</td>
                                    <td>200,000별</td>
                                    <td>188,000원</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>

                        <%--<div class="table-option">
                            <label class="control-inline fancy-radio custom-color-green">
                                <input type="radio" name="inline-radio2">
                                <span><i></i>일간</span>
                            </label>
                            <label class="control-inline fancy-radio custom-color-green">
                                <input type="radio" name="inline-radio2">
                                <span><i></i>주간</span>
                            </label>
                            <label class="control-inline fancy-radio custom-color-green">
                                <input type="radio" name="inline-radio2">
                                <span><i></i>월간</span>
                            </label>
                        </div>--%>

                        <div>
                            <div class="dataTables_paginate paging_full_numbers" id="list_info_paginate_top"></div>
                            <table id="list_info" class="table table-sorting table-hover table-bordered" style="margin-top: 10px;">
                                <thead id="tableTop">
                                <tr>
                                    <th>No</th>
                                    <th>상태</th>
                                    <th>체크</th>
                                    <th>아이디</th>
                                    <th>닉네임</th>
                                    <th>이름</th>
                                    <th>예금주</th>
                                    <th>환전신청금액</th>
                                    <th>신청 별 수</th>
                                    <%--<th>신청후잔액</th>--%>
                                    <th>남은 별 수</th>
                                    <th>환전횟수</th>
                                    <th>신청일자</th>
                                    <th>처리일자</th>
                                    <th>처리현황</th>
                                    <th>처리자</th>
                                    <th>상세보기</th>
                                </tr>
                                </thead>
                                <tbody id="tableBody"></tbody>
                            </table>
                        </div>
                        <%--<span>
                            <button class="btn btn-default print-btn pull-right mb10" type="button"><i class="fa fa-print"></i>Excel 출력</button>
                        </span>--%>
                        <div class="dataTables_paginate paging_full_numbers" id="list_info_paginate"></div>
                    </div>
                </div>
            </div>
            <!-- DATA TABLE END -->

        </div>
    </div>
</div>

<!-- 이미지 원본 보기 -->
<div id="imageFullSize"></div>

<script type="text/javascript" src="/js/code/money/exchangeCodeList.js?${dummyData}"></script>
<script type="text/javascript">
    var exchangePagingInfo = new PAGING_INFO(0,1,30);

    $(function(){
        $("#searchYearArea").html(util.getCommonCodeSelect(2020, search_exchange_years));
        $("#searchMonthArea").html(util.getCommonCodeSelect(5, search_exchange_months));
        $("#searchTypeArea").html(util.getCommonCodeSelect('', search_exchange_type));
        init();
    });

    function init(slctType){
        var data = {
            isSpecial : 1
        };
        util.getAjaxData("select", "/rest/money/exchange/list", data, fn_succ_list);
    }

    $('#bt_search').on('click', function(){
        init($('._tab.active').find('a').data('slcttype'));
    });

    $('input[id="txt_search"]').on('keydown', function(e) {    // textBox 처리
        if(e.keyCode == 13) {
            init($('._tab.active').find('a').data('slcttype'));
        };
    });

    $('._tab').on('click', function(){
        init($(this).find('a').data('slcttype'));
    });

    function fn_succ_list(data, response, params) {
        dalbitLog(response);

        var template = $('#tmp_exchangeList').html();
        var templateScript = Handlebars.compile(template);
        var context = response.data;
        var html = templateScript(context);
        $("#tableBody").html(html);

        var pagingInfo = response.data.exchangeCnt;
        exchangePagingInfo.totalCnt = response.data.exchangeCnt;
        util.renderPagingNavigation("list_info_paginate_top", exchangePagingInfo);
        util.renderPagingNavigation("list_info_paginate", exchangePagingInfo);
    }

    function handlebarsPaging(targetId, pagingInfo){
        exchangePagingInfo = pagingInfo;
        init($('._tab.active').find('a').data('slcttype'));
    }

    function fullSize_profile(url) {     // 이미지 full size
        $("#imageFullSize").html(util.imageFullSize("fullSize_profile",url));
        $('#fullSize_profile').modal('show');
    }
    function modal_close(){
        $("#fullSize_profile").modal('hide');
    }

</script>

<script type="text/x-handlebars-template" id="tmp_exchangeList">
    {{#each this.exchangeList as |data|}}
    <tr>
        <td>
            {{math ../exchangeCnt "-" @index}}
        </td>
        <td>
            {{data.mem_state}}
        </td>
        <td>
            <input type="checkbox" />
        </td>
        <td>{{data.mem_id}}</td>
        <td>{{data.mem_nick}}</td>
        <td>{{data.mem_name}}</td>
        <td>{{data.account_name}}</td>
        <td>{{addComma data.cash_basic}}원</td>
        <td>{{addComma data.byeol}}개</td>
        <!--<td>신청 후 잔액</td>-->
        <td>{{math data.gold '-' data.byeol}}개</td>
        <td>{{addComma data.exchangeCnt}}번</td>
        <td>{{convertToDate data.reg_date 'YYYY-MM-DD HH:mm:ss'}}</td>
        <td>{{convertToDate data.op_date 'YYYY-MM-DD HH:mm:ss'}}</td>
        <td>{{data.state}}</td>
        <td>{{data.op_name}}</td>
        <td><button type="button" class="btn btn-success btn-sm" id="bt_search">보기</button></td>
    </tr>

    {{else}}
    <tr>
        <td colspan="10">{{isEmptyData}}</td>
    </tr>
    {{/each}}
</script>