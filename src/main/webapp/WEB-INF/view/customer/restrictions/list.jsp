<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    String in_tabType = request.getParameter("tabtype");
%>

<div id="wrapper">
    <div id="page-wrapper">
        <!-- serachBox -->
        <div class="row col-lg-12 form-inline">
            <div class="widget widget-table searchBoxArea">
                <div class="widget-header searchBoxRow">
                    <h3 class="title"><i class="fa fa-search"></i> 회원 검색</h3>
                    <div>
                        <span id="searchRadio"></span>
                        <span id="searchTarget" style="display: none;"></span>
                        <span id="searchType"></span>
                        <label><input type="text" class="form-control" id="txt_search"></label>
                        <div class="input-group date" id="oneDayDatePicker">
                            <label for="onedayDate" class="input-group-addon">
                                <span><i class="fa fa-calendar" id="onedayDateBtn"></i></span>
                            </label>
                            <input type="text" class="form-control" id="onedayDate" name="onedayDate">
                        </div>
                        <button type="submit" class="btn btn-success" id="bt_search">검색</button>
                        <a href="javascript://" class="_prevSearch">[이전]</a>
                        <a href="javascript://" class="_todaySearch">[오늘]</a>
                        <a href="javascript://" class="_nextSearch">[다음]</a>

                        <input class="hide" name="startDate" id="startDate" style="width: 100px">
                        <input class="hide" name="endDate" id="endDate" style="width: 100px">
                    </div>
                </div>
            </div>
        </div>
        <!-- //serachBox -->
        <!-- DATA TABLE -->
        <div class="row col-lg-12 form-inline">
            <ul class="nav nav-tabs nav-tabs-custom-colored mt5">
                <li><a href="javascript: window.location.href = window.location.origin + '/member/member/list?tabtype=1';">회원</a></li>
                <li><a href="javascript: window.location.href = window.location.origin + '/member/member/list?tabtype=2';">탈퇴회원</a></li>
                <li><a href="#withdrawalList" role="tab" data-toggle="tab" id="tab_withdrawalList" onclick="restrictionsList(1);">경고/정지회원</a></li>
                <li><a href="#forcedList" role="tab" data-toggle="tab" id="tab_forcedList" onclick="restrictionsList(2);">방송 강제퇴장 회원</a></li>
            </ul>
        </div>
        <div class="row col-lg-12 form-inline">
            <div class="widget widget-table" id="div_memberList">
                <div class="widget-header">
                    <h3><i class="fa fa-desktop"></i> 검색결과</h3>
                </div>
                <div class="row col-md-12 pull-left"><span class="_searchDate pl10"></span></div>
                <div class="tab-content no-padding">

                    <div class="tab-pane fade in active " id="withdrawalList">       <!-- 경고/정지회원 -->
                        <div class="pull-left pt10 pl10"><span id="searchOpCode"></span></div>
                        <div class="widget-content">
                            <table id="tb_withdrawalList" class="table table-sorting table-hover table-bordered">
                                <thead></thead>
                                <tbody></tbody>
                            </table>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="forcedList">       <!-- 방송 강제퇴장 회원 -->
                        <div class="widget-content">
                            <table id="tb_forcedList" class="table table-sorting table-hover table-bordered">
                                <thead></thead>
                                <tbody></tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- DATA TABLE END -->
    </div>
</div>

<script src="/js/dataTablesSource/customer/restrictionsDataTableSource.js?${dummyData}"></script>
<script type="text/javascript" src="/js/code/customer/restrictionsCodeList.js?${dummyData}"></script>
<script type="text/javascript" src="/js/code/customer/customerCodeList.js?${dummyData}"></script>
<script type="text/javascript" src="/js/code/member/memberCodeList.js?${dummyData}"></script>

