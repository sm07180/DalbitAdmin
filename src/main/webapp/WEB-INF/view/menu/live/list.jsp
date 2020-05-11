<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="container-fluid">
            <!-- serachBox -->
            <form id="searchForm">
                <div class="row col-lg-12 form-inline">
                    <input type="hidden" name="pageStart" id="pageStart">
                    <input type="hidden" name="pageCnt" id="pageCnt">
                    <div class="widget widget-table searchBoxArea">
                        <div class="widget-header searchBoxRow">
                            <h3 class="title"><i class="fa fa-search"></i> 실시간 Live</h3>
                            <div>
                                <select class="form-control searchType" name="selectGubun">
                                    <option value="9999" selected="selected">전체</option>
                                    <option value="1">User ID</option>
                                    <option value="2">User 닉네임</option>
                                    <option value="3">연락처</option>
                                    <option value="4">이름</option>
                                </select>
                                <label><input type="text" class="form-control" id="txt_search" name="txt_search"></label>
                                <button type="button" class="btn btn-success" id="bt_search">검색</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            <!-- //serachBox -->

            <%--<div class="row col-lg-12 form-inline">
                <div class="widget widget-table">
                    <div class="widget-header">
                        <h3><i class="fa fa-desktop"></i> 검색결과</h3>
                        <div class="btn-group widget-header-toolbar">
                            <a href="#" title="열기/닫기" class="btn-borderless btn-toggle-expand">
                                <i class="fa fa-chevron-up" id="_searchToggleIcon"></i>
                            </a>
                        </div>
                    </div>
                    <div class="widget-content">
                        <table id="search_info" class="table table-sorting table-hover table-bordered dataTable no-footer"
                               role="grid" aria-describedby="list_info_info">
                            <thead>
                            <tr role="row">
                                <th class="" rowspan="1" colspan="1" aria-label="No." style="width: 20px;">No.</th>
                                <th class="" tabindex="0" aria-controls="list_info" rowspan="1" colspan="1"
                                    aria-label="UserID: 오름차순 정렬" style="width: 100px;">UserID
                                </th>
                                <th class="" tabindex="0" aria-controls="list_info" rowspan="1" colspan="1"
                                    aria-label="닉네임: 오름차순 정렬" style="width: 200px;">닉네임
                                </th>
                                <th class="" tabindex="0" aria-controls="list_info" rowspan="1" colspan="1"
                                    aria-label="이름: 오름차순 정렬" style="width: 100px;">이름
                                </th>
                                <th class="" tabindex="0" aria-controls="list_info" rowspan="1" colspan="1"
                                    aria-label="연락처: 오름차순 정렬" style="width: 100px;">연락처
                                </th>
                                <th class="" tabindex="0" aria-controls="list_info" rowspan="1" colspan="1"
                                    aria-label="가입플랫폼: 오름차순 정렬" style="width: 100px;">가입플랫폼
                                </th>
                                <th class="" tabindex="0" aria-controls="list_info" rowspan="1" colspan="1"
                                    aria-label="접속상태: 오름차순 정렬" style="width: 100px;">접속상태
                                </th>
                                <th class="" tabindex="0" aria-controls="list_info" rowspan="1" colspan="1"
                                    aria-label="생방상태: 오름차순 정렬" style="width: 100px;">생방상태
                                </th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr class="odd">
                                <td valign="top" colspan="8" class="dataTables_empty">검색 결과가 없습니다</td>
                            </tr>
                            </tbody>
                        </table>

                    </div>
                </div>
            </div>--%>

            <!-- DATA TABLE -->
            <div class="row col-lg-12 form-inline block">
                <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist">
                    <li class="tab_select" id="searchSubjectType" name="searchSubjectType"></li>
                    <li class="_tab active">
                        <a href="#recommend" id="recommend" name="recommend" role="tab" data-toggle="tab" data-slcttype="1"><i class="fa fa-home"></i> 추천 DJ</a>
                    </li>
                    <li class="_tab">
                        <a href="#popular" id="popular" name="popular" role="tab" data-toggle="tab" data-slcttype="2"><i class="fa fa-user"></i> 인기 DJ</a>
                    </li>
                    <li class="_tab">
                        <a href="#newbie" id="newbie" name="newbie" role="tab" data-toggle="tab" data-slcttype="3"><i class="fa fa-user"></i> 신입 DJ</a>
                    </li>
                </ul>

                <div>
                    <div>

                        <div class="pt10">
                            <div>- 실시간 Live 추천/인기/신입 DJ Main 노출 수는 대표 총 2명 입니다.</div>
                        </div>

                        <%--<div class="table-option">
                            <label class="control-inline fancy-radio custom-color-green">
                                <input type="radio" name="inline-radio2">
                                <span><i></i>일간</span>
                            </label>
                            <label class="control-inline fancy-radio custom-color-green">
                                <input type="radio" name="inline-radio2">
                                <span><i></i>주간</span>
                            </label>
                            <label class="control-inline fancy-radio custom-color-green">
                                <input type="radio" name="inline-radio2">
                                <span><i></i>월간</span>
                            </label>
                        </div>--%>
                        <div class="dataTables_paginate paging_full_numbers" id="list_info_paginate_top"></div>
                        <div>
                        <table id="list_info" class="table table-sorting table-hover table-bordered" style="margin-top: 10px;">
                            <thead id="tableTop">
                            <tr>
                                <th>프로필 이미지</th>
                                <th>태그부분</th>
                                <th>User ID</th>
                                <th>User 닉네임</th>
                                <th>보유결제금액</th>
                                <th>누적 받은 별</th>
                                <th>누적 받은 선물</th>
                                <th>누적 방송 횟수</th>
                                <th>최초 방송 시작일</th>
                                <th>총 방송 진행 시간</th>
                            </tr>
                            </thead>
                            <tbody id="tableBody"></tbody>
                        </table>
                        </div>
                        <%--<span>
                            <button class="btn btn-default print-btn pull-right mb10" type="button"><i class="fa fa-print"></i>Excel 출력</button>
                        </span>--%>
                        <div class="dataTables_paginate paging_full_numbers" id="list_info_paginate"></div>
                    </div>
                </div>
            </div>
            <!-- DATA TABLE END -->

        </div>
    </div>
