<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dummyData"><%= java.lang.Math.round(java.lang.Math.random() * 1000000) %></c:set>

<div class="col-lg-12 no-padding">
    <div id="section_tabContainer" class="mb15">
        <ul class="nav nav-tabs nav-tabs-custom-colored" id="section_tablist">
            <li class="active"><a href="#detail_event" role="tab" data-toggle="tab" data-section_no="1" aria-expanded="false" class="_tab">1회차</a></li>
            <li><a href="#detail_event" role="tab" data-toggle="tab" data-section_no="2" aria-expanded="false" class="_tab">2회차</a></li>
            <li><a href="#detail_event" role="tab" data-toggle="tab" data-section_no="3" aria-expanded="false" class="_tab">3회차</a></li>
            <li><a href="#detail_event" role="tab" data-toggle="tab" data-section_no="4" aria-expanded="false" class="_tab">4회차</a></li>
        </ul>
    </div>
    <div id="kkanbu_container" class="mb15 clearfix"></div>
    <div id="mable_container" class="mb15 clearfix"></div>
    <div id="marble_tabContainer" class="mb15 clearfix">
        <ul class="nav nav-tabs nav-tabs-custom-colored" id="marble_tablist">
            <li class="active"><a href="#detail_event" role="tab" data-toggle="tab" data-marble_section_no="1" aria-expanded="false" class="_tab">얻은 구슬 내역</a></li>
            <li><a href="#detail_event" role="tab" data-toggle="tab" data-marble_section_no="2" aria-expanded="false" class="_tab">구슬 주머니 얻은 내역</a></li>
        </ul>
    </div>
    <div id="tableArea"></div>
</div>
<script src="/js/dataTablesSource/status/levelDataTableSource.js?${dummyData}"></script>
<script src="../../../js/lib/jquery.table2excel.js"></script>
<script type="text/javascript" src="/js/code/content/contentCodeList.js?${dummyData}"></script>
<script type="text/javascript" src="/js/code/member/memberCodeList.js?${dummyData}"></script>

