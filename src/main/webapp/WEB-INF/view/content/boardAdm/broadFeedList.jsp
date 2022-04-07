<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dummyData"><%= java.lang.Math.round(java.lang.Math.random() * 1000000) %>
</c:set>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<style>
    .slick-prev {left: -15px; z-index: 100}
    .slick-next {right: -15px}
    #feedPhotoListSlick img {
        object-fit: contain
    }
</style>

<div class="col-lg-12 no-padding">
    <div class="widget-content">
        <div id="" class="col-md-12 no-padding mt10">
            <div class="clearfix">
                <span id="broadFeedListCnt"></span><br/>

                <div class="col-md-2 no-padding pull-right">
                    <table class="table table-sorting table-hover table-bordered">
                        <colgroup>
                            <col width="15%"/>
                            <col width="65%"/>
                        </colgroup>
                        <tr>
                            <td style="background-color: #dae3f3"></td>
                            <td>테스트 아이디</td>
                        </tr>
                    </table>
                </div>
            </div>

            <div class="clearfix">
                <div class="dataTables_paginate paging_full_numbers" id="broadFeed_paginate_top"></div>
                <table id="broadFeedTable" class="table table-sorting table-hover table-bordered mt10">
                    <colgroup>
                        <col width="60px">
                        <col width="120px">
                        <col width="90px">
                        <col width="auto">
                        <col width="90px">
                        <col width="60px">
                        <col width="120px">
                    </colgroup>
                    <thead>
                    <tr>
                        <th>No</th>
                        <th>등록자</th>
                        <th>성별</th>
                        <th>피드 내용</th>
                        <th>이미지</th>
                        <th>댓글 수</th>
                        <th>등록일자</th>
                    </tr>
                    </thead>
                    <tbody id="tb_broadFeedList">
                    </tbody>
                </table>
                <div class="dataTables_paginate paging_full_numbers" id="broadFeed_paginate"></div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="feedPhotoModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" style="width:440px">
            <div class="modal-body" style="background: #000">
                <div id="feedPhotoListSlick"></div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
  var broadNFeedPagingInfo = new PAGING_INFO(0, 1, 50);

  var memNo;

  function broadFeedList(pagingInfo, _tabId) {
    if (!common.isEmpty(_tabId)) {
      tabId = _tabId;
    }

    $('#title').html('피드');
    if (!common.isEmpty(pagingInfo)) {
      broadNFeedPagingInfo.pageNo = pagingInfo;
    } else {
      broadNFeedPagingInfo.pageNo = 1;
    }

    if (!common.isEmpty(memNo) && memNo != null) {
      txt_search = memNo;
    } else {
      txt_search = $('#txt_search').val();
    }

    var data = {
      startDate: $("#startDate").val(),
      endDate: $("#endDate").val(),
      searchVal: txt_search,
      searchSlct: $('#searchMember').val(),
      pageNo: broadNFeedPagingInfo.pageNo,
      pagePerCnt: broadNFeedPagingInfo.pageCnt
    }
    util.getAjaxData("feedList", "/rest/content/boardAdm/feedList", data, renderFeedList, null, {type: 'GET'});
  }

  // 피드 목록 그리기
  function renderFeedList(dst_id, response, param) {
    var template = $('#tmp_broadFeedTable').html();
    var templateScript = Handlebars.compile(template);
    response.data.map(function (item, index) {
      item.index_no = response.totalCnt - (((broadNFeedPagingInfo.pageNo - 1) * broadNFeedPagingInfo.pageCnt) + index);
      return item;
    });
    var context = response;
    var html = templateScript(context);

    $('#tb_broadFeedList').html(html);

    $("#broadFeedListCnt").html(
      '<span style="color:black">[검색결과 : ' + response.totalCnt + ' 건]</span>'
    );

    broadNFeedPagingInfo.totalCnt = response.totalCnt;
    util.renderPagingNavigation('broadFeed_paginate_top', broadNFeedPagingInfo);
    util.renderPagingNavigation('broadFeed_paginate', broadNFeedPagingInfo);

    if (response.data.length == 0) {
      $("#broadFeed_paginate_top").hide();
      $('#broadFeed_paginate').hide();
    } else {
      $("#broadFeed_paginate_top").show();
      $('#broadFeed_paginate').show();
    }
  }

  function getFeedPhotoList(feedNo) {
    $('#feedPhotoListSlick').empty();
    try {
      $('#feedPhotoListSlick').slick('unslick');
    } catch (e) {
    }

    if (!feedNo) return;
    var data = {
      feedNo: feedNo
    }
    util.getAjaxData("feedPhotoList", "/rest/content/boardAdm/feedPhotoList", data, renderFeedPhotoList, null, {type: 'GET'});
  }

  function renderFeedPhotoList(dst_id, response, param) {
    if (!response.data && response.data.length === 0) return;
    $('#feedPhotoModal').modal();

    var doms = [];
    response.data.map(function (item, index) {
      doms.push('<div><img src="' + PHOTO_SERVER_URL + item.img_name + '" width="400px" height="400px" /></div>');
    });
    $('#feedPhotoListSlick').html(doms.join('\n'));
    setTimeout(function () {
      $('#feedPhotoListSlick').slick();
    }, 180);
  }

  $(function () {

  });
</script>

<script id="tmp_broadFeedTable" type="text/x-handlebars-template">
    {{#each this.data as |data|}}
    <tr {{#dalbit_if inner '==' 1}} style="background-color : #dae3f3" {{/dalbit_if}}>
    <td>{{index_no}}</td>
    <td>
        {{{memNoLink mem_no mem_no}}}<br/>
        {{mem_nick}}
    </td>
    <td>
        {{{sexIcon mem_sex}}}<br>
        ({{mem_age}}세)
    </td>
    <td class="word-break" style="padding: 5px; width: 400px;"><span
            class="pull-left">{{{replaceHtml feed_conts}}}</span></td>
    <td>
        {{#equal image_path ''}}
        {{else}}
        <img class="thumbnail" alt="your image" src="{{renderImage ../image_path}}"
             style="height:68px; width:68px; margin: auto; cursor: pointer"
             onclick="getFeedPhotoList({{data.reg_no}})"/>
        {{/equal}}
    </td>
    <td>
        {{addComma tail_cnt}}
    </td>
    <td>{{ins_date}}</td>
    </tr>
    {{else}}
    <tr>
        <td colspan="7">{{isEmptyData}}</td>
    </tr>
    {{/each}}
</script>