<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dummyData" value="<%= java.lang.Math.round(java.lang.Math.random() * 1000000) %>"/>

<form id="condition5">
    <div class="col-lg-12 form-inline mt15 mb15">
        <div class="widget widget-table">
            <%--            <div class="widget-header">--%>
            <%--                <h3>11월 경품 이벤트</h3>--%>
            <%--            </div>--%>
            <form id="searchForm">
                <div class="row col-lg-12 form-inline">
                    <div class="widget widget-table searchBoxArea">
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
                </div>
            </form>
            <div class="widget-content mt10">
                <div id="fanDj_tabContainer" class="mb15">
                    <ul class="nav nav-tabs nav-tabs-custom-colored" id="fanDj_tablist">
                        <li class="active"><a href="#detail_event" role="tab" data-toggle="tab"
                                              data-slct_type="1" aria-expanded="false" class="_tab">청취자</a></li>
                        <li><a href="#detail_event" role="tab" data-toggle="tab" id="twoDepth_tab_fan"
                               data-slct_type="2" aria-expanded="false" class="_tab">DJ</a></li>
                    </ul>
                </div>

                <div id="section_tabContainer" class="mb15">
                    <ul class="nav nav-tabs nav-tabs-custom-colored" id="section_tablist">
                        <li class="active"><a href="#detail_event" role="tab" data-toggle="tab" id="tab_event_1"
                                              data-section_no="1" aria-expanded="false" class="_tab">1회차</a></li>
                        <li><a href="#detail_event" role="tab" data-toggle="tab" id="tab_event_2" data-section_no="2"
                               aria-expanded="false" class="_tab">2회차</a></li>
                        <li><a href="#detail_event" role="tab" data-toggle="tab" id="tab_event_3" data-section_no="3"
                               aria-expanded="false" class="_tab">3회차</a></li>
                        <li><a href="#detail_event" role="tab" data-toggle="tab" id="tab_event_4" data-section_no="4"
                               aria-expanded="false" class="_tab">4회차</a></li>
                        <li><a href="#detail_event" role="tab" data-toggle="tab" id="tab_event_total"
                               data-section_no="0"
                               aria-expanded="false" class="_tab">종합이벤트</a></li>
                    </ul>
                </div>

                <div id="prize_tabContainer" class="mb15 hidden">
                    <ul class="nav nav-tabs nav-tabs-custom-colored" id="prize_tablist">
                        <li class="active"><a href="#detail_event" role="tab" data-toggle="tab" id="tab_prize_1"
                                              data-prize_no="1" aria-expanded="false" class="_tab">1등 경품</a></li>
                        <li><a href="#detail_event" role="tab" data-toggle="tab" id="tab_prize_2" data-prize_no="2"
                               aria-expanded="false" class="_tab">2등 경품</a></li>
                        <li><a href="#detail_event" role="tab" data-toggle="tab" id="tab_prize_3" data-prize_no="3"
                               aria-expanded="false" class="_tab">3등 경품</a></li>
                        <li><a href="#detail_event" role="tab" data-toggle="tab" id="tab_prize_4" data-prize_no="4"
                               aria-expanded="false" class="_tab">4등 경품</a></li>
                        <li><a href="#detail_event" role="tab" data-toggle="tab" id="tab_prize_5" data-prize_no="5"
                               aria-expanded="false" class="_tab">5등 경품</a></li>
                        <li><a href="#detail_event" role="tab" data-toggle="tab" id="tab_prize_6" data-prize_no="6"
                               aria-expanded="false" class="_tab">6등 경품</a></li>
                        <li><a href="#detail_event" role="tab" data-toggle="tab" id="tab_prize_7" data-prize_no="7"
                               aria-expanded="false" class="_tab">7등 경품</a></li>
                        <li><a href="#detail_event" role="tab" data-toggle="tab" id="tab_prize_8" data-prize_no="8"
                               aria-expanded="false" class="_tab">8등 경품</a></li>
                        <li><a href="#detail_event" role="tab" data-toggle="tab" id="tab_prize_top" data-prize_no="0"
                               aria-expanded="false" class="_tab">최다응모자</a></li>
                    </ul>
                </div>

                <div id="subscribe_status_area"></div>
                <div>
                    <span id="search_fan" onchange="getFanDjPrizeEventList();"></span>
                </div>
                <div>
                    <span class="hidden" id="search_dj" onchange="getFanDjPrizeEventList();"></span>
                </div>
                <div id="tableArea"></div>
            </div>
        </div>

        <div class="mt15" id="fullmoonEventDetailArea"></div>

    </div>
