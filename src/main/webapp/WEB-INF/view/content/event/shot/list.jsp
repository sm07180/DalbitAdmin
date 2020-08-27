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
                    <form>
                    <table id="shotList" class="table table-sorting table-hover table-bordered mt15">
                        <colgroup>
                            <col width="2%"/>
                            <col width="3%"/>
                            <col width="10%"/>
                            <col width="5%"/>
                            <col width="5%"/>
                            <col width="10%"/>
                            <col width="5%"/>
                            <col width="5%"/>
                            <col width="*"/>
                        </colgroup>
                        <thead>
                            <tr>
                                <th><input type="checkbox" id="allChk" /></th>
                                <th>No</th>
                                <th>인증샷 이미지</th>
                                <th>회원번호</th>
                                <th>UID</th>
                                <th>닉네임</th>
                                <th>성별(나이)</th>
                                <th>참여일시</th>
                                <th>내용</th>
                            </tr>
                        </thead>
                        <tbody id="shotTableBody">
                        </tbody>
                    </table>

                    <div class="dataTables_paginate paging_full_numbers" id="list_info_paginate"></div>

                    <div class="btn-toolbar pb10">
                        <div class="btn-group" role="group">
                            <button type="button" class="btn btn-sm btn-danger" id="deleteBtn"><i class="fa fa-trash-o"></i>선택삭제</button>
                        </div>
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
     shotListPagingInfo = new PAGING_INFO(0, 1, 50);

    $(function(){
        $("#searchArea").html(util.getCommonCodeSelect(9999, searchType));
        init();
    });

    function init(){
        var data = {
            rankType : $('input:radio[name="rankType"]:checked').val()
            , pageStart : shotListPagingInfo.pageNo
            , pageCnt : shotListPagingInfo.pageCnt
            , searchType : $('#searchType').val()
            , txt_search : $("#txt_search").val()
        }
        util.getAjaxData('shotList', "/rest/content/event/photo/shot/list", data, fn_succ_list);

        $("#allChk").prop('checked', false);
    }

    function fn_succ_list(dst_id, response, params) {
        var template = $('#tmp_shotList').html();
        var templateScript = Handlebars.compile(template);
        var context = response;
        var html = templateScript(context);
        $("#shotTableBody").html(html);

        var pagingInfo = response.pagingVo;
        shotListPagingInfo.totalCnt = pagingInfo.totalCnt;
        util.renderPagingNavigation('list_info_paginate_top', shotListPagingInfo);
        util.renderPagingNavigation('list_info_paginate', shotListPagingInfo);
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
        shotListPagingInfo = pagingInfo;
        init();
    }

    $(document).on('click', '#allChk', function(){
       var me = $(this);
       if(me.prop('checked')){
           $('._chk').prop('checked', true);
       }else{
           $('._chk').prop('checked', false);
       }
    });

    $(document).on('click', '#deleteBtn', function(){
       console.log('삭제');
        var checked = $('._chk:checked')
        if(0 == checked.length){
            alert('삭제할 데이터가 없습니다.');
            return false;
        }

        if(confirm(checked.length+'개의 인증샷을 삭제하시겠습니까?')){
            var idxs = '';
            checked.each(function(){
                idxs += $(this).data('idx') + ',';
            });

            var data = {
                idxs : idxs
            }
            util.getAjaxData('shotList', "/rest/content/event/photo/shot/delete", data, function(dist_id, response){
                alert(checked.length+'개의 인증샷이 삭제되었습니다.');
                init();
            });
        }
    });
</script>

<script type="text/x-handlebars-template" id="tmp_shotList">
    {{#each this.data as |item|}}
        <tr>
            <td>
                <input type='checkbox' class='_chk' data-idx='{{item.idx}}' />
            </td>
            <td>
                {{indexDesc ../pagingVo.totalCnt item.rowNum}}
            </td>
            <td style="width: 50px">
                <img class="thumbnail fullSize_background" src="{{renderImage item.image_url}}" style='height:auto; width:100%;margin-bottom: 0px' />
            </td>
            <td>
                <a href="javascript://" class="_openMemberPop" data-memNo="{{item.mem_no}}">{{item.mem_no}}</a>
            </td>
            <td>{{item.mem_userid}}</td>
            <td>{{item.mem_nick}}</td>
            <td>{{{sexIcon item.mem_sex item.mem_birth_year}}}</td>
            <td>{{item.reg_date}}</td>
            <td>{{item.contents}}</td>
        </tr>

        {{else}}
            <tr>
                <td colspan="9">{{isEmptyData}}</td>
            </tr>
        {{/each}}
</script>