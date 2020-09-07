<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- table -->
<div class="col-lg-12 no-padding">
    <div class="widget-content">
        <div class="col-md-12 no-padding mt10">
            <span id="noticeListCnt"></span>
        </div>
        <div class="dataTables_paginate paging_full_numbers" id="notice_paginate_top"></div>
        <table id="noticeTable" class="table table-sorting table-hover table-bordered mt10">
            <colgroup>
                <col width="4%"/><col width="10%"/><col width="66%"/><col width="10%"/>
                <col width="10%"/>
            </colgroup>
            <thead>
            <tr>
                <th>No</th>
                <th>회원 공지 주인</th>
                <th>회원공지</th>
                <th>등록일시</th>
                <th>관리</th>
            </tr>
            </thead>
            <tbody id="tb_noticeList">
            </tbody>
        </table>
        <div class="dataTables_paginate paging_full_numbers" id="notice_paginate"></div>
    </div>
</div>
<!-- //table -->

<script type="text/javascript" src="/js/code/content/contentCodeList.js?${dummyData}"></script>
<script type="text/javascript">
    var noticePagingInfo = new PAGING_INFO(0,1,40);

    $(document).ready(function() {
        // noticeList();
    });

    var memNo;
    function noticeList(pagingInfo) {
        $('#title').html('회원/방송공지');
        if(!common.isEmpty(pagingInfo)){
            noticePagingInfo.pageNo = pagingInfo;
        }else{
            noticePagingInfo.pageNo = 1;
        }

        if(!common.isEmpty(memNo) && memNo != null){
            txt_search = memNo;
        }else{
            txt_search = $('#txt_search').val();
        }
        var data = {
            'pageNo': noticePagingInfo.pageNo
            , 'pageCnt' : noticePagingInfo.pageCnt
            , 'mem_no' : txt_search
            , 'sDate' : $("#startDate").val()
            , 'eDate' : $("#endDate").val()
            , 'searchType' : 2
        };

        util.getAjaxData("noticeList", "/rest/content/boardAdm/noticeList", data, fn_success_noticeList);
    }

    function fn_success_noticeList(dst_id, response, param) {

        for(var i=0 ; i<response.data.length;i++){
            response.data[i].contents = response.data[i].contents.replace(/\\n/gi,"<br/>");
        }

        var template = $('#tmp_noticeTable').html();
        var templateScript = Handlebars.compile(template);
        var context = response;
        var html = templateScript(context);

        $('#tb_noticeList').html(html);

        noticePagingInfo.totalCnt = response.pagingVo.totalCnt;
        util.renderPagingNavigation('notice_paginate_top', noticePagingInfo);
        util.renderPagingNavigation('notice_paginate', noticePagingInfo);

        if(response.data.length == 0) {
            $("noticeList").find("#notice_paginate_top").hide();
            $("noticeList").find('#notice_paginate').hide();
        } else {
            $("noticeList").find("#notice_paginate_top").show();
            $("noticeList").find('#notice_paginate').show();
        }

        util.getAjaxData("noticeListSummary", "/rest/content/boardAdm/noticeList/summary", param, fn_success_noticeSummary);
    }
    function fn_success_noticeSummary(dst_id, response) {
        $("#tab_noticeList").text("회원공지" + "(" + response.data.totalCnt +")");
        $("#noticeListCnt").html(
            '<span style="color:black">[검색결과 : ' +  response.data.totalCnt + ' 건]</span>' +
            '<span style="color: blue;"> [남' + response.data.maleCnt + " 건]</span>" + "," +
            '<span style="color: red;"> [여' + response.data.femaleCnt + " 건]</span>" + "," +
            '<span style="color: #555555;"> [알수없음' + response.data.noneCnt + " 건]</span>"
        );
    }

    $(document).on('click', '._noticeDelBtn', function() {
        if(confirm("삭제하시겠습니까?")) {
            var data = {
                noticeIdx: $(this).data('noticeidx'),
                nociceType: $(this).data('type')
            };

            console.log(data);
            util.getAjaxData("delete", "/rest/member/notice/delete", data, noticeDel_success);
        }else return;
    });

    function handlebarsPaging(targetId, pagingInfo) {
        noticePagingInfo = pagingInfo;
        noticeList(pagingInfo.pageNo);
    }

    function noticeDel_success(dst_id, response){
        alert(response.message);
        noticeList();
    }
</script>

<script id="tmp_noticeTable" type="text/x-handlebars-template">
    {{#each this.data as |data|}}
        <tr>
            <td>{{indexDesc ../pagingVo/totalCnt rowNum}}</td>
            <td>
                {{{memNoLink_sex mem_no mem_no mem_sex}}}<br/>
                {{{memNoLink_sex mem_nick mem_no mem_sex}}}
            </td>
            <td class="word-break" style="width: 550px"><span class="pull-left">{{{replaceHtml contents}}}</span></td>
            <td>{{lastUpdDateFormat}}</td>
            <td><a href="javascript://" class="_noticeDelBtn" data-noticeIdx="{{idx}}" data-type="{{type}}">[삭제]</a></td>
        </tr>
    {{else}}
        <tr>
            <td colspan="6">{{isEmptyData}}</td>
        </tr>
    {{/each}}
</script>