</div>

<script type="text/javascript" src="/js/code/commonCode.js"></script>
<script type="text/javascript">
    var livePagingInfo = new PAGING_INFO(0,1,100);

    $(function(){
        init();
        util.getAjaxData("select", "/rest/content/theme/broadcast/list", "", fn_succ_select);
    });

    function init(slctType){
        var data = {
            subject_type : $('#subject_type').val()
            , slctType : common.isEmpty(slctType) ? 1 : slctType
            , pageStart : livePagingInfo.pageNo
            , pageCnt : livePagingInfo.pageCnt
            , selectGubun : $('select[name="selectGubun"]').val()
            , txt_search : $("#txt_search").val()
        };
        util.getAjaxData("liveList", "/rest/menu/live/list", data, fn_succ_list);
    }

    $('#bt_search').on('click', function(){
        init($('._tab.active').find('a').data('slcttype'));
    });

    $('input[id="txt_search"]').on('keydown', function(e) {    // textBox 처리
        if(e.keyCode == 13) {
            init($('._tab.active').find('a').data('slcttype'));
        };
    });

    $('._tab').on('click', function(){
        init($(this).find('a').data('slcttype'));
    });

    function fn_succ_select(dst_id, response) {

        var template = $("#tmp_broadcastSubject").html();
        var templateScript = Handlebars.compile(template);
        var context = response.data;
        var html = templateScript(context);
        $('#searchSubjectType').html(html);

        renderSubjectType();
    }

    function renderSubjectType(){

        $('#subject_type').on('change', function(){
            init($('._tab.active').find('a').data('slcttype'));
        });
    }

    function fn_succ_list(data, response, params) {
        dalbitLog(response);

        var template = $('#tmp_liveList').html();
        var templateScript = Handlebars.compile(template);
        var context = response.data;
        var html = templateScript(context);
        $("#tableBody").html(html);

        var pagingInfo = response.pagingVo;
        livePagingInfo.totalCnt = pagingInfo.totalCnt;
        util.renderPagingNavigation("list_info_paginate_top", livePagingInfo);
        util.renderPagingNavigation("list_info_paginate", livePagingInfo);
    }

    function handlebarsPaging(targetId, pagingInfo){
        livePagingInfo = pagingInfo;
        init($('._tab.active').find('a').data('slcttype'));
    }

</script>

<script type="text/x-handlebars-template" id="tmp_liveList">
    {{#each this as |user|}}
    <tr>
        <td>
            {{#equal image_profile ''}}
            <img src="{{viewImage '/profile_3/profile.jpg'}}" style='height:100px; width:auto;' />
            {{else}}
            <img src="{{renderImage user.image_profile}}" style='height:100px; width:auto;' />
            {{/equal}}
        </td>
        <td>
            {{#equal badge_recomm '1'}} <span class ="label" style="background-color:#d9534f">추천</span><br/> {{/equal}}<br>
            {{#equal badge_popular '1'}} <span class ="label" style="background-color:#3761d9">인기</span><br/> {{/equal}}<br>
            {{#equal badge_newdj '1'}} <span class ="label" style="background-color:#d9c811">신입</span> {{/equal}}
        </td>
        <td>{{mem_id}} <br /> <br />
            레벨 : {{level}} <br />
            등급 : {{grade}}
        </td>
        <td>{{mem_nick}}</td>
        <td>{{money}}</td>
        <td>{{byeol}}</td>
        <td>{{gifted_mem_no}}</td>
        <td>{{airCount}}</td>
        <td>{{convertToDate start_date "YYYY-MM-DD HH:mm:ss"}}</td>
        <td>{{timeStamp airTime}}</td>
    </tr>

    {{else}}
    <tr>
        <td colspan="10">{{isEmptyData}}</td>
    </tr>
    {{/each}}
</script>

<script id="tmp_broadcastSubject" type="text/x-handlebars-template">
    <select name="subject_type" id="subject_type" class="form-control">
        <option value="">전체</option>
        {{#each this as |subject|}}
        <option value = "{{subject.cd}}">{{subject.cdNm}}</option>
        {{/each}}
    </select>
</script>