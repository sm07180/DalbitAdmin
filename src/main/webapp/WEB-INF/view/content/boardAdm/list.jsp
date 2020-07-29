<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="wrapper">
    <div id="page-wrapper">
        <!-- serachBox -->
        <div class="row col-lg-12 form-inline">
            <div class="widget widget-table searchBoxArea">
                <div class="widget-header searchBoxRow">
                    <h3 class="title"><i class="fa fa-search"></i><span id="title"/></h3>
                    <div>
                        <span id="searchRadio"></span>
                        <div class="input-group date" id="data_startSel">
                            <label for="start_sel" class="input-group-addon">
                                <span><i class="glyphicon glyphicon-calendar" id="i_startSel"></i></span>
                            </label>
                            <input type="text" class="form-control" id="start_sel" name="start_sel">
                            <%--<input type="hidden" id="txt_startSel" name="txt_startSel">--%>
                        </div>
                        <label>~</label>
                        <div class="input-group date" id="data_endSel">
                            <label for="end_sel" class="input-group-addon">
                                <span><i class="glyphicon glyphicon-calendar" id="i_endSel"></i></span>
                            </label>
                            <input type="text" class="form-control" id="end_sel" name="end_sel">
                            <%--<input type="hidden" id="txt_endSel" name="txt_endSel">--%>
                        </div>
                        <span id="searchType"></span>
                        <label><input type="text" class="form-control" id="txt_search" placeholder="검색할 정보를 입력하세요"></label>
                        <button type="submit" class="btn btn-success" id="bt_search">검색</button>
                        <a href="javascript://" class="_prevSearch">[이전]</a>
                        <a href="javascript://" class="_todaySearch">[오늘]</a>
                        <a href="javascript://" class="_nextSearch">[다음]</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- //serachBox -->

        <!-- tab -->
        <div class="row col-lg-12 form-inline">
            <ul class="nav nav-tabs nav-tabs-custom-colored mt5">
                <li><a href="#noticeList" role="tab" data-toggle="tab" id="tab_noticeList" onclick="">회원/방송공지</a></li>
                <li><a href="#profileMsgList" role="tab" data-toggle="tab" id="tab_profileMsgList" onclick="">프로필메세지</a></li>
                <li><a href="#fanBoardList" role="tab" data-toggle="tab" id="tab_fanBoardList" onclick="">팬보드</a></li>
                <li><a href="#storyList" role="tab" data-toggle="tab" id="tab_storyList" onclick="storyList();">사연</a></li>
                <li><a href="#banWordList" role="tab" data-toggle="tab" id="tab_banWordList" onclick="">금지어</a></li>
            </ul>
        </div>
        <!-- //tab -->

        <!-- table -->
        <div class="row col-lg-12 form-inline">
            <div class="tab-content no-padding">
                <div class="tab-pane fade in active" id="storyList">       <!-- 회원 -->
                    <div class="widget-content">
                        <div class="dataTables_paginate paging_full_numbers" id="list_info_paginate_top"></div>
                        <div id="storyTable"></div>
                        <div class="dataTables_paginate paging_full_numbers" id="list_info_paginate"></div>
                    </div>
                </div>
            </div>
        </div>
        <!-- //table -->
    </div> <!-- //page-wrapper -->
</div> <!-- //wrapper -->