<script>
    var tabType = common.isEmpty(<%=in_tabType%>) ? 1 : <%=in_tabType%>;

    $(document).ready(function() {

        $('input[id="txt_search"]').keydown(function() {
            if (event.keyCode === 13) {
                getRestrictionsInfo();
            };
        });
        <!-- 버튼 -->
        $('#bt_search').click( function() {       //검색
            getRestrictionsInfo();
        });
        <!-- 버튼 끝 -->

        $('#onedayDate').datepicker("onedayDate", new Date()).on('changeDate', function(dateText, inst){
            var selectDate = moment(dateText.date).format("YYYY.MM.DD");
            $("#displayDate").val(selectDate+ ' - ' + selectDate);
            $("#startDate").val(selectDate);
            $("#endDate").val(selectDate);
            getRestrictionsInfo();
        });

        $("#searchRadio").html(util.getCommonCodeRadio(1, searchRadioMember));
        $("#searchTarget").html(util.getCommonCodeSelect(-1, restrictions_searchTarget));
        $("#searchType").html(util.getCommonCodeSelect(-1, restrictions_searchType));
        $("#searchOpCode").html(util.getCommonCodeSelect(-1, restrictions_searchOpCode));

        getRestrictionsInfo();
    });

    $('#searchRadio').change(function() {
        if($('input[name="searchRadio"]:checked').val() == "1"){
            $("#searchType").removeClass("hide");
        }else{
            $("#searchType").addClass("hide");
        }
    });

    $(document).on('click', '#bt_state', function() {           // 상태 정상으로 변경
        var memNo = $(this).data("memno");
        stateEdit(memNo);
    });

    $(document).on('change', '#opCode', function() {          // 경고/정지회원 회원상태 select
        getRestrictionsInfo();
    });


    function restrictionsList(type){
        var code = -1;
        if(tabType == type){
            code = $('#searchType option:selected').val();
        }
        tabType = type;

        if(tabType == 1) { // 경고정지회원
            $("#searchTarget").hide();
        }else if(tabType == 2){ //방송 강제퇴장 회원
            $("#searchTarget").show();
        }

    }

    var dtList_info;
    var dtList_info_data = function ( data ) {
        var searchType = $('#searchType option:selected').val();
        if($('input[name="searchRadio"]:checked').val() != "1"){
            searchType = $('input[name="searchRadio"]:checked').val();       // IP 검색 : 9 , 모바일ID 검색 : 6
        }

        data.searchType = searchType;       // 검색구분
        data.searchText = $('#txt_search').val();            // 검색명
        data.opCode = $("#opCode").val();
        data.startDate = $("#startDate").val();
        data.endDate = $("#endDate").val();
        // data.pageCnt = 10;
    };
    dtList_info = new DalbitDataTable($("#tb_withdrawalList"), dtList_info_data, RestrictionsDataTableSource.withdrawalList);
    dtList_info.useCheckBox(false);
    dtList_info.useIndex(true);
    dtList_info.useInitReload(false);
    dtList_info.createDataTable();

    var dtList_info2;
    var dtList_info_data2 = function ( data ) {
        var searchType = $('#searchType option:selected').val();
        if($('input[name="searchRadio"]:checked').val() != "1"){
            searchType = $('input[name="searchRadio"]:checked').val();       // IP 검색 : 9 , 모바일ID 검색 : 6
        }

        data.searchType = searchType;       // 검색구분
        data.searchText = $('#txt_search').val();                        // 검색명
        data.searchTarget = $('#searchTarget option:selected').val();       //대상
        data.startDate = $("#startDate").val();
        data.endDate = $("#endDate").val();
        // data.pageCnt = 10;
    };
    dtList_info2 = new DalbitDataTable($("#tb_forcedList"), dtList_info_data2, RestrictionsDataTableSource.forcedList);
    dtList_info2.useCheckBox(false);
    dtList_info2.useIndex(true);
    dtList_info2.useInitReload(false);
    dtList_info2.setPageLength(20)
    dtList_info2.createDataTable();


    function getRestrictionsInfo() {                 // 검색
        $("._searchDate").html($("#startDate").val() + " (" + toDay + ")");
        // $('#tabList_top').removeClass("show");
        if(tabType == "1"){
            $("#tab_withdrawalList").click();
            dtList_info.reload();
        }else if(tabType == "2"){
            $("#tab_forcedList").click();
            dtList_info2.reload();
        }
    }

    function stateEdit(memNo) {
        if(confirm("상태를 정상으로 변경 하시겠습니까?")) {
            var obj = new Object();
            obj.mem_no = memNo;
            util.getAjaxData("editor", "/rest/member/member/state_edit", obj, state_edit_success, fn_fail);
        }return false;
    }

    function state_edit_success(dst_id, response) {
        getRestrictionsInfo();
    }

    function fn_fail(data, textStatus, jqXHR){
        console.log(data, textStatus, jqXHR);
    }


    var dateTime = new Date();
    dateTime = moment(dateTime).format("YYYY.MM.DD");
    var week = ['일', '월', '화', '수', '목', '금', '토'];
    var toDay = week[moment(new Date()).day()];
    setTimeDate(dateTime);


    $(document).on('click', '._prevSearch', function(){
        searchDate('prev');
    });

    $(document).on('click', '._nextSearch', function(){
        searchDate('next');
    });

    $(document).on('click', '._todaySearch', function(){
        toDay = week[moment(new Date()).day()];

        setTimeDate(dateTime);
        $("#bt_search").click();
    });

    function setTimeDate(dateTime){
        $("#onedayDate").val(dateTime);
        $("#startDate").val(dateTime);
        $("#endDate").val(dateTime);
        $("._searchDate").html(dateTime + " (" + toDay + ")");
    }

    function searchDate(dateType){
        //시간별
        if(common.isEmpty(dateType)){
            $("#startDate").val(moment(new Date()).format('YYYY.MM.DD'));
            $("#endDate").val(moment(new Date()).format('YYYY.MM.DD'));

            $("._searchDate").html(moment(new Date()).format('YYYY.MM.DD'));

        }else if(dateType == 'prev'){
            setDay(-1);

        }else{
            setDay(1);
        }
        $("#bt_search").click();
    }

    function setDay(days){
        toDay = week[moment($("#startDate").val()).add('days', days).day()];
        $("#startDate").val(moment($("#startDate").val()).add('days', days).format('YYYY.MM.DD'));
        $("#endDate").val($("#startDate").val());

        $("._searchDate").html($("#startDate").val() + " (" + toDay + ")");
        $("#onedayDate").val($("#startDate").val());
    }

</script>