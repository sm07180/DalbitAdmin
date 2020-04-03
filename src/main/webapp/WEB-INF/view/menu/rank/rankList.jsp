<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="container-fluid">
            <!-- serachBox -->
            <div class="row col-lg-12 form-inline">
                <div class="widget widget-table searchBoxArea">
                    <div class="widget-header searchBoxRow">
                        <h3 class="title"><i class="fa fa-search"></i> 추천/인기DJ 검색</h3>
                        <div>
                            <select class="form-control searchType" name="selectGubun">
                                <option value="9999" selected="selected">전체</option>
                                <option value="1">User ID</option>
                                <option value="2">User 닉네임</option>
                                <option value="3">연락처</option>
                                <option value="4">이름</option>
                            </select>
                            <label><input type="text" class="form-control" id="txt_search"></label>
                            <button type="submit" class="btn btn-success" id="bt_search">검색</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- //serachBox -->
            <!-- DATA TABLE -->
            <div class="row col-lg-12 form-inline">

                <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist" id="rankTab">
                    <li class="active">
                        <a href="#djRankList" role="tab" data-toggle="tab" data-rank="djRankList"><i class="fa fa-home"></i> DJ랭킹</a>
                    </li>
                    <li>
                        <a href="#fanRankList" role="tab" data-toggle="tab" data-rank="fanRankList"><i class="fa fa-user"></i> Fan랭킹</a>
                    </li>
                </ul>
                <div class="widget widget-table">
                    <div class="widget-content" style="border-top-width:0px;">

                        <div class="table-comment">
                            DJ/Fan랭킹 Main 노출 수는 1위부터 5위까지 총5명입니다.
                        </div>

                        <div class="table-option">
                            <label class="control-inline fancy-radio custom-color-green">
                                <input type="radio" name="rankType" value='1' checked="checked" />
                                <span><i></i>일간</span>
                            </label>
                            <label class="control-inline fancy-radio custom-color-green">
                                <input type="radio" name="rankType" value='2' />
                                <span><i></i>주간</span>
                            </label>
                            <label class="control-inline fancy-radio custom-color-green">
                                <input type="radio" name="rankType" value='3' />
                                <span><i></i>월간</span>
                            </label>
                        </div>

                        <table id="list_info" class="table table-sorting table-hover table-bordered"></table>
                    </div>


                    <div class="dataTables_paginate paging_full_numbers" id="list_info_paginate">
                        <%--<ul class="pagination borderless">
                            <li class="paginate_button first" aria-controls="list_info" tabindex="0"
                                id="list_info_first"><a href="#">처음</a></li>
                            <li class="paginate_button previous" aria-controls="list_info" tabindex="0"
                                id="list_info_previous"><a href="#">이전</a></li>
                            <li class="paginate_button active" aria-controls="list_info" tabindex="0"><a href="#">1</a>
                            </li>
                            <li class="paginate_button " aria-controls="list_info" tabindex="0"><a href="#">2</a></li>
                            <li class="paginate_button " aria-controls="list_info" tabindex="0"><a href="#">3</a></li>
                            <li class="paginate_button " aria-controls="list_info" tabindex="0"><a href="#">4</a></li>
                            <li class="paginate_button " aria-controls="list_info" tabindex="0"><a href="#">5</a></li>
                            <li class="paginate_button " aria-controls="list_info" tabindex="0"><a href="#">6</a></li>
                            <li class="paginate_button " aria-controls="list_info" tabindex="0"><a href="#">7</a></li>
                            <li class="paginate_button " aria-controls="list_info" tabindex="0"><a href="#">8</a></li>
                            <li class="paginate_button " aria-controls="list_info" tabindex="0"><a href="#">9</a></li>
                            <li class="paginate_button " aria-controls="list_info" tabindex="0"><a href="#">10</a></li>
                            <li class="paginate_button next" aria-controls="list_info" tabindex="0" id="list_info_next">
                                <a href="#">다음</a></li>
                            <li class="paginate_button last" aria-controls="list_info" tabindex="0" id="list_info_last">
                                <a href="#">마지막</a></li>
                        </ul>--%>
                    </div>

                </div>
            </div>
            <!-- DATA TABLE END -->
        </div>
    </div>
</div>

