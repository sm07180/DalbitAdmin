
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
                            <form id="search_radio">
                                <label class="radio-inline"><input type="radio" name="radio_search" value="member" checked>회원</label>
                                <label class="radio-inline"><input type="radio" name="radio_search" value="broad">방송</label>
                                <span id="searchType"></span>
                                <label><input type="text" class="form-control" id="txt_search"></label>
                                <button type="submit" class="btn btn-success" id="bt_search">검색</button>
                            </form>
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

<script type="text/javascript" src="/js/code/broadcast/broadCodeList.js"></script>

<script>
    $("#searchType").html(util.getCommonCodeSelect(-1, searchType));

    $(document).ready(function() {
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
    $(document).ready(function() {
        $('input[id="txt_broad"]').keydown(function() {
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

    $('#search_radio').change(function() {
        if($('input[name="radio_search"]:checked').val() == "member"){
            $("#searchType").html(util.getCommonCodeSelect(-1, searchType));
        }else{
            $("#searchType").html(util.getCommonCodeSelect(-1, searchBroad));
        }
    });

    $(function(){
        init();
        getSearch();
    });
    $('#bt_search').on('click', function(){
        getSearch();
    });
    $('#bt_broad').on('click', function(){
        getSearch();
    });

    var dtList_info="";
    function init() {
        var dtList_info_data = function (data) {
            data.search = $('#txt_search').val();                            // 검색명
            data.gubun = $("select[name='selectGubun']").val();
            data.searchBroad = $('#txt_broad').val();                        // 방송색명
            data.gubunBroad = $("select[name='selectGubun_broad']").val();
        };
        dtList_info = new DalbitDataTable($("#list_info"), dtList_info_data, BroadcastDataTableSource.liveList);
        dtList_info.useCheckBox(false);
        dtList_info.useIndex(true);
        dtList_info.createDataTable(live_summary_table);
    }

    function live_summary_table(json){
        // dalbitLog(json);
        var template = $("#live_tableSummary").html();
        var templateScript = Handlebars.compile(template);
        var data = {
            header : live_summary
            , content : json.summary
        }
        var html = templateScript(data);
        $("#live_summaryArea").html(html);
    }

    function getSearch(){
        /* 엑셀저장을 위해 조회조건 임시저장 */
        var tmp_search = $('#txt_search').val();
        var tmp_gubun = $("select[name='selectGubun']").val();
        var tmp_searchBroad = $('#txt_broad').val();                        // 방송색명
        var tmp_gubunBroad = $("select[name='selectGubun_broad']").val();

        dtList_info.reload();
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
            <td>{{content.totalListen}}건</td>
            <td>{{content.totalgift}}건</td>
            <td>{{content.totalGood}}건</td>
            <td>{{content.totalBooster}}건</td>
            <td>{{content.totalBan}}건</td>
        </tbody>
    </table>
</script>
