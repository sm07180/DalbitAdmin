<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dummyData"><%= java.lang.Math.round(java.lang.Math.random() * 1000000) %></c:set>

<!-- serachBox -->
<form id="searchForm">
    <div class="row col-lg-12 form-inline">
        <div class="col-md-7 no-padding">
            <div class="widget widget-table searchBoxArea">
                <div class="widget-header searchBoxRow">
                    <h3 class="title"><i class="fa fa-search"></i> 검색조건</h3>
                    <div>
                        <%--<span id="searchRadio"></span>--%>
                        <%--<span id="searchType_broad"></span>--%>

                        <div class="input-group date" id="seldate" style="display: none;">
                            <label for="onedayDate" class="input-group-addon">
                                <span><i class="fa fa-calendar" id="seldateDateBtn"></i></span>
                            </label>
                            <input type="text" class="form-control" id="onedayDate" name="onedayDate" style="width: 110px">
                        </div>

                        <label><input type="text" class="form-control" id="txt_search"></label>
                        <button type="button" class="btn btn-success" id="bt_search">검색</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-5 pull-right no-padding" id="divLive">
            <span id="live_summaryArea"></span>
            <%--<span id="dj_typeSummaryArea"></span>--%>
            <%--<span id="platform_summaryArea"></span>--%>
        </div>

        <div class="col-md-5 pull-right no-padding" id="divLiveListen" style="display: none">
            <div class="col-md-7 no-padding pull-right">
                <span id="live_summaryArea2"></span>
            </div>
            <div class="col-md-5 no-padding pull-right">
                <span id="liveListener_summaryArea"></span>
            </div>
        </div>

        <div class="col-md-5 pull-right no-padding" id="divLivelogin" style="display: none">
            <span id="login_summaryArea"></span>
        </div>

        <div class="col-md-5 pull-right no-padding" id="divLiveGuest" style="display: none">
            <span id="liveGuest_summaryArea"></span>
        </div>

    </div>
</form>
<!-- //serachBox -->
<!-- DATA TABLE -->
<div class="row col-lg-12 form-inline">

    <!-- DATA TABLE -->
    <ul class="nav nav-tabs nav-tabs-custom-colored mt5">
        <li class="active"><a href="#liveList" role="tab" data-toggle="tab" id="tab_liveList" onclick="liveList(1);" >시간대</a></li>
        <li><a href="#liveListener" role="tab" data-toggle="tab" id="tab_liveListener" onclick="getListenUserList_tabClick(3);">월간</a></li>
        <li><a href="#liveGuest" role="tab" data-toggle="tab" id="tab_liveGuest" onclick="getliveGuest_tabClick(5);">연간</a></li>
        <li><a href="#loginUserList" role="tab" data-toggle="tab" id="tab_LoginUser" onclick="getLoginUserList_tabClick(4);">상세내역</a></li>
        <%--<li><a href="#liveList" role="tab" data-toggle="tab" id="tab_endBrodList" onclick="liveList(2);">종료 방송</a></li>--%>
    </ul>
    <div class="tab-content no-padding">
        <div class="tab-pane fade in active" id="liveList" >
            <div class="widget widget-table">
                <div class="col-md-12">
                    <br/>
                    <label id="liveTitle">
                        ㆍ부스터 아이템의 경우 방송방에서 달로 구매하는 부스터가 아닙니다.<br/>
                        ㆍ이벤트 및 스페셜 DJ 혜택 등으로 제작된 부스터로 본인의 방송방에만 사용 가능합니다.<br/>
                        ㆍ부스터 아이템은 사용 시 DJ에게 달이 지급되지 않습니다.<br/>
                        ㆍ부스터 아이템으로 획득한 좋아요는 실시간 방송 순위에만 반영됩니다.
                    </label>
                    <br/>
                    <span id="liveSort" onchange="sortChange();"></span>
                    <span id="endSort" style="display: none" onchange="sortChange();"></span>
                </div>
                <div class="col-md-12 no-padding pull-right">
                    <table class="table table-sorting table-hover table-bordered">
                        <colgroup>
                            <col width="10%"/>
                            <col width="10%"/>
                            <col width="10%"/>
                            <col width="10%"/>
                            <col width="10%"/>
                            <col width="10%"/>
                            <col width="10%"/>
                            <col width="10%"/>
                            <col width="10%"/>
                            <col width="10%"/>
                        </colgroup>
                        <tr>
                            <td colspan="9"></td><td>테스트 아이디</td>
                        </tr>
                    </table>
                </div>
                <div class="widget-content" style="border-top-width:0px;">
                    <table id="list_info" class="table table-sorting table-hover table-bordered">
                        <thead id="tableTop"></thead>
                        <tbody id="tableBody"></tbody>
                    </table>
                    <button class="btn btn-default btn-sm print-btn pull-right" type="button" id="liveexcelDownBtn"><i class="fa fa-print"></i>Excel Down</button>
                </div>
            </div>
        </div>
        <%--<div class="tab-pane fade" id="liveListener"><jsp:include page="listenUser.jsp"/></div>
        <div class="tab-pane fade" id="liveGuest"><jsp:include page="liveGuest.jsp"/></div>
        <div class="tab-pane fade" id="loginUserList"><jsp:include page="loginUser.jsp"/></div>--%>
    </div>
