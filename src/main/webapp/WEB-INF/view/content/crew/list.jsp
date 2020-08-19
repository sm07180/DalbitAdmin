<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="container-fluid">
            <!-- serachBox -->
            <form id="searchForm">
                <div class="row col-lg-12 form-inline">
                    <div class="widget widget-table searchBoxArea">
                        <div class="widget-header searchBoxRow">
                            <h3 class="title"><i class="fa fa-search"></i> 크루원 검색</h3>
                            <div>
                                <span id="search_searchType_aria"></span>

                                <label><input type="text" class="form-control" name="searchText" id="searchText" placeholder="검색할 크루원 정보를 입력하세요"></label>
                                <button type="button" class="btn btn-success" id="bt_search">검색</button>

                            </div>
                        </div>
                    </div>
                </div>
            </form>
            <!-- //serachBox -->

            <div class="row col-lg-12 form-inline">
                <div class="widget widget-table searchBoxArea">
                    <div class="widget-header searchBoxRow">
                        <div class="row">
                            <div class="col-md-4">
                                <h3 class="title">크루등록</h3>
                                <label>
                                    <input type="text" class="form-control" name="crewName" id="crewName" style="width:200px;" placeholder="등록할 크루명을 입력하세요.">
                                </label>
                                <button type="button" class="btn btn-danger" id="bt_insertCrewName">등록</button>
                            </div>
                            <div class="ml15">
                                <h3 class="title">크루원 등록</h3>
                                <label>
                                    <input type="text" class="form-control" name="crew" id="crew">
                                    <input type="hidden" id="crewIdx" name="crewIdx"/>
                                </label>
                                <span id="crewMemberInfoArea"></span>
                                <label>
                                    <input type="text" class="form-control" name="crewMemberInfo" id="crewMemberInfo" style="width:250px;" placeholder="등록하실 크루원 정보를 입력하세요.">
                                </label>
                                <%-- 해당되는 정보가 없으면 alert창 띄우기 --%>
                                <button type="button" class="btn btn-danger" id="bt_insertCrewMember">등록</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- DATA TABLE -->
            <div class="row">

                <!-- 크루 정보 -->
                <div class="col-lg-2">
                    <div class="widget widget-table mb10">
                        <div class="widget-header">
                            <h3><i class="fa fa-table"></i>크루 정보</h3>
                        </div>
                        <div class="widget-content mt10">
                            <%--<div class="dataTables_paginate paging_full_numbers" id="crew_paginate_top"></div>--%>
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th><input type="checkbox"/></th>
                                        <th>크루명</th>
                                        <th>크루장</th>
                                        <th>인원</th>
                                    </tr>
                                </thead>
                                <tbody id="crewInfo"></tbody>
                            </table>
                            <%--<div class="dataTables_paginate paging_full_numbers" id="crew_paginate"></div>--%>
                        </div>
                    </div>
                </div>
                <!-- //테스트 계정 현황 -->

                <!-- 크루원 정보 -->
                <div class="col-lg-10">
                    <div class="widget widget-table">
                        <div class="widget-header">
                            <h3><i class="fa fa-desktop"></i>크루원 정보</h3>
                        </div>
                        <div class="widget-content mt10">
                            <div class="dataTables_paginate paging_full_numbers" id="crew_paginate_top"></div>
                                <table id="list_info" class="table table-sorting table-hover table-bordered">
                                    <colgroup>
                                        <col width="1%"/><col width="3%"/><col width="3%"/><col width="4%"/><col width="3%"/>
                                        <col width="5.5%"/><col width="5.5%"/><col width="5.5%"/><col width="5.5%"/><col width="5.5%"/>
                                        <col width="5.5%"/><col width="5.5%"/><col width="7%"/><col width="5.5%"/><col width="5.5%"/>
                                        <col width="5.5%"/><col width="5.5%"/><col width="5.5%"/><col width="5.5%"/>
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th><input type="checkbox" id="allChk" /></th>
                                            <th>No</th>
                                            <th>크루명(idx)</th>
                                            <th>UserID</th>
                                            <th>닉네임</th>
                                            <th>성별(나이)</th>
                                            <th>최근<br />방송 일시</th>
                                            <th>최근 7일<br />방송 횟수</th>
                                            <th>최근 7일<br />방송 시간</th>
                                            <th>일간<br />DJ 랭킹</th>
                                            <th>결제 건 / 금액</th>
                                            <th>레벨</th>
                                            <th>크루장</th>
                                        </tr>
                                    </thead>
                                    <tbody id="crewMemberList">
                                    </tbody>
                                </table>
                            <div class="dataTables_paginate paging_full_numbers" id="crew_paginate"></div>
                        </div>
                        <div class="widget-footer">
                            <span>
                                <button class="btn btn-default" type="button" id="bt_delete">선택삭제</button>
                            </span>
                        </div>
                    </div>
                </div>
                <!-- //검색결과 -->
            </div>
            <!-- #DataTable -->

            <form id="faqForm"></form>
        </div>
    </div>
</div>