<script type="text/javascript">
    djRankListPagingInfo = new PAGING_INFO(0, 1, 10);

    $(function(){
        init();
    });

    function init(tabName){

        var rank = common.isEmpty(tabName) ? $('#rankTab li.active a').data('rank') : tabName;
        var data = {
            rankType : $('input[name="rankType"]:checked').val()
            , page : djRankListPagingInfo.pageNo
            , records : djRankListPagingInfo.pageCnt
        }
        util.getAjaxData(rank, "/rest/menu/rank/"+rank, data, fn_succ_list);
    }

    function fn_succ_list(dst_id, response, params) {
        dalbitLog(dst_id);
        dalbitLog(response);

        var template = $('#tmp_'+dst_id).html();
        var templateScript = Handlebars.compile(template);
        var context = response.data;
        var html = templateScript(context);
        $("#list_info").html(html);

        var pagingInfo = response.data.paging;
        djRankListPagingInfo.totalCnt = pagingInfo.totalCnt;
        util.renderPagingNavigation('list_info_paginate', djRankListPagingInfo);
    }

    $('input[name="rankType"]').on('change', function(){
        djRankListPagingInfo.pageNo = 1;
        init();
    });

    $('#rankTab li').on('click', function(){
        var rank = $(this).find('a').data('rank');
        djRankListPagingInfo.pageNo = 1;
        init(rank);
    });

    function handlebarsPaging(pagingInfo){
        djRankListPagingInfo = pagingInfo;
        init();
    }

</script>

<script type="text/x-handlebars-template" id="tmp_djRankList">
    <thead id="tableTop">
        <tr>
            <th>순위</th>
            <th>프로필 이미지</th>
            <th>User ID</th>
            <th>User 닉네임</th>
            <th>보유결제금액</th>
            <th>누적 받은 별</th>
            <th>누적 받은 선물</th>
            <th>누적 방송 횟수</th>
            <th>최초 방송 시작일</th>
            <th>총 방송진행 시간</th>
        </tr>
    </thead>
    <tbody id="tableBody">
        {{#each this.list as |rank|}}
            <tr>
                <td>
                    {{rank.rank}} <br /><br />
                    {{rank.upDown}}
                </td>
                <td>
                    {{#equal rank.profImg.path ''}}
                        이미지 없음
                    {{else}}
                        <img src="{{viewImage rank.profImg.path}}" style='height:100px; width:auto;' />
                    {{/equal}}
                </td>
                <td>
                    {{rank.memId}} <br /> <br />
                    레벨 : {{rank.level}} <br />
                    등급 : {{rank.grade}}
                </td>
                <td>{{rank.nickNm}}</td>
                <td>-</td>
                <td>-</td>
                <td>-</td>
                <td>-</td>
                <td>-</td>
                <td>-</td>
            </tr>

        {{else}}
            <tr>
                <td colspan="10">{{isEmptyData}}</td>
            </tr>
        {{/each}}
    </tbody>
</script>

<script type="text/x-handlebars-template" id="tmp_fanRankList">
    <thead id="tableTop">
    <tr>
        <th>순위</th>
        <th>Main<br />추천상태</th>
        <th>프로필 이미지</th>
        <th>User ID</th>
        <th>User 닉네임</th>
        <th>보유결제금액</th>
        <th>누적<br />받은 별</th>
        <th>누적<br />방송 선물</th>
        <th>누적<br />방송 횟수</th>
        <th>최초 방송<br />시작일</th>
        <th>총 방송진행<br />시간</th>
    </tr>
    </thead>
    <tbody id="tableBody">
    {{#each this.list as |fan|}}
        <tr>
            <td>
                {{fan.rank}} <br /><br />
                {{fan.upDown}}
            </td>
            <td>
                {{#isSmall rank 6}}
                    추천중
                {{else}}
                    비추천
                {{/isSmall}}
            </td>
            <td>
                {{#equal fan.profImg.path ''}}
                    이미지 없음
                {{else}}
                    <img src="{{viewImage fan.profImg.path}}" style='height:100px; width:auto;' />
                {{/equal}}
            </td>
            <td>
                {{fan.memId}} <br /> <br />
                레벨 : {{fan.level}} <br />
                등급 : {{fan.grade}}
            </td>
            <td>{{fan.nickNm}}</td>
            <td>-</td>
            <td>-</td>
            <td>-</td>
            <td>-</td>
            <td>-</td>
            <td>-</td>
        </tr>

    {{else}}
        <tr>
            <td colspan="10">{{isEmptyData}}</td>
        </tr>
    {{/each}}
    </tbody>
</script>