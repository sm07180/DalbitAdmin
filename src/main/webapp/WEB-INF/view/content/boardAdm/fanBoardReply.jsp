<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    .modal-dialog {
        overflow-y: initial !important
    }
    .modal-body {
        height: 100%;
        overflow-y: auto;
    }
</style>
<!-- table -->
<div class="no-padding col-lg-12 form-inline">
    <div class="tab-content no-padding">
        <div class="tab-pane fade in active">
            <div class="widget-content">
                <div class="col-md-6 no-padding mt10">
                    <span id="searchType_boardReply" onchange="fanBoardReply();"></span>
                </div>
                <div class="col-md-6 no-padding mt10" >
                    <span id="fanBoardReplyTable_summary"></span>
                </div>
                <div class="dataTables_paginate paging_full_numbers" id="fanBoardReply_paginate_top"></div>
                <div id="fanBoardReplyTable"></div>
                <div class="dataTables_paginate paging_full_numbers" id="fanBoardReply_paginate"></div>
            </div>
        </div>
    </div>
</div>
<!-- //table -->

<script type="text/javascript" src="/js/code/content/contentCodeList.js?${dummyData}"></script>
<script type="text/javascript" src="/js/code/member/memberCodeList.js?${dummyData}"></script>
<script type="text/javascript">
    var fanBoardReplyPagingInfo = new PAGING_INFO(0,1,100);

    $(document).ready(function() {
        $("#searchType_boardReply").html(util.getCommonCodeSelect(-1, searchType_board, "N","searchType_boardReply"));
    });

    function fanBoardReply() {
        $('#title').html('팬보드검색');

        var data = {
            'pageStart' : fanBoardReplyPagingInfo.pageNo
            , 'pageCnt' : fanBoardReplyPagingInfo.pageCnt
            , 'txt_search' : $('#txt_search').val()
            , 'start_sel' : $("#startDate").val()
            , 'end_sel' : $("#endDate").val()
            , 'searchType' : $("select[name='searchType_boardReply']").val()
        };
        util.getAjaxData("fanBoardList", "/rest/content/boardAdm/fanBoardList", data, fn_success_fanBoardReply);
    }

    function fn_success_fanBoardReply(dst_id, response, param) {
        var template = $('#tmp_fanBoardReplyTable').html();
        var templateScript = Handlebars.compile(template);
        var context = response;
        var html = templateScript(context);

        $('#fanBoardReplyTable').html(html);

        fanBoardReplyPagingInfo.totalCnt = response.pagingVo.totalCnt;
        util.renderPagingNavigation('fanBoardReply_paginate_top', fanBoardReplyPagingInfo);
        util.renderPagingNavigation('fanBoardReply_paginate', fanBoardReplyPagingInfo);
        fanBoardReplyPagingInfo.pageNo=1;

        if(response.data.length == 0) {
            $("#fanBoardReply_paginate_top").hide();
            $('#fanBoardReply_paginate').hide();
        } else {
            $("#fanBoardReply_paginate_top").show();
            $('#fanBoardReply_paginate').show();
        }

        util.getAjaxData("fanBoardListSummary", "/rest/content/boardAdm/fanBoardList/summary", param, fn_success_fanBoardReplySummary);
    }
    function fn_success_fanBoardReplySummary(dst_id, response) {
        var template = $('#fanBoardReply_tableSummary').html();
        var templateScript = Handlebars.compile(template);
        var context = response.data;
        var html = templateScript(context);

        $('#fanBoardReplyTable_summary').html(html);
    }

    function handlebarsPaging(targetId, pagingInfo) {
        fanBoardReplyPagingInfo = pagingInfo;
        fanBoardReply();
    }

    $(document).on('click', '._deleteFanBoard', function() {
        if($(this).data('status') == 2) {
            alert('이미 삭제된 댓글입니다.');
        } else if(confirm("삭제하시겠습니까?")){
            var data = {
                'idx' : $(this).data('idx')
            };
            util.getAjaxData("deleteFanBoard", "/rest/member/fanBoardReply/delete", data, fn_success_deleteFanBoard);
        }
        return false;
    });

    function fn_success_deleteFanBoard(dst_id, response) {
        alert(response.message);
        fanBoardReply();
    }

</script>

