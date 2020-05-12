
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
            <div class="col-md-6 pull-right">
                <span id="live_summaryArea"></span>
                <span id="platform_summaryArea"></span>
            </div>
            <div class="widget-content" style="border-top-width:0px;">
                <table id="list_info" class="table table-sorting table-hover table-bordered">
                    <thead id="tableTop"></thead>
                    <tbody id="tableBody"></tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<!-- DATA TABLE END -->

<!-- 이미지 원본 보기 -->
<div id="imageFullSize"></div>

<script type="text/javascript" src="/js/code/broadcast/broadCodeList.js"></script>

<script>
    $("#searchType_broad").html(util.getCommonCodeSelect(-1, searchType_broad));
    $("#searchRadio").html(util.getCommonCodeRadio(1, searchRadio));

    $(document).ready(function() {
        getSearch();
        mouseOver();
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

    var room_liveType = 1;
    var dtList_info="";
    var dtList_info_data = function (data) {
        var slctType = $('input[name="searchRadio"]:checked').val();
        data.slctType = slctType;
        if(slctType == "1"){      // DJ정보
            data.dj_slctType = $("select[name='searchType_broad']").val();
            data.dj_searchText = $('#txt_search').val();
            data.room_slctType = -1;
            data.room_searchText = "";
            data.ortStartDate =2;
        }else {                                                              // 방송정보
            data.dj_slctType = -1;
            data.dj_searchText = "";
            data.room_slctType = $("select[name='searchBroad_broad']").val();
            data.room_searchText = $('#txt_search').val();
            data.ortStartDate =2;
        }
        data.room_liveType = room_liveType;
        data.sortStartDate = 0;
    };
    dalbitLog(dtList_info_data);
    dtList_info = new DalbitDataTable($("#list_info"), dtList_info_data, BroadcastDataTableSource.liveList);
    dtList_info.useCheckBox(false);
    dtList_info.useIndex(true);
    dtList_info.setPageLength(50);
    dtList_info.createDataTable(summary_table);
    var excelBtn = '<button class="btn btn-default btn-sm print-btn pull-right" type="button" id="liveexcelDownBtn"><i class="fa fa-print"></i>Excel Down</button>';
    $("#main_table").find(".footer-right").append(excelBtn);

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

        var template = $("#live_tableSummary").html();
        var templateScript = Handlebars.compile(template);
        var data = {
            content : json.summary
            , length : json.recordsTotal
        };
        var html = templateScript(data);
        $("#live_summaryArea").html(html);

    }

    var tmp_slctType;
    var tmp_dj_slctType = -1;
    var tmp_dj_searchText;
    var tmp_room_slctType = -1;
    var tmp_room_searchText;
    function getSearch(){
        /* 엑셀저장을 위해 조회조건 임시저장 */
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

    function liveList(tmp){
        if(tmp == 1){
            $("#liveTitle").html("ㆍ실시간 생방송 시작된 방송이 최상위 누적되어 보여집니다.<br/>ㆍDJ가 방송을 완료한 경우 해당 방송은 리스트에서 삭제됩니다.");
        }else if(tmp == 2){
            $("#liveTitle").html("ㆍ종료된 방송은 방송종료일을 기준으로 최상위 누적되어 보여집니다.<br/>" +
                                 "ㆍDJ가 방송을 완료한 경우 해당 방송은 리스트에서 추가됩니다.");
        }

        room_liveType = tmp;
        getSearch();
    }

    function fullSize_live(url) {     // 이미지 full size
        $("#imageFullSize").html(util.imageFullSize("fullSize_live", url));
        $('#fullSize_live').modal('show');
    }
    function modal_close(){
        $("#fullSize_live").modal('hide');
    }
    mouseOver();
    function mouseOver(){
        var xOffset = 10;
        var yOffset = 30;

        $(document).on("mouseover",".thumbnail",function(e){ //마우스 오버
            $("body").append("<p id='preview'><img src='"+ $(this).attr("src") +"' width='400px' /></p>"); //이미지
            $("#preview")
                .css("top",(e.pageY - xOffset) + "px")
                .css("left",(e.pageX + yOffset) + "px")
                .fadeIn("fast");
        });
        $(document).on("mousemove",".thumbnail",function(e){ //마우스 이동
            $("#preview")
                .css("top",(e.pageY - xOffset) + "px")
                .css("left",(e.pageX + yOffset) + "px");
        });
        $(document).on("mouseout",".thumbnail",function(){ //마우스 아웃
            $("#preview").remove();
        });
    }
    /*=============엑셀==================*/
    $('#liveexcelDownBtn').on('click', function(){
        var formElement = document.querySelector("form");
        var formData = new FormData(formElement);
        formData.append("slctType", tmp_slctType);
        formData.append("dj_slctType", tmp_dj_slctType);
        formData.append("dj_searchText", tmp_dj_searchText);
        formData.append("room_slctType", tmp_room_slctType);
        formData.append("room_searchText", tmp_room_searchText);
        util.excelDownload($(this), "/rest/broadcast/broadcast/liveListExcel", formData)
    });

</script>

<script id="platform_tableSummary" type="text/x-handlebars-template">
    <table class="table table-bordered table-summary pull-right">
        <thead>
            <tr class="align-middle">
                <th colspan="1" rowspan="2" style="vertical-align: middle;">총 방송방</th>
                <th colspan="3">플랫폼별</th>
            </tr>
            <tr>
                <th>IOS</th>
                <th>AOS</th>
                <th>PC</th>
            </tr>
        </thead>
        <tbody>
            <td>{{#equal length '0'}}0{{/equal}}{{content.totalBroadCastCnt}}건</td>
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
                <th style="vertical-align: middle;">총 청취자</th>
                <th style="vertical-align: middle;">총 선물</th>
                <th style="vertical-align: middle;">총 좋아요</th>
                <th style="vertical-align: middle;">총 청취자<br/>부스터</th>
                <th style="vertical-align: middle;">총 강제퇴장</th>
            </tr>
        </thead>
        <tbody id="summaryDataTable">
            <td>{{#equal length '0'}}0{{/equal}}{{content.totalListenerCnt}}건</td>
            <td>{{#equal length '0'}}0{{/equal}}{{content.totalGiftCnt}}건</td>
            <td>{{#equal length '0'}}0{{/equal}}{{content.totalGoodCnt}}건</td>
            <td>{{#equal length '0'}}0{{/equal}}{{content.totalBoosterCnt}}건</td>
            <td>{{#equal length '0'}}0{{/equal}}{{content.totalForcedCnt}}건</td>
        </tbody>
    </table>
</script>
