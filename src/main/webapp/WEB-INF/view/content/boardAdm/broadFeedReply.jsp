<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dummyData"><%= java.lang.Math.round(java.lang.Math.random() * 1000000) %></c:set>

<div class="col-lg-12 no-padding">
    <div class="widget-content">
        <div class="col-md-12 no-padding mt10">
            <div class="clearfix">
                <span id="broadFeedReplyListCnt"></span><br/>

                <div class="col-md-2 no-padding pull-right">
                    <table class="table table-sorting table-hover table-bordered">
                        <colgroup>
                            <col width="15%"/><col width="65%"/>
                        </colgroup>
                        <tr>
                            <td style="background-color: #dae3f3"></td><td>테스트 아이디</td>
                        </tr>
                    </table>
                </div>
            </div>

            <div class="clearfix">
                <div class="dataTables_paginate paging_full_numbers" id="broadFeedReply_paginate_top"></div>
                <table id="broadFeedReplyTable" class="table table-sorting table-hover table-bordered mt10">
                    <colgroup>
                        <col width="60px">
                        <col width="120px">
                        <col width="90px">
                        <col width="auto">
                        <col width="120px">
                        <col width="60px">
                    </colgroup>
                    <thead>
                    <tr>
                        <th>No</th>
                        <th>등록자</th>
                        <th>성별</th>
                        <th>피드 내용</th>
                        <th>등록일자</th>
                        <th>관리</th>
                    </tr>
                    </thead>
                    <tbody id="tb_broadFeedReplyList">
                    </tbody>
                </table>
                <div class="dataTables_paginate paging_full_numbers" id="broadFeedReply_paginate"></div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
  var broadNFeedReplyPagingInfo = new PAGING_INFO(0, 1, 50);

  var memNo;
  function broadFeedReply(pagingInfo, _tabId) {
    if(!common.isEmpty(_tabId)){
      tabId = _tabId;
    }

    $('#title').html('피드댓글');
    if(!common.isEmpty(pagingInfo)){
      broadNFeedReplyPagingInfo.pageNo = pagingInfo;
    }else{
      broadNFeedReplyPagingInfo.pageNo = 1;
    }

    if(!common.isEmpty(memNo) && memNo != null){
      txt_search = memNo;
    }else{
      txt_search = $('#txt_search').val();
    }

    var data = {
      startDate: $("#startDate").val(),
      endDate: $("#endDate").val(),
      searchVal: txt_search,
      searchSlct: $('#searchMember').val(),
      pageNo: broadNFeedReplyPagingInfo.pageNo,
      pagePerCnt: broadNFeedReplyPagingInfo.pageCnt
    }
    util.getAjaxData("feedReplyList", "/rest/content/boardAdm/feedReplyList", data, renderReplyFeedList, null, {type: 'GET'});
  }
  // 피드 댓글 목록 그리기
  function renderReplyFeedList(dst_id, response, param) {
    var template = $('#tmp_broadFeedReplyTable').html();
    var templateScript = Handlebars.compile(template);
    response.data.map(function (item, index) {
      item.index_no = response.totalCnt - (((broadNFeedReplyPagingInfo.pageNo - 1) * broadNFeedReplyPagingInfo.pageCnt) + index);
      return item;
    });
    var context = response;
    var html = templateScript(context);

    $('#tb_broadFeedReplyList').html(html);

    $("#broadFeedReplyListCnt").html(
      '<span style="color:black">[검색결과 : ' +  response.totalCnt + ' 건]</span>'
    );

    broadNFeedReplyPagingInfo.totalCnt = response.totalCnt;
    util.renderPagingNavigation('broadFeedReply_paginate_top', broadNFeedReplyPagingInfo);
    util.renderPagingNavigation('broadFeedReply_paginate', broadNFeedReplyPagingInfo);

    if(response.data.length == 0) {
      $("#broadFeedReply_paginate_top").hide();
      $('#broadFeedReply_paginate').hide();
    } else {
      $("#broadFeedReply_paginate_top").show();
      $('#broadFeedReply_paginate').show();
    }
  }

  // 댓글삭제
  function removeFeedReply(json) {
    if (!(json && json.parent_no && json.tail_no)) return;
    if (!confirm('정말 삭제하시겠습니다?\n삭제된 데이터는 복원되지 않습니다.')) return;

    var data = {
      feedNo: json.parent_no,
      tailNo: json.tail_no
    }
    util.getAjaxData("feedReplyDelete", "/rest/content/boardAdm/feedReplyDelete", data, feedReplyDelete_succ, null, {type: 'POST'});
  }
  function feedReplyDelete_succ(dst_id, response, param) {
    broadFeedReply();
  }

  $(function() {

  });
</script>

<script id="tmp_broadFeedReplyTable" type="text/x-handlebars-template">
    {{#each this.data as |data|}}
    <tr {{#dalbit_if tail_inner '==' 1}} style="background-color : #dae3f3" {{/dalbit_if}}>
        <td>{{index_no}}</td>
        <td>
            {{{memNoLink tail_mem_no tail_mem_no}}}<br/>
            {{tail_mem_nick}}
        </td>
        <td>
            {{{sexIcon tail_mem_sex}}}<br>
            ({{tail_mem_age}}세)
        </td>
        <td class="word-break" style="width: 400px; padding: 5px;"><span class="pull-left">{{{replaceHtml tail_conts}}}</span></td>
        <td>{{tail_ins_date}}</td>
        <td><a href="javascript:void(0)" onclick="removeFeedReply({{json data}})">[삭제]</a></td>
    </tr>
    {{else}}
    <tr>
        <td colspan="8">{{isEmptyData}}</td>
    </tr>
    {{/each}}
</script>