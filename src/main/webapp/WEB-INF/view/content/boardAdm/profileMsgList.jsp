<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- table -->
<div class="col-lg-12 no-padding">
    <div class="widget-content">
        <div class="col-md-6 no-padding mt10">
            <span id="searchType_notice" onchange="profileMsgList();"></span>
        </div>
        <div class="col-md-6 no-padding mt10" >
            <span id="noticeTable_summary"></span>
        </div>
        <div class="dataTables_paginate paging_full_numbers" id="profile_paginate_top"></div>
        <table id="noticeTable" class="table table-sorting table-hover table-bordered mt10">
            <colgroup>
                <col width="5%"/>
                <col width="10%"/>
                <col width="15%"/>
                <col width="55%"/>
                <col width="10%"/>
                <col width="5%"/>
            </colgroup>
            <thead>
                <tr>
                    <th>No</th>
                    <th>프로필이미지</th>
                    <th>등록자</th>
                    <th>프로필 메시지 내용</th>
                    <th>최근접속일시</th>
                    <th>삭제</th>
                </tr>
            </thead>
            <tbody id="tb_profileList">
            </tbody>
        </table>
        <div class="dataTables_paginate paging_full_numbers" id="profile_paginate"></div>
    </div>
</div>
<!-- //table -->

<script type="text/javascript" src="/js/code/content/contentCodeList.js?${dummyData}"></script>
<script type="text/javascript">
    var profilePagingInfo = new PAGING_INFO(0,1,40);

    $(document).ready(function() {
        $("#searchType_notice").html(util.getCommonCodeSelect(-1, searchType_notice));
        profileMsgList();
    });

    var memNo;
    function profileMsgList() {
        $('#title').html('회원/방송공지');

        if(!common.isEmpty(memNo) && memNo != null){
            txt_search = memNo;
        }else{
            txt_search = $('#txt_search').val();
        }
        var data = {
            'pageStart': profilePagingInfo.pageNo
            , 'pageCnt' : profilePagingInfo.pageCnt
            , 'mem_no' : txt_search
            , 'sDate' : $("#startDate").val()
            , 'eDate' : $("#endDate").val()
            , 'searchType' : $("select[name='searchType_notice']").val()
        };

        util.getAjaxData("profileMsgList", "/rest/content/boardAdm/profileMsgList", data, fn_success_profileMsgList);
    }

    function fn_success_profileMsgList(dst_id, response, param) {

        var template = $('#tmp_profileMsgTable').html();
        var templateScript = Handlebars.compile(template);
        var context = response;
        var html = templateScript(context);

        $('#tb_profileList').html(html);

        profilePagingInfo.totalCnt = response.pagingVo.totalCnt;
        util.renderPagingNavigation('profile_paginate_top', profilePagingInfo);
        util.renderPagingNavigation('profile_paginate', profilePagingInfo);

    }

    function fn_success_noticeSummary(dst_id, response) {
        var template = $('#notice_tableSummary').html();
        var templateScript = Handlebars.compile(template);
        var context = response.data;
        var html = templateScript(context);

        $('#noticeTable_summary').html(html);
    }

    function handlebarsPaging(targetId, pagingInfo) {
        console.log('ddd')
        console.log(targetId)
        console.log(pagingInfo)
        profilePagingInfo = pagingInfo;
        profileMsgList();
    }

</script>

<script id="tmp_profileMsgTable" type="text/x-handlebars-template">
    {{#each this.data as |data|}}
        <tr>
            <td>{{indexDesc ../pagingVo/totalCnt rowNum}}</td>
            <td><img class="thumbnail fullSize_background" alt="your image" src="{{renderProfileImage image_profile mem_sex}}" style='height:68px; width:68px; margin: auto;' /></td>
            <td>
                <a href="javascript://" class="_openMemberPop" data-memNo="{{mem_no}}">{{mem_no}}</a>
                <br/>
                {{mem_nick}}
            </td>
            <td>{{{replaceEnter msg_profile}}}</td>
            <td>{{last_upd_date}}</td>
            <td class="word-break" style=""><span>{{{replaceHtml contents}}}</span></td>
        </tr>
    {{else}}
        <tr>
            <td colspan="9">{{isEmptyData}}</td>
        </tr>
    {{/each}}
</script>

<script id="notice_tableSummary" type="text/x-handlebars-template">
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