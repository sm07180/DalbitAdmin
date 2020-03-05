
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
                            <select class="form-control searchType" name="selectGubun">
                                <option value="9999" selected="selected">전체</option>
                                <option value="1">User ID</option>
                                <option value="2">User 닉네임</option>
                                <option value="3">연락처</option>
                                <option value="4">이름</option>
                            </select>
                            <label><input type="text" class="form-control" id="txt_search"></label>
                            <select class="form-control searchType" name="selectGubun_broad">
                                <option value="9999" selected="selected">전체</option>
                                <option value="1">방송제목</option>
                                <option value="2">인사말</option>
                                <option value="3">방송중공지</option>
                            </select>
                            <label><input type="text" class="form-control" id="txt_broad"></label>
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
                <div class="col-md-6 no-padding">
                    <label>ㆍ실시간 생방송 시작된 방송이 최상위 누적되어 보여집니다.</label>
                </div>
                <div class="col-md-6 no-padding pull-right">
                    <div class="widget widget-table">
                        <div class="widget-content" style="border-top-width:0px;padding-bottom: 0px;">
                            <table id="top_info" class="table table-sorting table-hover table-bordered">
                                <thead id="table_Top"></thead>
                                <tbody id="table_Body"></tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="col-md-12 no-padding">
                    <div class="widget widget-table">
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

<script type="text/javascript" src="/js/dataTablesSource/menuDataTableSource.js"></script>
<script type="text/javascript">

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

    $(function(){
        init();
        getSearch();
    });
    $('#bt_search').on('click', function(){
        getSearch();
    });

    var memNo = "";
    var dtList_info="";
    var dtList_top_info="";
    function init(){
        var dtList_info_data = function ( data ) {
            data.search = $('#txt_search').val();                            // 검색명
            data.gubun = $("select[name='selectGubun']").val();
            data.searchBroad = $('#txt_broad').val();                        // 방송색명
            data.gubunBroad = $("select[name='selectGubun_broad']").val();
        };
        dtList_info = new DalbitDataTable($("#list_info"), dtList_info_data, BroadcastDataTableSource.liveList);
        dtList_info.useCheckBox(false);
        dtList_info.useIndex(true);
        // dtList_info.setOrder(1,"desc");
        dtList_info.createDataTable();


        var dtList_info_data = function ( data ) {
            data.search = $('#txt_search').val();                            // 검색명
            data.gubun = $("select[name='selectGubun']").val();
            data.searchBroad = $('#txt_broad').val();                        // 방송색명
            data.gubunBroad = $("select[name='selectGubun_broad']").val();
        };
        dtList_top_info = new DalbitDataTable($("#top_info"), dtList_info_data, BroadcastDataTableSource.live_top_list);
        dtList_top_info.useCheckBox(false);
        dtList_top_info.useIndex(false);
        // dtList_info.setOrder(14,"desc");
        dtList_top_info.createDataTable();
    }
    function getSearch(){
        /* 엑셀저장을 위해 조회조건 임시저장 */
        var tmp_search = $('#txt_search').val();
        var tmp_gubun = $("select[name='selectGubun']").val();
        var tmp_searchBroad = $('#txt_broad').val();                        // 방송색명
        var tmp_gubunBroad = $("select[name='selectGubun_broad']").val();

        dtList_info.reload();
        dtList_top_info.reload();
    }
</script>