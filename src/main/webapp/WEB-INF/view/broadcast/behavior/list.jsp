
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dummyData"><%= java.lang.Math.round(java.lang.Math.random() * 1000000) %></c:set>

<div id="wrapper">
    <div id="page-wrapper">
        <!-- serachBox -->
        <form id="searchForm">
        <div class="row col-lg-12 form-inline">
            <div class="widget widget-table searchBoxArea">
                <div class="widget-header searchBoxRow">
                    <h3 class="title"><i class="fa fa-search"></i>검색</h3>
                    <div>
                        <span id="searchRadio"></span>
                        <span id="searchType_broad"></span>
                        <span id="searchRoom_state"></span>
                        <label><input type="text" class="form-control" id="txt_search"></label>
                        <button type="button" class="btn btn-success" id="bt_search">검색</button>
                    </div>
                </div>
            </div>
        </div>
        </form>
        <!-- //serachBox -->
        <!-- DATA TABLE -->
        <div class="row col-lg-12 form-inline" style="padding-bottom: 15px">
            <div class="pull-left">
                <h4>청취자 행위 유도 관리</h4>
                방송에서 DJ 및 청취자에게 보여지는 방송방 행위 유도 관리입니다. 등장 조건은 청취자 입장 후 입니다.
            </div>
            <div class="pull-right">
                <button type="button" class="btn btn-primary mt10 mr10">추가</button>
            </div>
        </div>
        <div class="row col-lg-12 form-inline">
            <div class="widget widget-table">
                <div class="widget-content">
                    <div class="dataTables_paginate paging_full_numbers" id="behaviorList_paginate_top"></div>
                        <table class="table table-sorting table-hover table-bordered mt15">
                            <thead>
                            <colgroup>
                                <col width="3%"/><col width="3%"/><col width="5%"/><col width="20%"/><col width="5%"/><col width="5%"/>
                                <col width="5%"/><col width="5%"/><col width="5%"/><col width="5%"/><col width="5%"/><col width="5%"/>
                            </colgroup>
                            <tr>
                                <th><input type="checkbox" /></th>
                                <th>No</th>
                                <th>노출 대상</th>
                                <th>행위 유도 내용</th>
                                <th>내용 개수</th>
                                <th>버튼 명</th>
                                <th>호출(액션)</th>
                                <th>등장 조건</th>
                                <th>지속 시간</th>
                                <th>게시 여부</th>
                                <th>최종 수정 일시</th>
                                <th>최종 수정자</th>
                            </tr>
                            </thead>
                            <tbody id="behaviorList"></tbody>
                        </table>
                    <div class="dataTables_paginate paging_full_numbers" id="behaviorList_paginate"></div>
                </div>
                <div class="widget-footer">
                    <span>
                        <button class="btn btn-danger" type="button" id="bt_behaviorMsg">선택삭제</button>
                    </span>
                </div>
            </div>
        </div>
        <!-- DATA TABLE END -->

    </div>
</div>

<script type="text/javascript" src="/js/code/broadcast/broadCodeList.js?${dummyData}"></script>
<script>
    $(document).ready(function() {
       getBehaviorList();
    });

    function getBehaviorList() {

        var data = {
            target : 1
            , viewYn : 0
            , searchText : $('#txt_search').val()
        }
        util.getAjaxData("getBehaviorList", "/rest/broadcast/behavior/list", data, function fn_getBehaviorList_success(dst_id, response) {
            console.log(response.message);
            var template = $('#tmp_behaviorList').html();
            var templateScript = Handlebars.compile(template);
            var context = response.data;
            var html = templateScript(context);

            $('#behaviorList').html(html);
        });
    }

</script>

<script id="tmp_behaviorList" type="text/x-handlebars-template">
    {{#each this as |data|}}
        <tr>
            <td><input type="checkbox" /></td>
            <td>{{rowNum}}</td>
            <td>
                {{{getCommonCodeLabel target 'behavior_target'}}}
            </td>
            <td class="word-break" style="width: 400px">
                {{#desc1}}
                    1. {{replaceHtml ../desc1}} <br/>
                {{/desc1}}
                {{#desc2}}
                    2. {{replaceHtml ../desc2}} <br/>
                {{/desc2}}
                {{#desc3}}
                    3. {{replaceHtml ../desc3}}
                {{/desc3}}
            </td>
            <td>{{addComma desc_cnt}}개</td>
            <td>
                {{title}}
            </td>
            <td>
                {{{getCommonCodeLabel type 'behavior_type'}}}
            </td>
            <td>{{addComma conTime}}초</td>
            <td>{{addComma runTime}}초</td>
            <td>{{{getCommonCodeLabel viewYn 'behavior_viewYn'}}}</td>
            <td>{{convertToDate last_upd_date 'YYYY-MM-DD HH:mm:ss'}}</td>
            <td>
                {{opName}}
            </td>
        </tr>
    {{else}}
        <tr>
            <td colspan="12">{{isEmptyData}}</td>
        </tr>
    {{/each}}
</script>