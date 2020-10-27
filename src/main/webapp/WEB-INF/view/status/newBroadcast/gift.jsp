<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 방송 > 선물내역 -->
<div class="widget widget-table mb10">
    <div class="widget-content mt10">
        <div class="col-md-12 no-padding mt5">
            <div class="col-md-2 no-padding">
                <div class="col-md-3 no-padding mr5">
                    <span id="recvType" onchange="recvTypeChange();"></span>
                </div>
                <div class="col-md-8 no-padding">
                    <span id="giftSort" onchange="giftSortChange();"></span>
                </div>
            </div>
            <div class="col-md-2 no-padding pull-right">
                <table class="table table-sorting table-hover table-bordered no-margin">
                    <colgroup>
                        <col width="15%"/><col width="65%"/>
                    </colgroup>
                    <tr>
                        <td style="background-color: #dae3f3"></td><td>테스트 아이디</td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="dataTables_paginate paging_full_numbers" id="list_info_paginate_top"></div>
        <table class="table table-bordered">
            <colgroup>
                <col width="2%"/><col width="5.8%"/><col width="5.8%"/><col width="5.8%"/><col width="5.8%"/>
                <col width="5.8%"/><col width="5.8%"/><col width="5.8%"/><col width="5.8%"/><col width="5.8%"/>
                <col width="5.8%"/><col width="5.8%"/><col width="5.8%"/><col width="5.8%"/><col width="5.8%"/>
                <col width="5.8%"/><col width="5.8%"/>
            </colgroup>
            <thead>
            <tr>
                <th rowspan="2">NO</th>
                <th rowspan="2">보낸 회원</th>
                <th rowspan="2">성별(나이)</th>
                <th rowspan="2">선물 받은 일시</th>
                <th rowspan="2">방송방 제목</th>
                <th rowspan="2">구분</th>
                <th rowspan="2">받은 회원</th>
                <th rowspan="2">성별</th>
                <th rowspan="2">이미지</th>
                <th rowspan="2">아이템명</th>
                <th rowspan="2">받은선물<br/>수량</th>
                <th rowspan="2">누적 받은 선물 수량</th>
                <th colspan="2">받은선물</th>
                <th colspan="2">누적 받은 선물</th>

                <%--<th>선물 일시</th>--%>
                <%--<th>회원번호</th>--%>
                <%--<th>닉네임</th>--%>
                <%--<th>방송방 제목</th>--%>
                <%--<th>DJ ID</th>--%>
                <%--<th>닉네임</th>--%>
                <%--<th>성별</th>--%>
                <%--<th>아이템<br />이미지</th>--%>
                <%--<th>아이템명</th>--%>
                <%--<th>아이템 수량</th>--%>
                <%--<th>아이템 달수</th>--%>
            </tr>
            <tr>
                <th>달</th>
                <th>별</th>
                <th>달</th>
                <th>별</th>
            </tr>
            </thead>
            <tbody id="giftHistoryListArea"></tbody>
        </table>

        <div class="dataTables_paginate paging_full_numbers" id="list_info_paginate"></div>
    </div>
    <%--<div class="widget-footer">
        <span>
            <button class="btn btn-default print-btn pull-right" type="button" id="excelDownBtn"><i class="fa fa-print"></i>Excel Down</button>
        </span>
    </div>--%>
</div>

