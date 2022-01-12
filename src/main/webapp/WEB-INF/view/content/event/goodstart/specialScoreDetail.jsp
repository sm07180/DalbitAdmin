<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dummyData" value="<%= java.lang.Math.round(java.lang.Math.random() * 1000000) %>"/>

<div id="condition5">
    <div class="col-lg-12">
        <div class="widget widget-table">
        </div>
        <div class="clearfix widget-content mt5 mb5">
            <div id="tableArea"></div>
        </div>
    </div>
</div>
<script type="text/javascript" src="/js/code/content/contentCodeList.js?${dummyData}"></script>
<script type="text/javascript">
  <% String specialDetailData = request.getParameter("specialDetailData"); %>
  const jsonSpecialDetailData = "<%=specialDetailData%>";
  console.log(decodeURIComponent(jsonSpecialDetailData));
  const data = JSON.parse(decodeURIComponent(jsonSpecialDetailData));
  $(document).ready(function() {
    getSpecialDetailData()
  });

  function getSpecialDetailData() {
    const paramData = {
      goodNo: data.good_no,
      memNo: data.mem_no,
    }

    console.log('paramData : ', paramData);

    util.getAjaxData('goodStartData', '/rest/content/event/special/detail/list', paramData
      , getSuccessCallback, errorFunc, {type: 'GET'}
    )
  }
</script>