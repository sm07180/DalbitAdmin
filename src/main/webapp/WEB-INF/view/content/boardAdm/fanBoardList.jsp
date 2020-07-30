<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- table -->
<div class="no-padding col-lg-12 form-inline">
    <div class="tab-content no-padding">
        <div class="tab-pane fade in active">
            <div class="widget-content">
                <div class="dataTables_paginate paging_full_numbers" id="list_info_paginate_top"></div>
                <div id="fanBoardTable"></div>
                <div class="dataTables_paginate paging_full_numbers" id="list_info_paginate"></div>
            </div>
        </div>
    </div>
</div>
<!-- //table -->

<script type="text/javascript">
    var fanBoardPagingInfo = new PAGING_INFO(0,1,100);

    $(document).ready(function() {
       fanBoardList();
    });

    function fanBoardList() {
        $('#title').html('팬보드검색');

        var data = {
            'pageStart' : fanBoardPagingInfo.pageNo
            , 'pageCnt' : fanBoardPagingInfo.pageCnt
        };
        util.getAjaxData("fanBoardList", "/rest/content/boardAdm/fanBoardList", data, fn_success_fanBoardList);
    }

    function fn_success_fanBoardList(dst_id, response) {
        var template = $('#tmp_fanBoardTable').html();
        var templateScript = Handlebars.compile(template);
        var context = response;
        var html = templateScript(context);

        $('#fanBoardTable').html(html);

        fanBoardPagingInfo.totalCnt = response.pagingVo.totalCnt;
        util.renderPagingNavigation('list_info_paginate_top', fanBoardPagingInfo);
        util.renderPagingNavigation('list_info_paginate', fanBoardPagingInfo);
        fanBoardPagingInfo.pageNo=1;

        if(response.data.length == 0) {
            $("#list_info_paginate_top").hide();
            $('#list_info_paginate').hide();
        } else {
            $("#list_info_paginate_top").show();
            $('#list_info.paginate').show();
        }

        function handlebarsPaging(targetId, pagingInfo) {
            fanBoardPagingInfo = pagingInfo;
            fanBoardList();
        }
    }
</script>

<script id="tmp_fanBoardTable" type="text/x-handlebars-template">
    <table id="tb_fanBoardList" class="table table-sorting table-hover table-bordered mt10">
        <colgroup>
            <col width="3%"/>
            <col width="5%"/>
            <col width="5%"/>
            <col width="5%"/>
            <col width="5%"/>
            <col width="5%"/>
            <col width="5%"/>
            <col width="5%"/>
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
            <th rowspan="2">No</th>
            <th colspan="5">대상회원</th>
            <th colspan="5">작성회원</th>
            <th rowspan="2">등록 / 수정 <br />/ 삭제</th>
            <th rowspan="2">일시</th>
            <th rowspan="2">작성 내용</th>
            <th rowspan="2">댓글</th>
            <th rowspan="2">삭제</th>
        </tr>
        <tr>
            <th>프로필</th>
            <th>회원번호</th>
            <th>닉네임</th>
            <th>상태</th>
            <th>성별(나이)</th>

            <th>프로필</th>
            <th>회원번호</th>
            <th>닉네임</th>
            <th>상태</th>
            <th>성별(나이)</th>
        </tr>
        </thead>
        <tbody>
        {{#each this.data as |data|}}
            <tr>
                <td>{{indexDesc ../pagingVo.totalCnt rowNum}}</td>
                <td style="width: 65px; height:65px;">
                    {{^equal star_image_profile ''}}
                    <img class="thumbnail" src="{{renderProfileImage ../data.star_image_profile ../data.star_mem_sex}}" style="width: 65px;height:65px; margin-bottom: 0px;" onclick="fullSize_background(this.src);"/>
                    {{else}}

                    {{/equal}}
                </td>
                <td>{{star_mem_no}}</td>
                <td>{{star_mem_nick}}</td>
                <td>{{star_mem_state}}</td>
                <td>{{{sexIcon star_mem_sex star_birth_year}}}</td>

                <td style="width: 65px; height:65px;">
                    {{^equal fan_image_profile ''}}
                    <img class="thumbnail" src="{{renderProfileImage data.fan_image_profile data.fan_mem_sex}}" style="width: 65px;height:65px; margin-bottom: 0px;" onclick="fullSize_background(this.src);"/>
                    {{else}}

                    {{/equal}}
                </td>
                <td>{{fan_mem_no}}</td>
                <td>{{fan_mem_nick}}</td>
                <td>{{fan_mem_state}}</td>
                <td>{{{sexIcon fan_mem_sex fan_birth_year}}}</td>

                <td>{{status}}</td>
                <td>{{convertToDate last_upd_date 'YYYY-MM-DD HH:mm:ss'}}</td>
                <td>{{contents}}</td>
                <td>{{replyCnt}}</td>
                <td>[삭제]</td>
            </tr>
        {{else}}
        <tr>
            <td colspan="16">{{isEmptyData}}</td>
        </tr>
        {{/each}}
        </tbody>
    </table>
</script>