<script type="text/javascript">
    giftHistoryListPagingInfo = new PAGING_INFO(0, 1, 20);

    $(function(){
        $("#recvType").html(util.getCommonCodeSelect(-1, recvType));
        $("#giftSort").html(util.getCommonCodeSelect(-1, giftSort));
    });

    function getGiftHistoryList(){
        var nowDay = moment(new Date()).format('YYYY') + "." + moment(new Date()).format('MM') + "." + moment(new Date()).format('DD');
        var timeDay = week[moment(nowDay).add('days', 0).day()];
        $("#timeDate").text(nowDay + "(" + timeDay + ")");

        var data = dataSet();
        data.slctType = $('input[name="search_testId"]').is(":checked") ? "1" : "0";
        data.orderType = $("select[name='giftSort']").val();
        data.pageNo = giftHistoryListPagingInfo.pageNo;
        data.pageCnt = giftHistoryListPagingInfo.pageCnt;
        data.recvType = $("select[name='recvType']").val();

        console.log(data);

        util.getAjaxData("gift", "/rest/status/newBroadcast/info/gift", data, fn_gift_success);
    }

    function fn_gift_success(dst_id, response) {
        $("#giftHistoryListArea").empty();

        var template = $('#tmp_giftHistoryList').html();
        var templateScript = Handlebars.compile(template);
        var detailContext = response.data.detailList;

        if(response.data != ''){
            var pagingInfo = response.data.totalInfo;
            giftHistoryListPagingInfo.totalCnt = pagingInfo.totalCnt;
            util.renderPagingNavigation('list_info_paginate_top', giftHistoryListPagingInfo);
            util.renderPagingNavigation('list_info_paginate', giftHistoryListPagingInfo);

            detailContext.totalCnt = pagingInfo.totalCnt;
            $("#list_info_paginate_top").show();
            $("#list_info_paginate").show();
        }else{
            $("#list_info_paginate_top").hide();
            $("#list_info_paginate").hide();
        }

        var html=templateScript(detailContext);
        $("#giftHistoryListArea").html(html);
    }

    function handlebarsPaging(targetId, pagingInfo){
        giftHistoryListPagingInfo = pagingInfo;
        getGiftHistoryList();
    }
    function recvTypeChange(){
        getGiftHistoryList();
    }

    function giftSortChange(){
        getGiftHistoryList();
    }


</script>

<script type="text/x-handlebars-template" id="tmp_giftHistoryList">
    {{#each this as |data|}}
    <tr {{#dalbit_if inner '==' 1}} style="background-color: #dae3f3" {{/dalbit_if}}>
        <td>
            {{indexDesc ../totalCnt rowNum}}
        </td>
        <td>
            <a href="javascript://" class="_openMemberPop" data-memNo="{{mem_no}}">{{mem_no}}</a><br/>
            {{mem_nick}}
        </td>
        <td>{{{sexIcon mem_sex mem_birth_year}}}</td>
        <td>{{substr purchaseDate 0 19}}</td>
        <td>
            <a href="javascript://" class="_openBroadcastPop" data-roomno="{{room_no}}">{{room_no}}</a><br/>
            {{title}}
        </td>
        <td>{{djguest}}</td>
        <td>
            <a href="javascript://" class="_openMemberPop" data-memNo="{{gifted_mem_no}}"></a>{{gifted_mem_no}}<br/>
            {{gifted_mem_nick}}
        </td>
        <td>{{{sexIcon gifted_mem_sex gifted_birth_year}}}</td>

        <td>
            {{^equal item_thumbnail ''}}
            <img class="_webpImage" src="{{data.item_thumbnail}}" width="50" height="50" data-webpImage="{{data.webp_image}}"/>
            {{else}}
            {{#equal data.item_name '부스터'}}
            <img src="http://image.dalbitlive.com/ani/thumbs/broadcast_boost.png" width="50" height="50" />
            {{else}}
            -
            {{/equal}}
            {{/equal}}
        </td>
        <td>{{item_name}}</td>
        <td>{{addComma itemCnt}}개</td>
        <td>{{addComma total_itemCnt}}개</td>
        <td>{{addComma dalCnt}}개</td>
        <td>{{addComma byeolCnt}}개</td>
        <td>{{addComma total_dalCnt}}개</td>
        <td>{{addComma total_byeolCnt}}개</td>
    </tr>
    {{else}}
    <tr>
        <td colspan="11" class="noData">{{isEmptyData}}<td>
    </tr>
    {{/each}}
</script>