
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="container-fluid">
            <!-- serachBox -->
            <div class="row col-lg-12 form-inline">
                <div class="widget widget-table searchBoxArea">
                    <div class="widget-header searchBoxRow">
                        <h3 class="title"><i class="fa fa-search"></i> 실시간 Live</h3>
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

            <%--<div class="row col-lg-12 form-inline">
                <div class="widget widget-table">
                    <div class="widget-header">
                        <h3><i class="fa fa-desktop"></i> 검색결과</h3>
                        <div class="btn-group widget-header-toolbar">
                            <a href="#" title="열기/닫기" class="btn-borderless btn-toggle-expand">
                                <i class="fa fa-chevron-up" id="_searchToggleIcon"></i>
                            </a>
                        </div>
                    </div>
                    <div class="widget-content">
                        <table id="search_info" class="table table-sorting table-hover table-bordered dataTable no-footer"
                               role="grid" aria-describedby="list_info_info">
                            <thead>
                            <tr role="row">
                                <th class="" rowspan="1" colspan="1" aria-label="No." style="width: 20px;">No.</th>
                                <th class="" tabindex="0" aria-controls="list_info" rowspan="1" colspan="1"
                                    aria-label="UserID: 오름차순 정렬" style="width: 100px;">UserID
                                </th>
                                <th class="" tabindex="0" aria-controls="list_info" rowspan="1" colspan="1"
                                    aria-label="닉네임: 오름차순 정렬" style="width: 200px;">닉네임
                                </th>
                                <th class="" tabindex="0" aria-controls="list_info" rowspan="1" colspan="1"
                                    aria-label="이름: 오름차순 정렬" style="width: 100px;">이름
                                </th>
                                <th class="" tabindex="0" aria-controls="list_info" rowspan="1" colspan="1"
                                    aria-label="연락처: 오름차순 정렬" style="width: 100px;">연락처
                                </th>
                                <th class="" tabindex="0" aria-controls="list_info" rowspan="1" colspan="1"
                                    aria-label="가입플랫폼: 오름차순 정렬" style="width: 100px;">가입플랫폼
                                </th>
                                <th class="" tabindex="0" aria-controls="list_info" rowspan="1" colspan="1"
                                    aria-label="접속상태: 오름차순 정렬" style="width: 100px;">접속상태
                                </th>
                                <th class="" tabindex="0" aria-controls="list_info" rowspan="1" colspan="1"
                                    aria-label="생방상태: 오름차순 정렬" style="width: 100px;">생방상태
                                </th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr class="odd">
                                <td valign="top" colspan="8" class="dataTables_empty">검색 결과가 없습니다</td>
                            </tr>
                            </tbody>
                        </table>

                    </div>
                </div>
            </div>--%>

            <!-- DATA TABLE -->
            <div class="row col-lg-12 form-inline block">
                <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist">
                    <li class="tab_select" id="searchSubjectType"></li>
                    <li class="_tab active">
                        <a href="#recommend" role="tab" data-toggle="tab" data-slctType="1"><i class="fa fa-home"></i> 추천 DJ</a>
                    </li>
                    <li class="_tab">
                        <a href="#popular" role="tab" data-toggle="tab" data-slctType="2"><i class="fa fa-user"></i> 인기 DJ</a>
                    </li>
                    <li class="_tab">
                        <a href="#newbie" role="tab" data-toggle="tab" data-slctType="3"><i class="fa fa-user"></i> 신입 DJ</a>
                    </li>
                </ul>
                <div class="widget widget-table">
                    <div class="widget-content" style="border-top-width:0px;">

                        <div class="table-comment">
                            <div>- 실시간 Live 추천/인기/신입 DJ Main 노출 수는 대표 총 2명 입니다.</div>
                        </div>

                        <%--<div class="table-option">
                            <label class="control-inline fancy-radio custom-color-green">
                                <input type="radio" name="inline-radio2">
                                <span><i></i>일간</span>
                            </label>
                            <label class="control-inline fancy-radio custom-color-green">
                                <input type="radio" name="inline-radio2">
                                <span><i></i>주간</span>
                            </label>
                            <label class="control-inline fancy-radio custom-color-green">
                                <input type="radio" name="inline-radio2">
                                <span><i></i>월간</span>
                            </label>
                        </div>--%>

                        <table id="list_info" class="table table-sorting table-hover table-bordered" style="margin-top: 10px;">
                            <thead id="tableTop">
                                <tr>
                                    <th>프로필 이미지</th>
                                    <th>태그부분</th>
                                    <th>User ID</th>
                                    <th>User 닉네임</th>
                                    <th>보유결제금액</th>
                                    <th>누적 받은 별</th>
                                    <th>누적 받은 선물</th>
                                    <td>누적 방송 횟수</td>
                                    <td>최초 방송 시작일</td>
                                    <td>총 방송 진행 시간</td>
                                </tr>
                            </thead>
                            <tbody id="tableBody"></tbody>
                        </table>
                        <span>
                            <button class="btn btn-default print-btn pull-right mb10" type="button"><i class="fa fa-print"></i>Excel 출력</button>
                        </span>
                    </div>
                </div>
            </div>
            <!-- DATA TABLE END -->
        </div>
    </div>
</div>

<script type="text/javascript">

    $(function(){
        renderSubjectType();
        init();
    });

    function init(){
        var data = {
            subjectType : $('#subject_type').val()
            , slctType : $('._tab.active a').data('slcttype')
        }
        util.getAjaxData("liveList", "/rest/menu/live/list", data, fn_succ_list);
    }

    $('#bt_search, ._tab').on('click', function(){
        init();
    });

    function renderSubjectType(){
        $("#searchSubjectType").html(util.getCommonCodeSelect('', broadcastSubjectType));

        $('#subject_type').on('change', function(){
            init();
        });
    }

    function fn_succ_list(data, response, params) {
        dalbitLog(response);

        var template = $('#tmp_liveList').html();
        var templateScript = Handlebars.compile(template);
        var context = response.data;
        var html = templateScript(context);
        $("#tableBody").html(html);
    }

</script>

<script type="text/x-handlebars-template" id="tmp_liveList">
    {{#each this.list as |live|}}
        <tr>
            <td>
                {{#equal live.bjProfImg.path ''}}
                    이미지 없음
                {{else}}
                    <img src="{{viewImage live.bjProfImg.path}}" style='height:100px; width:auto;' />
                {{/equal}}
            </td>
            <td>태그부분</td>
            <td>{{live.link}}</td>
            <td>{{live.bjNickNm}}</td>
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
</script>