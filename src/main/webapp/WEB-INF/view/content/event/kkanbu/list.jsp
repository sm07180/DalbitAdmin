<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dummyData" value="<%= java.lang.Math.round(java.lang.Math.random() * 1000000) %>"/>

<div id="condition5">
    <div class="col-lg-12">
        <div class="widget widget-table">
            <form id="searchForm">
                <div class="widget widget-table searchBoxArea" style="margin-bottom: 0">
                    <table>
                        <tr>
                            <th rowspan="2" style="background-color:#4472c4;color:#e9ee17;width: 70px">
                                <i class="fa fa-search"></i><br/>검색
                            </th>
                        </tr>
                        <tr>
                            <td style="text-align: left">
                                <label><input type="text" class="form-control" name="searchMemNoText" id="searchMemNoText"
                                              placeholder="회원번호 검색"></label>
                                <button type="button" class="btn btn-success" id="bt_search">검색</button>
                            </td>
                        </tr>
                    </table>
                </div>
            </form>
        </div>
        <div class="clearfix widget-content mt5 mb5">
            <h4 class="font-bold">깐부게임 이벤트</h4>

            <div id="kkanbu_tabContainer" class="mb15">
                <ul class="nav nav-tabs nav-tabs-custom-colored" id="kkanbu_tablist">
                    <li class="active"><a href="#detail_event" role="tab" data-toggle="tab" data-slct_type="1" aria-expanded="false" class="_tab">게임현황</a></li>
                    <li><a href="#detail_event" role="tab" data-toggle="tab" data-slct_type="2" aria-expanded="false" class="_tab">깐부신청현황</a></li>
                </ul>
            </div>

            <div id="section_tabContainer" class="mb15">
                <ul class="nav nav-tabs nav-tabs-custom-colored" id="section_tablist">
                    <li class="active"><a href="#detail_event" role="tab" data-toggle="tab" data-section_no="1" aria-expanded="false" class="_tab">1회차</a></li>
                    <li><a href="#detail_event" role="tab" data-toggle="tab" data-section_no="2" aria-expanded="false" class="_tab">2회차</a></li>
                    <li><a href="#detail_event" role="tab" data-toggle="tab" data-section_no="3" aria-expanded="false" class="_tab">3회차</a></li>
                    <li><a href="#detail_event" role="tab" data-toggle="tab" data-section_no="4" aria-expanded="false" class="_tab">4회차</a></li>
                </ul>
            </div>

            <div id="episodeArea" class="mb15"></div>

            <div id="result_tabContainer" class="mb15">
                <ul class="nav nav-tabs nav-tabs-custom-colored" id="result_tablist">
                    <li class="active"><a href="#detail_event" role="tab" data-toggle="tab" data-result_no="1" aria-expanded="false" class="_tab">순위</a></li>
                    <li><a href="#detail_event" role="tab" data-toggle="tab" data-result_no="2" aria-expanded="false" class="_tab">배팅</a></li>
                    <li><a href="#detail_event" role="tab" data-toggle="tab" data-result_no="3" aria-expanded="false" class="_tab">구슬주머니</a></li>
                </ul>
            </div>

            <div id="marble_tabContainer" class="mb15">
                <ul class="nav nav-tabs nav-tabs-custom-colored" id="marble_tablist">
                    <li class="active"><a href="#detail_event" role="tab" data-toggle="tab" data-marble_section_no="1" aria-expanded="false" class="_tab">얻은 곳</a></li>
                    <li><a href="#detail_event" role="tab" data-toggle="tab" data-marble_section_no="2" aria-expanded="false" class="_tab">얻은 점수</a></li>
                </ul>
            </div>

            <div id="statusArea"></div>
            <div id="tableArea"></div>
        </div>
    </div>
