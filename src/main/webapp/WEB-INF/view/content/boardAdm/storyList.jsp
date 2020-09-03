<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- table -->
<div class="no-padding col-lg-12 form-inline">
    <div class="tab-content no-padding">
        <div class="col-md-12 no-padding mt10 mb5">
            <span class="mb5" id="storyListCnt"></span>
        </div>
        <div class="col-md-12 no-padding">
            <span id="searchType_story" onchange="storyList();"></span>
        </div>
        <div class="tab-pane fade in active" id="storyList">
            <div class="widget-content">
                <div class="dataTables_paginate paging_full_numbers" id="story_paginate_top"></div>
                <div id="storyTable"></div>
                <div class="dataTables_paginate paging_full_numbers" id="story_paginate"></div>
            </div>
        </div>
    </div>
</div>
<!-- //table -->

<script type="text/javascript" src="/js/code/content/contentCodeList.js?${dummyData}"></script>
<script type="text/javascript">
    var StoryPagingInfo = new PAGING_INFO(0,1,100);

    $(document).ready(function() {
        $("#searchType_story").html(util.getCommonCodeSelect(-1, searchType_story));
        storyList();
    });

    function storyList() {
        $('#title').html('사연검색');

        var data = {
            'pageStart': StoryPagingInfo.pageNo
            , 'pageCnt' : StoryPagingInfo.pageCnt
            , 'txt_search' : $('#txt_search').val()
            // , 'searchType' : $('select[name="searchType"]').find('option:selected').val()
            , 'start_sel' : $("#startDate").val()
            , 'end_sel' : $("#endDate").val()
            , 'searchType' : $("select[name='searchType_story']").val()
        };

        console.log(data);
        util.getAjaxData("storyList", "/rest/content/boardAdm/storyList", data, fn_success_storyList);
    }

    function fn_success_storyList(dst_id, response) {
        var sendMemMaleCnt=0;
        var sendMemFemaleCnt=0;
        var sendMemNoneCnt=0;

        for(var i=0;i<response.data.length;i++){
            if(response.data[i].send_mem_sex == "m"){
                ++sendMemMaleCnt;
            }else if (response.data[i].send_mem_sex == "f"){
                ++sendMemFemaleCnt;
            }else if (response.data[i].send_mem_sex == "n"){
                ++sendMemNoneCnt;
            }
        }

        $("#storyListCnt").html(
            '<span style="color:black">[검색결과 : ' +  response.data.length + '건]</span>' +
            '<span style="color: blue;">[남' + sendMemMaleCnt + "건]</span>" + "," +
            '<span style="color: red;">[여' + sendMemFemaleCnt + "건]</span>" + "," +
            '<span style="color: #555555;">[알수없음' + sendMemNoneCnt + "건]</span>"
        );
        var template = $('#tmp_storyTable').html();
        var templateScript = Handlebars.compile(template);
        var context = response;
        var html = templateScript(context);

        $("#tab_storyList").text("사연" + "(" + response.data.length +")");

        $('#storyTable').html(html);

        StoryPagingInfo.totalCnt = response.pagingVo.totalCnt;
        util.renderPagingNavigation('story_paginate_top', StoryPagingInfo);
        util.renderPagingNavigation('story_paginate', StoryPagingInfo);
        StoryPagingInfo.pageNo=1;

        if(response.data.length == 0) {
            $("storyList").find("#story_paginate_top").hide();
            $("storyList").find('#story_paginate').hide();
        } else {
            $("storyList").find("#story_paginate_top").show();
            $("storyList").find('#story_paginate').show();
        }
    }



    $(document).on('click', '._deleteStory', function() {
        if(confirm('삭제하시겠습니까?')){
            var data = {
                storyIdx: $(this).data('storyidx')
                , room_no: $(this).data('roomno')
            };
            util.getAjaxData("deleteStory", "/rest/content/boardAdm/deleteStory", data, fn_success_deleteStory);
        }
        return false;
    });

    function fn_success_deleteStory(dst_id, response) {
        alert(response.message);
        storyList();
    }


</script>

<script id="tmp_storyTable" type="text/x-handlebars-template">
    <table id="tb_storyList" class="table table-sorting table-hover table-bordered mt10">

        <colgroup>
            <col width="3%"/><col width="5%"/><col width="15%"/><col width="10%"/><col width="10%"/>
            <col width="17%"/><col width="11%"/><col width="11%"/><col width="11%"/>
        </colgroup>

        <thead>
        <tr>
            <th>No</th>
            <th>방송중</th>
            <th>방송제목</th>
            <th>방송DJ</th>
            <th>등록자</th>
            <th>사연내용</th>
            <th>등록일시</th>
            <th style="width: 70px">처리</th>
            <th>삭제</th>
        </tr>
        </thead>

        <tbody>
        {{#each this.data as |data|}}
        <tr>
            <td>{{indexDesc ../pagingVo.totalCnt rowNum}}</td>
            <td>
                {{#dalbit_if broState '!=' 4}}ON{{/dalbit_if}}
            </td>
            <td>
                {{{roomNoLink title room_no}}}
            </td>
            <td>
                {{^equal dj_mem_nick ''}}
                {{{memNoLink_sex ../dj_mem_no ../dj_mem_no ../dj_mem_sex}}}<br/>
                {{{memNoLink_sex ../dj_mem_nick ../dj_mem_no ../dj_mem_sex}}}
                {{else}}
                (탈퇴한 회원)
                {{/equal}}
            </td>
            <td>
                {{^equal send_mem_nick ''}}
                {{{memNoLink_sex ../send_mem_no ../send_mem_no ../send_mem_sex}}}<br/>
                {{{memNoLink_sex ../send_mem_nick ../send_mem_no ../send_mem_sex}}}
                {{else}}
                (탈퇴한 회원)
                {{/equal}}
            </td>
            <td class="word-break">{{replaceHtml story_content}}</td>
            <td>{{convertToDate send_date "YYYY.MM.DD HH:mm:ss"}}</td>
            <td style="width: 70px">
                {{#dalbit_if broState '==' 4}}
                    <span class="font-bold">종료됨</span>
                {{else}}
                    {{#dalbit_if status '==' 1}}
                        <span class="font-bold" style="color: red">삭제됨</span>
                    {{/dalbit_if}}
                {{/dalbit_if}}
            </td>
            <td><div style="width:45px;"><a href="javascript://" class="_deleteStory" data-storyidx="{{data.storyIdx}}" data-roomno="{{data.room_no}}">[삭제]</a></div></td>
        </tr>
        {{else}}
        <tr>
            <td colspan="9">{{isEmptyData}}</td>
        </tr>
        {{/each}}
        </tbody>
    </table>
</script>