<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- table -->
<div class="col-lg-12 no-padding">
    <div class="widget-content">
        <div class="col-md-6 no-padding mt10">
            <span id="searchType_broadNotice" onchange="broadNoticeList();"></span>
        </div>
        <div class="col-md-6 no-padding mt10" >
            <span id="broadNoticeTable_summary"></span>
        </div>
        <div class="dataTables_paginate paging_full_numbers" id="broadNotice_paginate_top"></div>
        <table id="broadNoticeTable" class="table table-sorting table-hover table-bordered mt10">
            <colgroup>
                <col width="1%"/><col width="3%"/><col width="3%"/><col width="5%"/><col width="9%"/>
                <col width="7%"/><col width="15%"/><col width="9%"/><col width="15%"/>
            </colgroup>
            <thead>
            <tr>
                <th rowspan="2"></th>
                <th rowspan="2">No</th>
                <th rowspan="3">번호</th>
                <th rowspan="2">구분</th>
                <th colspan="3">회원정보</th>
                <th rowspan="2">보낸일시</th>
                <th rowspan="2">상태</th>
                <th rowspan="2">내용</th>
            </tr>
            <tr>
                <th>닉네임</th>
                <th>성별(나이)</th>
                <th>방송제목</th>
            </tr>
            </thead>
            <tbody id="tb_broadNoticeList">
            </tbody>
        </table>
        <div class="dataTables_paginate paging_full_numbers" id="broadNotice_paginate"></div>
        <input type="button" value="선택삭제" class="btn btn-danger btn-sm" id="btn_broadNoticeDelBtn" style="margin-right: 3px;"/>
    </div>
</div>
<!-- //table -->

<script type="text/javascript" src="/js/code/content/contentCodeList.js?${dummyData}"></script>
<script type="text/javascript">
    var broadNoticePagingInfo = new PAGING_INFO(0,1,40);

    $(document).ready(function() {
        $("#searchType_broadNotice").html(util.getCommonCodeSelect(-1, searchType_notice, "N", "searchType_broadNotice"));
    });

    var memNo;
    function broadNoticeList(pagingInfo) {
        $('#title').html('회원/방송공지');
        if(!common.isEmpty(pagingInfo)){
            broadNoticePagingInfo.pageNo = pagingInfo;
        }else{
            broadNoticePagingInfo.pageNo = 1;
        }

        if(!common.isEmpty(memNo) && memNo != null){
            txt_search = memNo;
        }else{
            txt_search = $('#txt_search').val();
        }
        var data = {
            'pageNo': broadNoticePagingInfo.pageNo
            , 'pageCnt' : broadNoticePagingInfo.pageCnt
            , 'mem_no' : txt_search
            , 'sDate' : $("#startDate").val()
            , 'eDate' : $("#endDate").val()
            , 'searchType' : $("select[name='searchType_broadNotice']").val()
        };

        util.getAjaxData("noticeList", "/rest/content/boardAdm/noticeList", data, fn_success_broadNoticeList);
    }

    function fn_success_broadNoticeList(dst_id, response, param) {

        for(var i=0 ; i<response.data.length;i++){
            response.data[i].contents = response.data[i].contents.replace(/\\n/gi,"<br/>");
        }

        var template = $('#tmp_broadNoticeTable').html();
        var templateScript = Handlebars.compile(template);
        var context = response;
        var html = templateScript(context);

        $('#tb_broadNoticeList').html(html);

        broadNoticePagingInfo.totalCnt = response.pagingVo.totalCnt;
        util.renderPagingNavigation('broadNotice_paginate_top', broadNoticePagingInfo);
        util.renderPagingNavigation('broadNotice_paginate', broadNoticePagingInfo);

        if(response.data.length == 0) {
            $("broadNoticeList").find("#broadNotice_paginate_top").hide();
            $("broadNoticeList").find('#broadNotice_paginate').hide();
        } else {
            $("broadNoticeList").find("#broadNotice_paginate_top").show();
            $("broadNoticeList").find('#broadNotice_paginate').show();
        }

        util.getAjaxData("broadNoticeListSummary", "/rest/content/boardAdm/noticeList/summary", param, fn_success_broadNoticeSummary);
    }

    function fn_success_broadNoticeSummary(dst_id, response) {
        var template = $('#broadNotice_tableSummary').html();
        var templateScript = Handlebars.compile(template);
        var context = response.data;
        var html = templateScript(context);

        $('#broadNoticeTable_summary').html(html);
    }

    $("#btn_broadNoticeDelBtn").on("click", function () { //선택삭제
        var checkeds = $("#tb_broadNoticeList").find('._chk:checked');
        if(0 == checkeds.length){
            alert('삭제할 공지사항을 선택해주세요.');
            return false;
        }

        if(confirm(checkeds.length +'건을 삭제하시겠습니까?')){
            var broadNoticeIdx = [];
            var nociceType = [];
            checkeds.each(function(){
                broadNoticeIdx.push($(this).data('broadNoticeidx'));
                nociceType.push($(this).data('type'));
            });

            var data = {
                broadNoticeIdx : JSON.stringify(broadNoticeIdx),
                nociceType : JSON.stringify(nociceType)
            };

            console.log(data);
            util.getAjaxData("delete", "/rest/member/notice/delete",data, broadNoticeDel_success);
        }
    });

    function handlebarsPaging(targetId, pagingInfo) {
        broadNoticePagingInfo = pagingInfo;
        broadNoticeList(pagingInfo.pageNo);
    }

    function broadNoticeDel_success(dst_id, response){
        alert(response.message);
        broadNoticeList();
    }

</script>

<script id="tmp_broadNoticeTable" type="text/x-handlebars-template">
    {{#each this.data as |data|}}
        <tr>
            <td><input class="_chk" type="checkbox" data-broadNoticeIdx="{{idx}}" data-type="{{type}}"/></td>
            <td>{{indexDesc ../pagingVo/totalCnt rowNum}}</td>
            <td>{{idx}}</td>
            <td>
                {{#equal type '1'}}
                <span style="color: blue;">회원공지</span>
                {{else}}
                <span style="color: red;">방송공지</span>
                {{/equal}}
            </td>
            <td>
                <a href="javascript://" class="_openMemberPop" data-memNo="{{mem_no}}">{{mem_no}}</a>
                <br/>
                {{mem_nick}}
            </td>
            <td>{{{sexIcon mem_sex mem_birth_year}}}</td>
            <td><a href="javascript://" class="_openBroadcastPop" data-roomNo="{{room_no}}">{{replaceHtml title}}</a></td>
            <td>{{lastUpdDateFormat}}</td>
            <td>등록</td>
            <td class="word-break" style=""><span>{{{replaceHtml contents}}}</span></td>
        </tr>
    {{else}}
        <tr>
            <td colspan="9">{{isEmptyData}}</td>
        </tr>
    {{/each}}
</script>

<script id="broadNotice_tableSummary" type="text/x-handlebars-template">
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