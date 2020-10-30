<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dummyData"><%= java.lang.Math.round(java.lang.Math.random() * 1000000) %></c:set>
<%
    String in_tabType = request.getParameter("tabType");
%>
<div id="wrapper">
    <div id="page-wrapper">
        <div class="container-fluid">
            <!-- serachBox -->
            <form id="searchForm">
            <div class="row col-lg-12 form-inline">
                <input type="hidden" name="pageStart" id="pageStart">
                <input type="hidden" name="pageCnt" id="pageCnt">
                <div class="widget widget-table searchBoxArea">
                    <div class="widget-header searchBoxRow">
                        <h3 class="title"><i class="fa fa-search"></i> 추천/인기DJ 검색</h3>
                        <div>
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
                            <label class="control-inline fancy-radio custom-color-green">
                                <input type="radio" name="rankType" value='4' />
                                <span><i></i>연간</span>
                            </label>

                            <div class="input-group date" id="oneDayDatePicker">
                                <label for="onedayDate" class="input-group-addon">
                                    <span><i class="fa fa-calendar" id="onedayDateBtn"></i></span>
                                </label>
                                <input type="text" class="form-control" id="onedayDate" name="onedayDate">
                            </div>

                            <div class="input-group date" id="rangeDatepicker" style="display: none">
                                <label for="monthDate" class="input-group-addon">
                                    <span><i class="fa fa-calendar"></i></span>
                                </label>
                                <input id="monthDate" type="text" class="form-control" style="width: 168px;"/>
                            </div>

                            <div class="input-group date" id="yearDatepicker" style="display:none;">
                                <label for="yearDate" class="input-group-addon">
                                    <span><i class="fa fa-calendar"></i></span>
                                </label>
                                <input id="yearDate" type="text" class="form-control" style="width: 196px;"/>
                            </div>

                            <input class="hide" name="startDate" id="startDate" style="width: 100px">
                            <input class="hide" name="endDate" id="endDate" style="width: 100px">

                            <%--<input name="startDate" id="startDate" style="width: 100px">--%>
                            <%--<input name="endDate" id="endDate" style="width: 100px">--%>


                            <span id="searchArea"></span>
                            <label><input type="text" class="form-control" id="txt_search" name="txt_search"></label>
                            <button type="button" class="btn btn-success" id="bt_search">검색</button>
                            <a href="javascript://" class="_prevSearch">[이전]</a>
                            <a href="javascript://" class="_todaySearch">[오늘]</a>
                            <a href="javascript://" class="_nextSearch">[다음]</a>
                        </div>
                    </div>
                </div>
                <%--<div>--%>
                    <%--<label id="lb_title" style="display: none"><b>· 선택 날짜의 전주 랭킹을 확인할 수 있습니다.</b></label>--%>
                <%--</div>--%>
            </div>
            </form>
            <!-- //serachBox -->
            <!-- DATA TABLE -->
            <div class="row col-lg-12 form-inline">

                <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist" id="rankTab">
                    <li><a href="/menu/rank/djRankList?tabType=0" id="tab_rankList"><i class="fa fa-home"></i> DJ랭킹</a></li>
                    <li><a href="/menu/rank/djRankList?tabType=1" id="tab_rankFanList"><i class="fa fa-user"></i> Fan랭킹</a></li>
                    <li><a href="/menu/rank/addDjPoint" id="tab_addDjPoint">DJ가산점</a></li>
                    <li class="active"><a href="#goodRank"><i class="fa fa-user"></i>좋아요랭킹</a></li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane fade in active " id="goodRankList">
                        <div class="dataTables_paginate paging_full_numbers" id="list_info_paginate_top"></div>

                        <table id="list_info" class="table table-sorting table-hover table-bordered">
                        </table>
                        <div class="dataTables_paginate paging_full_numbers" id="list_info_paginate"></div>
                    </div>
                </div>     <!-- 상세 -->
            </div>
            <!-- DATA TABLE END -->
        </div>
    </div>