<script id="tmp_fanBoardReplyTable" type="text/x-handlebars-template">
    <table id="tb_fanBoardReply" class="table table-sorting table-hover table-bordered mt10">
        <colgroup>
            <col width="2%"/><col width="5%"/><col width="5%"/><col width="5%"/><col width="2%"/>
            <col width="6%"/><col width="5%"/><col width="5%"/><col width="5%"/><col width="2%"/>
            <col width="6%"/><col width="4%"/><col width="5%"/><col width="24%"/><col width="5%"/>
            <col width="4%"/><col width="4%"/>
        </colgroup>
        <thead>
        <tr>
            <th rowspan="2">No</th>
            <th colspan="5">대상회원</th>
            <th colspan="5">작성회원</th>
            <th rowspan="2">상태</th>
            <th rowspan="2">일시</th>
            <th rowspan="2">작성 내용</th>
            <th rowspan="2">비밀 글 여부</th>
            <th rowspan="2">댓글</th>
            <th rowspan="2">삭제</th>
        </tr>
        <tr>
            <th>프로필</th>
            <th>회원번호</th>
            <th>닉네임</th>
            <th>상태</th>
            <th>성별<br />(나이)</th>

            <th>프로필</th>
            <th>회원번호</th>
            <th>닉네임</th>
            <th>상태</th>
            <th>성별<br />(나이)</th>
        </tr>
        </thead>
        <tbody>
        {{#each this.data as |data|}}
            <tr>
                <td>{{indexDesc ../pagingVo.totalCnt rowNum}}</td>
                <td style="width: 65px; height:65px;">
                    {{^equal star_image_profile ''}}
                    <img class="thumbnail" src="{{renderImage ../star_image_profile}}" style="width: 65px;height:65px; margin-bottom: 0px;" onclick="fullSize_background(this.src);"/>
                    {{else}}
                    <img class="thumbnail" src="{{renderProfileImage ../star_image_profile ../star_mem_sex}}" style="width: 65px;height:65px; margin-bottom: 0px;" onclick="fullSize_background(this.src);"/>
                    {{/equal}}
                </td>
                <td>{{{memNoLink star_mem_no star_mem_no}}}</td>
                <td>{{star_mem_nick}}</td>
                <td>{{{getCommonCodeLabel star_mem_state 'mem_state'}}}</td>
                <td>{{{sexIcon star_mem_sex star_birth_year}}}</td>

                <td style="width: 65px; height:65px;">
                    {{^equal fan_image_profile ''}}
                    <img class="thumbnail" src="{{renderImage ../fan_image_profile}}" style="width: 65px;height:65px; margin-bottom: 0px;" onclick="fullSize_background(this.src);"/>
                    {{else}}
                    <img class="thumbnail" src="{{renderProfileImage ../fan_image_profile ../fan_mem_sex}}" style="width: 65px;height:65px; margin-bottom: 0px;" onclick="fullSize_background(this.src);"/>
                    {{/equal}}
                </td>
                <td>{{{memNoLink fan_mem_no fan_mem_no}}}</td>
                <td>{{fan_mem_nick}}</td>
                <td>
                    {{{getCommonCodeLabel fan_mem_state 'mem_state'}}}
                </td>
                <td>{{{sexIcon fan_mem_sex fan_birth_year}}}</td>

                <td>
                    {{{getCommonCodeLabel status 'fanBoard_status'}}}
                    {{#dalbit_if opName '!=' ''}}
                        <br/>({{opName}})
                    {{/dalbit_if}}
                </td>
                <td>{{convertToDate last_upd_date 'YYYY-MM-DD HH:mm:ss'}}</td>
                <td>
                    {{#dalbit_if depth '==' 2}}
                    <span class="col-md-2"><span style="background-color: #fdf2ca">(댓글)</span></span>
                    {{/dalbit_if}}
                    {{#dalbit_if depth '==' 1}}
                    <span class="col-md-2"></span>
                    {{/dalbit_if}}

                    <span class="pull-left">{{replaceHtml contents}}</span>
                </td>
                <td>
                    {{#dalbit_if view_yn '==' 0}} 비밀 글 {{/dalbit_if}}
                </td>
                <td>{{replyCnt}}<a href="javascript://" class="_selectReply" data-status="{{status}}" data-board_no="{{board_no}}" data-reply="{{replyCnt}}" data-mem_no="{{star_mem_no}}">[댓글]</a></td>
                <td><a href="javascript://" class="_deleteFanBoard" data-idx="{{idx}}" data-status="{{status}}">[삭제]</a></td>
            </tr>
        {{else}}
        <tr>
            <td colspan="17">{{isEmptyData}}</td>
        </tr>
        {{/each}}
        </tbody>
    </table>
</script>

<script id="fanBoardReply_tableSummary" type="text/x-handlebars-template">
    <table class="table table-bordered table-summary pull-right no-padding" style="width: 70%;margin-right: 0px">
        <tr>
            <th colspan="5" style="background-color: #8fabdd">팬보드 (비밀글) 현황</th>
        </tr>
        <tr>
            <th style="background-color: #7f7f7f; color: white">총합</th>
            <th style="background-color: #d9d9d9">일평균</th>
            <th style="background-color: #d9d9d9">성별-남성/여성/알수없음</th>
            <th style="background-color: #d9d9d9">총 삭제 글</th>
            <th style="background-color: #d9d9d9">총 일평균 삭제</th>
        </tr>
        <tr>
            <td class="font-bold" style="background-color: #f4b282">{{addComma totalCnt}} ({{addComma secretTotalCnt}})</td>
            <td>{{addComma avgTotalCnt}} ({{addComma secretAvgTotalCnt}})</td>
            <td><span style="color: blue"><span class="font-bold">{{addComma maleCnt}}</span> ({{addComma secretMaleCnt}})</span>
                / <span style="color: red"><span class="font-bold">{{addComma femaleCnt}}</span> ({{addComma secretFemaleCnt}})</span>
                / <span class="font-bold">{{addComma noneCnt}}</span> ({{addComma secretNoneCnt}})</td>
            <td>{{addComma totalDelCnt}} ({{addComma secretTotalDelCnt}})</td>
            <td>{{addComma avgTotalDelCnt}} ({{addComma secretAvgTotalDelCnt}})</td>
        </tr>
    </table>
</script>