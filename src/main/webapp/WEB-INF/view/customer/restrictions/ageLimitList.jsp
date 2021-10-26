<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dummyData"><%= java.lang.Math.round(java.lang.Math.random() * 1000000) %></c:set>
<div class="pull-left pt10 pl10"><span id="selectYn"></span></div>
<div class="widget-content">
    <table id="tb_res_ageLimitList" class="table table-sorting table-hover table-bordered">
        <thead></thead>
        <tbody></tbody>
    </table>
</div>

<script src="/js/dataTablesSource/customer/restrictionsDataTableSource.js?${dummyData}"></script>
<script type="text/javascript" src="/js/code/customer/restrictionsCodeList.js?${dummyData}"></script>
<script>


  $(document).ready(function() {
    $("#selectYn").html(util.getCommonCodeSelect(-1, restrictions_selectYn));
      //getRes_ageLimitList();
  });

  function getRes_ageLimitList(certYn){
    var dtList_info2;
    var dtList_info_data2 = function ( data ) {
      // var searchType = -1;
      var searchText = $('#searchText').val();
      var startDate = common.isEmpty($("#onedayDate").val()) ? "-1" : $("#startDate").val();
      var endDate = common.isEmpty($("#onedayDate").val()) ? "-1" : $("#endDate").val();
      if($('input[name="searchRadio"]:checked').val() != "1"){
        searchType = $('input[name="searchRadio"]:checked').val();       // IP 검색 : 9 , 모바일ID 검색 : 6
      }

      // data.searchType = searchType;       // 검색구분
      data.searchText = searchText;                        // 검색명
      data.searchTarget = $('#searchTarget option:selected').val();       //대상
      data.startDate = startDate;
      data.endDate = endDate;
      data.newSearchType = $("#searchMember").val();
      // data.pageCnt = 10;
    };
    dtList_info2 = new DalbitDataTable($("#tb_res_ageLimitList"), dtList_info_data2, RestrictionsDataTableSource.ageLimitList);
    dtList_info2.useCheckBox(false);
    dtList_info2.useIndex(true);
    dtList_info2.useInitReload(false);
    dtList_info2.setPageLength(50)
    dtList_info2.createDataTable();
  }

</script>