</form>

<script type="text/javascript" src="/js/code/content/contentCodeList.js?${dummyData}"></script>
<script type="text/javascript">
    let beforeFanDjType = -1;
    let beforeSectionNo = -1;
    let fanDjPrizePagingInfo = new PAGING_INFO(0, 1, 50);

    function getFanDjPrizeEventList(pagingNo = 1) {
        if (!common.isEmpty(pagingNo)) {
            fanDjPrizePagingInfo.pageNo = pagingNo;
        } else {
            fanDjPrizePagingInfo.pageNo = 1;
        }

        const searchMemNo = ($("#searchMemNoText").val() != "") ? $("#searchMemNoText").val() : 0;
        const fanDjTab = $('#fanDj_tablist li.active a');
        const sectionTab = $('#section_tablist li.active a');
        const prizeTab = $('#prize_tablist li.active a');
        const fanDjNo = fanDjTab.data('slct_type');
        const sectionNo = sectionTab.data('section_no');
        const prizeNo = prizeTab.data('prize_no');

        let rcvDalSlct = $("#search_dj option:selected").val();
        rcvDalSlct = (fanDjNo == 1) ? 0 : (rcvDalSlct != undefined) ? rcvDalSlct : 1;
        let couponUseCntSlct;
        if ((beforeFanDjType != fanDjNo || beforeSectionNo != sectionNo)) {
            couponUseCntSlct = 1;
        } else {
            couponUseCntSlct = $("#search_fan option:selected").val();
        }

        let data = {
            memNo: searchMemNo.toString(),
            evtNo: sectionNo,
            couponUseCnt: (couponUseCntSlct !== undefined) ? couponUseCntSlct : 1,
            pageNo: pagingNo,
            pagePerCnt: fanDjPrizePagingInfo.pageCnt,
            fanGiftNo: prizeNo,
            rcvDalSlct: rcvDalSlct,
        }

        console.warn(data, beforeFanDjType, beforeSectionNo);

        if (fanDjNo === 1) {
            $("#search_fan").removeClass("hidden");
            $("#search_dj").addClass("hidden");
            $('#section_tabContainer').removeClass('hidden');
            let apiURL = (sectionNo !== 0) ? "/rest/content/event/djFanPrize/listFan" : "/rest/content/event/djFanPrize/listFanTotal";
            util.getAjaxData("getDjFanPrizeEventList", apiURL, data, function (dst_id, response) {
                if (sectionNo !== 0) {
                    $('#prize_tabContainer').addClass('hidden');
                    compileHtml("#tmp_fanList", dst_id, response);
                    if ((beforeFanDjType != fanDjNo || beforeSectionNo != sectionNo)) {
                        $("#search_fan").removeClass("hidden");
                        $("#search_fan").html(util.getCommonCodeSelect(-1, djFanPrize_fan_filter));
                        beforeFanDjType = fanDjNo;
                    }
                } else {
                    $('#prize_tabContainer').removeClass('hidden');
                    $("#search_fan").addClass("hidden");
                    if (prizeNo !== 0) {
                        compileHtml("#tmp_fanTotalList", dst_id, response);
                    } else {
                        compileHtml("#tmp_fanTotalList", dst_id, response);
                        $('#rank_table col:nth-child(5)').hide();
                        $('#rank_table th:nth-child(5)').hide();
                        $('#rank_table td:nth-child(5)').hide();
                    }
                }
                beforeSectionNo = sectionNo;
            });
        } else {
            $('#section_tabContainer').addClass('hidden');
            $('#prize_tabContainer').addClass('hidden');
            $("#search_fan").addClass("hidden");
            $("#search_dj").removeClass("hidden");
            util.getAjaxData("getDjFanPrizeEventList", "/rest/content/event/djFanPrize/listDj", data, function (dst_id, response) {
                compileHtml("#tmp_djList", dst_id, response);
                if (beforeFanDjType != fanDjNo) {
                    $("#search_dj").html(util.getCommonCodeSelect(-1, djFanPrize_dj_filter));
                    beforeFanDjType = fanDjNo;
                }
            });
        }

        $(function () {
            $("#dynamicPageAreaFanboard").html(util.renderDynamicPageCntSelect('dynamicPageCntFanboard'));
        });
    }

    function compileHtml(target, dst_id, response) {
        let template, templateScript, context, html
        if (target == "#tmp_fanList") {
            template = $('#tmp_subscribe_status').html();
            templateScript = Handlebars.compile(template);
            context = response.sectonData;
            html = templateScript(context);
            $("#subscribe_status_area").removeClass("hidden");
            $("#subscribe_status_area").html(html);
        } else {
            $("#subscribe_status_area").addClass("hidden");
        }

        template = $(target).html();
        templateScript = Handlebars.compile(template);
        context = response.listData;
        html = templateScript(context);
        $("#tableArea").html(html);

        // fanDjPrizePagingInfo.totalCnt = response.pagingVo.totalCnt;
        fanDjPrizePagingInfo.totalCnt = response.totalCnt;
        util.renderPagingNavigation('fanDj_paginate_top', fanDjPrizePagingInfo);
        util.renderPagingNavigation('fanDj_paginate_bottom', fanDjPrizePagingInfo);

        if (response.listData.length === 0) {
            $("#fanDj_paginate_top").hide();
            $('#fanDj_paginate_bottom').hide();
        } else {
            $("#fanDj_paginate_top").show();
            $('#dalAmt_paginate').show();
        }
    }

    function handlebarsPaging(targetId, pagingInfo) {
        if (targetId === "fanDj_paginate_top" || targetId === "fanDj_paginate_bottom") {
            fanDjPrizePagingInfo = pagingInfo;
            getFanDjPrizeEventList(pagingInfo.pageNo);
        }
    }

    $(document).on('click', '._tab', function () {
        getFanDjPrizeEventList(1);
    });

    $("#bt_search").on('click', function () {
        getFanDjPrizeEventList(1);
    });

    $(function () {
        getFanDjPrizeEventList(1);
    })
