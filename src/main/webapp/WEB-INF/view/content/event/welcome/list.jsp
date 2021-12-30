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
                                    <jsp:include page="../../../searchArea/daySearchFunction.jsp"/>
                                </th>
                                <th id="th_bottonList">
                                    <div>
                                        <div id="div_monthButton"><jsp:include page="../../../searchArea/monthSearchArea.jsp"/></div>
                                    </div>
                                </th>
                            </tr>
                            <tr>
                                <td style="text-align: left; padding-left: 4px;">
                                    <input id="monthDate" type="text" class="form-control" style="width: 75px" readonly />
                                    <input class="hide" name="startDate" id="startDate" style="width: 100px">
                                    <input class="hide" name="endDate" id="endDate" style="width: 100px">
                                    <label><input type="text" class="form-control" name="searchText" id="searchText" placeholder="회원번호 검색"></label>
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
            <!-- //serachBox -->
            <div class="clearfix widget-content mt5 mb5">
                <h4 class="font-bold">WELCOME 이벤트</h4>

                <div id="slct_tabContainer" class="mb15">
                    <ul class="nav nav-tabs nav-tabs-custom-colored" id="kkanbu_tablist">
                        <li class="active"><a href="#detail_event" role="tab" data-toggle="tab" data-slct_type="0" aria-expanded="false" class="_tab">청취자</a></li>
                        <li><a href="#detail_event" role="tab" data-toggle="tab" data-slct_type="1" aria-expanded="false" class="_tab">DJ</a></li>
                    </ul>
                </div>

                <div id="section_tabContainer" class="mb15">
                    <ul class="nav nav-tabs nav-tabs-custom-colored" id="section_tablist">
                        <li class="active"><a href="#detail_event" role="tab" data-toggle="tab" data-section_no="0" aria-expanded="false" class="_tab">전체</a></li>
                        <li><a href="#detail_event" role="tab" data-toggle="tab" data-section_no="1" aria-expanded="false" class="_tab">1단계</a></li>
                        <li><a href="#detail_event" role="tab" data-toggle="tab" data-section_no="2" aria-expanded="false" class="_tab">2단계</a></li>
                        <li><a href="#detail_event" role="tab" data-toggle="tab" data-section_no="3" aria-expanded="false" class="_tab">3단계</a></li>
                        <li><a href="#detail_event" role="tab" data-toggle="tab" data-section_no="4" aria-expanded="false" class="_tab">ALL CLEAR</a></li>
                    </ul>
                </div>

                <div id="statusArea" class="clearfix"></div>
                <div class="btn-giftSend clearfix mt5 mb5 text-right hidden">
                    <button type="button" id="giftSend" class="btn btn-custom-secondary">지급완료</button>
                </div>
                <div id="tableArea" class="clearfix"></div>
            </div>
        </div> <!-- //container-fluid -->
    </div> <!-- //page-wrapper -->
</div> <!-- //wrapper-->

