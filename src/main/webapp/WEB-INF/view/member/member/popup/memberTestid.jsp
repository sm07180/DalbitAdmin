<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String in_name = request.getParameter("name");
%>

<div class="col-md-12 no-padding">
    <div class="widget-content">
        <div class="widget-content mt10">
            <table id="list_info" class="table table-sorting table-hover table-bordered">
                <colgroup>
                    <col width="1%"/><col width="3%"/><col width="3%"/><col width="4%"/><col width="3%"/>
                    <col width="5.8%"/><col width="5.8%"/><col width="5.8%"/><col width="4%"/><col width="7%"/>
                    <col width="7%"/><col width="8%"/><col width="5.8%"/><col width="5.8%"/><col width="5.8%"/>
                    <col width="5.8%"/><col width="5.8%"/>
                </colgroup>
                <thead>
                <tr>
                    <th><input type="checkbox" id="allChk" /></th>
                    <th>No</th>
                    <th>사번</th>
                    <th>직원명</th>
                    <th>관계</th>
                    <th>회원번호</th>
                    <th>User ID</th>
                    <th>User 닉네임</th>
                    <th>성별</th>
                    <th>달/별 충전일</th>
                    <th>보유 달/별 수</th>
                    <th>연락처</th>
                    <th>레벨/등급</th>
                    <th>등록일</th>
                    <th>최근수정일</th>
                    <th>최근로그인</th>
                    <th>상태</th>
                </tr>
                </thead>
                <tbody id="tableBody">
                </tbody>
            </table>
        </div>
    </div>
</div>

<script type="text/javascript" src="/js/code/administrate/adminCodeList.js?${dummyData}"></script>
<script type="text/javascript" src="/js/code/customer/customerCodeList.js?${dummyData}"></script>
<script type="text/javascript" src="/js/handlebars/administrateHelper.js?${dummyData}"></script>

<script>
    $(document).ready(function() {
        var data = new Object();
        data.searchType = 0;
        data.searchText = "<%=in_name%>";
        util.getAjaxData("summary", "/rest/administrate/testId/list", data, fn_list_success);
    });

    function fn_list_success(dst_id, response){
        if(response.result == 'success'){
            var template = $('#tmp_list').html();
            var templateScript = Handlebars.compile(template);
            var context = response.data;
            var html=templateScript(context);
            $("#tableBody").html(html);
        }
    }

</script>

<script id="tmp_list" type="text/x-handlebars-template">
    {{#each this as |user|}}
    <tr>
        <td><input type="checkbox" class="_chk" data-memno="{{user.mem_no}}" /></td>
        <td>{{index @index}}</td>
        <td>{{user.emp_no}}</td>
        <td>{{user.emp_name}}</td>
        <td>{{relationName user.relation}}</td>
        <td>{{user.mem_no}}</td>
        <td><a href="javascript://" class="_openMemberPop" data-memNo="{{user.mem_no}}">{{user.mem_userId}}</a></td>
        <td>{{user.mem_nick}}</td>
        <td>{{{sexIcon user.mem_sex}}}</td>
        <td>{{user.type}}: {{user.charge}}<br/>
            {{user.chargeDate}}
        </td>
        <td><label class="font-bold" style="color: #7030a0;">달 : {{user.dal}}</label><br/>
            <label class="font-bold" style="color: #b79135;">별 : {{user.byeol}}</label>
        </td>
        <td>{{user.mem_phone}}</td>
        <td>{{user.level}} / {{user.grade}}</td>
        <td>{{user.reg_date}}</td>
        <td>{{user.lastOpDate}}<br/>{{user.lastOpName}}</td>
        <td>{{user.lastLoginDatetime}}</td>
        <td>{{stateName user.mem_state}}</td>
    </tr>
    {{else}}
    <tr>
        <td colspan="12">{{isEmptyData}}</td>
    </tr>
    {{/each}}
</script>