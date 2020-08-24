<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 방송 > 선물내역 -->
<div class="widget widget-table mb10">
    <div class="widget-content mt10">
        <span class="_searchDate2"></span>
        <table class="table table-bordered">
            <colgroup>
                <col width="2%"/><col width="8.3%"/><col width="8.3%"/><col width="8.3%"/><col width="8.3%"/>
                <col width="8.3%"/><col width="8.3%"/><col width="8.3%"/><col width="8.3%"/><col width="8.3%"/>
                <col width="8.3%"/><col width="8.3%"/>
            </colgroup>
            <thead>
            <tr>
                <th>NO</th>
                <th>선물 일시</th>
                <th>회원번호</th>
                <th>닉네임</th>
                <th>방송방 제목</th>
                <th>DJ ID</th>
                <th>닉네임</th>
                <th>성별</th>
                <th>아이템<br />이미지</th>
                <th>아이템명</th>
                <th>아이템 수량</th>
                <th>아이템 달수</th>
                <%--<th>비밀선물</th>--%>
                <%--<th>선물받은<br />회원 ID</th>
                <th>닉네임</th>--%>
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
    giftHistoryListPagingInfo = new PAGING_INFO(0, 1, 100);

    function getGiftHistoryList(){

        $("#searchForm #pageNo").val(giftHistoryListPagingInfo.pageNo);
        $("#searchForm #pageCnt").val(giftHistoryListPagingInfo.pageCnt);

        var data = {};
        data.slctType = $('input[name="slctType2"]:checked').val();
        data.startDate = $("#startDate").val();
        data.endDate = $("#endDate").val();
        data.pageNo = giftHistoryListPagingInfo.pageNo;
        data.pageCnt = giftHistoryListPagingInfo.pageCnt;
        util.getAjaxData("broadcastGiftHistory", "/rest/status/broadcast/broadcastGiftHistory/list", data, fn_broadcastGiftHistory_success);
    }

    function fn_broadcastGiftHistory_success(dst_id, response) {
        var template = $('#tmp_giftHistoryList').html();
        var templateScript = Handlebars.compile(template);
        var detailContext = response.data.detailList;


        if(response.data != ''){
            var pagingInfo = response.data.totalInfo;
            giftHistoryListPagingInfo.totalCnt = pagingInfo.totalCnt;
            util.renderPagingNavigation('list_info_paginate', giftHistoryListPagingInfo);

            detailContext.totalCnt = pagingInfo.totalCnt;
        }

        var html=templateScript(detailContext);
        $("#giftHistoryListArea").html(html);
    }

    function handlebarsPaging(targetId, pagingInfo){
        giftHistoryListPagingInfo = pagingInfo;
        getGiftHistoryList();
    }

</script>

<script type="text/x-handlebars-template" id="tmp_giftHistoryList">
    {{#each this as |data|}}
        <tr>
            <td>
                {{indexDesc ../totalCnt rowNum}}
            </td>
            <td>{{convertToDate purchaseDate 'YYYY-MM-DD HH:MM:SS'}}</td>
            <td><a href="javascript://" class="_openMemberPop" data-memNo="{{mem_no}}">{{mem_no}}</a></td>
            <td>{{mem_nick}}</td>
            <td><a href="javascript://" class="_openBroadcastPop" data-roomno="{{room_no}}">{{title}}</a></td>
            <td><a href="javascript://" class="_openMemberPop" data-memNo="{{gifted_mem_no}}">{{gifted_mem_userid}}</a></td>
            <td>{{gifted_mem_nick}}</td>
            <td>{{{sexIcon mem_sex mem_birth_year}}}</td>
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
            <td>{{addComma itemAmt}}개</td>
        </tr>
    {{else}}
        <tr>
            <td colspan="11" class="noData">{{isEmptyData}}<td>
        </tr>
    {{/each}}
</script>