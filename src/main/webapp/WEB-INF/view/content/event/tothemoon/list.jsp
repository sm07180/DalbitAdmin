<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dummyData" value="<%= java.lang.Math.round(java.lang.Math.random() * 1000000) %>"/>

<div id="condition5">
    <div class="col-lg-12">
        <div class="widget widget-table">
            <form id="searchForm">
                <div class="widget widget-table searchBoxArea" style="margin-bottom: 0">
                    <table style="width: 100%">
                        <tr>
                            <th rowspan="2" style="background-color:#4472c4;color:#e9ee17;width: 70px">
                                <i class="fa fa-search"></i><br/>검색
                            </th>
                            <td style="text-align: left">
                                <label><input type="text" class="form-control" name="searchMemNoText" id="searchMemNoText"
                                              placeholder="회원번호 검색"></label>
                                <button type="button" class="btn btn-success" id="bt_search">검색</button>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: left">
                                <div class="form-inline">
                                    <button type="button" class="btn btn-sm btn-custom-secondary" id="prevStep">이전회차</button>
                                    <input type="number" class="form-control text-right pr0 pl0" style="width:50px;" name="moonNo" id="moonNo" value="1">
                                    <button type="button" class="btn btn-sm btn-custom-secondary" id="nextStep">다음회차</button>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </form>
        </div>
        <div class="clearfix widget-content mt5 mb5">
            <h4 class="font-bold">달나라 갈끄니까! 이벤트</h4>

            <div id="statusArea"></div>
            <div id="tableArea"></div>
        </div>
    </div>
</div>
<script type="text/javascript" src="/js/code/content/contentCodeList.js?${dummyData}"></script>
<script type="text/javascript">
    const moonPagingInfo = new PAGING_INFO(0, 1, 100);
    const $memNo = $('#searchMemNoText');
    const $moonNo = $('#moonNo');
    const minStep = 1;
    const maxStep = 2;

    const moonEventData = (function() {
        function callList(pageInfo) {
            $('#statusArea').empty();
            $("#tableArea").empty();

            let stepNo = parseInt($moonNo.val(), 10);
            if (minStep > stepNo) {
                alert('이전회차가 없습니다.');
                $moonNo.val(minStep);
                return;
            }

            if (maxStep < stepNo) {
                alert('다음회차가 없습니다.');
                $moonNo.val(maxStep);
                return;
            }

            let _memNo = $memNo.val() ? parseInt($memNo.val(), 10) : 0;
            let data = {
                moonNo: $moonNo.val(),
                memNo: _memNo,
                pageNo: pageInfo.pageNo,
                pagePerCnt: pageInfo.pageCnt
            };
            let apiURL = '/rest/content/event/tothemoon/list';
            util.getAjaxData("getMoonList", apiURL, data, function (id, response, params) {
                template = $('#tmp_moon_status').html();
                templateScript = Handlebars.compile(template);
                context = response.rewordData;
                html = templateScript(context);
                $("#statusArea").html(html);

                template = $('#tmp_rank_list').html();
                templateScript = Handlebars.compile(template);
                context = response.listData.map(function (item, index) {
                    item.rank_no = ((pageInfo.pageNo - 1) * pageInfo.pageCnt) + index + 1;
                    item.bonus_score = item.mem_gold_item_score + item.mem_gold_like_score + item.mem_gold_booster_score + item.mem_gold_mission_score;
                    item.character_score = item.mem_cha_booster_score + item.mem_cha_mission_score;
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

        return {
            callList: callList
        }
    }());

    // 핸들바 페이징
    function handlebarsPaging(targetId, pagingInfo) {
        moonEventData.callList(pagingInfo);
    }

    $(document).ready(function() {
        // 첫페이지
        moonEventData.callList(moonPagingInfo);

        // 회원번호 검색
        $("#bt_search").on('click', function () {
            moonEventData.callList(moonPagingInfo);
        });

        // 이전회차
        $("#prevStep").on('click', function () {
            let stepNo = parseInt($moonNo.val(), 10) - 1;
            if (minStep > stepNo) {
                alert('이전회차가 없습니다.');
                return;
            }

            moonPagingInfo.pageNo = 1;
            $moonNo.val(stepNo);
            moonEventData.callList(moonPagingInfo);
        });

        // 다음회차
        $("#nextStep").on('click', function () {
            let stepNo = parseInt($moonNo.val(), 10) + 1;
            if (maxStep < stepNo) {
                alert('다음회차가 없습니다.');
                return;
            }

            moonPagingInfo.pageNo = 1;
            $moonNo.val(stepNo);
            moonEventData.callList(moonPagingInfo);
        });
    });
</script>

<%-- 구슬주머니현황 (얻은점수) --%>
<script type="text/x-handlebars-template" id="tmp_moon_status">
    <div class="clearfix">
        <h4>캐릭터 보상: 총 {{tot_rcv_step_reword_cnt}}개</h4>
    </div>
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
            <col width="150px"/>
        </colgroup>
        <thead>
        <tr>
            <th>순위</th>
            <th>회원번호</th>
            <th>아이디</th>
            <th>닉네임</th>
            <th>총점</th>
            <th>일반점수</th>
            <th>보너스점수</th>
            <th>캐릭터보상</th>
            <th>보상지급(일시)</th>
        </tr>
        </thead>
        <tbody id="rank_table_body">
        {{#each this as |data|}}
        <tr>
            <td>{{rank_no}}</td>
            <td>{{{memNoLink mem_no mem_no}}}</td>
            <td>{{mem_id}}</td>
            <td>{{mem_nick}}</td>
            <td>{{addComma rank_pt}}점</td>
            <td>{{addComma mem_basic_item_score}}점</td>
            <td>{{addComma bonus_score}}점</td>
            <td>{{addComma character_score}}점</td>
            <td>
                {{#dalbit_if rcv_yn '==' 'y'}}
                    {{addComma rcv_reword_cnt}}달<br>
                    {{rcv_date}}
                {{/dalbit_if}}
                {{#dalbit_if rcv_yn '==' 'n'}} - {{/dalbit_if}}
            </td>
        </tr>
        {{else}}
        <tr>
            <td colspan="9">{{isEmptyData}}</td>
        </tr>
        {{/each}}
        </tbody>
    </table>
    <div class="dataTables_paginate paging_full_numbers" id="rank_paginate_bottom"></div>
</script>