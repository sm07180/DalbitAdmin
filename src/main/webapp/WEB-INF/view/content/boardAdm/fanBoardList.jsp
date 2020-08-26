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
                    <span id="searchType_board" onchange="fanBoardList();"></span>
                </div>
                <div class="col-md-6 no-padding mt10" >
                    <span id="fanBoardTable_summary"></span>
                </div>
                <div class="dataTables_paginate paging_full_numbers" id="fanBoard_paginate_top"></div>
                <div id="fanBoardTable"></div>
                <div class="dataTables_paginate paging_full_numbers" id="fanBoard_paginate"></div>
            </div>
        </div>
    </div>
</div>
<!-- //table -->
<!-- 팬보드 댓글 보기 -->
<div class="modal fade" id="fanboardModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 800px;display: table;">
        <div class="modal-content">
            <div class="modal-header no-padding">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body">
                <div class="col-md-12 no-padding" id="div_fanboard" style="margin-bottom: 7px"></div><br/>
                <div class="col-md-12 no-padding" id="div_reply"></div>
            </div>
        </div>
    </div>
</div>
<!-- Modal 끝 -->

<script type="text/javascript" src="/js/code/content/contentCodeList.js?${dummyData}"></script>
<script type="text/javascript" src="/js/code/member/memberCodeList.js?${dummyData}"></script>
<script type="text/javascript">
    var fanBoardPagingInfo = new PAGING_INFO(0,1,100);

    $(document).ready(function() {
        $("#searchType_board").html(util.getCommonCodeSelect(-1, searchType_board));
    });

    function fanBoardList() {
        $('#title').html('팬보드검색');

        var data = {
            'pageStart' : fanBoardPagingInfo.pageNo
            , 'pageCnt' : fanBoardPagingInfo.pageCnt
            , 'txt_search' : $('#txt_search').val()
            , 'start_sel' : $("#startDate").val()
            , 'end_sel' : $("#endDate").val()
            , 'searchType' : $("select[name='searchType_board']").val()
        };
        util.getAjaxData("fanBoardList", "/rest/content/boardAdm/fanBoardList", data, fn_success_fanBoardList);
    }

    function fn_success_fanBoardList(dst_id, response, param) {
        var template = $('#tmp_fanBoardTable').html();
        var templateScript = Handlebars.compile(template);
        var context = response;
        var html = templateScript(context);

        $('#fanBoardTable').html(html);

        fanBoardPagingInfo.totalCnt = response.pagingVo.totalCnt;
        util.renderPagingNavigation('fanBoard_paginate_top', fanBoardPagingInfo);
        util.renderPagingNavigation('fanBoard_paginate', fanBoardPagingInfo);
        fanBoardPagingInfo.pageNo=1;

        if(response.data.length == 0) {
            $("#fanBoard_paginate_top").hide();
            $('#fanBoard_paginate').hide();
        } else {
            $("#fanBoard_paginate_top").show();
            $('#fanBoard_paginate').show();
        }

        function handlebarsPaging(targetId, pagingInfo) {
            fanBoardPagingInfo = pagingInfo;
            fanBoardList();
        }

        util.getAjaxData("fanBoardListSummary", "/rest/content/boardAdm/fanBoardList/summary", param, fn_success_fanBoardSummary);
    }
    function fn_success_fanBoardSummary(dst_id, response) {
        var template = $('#fanboard_tableSummary').html();
        var templateScript = Handlebars.compile(template);
        var context = response.data;
        var html = templateScript(context);

        $('#fanBoardTable_summary').html(html);
    }

    $(document).on('click', '._selectReply', function() {
        if($(this).data('status') == 2) {
            alert('삭제된 댓글입니다');
        } else if($(this).data('reply') == 0) {
            alert('해당 팬보드의 댓글이 없습니다.');
        } else if($(this).data('reply') > 0) {
            var data = {
              'mem_no' : $(this).data('mem_no')
              , 'board_no' : $(this).data('board_no')
            };
            util.getAjaxData("selectReply", "/rest/content/boardAdm/selectReply", data, fn_success_selectReply);
        }
    });

    function fn_success_selectReply(dst_id, response) {
        $('#div_reply').empty();
        $('#div_fanboard').empty();
        for(var i=0 ; i<response.data.length; i++){
            var tmp = '<div class="col-md-12 no-padding" style="margin-bottom: 10px;">';
            tmp +=    '<div class="col-md-2">';
            tmp +=      '<form id="profileImg' + i + '" method="post" enctype="multipart/form-data">';
            tmp +=          '<img class="pull-right" id="image_section' + i + '" src="" alt="your image" style="width: 60px;height: 60px"/>';
            tmp +=      '</form>';
            tmp +=     '</div>';
            tmp +=     '<div class="col-md-10">';
            tmp +=      '<label id="nickName' + i + '"></label>';
            if(response.data[i].view_yn == "0"){
                tmp +=      '<i class="fa fa-lock" style="padding-left: 3px;padding-right: 3px"></i>';
            }
            tmp +=      '<label id="userId' + i + '" style="color: #6e696e"></label> - <label id="writeDateFormat' + i + '"></label> <br/>';
            tmp +=      '<lable id="contents' + i + '"></label><br>';
            tmp +=     '</div>';
            tmp +=     '</div>';
            if(response.data[i].depth == "1"){          // fanboard
                $('#div_fanboard').append(tmp + "<br/>");
            }else{                                      // reply
                $('#div_reply').append(tmp);
                $('#image_section' + i).attr('style', "width: 40px;height: 40px");
            }

            $('#nickName' + i).text(response.data[i].nickName);
            $('#userId' + i).text(response.data[i].userId);
            $('#writeDateFormat' + i).text(response.data[i].writeDateFormat);
            $('#contents' + i).text(response.data[i].contents);
            $('#image_section' + i).prop("src" ,common.profileImage(PHOTO_SERVER_URL,response.data[i].profileImage,memSex));

            $('#fanboardModal').modal("show");
        }
    }

    $(document).on('click', '._deleteFanBoard', function() {
        if($(this).data('status') == 2) {
            alert('이미 삭제된 댓글입니다.');
        } else if(confirm("삭제하시겠습니까?")){
            var data = {
                'idx' : $(this).data('idx')
            };
            util.getAjaxData("deleteFanBoard", "/rest/content/boardAdm/deleteFanBoard", data, fn_success_deleteFanBoard);
        }
        return false;
    });

    function fn_success_deleteFanBoard(dst_id, response) {
        alert(response.message);
        fanBoardList();
    }

