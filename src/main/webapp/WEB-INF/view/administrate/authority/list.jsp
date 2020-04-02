<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="cfn" uri="/WEB-INF/tld/comFunction.tld" %>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="container-fluid">
            <!-- serachBox -->
            <form id="searchForm">
                <div class="row col-lg-12 form-inline">
                    <div class="widget widget-table searchBoxArea">
                        <div class="widget-header searchBoxRow">
                            <h3 class="title"><i class="fa fa-search"></i> 직원 검색</h3>
                            <div>
                                <select name="posType" class="form-control searchType">
                                    <option value="">직급선택</option>
                                    <c:forEach var="posCode" items="${cfn:getInforexPosCode()}" varStatus="status">
                                        <option value="${posCode.pos_code}">${posCode.pos_name}</option>
                                    </c:forEach>
                                </select>

                                <select name="deptType" class="form-control searchType">
                                    <option value="">부서선택</option>
                                    <c:forEach var="deptCode" items="${cfn:getInforexDeptCode()}" varStatus="status">
                                        <option value="${deptCode.dept_no}">${deptCode.new_dept_name}</option>
                                    </c:forEach>
                                </select>

                                <label><input type="text" class="form-control" name="searchText" id="searchText" placeholder="검색할 정보를 입력하세요"></label>
                                <button type="button" class="btn btn-success" id="bt_search">검색</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            <!-- //serachBox -->
            <!-- DATA TABLE -->
            <div class="row col-lg-12 form-inline">
                <div class="widget widget-table">
                    <div class="widget-header">
                        <h3><i class="fa fa-desktop"></i> 검색결과</h3>
                        <div class="btn-group widget-header-toolbar">
                            <a href="#" title="열기/닫기" class="btn-borderless btn-toggle-expand">
                                <i class="fa fa-chevron-up" id="_searchToggleIcon"></i>
                            </a>
                        </div>
                    </div>
                    <div class="widget-content mt10">
                        <table class="table table-hover table-bordered">
                            <thead>
                                <tr>
                                    <th><input type="checkbox" id="all_chk"></th>
                                    <th>No.</th>
                                    <th>입사일</th>
                                    <th>부서/팀명</th>
                                    <th>직급/직책</th>
                                    <th>이름</th>
                                    <th>핸드폰</th>
                                    <th>회사메일</th>
                                    <th>개인메일</th>
                                    <th>네이트ID</th>
                                </tr>
                            </thead>
                            <tbody id="tableBody"></tbody>
                        </table>
                    </div>
                    <div class="widget-footer">
                        <span>
                            <button type="button" id="authority_btn" class="btn btn-danger print-btn pull-right mb10">권한부여</button>
                        </span>
                    </div>
                </div>
            </div>
            <!-- #DataTable -->

            <form id="faqForm"></form>
        </div>
    </div>
</div>

<script type="text/javascript" src="/js/lib/jquery.table2excel.js"></script>
<script type="text/javascript" src="/js/code/administrate/adminCodeList.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
        getMemberList();
    });

    $('#searchText').on('keydown', function(e) {
        if (e.keyCode === 13) {
            getMemberList();
        };
    });

    $('#bt_search').on('click', function(){
        getMemberList();
    });

    $('#all_chk').on('click', function(){
        if($(this).prop('checked')){
            $('._chk').prop('checked', true);
        }else{
            $('._chk').prop('checked', false);
        }

    });

    $('#authority_btn').on('click', function(){
        /*var checked = $('._chk:checked');
        checked.each(function(){
           dalbitLog($(this).data('empno'));
        });*/
        alert('준비중입니다.');
    });


    function getMemberList(){
        util.getAjaxData("memberList", "/rest/administrate/authority/list", $("#searchForm").serialize(), fn_memberList_success);
    }

    function fn_memberList_success(data, response, params){
        dalbitLog(response);

        var template = $('#tmp_memberList').html();
        var templateScript = Handlebars.compile(template);
        var context = response.data;
        var html=templateScript(context);
        $("#tableBody").html(html);

    }
</script>

<script id="tmp_memberList" type="text/x-handlebars-template">
    {{#each this as |member|}}
        <tr>
            <td><input type="checkbox" class="_chk" data-empno={{emp_no}}></td>
            <td>{{index @index no}}</td>
            <td>{{staff_enter_date}}</td>
            <td>{{new_dept_name}}</td>
            <td>
                {{#equal staff_pos_name staff_duty_name}}
                    {{member.staff_pos_name}}
                {{else}}
                    {{member.staff_pos_name}}/{{member.staff_duty_name}}
                {{/equal}}
            </td>
            <td>{{staff_name}}</td>
            <td>{{staff_hphone}}</td>
            <td>{{staff_email}}@inforex.co.kr</td>
            <td>{{staff_email_etc}}</td>
            <td>
                {{#equal staff_email_nate ''}}
                    -
                {{else}}
                    {{member.staff_email_nate}}
                {{/equal}}
            </td>
        </tr>
    {{else}}
        <tr>
            <td colspan="10">{{isEmptyData}}</td>
        </tr>
    {{/each}}
</script>