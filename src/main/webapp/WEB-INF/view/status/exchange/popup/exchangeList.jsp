<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="cfn" uri="/WEB-INF/tld/comFunction.tld" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authentication var="principal" property="principal" />
<c:set var="dummyData"><%= java.lang.Math.round(java.lang.Math.random() * 1000000) %></c:set>

<!-- 결제/환불 > 결제내역 -->
<div class="widget-table mb10">
    <div class="col-md-12" style="background-color: #fbe5d6;padding:7px;margin-top: 8px">
        <span class="font-bold" id="sp_type" style="color: #7792c9;"></span><span class="font-bold">&nbsp;상세내역</span>
    </div>
    <div class="widget-content mt10">
        <div class="col-md-6 no-padding">
            <div class="col-md-3 no-padding">
                <span id="exchangeSort" onchange="exchangeSort_click();"></span>
            </div>
        </div>
        <div class="col-md-12 no-padding">
            <div class="dataTables_paginate paging_full_numbers mt15" id="list_info_paginate_top"></div>
            <div class="col-lg-12 no-padding">
                <table id="list_info" class="table table-sorting table-hover table-bordered">
                    <colgroup>
                        <col width="3%"/>
                        <col width="3%"/>
                        <col width="3%"/>
                        <col width="3%"/>
                        <col width="5%"/>
                        <col width="5%"/>
                        <col width="6%"/>
                        <col width="5%"/>
                        <col width="5%"/>
                        <col width="5%"/>
                        <col width="5%"/>
                        <col width="5%"/>
                        <col width="5%"/>
                        <col width="5%"/>
                        <col width="3%"/>
                        <col width="3%"/>
                        <col width="5%"/>
                        <col width="5%"/>
                        <col width="5%"/>
                        <col width="5%"/>
                        <col width="5%"/>
                        <col width="4%"/>
                        <col width="4%"/>
                        <col width="5%"/>
                    </colgroup>

                    <thead id="tableTop">
                    <tr>
                        <th>No</th>
                        <th>상태</th>
                        <th><input type="checkbox" id="allChk"></th>
                        <th>프로필</th>
                        <c:if test="${fn:contains('|이형원|전유신|고병권|이재호|', principal.getUserInfo().getName())}">
                            <th>신분증</th>
                        </c:if>
                        <th>회원번호</th>
                        <th>닉네임</th>
                        <th>성별</th>
                        <th>가입시<br />생년월일</th>
                        <th>미성년자<br />여부</th>
                        <th>예금주</th>
                        <th>신청금액</th>
                        <th>스페셜DJ<br />혜택</th>
                        <th>실수령액</th>
                        <th>신청 별 수</th>
                        <th>현재 별 수</th>
                        <th>테스트ID<br />등록이력</th>
                        <th>환전횟수</th>
                        <th>환전<br />누적금액</th>
                        <th>신청일자</th>
                        <th>처리일자</th>
                        <th>처리현황</th>
                        <th>처리자</th>
                        <th>상세</th>
                    </tr>
                    </thead>
                    <tbody id="tableBody"></tbody>
                </table>
            </div>
            <div class="dataTables_paginate paging_full_numbers" id="list_info_paginate"></div>
        </div>
    </div>
</div>

<script type="text/javascript" src="/js/lib/jquery.table2excel.js"></script>
<script type="text/javascript" src="/js/code/money/exchangeCodeList.js?${dummyData}"></script>
<script type="text/javascript" src="/js/code/member/memberCodeList.js?${dummyData}"></script>
<script type="text/javascript" src="/js/handlebars/moneyHelper.js?${dummyData}"></script>