<script type="text/javascript">
    let setMemNo = 0;
    let kkanbuSectionNo = 1; // 1: 1회차, 2: 2회차, 3: 3회차, 4: 4회차
    let kkanbuMarbleSectionNo = 1; // 1: 얻은 구슬 내역, 2: 구슬 주머니 얻은 내역
    let kkanbuPagingInfo = new PAGING_INFO(0, 1, 50);

    const mInsStateCode = {
        'r': '방송',
        'v': '청취',
        'c': '달충전',
        'e': '교환',
        'b': '배팅',
    };

    const pInsStateCode = {
        'e': '구슬교환',
        'u': '1만개 사용누적',
        's': '1만개 선물 누적',
    };

    const kkanbuEventData = (function() {
        function getMarbleList(memNo, sectionNo, pageInfo) {
            let tabSlct = (kkanbuMarbleSectionNo === 1) ? 'm' : 'p';
            let data = {
                kkanbuNo: sectionNo,
                memNo: memNo,
                tabSlct: tabSlct,
                pageNo: pageInfo.pageNo,
                pagePerCnt: pageInfo.pageCnt
            };
            let apiURL = '/rest/content/event/kkanbu/memSel';
            util.getAjaxData("getKkanbuMemSel", apiURL, data, function (id, response, params) {
                let template, templateScript, context, html;

                // tmp_kkanbu_table - kkanbu_container
                template = $('#tmp_kkanbu_table').html();
                templateScript = Handlebars.compile(template);
                context = response.memData;
                html = templateScript(context);
                $("#kkanbu_container").html(html);

                // tmp_mable_table - mable_container
                template = $('#tmp_mable_table').html();
                templateScript = Handlebars.compile(template);
                context = response.sectionData;
                html = templateScript(context);
                $("#mable_container").html(html);

                pageInfo.totalCnt = response.totalCnt;
                if (tabSlct === 'm') {
                    template = $('#tmp_marble_list').html();
                    templateScript = Handlebars.compile(template);
                    context = response.listData.map(function (item, index) {
                        item.rank_no = ((pageInfo.pageNo - 1) * pageInfo.pageCnt) + index + 1;
                        item.ins_state = mInsStateCode[item.ins_slct];
                        return item;
                    });
                    html = templateScript(context);
                    $("#tableArea").html(html);

                    util.renderPagingNavigation('marble_paginate_top', pageInfo);
                    util.renderPagingNavigation('marble_paginate_bottom', pageInfo);
                    if (response.listData.length === 0) {
                        $("#marble_paginate_top").hide();
                        $('#marble_paginate_bottom').hide();
                    } else {
                        $("#marble_paginate_top").show();
                        $('#marble_paginate_bottom').show();
                    }
                }
                if (tabSlct === 'p') {
                    template = $('#tmp_marble_pt_list').html();
                    templateScript = Handlebars.compile(template);
                    context = response.listData.map(function (item, index) {
                        item.rank_no = ((pageInfo.pageNo - 1) * pageInfo.pageCnt) + index + 1;
                        item.ins_state = pInsStateCode[item.ins_slct];
                        return item;
                    });
                    html = templateScript(context);
                    $("#tableArea").html(html);

                    util.renderPagingNavigation('marble_pt_paginate_top', pageInfo);
                    util.renderPagingNavigation('marble_pt_paginate_bottom', pageInfo);
                    if (response.listData.length === 0) {
                        $("#marble_pt_paginate_top").hide();
                        $('#marble_pt_paginate_bottom').hide();
                    } else {
                        $("#marble_pt_paginate_top").show();
                        $('#marble_pt_paginate_bottom').show();
                    }
                }
            }, null, {type: 'GET'});
        }

        function callList(memNo, pageInfo) {
            $('#kkanbu_container').empty();
            $('#mable_container').empty();
            $("#tableArea").empty();
            getMarbleList(memNo, kkanbuSectionNo, pageInfo);
        }

        return {
            callList: callList
        }
    }());

    function getHistory_kkanbuList(tmp) {
        setMemNo = memNo;
        kkanbuEventData.callList(setMemNo, kkanbuPagingInfo)
    }

    $(document).ready(function() {
        // 회차 탭 이벤트
        $('#section_tablist li a').on('click', function() {
            const $this = $(this);
            kkanbuSectionNo = parseInt($this.data('section_no'), 10);
            kkanbuMarbleSectionNo = 1;

            $('#marble_tablist li').removeClass('active');
            $('#marble_tablist li').eq(kkanbuMarbleSectionNo-1).addClass('active');

            // 페이지 초기화
            kkanbuPagingInfo.pageNo = 1;
            kkanbuEventData.callList(memNo, kkanbuPagingInfo);
        });

        // 구슬 탭 이벤트
        $('#marble_tablist li a').on('click', function() {
            const $this = $(this);
            kkanbuMarbleSectionNo = parseInt($this.data('marble_section_no'), 10);

            // 페이지 초기화
            kkanbuPagingInfo.pageNo = 1;
            kkanbuEventData.callList(memNo, kkanbuPagingInfo);
        });
    });
</script>

<script type="text/x-handlebars-template" id="tmp_kkanbu_table">
    <table id="kkanbu_table_status" class="table table-sorting table-hover table-bordered" style="width:50%; float: right">
        <colgroup>
            <col width="auto"/>
            <col width="auto"/>
            <col width="auto"/>
        </colgroup>
        <thead>
        <tr>
            <th colspan="3">깐부</th>
        </tr>
        <tr>
            <th>회원번호</th>
            <th>닉네임</th>
            <th>평균레벨</th>
        </tr>
        </thead>
        <tbody id="kkanbu_status">
        <tr>
            <td>{{{memNoLink ptr_mem_no ptr_mem_no}}}</td>
            <td>{{ptr_mem_nick}}</td>
            <td>{{avg mem_level ptr_mem_level}}</td>
        </tr>
        </tbody>
    </table>