<script type="text/javascript" src="/js/code/content/contentCodeList.js?${dummyData}"></script>
<script type="text/javascript">
    var StoryPagingInfo = new PAGING_INFO(0,1,100);

    $(document).ready(function() {
        // active 속성을 가진 id의 이름 ==
        $('#title').html('사연검색');
        $('#searchRadio').html(util.getCommonCodeRadio('3', story_searchRadio));
        $('#searchType').html(util.getCommonCodeSelect('-1', story_searchSelect));
        init();
        storyList();
    });

    $('input[id="txt_search"]').keydown(function(e) {
        if(e.keyCode == 13) {
            compare();
            StoryPagingInfo.pageNo = 1;
            storyList();
        }
    });

    $('#bt_search').on('click', function() {
        compare();
        StoryPagingInfo.pageNo = 1;
        storyList();
    });

    function init() {
        var date = new Date();
        var thisYear = date.getFullYear();
        var thisMonth = date.getMonth() + 1;
        $('#start_sel').datepicker("setDate", thisYear + "." + thisMonth + ".01");
        $('#end_sel').datepicker("setDate", date);
    }

    $('#searchRadio').on('change', function() {
       var val =  $('input[name="searchRadio"]:checked').val();
       if(val == 1 || val == 2) {
           $("#start_sel, #end_sel").prop("disabled", true);
       } else {
           $("#start_sel, #end_sel").prop("disabled", false);
       }
    });

    function compare() {
        var startSel = $('#start_sel').val().format('YYYYMMDD');
        alert(startSel);
    }

    function storyList() {
        var data = {
            'pageStart': StoryPagingInfo.pageNo
            , 'pageCnt' : StoryPagingInfo.pageCnt
            , 'txt_search' : $('#txt_search').val()
            , 'searchType' : $('select[name="searchType"]').find('option:selected').val()
            , 'start_sel' : $('#start_sel').val()
            , 'end_sel' : $('#end_sel').val()
        };
        util.getAjaxData("storyList", "/rest/content/boardAdm/storyList", data, fn_success_storyList);
    }

    function fn_success_storyList(dst_id, response) {
        var template = $('#tmp_storyTable').html();
        var templateScript = Handlebars.compile(template);
        var context = response;
        var html = templateScript(context);

        $('#storyTable').html(html);

        StoryPagingInfo.totalCnt = response.pagingVo.totalCnt;
        util.renderPagingNavigation('list_info_paginate_top', StoryPagingInfo);
        util.renderPagingNavigation('list_info_paginate', StoryPagingInfo);

        if(response.data.length == 0) {
            $("#list_info_paginate_top").hide();
            $('#list_info_paginate').hide();
        } else {
            $("#list_info_paginate_top").show();
            $('#list_info.paginate').show();
        }
    }

    function handlebarsPaging(targetId, pagingInfo) {
        StoryPagingInfo = pagingInfo;
        storyList();
    }

</script>

<script id="tmp_storyTable" type="text/x-handlebars-template">
    <table id="tb_storyList" class="table table-sorting table-hover table-bordered mt10">
        <thead>
        <tr>
            <th rowspan="2">No</th>
            <th colspan="3">대상회원</th>
            <th colspan="2">보낸회원</th>
            <th rowspan="2">보낸 일시</th>
            <th rowspan="2">사연 내용</th>
            <th rowspan="2">삭제</th>
        </tr>
        <tr>
            <th>닉네임</th>
            <th>성별 <br />(나이)</th>
            <th>방송제목</th>
            <th>닉네임</th>
            <th>성별 <br />(나이)</th>
        </tr>
        </thead>
        <colgroup>
            <col width="3%"/>
            <col width="10%"/>
            <col width="10%"/>
            <col width="15%"/>
            <col width="10%"/>
            <col width="10%"/>
            <col width="10%"/>
            <col width="20%"/>
            <col width="10%"/>
        </colgroup>
        <tbody>
        {{#each this.data as |data|}}
        <tr>
            <td>{{indexDesc ../pagingVo.totalCnt rowNum}}</td>
            <td>
                {{^equal dj_mem_nick ''}}
                {{../dj_mem_nick}}
                {{else}}
                -
                {{/equal}}
            </td>
            <td>
                {{^equal dj_mem_sex ''}}
                {{{sexIcon ../dj_mem_sex ../dj_birth_year}}}
                {{else}}
                -
                {{/equal}}
            </td>
            <td>{{title}}</td>
            <td>
                {{^equal send_mem_nick ''}}
                {{../send_mem_nick}}
                {{else}}
                -
                {{/equal}}
            </td>
            <td>
                {{^equal send_mem_sex ''}}
                {{{sexIcon ../send_mem_sex ../send_birth_year}}}
                {{else}}
                -
                {{/equal}}
            </td>
            <td>{{convertToDate send_date "YYYY.MM.DD HH:mm:ss"}}</td>
            <td class="word-break">{{story_content}}</td>
            <td><a href="javascript://">[삭제]</a></td>
        </tr>
        {{else}}
        <tr>
            <td colspan="9">{{isEmptyData}}</td>
        </tr>
        {{/each}}
        </tbody>
    </table>
</script>