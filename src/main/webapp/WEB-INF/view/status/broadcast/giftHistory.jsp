<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 방송 > 선물내역 -->
<div class="widget widget-table mb10">
    <div class="widget-header">
        <div class="btn-group widget-header-toolbar">
            <a href="#" title="Expand/Collapse" class="btn-borderless btn-toggle-expand"><i class="fa fa-chevron-up"></i></a>
        </div>
    </div>
    <div class="widget-content mt10">
        <div class="row">
            <div class="col-md-4" style="float:right;">
            <%--<table class="table table-condensed table-dark-header table-bordered">
                <thead>
                <tr>
                    <th></th>
                    <th>건수</th>
                    <th>금액</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <th>합계</th>
                    <td>900</td>
                    <td>900</td>
                </tr>
                </tbody>
            </table>--%>
            </div>
        </div>
        <a href="javascript://" class="_prevSearch">[이전]</a>
        <span class="_searchDate"></span>
        <a href="javascript://" class="_nextSearch">[다음]</a>
        <table class="table table-bordered">
            <thead>
            <tr>
                <th>NO</th>
                <th>선물 일시</th>
                <th>선물한 회원 ID</th>
                <th>닉네임</th>
                <th>방송방 제목</th>
                <th>DJ ID</th>
                <th>닉네임</th>
                <th>아이템<br />이미지</th>
                <th>아이템명</th>
                <th>아이템 금액</th>
                <%--<th>비밀선물</th>--%>
                <%--<th>선물받은<br />회원 ID</th>
                <th>닉네임</th>--%>
            </tr>
            </thead>
            <tbody id="giftHistoryListArea"></tbody>
        </table>
    </div>
    <%--<div class="widget-footer">
        <span>
            <button class="btn btn-default print-btn pull-right" type="button" id="excelDownBtn"><i class="fa fa-print"></i>Excel Down</button>
        </span>
    </div>--%>
</div>

<script type="text/javascript">
    function getGiftHistoryList(){
        util.getAjaxData("broadcastGiftHistory", "/rest/status/broadcast/broadcastGiftHistory/list", $("#searchForm").serialize(), fn_broadcastGiftHistory_success);
    }

    function fn_broadcastGiftHistory_success(dst_id, response) {
        var template = $('#tmp_giftHistoryList').html();
        var templateScript = Handlebars.compile(template);
        var detailContext = response.data.detailList;
        var html=templateScript(detailContext);
        $("#giftHistoryListArea").html(html);

    }

</script>

<script type="text/x-handlebars-template" id="tmp_giftHistoryList">
    {{#each this as |data|}}
        <tr>
            <td>
                {{rowNum}}
            </td>
            <td>{{purchaseDate}}</td>
            <td>{{mem_userid}}</td>
            <td>{{mem_nick}}</td>
            <td>{{title}}</td>
            <td>{{gifted_mem_userid}}</td>
            <td>{{gifted_mem_nick}}</td>
            <td>
                {{^equal item_thumbnail ''}}
                    <img src="{{data.item_thumbnail}}" width="50" height="50" />
                {{else}}
                    -
                {{/equal}}
            </td>
            <td>{{item_name}}</td>
            <td>{{addComma itemAmt}}</td>
        </tr>
    {{else}}
        <tr>
            <td colspan="22" class="noData">{{isEmptyData}}<td>
        </tr>
    {{/each}}
</script>