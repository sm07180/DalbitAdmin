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
                        <!-- li><a href="#detail_event" role="tab" data-toggle="tab" data-slct_type="2" aria-expanded="false" class="_tab">관리</a></li -->
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

                <div id="gift_admin_tabContainer" class="mb15 hidden">
                    <ul class="nav nav-tabs nav-tabs-custom-colored" id="gift_admin_tablist">
                        <li class="active"><a href="#detail_event" role="tab" data-toggle="tab" data-gift_admin_no="0" aria-expanded="false" class="_tab">청취자</a></li>
                        <li><a href="#detail_event" role="tab" data-toggle="tab" data-gift_admin_no="1" aria-expanded="false" class="_tab">DJ</a></li>
                    </ul>
                </div>

                <div id="gift_admin_goal_tabContainer" class="mb15 hidden">
                    <ul class="nav nav-tabs nav-tabs-custom-colored" id="gift_admin_goal_tablist">
                        <li class="active"><a href="#detail_event" role="tab" data-toggle="tab" data-gift_admin_goal_no="1" aria-expanded="false" class="_tab">1단계</a></li>
                        <li><a href="#detail_event" role="tab" data-toggle="tab" data-gift_admin_goal_no="2" aria-expanded="false" class="_tab">2단계</a></li>
                        <li><a href="#detail_event" role="tab" data-toggle="tab" data-gift_admin_goal_no="3" aria-expanded="false" class="_tab">3단계</a></li>
                    </ul>
                    <div id="gift_admin_goal_conts" class="mt15"></div>
                </div>

                <div id="gift_admin_section_tabContainer" class="mb15 hidden">
                    <ul class="nav nav-tabs nav-tabs-custom-colored" id="gift_admin_section_tablist">
                        <li class="active"><a href="#detail_event" role="tab" data-toggle="tab" data-gift_admin_section_no="1" aria-expanded="false" class="_tab">1단계</a></li>
                        <li><a href="#detail_event" role="tab" data-toggle="tab" data-gift_admin_section_no="2" aria-expanded="false" class="_tab">2단계</a></li>
                        <li><a href="#detail_event" role="tab" data-toggle="tab" data-gift_admin_section_no="3" aria-expanded="false" class="_tab">3단계</a></li>
                        <li><a href="#detail_event" role="tab" data-toggle="tab" data-gift_admin_section_no="4" aria-expanded="false" class="_tab">ALL CLEAR</a></li>
                    </ul>
                    <div id="gift_admin_section_conts" class="mt15"></div>
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
    let welcomeGiftAdmin = 0;   // 0: 청취자, 1: DJ - 선물관리
    let welcomeGiftAdminGoalNo = 1;     // 1: 1단계, 2: 2단계, 3: 3단계 - 선물관리 (목표)
    let welcomeGiftAdminSectionNo = 1;  // 1: 1단계, 2: 2단계, 3: 3단계, 4: ALL - 선물관리 (선물)
    let memNo = document.getElementById('searchText').value;
    memNo = memNo ? parseInt(memNo, 10) : 0;

    // 조건 기본 데이터
    let goalList = [
        { qualifyNo: 0, theMonth: '', qualifyName: '방송시청', qualifyGubun: 1, qualifyVal: 0, qualifyStepNo: 1, qualifySlct: 2, insDate: '', updDate: '', chrgrName: '' },
        { qualifyNo: 0, theMonth: '', qualifyName: '좋아요', qualifyGubun: 2, qualifyVal: 0, qualifyStepNo: 1, qualifySlct: 2, insDate: '', updDate: '', chrgrName: '' },
        { qualifyNo: 0, theMonth: '', qualifyName: '달충전', qualifyGubun: 3, qualifyVal: 0, qualifyStepNo: 1, qualifySlct: 2, insDate: '', updDate: '', chrgrName: '' },
    ];
    let tempGoalList;

    // 경품데이터
    let giftList = [
        { giftCode: '', giftName: '', giftCont: '', giftDalCnt: 0, giftCnt: 0, giftStepNo: 1, giftOrd: 1, giftSlct: 2, useYn: "y", modifyYn: "n", totInsCnt: 1, theMonth: '', insDate: '', updDate: '', chrgrName: ''},
        { giftCode: '', giftName: '', giftCont: '', giftDalCnt: 0, giftCnt: 0, giftStepNo: 1, giftOrd: 2, giftSlct: 2, useYn: "y", modifyYn: "n", totInsCnt: 1, theMonth: '', insDate: '', updDate: '', chrgrName: ''},
        { giftCode: '', giftName: '', giftCont: '', giftDalCnt: 0, giftCnt: 0, giftStepNo: 1, giftOrd: 3, giftSlct: 2, useYn: "y", modifyYn: "n", totInsCnt: 1, theMonth: '', insDate: '', updDate: '', chrgrName: ''}
    ];
    let tempGiftList;

    const welcomeEventData = (function() {
        let curPageInfo;

        function getListenerList(_memNo, pageInfo) {
            let data = {
                memNo: _memNo,
                tDate: year + '-' + month + '-01',
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
                tDate: year + '-' + month + '-01',
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
                $('#clear_paginate_top').hide();
                $('#clear_paginate_bottom').hide();
            } else {
                $('#clear_paginate_top').show();
                $('#clear_paginate_bottom').show();
            }
        }

        // 상품목표 출력
        function renderGiftAdminGoalList(id, data) {
            let template, templateScript, context, html;
            template = $('#tmp_gift_admin_goal_conts').html();
            templateScript = Handlebars.compile(template);
            context = data;
            html = templateScript(context);
            $('#gift_admin_goal_conts').html(html);

            // 목표 저장하기 클릭
            $('#modifyGiftGoal').off().on('click', reqGiftGoal)
        }

        // 상품목록 출력
        function renderGiftAdminList(id, data) {
            let template, templateScript, context, html;
            template = $('#tmp_gift_admin_section_conts').html();
            templateScript = Handlebars.compile(template);
            context = data;
            html = templateScript(context);
            $('#gift_admin_section_conts').html(html);

            // 상품 저장하기 클릭
            $('#modifyGiftAdmin').off().on('click', reqGiftAdmin)
        }

        // 상품 목표 설정 목록
        function getGiftAdminGoalList() {
            tempGoalList = JSON.parse(JSON.stringify(goalList));
            let data = {
                tDate: year + '-' + month + '-01',
                qualifySlct: welcomeGiftAdmin === 0 ? 2 : welcomeGiftAdmin,
                stepNo: welcomeGiftAdminGoalNo,
            };
            let apiURL = '/rest/content/event/welcome/gift-admin-goals';
            util.getAjaxData("getGiftAdminGoalList", apiURL, data, function (id, response, params) {
                for ( const indexGoal in tempGoalList ) {
                    if (response.listData.length === 0) {
                        tempGoalList[indexGoal].theMonth = data.tDate;
                        tempGoalList[indexGoal].qualifyStepNo = data.stepNo;
                        tempGoalList[indexGoal].qualifySlct = data.qualifySlct;
                        continue;
                    }
                    for ( const indexRes in response.listData ) {
                        if ( tempGoalList[indexGoal].qualifyGubun === response.listData[indexRes].qualify_gubun ) {
                            tempGoalList[indexGoal].qualifyNo = response.listData[indexRes].auto_no || tempGoalList[indexGoal].qualifyNo;
                            tempGoalList[indexGoal].theMonth = response.listData[indexRes].the_month || data.tDate;
                            tempGoalList[indexGoal].qualifyName = response.listData[indexRes].qualify_name || tempGoalList[indexGoal].qualifyName;
                            tempGoalList[indexGoal].qualifyGubun = response.listData[indexRes].qualify_gubun || tempGoalList[indexGoal].qualifyGubun;
                            tempGoalList[indexGoal].qualifyVal = response.listData[indexRes].qualify_val || tempGoalList[indexGoal].qualifyVal;
                            tempGoalList[indexGoal].qualifyStepNo = response.listData[indexRes].qualify_step_no || data.stepNo;
                            tempGoalList[indexGoal].qualifySlct = response.listData[indexRes].qualify_slct || data.qualifySlct;
                            tempGoalList[indexGoal].insDate = response.listData[indexRes].ins_date || tempGoalList[indexGoal].insDate;
                            tempGoalList[indexGoal].updDate = response.listData[indexRes].upd_date || tempGoalList[indexGoal].updDate;
                            tempGoalList[indexGoal].chrgrName = response.listData[indexRes].chrgr_name || tempGoalList[indexGoal].chrgrName;
                        }
                    }
                }
                renderGiftAdminGoalList(id, tempGoalList);
            }, null, {type: 'GET'});
        }

        // 상품 설정 목록
        function getGiftAdminSectionList() {
            tempGiftList = JSON.parse(JSON.stringify(giftList));
            let data = {
                tDate: year + '-' + month + '-01',
                giftSlct: welcomeGiftAdmin === 0 ? 2 : welcomeGiftAdmin,
                stepNo: welcomeGiftAdminSectionNo,
            };
            let apiURL = '/rest/content/event/welcome/gift-admin-sections';
            util.getAjaxData("getGiftAdminSectionList", apiURL, data, function (id, response, params) {
                for ( const indexGift in tempGiftList ) {
                    if (response.listData.length === 0) {
                        tempGiftList[indexGift].theMonth = data.tDate;
                        tempGiftList[indexGift].giftStepNo = data.stepNo;
                        tempGiftList[indexGift].giftSlct = data.giftSlct;
                        continue;
                    }
                    if (data.stepNo === 4 && indexGift > 0) {
                        delete tempGiftList[indexGift];
                        continue;
                    }

                    for ( const indexRes in response.listData ) {
                        if ( tempGiftList[indexGift].giftOrd === response.listData[indexRes].gift_ord ) {
                            tempGiftList[indexGift].giftCode = response.listData[indexRes].gift_code || tempGiftList[indexGift].giftCode;
                            tempGiftList[indexGift].giftName = response.listData[indexRes].gift_name || tempGiftList[indexGift].giftName;
                            tempGiftList[indexGift].giftCont = response.listData[indexRes].gift_cont || tempGiftList[indexGift].giftCont;
                            tempGiftList[indexGift].giftDalCnt = response.listData[indexRes].gift_dal_cnt || tempGiftList[indexGift].giftDalCnt;
                            tempGiftList[indexGift].theMonth = response.listData[indexRes].the_month || data.tDate;
                            tempGiftList[indexGift].giftSlct = response.listData[indexRes].gift_slct || data.giftSlct;
                            tempGiftList[indexGift].giftStepNo = response.listData[indexRes].gift_step_no || data.stepNo;
                            tempGiftList[indexGift].totInsCnt = response.listData[indexRes].tot_ins_cnt || tempGiftList[indexGift].totInsCnt;
                            tempGiftList[indexGift].useYn = response.listData[indexRes].use_yn || tempGiftList[indexGift].useYn;
                            tempGiftList[indexGift].insDate = response.listData[indexRes].ins_date || tempGiftList[indexGift].insDate;
                            tempGiftList[indexGift].updDate = response.listData[indexRes].upd_date || tempGiftList[indexGift].updDate;
                            tempGiftList[indexGift].chrgrName = response.listData[indexRes].chrgr_name || tempGiftList[indexGift].chrgrName;
                            tempGiftList[indexGift].modifyYn = 'y';
                        }
                    }
                }
                renderGiftAdminList(id, tempGiftList);
            }, null, {type: 'GET'});
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

        function callGift() {
            getGiftAdminGoalList();
            getGiftAdminSectionList();
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

        function reqGiftGoal() {
            let reqGiftGoal = [];
            for ( index in tempGoalList ) {
                if (tempGoalList[index].qualifyGubun && tempGoalList[index].qualifyName && tempGoalList[index].theMonth) {
                    reqGiftGoal.push(tempGoalList[index]);
                }
            }
            if (reqGiftGoal.length < 1) {
                alert('입력하신 미션 정보를 확인해주세요.');
                return;
            }

            let inputVals = $('#formGiftGoal input[name="qualifyVal"]');
            inputVals.map((index, item) => {
                reqGiftGoal[index].qualifyVal = parseInt(item.value, 10) || 0;
            });

            let data = { list: reqGiftGoal };
            let apiURL = '/rest/content/event/welcome/gift-admin-goals';
            util.getAjaxData("reqGiftGoal", apiURL, JSON.stringify(data), function (id, response, params) {
            }, null, {type: 'POST', contentType: 'application/json; charset=UTF-8'});
        }

        function reqGiftAdmin() {
            let reqGiftAdmin = [];

            // 입력폼
            let inputRows = $('#formGiftAdmin .giftAdminRows');
            inputRows.map((index, item) => {
                let giftCode = $(item).find('input[name="giftCode"]').val();
                let giftName = $(item).find('input[name="giftName"]').val();
                let giftCont = $(item).find('input[name="giftCont"]').val();
                let giftDalCnt = $(item).find('input[name="giftDalCnt"]').val();

                tempGiftList[index].giftCode = giftCode || '';
                tempGiftList[index].giftName = giftName || '';
                tempGiftList[index].giftCont = giftCont || '';
                tempGiftList[index].giftDalCnt = parseInt(giftDalCnt, 10) || 0;
            });

            // 기본 입력 데이터
            for ( index in tempGiftList ) {
                if (tempGiftList[index].giftCode && tempGiftList[index].giftName && tempGiftList[index].giftCont && tempGiftList[index].theMonth) {
                    reqGiftAdmin.push(tempGiftList[index]);
                }
            }
            if (reqGiftAdmin.length < 1) {
                alert('입력하신 상품 정보를 확인해주세요.');
                return;
            }
            let data = { list: reqGiftAdmin };
            let apiURL = '/rest/content/event/welcome/gift-admin-sections';
            util.getAjaxData("reqGiftAdmin", apiURL, JSON.stringify(data), function (id, response, params) {
                let msg = '총 ' + response.applyCnt + '건의 데이터를 갱신하였습니다.';
                if (reqGiftAdmin.length > response.applyCnt) {
                    msg += '\n중복되는 상품코드가 존재합니다.';
                }
                alert(msg);
            }, null, {type: 'POST', contentType: 'application/json; charset=UTF-8'});
        }

        return {
            callList: callList,
            callGift: callGift,
            reqGift: reqGift,
            reqGiftGoal: reqGiftGoal,
            reqGiftAdmin: reqGiftAdmin,
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
            if (welcomeSlctType === 2) { // 관리탭 클릭
                $('#statusArea').empty();
                $("#tableArea").empty();

                welcomeGiftAdmin = 0;
                welcomeEventData.callGift();
                return;
            }
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

            $('#section_tabContainer').addClass('hidden');
            $('#gift_admin_tabContainer').addClass('hidden');
            $('#gift_admin_goal_tabContainer').addClass('hidden');
            $('#gift_admin_section_tabContainer').addClass('hidden');

            if (welcomeSlctType === 2) { // 관리탭 클릭
                $('#statusArea').empty();
                $("#tableArea").empty();

                welcomeGiftAdmin = 0;

                $('#gift_admin_tabContainer').removeClass('hidden');
                $('#gift_admin_goal_tabContainer').removeClass('hidden');
                $('#gift_admin_section_tabContainer').removeClass('hidden');

                $('#gift_admin_tabContainer li a').eq(welcomeGiftAdmin).click();
            } else {
                welcomeSectionNo = 0;
                $('#section_tabContainer').removeClass('hidden');
                $('#section_tabContainer li a').eq(welcomeSectionNo).click();
            }
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

        $('#gift_admin_tabContainer li a').on('click', function() {
            const $this = $(this);
            welcomeGiftAdmin = parseInt($this.data('gift_admin_no'), 10);

            welcomeGiftAdminGoalNo = 1;
            welcomeGiftAdminSectionNo = 1;
            $('#gift_admin_goal_tabContainer li a').eq(welcomeGiftAdminGoalNo - 1).click();
            $('#gift_admin_section_tabContainer li a').eq(welcomeGiftAdminSectionNo - 1).click();
        });

        $('#gift_admin_goal_tabContainer li a').on('click', function() {
            const $this = $(this);
            welcomeGiftAdminGoalNo = parseInt($this.data('gift_admin_goal_no'), 10);

            $('#gift_admin_section_tabContainer li a').eq(welcomeGiftAdminSectionNo - 1).click();
        });

        $('#gift_admin_section_tabContainer li a').on('click', function() {
            const $this = $(this);
            welcomeGiftAdminSectionNo = parseInt($this.data('gift_admin_section_no'), 10);

            welcomeEventData.callGift();
        });
    });
</script>

<script type="text/x-handlebars-template" id="tmp_gift_admin_goal_conts">
    <form name="formGiftGoal" id="formGiftGoal">
        <table class="table table-sorting table-hover table-bordered mb0" style="width: 900px">
            <colgroup>
                <col width="auto"/>
                <col width="100px"/>
                <col width="150px"/>
                <col width="90px"/>
            </colgroup>
            <thead>
            <tr>
                <th>구분</th>
                <th>목표값</th>
                <th>수정일</th>
                <th>수정자</th>
            </tr>
            </thead>
            <tbody>
            {{#each this as |data|}}
            <tr>
                <td>{{qualifyName}}</td>
                <td class="text-left">
                    <div class="form-inline">
                        <input type="text" name="qualifyVal" class="form-control" style="width: 60px" value="{{qualifyVal}}">
                        {{#dalbit_if qualifyGubun '==' 1}} 시간 {{/dalbit_if}}
                        {{#dalbit_if qualifyGubun '==' 2}} 회 {{/dalbit_if}}
                        {{#dalbit_if qualifyGubun '==' 3}} 달 {{/dalbit_if}}
                    </div>
                </td>
                <td>
                    {{#dalbit_if updDate '==' ''}} - {{/dalbit_if}}
                    {{#dalbit_if updDate '!=' ''}} {{updDate}} {{/dalbit_if}}
                </td>
                <td>
                    {{#dalbit_if chrgrName '==' ''}} - {{/dalbit_if}}
                    {{#dalbit_if chrgrName '!=' ''}} {{chrgrName}} {{/dalbit_if}}
                </td>
            </tr>
            {{else}}
            <tr>
                <td colspan="4">{{isEmptyData}}</td>
            </tr>
            {{/each}}
            </tbody>
        </table>
    </form>
    <div class="mt5 mb15">
        <button type="button" id="modifyGiftGoal" class="btn btn-custom-secondary">적용하기</button>
    </div>
</script>

<script type="text/x-handlebars-template" id="tmp_gift_admin_section_conts">
    <form name="formGiftAdmin" id="formGiftAdmin">
        <table class="table table-sorting table-hover table-bordered mb0" style="width: 900px">
            <colgroup>
                <col width="auto"/>
                <col width="auto"/>
                <col width="auto"/>
                <col width="100px"/>
                <col width="150px"/>
                <col width="90px"/>
            </colgroup>
            <thead>
            <tr>
                <th>상품코드</th>
                <th>상품명</th>
                <th>상품내용</th>
                <th>달지급</th>
                <th>수정일</th>
                <th>수정자</th>
            </tr>
            </thead>
            <tbody>
            {{#each this as |data|}}
            <tr class="giftAdminRows">
                <td>
                    <input type="text" name="giftCode" class="form-control" value="{{giftCode}}">
                </td>
                <td>
                    <input type="text" name="giftName" class="form-control" value="{{giftName}}">
                </td>
                <td>
                    <input type="text" name="giftCont" class="form-control" value="{{giftCont}}">
                </td>
                <td class="text-left">
                    <div class="form-inline">
                        <input type="text" name="giftDalCnt" class="form-control" style="width: 60px" value="{{giftDalCnt}}">
                        건
                    </div>
                </td>
                <td>
                    {{#dalbit_if updDate '==' ''}} - {{/dalbit_if}}
                    {{#dalbit_if updDate '!=' ''}} {{updDate}} {{/dalbit_if}}
                </td>
                <td>
                    {{#dalbit_if chrgrName '==' ''}} - {{/dalbit_if}}
                    {{#dalbit_if chrgrName '!=' ''}} {{chrgrName}} {{/dalbit_if}}
                </td>
            </tr>
            {{else}}
            <tr>
                <td colspan="6">{{isEmptyData}}</td>
            </tr>
            {{/each}}
            </tbody>
        </table>
    </form>
    <div class="mt5 mb15">
        <button type="button" id="modifyGiftAdmin" class="btn btn-custom-secondary">적용하기</button>
    </div>
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
            <th>가입일자</th>
            <th>1단계 선물</th>
            <th>1단계 수령일자</th>
            <th>2단계 선물</th>
            <th>2단계 수령일자</th>
            <th>3단계 선물</th>
            <th>3단계 수령일자</th>
        </tr>
        </thead>
        <tbody id="total_table_body">
        {{#each this as |data|}}
        <tr>
            <td>{{index_no}}</td>
            <td>{{{memNoLink mem_no mem_no}}}</td>
            <td>{{phoneNumHyphen mem_phone}}</td>
            <td>{{mem_nick}}</td>
            <td>{{mem_join_date}}</td>
            <td>
                {{#dalbit_if step_1_req_yn '==' 'y'}} {{step_1_gift_name}} {{/dalbit_if}}
                {{#dalbit_if step_1_req_yn '==' 'n'}} X {{/dalbit_if}}
            </td>
            <td>
                {{#dalbit_if step_1_gift_req_date '!=' ''}} {{step_1_gift_req_date}} {{/dalbit_if}}
                {{#dalbit_if step_1_gift_req_date '==' ''}} - {{/dalbit_if}}
            </td>
            <td>
                {{#dalbit_if step_2_req_yn '==' 'y'}} {{step_2_gift_name}} {{/dalbit_if}}
                {{#dalbit_if step_2_req_yn '==' 'n'}} X {{/dalbit_if}}
            </td>
            <td>
                {{#dalbit_if step_2_gift_req_date '!=' ''}} {{step_2_gift_req_date}} {{/dalbit_if}}
                {{#dalbit_if step_2_gift_req_date '==' ''}} - {{/dalbit_if}}
            </td>
            <td>
                {{#dalbit_if step_3_req_yn '==' 'y'}} {{step_3_gift_name}} {{/dalbit_if}}
                {{#dalbit_if step_3_req_yn '==' 'n'}} X {{/dalbit_if}}
            </td>
            <td>
                {{#dalbit_if step_3_gift_req_date '!=' ''}} {{step_3_gift_req_date}} {{/dalbit_if}}
                {{#dalbit_if step_3_gift_req_date '==' ''}} - {{/dalbit_if}}
            </td>
        </tr>
        {{else}}
        <tr>
            <td colspan="11">{{isEmptyData}}</td>
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
            <col width="auto"/>
        </colgroup>
        <thead>
        <tr>
            <th>No.</th>
            <th>회원번호</th>
            <th>연락처</th>
            <th>닉네임</th>
            <th>가입일자</th>
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
            <td>{{mem_join_date}}</td>
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
            <td colspan="8">{{isEmptyData}}</td>
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
