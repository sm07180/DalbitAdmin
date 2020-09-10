<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dummyData"><%= java.lang.Math.round(java.lang.Math.random() * 1000000) %></c:set>

<!-- table -->
<div class="col-lg-12 no-padding">
    <div class="widget-content">
        <div class="col-md-12 no-padding mt10">
            <span id="broadNoticeListCnt"></span>
        </div>
        <div class="dataTables_paginate paging_full_numbers" id="broadNotice_paginate_top"></div>
        <table id="broadNoticeTable" class="table table-sorting table-hover table-bordered mt10">
            <colgroup>
                <col width="4%"/><col width="10%"/><col width="55%"/><col width="10%"/>
                <col width="10%"/>
            </colgroup>
            <thead>
            <tr>
                <th>No</th>
                <th>공지 주인</th>
                <th>방송공지 내용</th>
                <th>등록일자</th>
                <th>관리</th>
            </tr>
            </thead>
            <tbody id="tb_broadNoticeList">
            </tbody>
        </table>
        <div class="dataTables_paginate paging_full_numbers" id="broadNotice_paginate"></div>
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
            , 'searchType' : 1
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

        util.getAjaxData("noticeListSummary", "/rest/content/boardAdm/noticeList/summary", param, fn_success_broadNoticeSummary);
    }

    function fn_success_broadNoticeSummary(dst_id, response) {
        $("#tab_broadNoticeList").text("방송공지" + "(" + response.data.totalCnt +")");
        $("#broadNoticeListCnt").html(
            '<span style="color:black">[검색결과 : ' +  response.data.totalCnt + ' 건]</span>' +
            '<span style="color: blue;"> [남' + response.data.maleCnt + " 건]</span>" + "," +
            '<span style="color: red;"> [여' + response.data.femaleCnt + " 건]</span>" + "," +
            '<span style="color: #555555;"> [알수없음' + response.data.noneCnt + " 건]</span>"
        );
    }

    $(document).on('click', '._broadNoticeDelBtn', function() {
        if(confirm("삭제하시겠습니까?")) {
            var data = {
                noticeIdx: $(this).data('broadnoticeidx'),
                nociceType: $(this).data('type')
            };

            console.log(data);
            util.getAjaxData("delete", "/rest/member/notice/delete", data, broadNoticeDel_success);
        }else return;
    });

    function broadNoticeDel_success(dst_id, response){
        alert(response.message);
        broadNoticeList();
    }

</script>

<script id="tmp_broadNoticeTable" type="text/x-handlebars-template">
    {{#each this.data as |data|}}
        <tr>
            <td>{{indexDesc ../pagingVo/totalCnt rowNum}}</td>
            <td>
                {{{memNoLink_sex mem_no mem_no mem_sex}}}<br/>
                {{{memNoLink_sex mem_nick mem_no mem_sex}}}
            </td>
            <td class="word-break" style="width: 400px"><span class="pull-left">{{{replaceHtml contents}}}</span></td>
            <td>{{lastUpdDateFormat}}</td>
            <td><a href="javascript://" class="_broadNoticeDelBtn" data-broadnoticeidx="{{idx}}" data-type="{{type}}">[삭제]</a></td>
        </tr>
    {{else}}
        <tr>
            <td colspan="6">{{isEmptyData}}</td>
        </tr>
    {{/each}}
</script>
