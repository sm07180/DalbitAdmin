<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div class="pull-left pt10 pl10"><span id="searchTarget"></span></div>
<div class="widget-content">
    <table id="tb_res_forcedList" class="table table-sorting table-hover table-bordered">
        <thead></thead>
        <tbody></tbody>
    </table>
</div>

<script src="/js/dataTablesSource/customer/restrictionsDataTableSource.js?${dummyData}"></script>
<script type="text/javascript" src="/js/code/customer/restrictionsCodeList.js?${dummyData}"></script>

<script>
    var targetMemNo = "";

    $(document).ready(function() {
        $("#searchTarget").html(util.getCommonCodeSelect(-1, restrictions_searchTarget));
        getRes_forcedList(targetMemNo);
    });

    $(document).on('change', '#searchTarget', function() {          // 경고/정지회원 회원상태 select
        getRes_forcedList(targetMemNo);
    });

    function getRes_forcedList(memNo){
        targetMemNo = memNo;
        var dtList_info2;
        var dtList_info_data2 = function ( data ) {
            var searchType = $('#searchType option:selected').val();
            var searchText = $('#txt_search').val();
            var startDate = $("#startDate").val();
            var endDate = $("#endDate").val();
            if($('input[name="searchRadio"]:checked').val() != "1"){
                searchType = $('input[name="searchRadio"]:checked').val();       // IP 검색 : 9 , 모바일ID 검색 : 6
            }

            if(!common.isEmpty(targetMemNo)){
                searchType = 1;
                searchText = targetMemNo;
                startDate = "1900.01.01";
                endDate = "9000.01.01";
            }

            data.searchType = searchType;       // 검색구분
            data.searchText = searchText;                        // 검색명
            data.searchTarget = $('#searchTarget option:selected').val();       //대상
            data.startDate = startDate;
            data.endDate = endDate;
            // data.pageCnt = 10;
        };
        dtList_info2 = new DalbitDataTable($("#tb_res_forcedList"), dtList_info_data2, RestrictionsDataTableSource.forcedList);
        dtList_info2.useCheckBox(false);
        dtList_info2.useIndex(true);
        dtList_info2.useInitReload(false);
        dtList_info2.setPageLength(50)
        dtList_info2.createDataTable();
    }

</script>