</div>
<script type="text/javascript" src="/js/code/content/contentCodeList.js?${dummyData}"></script>
<script type="text/javascript">
    const kkanbuTerm = {
        1: ['2021-12-14', '2021-12-20', '2021-12-21'],
        2: ['2021-12-21', '2021-12-27', '2021-12-28'],
        3: ['2021-12-28', '2022-01-03', '2022-01-04'],
        4: ['2022-01-04', '2022-01-10', '2022-01-11'],
    };

    const reqStateCode = {
        'w': '대기',
        'r': '수락',
        'c': '신청취소',
        'i': '자동취소',
    };

    const poketStateCode = {
        'e': '구슬교환',
        'u': '1만개 사용누적',
        's': '1만개 선물 누적',
    };

    let kkanbuSlctType = 1; // 1: 게임현황, 2: 깐부신청현황
    let kkanbuSectionNo = 1; // 1: 1회차, 2: 2회차, 3: 3회차, 4: 4회차
    let kkanbuResultNo = 1; // 1: 순위, 2: 배팅, 3: 구슬주머니
    let kkanbuMarbleSectionNo = 1; // 1: 얻은곳, 2: 얻은점수

    const kkanbuEventData = (function() {
        function getRankList(memNo, sectionNo, pageInfo) {
            let data = {
                kkanbuNo: sectionNo,
                memNo: memNo,
                pageNo: pageInfo.pageNo,
                pagePerCnt: pageInfo.pageCnt
            };
            let apiURL = '/rest/content/event/kkanbu/rankList';
            util.getAjaxData("getKkanbuRankList", apiURL, data, function (id, response, params) {
                let template, templateScript, context, html;
                template = $('#tmp_rank_list').html();
                templateScript = Handlebars.compile(template);
                context = response.listData.map(function (item, index) {
                    item.rank_no = ((pageInfo.pageNo - 1) * pageInfo.pageCnt) + index + 1;
                    return item;
                });
                html = templateScript(context);
                $("#tableArea").html(html);

                pageInfo.totalCnt = response.totalCnt;
                util.renderPagingNavigation('rank_paginate_top', pageInfo);
                util.renderPagingNavigation('rank_paginate_bottom', pageInfo);

                if (response.listData.length === 0) {
                    $("#rank_paginate_top").hide();
                    $('#rank_paginate_bottom').hide();
                } else {
                    $("#rank_paginate_top").show();
                    $('#rank_paginate_bottom').show();
                }
            }, null, {type: 'GET'});
        }

        function getBetList(memNo, sectionNo, pageInfo) {
            let data = {
                kkanbuNo: sectionNo,
                memNo: memNo,
                pageNo: pageInfo.pageNo,
                pagePerCnt: pageInfo.pageCnt
            };
            let apiURL = '/rest/content/event/kkanbu/betList';
            util.getAjaxData("getKkanbuBetList", apiURL, data, function (id, response, params) {
                let template, templateScript, context, html;

                template = $('#tmp_betting_status').html();
                templateScript = Handlebars.compile(template);
                context = response.sectonData;
                html = templateScript(context);
                $("#statusArea").html(html);

                template = $('#tmp_bet_list').html();
                templateScript = Handlebars.compile(template);
                context = response.listData.map(function (item, index) {
                    item.rank_no = ((pageInfo.pageNo - 1) * pageInfo.pageCnt) + index + 1;
                    item.win_ko = (item.win_slct === 'w') ? '승' : '패';
                    item.bet_ko = (item.betting_slct === 'a') ? '홀' : '짝';
                    return item;
                });
                html = templateScript(context);
                $("#tableArea").html(html);

                pageInfo.totalCnt = response.totalCnt;
                util.renderPagingNavigation('bet_paginate_top', pageInfo);
                util.renderPagingNavigation('bet_paginate_bottom', pageInfo);

                if (response.listData.length === 0) {
                    $("#bet_paginate_top").hide();
                    $('#bet_paginate_bottom').hide();
                } else {
                    $("#bet_paginate_top").show();
                    $('#bet_paginate_bottom').show();
                }
            }, null, {type: 'GET'});
        }

        function getMarbleList(memNo, sectionNo, pageInfo) {
            let data = {
                kkanbuNo: sectionNo,
                memNo: memNo,
                pageNo: pageInfo.pageNo,
                pagePerCnt: pageInfo.pageCnt
            };
            let apiURL = '/rest/content/event/kkanbu/marbleList';
            util.getAjaxData("getKkanbuMarbleList", apiURL, data, function (id, response, params) {
                let template, templateScript, context, html;
                template = $('#tmp_marble_list').html();
                templateScript = Handlebars.compile(template);
                context = response.listData.map(function (item, index) {
                    item.rank_no = ((pageInfo.pageNo - 1) * pageInfo.pageCnt) + index + 1;
                    item.ins_state = poketStateCode[item.ins_slct];
                    return item;
                });
                html = templateScript(context);
                $("#tableArea").html(html);

                pageInfo.totalCnt = response.totalCnt;
                util.renderPagingNavigation('marble_paginate_top', pageInfo);
                util.renderPagingNavigation('marble_paginate_bottom', pageInfo);

                if (response.listData.length === 0) {
                    $("#marble_paginate_top").hide();
                    $('#marble_paginate_bottom').hide();
                } else {
                    $("#marble_paginate_top").show();
                    $('#marble_paginate_bottom').show();
                }
            }, null, {type: 'GET'});
        }

        function getMarblePointList(memNo, sectionNo, pageInfo) {
            let data = {
                kkanbuNo: sectionNo,
                memNo: memNo,
                pageNo: pageInfo.pageNo,
                pagePerCnt: pageInfo.pageCnt
            };
            let apiURL = '/rest/content/event/kkanbu/marblePointList';
            util.getAjaxData("getKkanbuMarbleList", apiURL, data, function (id, response, params) {
                let template, templateScript, context, html;

                template = $('#tmp_marble_status').html();
                templateScript = Handlebars.compile(template);
                context = response.sectonData;
                html = templateScript(context);
                $("#statusArea").html(html);

                template = $('#tmp_marble_pt_list').html();
                templateScript = Handlebars.compile(template);
                context = response.listData.map(function (item, index) {
                    item.rank_no = ((pageInfo.pageNo - 1) * pageInfo.pageCnt) + index + 1;
                    return item;
                });
                html = templateScript(context);
                $("#tableArea").html(html);

                pageInfo.totalCnt = response.totalCnt;
                util.renderPagingNavigation('marble_pt_paginate_top', pageInfo);
                util.renderPagingNavigation('marble_pt_paginate_bottom', pageInfo);

                if (response.listData.length === 0) {
                    $("#marble_pt_paginate_top").hide();
                    $('#marble_pt_paginate_bottom').hide();
                } else {
                    $("#marble_pt_paginate_top").show();
                    $('#marble_pt_paginate_bottom').show();
                }
            }, null, {type: 'GET'});
        }

        function getKkanbuList(memNo, sectionNo, pageInfo) {
            let data = {
                kkanbuNo: sectionNo,
                memNo: memNo,
                pageNo: pageInfo.pageNo,
                pagePerCnt: pageInfo.pageCnt
            };
            let apiURL = '/rest/content/event/kkanbu/list';
            util.getAjaxData("getKkanbuList", apiURL, data, function (id, response, params) {
                let template, templateScript, context, html;

                template = $('#tmp_req_list').html();
                templateScript = Handlebars.compile(template);
                context = response.listData.map(function (item, index) {
                    item.rank_no = ((pageInfo.pageNo - 1) * pageInfo.pageCnt) + index + 1;
                    item.req_state = reqStateCode[item.req_slct];
                    return item;
                });
                html = templateScript(context);
                $("#tableArea").html(html);

                pageInfo.totalCnt = response.totalCnt;
                util.renderPagingNavigation('req_paginate_top', pageInfo);
                util.renderPagingNavigation('req_paginate_bottom', pageInfo);

                if (response.listData.length === 0) {
                    $("#req_paginate_top").hide();
                    $('#req_paginate_bottom').hide();
                } else {
                    $("#req_paginate_top").show();
                    $('#req_paginate_bottom').show();
                }
            }, null, {type: 'GET'});
        }

        function callList(memNo, pageInfo) {
            $('#episodeArea').html('진행기간: ' + kkanbuTerm[kkanbuSectionNo][0] + ' ~ ' + kkanbuTerm[kkanbuSectionNo][1] + ', 발표: ' + kkanbuTerm[kkanbuSectionNo][2]);
            $('#statusArea').empty();
            $("#tableArea").empty();
            switch(kkanbuSlctType) {
                case 1:
                    switch(kkanbuResultNo) {
                        case 1:
                            getRankList(memNo, kkanbuSectionNo, pageInfo);
                            break;
                        case 2:
                            getBetList(memNo, kkanbuSectionNo, pageInfo);
                            break;
                        case 3:
                            switch(kkanbuMarbleSectionNo) {
                                case 1:
                                    getMarbleList(memNo, kkanbuSectionNo, pageInfo);
                                    break;
                                case 2:
                                    getMarblePointList(memNo, kkanbuSectionNo, pageInfo);
                                    break;
                            }
                            break;
                    }
                    break;
                case 2:
                    getKkanbuList(memNo, kkanbuSectionNo, pageInfo);
                    break;
            }
        }

        return {
            callList: callList
        }
    }());

    function handlebarsPaging(targetId, pagingInfo) {
        let memNo = document.getElementById('searchMemNoText').value;
        memNo = memNo ? parseInt(memNo, 10) : 0;

        kkanbuEventData.callList(memNo, pagingInfo);
    }

    $(document).ready(function() {
        let kkanbuPagingInfo = new PAGING_INFO(0, 1, 50);
        let memNo = document.getElementById('searchMemNoText').value;
        memNo = memNo ? parseInt(memNo, 10) : 0;

        // 회원번호 검색
        $("#bt_search").on('click', function () {
            let memNo = document.getElementById('searchMemNoText').value;
            memNo = memNo ? parseInt(memNo, 10) : 0;

            kkanbuPagingInfo.pageNo = 1;
            kkanbuEventData.callList(memNo, kkanbuPagingInfo);
        });

        // 한번만 실행
        $('#marble_tabContainer').removeClass('hidden');
        if (kkanbuResultNo !== 3) {
            $('#marble_tabContainer').addClass('hidden');
        }
        kkanbuEventData.callList(memNo, kkanbuPagingInfo);

        // 최상위 탭 이벤트
        $('#kkanbu_tablist li a').on('click', function() {
            let memNo = document.getElementById('searchMemNoText').value;
            memNo = memNo ? parseInt(memNo, 10) : 0;

            const $this = $(this);
            kkanbuSlctType = parseInt($this.data('slct_type'), 10);
            kkanbuSectionNo = 1;

            $('#result_tabContainer').removeClass('hidden');
            if (kkanbuSlctType !== 1) {
                kkanbuResultNo = 1;
                $('#result_tabContainer').addClass('hidden');
            }

            $('#section_tablist li').removeClass('active');
            $('#section_tablist li').eq(kkanbuSectionNo-1).addClass('active');

            $('#result_tablist li').removeClass('active');
            $('#result_tablist li').eq(kkanbuResultNo-1).addClass('active');

            $('#marble_tabContainer').removeClass('hidden');
            if (kkanbuResultNo !== 3) {
                $('#marble_tabContainer').addClass('hidden');
            }

            // 페이지 초기화
            kkanbuPagingInfo.pageNo = 1;
            kkanbuEventData.callList(memNo, kkanbuPagingInfo);
        });

        // 회차 탭 이벤트
        $('#section_tablist li a').on('click', function() {
            let memNo = document.getElementById('searchMemNoText').value;
            memNo = memNo ? parseInt(memNo, 10) : 0;

            const $this = $(this);
            kkanbuSlctType = (kkanbuSlctType < 0) ? 1 : kkanbuSlctType;
            kkanbuSectionNo = parseInt($this.data('section_no'), 10);
            kkanbuResultNo = 1;

            $('#result_tablist li').removeClass('active');
            $('#result_tablist li').eq(kkanbuResultNo-1).addClass('active');

            $('#marble_tabContainer').removeClass('hidden');
            if (kkanbuResultNo !== 3) {
                $('#marble_tabContainer').addClass('hidden');
            }

            // 페이지 초기화
            kkanbuPagingInfo.pageNo = 1;
            kkanbuEventData.callList(memNo, kkanbuPagingInfo);
        });

        // 순위/배팅/구슬주머니 탭 이벤트
        $('#result_tablist li a').on('click', function() {
            let memNo = document.getElementById('searchMemNoText').value;
            memNo = memNo ? parseInt(memNo, 10) : 0;

            const $this = $(this);
            kkanbuSlctType = (kkanbuSlctType < 0) ? 1 : kkanbuSlctType;
            kkanbuResultNo = parseInt($this.data('result_no'), 10);
            kkanbuMarbleSectionNo = 1;

            $('#marble_tabContainer').removeClass('hidden');
            if (kkanbuResultNo !== 3) {
                $('#marble_tabContainer').addClass('hidden');
            }

            $('#marble_tabContainer li').removeClass('active');
            $('#marble_tabContainer li').eq(kkanbuMarbleSectionNo-1).addClass('active');

            // 페이지 초기화
            kkanbuPagingInfo.pageNo = 1;
            kkanbuEventData.callList(memNo, kkanbuPagingInfo);
        });

        // 구슬 얻은곳/얻은점수
        $('#marble_tabContainer li a').on('click', function() {
            let memNo = document.getElementById('searchMemNoText').value;
            memNo = memNo ? parseInt(memNo, 10) : 0;

            const $this = $(this);
            kkanbuSlctType = (kkanbuSlctType < 0) ? 1 : kkanbuSlctType;
            kkanbuMarbleSectionNo = parseInt($this.data('marble_section_no'), 10);

            kkanbuEventData.callList(memNo, kkanbuPagingInfo);
        });
    });