<script type="text/javascript">

    var month = '${param.month}';
    var day = '${param.day}';
    var user = '${param.user}';
    var gender = '${param.gender}';
    var exchangePagingInfo = new PAGING_INFO(0,1,50);
    var limitDay;

    $(function (){
        $("#exchangeSort").html(util.getCommonCodeSelect('', exchange_sort));

        getExchangeList();
    });

    function getParameter(){
        var isSpecial;
        if(user == "special"){
            isSpecial = 1;
        }else{
            isSpecial = 0;
        }
        if(gender == "undefined"){
            gender = 0;
        }
        return data = {
            isSpecial : isSpecial
            , search_year : month.substring(0,4)
            , search_month : month.substring(5,7)
            , search_day : day
            , search_state : 1
            , exchange_sort : $("#exchange_sort").val()
            , gender : gender
            , pageStart : exchangePagingInfo.pageNo
            , pageCnt : exchangePagingInfo.pageCnt
            , limitDay : limitDay
            , search_testId : 0
            , slctType : 1
            , end_year : month.substring(0,4)
            , end_month : month.substring(5,7)
            , end_day : day
            , baseDay : "opdate"
        };
    }

    function getExchangeList() {
        console.log(getParameter());
        util.getAjaxData("select", "/rest/money/exchange/list", getParameter(), fn_succ_list);

    }

    function fn_succ_list(dst_id, response) {
        limitDay = moment(new Date()).format('YYYYMMDD');

        response.data.limitDay = limitDay;

        var template = $('#tmp_exchangeList').html();
        var templateScript = Handlebars.compile(template);
        var context = response.data;
        var html = templateScript(context);
        $("#tableBody").html(html);

        exchangePagingInfo.totalCnt = response.data.exchangeCnt;
        util.renderPagingNavigation("list_info_paginate_top", exchangePagingInfo);
        util.renderPagingNavigation("list_info_paginate", exchangePagingInfo);

    }

    function exchangeSort_click(){
        getExchangeList("button");
    }
    function gender_click(){
        getExchangeList("button");
    }


</script>


<script type="text/x-handlebars-template" id="tmp_exchangeList">
    {{#each this.exchangeList as |data|}}
    <tr {{#dalbit_if inner '==' 1}} style="background-color: #dae3f3" {{/dalbit_if}}>
    <td>
        {{indexDesc ../exchangeCnt data.rowNum}}
    </td>
    <td>
        {{{getMemStateName data.mem_state}}}
    </td>
    <td>
        {{#adultStatusCheck data.birth data.recant_yn}}
        {{#workdayCheck ../limitDay data.reg_date}}
        <input type="checkbox" class="_chk"
               data-exchangeidx='{{data.idx}}'
               data-regdate="{{convertToDate data.reg_date 'YYYYMMDD'}}"
               {{^equal data.state '0'}}disabled{{/equal}} />
        {{else}}
        {{{fontColor '대기' 1 'gray'}}}
        {{/workdayCheck}}
        {{else}}
        {{{fontColor '철회' 1 'red'}}}
        {{/adultStatusCheck}}
    </td>
    <td >
        <form id="profileImg" method="post" enctype="multipart/form-data">
            <img id="image_section" class="thumbnail fullSize_background no-padding" src="{{renderProfileImage data.image_profile data.mem_sex}}" alt="your image"
                 style="width: 50px;height: 50px;margin-bottom: 0px;" />
        </form>
    </td>
    <c:if test="${fn:contains('|이형원|전유신|고병권|이재호|', principal.getUserInfo().getName())}">
        <td >
            <img src="{{renderImage data.add_file1}}" style="max-width:50px;max-height:50px;" class="thumbnail fullSize_background no-padding no-margin" />
        </td>
    </c:if>
    <td><a href="javascript://" class="_openMemberPop" data-memno="{{data.mem_no}}">{{data.mem_no}}</a></td>
    <td>{{data.mem_nick}}</td>
    <td>{{{sexIcon data.mem_sex data.mem_birth_year}}}</td>

    <td>{{data.birth}}</td>
    <td>{{{calcAge data.birth}}}{{#equal data.recant_yn 'y'}}<br /><span style='font-weight:bold'>[철회됨]</span>{{/equal}}</td>

    <td>{{data.account_name}}</td>
    <td>{{addComma data.cash_basic}}원</td>
    <td>{{addComma data.benefit}}원</td>
    <td>{{addComma data.cash_real}}원</td>
    <td>{{addComma data.byeol}}별</td>
    <td>{{addComma data.gold}}별</td>
    <td>{{data.testid_history}}</td>
    <td>{{addComma data.exchangeCnt}}번</td>
    <td>{{addComma data.totalCashReal}}원</td>
    <td>{{convertToDate data.reg_date 'YYYY-MM-DD HH:mm:ss'}}</td>
    <td>{{convertToDate data.op_date 'YYYY-MM-DD HH:mm:ss'}}</td>
    <td>{{{stateName data.state}}}</td>
    <td>{{data.op_name}}</td>
    <td><button type="button" class="btn btn-primary btn-sm _layerOpen" data-exchangeidx='{{data.idx}}'>보기</button></td>
    </tr>

    {{else}}
    <tr>
        <c:choose>
            <c:when test="${fn:contains('|이형원|전유신|고병권|이재호|', principal.getUserInfo().getName())}">
                <td colspan="24">{{isEmptyData}}</td>
            </c:when>
            <c:otherwise>
                <td colspan="23">{{isEmptyData}}</td>
            </c:otherwise>
        </c:choose>
    </tr>
    {{/each}}
</script>
