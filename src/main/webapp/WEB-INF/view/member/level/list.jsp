<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dummyData"><%= java.lang.Math.round(java.lang.Math.random() * 1000000) %></c:set>

<div class="col-lg-12 no-padding">
    <div class="widget widget-table" id="main_table">
        <div class="widget-content">
            <table id="list_info_detail" class="table table-sorting table-hover table-bordered datatable">
                <thead id="tableTop_detail">
                </thead>
                <tbody id="tableBody_detail">
                </tbody>
            </table>
        </div>
    </div>
</div>
<script src="/js/dataTablesSource/status/levelDataTableSource.js?${dummyData}"></script>
<script>
    $(document).ready(function() {
    });

    function getHistory_levelHistory(tmp) {     // 상세보기
        if(tmp.indexOf("_") > 0){ tmp = tmp.split("_"); tmp = tmp[1]; }

        var dtList_info_data = function(data) {
            data.searchText = memNo;                        // 검색명
            data.level = "";
            data.inner = -1;
            data.include = 0;
        };

        dtList_info_detail = new DalbitDataTable($("#"+tmp).find("#list_info_detail"), dtList_info_data, levelDataTableSource.memLevelList);
        dtList_info_detail.useCheckBox(false);
        dtList_info_detail.useIndex(true);
        dtList_info_detail.setPageLength(100);
        dtList_info_detail.useInitReload(true);
        dtList_info_detail.createDataTable();
    }

</script>