</script>

<script id="tmp_fanBoardTable" type="text/x-handlebars-template">
    <table id="tb_fanBoardList" class="table table-sorting table-hover table-bordered mt10">
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
            <th rowspan="2">등록 / 수정 <br />/ 삭제</th>
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
                <td>{{{getCommonCodeLabel fan_mem_state 'mem_state'}}}</td>
                <td>{{{sexIcon fan_mem_sex fan_birth_year}}}</td>

                <td>{{{getCommonCodeLabel status 'fanBoard_status'}}}</td>
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



<script id="fanboard_tableSummary" type="text/x-handlebars-template">
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
            <td class="font-bold" style="background-color: #f4b282">{{totalCnt}} ({{secretTotalCnt}})</td>
            <td>{{avgTotalCnt}} ({{secretAvgTotalCnt}})</td>
            <td><span style="color: blue"><span class="font-bold">{{maleCnt}}</span> ({{secretMaleCnt}})</span>
                / <span style="color: red"><span class="font-bold">{{femaleCnt}}</span> ({{secretFemaleCnt}})</span>
                / <span class="font-bold">{{noneCnt}}</span> ({{secretNoneCnt}})</td>
            <td>{{totalDelCnt}} ({{secretTotalDelCnt}})</td>
            <td>{{avgTotalDelCnt}} ({{secretAvgTotalDelCnt}})</td>
        </tr>
    </table>
</script>