<script type="text/javascript" src="/js/code/menu/menuCodeList.js?${dummyData}"></script>
<script type="text/javascript">
    let welcomeSlctType = 0;    // 0: 청취자, 1: DJ
    let welcomeSectionNo = 0;   // 0: 전체, 1: 1단계, 2: 2단계, 3: 3단계, 4: ALL
    let memNo = document.getElementById('searchText').value;
    memNo = memNo ? parseInt(memNo, 10) : 0;

    const welcomeEventData = (function() {
        let curPageInfo;

        function getListenerList(_memNo, pageInfo) {
            let data = {
                memNo: _memNo,
                tDate: '',
                stepNo: 0,
                pageNo: pageInfo.pageNo,
                pagePerCnt: pageInfo.pageCnt
            };
            let apiURL = '/rest/content/event/welcome/listeners';
            util.getAjaxData("getListenerList", apiURL, data, function (id, response, params) {
                renderTotalList('listener', response, pageInfo);
            }, null, {type: 'GET'});
        }

        function getListenerStepList(_memNo, pageInfo) {
            let data = {
                memNo: _memNo,
                tDate: year + '-' + month + '-01',
                stepNo: welcomeSectionNo,
                pageNo: pageInfo.pageNo,
                pagePerCnt: pageInfo.pageCnt
            };
            let apiURL = '/rest/content/event/welcome/listeners';
            util.getAjaxData("getListenerStepList", apiURL, data, function (id, response, params) {
                if (welcomeSectionNo === 4) {
                    renderAllClearList('listener', response, pageInfo);
                    return;
                }
                renderStepList('listener', response, pageInfo);
            }, null, {type: 'GET'});
        }

        function getDjList(_memNo, pageInfo) {
            let data = {
                memNo: _memNo,
                tDate: '',
                stepNo: 0,
                pageNo: pageInfo.pageNo,
                pagePerCnt: pageInfo.pageCnt
            };
            let apiURL = '/rest/content/event/welcome/dj';
            util.getAjaxData("getDjList", apiURL, data, function (id, response, params) {
                renderTotalList('dj', response, pageInfo);
            }, null, {type: 'GET'});
        }

        function getDjStepList(_memNo, pageInfo) {
            let data = {
                memNo: _memNo,
                tDate: year + '-' + month + '-01',
                stepNo: welcomeSectionNo,
                pageNo: pageInfo.pageNo,
                pagePerCnt: pageInfo.pageCnt
            };
            let apiURL = '/rest/content/event/welcome/dj';
            util.getAjaxData("getDjStepList", apiURL, data, function (id, response, params) {
                if (welcomeSectionNo === 4) {
                    renderAllClearList('dj', response, pageInfo);
                    return;
                }
                renderStepList('dj', response, pageInfo);
            }, null, {type: 'GET'});
        }

        // 전체목록데이터 처리
        function renderTotalList(id, response, pageInfo) {
            let template, templateScript, context, html;
            template = $('#tmp_total_list').html();
            templateScript = Handlebars.compile(template);
            context = response.listData.map(function (item, index) {
                item.index_no = response.totalCnt - (((pageInfo.pageNo - 1) * pageInfo.pageCnt) + index);
                return item;
            });
            html = templateScript(context);
            $("#tableArea").html(html);

            pageInfo.totalCnt = response.totalCnt;
            util.renderPagingNavigation('total_paginate_top', pageInfo);
            util.renderPagingNavigation('total_paginate_bottom', pageInfo);

            if (response.listData.length === 0) {
                $("#total_paginate_top").hide();
                $('#total_paginate_bottom').hide();
            } else {
                $("#total_paginate_top").show();
                $('#total_paginate_bottom').show();
            }
        }

        // 단계목록데이터 처리
        function renderStepList(id, response, pageInfo) {
            let template, templateScript, context, html;

            template = $('#tmp_status').html();
            templateScript = Handlebars.compile(template);
            context = response.sectionList;
            html = templateScript(context);
            $("#statusArea").html(html);

            template = $('#tmp_step_list').html();
            templateScript = Handlebars.compile(template);
            context = response.listData.map(function (item, index) {
                item.slctType = id;
                item.index_no = response.totalCnt - (((pageInfo.pageNo - 1) * pageInfo.pageCnt) + index);
                return item;
            });
            context.slctType = id;
            context.stepNo = welcomeSectionNo;
            html = templateScript(context);
            $("#tableArea").html(html);

            pageInfo.totalCnt = response.totalCnt;
            util.renderPagingNavigation('step_paginate_top', pageInfo);
            util.renderPagingNavigation('step_paginate_bottom', pageInfo);

            if (response.listData.length === 0) {
                $("#step_paginate_top").hide();
                $('#step_paginate_bottom').hide();
            } else {
                $("#step_paginate_top").show();
                $('#step_paginate_bottom').show();
            }
        }

        // 올클목록데이터 처리
        function renderAllClearList(id, response, pageInfo) {
            let template, templateScript, context, html;
            template = $('#tmp_clear_list').html();
            templateScript = Handlebars.compile(template);
            context = response.listData.map(function (item, index) {
                item.slctType = id;
                item.index_no = response.totalCnt - (((pageInfo.pageNo - 1) * pageInfo.pageCnt) + index);
                return item;
            });
            context.slctType = id;
            html = templateScript(context);
            $("#tableArea").html(html);

            pageInfo.totalCnt = response.totalCnt;
            util.renderPagingNavigation('clear_paginate_top', pageInfo);
            util.renderPagingNavigation('clear_paginate_bottom', pageInfo);

            if (response.listData.length === 0) {
                $("#clear_paginate_top").hide();
                $('#clear_paginate_bottom').hide();
            } else {
                $("#clear_paginate_top").show();
                $('#clear_paginate_bottom').show();
            }
        }

        function callList(pageInfo) {
            let memNo = document.getElementById('searchText').value;
            memNo = memNo ? parseInt(memNo, 10) : 0;

            $('#statusArea').empty();
            $("#tableArea").empty();

            curPageInfo = pageInfo;
            switch (welcomeSlctType) {
                case 0 :
                    if (welcomeSectionNo > 0) {
                        getListenerStepList(memNo, curPageInfo);
                    } else {
                        getListenerList(memNo, curPageInfo);
                    }
                    break;
                case 1 :
                    if (welcomeSectionNo > 0) {
                        getDjStepList(memNo, curPageInfo);
                    } else {
                        getDjList(memNo, curPageInfo);
                    }
                    break;
            }
        }

        function reqGift() {
            let $checkbox = $('.gift-checkbox');
            let giftSlct = welcomeSlctType === 0 ? 2 : welcomeSlctType;
            let list = [];
            $checkbox.map(function (index, item) {
                let $item = $(item);
                if (item.checked) {
                    list.push({
                        index: index,
                        memNo: $item.data('memno'),
                        giftSlct: giftSlct,
                        giftCode: $item.data('code'),
                        giftName: $item.data('name'),
                        stepNo: welcomeSectionNo,
                    });
                }
            });

            if (list.length === 0) {
                alert('선물지급을 선택하지 않으셨거나\n지급대상 항목이 없습니다.');
                return;
            }

            let data = { list: list };
            let apiURL = '/rest/content/event/welcome/gift';
            util.getAjaxData("reqGift", apiURL, JSON.stringify(data), function (id, response, params) {
                list.map(function(item) {
                    $('.gift-td').eq(item.index).empty();
                    $('.gift-td').eq(item.index).text('O');
                });
            }, null, {type: 'POST', contentType: 'application/json; charset=UTF-8'});
        }

        return {
            callList: callList,
            reqGift: reqGift
        }
    }());

    // 페이징 이벤트
    function handlebarsPaging(targetId, pagingInfo) {
        welcomeEventData.callList(pagingInfo);
    }

    $(function() {
        let welcomePagingInfo = new PAGING_INFO(0, 1, 50);

        slctType = 1;
        setDayButton();
        welcomeEventData.callList(welcomePagingInfo);

        $('#bt_search').on('click', function () {
            welcomePagingInfo.pageNo = 1;
            welcomeEventData.callList(welcomePagingInfo);
        });

        $('#giftSend').on('click', function () {
            welcomeEventData.reqGift();
        });

        // 최상위 탭 이벤트
        $('#slct_tabContainer li a').on('click', function() {
            const $this = $(this);
            welcomeSlctType = parseInt($this.data('slct_type'), 10);
            welcomeSectionNo = 0;

            $('#section_tabContainer li a').eq(welcomeSectionNo).click();
        });

        $('#section_tabContainer li a').on('click', function() {
            const $this = $(this);
            welcomeSectionNo = parseInt($this.data('section_no'), 10);

            $('.btn-giftSend').removeClass('hidden')
            if (welcomeSectionNo === 0) {
                $('.btn-giftSend').addClass('hidden')
            }

            welcomePagingInfo.pageNo = 1;
            welcomeEventData.callList(welcomePagingInfo);
        });
    });
