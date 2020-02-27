
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="container-fluid">
                <div class="row col-lg-12 form-inline">
                    <div class="widget widget-table" style="margin-bottom: 10px;">
                        <div class="widget-header" style="border-bottom-width:0px;">
                            <h3><i class="fa fa-search"></i> 추천/인기DJ 검색</h3>
                            <div>
                                <select class="form-control" name="selectGubun" style="margin-left:10px;background:#ffffff;">
                                    <option value="9999" selected="selected">전체</option>
                                    <option value="1">User ID</option>
                                    <option value="2">User 닉네임</option>
                                    <option value="3">연락처</option>
                                    <option value="4">이름</option>
                                </select>
                                <label><input type="text" class="form-control" id="txt_search"></label>
                                <button type="submit" class="btn btn-success" id="bt_search">검색</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- DATA TABLE -->
                <div class="row col-lg-12 form-inline">

                    <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist">
                        <li class="active" id="_recommendTab">
                            <a href="javascript://" role="tab" data-toggle="tab" aria-expanded="true"><i class="fa fa-home"></i> 추천DJ</a>
                        </li>
                        <li class="" id="_bestTab">
                            <a href="javascript://" role="tab" data-toggle="tab" aria-expanded="false"><i class="fa fa-user"></i> 인기DJ</a>
                        </li>
                    </ul>
                    <div class="widget widget-table">
                        <div class="widget-content" style="border-top-width:0px;">
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
</div>

<script type="text/javascript" src="/js/dataTablesSource/menuDataTableSource.js"></script>
<script type="text/javascript">

    $('#bt_search').on('click', function(){
        getSearch();
    });
    $('#_recommendTab').on('click', function(){
        getHistoryDetail(this.id);
    });
    $('#_bestTab').on('click',function(){
        getHistoryDetail(this.id);
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
    }

    init();

    function getSearch(){
        /* 엑셀저장을 위해 조회조건 임시저장 */
        tmp_search = $('#txt_search').val();
        tmp_gubun = $("select[name='selectGubun']").val();

        dtList_info.reload();
    }
</script>