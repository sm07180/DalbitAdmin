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

                        <div>
                            <ul class="nav nav-tabs nav-tabs-custom-colored pt15" role="tablist" id="deviceTab">
                                <li class="active">
                                    <a href="javascript://" role="tab" data-toggle="tab" data-slct_type="0"> 전체</a>
                                </li>
                                <li>
                                    <a href="javascript://" role="tab" data-toggle="tab" data-slct_type="1"> PC</a>
                                </li>
                                <li>
                                    <a href="javascript://" role="tab" data-toggle="tab" data-slct_type="2"> 모바일</a>
                                </li>

                                <div class="pull-right">
                                    <input type="checkbox" id="slct_order" class="_searchChk" /> <label for="slct_order">추천순으로 보기</label>
                                    <input type="checkbox" id="only_check" class="_searchChk" /> <label for="only_check">내부 채택 글 보기</label>
                                </div>
                            </ul>
                        </div>

                        <table id="shotList" class="table table-sorting table-hover table-bordered">
                        <colgroup>
                            <col width="2%"/>
                            <col width="3%"/>
                            <col width="10%"/>
                            <col width="5%"/>
                            <col width="5%"/>
                            <col width="10%"/>
                            <col width="5%"/>
                            <col width="5%"/>
                            <col width="15%"/>
                            <col width="5%"/>
                            <col width="5%"/>
                            <col width="5%"/>
                            <col width="5%"/>
                            <col width="5%"/>
                            <col width="10%"/>
                            <col width="5%"/>
                            <col width="5%"/>
                        </colgroup>
                        <thead>
                            <tr>
                                <th><input type="checkbox" id="allChk" /></th>
                                <th>No</th>
                                <th>대표이미지</th>
                                <th>회원번호</th>
                                <th>UID</th>
                                <th>닉네임</th>
                                <th>성별(나이)</th>
                                <th>참여일시</th>
                                <th>제목</th>
                                <th>추천수</th>
                                <th>조회수</th>
                                <th>구분</th>
                                <th>디바이스</th>
                                <th>기종1</th>
                                <th>기종2</th>
                                <th>채택</th>
                                <th>상세</th>
                            </tr>
                        </thead>
                        <tbody id="shotTableBody">
                        </tbody>
                    </table>

                    <div class="dataTables_paginate paging_full_numbers" id="list_info_paginate"></div>

                    <div class="widget-footer">
                        <span>
                            <button class="btn btn-sm btn-danger" type="button" id="deleteBtn"><i class="fa fa-trash-o"></i> 선택삭제</button>
                        </span>
                        <span>
                            <button class="btn btn-sm btn-default print-btn pull-right" type="button" id="excelDownBtn"><i class="fa fa-print"></i> Excel Down</button>
                        </span>
                    </div>
                </div>
            </div>
            <div id="#imageFullSize"></div>
            <!-- // DATA TABLE -->

            <div class="mt15" id="knowhowDetailArea" style="display:none;"></div>
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
            , slct_type : $('#deviceTab li.active a').data('slct_type')
            , slct_order : $('#slct_order').prop('checked') ? 1 : 0
            , only_check : $('#only_check').prop('checked') ? 1 : 0
        }
        util.getAjaxData('shotList', "/rest/content/event/knowhow/list", data, fn_succ_list);

        $("#allChk").prop('checked', false);
    }

    function fn_succ_list(dst_id, response, params) {
        var template = $('#tmp_knowhowList').html();
        var templateScript = Handlebars.compile(template);
        var context = response;
        var html = templateScript(context);
        $("#shotTableBody").html(html);

        var pagingInfo = response.pagingVo;
        shotListPagingInfo.totalCnt = pagingInfo.totalCnt;
        util.renderPagingNavigation('list_info_paginate_top', shotListPagingInfo);
        util.renderPagingNavigation('list_info_paginate', shotListPagingInfo);
    }


    $('#bt_search, ._searchChk').on('click', function() {
        init();
    });

    $('input[id="txt_search"]').on('keydown', function(e) {
        if(e.keyCode == 13) {
            init();
        };
    });

    $("#deviceTab li").on('click', function(){
        $('#deviceTab li').removeClass('active');
        $(this).addClass('active');
        init();
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
        var checked = $('._chk:checked')
        if(0 == checked.length){
            alert('삭제할 데이터가 없습니다.');
            return false;
        }

        if(confirm(checked.length+'건을 삭제하시겠습니까?')){
            var idxs = '';
            checked.each(function(){
                idxs += $(this).data('idx') + ',';
            });

            var data = {
                idxs : idxs
            }
            util.getAjaxData('delete', "/rest/content/event/knowhow/delete", data, function(dist_id, response){
                alert(checked.length+'건이 삭제되었습니다.');
                init();
            });
        }
    });

     $(document).on('click', '.onoffswitch-checkbox' , function(event){
         var me = $(this);
         var msg = '채택을 취소 하시겠습니까?';
         if(me.prop('checked')){
             msg = '채택 하시겠습니까?';
         }

         if(confirm(msg)){
             var data = {
                 idx : me.prop('name')
                 , is_check : me.prop('checked') ? 1 : 0
             }
             util.getAjaxData('good', "/rest/content/event/knowhow/good", data, function(dist_id, response){

             });
         }else{
             event.preventDefault();
         }
     });

     $(document).on('click', '._detailBtn', function(){
         var me = $(this);
         var data = {
             idx : me.data('idx')
         }
         util.getAjaxData('good', "/rest/content/event/knowhow/detail", data, function(dist_id, response){
             var template = $('#tmp_knowhowDetail').html();
             var templateScript = Handlebars.compile(template);
             var context = response.data;
             var html = templateScript(context);
             $("#knowhowDetailArea").html(html).show();
             ui.bottomScroll();
         });
     });

     $('#excelDownBtn').on('click', function() {
         var formElement = document.querySelector("form");
         var formData = new FormData(formElement);

         formData.append("txt_search", $("#txt_search").val());
         formData.append("searchType", $('#searchType').val());
         formData.append("pageCnt", 99999);
         formData.append("pageStart", 1);

         util.excelDownload($(this), "/rest/content/event/knowhow/excel", formData);
     });

     function handlebarsPaging(targetId, pagingInfo) {

         shotListPagingInfo = pagingInfo;
         init();
     }
