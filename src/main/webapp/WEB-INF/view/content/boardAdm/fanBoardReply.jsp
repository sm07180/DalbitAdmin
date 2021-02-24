<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dummyData"><%= java.lang.Math.round(java.lang.Math.random() * 1000000) %></c:set>

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
                <div class="col-md-12 no-padding mt10">
                    <div class="col-md-6 no-padding">
                        <span id="fanboardReplyListCnt"></span><br/>
                        <span style="color: red">* 팬보드 작성 글 수(비밀글 수)를 표기한 정보입니다.</span><br/>

                        <select id="fanReplyBoardOwner" name="fanReplayBoardOwner" class="form-control searchType">
                            <option value="0" selected="selected">팬보드주인(전체)</option>
                            <option value="1">주인</option>
                            <option value="2">등록자</option>
                        </select>

                        <select id="fanReplyBoardStatus" name="fanReplayBoardStatus" class="form-control searchType">
                            <option value="0" selected="selected">게시글(전체)</option>
                            <option value="1">정상</option>
                            <option value="2">삭제</option>
                        </select>

                        <select id="isReplySecret" name="isReplaySecret" class="form-control searchType">
                            <option value="0" selected="selected">비밀글 여부(전체)</option>
                            <option value="1">비밀 X</option>
                            <option value="2">비밀 O</option>
                        </select>

                        <select id="isReplyWithdarwal" name="isReplayWithdarwal" class="form-control searchType">
                            <option value="0" selected="selected">회원/탈퇴(전체)</option>
                            <option value="1">회원</option>
                            <option value="2">탈퇴</option>
                        </select>

                        <select id="isReplyMemblock" name="isReplayMemblock" class="form-control searchType">
                            <option value="0" selected="selected">차단회원(전체)</option>
                            <option value="1">차단 X</option>
                            <option value="2">차단 O</option>
                        </select>


                        <%--<select id="fanBoardReplayStatus" name="fanBoardReplayStatus" class="form-control searchType">
                            <option value="0" selected="selected">게시글 전체</option>
                            <option value="1">정상</option>
                            <option value="2">삭제</option>
                        </select>
                        <label class="control-inline fancy-checkbox custom-color-green ml15 mt5">
                            <input type="checkbox" name="replyIsSecret" id="replyIsSecret" value="1">
                            <span>비밀글 모아보기</span>
                        </label>
                        <label class="control-inline fancy-checkbox custom-color-green ml15 mt5">
                            <input type="checkbox" name="replyIsWithdarwal" id="replyIsWithdarwal" value="1">
                            <span>탈퇴회원 모아보기</span>
                        </label>--%>
                        <span id="dynamicPageFanboardReplyArea"></span>
                    </div>
                    <div class="col-md-2 no-padding pull-right">
                        <table class="table table-sorting table-hover table-bordered">
                            <colgroup>
                                <col width="15%"/><col width="65%"/>
                            </colgroup>
                            <tr>
                                <td style="background-color: #dae3f3"></td><td>테스트 아이디</td>
                            </tr>
                        </table>
                    </div>
                </div>
                <%--<div class="col-md-6 no-padding mt10">--%>
                    <%--<span id="searchType_boardReply" onchange="fanBoardReply();"></span>--%>
                <%--</div>--%>
                <%--<div class="col-md-6 no-padding mt10" >
                    <span id="fanBoardReplyTable_summary"></span>
                </div>--%>
                <div class="dataTables_paginate paging_full_numbers" id="fanBoardReply_paginate_top"></div>
                <div id="fanBoardReplyTable"></div>
                <div class="dataTables_paginate paging_full_numbers" id="fanBoardReply_paginate"></div>
            </div>
            <div class="widget-footer">
                <span>
                    <button class="btn btn-danger btn-sm print-btn" type="button" id="deleteFanboardReplyBtn"><i class="fa fa-check"></i>선택 삭제</button>
                </span>
            </div>
        </div>
    </div>
</div>
<!-- //table -->

