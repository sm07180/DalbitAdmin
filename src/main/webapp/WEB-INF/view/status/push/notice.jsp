<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 회원가입 > 총계 -->
<div class="widget widget-table mb10">
    <div class="widget-content mt10">
        <span class="_searchDate"></span>
        <table class="table table-bordered _tableHeight" data-height="23px">
            <colgroup>
                <col width="5.2%"/><col width="5.2%"/><col width="5.2%"/><col width="5.2%"/><col width="5.2%"/>
                <col width="5.2%"/><col width="5.2%"/><col width="5.2%"/><col width="5.2%"/><col width="5.2%"/>
                <col width="5.2%"/><col width="5.2%"/><col width="5.2%"/><col width="5.2%"/><col width="5.2%"/>
                <col width="5.2%"/><col width="5.2%"/><col width="5.2%"/><col width="5.2%"/>
            </colgroup>
            <thead>
            <tr class="_stateTopTh">
                <th rowspan="2"></th>
                <th colspan="2">DJ알림</th>
                <th colspan="2">선물알림</th>
                <th colspan="2">팬 알림</th>
                <th colspan="2">댓글 알림</th>
                <th colspan="2">공지 알림</th>
                <th colspan="2">푸시 알림</th>
                <th colspan="2">좋아요 알림</th>
                <th colspan="3">합계</th>
                <th rowspan="2">총합</th>
            </tr>
            <tr class="_stateSubTh">
                <th>설정</th>
                <th>해제</th>
                <th>설정</th>
                <th>해제</th>
                <th>설정</th>
                <th>해제</th>
                <th>설정</th>
                <th>해제</th>
                <th>설정</th>
                <th>해제</th>
                <th>설정</th>
                <th>해제</th>
                <th>설정</th>
                <th>해제</th>
                <th>무음</th>
                <th>소리</th>
                <th>진동</th>
            </tr>
            </thead>
            <tbody id="tableNoticeBody"></tbody>
        </table>
    </div>
    <div class="widget-footer">
        <span>
            <%--<button class="btn btn-default print-btn pull-right" type="button" id="excelDownBtn"><i class="fa fa-print"></i>Excel Down</button>--%>
        </span>
    </div>
</div>

<script type="text/javascript">
    $(function(){
        getNotice();
    });

    function getNotice(){
        util.getAjaxData("notice", "/rest/status/push/notice", $("#searchForm").serialize(), fn_notice_success);
    }

    function fn_notice_success(data, response){
        dalbitLog(response);
        $("#tableNoticeBody").empty();

        var template = $('#tmp_noticeDetail').html();
        var templateScript = Handlebars.compile(template);

        var detailContext = response.data.detailList;
        var html=templateScript(detailContext);
        $("#tableNoticeBody").append(html);

        ui.tableHeightSet();
    }
</script>
<script type="text/x-handlebars-template" id="tmp_noticeDetail">
    {{#each this as |data|}}
    <tr>
        <td class="_stateSubTh">{{the_date}}</td>
        <td>{{addComma set_1_y}}</td>
        <td>{{addComma set_1_n}}</td>
        <td>{{addComma set_2_y}}</td>
        <td>{{addComma set_2_n}}</td>
        <td>{{addComma set_3_y}}</td>
        <td>{{addComma set_3_n}}</td>
        <td>{{addComma set_4_y}}</td>
        <td>{{addComma set_4_n}}</td>
        <td>{{addComma set_5_y}}</td>
        <td>{{addComma set_5_n}}</td>
        <td>{{addComma set_6_y}}</td>
        <td>{{addComma set_6_n}}</td>
        <td>{{addComma set_7_y}}</td>
        <td>{{addComma set_7_n}}</td>
        <td>{{addComma alim_n}}</td>
        <td>{{addComma alim_s}}</td>
        <td>{{addComma alim_v}}</td>
        <td>{{addComma total}}</td>
    </tr>
    {{else}}
        <td colspan="11" class="noData">{{isEmptyData}}<td>
    {{/each}}
</script>