</script>

<script type="text/x-handlebars-template" id="tmp_mable_table">
    <table id="mable_table_status" class="table table-sorting table-hover table-bordered">
        <colgroup>
            <col width="auto"/>
            <col width="auto"/>
            <col width="auto"/>
            <col width="auto"/>
            <col width="auto"/>
            <col width="auto"/>
        </colgroup>
        <thead>
        <tr>
            <th colspan="6">4개 항목에 대한 구슬</th>
        </tr>
        <tr>
            <th>회차 내 청취 시간</th>
            <th>회차 내 방송 시간</th>
            <th>회차 내 결제금액</th>
            <th>회차 내 달 교환</th>
            <th>총 얻은 구슬</th>
            <th>구슬 총 개수</th>
        </tr>
        </thead>
        <tbody id="mable_status">
        <tr>
            <td>{{timeStampDay tot_mem_view_time}}</td>
            <td>{{timeStampDay tot_bj_view_time}}</td>
            <td>{{addComma tot_mem_pay_amt}}</td>
            <td>{{addComma tot_mem_exc_cnt}}</td>
            <td>
                <img src="//image.dalbitlive.com/event/gganbu/marble-red.png" width="15"> {{tot_red_marble}}
                <img src="//image.dalbitlive.com/event/gganbu/marble-yellow.png" width="15"> {{tot_yellow_marble}}
                <img src="//image.dalbitlive.com/event/gganbu/marble-blue.png" width="15"> {{tot_blue_marble}}
                <img src="//image.dalbitlive.com/event/gganbu/marble-purple.png" width="15"> {{tot_violet_marble}}
            </td>
            <td>{{addComma tot_marble_cnt}}</td>
        </tr>
        </tbody>
    </table>
</script>

<script type="text/x-handlebars-template" id="tmp_marble_list">
    <div class="dataTables_paginate paging_full_numbers" id="marble_paginate_top"></div>
    <table id="marble_table" class="table table-sorting table-hover table-bordered">
        <colgroup>
            <col width="5%"/>
            <col width="auto"/>
            <col width="auto"/>
            <col width="auto"/>
        </colgroup>
        <thead>
        <tr>
            <th>No.</th>
            <th>구분</th>
            <th>얻은구슬</th>
            <th>받은일시</th>
        </tr>
        </thead>
        <tbody id="marble_table_body">
        {{#each this as |data|}}
        <tr>
            <td>{{rank_no}}</td>
            <td>{{ins_state}}</td>
            <td>
                <img src="//image.dalbitlive.com/event/gganbu/marble-red.png" width="15"> {{red_marble}}
                <img src="//image.dalbitlive.com/event/gganbu/marble-yellow.png" width="15"> {{yellow_marble}}
                <img src="//image.dalbitlive.com/event/gganbu/marble-blue.png" width="15"> {{blue_marble}}
                <img src="//image.dalbitlive.com/event/gganbu/marble-purple.png" width="15"> {{violet_marble}}
            </td>
            <td>{{ins_date}}</td>
        </tr>
        {{else}}
        <tr>
            <td colspan="4">{{isEmptyData}}</td>
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
        </colgroup>
        <thead>
        <tr>
            <th>No.</th>
            <th>구분</th>
            <th>받은일시</th>
        </tr>
        </thead>
        <tbody id="marble_pt_table_body">
        {{#each this as |data|}}
        <tr>
            <td>{{rank_no}}</td>
            <td>{{ins_state}}</td>
            <td>{{ins_date}}</td>
        </tr>
        {{else}}
        <tr>
            <td colspan="3">{{isEmptyData}}</td>
        </tr>
        {{/each}}
        </tbody>
    </table>
    <div class="dataTables_paginate paging_full_numbers" id="marble_pt_paginate_bottom"></div>
</script>