</script>

<script type="text/x-handlebars-template" id="tmp_knowhowList">
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
        <td>{{{fontColor item.title 0 }}}</td>
        <td>{{item.good_cnt}}</td>
        <td>{{item.view_cnt}}</td>
        <td>
            {{#equal item.slct_device 1}}pc{{/equal}}
            {{#equal item.slct_device 2}}pc{{/equal}}
            {{#equal item.slct_device 3}}모바일{{/equal}}
            {{#equal item.slct_device 4}}모바일{{/equal}}
            {{#equal item.slct_device 5}}모바일{{/equal}}
        </td>
        <td>
            {{#equal item.slct_device 1}}데스크탑{{/equal}}
            {{#equal item.slct_device 2}}노트북/맥북{{/equal}}
            {{#equal item.slct_device 3}}안드로이드폰{{/equal}}
            {{#equal item.slct_device 4}}아이폰{{/equal}}
            {{#equal item.slct_device 5}}태블릿{{/equal}}
        </td>
        <td>{{item.device1}}</td>
        <td>{{item.device2}}</td>
        <td>{{{getOnOffSwitch item.is_check item.idx}}}</td>
        <td><button type="button" class="btn btn-sm btn-default _detailBtn" data-idx="{{item.idx}}">상세</button></td>
    </tr>

    {{else}}
        <tr>
            <td colspan="17">{{isEmptyData}}</td>
        </tr>
    {{/each}}
</script>

<script type="text/x-handlebars-template" id="tmp_knowhowDetail">
    <div class="widget widget-table">
        <div class="widget-header">
        <h3><i class="fa fa-desktop"></i> 노하우 세부내용</h3>
    </div>
    <div class="widget-content mt15 mb15">

        <div class="col-lg-12 form-inline mb15">
            <div class="row">
                <div class="col-sm-4">
                    <img src="{{image_url}}" width="100%" height="auto" style="border:1px solid gray" class="thumbnail fullSize_background" />
                </div>
                <div class="col-sm-4">
                    {{^equal image_url2 ''}}
                        <img src="{{../image_url2}}" width="100%" height="auto" style="border:1px solid gray" class="thumbnail fullSize_background" />
                    {{/equal}}
                </div>
                <div class="col-sm-4">
                    {{^equal image_url3 ''}}
                        <img src="{{../image_url3}}" width="100%" height="auto" style="border:1px solid gray" class="thumbnail fullSize_background" />
                    {{/equal}}
                </div>
            </div>
        </div>

        <div class="row col-lg-12 form-inline">
            <table class="table table-bordered table-dalbit">
                <colgroup>
                    <col width="10%">
                    <col width="20%">
                    <col width="10%">
                    <col width="20%">
                    <col width="10%">
                    <col width="20%">
                </colgroup>
                <tbody>
                    <tr>
                        <th>닉네임</th>
                        <td>{{mem_nick}}</td>
                        <th>구분</th>
                        <td>
                            {{#equal slct_device '1'}}PC{{/equal}}
                            {{#equal slct_device '2'}}PC{{/equal}}
                            {{#equal slct_device '3'}}모바일{{/equal}}
                            {{#equal slct_device '4'}}모바일{{/equal}}
                            {{#equal slct_device '5'}}모바일{{/equal}}
                        </td>
                        <th>디바이스</th>
                        <td>
                            {{#equal slct_device '1'}}데스크탑{{/equal}}
                            {{#equal slct_device '2'}}노트북/맥북{{/equal}}
                            {{#equal slct_device '3'}}안드로이드{{/equal}}
                            {{#equal slct_device '4'}}아이폰{{/equal}}
                            {{#equal slct_device '5'}}태블릿{{/equal}}
                        </td>
                    </tr>
                    <tr>
                        <th>참여일시</th>
                        <td>{{reg_date}}</td>
                        <th>
                            {{#equal slct_device '1'}}PC[마이크]{{/equal}}
                            {{#equal slct_device '2'}}PC[마이크]{{/equal}}
                            {{#equal slct_device '3'}}모바일[기종]{{/equal}}
                            {{#equal slct_device '4'}}모바일[기종]{{/equal}}
                            {{#equal slct_device '5'}}모바일[기종]{{/equal}}
                        </th>
                        <td>
                            {{device1}}
                        </td>
                        <th>{{#equal slct_device '1'}}PC [믹서 / 오인페]{{/equal}}
                            {{#equal slct_device '2'}}PC [믹서 / 오인페]{{/equal}}
                            {{#equal slct_device '3'}}모바일 [외부 스피커]{{/equal}}
                            {{#equal slct_device '4'}}모바일 [외부 스피커]{{/equal}}
                            {{#equal slct_device '5'}}모바일 [외부 스피커]{{/equal}}
                        </th>
                        <td>
                            {{device2}}
                        </td>
                    </tr>
                    <tr>
                        <th>제목</th>
                        <td colspan="5">{{title}}</td>
                    </tr>
                    <tr>
                        <th>내용</th>
                        <td colspan="5">
                            <p style="width:100%;white-space: pre-line;">{{{replaceEnter contents}}}</p>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</script>