</script>

<script type="text/x-handlebars-template" id="tmp_subscribe_status">
    <table id="subscription_status" class="table table-sorting table-hover table-bordered">
        <colgroup>
            <col width="25%"/>
            <col width="25%"/>
            <col width="25%"/>
            <col width="25%"/>
        </colgroup>
        <tbody id="section_status">
        <td>응모 1회 이상: {{one_use_cnt}}명</td>
        <td>응모 10회 이상: {{ten_user_cnt}}명</td>
        <td>응모 50회 이상: {{fiftieth_user_cnt}}명</td>
        <td>응모 100회 이상: {{one_hundred_user_cnt}}명</td>
        </tbody>
    </table>
</script>

<%--청취자리스트--%>
<script type="text/x-handlebars-template" id="tmp_fanList">
    <div class="dataTables_paginate paging_full_numbers" id="fanDj_paginate_top"></div>
    <table id="rank_table" class="table table-sorting table-hover table-bordered">
        <colgroup>
            <col width="5%"/>
            <col width="15%"/>
            <col width="15%"/>
            <col width="25%"/>
            <col width="15%"/>
            <col width="15%"/>
        </colgroup>
        <thead>
        <tr>
            <th>순위</th>
            <th>회원번호</th>
            <th>연락처</th>
            <th>닉네임</th>
            <th>회차 내 응모 수</th>
            <th>회차 내 청취 시간</th>
        </tr>
        </thead>
        <tbody id="rank_table_body">
        {{#each this as |data|}}
        <tr>
            <td>{{data.rank_no}}</td>
            <td>{{{memNoLink data.mem_no data.mem_no}}}</td>
            <td>{{phoneNumHyphen data.mem_phone}}</td>
            <td>{{mem_nick}}</td>
            <td>{{addComma use_coupon_cnt}}</td>
            <td>{{addComma view_time}} 분</td>
        </tr>

        {{else}}
        <tr>
            <td colspan="10">{{isEmptyData}}</td>
        </tr>
        {{/each}}
        </tbody>
    </table>
    <div class="dataTables_paginate paging_full_numbers" id="fanDj_paginate_bottom"></div>
</script>

<%--청취자리스트 > 종합이벤트--%>
<script type="text/x-handlebars-template" id="tmp_fanTotalList">
    <div class="dataTables_paginate paging_full_numbers" id="fanDj_paginate_top"></div>
    <table id="rank_table" class="table table-sorting table-hover table-bordered">
        <colgroup>
            <col width="5%"/>
            <col width="15%"/>
            <col width="10%"/>
            <col width="20%"/>
            <col width="12%"/>
            <col width="12%"/>
            <col width="12%"/>
            <col width="12%"/>
        </colgroup>
        <thead>
        <tr>
            <th>순위</th>
            <th>회원번호</th>
            <th>연락처</th>
            <th>닉네임</th>
            <th>경품 응모 수<%--최다 응모자에서는 안보임--%></th>
            <th>총 응모 수</th>
            <th>레벨</th>
            <th>누적경험치</th>
        </tr>
        </thead>
        <tbody id="rank_table_body">
        {{#each this as |data|}}
        <tr>
            <td>{{data.rank_no}}</td>
            <td>{{{memNoLink data.mem_no data.mem_no}}}</td>
            <td>{{phoneNumHyphen data.mem_phone}}</td>
            <td>{{mem_nick}}</td>
            <td>{{addComma use_coupon_cnt}}</td>
            <td>{{addComma tot_use_coupon_cnt}}</td>
            <td>{{addComma level}}</td>
            <td>{{addComma exp}}</td>
        </tr>

        {{else}}
        <tr>
            <td colspan="10">{{isEmptyData}}</td>
        </tr>
        {{/each}}
        </tbody>
    </table>
    <div class="dataTables_paginate paging_full_numbers" id="fanDj_paginate_bottom"></div>
</script>

<%--DJ 리스트--%>
<script type="text/x-handlebars-template" id="tmp_djList">
    <div class="dataTables_paginate paging_full_numbers" id="fanDj_paginate_top"></div>
    <table id="rank_table" class="table table-sorting table-hover table-bordered">
        <colgroup>
            <col width="5%"/>
            <col width="15%"/>
            <col width="15%"/>
            <col width="25%"/>
            <col width="10%"/>
            <col width="10%"/>
            <col width="10%"/>
        </colgroup>
        <thead>
        <tr>
            <th>순위</th>
            <th>회원번호</th>
            <th>연락처</th>
            <th>닉네임</th>
            <th>받은 별</th>
            <th>방송 시간</th>
            <th>부스터</th>
        </tr>
        </thead>
        <tbody id="rank_table_body">
        {{#each this as |data|}}
        <tr>
            <td>{{data.rank_no}}</td>
            <td>{{{memNoLink data.mem_no data.mem_no}}}</td>
            <td>{{phoneNumHyphen mem_phone}}</td>
            <td>{{mem_nick}}</td>
            <td>{{addComma rcv_dal_cnt}}</td>
            <td>{{addComma play_time}} 분</td>
            <td>{{addComma rcv_booster}}</td>
        </tr>

        {{else}}
        <tr>
            <td colspan="6">{{isEmptyData}}</td>
        </tr>
        {{/each}}
        </tbody>
    </table>
    <div class="dataTables_paginate paging_full_numbers" id="fanDj_paginate_bottom"></div>
</script>
