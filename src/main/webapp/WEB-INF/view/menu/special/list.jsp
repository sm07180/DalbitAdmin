
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
                            <h3 class="title"><i class="fa fa-search"></i> DJ 검색</h3>
                            <div>
                                <span id="searchTypeArea"></span>
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

                <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist">
                    <li class="active">
                        <a href="/menu/recommend/list"><i class="fa fa-home"></i> 추천DJ</a>
                    </li>
                    <li>
                        <a href="/menu/best/list"><i class="fa fa-user"></i> 인기DJ</a>
                    </li>
                </ul>
                <div class="widget widget-table">
                    <div class="widget-content" style="border-top-width:0px;">

                        <div class="table-comment">
                            DJ/Fan랭킹 Main 노출 수는 1위부터 5위까지 총5명입니다.
                        </div>

                        <table id="list_info" class="table table-sorting table-hover table-bordered" style="margin-top: 10px;">
                            <thead id="tableTop"></thead>
                            <tbody id="tableBody"></tbody>
                        </table>
                        <span>
                            <button class="btn btn-default print-btn" type="button"><i class="fa fa-print"></i>선택삭제</button>
                            <button class="btn btn-default print-btn pull-right" type="button"><i class="fa fa-print"></i>Excel 출력</button>
                        </span>
                    </div>
                </div>
            </div>
            <!-- DATA TABLE END -->
        </div>
    </div>
</div>

<script type="text/javascript" src="/js/dataTablesSource/menuDataTableSource.js?${dummyData}"></script>
<script type="text/javascript" src="/js/code/menu/menuCodeList.js?${dummyData}"></script>
<script type="text/javascript">

    $(function(){
        init();
        getSearch();
    });

    $('#bt_search').on('click', function(){
        getSearch();
    });

    var memNo = "";
    var dtList_info="";
    function init(){

        var dtList_info_data = function ( data ) {
            data.search = $('#txt_search').val();                        // 검색명
            data.gubun = $("select[name='selectGubun']").val();
            data.value = '01';
        };

        dtList_info = new DalbitDataTable($("#list_info"), dtList_info_data, MenuDataTableSource.recommend);
        dtList_info.useCheckBox(false);
        dtList_info.useIndex(true);
        // dtList_info.setEventClick(test01,0);
        dtList_info.createDataTable();

        $("#searchTypeArea").html(util.getCommonCodeSelect(null, special_searchType))
    }

    function getSearch(){
        /* 엑셀저장을 위해 조회조건 임시저장 */
        tmp_search = $('#txt_search').val();
        tmp_gubun = $("select[name='selectGubun']").val();

        dtList_info.reload();

        $('tbody').sortable({
            stop: function (e, ui) {
                resetNo();
                btnSet();
            }
        });
    }

    $(document).on('click', '._down', function(){
        var targetTr = $(this).closest('tr');
        var nextTr = targetTr.next();
        targetTr.insertAfter(nextTr);
        resetNo();
        btnSet();
    });

    $(document).on('click', '._up', function(){
        var targetTr = $(this).closest('tr');
        var prevTr = targetTr.prev();
        targetTr.insertBefore(prevTr);
        resetNo();
        btnSet();
    });

    function resetNo(){
        $('tbody tr').each(function(index){
            $(this).find('td:first').html(index + 1);
        });
    }

    function btnSet(){
        $('.btn._down').prop('disabled', false);
        $('.btn._down:last').prop('disabled', true);

        $('.btn._up').prop('disabled', false);
        $('.btn._up:first').prop('disabled', true);
    }
</script>