</div>
<script type="text/javascript" src="/js/code/menu/menuCodeList.js?${dummyData}"></script>
<script type="text/javascript">
     goodRankListPagingInfo = new PAGING_INFO(0, 1, 50);

     var dateTime = new Date();
     dateTime = moment(dateTime).format("YYYY.MM.DD");
     setTimeDate(dateTime);

     var tabType = <%=in_tabType%>;

    $(function(){
        $("#searchArea").html(util.getCommonCodeSelect(9999, searchType));

        rankTypeChange();
        init();

        $('#onedayDate').datepicker("onedayDate", new Date()).on('changeDate', function (dateText, inst) {
            var selectDate = moment(dateText.date).format("YYYY.MM.DD");
            $("#startDate").val(selectDate);
        });

        // $('#onedayDate').datepicker({
        //     minViewMode: 'days',
        //     format: 'yyyy.mm.dd',
        //     keyboardNavigation: false,
        //     forceParse: false,
        //     autoclose: true,
        //     language: 'kr',
        // });

        $('#monthDate').datepicker({
            minViewMode: 'months',
            format: 'yyyy.mm',
            keyboardNavigation: false,
            forceParse: false,
            autoclose: true,
            language: 'kr',
        });

        $("#onedayDate").on('change', function () {
            if($('input:radio[name="rankType"]:checked').val() == 2){
                setMonday();
            }else{
                $("#endDate").val($("#startDate").val());
            }
        });

        $("#monthDate").on('change', function () {
            var monthLastDate = new Date($("#monthDate").val().substr(0,4),$("#monthDate").val().substr(5,6),-1);
            $("#startDate").val($("#monthDate").val() + '.01');
            $("#endDate").val($("#monthDate").val() + "." +  (monthLastDate.getDate() + 1));
            init();
        });

        $('#yearDate').datepicker({
            minViewMode: 'years',
            format: 'yyyy',
            keyboardNavigation: false,
            forceParse: false,
            autoclose: true,
            language: 'kr',
        });

        $("#yearDate").on('change', function () {
            $("#startDate").val($("#yearDate").val() + '.01.01');
            $("#endDate").val($("#yearDate").val() + ".12.31");
            $("._searchDate").html(moment($("#startDate").val()).format('YYYY년'));
            init();
        });

        $("#monthDate").val(moment(new Date()).format('YYYY.MM'));
        $("#yearDate").val(moment(new Date()).format('YYYY'));
    });

    function init(){
        var data = {
            rankType : $('input:radio[name="rankType"]:checked').val()
            , pageStart : goodRankListPagingInfo.pageNo
            , pageCnt : goodRankListPagingInfo.pageCnt
            , selectGubun : $('#searchArea').val()
            , txt_search : $("#txt_search").val()
            , sDate : $("#startDate").val()
            , eDate : $("#endDate").val()
            , onedayDate : $("#onedayDate").val()
        }
        util.getAjaxData("goodRank", "/rest/menu/rank/goodRank", data, fn_succ_list);
    }

     function setTimeDate(dateTime){
         $("#onedayDate").val(dateTime);
         $("#startDate").val(dateTime);
         $("#endDate").val(dateTime);
     }

    function fn_succ_list(dst_id, response, params) {
        dalbitLog(dst_id);
        dalbitLog(response);

        response.data.rankType = $('input:radio[name="rankType"]:checked').val();

        var template = $('#tmp_tmp_goodRankList').html();
        var templateScript = Handlebars.compile(template);
        var context = response.data;
        var html = templateScript(context);
        $("#list_info").html(html);

        var pagingInfo = response.pagingVo;
        goodRankListPagingInfo.totalCnt = pagingInfo.totalCnt;
        util.renderPagingNavigation('list_info_paginate_top', goodRankListPagingInfo);
        util.renderPagingNavigation('list_info_paginate', goodRankListPagingInfo);
    }

    $('input[name="rankType"]').on('change', function(){
        rankTypeChange();
    });
    function rankTypeChange(){
        if($('input:radio[name="rankType"]:checked').val() == 3) {
            $("#rangeDatepicker").show();
            $("#oneDayDatePicker").hide();
            $("#yearDatepicker").hide();
            $("#monthDate").val(moment(new Date()).format('YYYY.MM'));

            $("#startDate").val(moment(new Date()).format('YYYY.MM.01'));
            $("#endDate").val(moment(moment(new Date()).format('YYYY.MM.01')).add('months', 1).add('days', -1).format('YYYY.MM.DD'));
        }else if($('input:radio[name="rankType"]:checked').val() == 4){
            $("#rangeDatepicker").hide();
            $("#oneDayDatePicker").hide();
            $("#yearDatepicker").show();
            $("#yearDate").val(moment(new Date()).format('YYYY'));

            $("#startDate").val(moment(new Date()).format('YYYY.01.01'));
            $("#endDate").val(moment(new Date()).format('YYYY.12.31'));
        }else{
            $("#oneDayDatePicker").show();
            $("#rangeDatepicker").hide();
            $("#yearDatepicker").hide();
            $("#onedayDate").val(moment(new Date()).format('YYYY.MM.DD'));

            $("#startDate").val(moment(new Date()).format('YYYY.MM.DD'));
            $("#endDate").val(moment(new Date()).format('YYYY.MM.DD'));
            if($('input:radio[name="rankType"]:checked').val() == 2){       // 주간
                setMonday();
            }
        }
        goodRankListPagingInfo.pageNo = 1;
        init();
    }

     function getMonday(str) {
         var y = str.substr(0, 4);
         var m = str.substr(5, 2);
         var d = str.substr(8, 2);
         d = new Date(y,m-1,d);
         var day = d.getDay(),
             diff = d.getDate() - day + (day == 0 ? -6:1);
         return new Date(d.setDate(diff));
     }
     function setMonday(){
         var monday = getMonday($("#onedayDate").val());       // 선택한 날의 월요일
         var startDate = monday;
         var endDate = new Date(Date.parse(monday) + 6 * 1000 * 60 * 60 * 24);
         $("#startDate").val(startDate.getFullYear() + "." + common.lpad(startDate.getMonth() + 1,2,"0") + "." + common.lpad(startDate.getDate(),2,"0"));
         $("#endDate").val(endDate.getFullYear() + "." + common.lpad(endDate.getMonth() + 1,2,"0") + "." + common.lpad(endDate.getDate(),2,"0"));
     }


     $(document).on('click', '._prevSearch', function(){
         searchDate('prev');
     });

     $(document).on('click', '._nextSearch', function(){
         searchDate('next');
     });

     $(document).on('click', '._todaySearch', function(){
         $("input:radio[name='rankType']:radio[value='0']").prop('checked', true);
         rankTypeChange();

         $("#bt_search").click();
     });

     function searchDate(dateType){
         var rankType = $('input[name="rankType"]:checked').val();
         //일간
         if(rankType == 1){
             if(common.isEmpty(dateType)){
                 $("#startDate").val(moment(new Date()).format('YYYY.MM.DD'));
                 $("#endDate").val(moment(new Date()).format('YYYY.MM.DD'));
                 $("#onedayDate").val($("#startDate").val());
             }else if(dateType == 'prev'){
                 setDay(-1);
             }else{
                 setDay(1);
             }
         //주간
         }else if(rankType == 2){
             if(common.isEmpty(dateType)){
                 var monday = getMonday(moment(new Date()).format('YYYY.MM.DD'));       // 선택한 날의 월요일
                 var startDate = monday;
                 var endDate = new Date(Date.parse(monday) + 6 * 1000 * 60 * 60 * 24);
                 $("#startDate").val(startDate.getFullYear() + "." + common.lpad(startDate.getMonth() + 1,2,"0") + "." + common.lpad(startDate.getDate(),2,"0"));
                 $("#endDate").val(endDate.getFullYear() + "." + common.lpad(endDate.getMonth() + 1,2,"0") + "." + common.lpad(endDate.getDate(),2,"0"));
             }else if(dateType == 'prev'){
                 setWeek(-7);
             }else if(dateType == 'next'){
                 setWeek(7);
             }
         //월간
         }else if(rankType == 3){
             if(common.isEmpty(dateType)){
                 $("#startDate").val(moment(new Date()).format('YYYY.MM.01'));
                 $("#endDate").val(moment(moment(new Date()).format('YYYY.MM.01')).add('months', 1).add('days', -1).format('YYYY.MM.DD'));
                 $("#monthDate").val(moment(new Date()).format('YYYY.MM'));
             }else if(dateType == 'prev'){
                 setMonth(-1);
             }else if(dateType == 'next'){
                 setMonth(1);
             }
         }else if(rankType == 4){
             if(common.isEmpty(dateType)){
                 $("#startDate").val(moment(new Date()).format('YYYY.01.01'));
                 $("#endDate").val(moment(new Date()).format('YYYY.12.31'));
                 $("#yearDate").val(moment(new Date()).format('YYYY'));
             }else if(dateType == 'prev'){
                 setYear(-1);
             }else if(dateType == 'next'){
                 setYear(1);
             }
         }
         $("#bt_search").click();
     }

     function setDay(days){
         $("#startDate").val(moment($("#startDate").val()).add('days', days).format('YYYY.MM.DD'));
         $("#endDate").val($("#startDate").val());
         $("#onedayDate").val($("#startDate").val());
     }

     function setWeek(week){
         var monday = getMonday(moment($("#startDate").val()).add('days', week).format('YYYY.MM.DD'));       // 선택한 날의 월요일
         var startDate = monday;
         var endDate = new Date(Date.parse(monday) + 6 * 1000 * 60 * 60 * 24);
         $("#startDate").val(startDate.getFullYear() + "." + common.lpad(startDate.getMonth() + 1,2,"0") + "." + common.lpad(startDate.getDate(),2,"0"));
         $("#endDate").val(endDate.getFullYear() + "." + common.lpad(endDate.getMonth() + 1,2,"0") + "." + common.lpad(endDate.getDate(),2,"0"));
         $("#onedayDate").val($("#startDate").val());
     }

     function setMonth(months){
         $("#startDate").val(moment($("#startDate").val()).add('months', months).format('YYYY.MM.01'));
         $("#endDate").val(moment($("#startDate").val()).add('months', 1).add('days', -1).format('YYYY.MM.DD'));
         $("#monthDate").val(moment($("#startDate").val()).format('YYYY.MM'));
     }

     function setYear(years){
         $("#startDate").val(moment($("#startDate").val()).add('years', years).format('YYYY.01.01'));
         $("#endDate").val(moment($("#startDate").val()).add('years', 1).add('days', -1).format('YYYY.12.31'));
         $("#yearDate").val(moment($("#startDate").val()).format('YYYY'));
     }

    $('#bt_search').on('click', function() {
        init();
    });

    $('input[id="txt_search"]').on('keydown', function(e) {
        if(e.keyCode == 13) {
            init();
        };
    });

    function handlebarsPaging(targetId, pagingInfo){
        goodRankListPagingInfo = pagingInfo;
        init();
    }
