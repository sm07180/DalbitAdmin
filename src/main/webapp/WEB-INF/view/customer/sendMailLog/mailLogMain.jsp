<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dummyData"><%= java.lang.Math.round(java.lang.Math.random() * 1000000) %></c:set>
<div class="pull-left pt10 pl10"><span id="selectYn"></span></div>
<div class="widget-content">
    <div class="dataTables_paginate paging_full_numbers" id="mailLog_paginate_top"></div>
    <table id="tb_res_sendMailLogList" class="table table-sorting table-hover table-bordered">
        <thead>
        </thead>
        <tbody>
        </tbody>
    </table>
    <div class="dataTables_paginate paging_full_numbers" id="mailLog_paginate_bot"></div>
</div>

<script src="/js/dataTablesSource/customer/sendMailLogDataTableSource.js?${dummyData}"></script>
<script type="text/javascript" src="/js/code/customer/restrictionsCodeList.js?${dummyData}"></script>
<script>
  const $mailSelectType = $("#sendMailSelect"); // 메일발송구분['':전체, 'a':동의, 'p':결제, 'c':결제취소]
  const $onedayDate = $("#onedayDate");

  $(document).ready(function() {
    getRes_sendMailLogList()
  });

  function getRes_sendMailLogList(){
    const selDate = $onedayDate.val().split('.');

    let data = {
      memNo: '0', // 전체: 0
      tDate: selDate[0] + '-' + selDate[1] + '-' + selDate[2],
      mailSlct: $mailSelectType.val(),
    };

    dtList_info = new DalbitDataTable($("#tb_res_sendMailLogList"), data, SendMailLogDataTableSource.sendMailLogList);
    dtList_info.useCheckBox(false);
    dtList_info.useIndex(true);
    dtList_info.setPageLength(50);
    dtList_info.useInitReload(false);
    dtList_info.createDataTable();
  }

  // 검색
  $("#sendMailSearch").on("click", function() {
    getRes_sendMailLogList();
  });

  // selectBox
  $mailSelectType.on("change", function() {
    getRes_sendMailLogList();
  });

  $("#bt_search").on("click", function() {
    getRes_sendMailLogList();
  });

  function handlebarsPaging(targetId, pagingInfo) {
    console.log('targetId, pagingInfo222 : ', targetId, pagingInfo);
    if(targetId === "mailLog_paginate_top" || targetId === "mailLog_paginate_bot") {
      getRes_sendMailLogList();
    }
  }
</script>