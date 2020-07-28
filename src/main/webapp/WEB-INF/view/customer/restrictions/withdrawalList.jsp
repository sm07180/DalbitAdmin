<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="col-lg-12 no-padding">
    <div class="widget widget-table" id="main_table">
        <div class="pull-left pt10 pl10"><span id="searchOpCode"></span></div>
        <div class="widget-content">
            <table id="tb_res_withdrawalList" class="table table-sorting table-hover table-bordered">
                <thead></thead>
                <tbody></tbody>
            </table>
        </div>
    </div>
</div>


<script src="/js/dataTablesSource/customer/restrictionsDataTableSource.js?${dummyData}"></script>
<script type="text/javascript" src="/js/code/customer/restrictionsCodeList.js?${dummyData}"></script>

<script>
    var targetMemNo = "";
    $(document).ready(function() {
        $("#searchOpCode").html(util.getCommonCodeSelect(-1, restrictions_searchOpCode));
        getRes_withdrawalList(targetMemNo);
    });

    $(document).on('click', '#bt_state', function() {           // 상태 정상으로 변경
        var memNo = $(this).data("memno");
        stateEdit(memNo);
    });

    $(document).on('change', '#opCode', function() {          // 경고/정지회원 회원상태 select
        getRes_withdrawalList(targetMemNo);
    });

    function getRes_withdrawalList(memNo){
        targetMemNo = memNo;
        var dtList_info;
        var dtList_info_data = function ( data ) {
            var searchType = $('#searchType option:selected').val();
            var searchText = $('#txt_search').val();
            var startDate = $("#startDate").val();
            var endDate = $("#endDate").val();
            if($('input[name="searchRadio"]:checked').val() != "1"){
                searchType = $('input[name="searchRadio"]:checked').val();       // IP 검색 : 9 , 모바일ID 검색 : 6
            }

            if(memNo){
                searchType = "1";
                searchText = memNo;
                startDate = "1900.01.01";
                endDate = "9000.01.01";
            }

            data.searchType = searchType;       // 검색구분
            data.searchText = searchText;            // 검색명
            data.opCode = $("#opCode").val();
            data.startDate = startDate;
            data.endDate = endDate;
            // data.pageCnt = 10;
        };
        dtList_info = new DalbitDataTable($("#tb_res_withdrawalList"), dtList_info_data, RestrictionsDataTableSource.withdrawalList);
        dtList_info.useCheckBox(false);
        dtList_info.useIndex(true);
        dtList_info.useInitReload(false);
        dtList_info.createDataTable();
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

</script>