</div>
<!-- DATA TABLE END -->

<script type="text/javascript" src="/js/code/broadcast/broadCodeList.js?${dummyData}"></script>
<script type="text/javascript" src="/js/code/member/memberCodeList.js?${dummyData}"></script>

<script>
    var date = new Date();
    var sDate;
    var eDate;

    $("#onedayDate").val(date.getFullYear() +"-"+ common.lpad(date.getMonth() + 1,2,"0") +"-"+ common.lpad(date.getDate(),2,"0"));
    $('#seldate').datetimepicker({
        format: 'L',
        maxDate:new Date(),
        format: "YYYY-MM-DD",
    });
    sDate = date.getFullYear()  +"-"+ common.lpad(date.getMonth() + 1,2,"0")  +"-"+ common.lpad(date.getDate(),2,"0");        //오늘

    $(document).ready(function() {
        getSearch();
    });

    $('#searchRadio').change(function() {
        if($('input[name="searchRadio"]:checked').val() == "1"){
            $("#searchType_broad").html(util.getCommonCodeSelect(-1, searchType_broad));
        }else{
            $("#searchType_broad").html(util.getCommonCodeSelect(-1, searchBroad_broad));
        }
    });

    $('input[id="txt_search"]').keydown(function() {
        if (event.keyCode === 13) {
            getSearch();
            getListenUserList();
            getLoginUserList();
            getGuestList();
        };
    });

    $('#bt_search').on('click', function(){
        getSearch();
        getListenUserList();
        getLoginUserList();
        getGuestList();
    });

    $("#seldate").hide();

    var liveState = 1;
    var room_liveType = 1;
    var dtList_info="";
    // liveList(1);

    var tmp_slctType;
    var tmp_dj_slctType = -1;
    var tmp_dj_searchText;
    var tmp_room_slctType = -1;
    var tmp_room_searchText;
    var tmp_searchText = "";


    var dtList_info_data = function (data) {
        var slctType = $('input[name="searchRadio"]:checked').val();
        data.slctType = slctType;
        if(slctType == "1"){      // DJ정보
            data.dj_slctType = $("select[name='searchType_broad']").val();
            data.dj_searchText = tmp_searchText;
            data.room_slctType = -1;
            data.room_searchText = "";
            data.ortStartDate =2;
        }else {                                                              // 방송정보
            data.dj_slctType = -1;
            data.dj_searchText = "";
            data.room_slctType = $("select[name='searchBroad_broad']").val();
            data.room_searchText = tmp_searchText;
            data.ortStartDate =2;
        }
        data.room_liveType = room_liveType;

        /*
        *   정렬 부분
        */
        if(liveState == 1) {
            if($("select[name='liveSort']").val() != 0){
                if ($("select[name='liveSort']").val() == 1)
                    data.sortStartDate = 1;
                if ($("select[name='liveSort']").val() == 2)
                    data.sortAirTime = 1;
                if ($("select[name='liveSort']").val() == 3)
                    data.sortListener = 1;
                if ($("select[name='liveSort']").val() == 4)
                    data.sortListener = 0;
                if ($("select[name='liveSort']").val() == 5)
                    data.sortGift = 1;
                if ($("select[name='liveSort']").val() == 6)
                    data.sortByeol = 1;
            }
        }else if(liveState == 2) {
            if($("select[name='endSort']").val() != 0){
                if ($("select[name='endSort']").val() == 2)
                    data.sortAirTime = 1;
                if ($("select[name='endSort']").val() == 3)
                    data.sortListener = 1;
                if ($("select[name='endSort']").val() == 4)
                    data.sortListener = 0;
                if ($("select[name='endSort']").val() == 5)
                    data.sortGift = 1;
                if ($("select[name='endSort']").val() == 6)
                    data.sortByeol = 1;
            }
        }
        data.startDate = $("#onedayDate").val() + ' 00:00:00';
        data.endDate = $("#onedayDate").val() + ' 23:59:59';
    };
    if(liveState == 1){
        dtList_info = new DalbitDataTable($("#list_info"), dtList_info_data, BroadcastDataTableSource.liveList);
    }else{
        dtList_info = new DalbitDataTable($("#list_info"), dtList_info_data, BroadcastDataTableSource.endLiveList);
    }
    dtList_info.useCheckBox(false);
    dtList_info.useIndex(true);
    dtList_info.setPageLength(100);
    dtList_info.createDataTable(summary_table);


    function liveList(tmp){
        liveState = tmp;
        if(tmp == 1){
            $("#liveTitle").html("ㆍ실시간 생방송 시작된 방송이 최상위 누적되어 보여집니다.<br/>ㆍDJ가 방송을 완료한 경우 해당 방송은 리스트에서 삭제됩니다.");
            $("#liveSort").show();
            $("#endSort").hide();
            $("#seldate").hide();
        }else if(tmp == 2){
            $("#liveTitle").html("ㆍ종료된 방송은 방송종료일을 기준으로 최상위 누적되어 보여집니다.<br/>" +
                "ㆍDJ가 방송을 완료한 경우 해당 방송은 리스트에서 추가됩니다.");
            $("#liveSort").hide();
            $("#endSort").show();
            $("#seldate").show();
        }

        $("#divLive").show();
        $("#divLiveListen").hide();
        $("#divLivelogin").hide();
        $("#divLiveGuest").hide();

        room_liveType = tmp;


        if(liveState != 1){
            dtList_info.changeReload(null,dtList_info_data,BroadcastDataTableSource.endLiveList,summary_table);
        }
        if(liveState == 1){
            dtList_info_lisetnUser.reload(liveNextFunc);
            dtList_info_guest.reload(liveGuest_summary);
            dtList_info_loginUser.reload(loginNextFunc);
            dtList_info.changeReload(null,dtList_info_data,BroadcastDataTableSource.liveList,summary_table);
        }


        // getSearch();
    }

    function summary_table(json){
        var template = $("#live_tableSummary").html();
        var templateScript = Handlebars.compile(template);
        var data = {
            content : json.summary
            , length : json.recordsTotal
        };
        var html = templateScript(data);
        $("#live_summaryArea").html(html);

  /*      if(liveState == 1) {
            if(json.code != "C006"){
                $("#tab_liveList").text("실시간 방송(" + json.summary.totalBroadCastCnt + ")");
            }else{
                $("#tab_liveList").text("실시간 방송(0)");
            }
        }*/
    }

    function getSearch(){
        /* 엑셀저장을 위해 조회조건 임시저장 */
        tmp_searchText = $('#txt_search').val();
        var slctType = $('input[name="searchRadio"]:checked').val();
        tmp_slctType = slctType;
        if(slctType == "1"){
            tmp_dj_slctType = $("select[name='searchType_broad']").val();
            tmp_dj_searchText = $('#txt_search').val();
        }else {
            tmp_room_slctType = $("select[name='searchBroad_broad']").val();
            tmp_room_searchText = $('#txt_search').val();
        }
        dtList_info.reload(summary_table);
    }

    function sortChange(){
        dtList_info.reload(summary_table);
    }

    /*=============엑셀==================*/
    $('#liveexcelDownBtn').on('click', function(){
        var formElement = document.querySelector("form");
        var formData = new FormData(formElement);
        formData.append("slctType", tmp_slctType);
        formData.append("dj_slctType", tmp_dj_slctType);
        formData.append("dj_searchText", tmp_dj_searchText);
        formData.append("room_slctType", tmp_room_slctType);
        formData.append("room_liveType", room_liveType);
        // formData.append("sDate", sDate);
        // formData.append("eDate", eDate);
        util.excelDownload($(this), "/rest/broadcast/broadcast/liveListExcel", formData)
    });

    function forcedEnd(cancelData){
        if(confirm("방송강제 종료 시도 하시겠습니까?")){
            var data = {};
            data.mem_no = cancelData.memno;
            data.room_no = cancelData.roomno;
            util.getAjaxData("forcedEnd", "/rest/member/broadcast/forcedEnd",data, forced_success);
        }else return false;
    }
    function forced_success(dst_id, response) {
        alert(response.message);
        dtList_info.reload(summary_table);
    }

    function broadCastLivePopUp(room_no, type){
        var popupUrl = "/broadcast/broadcast/popup/broadcastPopup?roomNo="+room_no + "&type=" + type;
        util.windowOpen(popupUrl,"1450", "700","방송정보");
    }
</script>

<script id="live_tableSummary" type="text/x-handlebars-template">
    <table class="table table-bordered table-summary pull-right no-margin" style="width: 100%">
        <tr>
            <th colspan="3" style="background-color: #8faadc">현재 총 보유</th>
        </tr>
        <tr>
            <th style="background-color: #dae3f3;">유저 보유</th>
            <th style="background-color: #dae3f3;">테스트 보유</th>
            <th style="background-color: #dae3f3;">총 보유</th>
        </tr>
        <tr>
            <th style="background-color: #f8cbad">{{{sexIcon 'm'}}}</th>
            <th style="background-color: #f8cbad">{{{sexIcon 'f'}}}</th>
            <th style="background-color: #f8cbad">{{{sexIcon 'n'}}}</th>
        </tr>
    </table>
</script>