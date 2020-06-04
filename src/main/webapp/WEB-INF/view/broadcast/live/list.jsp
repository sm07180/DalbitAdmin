
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- serachBox -->
<form id="searchForm">
    <div class="row col-lg-12 form-inline">
        <div class="widget widget-table searchBoxArea">
            <div class="widget-header searchBoxRow">
                <h3 class="title"><i class="fa fa-search"></i> 방송 검색</h3>
                <div>
                    <span id="searchRadio"></span>
                    <span id="searchType_broad"></span>

                    <span id="selJoinDate" style="padding-left: 10px"></span>
                    <div class="input-group date" id="seldate">
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
</form>
<!-- //serachBox -->
<!-- DATA TABLE -->
<div class="row col-lg-12 form-inline">

    <!-- DATA TABLE -->
    <ul class="nav nav-tabs nav-tabs-custom-colored mt5">
        <li class="active"><a href="#liveList" role="tab" data-toggle="tab" onclick="liveList(1);">실시간방송</a></li>
        <li><a href="#liveList" role="tab" data-toggle="tab" onclick="liveList(2);">종료방송</a></li>
    </ul>
    <div class="tab-content no-padding">
        <div class="widget widget-table" id="liveList">
            <div class="col-md-6">
                <br/>
                <label id="liveTitle">ㆍ실시간 생방송 시작된 방송이 최상위 누적되어 보여집니다.<br/>ㆍDJ가 방송을 완료한 경우 해당 방송은 리스트에서 삭제됩니다.</label>
            </div>
            <div class="col-md-6 pull-right no-padding">
                <span id="live_summaryArea"></span>
                <span id="dj_typeSummaryArea"></span>
                <span id="platform_summaryArea"></span>
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
</div>
<!-- DATA TABLE END -->

<script type="text/javascript" src="/js/code/broadcast/broadCodeList.js?${dummyData}"></script>
<script type="text/javascript" src="/js/code/member/memberCodeList.js?${dummyData}"></script>

