
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="container-fluid">
            <!-- serachBox -->
            <div class="row col-lg-12 form-inline">
                <div class="widget widget-table searchBoxArea">
                    <div class="widget-header searchBoxRow">
                        <h3 class="title"><i class="fa fa-search"></i> 방송 검색</h3>
                        <div>
                            <span id="searchRadio"></span>
                            <span id="searchType_broad"></span>
                            <label><input type="text" class="form-control" id="txt_search"></label>
                            <button type="submit" class="btn btn-success" id="bt_search">검색</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- //serachBox -->
            <!-- DATA TABLE -->
            <div class="row col-lg-12 form-inline">
                <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist">
                    <li class="active">
                        <a href="/broadcast/live/list"><i class="fa fa-home"></i> 실시간 최신 생방송</a>
                    </li>
                </ul>
                <div class="col-md-12 no-padding">
                    <div class="widget widget-table" id="main_table">
                        <span id="live_summaryArea"></span>
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
        </div>
    </div>
</div>

<!-- 이미지 원본 보기 -->
<div id="imageFullSize"></div>

<script type="text/javascript" src="/js/code/broadcast/broadCodeList.js"></script>

<script>
    $("#searchType_broad").html(util.getCommonCodeSelect(-1, searchType_broad));
    $("#searchRadio").html(util.getCommonCodeRadio(1, searchRadio));

    $(document).ready(function() {
        $('#searchRadio').change(function() {
            console.log($('input[name="searchRadio"]:checked').val());
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
    });
    $(function(){
        getSearch();
    });
    $('#bt_search').on('click', function(){
        getSearch();
    });
    $('#bt_broad').on('click', function(){
        getSearch();
    });

    var dtList_info="";
    var dtList_info_data = function (data) {
        var slctType = $('input[name="searchRadio"]:checked').val()
        data.slctType = $('input[name="searchRadio"]:checked').val();
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
        data.pageCnt=10;
    };
    dtList_info = new DalbitDataTable($("#list_info"), dtList_info_data, BroadcastDataTableSource.liveList);
    dtList_info.useCheckBox(false);
    dtList_info.useIndex(true);
    dtList_info.setPageLength(10);
    dtList_info.createDataTable(live_summary_table);
    var excelBtn = '<button class="btn btn-default btn-sm print-btn pull-right" type="button" id="excelDownBtn"><i class="fa fa-print"></i>Excel Down</button>';
    $("#main_table").find(".footer-right").append(excelBtn);

    function live_summary_table(json){
        // dalbitLog(json);
        var template = $("#live_tableSummary").html();
        var templateScript = Handlebars.compile(template);
        var data = {
            header : live_summary
            , content : json.summary
            , length : json.recordsTotal
        }
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
        var slctType = $('input[name="searchRadio"]:checked').val()
        tmp_slctType = $('input[name="searchRadio"]:checked').val();
        if(slctType == "1"){
            tmp_dj_slctType = $("select[name='searchType_broad']").val();
            tmp_dj_searchText = $('#txt_search').val();
        }else {
            tmp_room_slctType = $("select[name='searchBroad_broad']").val();
            tmp_room_searchText = $('#txt_search').val();
        }
        dtList_info.reload(live_summary_table);
    }

    function fullSize_live(url) {     // 이미지 full size
        $("#imageFullSize").html(util.imageFullSize("fullSize_live",url));
        $('#fullSize_live').modal('show');
    }
    function onErrorImg(){
        var tmp = IMAGE_SERVER_URL + "/profile_3/profile_f.jpg";
        console.log("--------------------------- 1");
        console.log(tmp);
        $("#profileImg").prop("src" ,tmp);
        console.log("--------------------------- 2");
        console.log($("#profileImg").prop("src"));
    }
    /*=============엑셀==================*/
    $('#excelDownBtn').on('click', function(){
        var formElement = document.querySelector("form");
        var formData = new FormData(formElement);
        formData.append("slctType", tmp_slctType);
        formData.append("dj_slctType", tmp_dj_slctType);
        formData.append("dj_searchText", tmp_dj_searchText);
        formData.append("room_slctType", tmp_room_slctType);
        formData.append("room_searchText", tmp_room_searchText);
        util.excelDownload($(this), "/rest/broadcast/broadcast/listExcel", formData, fn_success_excel, fn_fail_excel)
    });
    function fn_success_excel(){
        console.log("fn_success_excel");
    }
    function fn_fail_excel(){
        console.log("fn_fail_excel");
    }

</script>

<script id="live_tableSummary" type="text/x-handlebars-template">
    <table class="table table-bordered table-summary pull-right" id="declarationSummary">
        <thead>
        <tr>
            {{#each this.header}}
                <th>{{this.code}}</th>
            {{/each}}
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
