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
                                <select class="form-control searchType">
                                    <option value="">직급선택</option>
                                    <c:forEach var="posCode" items="${cfn:getInforexPosCode()}" varStatus="status">
                                        <option value="${posCode.pos_code}">${posCode.pos_name}</option>
                                    </c:forEach>
                                </select>

                                <select class="form-control searchType">
                                    <option value="">부서선택</option>
                                    <c:forEach var="deptCode" items="${cfn:getInforexDeptCode()}" varStatus="status">
                                        ${deptCode}
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
                        <table class="table table-sorting table-hover table-bordered">
                            <thead>
                                <tr>
                                    <th><input type="checkbox"></th>
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
                            <button class="btn btn-danger print-btn pull-right mb10" type="button">권한부여</button>
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
<script>
    $(document).ready(function() {
        getMemberList();
    });

    function getMemberList(){
        util.getAjaxData("memberList", "/rest/administrate/authority/list", null, fn_memberList_success);
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
    {{#each this}}
        <tr>
            <td><input type="checkbox"></td>
            <td>{{index @index no}}</td>
            <td>{{staff_enter_date}}</td>
            <td>{{new_dept_name}}</td>
            <td>{{staff_duty}}/{{staff_pos}}</td>
            <td>{{staff_name}}</td>
            <td>{{staff_hphone}}</td>
            <td>{{staff_email}}@inforex.co.kr</td>
            <td>{{staff_email_etc}}</td>
            <td>
                {{#equal staff_email_nate ''}}-{{/equal}}
                {{staff_email_nate}}
            </td>
        </tr>
    {{/each}}
</script>

<script id="tmp_faqFrm" type="text/x-handlebars-template">
    <input type="hidden" name="faqIdx" value="{{faqIdx}}" />
    <div class="row col-lg-12 form-inline mt15">
        <div class="col-md-12 no-padding">
            <label id="faq_detatil_title">ㆍ선택한 FAQ 정보를 확인/수정/삭제를 할 수 있습니다.</label>
            <span>
                {{^faqIdx}}<button class="btn btn-default pull-right" type="button" id="insertBtn">등록하기</button>{{/faqIdx}}
                {{#faqIdx}}<button class="btn btn-default pull-right" type="button" id="updateBtn">수정하기</button>{{/faqIdx}}
            </span>
        </div>
    </div>
    <div class="row col-lg-12">
        <table class="table table-bordered table-dalbit" style="margin-bottom: 0px;">
            <colgroup>
                <col width="5%" />
                <col width="5%" />
                <col width="5%" />
                <col width="10%" />
                <col width="5%" />
                <col width="10%" />
                <col width="5%" />
                <col width="5%" />
                <col width="5%" />
                <col width="5%" />
            </colgroup>
            <tbody>
            <tr class="align-middle">
                <th rowspan="2">No</th>
                <td rowspan="2" id="no">{{faqIdx}}</td>

                <th>구분</th>
                <td>{{{getCommonCodeSelect slctType 'faq_slctType' 'Y'}}}</td>

                <th>질문</th>
                <td colspan="5"><input type="text" name="question" id="question" class="form-control" value="{{question}}"></td>
            </tr>
            <tr>

                <th>사이트 적용</th>
                <!--<td id="viewOn"></td>-->
                <td>{{{getOnOffSwitch viewOn}}}</td>

                <th>등록일시</th>
                <td id="regDate">{{writeDate}}</td>

                <th>조회수</th>
                <td id="cnt">{{addComma viewCnt}}</td>

                <th>처리자</th>
                <td id="processor">{{opName}}</td>
            </tr>
            </tbody>
        </table>
    </div>
    <div class="row col-lg-12 form-inline">
        <div class="widget">
            <div class="widget-header">
                <h3><i class="fa fa-user"></i> 답변 </h3>
            </div>
            <div class="_editor" id="editor" name="editor">{{{replaceHtml answer}}}</div>
        </div>
    </div>
</script>