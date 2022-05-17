<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dummyData"><%= java.lang.Math.round(java.lang.Math.random() * 1000000) %></c:set>

<div id="condition5">
    <div class="col-lg-12">

        <div class="clearfix widget-content mt5 mb5">
            <h4 class="font-bold">■ 달라 그라운드</h4>
            <div id="tableArea" style="width: 50%"></div>
        </div>
    </div>
</div>
<script type="text/javascript">
  $(document).ready(function() {
    getDallaGroundData();
  });

  // data
  function getDallaGroundData() {
    util.getAjaxData('dalla_ground_data', '/rest/content/event/ground/page', null
      , getSuccessCallback, errorFunc, {type: 'GET'}
    )
  }

  function getSuccessCallback(id, response) {
    let template, templateScript, context, html;
    const { result, data } = response;
    const $targetId = $('#' + id);

    if(result === 'success') {
      template = $targetId.html();
      templateScript = Handlebars.compile(template);

      context = data.list.map(function (item, index) {
        item.rank_no = index + 1;
        return item;
      });

      html = templateScript(context);
      $("#tableArea").html(html);
    }else {
      console.log('dalla ground getList error!!');
    }
  }

  function errorFunc() {
    console.log('달라 그라운드 이벤트 api error');
  }
</script>

<script type="text/x-handlebars-template" id="dalla_ground_data">
    <table id="dallaGroundTable" class="table table-sorting table-hover table-bordered">
        <colgroup>
            <col width="15%"/>
            <col width="15%"/>
            <col width="45%"/>
            <col width="25%"/>
        </colgroup>
        <thead>
        <tr>
            <th>순위</th>
            <th>팀번호</th>
            <th>팀이름</th>
            <th>점수</th>
        </tr>
        </thead>
        <tbody id="dallaGroundTableBody">
        {{#each this as |data|}}
        <tr>
            <td>{{rank_no}}</td>
            <td>{{{teamLink team_no team_no 'use'}}}</td>
            <td>{{{teamLink team_name team_no 'use'}}}</td>
            <td>{{addComma rank_pt}}</td>
        </tr>
        {{else}}
        <tr>
            <td colspan="4">{{isEmptyData}}</td>
        </tr>
        {{/each}}
        </tbody>
    </table>
</script>