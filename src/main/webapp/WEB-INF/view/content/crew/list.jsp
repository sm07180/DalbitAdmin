<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="row">
            <!-- serachBox -->
            <form id="searchForm">
                <div class="col-lg-12 form-inline">
                    <div class="widget widget-table searchBoxArea">
                        <div class="widget-header searchBoxRow">
                            <h3 class="title"><i class="fa fa-search"></i> 크루원 검색</h3>
                            <div>
                                <span id="searchTypeAria"></span>
                                <label><input type="text" class="form-control _trim" name="searchText" id="searchText" placeholder="크루원을 검색하세요"></label>
                                <button type="button" class="btn btn-success" id="bt_search">검색</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            <!-- //serachBox -->

            <div class="col-lg-12 form-inline">
                <div class="widget widget-table searchBoxArea">
                    <div class="widget-header searchBoxRow">
                        <div class="row">
                            <div class="col-md-4">
                                <h3 class="title">크루등록</h3>
                                <label>
                                    <input type="text" class="form-control _trim" name="crewName" id="crewName" style="width:200px;" placeholder="등록할 크루명을 입력하세요.">
                                </label>
                                <button type="button" class="btn btn-danger" id="bt_insertCrewName">등록</button>
                            </div>
                            <div class="ml15">
                                <h3 class="title">크루원 등록</h3>
                                <label>
                                    <input type="text" class="form-control _trim" name="crew" id="crew" placeholder="크루 정보에서 선택하세요.">
                                    <input type="hidden" id="crewIdx" name="crewIdx"/>
                                </label>
                                <span id="crewMemberInfoArea"></span>
                                <label>
                                    <input type="text" class="form-control _trim" name="crewMemberInfo" id="crewMemberInfo" style="width:250px;" placeholder="등록하실 크루원 정보를 입력하세요.">
                                </label>
                                <%-- 해당되는 정보가 없으면 alert창 띄우기 --%>
                                <button type="button" class="btn btn-danger" id="bt_insertCrewMember">등록</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- DATA TABLE -->

             <!-- 크루 정보 -->
             <div class="col-lg-4 form-inline">
                 <div class="widget widget-table mb10">
                     <div class="widget-header">
                         <h3><i class="fa fa-table"></i>크루 정보</h3>
                     </div>
                     <div class="widget-content mt10">
                         <div class="dataTables_paginate paging_full_numbers" id="crew_paginate_top"></div>
                         <table class="table table-bordered">
                             <thead>
                                 <tr>
                                     <th></th>
                                     <th>크루명</th>
                                     <th>크루장</th>
                                     <th>인원</th>
                                 </tr>
                             </thead>
                             <tbody id="crewInfo"></tbody>
                         </table>
                         <div class="dataTables_paginate paging_full_numbers" id="crew_paginate"></div>
                     </div>
                     <div class="widget-footer">
                         <span>
                             <button class="btn btn-default" type="button" id="bt_updateDelStateCrew">선택삭제</button>
                         </span>
                     </div>
                 </div>
             </div>
             <!-- //테스트 계정 현황 -->

             <!-- 크루원 정보 -->
             <div class="col-lg-8 form-inline">
                 <div class="widget widget-table">
                     <div class="widget-header">
                         <h3><i class="fa fa-desktop"></i>크루원 정보</h3>
                     </div>
                     <div class="widget-content mt10">
                         <div class="dataTables_paginate paging_full_numbers" id="crewMem_paginate_top"></div>
                             <table id="list_info" class="table table-sorting table-hover table-bordered">
                                 <colgroup>
                                     <col width="1%"/><col width="3%"/><col width="3%"/><col width="4%"/><col width="3%"/>
                                     <col width="5.5%"/><col width="5.5%"/><col width="5.5%"/><col width="5.5%"/><col width="5.5%"/>
                                     <col width="5.5%"/><col width="5.5%"/><col width="7%"/><col width="5.5%"/><col width="5.5%"/>
                                     <col width="5.5%"/><col width="5.5%"/><col width="5.5%"/><col width="5.5%"/>
                                 </colgroup>
                                 <thead>
                                     <tr>
                                         <th></th>
                                         <th>No</th>
                                         <th>크루명</th>
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
                         <div class="dataTables_paginate paging_full_numbers" id="crewMem_paginate"></div>
                     </div>
                     <div class="widget-footer">
                         <span>
                             <button class="btn btn-default" type="button" id="bt_deleteCrewMember">선택삭제</button>
                         </span>
                     </div>
                 </div>
             </div>
             <!-- //검색결과 -->
            </div>
            <!-- #DataTable -->
        </div>
    </div>
</div>