</script>

<script type="text/x-handlebars-template" id="tmp_goodRankList">
    <thead id="djtableTop">
    <tr>
        <th>순위</th>
        <th>프로필<br/>이미지</th>
        <th>회원번호</th>
        <th>닉네임</th>
        <th>성별</th>
        <th style="width: 110px">보상 배지</th>
        <th>배지 시작일</th>
        <th>배지 종료일</th>
        <th>좋아요 총합</th>
        <th>1분 좋아요</th>
        <th>부스터 좋아요</th>
        <th>부스터 횟수</th>
    </tr>
    </thead>
    <tbody id="goodRankListBody">
    {{#each this as |rank|}}
    <tr {{#dalbit_if inner '==' 1}} class="bg-testMember" {{/dalbit_if}}>
            <td>
                {{djRank}}
            </td>
            <td style="width: 50px">
                <img class="thumbnail fullSize_background" src="{{renderProfileImage rank.image_profile rank.mem_sex}}" style='height:68px; width:68px;margin-bottom: 0px' />
            </td>
            <td>
                <a href="javascript://" class="_openMemberPop" data-memNo="{{memNo}}">{{memNo}}</a>
                <br /> <br />
                레벨 : {{level}} <br />
                등급 : {{grade}}
            </td>
            <td>
                {{#equal mem_nick ''}}
                    {{{fontColor '탈퇴회원 입니다.' 0 'red'}}}
                {{else}}
                    {{rank.mem_nick}}
                {{/equal}}
            </td>
            <td>{{{sexIcon mem_sex mem_birth_year}}}</td>
            <td>
                {{#dalbit_if badgeImage '==' ''}}
                {{else}}
                    <img class="" src="{{badgeImage}}" style='width:42px; height:26px; margin-bottom: 0px;'/><br/>
                    {{#dalbit_if ../rankType '==' '1'}} 일간 DJ TOP {{reward_rank}} {{/dalbit_if}}
                    {{#dalbit_if ../rankType '==' '2'}} 주간 DJ TOP {{reward_rank}} {{/dalbit_if}}
                    {{#dalbit_if ../rankType '==' '3'}} 월간 DJ TOP {{reward_rank}} {{/dalbit_if}}
                {{/dalbit_if}}
            </td>
            <td>
                {{#dalbit_if badgeImage '==' ''}}
                {{else}}
                    {{rewardStartDate}}<br/>
                    보상 달 : {{addComma reward_dal}}<br/>
                    보상 경험치 : {{addComma reward_exp}}<br/>
                {{/dalbit_if}}
            </td>
            <td>
                {{#dalbit_if rewardEndDate '!=' ''}}
                    {{rewardEndDate}}<br />
                    {{#dalbit_if ../rankType '==' '1'}} (23:59:59){{/dalbit_if}}
                    {{#dalbit_if ../rankType '==' '2'}} (일요일 23:59:59){{/dalbit_if}}
                {{/dalbit_if}}
            </td>
           <td></td>
           <td></td>
           <td></td>
           <td></td>
        </tr>

        {{else}}
            <tr>
                <td colspan="11">{{isEmptyData}}</td>
            </tr>
        {{/each}}
    </tbody>
</script>