</script>

<script type="text/x-handlebars-template" id="tmp_total_list">
    <div class="dataTables_paginate paging_full_numbers" id="total_paginate_top"></div>
    <table id="total_table" class="table table-sorting table-hover table-bordered">
        <colgroup>
            <col width="3%"/>
            <col width="auto"/>
            <col width="auto"/>
            <col width="auto"/>
            <col width="auto"/>
            <col width="auto"/>
            <col width="auto"/>
        </colgroup>
        <thead>
        <tr>
            <th>No.</th>
            <th>회원번호</th>
            <th>연락처</th>
            <th>닉네임</th>
            <th>1단계 선물</th>
            <th>2단계 선물</th>
            <th>3단계 선물</th>
        </tr>
        </thead>
        <tbody id="total_table_body">
        {{#each this as |data|}}
        <tr>
            <td>{{index_no}}</td>
            <td>{{{memNoLink mem_no mem_no}}}</td>
            <td>{{phoneNumHyphen mem_phone}}</td>
            <td>{{mem_nick}}</td>
            <td>
                {{#dalbit_if step_1_req_yn '==' 'y'}} {{step_1_gift_name}} {{/dalbit_if}}
                {{#dalbit_if step_1_req_yn '==' 'n'}} X {{/dalbit_if}}
            </td>
            <td>
                {{#dalbit_if step_2_req_yn '==' 'y'}} {{step_2_gift_name}} {{/dalbit_if}}
                {{#dalbit_if step_2_req_yn '==' 'n'}} X {{/dalbit_if}}
            </td>
            <td>
                {{#dalbit_if step_3_req_yn '==' 'y'}} {{step_3_gift_name}} {{/dalbit_if}}
                {{#dalbit_if step_3_req_yn '==' 'n'}} X {{/dalbit_if}}
            </td>
        </tr>
        {{else}}
        <tr>
            <td colspan="7">{{isEmptyData}}</td>
        </tr>
        {{/each}}
        </tbody>
    </table>
    <div class="dataTables_paginate paging_full_numbers" id="total_paginate_bottom"></div>
</script>

<script type="text/x-handlebars-template" id="tmp_status">
    <table id="status_table" class="table table-sorting table-hover table-bordered">
        <tbody id="status_table_body">
        <tr>
            {{#each this as |data|}}
            <td>
                {{#dalbit_if cnt '>' 0}}
                    {{gift_name}} : {{cnt}}명
                {{/dalbit_if}}
                {{#dalbit_if cnt '==' 0}}
                    선물종류정보가 없습니다.
                {{/dalbit_if}}
            </td>
            {{/each}}
        </tr>
        </tbody>
    </table>
</script>

<script type="text/x-handlebars-template" id="tmp_step_list">
    <div class="dataTables_paginate paging_full_numbers" id="step_paginate_top"></div>
    <table id="step_table" class="table table-sorting table-hover table-bordered">
        <colgroup>
            <col width="3%"/>
            <col width="auto"/>
            <col width="auto"/>
            <col width="auto"/>
            <col width="auto"/>
            <col width="auto"/>
            <col width="auto"/>
        </colgroup>
        <thead>
        <tr>
            <th>No.</th>
            <th>회원번호</th>
            <th>연락처</th>
            <th>닉네임</th>
            <th>
                {{stepNo}}단계 선물
            </th>
            <th>접속조건 충족여부</th>
            <th>선물지급여부</th>
        </tr>
        </thead>
        <tbody id="step_table_body">
        {{#each this as |data|}}
        <tr>
            <td>{{index_no}}</td>
            <td>{{{memNoLink mem_no mem_no}}}</td>
            <td>{{phoneNumHyphen mem_phone}}</td>
            <td>{{mem_nick}}</td>
            <td>
                {{#dalbit_if slctType '==' 'listener'}} {{mem_gift_name}} {{/dalbit_if}}
                {{#dalbit_if slctType '==' 'dj'}} {{dj_gift_name}} {{/dalbit_if}}
            </td>
            <td>
                {{#dalbit_if step_con_yn '==' 'y'}} O {{/dalbit_if}}
                {{#dalbit_if step_con_yn '==' 'n'}} X {{/dalbit_if}}
            </td>
            <td class="gift-td">
                {{#dalbit_if slctType '==' 'listener'}}
                {{#dalbit_if mem_gift_rcv_yn '==' 'y'}} O {{/dalbit_if}}
                {{#dalbit_if mem_gift_rcv_yn '==' 'n'}}
                <input type="checkbox" class="gift-checkbox" data-memno="{{mem_no}}" data-code="{{mem_gift_code}}" data-name="{{mem_gift_name}}">
                {{/dalbit_if}}
                {{/dalbit_if}}
                {{#dalbit_if slctType '==' 'dj'}}
                {{#dalbit_if dj_gift_rcv_yn '==' 'y'}} O {{/dalbit_if}}
                {{#dalbit_if dj_gift_rcv_yn '==' 'n'}}
                <input type="checkbox" class="gift-checkbox" data-memno="{{mem_no}}" data-code="{{dj_gift_code}}" data-name="{{dj_gift_name}}">
                {{/dalbit_if}}
                {{/dalbit_if}}
            </td>
        </tr>
        {{else}}
        <tr>
            <td colspan="7">{{isEmptyData}}</td>
        </tr>
        {{/each}}
        </tbody>
    </table>
    <div class="dataTables_paginate paging_full_numbers" id="step_paginate_bottom"></div>
</script>

<script type="text/x-handlebars-template" id="tmp_clear_list">
    <div class="dataTables_paginate paging_full_numbers" id="clear_paginate_top"></div>
    <table id="clear_table" class="table table-sorting table-hover table-bordered">
        <colgroup>
            <col width="3%"/>
            <col width="auto"/>
            <col width="auto"/>
            <col width="auto"/>
            <col width="auto"/>
            <col width="auto"/>
            <col width="auto"/>
        </colgroup>
        <thead>
        <tr>
            <th>No.</th>
            <th>회원번호</th>
            <th>연락처</th>
            <th>닉네임</th>
            <th>
                {{#dalbit_if slctType '==' 'listener'}} 총구매달 {{/dalbit_if}}
                {{#dalbit_if slctType '==' 'dj'}} 총받은달 {{/dalbit_if}}
            </th>
            <th>접속조건 충족여부</th>
            <th>선물지급여부</th>
        </tr>
        </thead>
        <tbody id="clear_table_body">
        {{#each this as |data|}}
        <tr>
            <td>{{index_no}}</td>
            <td>{{{memNoLink mem_no mem_no}}}</td>
            <td>{{phoneNumHyphen mem_phone}}</td>
            <td>{{mem_nick}}</td>
            <td>
                {{#dalbit_if slctType '==' 'listener'}} {{addComma tot_pay_dal_cnt}}달 {{/dalbit_if}}
                {{#dalbit_if slctType '==' 'dj'}} {{addComma tot_rcv_dal_cnt}}달 {{/dalbit_if}}
            </td>
            <td>
                {{#dalbit_if step_con_yn '==' 'y'}} O {{/dalbit_if}}
                {{#dalbit_if step_con_yn '==' 'n'}} X {{/dalbit_if}}
            </td>
            <td class="gift-td">
                {{#dalbit_if slctType '==' 'listener'}}
                    {{#dalbit_if mem_gift_rcv_yn '==' 'y'}} O {{/dalbit_if}}
                    {{#dalbit_if mem_gift_rcv_yn '==' 'n'}}
                <input type="checkbox" class="gift-checkbox" data-memno="{{mem_no}}" data-code="{{mem_gift_code}}" data-name="{{mem_gift_name}}">
                    {{/dalbit_if}}
                {{/dalbit_if}}
                {{#dalbit_if slctType '==' 'dj'}}
                    {{#dalbit_if dj_gift_rcv_yn '==' 'y'}} O {{/dalbit_if}}
                    {{#dalbit_if dj_gift_rcv_yn '==' 'n'}}
                <input type="checkbox" class="gift-checkbox" data-memno="{{mem_no}}" data-code="{{dj_gift_code}}" data-name="{{dj_gift_name}}">
                    {{/dalbit_if}}
                {{/dalbit_if}}
            </td>
        </tr>
        {{else}}
        <tr>
            <td colspan="7">{{isEmptyData}}</td>
        </tr>
        {{/each}}
        </tbody>
    </table>
    <div class="dataTables_paginate paging_full_numbers" id="clear_paginate_bottom"></div>
</script>