<script type="text/javascript" src="/js/lib/jquery.table2excel.js"></script>
<script type="text/javascript" src="/js/code/content/contentCodeList.js?${dummyData}"></script>
<script>
    var crewPagingInfo = new PAGING_INFO(0,1,50);

    $(document).ready(function() {
        init();
    });

    $('#bt_search').on('click', function() {
        getCrewInfo();
        getCrewMemberInfo();
    });

    $('input[id="searchText"]').keydown(function() {
        if (event.keyCode === 13) {
            getCrewInfo();
            getCrewMemberInfo();
        }
    });

    function init(){
        $('#searchTypeAria').html(util.getCommonCodeSelect(null, attendance_searchType));
        $('#crewMemberInfoArea').html(util.getCommonCodeSelect(null, crew_searchType));
        $('#crew').attr('readonly', true);
        getCrewInfo();
        getCrewMemberInfo();
    }

    $('#bt_insertCrewName').on('click', function() {
        if(common.isEmpty($('#crewName').val())) {
            alert('크루명을 입력해주세요.');
        } else {
            if(confirm('크루명을 등록하시겠습니까?')) {
                insertCrewName();
            } else {
                return false;
            }
        }
    });

    $('input[id="crewName"]').keydown(function() {
        if (event.keyCode === 13) {
            if(common.isEmpty($('#crewName').val())) {
                alert('크루명을 입력해주세요.');
            } else {
                if(confirm('크루명을 등록하시겠습니까?')) {
                    insertCrewName();
                } else {
                    return false;
                }
            }
        }
    });

    function insertCrewName() {
        var data = {
            'crewName' : $('#crewName').val().replace(/ /gi, '')
        };
        util.getAjaxData("insertCrewName", "/rest/content/crew/insertCrewName", data, fn_insertCrewName_success);
    }

    function fn_insertCrewName_success(dst_id, response) {
        alert(response.message);
        getCrewInfo();
        getCrewMemberInfo();
    }

    $('#bt_insertCrewMember').on('click', function() {
       if(common.isEmpty($('#crewIdx').val())) {
           alert('등록할 크루를 선택해주세요.');
       } else if(common.isEmpty($('#crewMemberInfo').val())) {
           alert('크루원 정보를 입력해주세요.');
       } else {
           if(confirm('크루원으로 등록하시겠습니까?')) {
               insertCrewMember();
           }
       }
    });

    $('input[id="crewMemberInfo"]').keydown(function() {
        if (event.keyCode === 13) {
            if(common.isEmpty($('#crewIdx').val())) {
                alert('등록할 크루를 선택해주세요.');
            } else if(common.isEmpty($('#crewMemberInfo').val())) {
                alert('크루원 정보를 입력해주세요.');
            } else {
                if(confirm('크루원으로 등록하시겠습니까?')) {
                    insertCrewMember();
                }
            }
        }
    });

    function insertCrewMember() {
        var data = {
            'searchType' : $('#crewSearchType option:selected').val()
            , 'crewIdx' : $('#crewIdx').val()
            , 'memInfo' : $('#crewMemberInfo').val()
        };
        util.getAjaxData("insertCrewMember", "/rest/content/crew/insertCrewMember", data, fn_insertCrewMember_success);
    }

    function fn_insertCrewMember_success(dst_id, response) {
        alert(response.message);
        getCrewInfo();
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
        util.renderPagingNavigation('crewMem_paginate_top', crewPagingInfo);
        util.renderPagingNavigation('crewMem_paginate', crewPagingInfo);
        crewPagingInfo.pageNo=1;

        function handlebarsPaging(targetId, pagingInfo) {
            crewPagingInfo = pagingInfo;
            getCrewInfo();
        }
    }

    function getCrewMemberInfo() {
        var data = {
            'searchType' : $('#searchType').val()
            , 'searchText' : $('#searchText').val().replace(/ /gi, '')
            , 'pageStart' : crewPagingInfo.pageNo
            , 'pageCnt' : crewPagingInfo.pageCnt
        };
        util.getAjaxData("selectCrewMemberInfo", "/rest/content/crew/selectCrewMemberInfo", data, fn_selectCrewMemberInfo_success);
    }

    function fn_selectCrewMemberInfo_success(dst_id, response) {
        var template = $('#tmp_crewMemberList').html();
        var templateScript = Handlebars.compile(template);
        var context = response;
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

        $("#searchText").val(name);
        $('#searchType').find('option[value="4"]').prop('selected', 'selected');

        getCrewMemberInfo();
    }

    $(document).on('change', '._leaderYN', function() {
        var me = $(this);
        var message = me.prop('checked') ? '크루장으로 등록하시겠습니까?' : '크루장을 해제하시겠습니까?';

        if(confirm(message)) {
            var data = {
                'idx' : $(this).data('idx')
                , 'crewIdx' : $(this).data('crewidx')
                , 'leader_yn' : $(this).prop('checked') ? 1 : 0
                , 'memNo' : $(this).data('memno')
            };
            console.log(data);

            util.getAjaxData("leaderYN", "/rest/content/crew/updateCrewLeader", data, function(dst_id, response){
                alert(response.message);
                getCrewInfo();
                getCrewMemberInfo();
            });
        }
    });

    $('#bt_updateDelStateCrew').on('click', function() {
        var checked = $('#crewInfo > tr > td > input[type=checkbox]:checked');
        if(checked.length == 0) {
            alert('삭제할 크루명을 선택해 주세요.');
            return;
        }

        if(confirm(checked.length + "건의 크루를 삭제하시겠습니까?")) {
            var crewIdxs = '';
            checked.each(function() {
               crewIdxs += $(this).parent().parent().find('._crewInfo').data('crewidx') + ",";
            });
            var data = {
                crewIdxs : crewIdxs
            };
            util.getAjaxData("updateDelStateCrew", "/rest/content/crew/updateDelStateCrew", data, fn_updateDelStateCrew_success);
        }
    });

    function fn_updateDelStateCrew_success(dst_id, response) {
        alert(response.message + '\n-성공 : ' + response.data.sucCnt + '건\n-실패 : ' + response.data.failCnt + '건');
        getCrewInfo();
        getCrewMemberInfo();
    }

    $('#bt_deleteCrewMember').on('click', function() {
        var checked = $('#crewMemberList > tr > td > input[type=checkbox]:checked');
        if(checked.length == 0) {
            alert('삭제할 크루원을 선택해 주세요.');
            return;
        }
        if(confirm(checked.length + "건의 크루원을 삭제하시겠습니까?")) {
            var crewMemberIdxs = '';
            checked.each(function () {
                crewMemberIdxs += $(this).parent().find('._crewMember').data('memidx') + ",";
            });
            var data = {
                crewMemberIdxs: crewMemberIdxs
            };
            console.log(data);
            util.getAjaxData("deleteCrewMember", "/rest/content/crew/deleteCrewMember", data, fn_deleteCrewMember_success);
        }
    });

    function fn_deleteCrewMember_success(dst_id, response) {
        alert(response.message + '\n-성공 : ' + response.data.sucCnt + '건\n-실패 : ' + response.data.failCnt + '건');
        getCrewInfo();
        getCrewMemberInfo();
    }