<script type="text/javascript" src="/js/lib/jquery.table2excel.js"></script>
<script type="text/javascript" src="/js/code/administrate/adminCodeList.js?${dummyData}"></script>
<script type="text/javascript" src="/js/handlebars/administrateHelper.js?${dummyData}"></script>
<script>
    var crewPagingInfo = new PAGING_INFO(0,1,500);

    $(document).ready(function() {
        init();
    });

    function init(){
        $('#crewMemberInfoArea').html(util.getCommonCodeSelect(null, crew_searchType));
        getCrewInfo();
        getCrewMemberInfo();
    }

    $('#bt_insertCrewName').on('click', function() {
        if(common.isEmpty($('#crewName').val())) {
            alert('크루명을 입력해주세요.');
        } else {
            insertCrewName();
        }
    });

    function insertCrewName() {
        var data = {
            'crewName' : $('#crewName').val()
        };
        util.getAjaxData("insertCrewName", "/rest/content/crew/insertCrewName", data, fn_insertCrewName_success);
    }

    function fn_insertCrewName_success(dst_id, response) {
        alert(response.message);

        getCrewInfo();
    }

    $('#bt_insertCrewMember').on('click', function() {
       if(common.isEmpty($('#crewMemberInfo').val())) {
           alert('크루원 정보를 입력해주세요.');
       } else {
           if(confirm('크루원으로 등록하시겠습니까?')) {
               insertCrewMember();
           }
       }
    });

    function insertCrewMember() {
        var data = {
            'crewIdx' : $('#crewIdx').val()
            , 'memInfo' : $('#crewMemberInfo').val()
        };
        util.getAjaxData("insertCrewMember", "/rest/content/crew/insertCrewMember", data, fn_insertCrewMember_success);
    }

    function fn_insertCrewMember_success(dst_id, response) {
        alert(response.message);

        getCrewMemberInfo();
    }

    function getCrewInfo() {
        var data = {
            'pageStart' : crewPagingInfo.pageNo
            , 'pageCnt' : crewPagingInfo.pageCnt
        };
        util.getAjaxData("selectCrewInfo", "/rest/content/crew/selectCrewInfo", data, fn_selectCrewInfo_success);
    }

    function fn_selectCrewInfo_success(dst_id, response) {
        var template = $('#tmp_crewInfo').html();
        var templateScript = Handlebars.compile(template);
        var context = response.data;
        var html = templateScript(context);

        $('#crewInfo').html(html);

        crewPagingInfo.total = response.pagingVo.totalCnt;
        // util.renderPagingNavigation('crew_paginate_top', crewPagingInfo);
        // util.renderPagingNavigation('crew_paginate', crewPagingInfo);
        crewPagingInfo.pageNo=1;

        function handlebarsPaging(targetId, pagingInfo) {
            crewPagingInfo = pagingInfo;
            getCrewInfo();
        }
    }

    function getCrewMemberInfo() {
        var data = {
            'searchType' : $('#searchType').val()
            , 'pageStart' : crewPagingInfo.pageNo
            , 'pageCnt' : crewPagingInfo.pageCnt
        };
        util.getAjaxData("selectCrewMemberInfo", "/rest/content/crew/selectCrewMemberInfo", data, fn_selectCrewMemberInfo_success);
    }

    function fn_selectCrewMemberInfo_success(dst_id, response) {
        var template = $('#tmp_crewMemberList').html();
        var templateScript = Handlebars.compile(template);
        var context = response.data;
        var html = templateScript(context);

        $('#crewMemberList').html(html);

        crewPagingInfo.total = response.pagingVo.totalCnt;
        util.renderPagingNavigation('crew_paginate_top', crewPagingInfo);
        util.renderPagingNavigation('crew_paginate', crewPagingInfo);
        crewPagingInfo.pageNo=1;

        function handlebarsPaging(targetId, pagingInfo) {
            crewPagingInfo = pagingInfo;
            getCrewInfo();
        }
    }


    function displayCrew(name, idx) {
        $('#crew').val(name);
        $('#crewIdx').val(idx);
    }

</script>

<script id="tmp_crewInfo" type="text/x-handlebars-template">
    {{#each this}}
        <tr>
            <td><input type="checkbox"></td>
            <td><a href="javascript://" onclick="displayCrew('{{this.crewName}}', '{{this.crewIdx}}');">{{crewName}}</a></td>

            <td>
                {{#equal crewLeader ''}}
                -
                {{else}}
                {{crewLeader}}
                {{/equal}}
            </td>
            <td>{{crewCnt}}명</td>
        </tr>
    {{else}}
        <tr>
            <td colspan="3">{{isEmptyData}}</td>
        </tr>
    {{/each}}
</script>

<script id="tmp_crewMemberList" type="text/x-handlebars-template">
    {{#each this as |user|}}
        <tr>
            <td><input type="checkbox"/></td>
            <td>{{index @index}}</td>
            <td>{{user.crewIdx}}</td>
            <td>{{user.userId}}</td>
            <td>{{user.memNick}}</td>
            <td>{{{sexIcon user.memSex user.birthYear}}}</td>
            <td>{{convertToDate user.broadDate 'YYYY-MM-DD HH:mm:ss'}}</td>
            <td>{{user.broadCnt}}</td>
            <td>{{convertToDate user.broadTime 'YYYY-MM-DD HH:mm:ss'}}
            <td>{{user.ranking}}</td>
            <td>{{user.payCnt}} / {{user.payAmount}}</td>
            <td>{{user.level}}</td>
            <td>{{{getOnOffSwitch user.leader_yn 'user.leader_yn'}}}</td>
        </tr>
    {{else}}
        <tr>
            <td colspan="12">{{isEmptyData}}</td>
        </tr>
    {{/each}}
</script>