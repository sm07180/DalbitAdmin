<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dummyData"><%= java.lang.Math.round(java.lang.Math.random() * 1000000) %></c:set>

<!-- table -->
<div class="col-lg-12 no-padding">
    <div class="widget-content">
        <div class="col-md-12 no-padding mt10">
            <span id="broadNoticeListCnt"></span><br/>
            <select id="boardRoomStatus" name="boardRoomStatus" class="form-control searchType">
                <option value="0" selected="selected">공지 전체</option>
                <option value="1">정상</option>
                <option value="2">삭제</option>
            </select>
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
        <div class="dataTables_paginate paging_full_numbers" id="broadNotice_paginate_top"></div>
        <table id="broadNoticeTable" class="table table-sorting table-hover table-bordered mt10">
            <colgroup>
                <col width="4%"/><col width="10%"/><col width="5%"/><col width="50%"/><col width="10%"/>
                <col width="5%"/><col width="5%"/>
            </colgroup>
            <thead>
            <tr>
                <th>No</th>
                <th>등록 DJ</th>
                <th>성별</th>
                <th>방송방 공지 내용</th>
                <th>이미지</th>
                <th>등록일자</th>
                <th>상태</th>
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
            , 'status' : $("#boardRoomStatus option:selected").val()
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
        $("#tab_broadNoticeList").text("회원공지" + "(" + response.data.totalCnt +")");
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
    $('#boardRoomStatus').on('change', function () {
        broadNoticeList();
    });

</script>

<script id="tmp_broadNoticeTable" type="text/x-handlebars-template">
    {{#each this.data as |data|}}
        <tr {{#dalbit_if inner '==' 1}} style="background-color : #dae3f3" {{/dalbit_if}}>
            <td>{{indexDesc ../pagingVo/totalCnt rowNum}}</td>
            <td>
                {{{memNoLink mem_no mem_no}}}<br/>
                {{mem_nick}}
            </td>
            <td>
                {{{sexIcon mem_sex mem_birth_year}}}
            </td>
            <td class="word-break" style="width: 400px"><span class="pull-left">{{{replaceHtml contents}}}</span></td>
            <td>
                {{#equal image_path ''}}
                {{else}}
                <img class="thumbnail fullSize_background" alt="your image" src="{{renderImage ../image_path}}" style='height:68px; width:68px; margin: auto;' />
                {{/equal}}
            </td>
            <td>{{lastUpdDateFormat}}</td>
            <td>
                {{#dalbit_if status '==' 0}}
                    정상
                {{else}}
                    삭제 ({{op_name}})
                {{/dalbit_if}}
            </td>
            <td><a href="javascript://" class="_broadNoticeDelBtn" data-broadnoticeidx="{{idx}}" data-type="{{type}}">[삭제]</a></td>
        </tr>
    {{else}}
        <tr>
            <td colspan="8">{{isEmptyData}}</td>
        </tr>
    {{/each}}
</script>