<script type="text/javascript" src="/js/code/content/contentCodeList.js?${dummyData}"></script>
<script type="text/javascript" src="/js/code/member/memberCodeList.js?${dummyData}"></script>
<script type="text/javascript">
    var fanBoardReplyPagingInfo = new PAGING_INFO(0, 1, $("#dynamicPageCntFanboardReply").val());

    $(document).ready(function() {
        $("#dynamicPageFanboardReplyArea").html(util.renderDynamicPageCntSelect('dynamicPageCntFanboardReply'));
    });

    function fanBoardReply(pagingNo, _tabId) {
        if(!common.isEmpty(_tabId)){
            tabId = _tabId;
        }

        $('#title').html('팬보드 댓글');
        if(!common.isEmpty(pagingNo)){
            fanBoardReplyPagingInfo.pageNo = pagingNo;
        }else{
            fanBoardReplyPagingInfo.pageNo = 1;
        }

        if(!common.isEmpty(memNo) && memNo != null){
            txt_search = memNo;
        }else{
            txt_search = $('#txt_search').val();
        }

        var data = {
            'pageStart' : fanBoardReplyPagingInfo.pageNo
            , 'pageCnt' : fanBoardReplyPagingInfo.pageCnt
            , 'txt_search' : txt_search
            , 'start_sel' : $("#startDate").val()
            , 'end_sel' : $("#endDate").val()
            , 'searchType' : 0
            , 'boardType' : 2
            // , 'status' : Number($("#fanBoardReplayStatus option:selected").val())
            // , 'isSecret' : $('input:checkbox[name="replyIsSecret"]').prop('checked') ? 0 : 1
            // , 'isWithdarwal' : $('input:checkbox[name="replyIsWithdarwal"]').prop('checked') ? 1 : 0

            , 'status' : Number($("#fanReplyBoardStatus option:selected").val())
            , 'isSecret' : Number($("#isReplySecret option:selected").val())
            , 'isWithdarwal' : Number($("#isReplyWithdarwal option:selected").val())
            , 'fanBoardOwner' : Number($("#fanReplyBoardOwner option:selected").val())
            , 'isMemblock' : Number($("#isReplyMemblock option:selected").val())
            , 'newSearchType' : $("#searchMember").val()
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
        $("#tab_fanBoardReply").text("팬보드댓글" + "(" + response.data.totalCnt +")");
        $("#fanboardReplyListCnt").html(
            '<span style="color:black">[검색결과 : ' +  response.data.totalCnt + '(' + response.data.secretTotalCnt + ') 건]</span>' +
            '<span style="color: blue;"> [남' + response.data.maleCnt + '(' + response.data.secretMaleCnt + ') 건]</span>' + "," +
            '<span style="color: red;"> [여' + response.data.femaleCnt + '(' + response.data.secretFemaleCnt + ') 건]</span>' + "," +
            '<span style="color: #555555;"> [알수없음' + response.data.noneCnt + '(' + response.data.secretNoneCnt + ') 건]</span>'
        );

        // var template = $('#fanBoardReply_tableSummary').html();
        // var templateScript = Handlebars.compile(template);
        // var context = response.data;
        // var html = templateScript(context);
        //
        // $('#fanBoardReplyTable_summary').html(html);
    }

    $(document).on('click', '._deleteFanBoardReply', function() {
        if($(this).data('status') == 2) {
            alert('이미 삭제된 댓글입니다.');
        } else if(confirm("삭제하시겠습니까?")){
            var data = {
                'idx' : $(this).data('idx')
            };

            util.getAjaxData("deleteFanBoard", "/rest/member/fanboard/delete", data, function(dst_id, response) {
                alert(response.message);
                fanBoardReply(fanBoardReplyPagingInfo.pageNo);
            });
        }
        return false;
    });
    $('#fanReplyBoardStatus').on('change', function () {
        fanBoardReply();
    });
    $('#isReplySecret').on('change', function () {
        fanBoardReply();
    });
    $('#isReplyWithdarwal').on('change', function () {
        fanBoardReply();
    });
    $('#fanReplyBoardOwner').on('change', function () {
        fanBoardReply();
    });
    $('#isReplyMemblock').on('change', function () {
        fanBoardReply();
    });

    /*$('#replyIsSecret').on('change', function() {
        if($('input:checkbox[name="replyIsSecret"]').prop('checked')) {
            $('#replyIsSecret').val(0)
        } else {
            $('#replyIsSecret').val(1)
        }
        fanBoardReply();
    });

    $('#replyIsWithdarwal').on('change', function() {
        if($('input:checkbox[name="replyIsWithdarwal"]').prop('checked')) {
            $('#replyIsWithdarwal').val(1)
        } else {
            $('#replyIsWithdarwal').val(0)
        }
        fanBoardReply();
    });*/

    $(document).on('change', '#dynamicPageCntFanboardReply', function () {
        fanBoardReplyPagingInfo.pageCnt = $(this).val();
        fanBoardReply();
    });

    $(document).on('click', '#allChkFanboardReply', function(){
        var me = $(this);
        var checkboxs = $('._fanboardReply_chk:not(.disabled)');
        if(me.prop('checked')){
            checkboxs.prop('checked', true);
        }else{
            checkboxs.prop('checked', false);
        }
    });

    $(document).on('click', '#deleteFanboardReplyBtn', function(){
        var checkboxs = $('._fanboardReply_chk:checked');
        if(checkboxs.length < 1){
            alert('삭제할 팬보드 댓글을 선택해주세요.');
            return false;
        }

        if(confirm(checkboxs.length + '건을 삭제 하시겠습니까?')){

            var idxs = '';
            checkboxs.each(function(){
                var idx = $(this).data('idx');

                idxs += idx + ',';
            });
            var data = {
                idxs : idxs
            }

            util.getAjaxData('multiOperate', '/rest/member/fanboard/multi/delete', data, function(dist_id, response){
                alert(response.message);
                fanBoardReply(fanBoardReplyPagingInfo.pageNo);
            });
        }
    });

</script>

<script id="tmp_fanBoardReplyTable" type="text/x-handlebars-template">
    <table id="tb_fanBoardReply" class="table table-sorting table-hover table-bordered mt10">
        <colgroup>
            <col width="2%"/><col width="2%"/><col width="6%"/><col width="4%"/><col width="6%"/>
            <col width="4%"/><col width="5%"/><col width="25%"/><col width="3%"/><col width="6%"/>
            <col width="4%"/><col width="25%"/><col width="5%"/>
        </colgroup>
        <thead>
        <tr>
            <th><input type="checkbox" class="form-control" id="allChkFanboardReply" /></th>
            <th>No</th>
            <th>팬보드주인</th>
            <th>성별</th>
            <th>팬보드글등록자</th>
            <th>성별</th>
            <th>비밀 글 여부</th>
            <th class="word-break" style="width: 220px">팬보드 등록 글</th>
            <th>상태</th>
            <th>댓글등록자</th>
            <th>성별</th>
            <th class="word-break" style="width: 220px">등록된 댓글</th>
            <th>상태</th>
            <th>등록일시</th>
            <th>관리</th>
        </tr>
        </thead>
        <tbody>
        {{#each this.data as |data|}}
            <tr {{#dalbit_if fan_inner '==' 1}} style="background-color : #dae3f3" {{/dalbit_if}}>
                <td><input type="checkbox" class="form-control _fanboardReply_chk {{#dalbit_if reply_status '!=' 1}}disabled{{/dalbit_if}}" {{#dalbit_if reply_status '!=' 1}}disabled{{/dalbit_if}} data-idx="{{data.idx}}" /></td>
                <td>{{indexDesc ../pagingVo.totalCnt rowNum}}</td>
                <td>
                    {{{memNoLink star_mem_no star_mem_no}}}<br/>
                    {{star_mem_nick}}
                    {{#dalbit_if star_withdrawalType '==' 'Y'}}
                        <br/><span style="color: RED;">(탈퇴)</span>
                    {{/dalbit_if}}
                </td>
                <td>
                    {{{sexIconBr star_mem_sex star_birth_year}}}
                </td>
                <td>
                    {{{memNoLink fan_mem_no fan_mem_no}}}<br/>
                    {{fan_mem_nick}}
                    {{#dalbit_if fan_withdrawalType '==' 'Y'}}
                        <br/><span style="color: RED;">(탈퇴)</span>
                    {{/dalbit_if}}
                </td>
                <td>
                    {{{sexIconBr fan_mem_sex fan_birth_year}}}
                </td>
                <td>
                    {{#dalbit_if view_yn '==' 0}} 비밀 글 {{/dalbit_if}}
                </td>
                <td class="word-break" style="width: 200px">
                    <span class="pull-left">{{replaceHtml contents}}</span>
                </td>
                <td>
                    {{#dalbit_if status '==' 1}}
                        정상
                    {{else}}
                        삭제
                    {{/dalbit_if}}
                </td>
                <td>
                    {{{memNoLink fan_reply_mem_no fan_reply_mem_no}}}<br/>
                    {{fan_reply_mem_nick}}
                    {{#dalbit_if fan_reply_withdrawalType '==' 'Y'}}
                        <br/><span style="color: RED;">(탈퇴)</span>
                    {{/dalbit_if}}
                </td>
                <td>
                    {{{sexIconBr fan_reply_mem_sex fan_reply_birth_year}}}
                </td>
                <td class="word-break" style="width: 200px">
                    <span class="pull-left">{{replaceHtml replyContents}}</span>
                </td>
                <td>
                    {{#dalbit_if reply_status '==' 1}}
                        정상
                    {{else}}
                        삭제
                    {{/dalbit_if}}
                </td>
                <td>{{convertToDate last_upd_date 'YYYY-MM-DD HH:mm:ss'}}</td>
                <td><a href="javascript://" class="_deleteFanBoardReply" data-idx="{{idx}}" data-status="{{reply_status}}">[삭제]</a></td>
            </tr>
        {{else}}
        <tr>
            <td colspan="17">{{isEmptyData}}</td>
        </tr>
        {{/each}}
        </tbody>
    </table>
</script>

<%--
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
</script>--%>
