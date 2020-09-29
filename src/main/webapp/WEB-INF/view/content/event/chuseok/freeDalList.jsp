<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dummyData"><%= java.lang.Math.round(java.lang.Math.random() * 1000000) %></c:set>
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
                        <h3 class="title"><i class="fa fa-search"></i> 검색</h3>
                        <div>
                            <span id="searchArea"></span>
                            <label><input type="text" class="form-control" id="txt_search" name="txt_search"></label>
                            <button type="button" class="btn btn-success" id="bt_search">검색</button>
                        </div>
                    </div>
                </div>
            </div>
            </form>
            <!-- //serachBox -->

            <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist" id="rankTab">
                <%--<li class="active">
                    <a href="javascript://" role="tab" data-toggle="tab" data-rank="shot"><i class="fa fa-home"></i> 인증샷</a>
                </li>
                <li>
                    <a href="javascript://" role="tab" data-toggle="tab" data-rank="knowhow"><i class="fa fa-user"></i> 노하우</a>
                </li>--%>
            </ul>
            <!-- DATA TABLE -->
            <div class="widget widget-table">
                <div class="widget-content" style="border-top-width:0px;">
                    <%--<div class="dataTables_paginate paging_full_numbers" id="list_info_paginate_top"></div>--%>
                    <table id="shotList" class="table table-sorting table-hover table-bordered mt15">
                        <colgroup>
                            <col width="5%"/>
                            <col width="10%"/>
                            <col width="10%"/>
                            <col width="10%"/>
                            <col width="10%"/>
                            <col width="10%"/>
                            <col width="10%"/>
                        </colgroup>
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>회원번호</th>
                                <th>닉네임</th>
                                <th>성별(나이)</th>
                                <th>지급일시</th>
                                <th>지급달</th>
                                <th>레벨</th>
                            </tr>
                        </thead>
                        <tbody id="memberTableBody">
                        </tbody>
                    </table>

                    <div class="dataTables_paginate paging_full_numbers" id="list_info_paginate"></div>

                    <div class="widget-footer">
                        <%--<span>
                            <button class="btn btn-sm btn-danger" type="button" id="deleteBtn"><i class="fa fa-trash-o"></i> 선택삭제</button>
                        </span>--%>
                        <%--<span>
                            <button class="btn btn-sm btn-default print-btn pull-right" type="button" id="excelDownBtn"><i class="fa fa-print"></i> Excel Down</button>
                        </span>--%>
                    </div>
                </div>
            </div>
            <div id="#imageFullSize"></div>
            <!-- // DATA TABLE -->
        </div>
    </div>
</div>
<script type="text/javascript" src="/js/code/menu/menuCodeList.js?${dummyData}"></script>
<script type="text/javascript">
     memberListPagingInfo = new PAGING_INFO(0, 1, 50);

    $(function(){
        $("#searchArea").html(util.getCommonCodeSelect(9999, searchType));
        init();
    });

    function init(){
        var data = {
            rankType : $('input:radio[name="rankType"]:checked').val()
            , pageStart : memberListPagingInfo.pageNo
            , pageCnt : memberListPagingInfo.pageCnt
            , searchType : $('#searchType').val()
            , txt_search : $("#txt_search").val()
        }
        util.getAjaxData('memberList', "/rest/content/event/chuseok/freeDalList", data, fn_succ_list);

        $("#allChk").prop('checked', false);
    }

    function fn_succ_list(dst_id, response, params) {
        var template = $('#tmp_memberList').html();
        var templateScript = Handlebars.compile(template);
        var context = response;
        var html = templateScript(context);
        $("#memberTableBody").html(html);

        var pagingInfo = response.pagingVo;
        memberListPagingInfo.totalCnt = pagingInfo.totalCnt;
        util.renderPagingNavigation('list_info_paginate_top', memberListPagingInfo);
        util.renderPagingNavigation('list_info_paginate', memberListPagingInfo);
    }


    $('#bt_search').on('click', function() {
        init();
    });

    $('input[id="txt_search"]').on('keydown', function(e) {
        if(e.keyCode == 13) {
            init();
        };
    });

    function handlebarsPaging(targetId, pagingInfo){
        memberListPagingInfo = pagingInfo;
        init();
    }
</script>

<script type="text/x-handlebars-template" id="tmp_memberList">
    {{#each this.data as |item|}}
        <tr>
            <td>
                {{idx}}
            </td>
            <td>
                <a href="javascript://" class="_openMemberPop" data-memNo="{{item.mem_no}}">{{item.mem_no}}</a>
            </td>
            <td>{{item.mem_nick}}</td>
            <td>{{{sexIcon item.mem_sex item.mem_birth_year}}}</td>
            <td>{{item.upd_date}}</td>
            <td>{{item.dal}}</td>
            <td>{{item.level}}</td>
        </tr>

        {{else}}
            <tr>
                <td colspan="7">{{isEmptyData}}</td>
            </tr>
        {{/each}}
</script>