</script>

<script id="tmp_crewInfo" type="text/x-handlebars-template">
    {{#each this}}
        <tr>
            <td><input type="checkbox"></td>
            <td><a href="javascript://" onclick="displayCrew('{{this.crewName}}', '{{this.crewIdx}}');" class="_crewInfo" data-crewidx="{{this.crewIdx}}">{{crewName}}</a></td>
            <td>
                {{#equal crewLeader ''}}
                -
                {{else}}
                {{../crewLeader}}
                {{/equal}}
            </td>
            <td>{{addComma crewCnt}}명</td>
        </tr>
    {{else}}
        <tr>
            <td colspan="3">{{isEmptyData}}</td>
        </tr>
    {{/each}}
</script>

<script id="tmp_crewMemberList" type="text/x-handlebars-template">
    {{#each this.data as |user|}}
        <tr>
            <td><input type="checkbox"/><input type="hidden" class="_crewMember" data-memidx="{{user.idx}}"/> </td>
            <td>{{indexDesc ../pagingVo.totalCnt rowNum}}</td>
            <td>
                {{#equal user.crewName ''}}
                -
                {{else}}
                {{user.crewName}}
                {{/equal}}
            </td>
            <td>{{user.userId}}</td>
            <td>{{user.memNick}}</td>
            <td>{{{sexIcon user.memSex user.birthYear}}}</td>
            <td>{{convertToDate user.broadDate 'YYYY-MM-DD HH:mm:ss'}}</td>
            <td>{{addComma user.broadCnt}}</td>
            <td>{{timeStamp user.broadTime}}
            <td>
                {{#equal user.ranking '9999'}}
                -
                {{else}}
                {{user.ranking}}
                {{/equal}}
            </td>
            <td>{{addComma user.payCnt}} / {{addComma user.payAmount}}</td>
            <td>{{user.level}}</td>
            <td>
                <div class="control-inline onoffswitch">
                    <input type="checkbox" name="leaderYN" id="leaderYN{{user.idx}}" class="onoffswitch-checkbox _leaderYN" data-memno="{{user.mem_no}}" data-idx="{{user.idx}}" data-crewidx="{{user.crewIdx}}" {{#dalbit_if user.leader_yn "==" "1"}}checked{{/dalbit_if}}>
                    <label class="onoffswitch-label" for="leaderYN{{user.idx}}">
                        <span class="onoffswitch-inner"></span>
                        <span class="onoffswitch-switch"></span>
                    </label>
                </div>
            </td>
        </tr>
    {{else}}
        <tr>
            <td colspan="12">{{isEmptyData}}</td>
        </tr>
    {{/each}}
</script>