<script>
    $("#searchType_broad").html(util.getCommonCodeSelect(-1, searchType_broad));
    $("#searchRadio").html(util.getCommonCodeRadio(1, searchRadio));
    $("#selJoinDate").html(util.getCommonCodeRadio(3, joinDate));

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
        };
    });
    $('input[id="txt_broad"]').keydown(function() {
        if (event.keyCode === 13) {
            getSearch();
        };
    });

    $('#bt_search').on('click', function(){
        getSearch();
    });
    $('#bt_broad').on('click', function(){
        getSearch();
    });


    $("#seldate").addClass('hide');
    $('#selJoinDate').change(function() {
        sDate = "";
        eDate = "";
        $("#seldate").addClass('hide');


        if($('input[name="joinDate"]:checked').val() == "0"){               // 월
            sDate = date.getFullYear()  +"-"+ common.lpad(date.getMonth(),2,"0")  +"-"+ common.lpad(date.getDate(),2,"0");        // 한달전
            eDate = new Date(Date.parse(date) + 1 * 1000 * 60 * 60 * 24);           // 하루 + (프로시져에서 안해주신데요..)
            eDate = eDate.getFullYear()  +"-"+ common.lpad(eDate.getMonth() + 1,2,"0")  +"-"+ common.lpad(eDate.getDate(),2,"0");         // 오늘

        }else if($('input[name="joinDate"]:checked').val() == "1"){               // 주
            sDate = new Date(Date.parse(date) - 7 * 1000 * 60 * 60 * 24);           // 일주일 전
            sDate = sDate.getFullYear()  +"-"+ common.lpad(sDate.getMonth() + 1,2,"0")  +"-"+ common.lpad(sDate.getDate()+1,2,"0");      // 일주일전
            eDate = new Date(Date.parse(date) + 1 * 1000 * 60 * 60 * 24);           // 하루
            eDate = eDate.getFullYear()  +"-"+ common.lpad(eDate.getMonth() + 1,2,"0")  +"-"+ common.lpad(eDate.getDate(),2,"0");         // 오늘

        }else if($('input[name="joinDate"]:checked').val() == "2"){               // 전일
            eDate = date.getFullYear()  +"-"+ common.lpad(date.getMonth() + 1,2,"0")  +"-"+ common.lpad(date.getDate(),2,"0");      // 어제
            sDate = date.getFullYear()  +"-"+ common.lpad(date.getMonth() + 1,2,"0")  +"-"+ common.lpad(date.getDate()-1,2,"0");      //어제
        }else if($('input[name="joinDate"]:checked').val() == "3"){               // 당일
            sDate = date.getFullYear() +"-"+ common.lpad(date.getMonth() + 1,2,"0")  +"-"+ common.lpad(date.getDate(),2,"0");        //오늘
        }else if($('input[name="joinDate"]:checked').val() == "4"){               // 당일
            $("#seldate").removeClass('hide');
        }
        $("#onedayDate").val(date.getFullYear() +"-"+ common.lpad(date.getMonth() + 1,2,"0") +"-"+ common.lpad(date.getDate(),2,"0"));
        getSearch();
    });


    var liveState=1;
    var room_liveType = 1;
    var dtList_info="";
    liveList(1);

    var tmp_slctType;
    var tmp_dj_slctType = -1;
    var tmp_dj_searchText;
    var tmp_room_slctType = -1;
    var tmp_room_searchText;
    var tmp_searchText = "";

    function liveList(tmp){
        liveState = tmp;
        if(tmp == 1){
            $("#liveTitle").html("ㆍ실시간 생방송 시작된 방송이 최상위 누적되어 보여집니다.<br/>ㆍDJ가 방송을 완료한 경우 해당 방송은 리스트에서 삭제됩니다.");
        }else if(tmp == 2){
            $("#liveTitle").html("ㆍ종료된 방송은 방송종료일을 기준으로 최상위 누적되어 보여집니다.<br/>" +
                "ㆍDJ가 방송을 완료한 경우 해당 방송은 리스트에서 추가됩니다.");
        }
        room_liveType = tmp;
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
            data.sortStartDate = 0;
            if($('input[name="joinDate"]:checked').val() != "4" && $('input[name="joinDate"]:checked').val() != "3") {               // 선택
                data.startDate = sDate;
                data.endDate = eDate;
            }else if($('input[name="joinDate"]:checked').val() == "3" ){
                data.startDate = sDate;
            }else if($('input[name="joinDate"]:checked').val() == "4" ){
                data.startDate = $("#onedayDate").val();
            }

        };
        dalbitLog(dtList_info_data);
        if(liveState == 1){
            dtList_info = new DalbitDataTable($("#list_info"), dtList_info_data, BroadcastDataTableSource.liveList);
        }else{
            dtList_info = new DalbitDataTable($("#list_info"), dtList_info_data, BroadcastDataTableSource.endLiveList);
        }
        dtList_info.useCheckBox(false);
        dtList_info.useIndex(true);
        dtList_info.setPageLength(50);
        dtList_info.createDataTable(summary_table);

        getSearch();
    }

    function summary_table(json){
        // dalbitLog(json);
        var template = $("#platform_tableSummary").html();
        var templateScript = Handlebars.compile(template);
        var data = {
            content : json.summary
            , length : json.recordsTotal
        };
        var html = templateScript(data);
        $("#platform_summaryArea").html(html);

        if(liveState == 1) {
            var template = $("#live_tableSummary").html();
        }else{
            var template = $("#endlive_tableSummary").html();
        }

        var templateScript = Handlebars.compile(template);
        var data = {
            content : json.summary
            , length : json.recordsTotal
        };
        var html = templateScript(data);
        $("#live_summaryArea").html(html);


        var template = $("#dj_typeTableSummary").html();
        var templateScript = Handlebars.compile(template);
        var data = {
            content : json.summary
            , length : json.recordsTotal
        };
        var html = templateScript(data);
        $("#dj_typeSummaryArea").html(html);
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

</script>

<script id="platform_tableSummary" type="text/x-handlebars-template">
    <table class="table table-bordered table-summary pull-right">
        <thead>
            <tr class="align-middle">
                <th colspan="1" rowspan="2" style="vertical-align: middle;color: red;">총 방송방</th>
                <th colspan="3">플랫폼별</th>
            </tr>
            <tr>
                <th>IOS</th>
                <th>AOS</th>
                <th>PC</th>
            </tr>
        </thead>
        <tbody>
            <td style="color: red;">{{#equal length '0'}}0{{/equal}}{{content.totalBroadCastCnt}}건</td>
            <td>{{#equal length '0'}}0{{/equal}}{{content.totalIosCnt}}건</td>
            <td>{{#equal length '0'}}0{{/equal}}{{content.totalAosCnt}}건</td>
            <td>{{#equal length '0'}}0{{/equal}}{{content.totalPcCnt}}건</td>
        </tbody>
    </table>
</script>

<script id="live_tableSummary" type="text/x-handlebars-template">
    <table class="table table-bordered table-summary pull-right">
        <thead>
            <tr style="height: 68px;">
                <th style="vertical-align: middle;color:red;">총 청취자</th>
                <th style="vertical-align: middle;">총 선물</th>
                <th style="vertical-align: middle;">총 좋아요</th>
                <th style="vertical-align: middle;">총 청취자<br/>부스터</th>
                <th style="vertical-align: middle;">총 강제퇴장</th>
            </tr>
        </thead>
        <tbody id="summaryDataTable">
            <td style="color: red">{{#equal length '0'}}0{{/equal}}{{content.liveListenerCnt}}건</td>
            <td>{{#equal length '0'}}0{{/equal}}{{content.totalGiftCnt}}건</td>
            <td>{{#equal length '0'}}0{{/equal}}{{content.totalGoodCnt}}건</td>
            <td>{{#equal length '0'}}0{{/equal}}{{content.totalBoosterCnt}}건</td>
            <td>{{#equal length '0'}}0{{/equal}}{{content.totalForcedCnt}}건</td>
        </tbody>
    </table>
</script>

<script id="endlive_tableSummary" type="text/x-handlebars-template">
    <table class="table table-bordered table-summary pull-right">
        <thead>
        <tr style="height: 68px;">
            <th style="vertical-align: middle;color:red;">누적 청취자</th>
            <th style="vertical-align: middle;">총 선물</th>
            <th style="vertical-align: middle;">총 좋아요</th>
            <th style="vertical-align: middle;">총 청취자<br/>부스터</th>
            <th style="vertical-align: middle;">총 강제퇴장</th>
        </tr>
        </thead>
        <tbody>
        <td style="color: red">{{#equal length '0'}}0{{/equal}}{{content.totalListenerCnt}}건</td>
        <td>{{#equal length '0'}}0{{/equal}}{{content.totalGiftCnt}}건</td>
        <td>{{#equal length '0'}}0{{/equal}}{{content.totalGoodCnt}}건</td>
        <td>{{#equal length '0'}}0{{/equal}}{{content.totalBoosterCnt}}건</td>
        <td>{{#equal length '0'}}0{{/equal}}{{content.totalForcedCnt}}건</td>
        </tbody>
    </table>
</script>

<script id="dj_typeTableSummary" type="text/x-handlebars-template">
    <table class="table table-bordered table-summary pull-right">
        <thead>
        <tr>
            <th colspan="3">DJ구분</th>
        </tr>
        <tr>
            <th>일반</th>
            <th>신입</th>
            <th>스페셜DJ</th>
        </tr>
        </thead>
        <tbody>
        <td>{{#equal length '0'}}0{{/equal}}{{content.normalDjCnt}}명</td>
        <td>{{#equal length '0'}}0{{/equal}}{{content.newDjCnt}}명</td>
        <td>{{#equal length '0'}}0{{/equal}}{{content.specialDjCnt}}명</td>
        </tbody>
    </table>
</script>