</script>

<%-- 배팅상태 --%>
<script type="text/x-handlebars-template" id="tmp_betting_status">
    <table id="betting_table_status" class="table table-sorting table-hover table-bordered">
        <colgroup>
            <col width="20%"/>
            <col width="20%"/>
            <col width="20%"/>
            <col width="20%"/>
            <col width="20%"/>
        </colgroup>
        <tbody id="betting_status">
        <tr>
            <td>총 베팅: {{tot_betting_cnt}}회</td>
            <td>홀수 베팅: {{add_betting_cnt}}회</td>
            <td>짝수 베팅: {{even_betting_cnt}}회</td>
            <td>홀수 나온 횟수: {{add_cnt}}회</td>
            <td>짝수 나온 횟수: {{even_cnt}}회</td>
        </tr>
        </tbody>
    </table>
</script>

<%-- 구슬주머니현황 (얻은점수) --%>
<script type="text/x-handlebars-template" id="tmp_marble_status">
    <table id="marble_table_status" class="table table-sorting table-hover table-bordered">
        <tbody id="marble_status">
        <tr>
            <td>총 횟수: {{tot_pt_cnt}}회</td>
            <td>10점: {{pt_10_cnt}}회</td>
            <td>20점: {{pt_20_cnt}}회</td>
            <td>30점: {{pt_30_cnt}}회</td>
            <td>40점: {{pt_40_cnt}}회</td>
            <td>50점: {{pt_50_cnt}}회</td>
            <td>60점: {{pt_60_cnt}}회</td>
            <td>70점: {{pt_70_cnt}}회</td>
            <td>80점: {{pt_80_cnt}}회</td>
            <td>90점: {{pt_90_cnt}}회</td>
            <td>100점: {{pt_100_cnt}}회</td>
        </tr>
        </tbody>
    </table>
