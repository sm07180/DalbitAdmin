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

            <div id="result_tabContainer" class="mb15">
                <ul class="nav nav-tabs nav-tabs-custom-colored" id="result_tablist">
                    <li class="active"><a href="#detail_event" role="tab" data-toggle="tab" data-result_no="1" aria-expanded="false" class="_tab">순위</a></li>
                    <li><a href="#detail_event" role="tab" data-toggle="tab" data-result_no="2" aria-expanded="false" class="_tab">배팅</a></li>
                    <li><a href="#detail_event" role="tab" data-toggle="tab" data-result_no="3" aria-expanded="false" class="_tab">구슬주머니</a></li>
                </ul>
            </div>

<%--            <img src="//image.dalbitlive.com/event/gganbu/marble-red.png" width="15">--%>
<%--            <img src="//image.dalbitlive.com/event/gganbu/marble-yellow.png" width="15">--%>
<%--            <img src="//image.dalbitlive.com/event/gganbu/marble-blue.png" width="15">--%>
<%--            <img src="//image.dalbitlive.com/event/gganbu/marble-purple.png" width="15">--%>

            <div id="kkanbu_top_result"></div>

            <div id="kkanbu_rank_list">
                <div class="dataTables_paginate paging_full_numbers"></div>
            </div>
            <div id="kkanbu_bet_list">
                <div class="dataTables_paginate paging_full_numbers"></div>
            </div>
            <div id="kkanbu_marble_list">
                <div class="dataTables_paginate paging_full_numbers"></div>
            </div>
            <div id="kkanbu_list">
                <div class="dataTables_paginate paging_full_numbers"></div>
            </div>
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
    }
    const kkanbuEventData = (function() {
        function getRankList(memNo, sectionNo, pageInfo) {
            let data = {

            };
            let apiURL = '/rest/content/event/kkanbu/rankList';
            util.getAjaxData("getKkanbuRankList", apiURL, data, function (response) {

            }, null, {type: 'GET'});
        }

        function getBetList(memNo, sectionNo, pageInfo) {
            let data = {

            };
            let apiURL = '/rest/content/event/kkanbu/betList';
            util.getAjaxData("getKkanbuBetList", apiURL, data, function (response) {
                console.log(response);
            }, null, {type: 'GET'});
        }

        function getMarbleList(memNo, sectionNo, pageInfo) {
            let data = {

            };
            let apiURL = '/rest/content/event/kkanbu/marbleList';
            util.getAjaxData("getKkanbuMarbleList", apiURL, data, function (response) {

            }, null, {type: 'GET'});
        }

        function getKkanbuList(memNo, sectionNo, pageInfo) {
            let data = {

            };
            let apiURL = '/rest/content/event/kkanbu/list';
            util.getAjaxData("getKkanbuList", apiURL, data, function (response) {

            }, null, {type: 'GET'});
        }

        return {
            "11": getRankList,
            "12": getBetList,
            "13": getMarbleList,
            "21": getKkanbuList
        }
    }());

    $(document).ready(function()   {
        let kkanbuSlctType = -1; // 1: 게임현황, 2: 깐부신청현황
        let kkanbuSectionNo = -1; // 1: 1회차, 2: 2회차, 3: 3회차, 4: 4회차
        let kkanbuResultNo = -1; // 1: 순위, 2: 배팅, 3: 구슬주머니
        let kkanbuPagingInfo = new PAGING_INFO(0, 1, 50);
        let memNo = document.getElementById('searchMemNoText').value;

        // 최상위 탭 이벤트
        $('#kkanbu_tablist li a').on('click', function() {
            const $this = $(this);
            kkanbuSlctType = parseInt($this.data('slct_type'), 10);
            kkanbuSectionNo = (kkanbuSectionNo < 0) ? 1 : kkanbuSectionNo;

            // const displayCode = (kkanbuSlctType === 1) ? 'block' : 'none';
            $('#result_tabContainer').removeClass('hidden');
            if (kkanbuSlctType !== 1) {
                kkanbuResultNo = 1;
                $('#result_tabContainer').addClass('hidden');
            }

            const eventCode = '' + kkanbuSlctType + kkanbuResultNo;
            kkanbuEventData[eventCode](memNo, kkanbuSectionNo);

            $('#section_tablist li').removeClass('active');
            $('#section_tablist li').eq(kkanbuSectionNo-1).addClass('active');

            $('#result_tablist li').removeClass('active');
            $('#result_tablist li').eq(kkanbuResultNo-1).addClass('active');
        });

        // 회차 탭 이벤트
        $('#section_tablist li a').on('click', function() {
            const $this = $(this);
            kkanbuSlctType = (kkanbuSlctType < 0) ? 1 : kkanbuSlctType;
            kkanbuSectionNo = parseInt($this.data('section_no'), 10);
            kkanbuResultNo = 1;

            const eventCode = '' + kkanbuSlctType + kkanbuResultNo;
            kkanbuEventData[eventCode](memNo, kkanbuSectionNo);

            $('#result_tablist li').removeClass('active');
            $('#result_tablist li').eq(kkanbuResultNo-1).addClass('active');
        });

        // 순위/배팅/구슬주머니 탭 이벤트
        $('#result_tablist li a').on('click', function() {
            const $this = $(this);
            kkanbuSlctType = (kkanbuSlctType < 0) ? 1 : kkanbuSlctType;
            kkanbuResultNo = parseInt($this.data('result_no'), 10);

            const eventCode = '' + kkanbuSlctType + kkanbuResultNo;
            kkanbuEventData[eventCode](memNo, kkanbuSectionNo);
        });
    });
</script>

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
            <td>총 베팅: X회</td>
            <td>홀수 베팅: X회</td>
            <td>짝수 베팅: X회</td>
            <td>홀수 나온 횟수: X회</td>
            <td>짝수 나온 횟수: X회</td>
        </tr>
        </tbody>
    </table>
</script>

<script type="text/x-handlebars-template" id="tmp_marble_status">
    <table id="marble_table_status" class="table table-sorting table-hover table-bordered">
        <tbody id="marble_status">
        <tr>
            <td>총 횟수: X회</td>
            <td>10점: X회</td>
            <td>20점: X회</td>
            <td>30점: X회</td>
            <td>40점: X회</td>
            <td>50점: X회</td>
            <td>60점: X회</td>
            <td>70점: X회</td>
            <td>80점: X회</td>
            <td>90점: X회</td>
            <td>100점: X회</td>
        </tr>
        </tbody>
    </table>
</script>
