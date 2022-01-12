<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dummyData" value="<%= java.lang.Math.round(java.lang.Math.random() * 1000000) %>"/>
<% String specialDetailData = request.getParameter("specialDetailData"); %>

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
  const specialDetailData = <%=specialDetailData%>;

  $(document).ready(function() {
    getSpecialDetailData()
  });

  function getSpecialDetailData() {
    const paramData = {
      goodNo: specialDetailData.good_no,
      memNo: specialDetailData.mem_no,
    }

    util.getAjaxData('goodStartData', '/rest/content/event/goodstart/event/special/detail/list', paramData
      , getSuccessCallback, errorFunc, {type: 'GET'}
    )

    function getSuccessCallback(id, response, params) {
      console.log('success callback', id, response, params)
      let template, templateScript, context, html;

      template = $('#goodStart_fan_detail_table').html();
      templateScript = Handlebars.compile(template);
      context = response;
      html = templateScript(context);
      $("#tableArea").html(html);
    }

    function errorFunc() {
      console.error('specialScoreDetail.jsp > 굿스타트 - 팬 - 스페셜 점수 상세 데이터 조회 오류')
    }
  }
</script>

<script type="text/x-handlebars-template" id="goodStart_fan_detail_table">
    <table id="fanDetailTable" class="table table-sorting table-hover table-bordered">
        <colgroup>
            <col width="33%"/>
            <col width="33%"/>
            <col width="33%"/>
        </colgroup>
        <thead>
        <tr>
            <th>선물대상(회원번호)</th>
            <th>선물개수</th>
            <th>특별점수(20%)</th>
        </tr>
        </thead>
        <tbody id="fanDetailTableBody">
        {{#each this as |data|}}
        <tr>
            <td>{{{memNoLink bj_mem_no bj_mem_no}}}</td>
            <td>{{addComma tot_send_dal_cnt}}</td>
            <td>{{addComma special_score}}</td>
        </tr>
        {{else}}
        <tr>
            <td colspan="3">{{isEmptyData}}</td>
        </tr>
        {{/each}}
        </tbody>
    </table>
</script>