</script>

<script type="text/x-handlebars-template" id="tmp_rank_list">
    <div class="dataTables_paginate paging_full_numbers" id="rank_paginate_top"></div>
    <table id="rank_table" class="table table-sorting table-hover table-bordered">
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
            <th>순위</th>
            <th>회원번호</th>
            <th>닉네임</th>
            <th>연락처</th>
            <th>평균레밸</th>
            <th>구슬현황</th>
            <th>점수</th>
            <th>회차 내 청취시간</th>
            <th>회차 내 방송시간</th>
            <th>회차 내 결제금액</th>
            <th>회차 내 달 교환</th>
        </tr>
        </thead>
        <tbody id="rank_table_body">
        {{#each this as |data|}}
        <tr>
            <td rowspan="2">{{rank_no}}</td>
            <td>{{{memNoLink mem_no mem_no}}}</td>
            <td>{{mem_nick}}</td>
            <td>{{phoneNumHyphen mem_phone}}</td>
            <td rowspan="2" style="border-left-width: thin;">{{avg mem_level ptr_mem_level}}</td>
            <td rowspan="2">
                <img src="//image.dalbitlive.com/event/gganbu/marble-red.png" width="15"> {{red_marble}}
                <img src="//image.dalbitlive.com/event/gganbu/marble-yellow.png" width="15"> {{yellow_marble}}
                <img src="//image.dalbitlive.com/event/gganbu/marble-blue.png" width="15"> {{blue_marble}}
                <img src="//image.dalbitlive.com/event/gganbu/marble-purple.png" width="15"> {{violet_marble}}
            </td>
            <td rowspan="2">{{addComma marble_pocket_pt}}</td>
            <td rowspan="2">{{timeStampDay tot_bj_view_time}}</td>
            <td rowspan="2">{{timeStampDay tot_mem_view_time}}</td>
            <td rowspan="2">{{addComma tot_mem_pay_amt}}</td>
            <td rowspan="2">{{addComma tot_mem_exc_cnt}}</td>
        </tr>
        <tr>
            <td>{{{memNoLink ptr_mem_no ptr_mem_no}}}</td>
            <td>{{ptr_mem_nick}}</td>
            <td>{{phoneNumHyphen ptr_mem_phone}}</td>
        </tr>
        {{else}}
        <tr>
            <td colspan="11">{{isEmptyData}}</td>
        </tr>
        {{/each}}
        </tbody>
    </table>
    <div class="dataTables_paginate paging_full_numbers" id="rank_paginate_bottom"></div>
</script>

<script type="text/x-handlebars-template" id="tmp_bet_list">
    <div class="dataTables_paginate paging_full_numbers" id="bet_paginate_top"></div>
    <table id="bet_table" class="table table-sorting table-hover table-bordered">
        <colgroup>
            <col width="5%"/>
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
            <th>닉네임</th>
            <th>참여자</th>
            <th>배팅한 구슬</th>
            <th>홀짝</th>
            <th>성공여부</th>
            <th>배팅 후 구슬</th>
            <th>참여일시</th>
        </tr>
        </thead>
        <tbody id="bet_table_body">
        {{#each this as |data|}}
        <tr>
            <td rowspan="2">{{rank_no}}</td>
            <td>{{{memNoLink mem_no mem_no}}}</td>
            <td>{{mem_nick}}</td>
            <td rowspan="2" style="border-left-width: thin;">{{mem_nick}}</td>
            <td rowspan="2">
                <img src="//image.dalbitlive.com/event/gganbu/marble-red.png" width="15"> {{red_marble}}
                <img src="//image.dalbitlive.com/event/gganbu/marble-yellow.png" width="15"> {{yellow_marble}}
                <img src="//image.dalbitlive.com/event/gganbu/marble-blue.png" width="15"> {{blue_marble}}
                <img src="//image.dalbitlive.com/event/gganbu/marble-purple.png" width="15"> {{violet_marble}}
            </td>
            <td rowspan="2">{{bet_ko}}</td>
            <td rowspan="2">{{win_ko}}</td>
            <td rowspan="2">
                <img src="//image.dalbitlive.com/event/gganbu/marble-red.png" width="15"> {{rest_red_marble}}
                <img src="//image.dalbitlive.com/event/gganbu/marble-yellow.png" width="15"> {{rest_yellow_marble}}
                <img src="//image.dalbitlive.com/event/gganbu/marble-blue.png" width="15"> {{rest_blue_marble}}
                <img src="//image.dalbitlive.com/event/gganbu/marble-purple.png" width="15"> {{rest_violet_marble}}
            </td>
            <td rowspan="2">{{ins_date}}</td>
        </tr>
        <tr>
            <td>{{{memNoLink ptr_mem_no ptr_mem_no}}}</td>
            <td>{{ptr_mem_nick}}</td>
        </tr>
        {{else}}
        <tr>
            <td colspan="9">{{isEmptyData}}</td>
        </tr>
        {{/each}}
        </tbody>
    </table>
    <div class="dataTables_paginate paging_full_numbers" id="bet_paginate_bottom"></div>
</script>

<script type="text/x-handlebars-template" id="tmp_marble_list">
    <div class="dataTables_paginate paging_full_numbers" id="marble_paginate_top"></div>
    <table id="marble_table" class="table table-sorting table-hover table-bordered">
        <colgroup>
            <col width="5%"/>
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
            <th>닉네임</th>
            <th>구분</th>
            <th>구슬주머니 보유개수</th>
            <th>받은일시</th>
        </tr>
        </thead>
        <tbody id="marble_table_body">
        {{#each this as |data|}}
        <tr>
            <td>{{rank_no}}</td>
            <td>{{{memNoLink mem_no mem_no}}}</td>
            <td>{{mem_nick}}</td>
            <td>{{ins_state}}</td>
            <td>{{rest_marble_pocket_cnt}}개</td>
            <td>{{ins_date}}</td>
        </tr>
        {{else}}
        <tr>
            <td colspan="6">{{isEmptyData}}</td>
        </tr>
        {{/each}}
        </tbody>
    </table>
    <div class="dataTables_paginate paging_full_numbers" id="marble_paginate_bottom"></div>
</script>

<script type="text/x-handlebars-template" id="tmp_marble_pt_list">
    <div class="dataTables_paginate paging_full_numbers" id="marble_pt_paginate_top"></div>
    <table id="marble_pt_table" class="table table-sorting table-hover table-bordered">
        <colgroup>
            <col width="5%"/>
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
            <th>닉네임</th>
            <th>얻은 점수</th>
            <th>내 구슬 주머니 점수</th>
            <th>받은일시</th>
        </tr>
        </thead>
        <tbody id="marble_pt_table_body">
        {{#each this as |data|}}
        <tr>
            <td>{{rank_no}}</td>
            <td>{{{memNoLink mem_no mem_no}}}</td>
            <td>{{mem_nick}}</td>
            <td>{{marble_pocket_pt}}</td>
            <td>{{tot_marble_pocket_pt}}</td>
            <td>{{ins_date}}</td>
        </tr>
        {{else}}
        <tr>
            <td colspan="6">{{isEmptyData}}</td>
        </tr>
        {{/each}}
        </tbody>
    </table>
    <div class="dataTables_paginate paging_full_numbers" id="marble_pt_paginate_bottom"></div>
</script>

<script type="text/x-handlebars-template" id="tmp_req_list">
    <div class="dataTables_paginate paging_full_numbers" id="req_paginate_top"></div>
    <table id="req_table" class="table table-sorting table-hover table-bordered">
        <colgroup>
            <col width="5%"/>
            <col width="auto"/>
            <col width="auto"/>
            <col width="auto"/>
            <col width="auto"/>
            <col width="auto"/>
        </colgroup>
        <thead>
        <tr>
            <th>No.</th>
            <th>보낸 회원번호</th>
            <th>보낸 닉네임</th>
            <th>받은 회원번호</th>
            <th>받은 닉네임</th>
            <th>상태</th>
            <th>신청일시</th>
            <th>취소일시</th>
        </tr>
        </thead>
        <tbody id="req_table_body">
        {{#each this as |data|}}
        <tr>
            <td>{{rank_no}}</td>
            <td>{{{memNoLink mem_no mem_no}}}</td>
            <td>{{mem_nick}}</td>
            <td>{{{memNoLink ptr_mem_no ptr_mem_no}}}</td>
            <td>{{ptr_mem_nick}}</td>
            <td>{{req_state}}</td>
            <td>{{req_date}}</td>
            <td>{{cancel_date}}</td>
        </tr>
        {{else}}
        <tr>
            <td colspan="8">{{isEmptyData}}</td>
        </tr>
        {{/each}}
        </tbody>
    </table>
    <div class="dataTables_paginate paging_full_numbers" id="req_paginate_bottom"></div>
</script>
