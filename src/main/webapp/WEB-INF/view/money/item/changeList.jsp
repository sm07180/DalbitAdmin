<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="cfn" uri="/WEB-INF/tld/comFunction.tld" %>
<c:set var="dummyData"><%= java.lang.Math.round(java.lang.Math.random() * 1000000) %></c:set>

<!-- DATA TABLE -->
<div class="row col-lg-12 form-inline block ml0 pl0 pr0 no-padding">
    <div>
        <div class="row col-lg-12 pl0 pr0 no-padding">
            <div class="col-lg-12 no-padding">
                <div class="col-lg-4 pull-right no-padding">
                    <span id="change_summaryArea"></span>
                </div>
            </div>
            <div class="col-md-2 no-padding pull-right">
                <table class="table table-sorting table-hover table-bordered">
                    <colgroup>
                        <col width="15%"/><col width="65%"/>
                    </colgroup>
                    <tr>
                        <td style="background-color: #dae3f3"></td><td>테스트 아이디</td>
                    </tr>
                </table>
            </div><div class="col-md-2 no-padding">
                <span id="changeList_searchType" onchange="changeList_searchType_click();"></span>
            </div>
            <div class="col-lg-12 mt15 no-padding">
                <div class="dataTables_paginate paging_full_numbers" id="list_info_paginate_top"></div>
                <table id="list_info" class="table table-sorting table-hover table-bordered">
                    <thead id="tableTop">
                    <tr>
                        <th>No</th>
                        <th>교환일시</th>
                        <th>회원번호</th>
                        <th>닉네임</th>
                        <th>성별</th>
                        <th>등급</th>
                        <th>레벨</th>
                        <th>교환 횟 수</th>
                        <th>교환 전 별 수</th>
                        <th>교환 전 달 수</th>
                        <th>교환 별 수</th>
                        <th>교환 달 수</th>
                        <th>교환 후 별 수</th>
                        <th>교환 후 달 수</th>
                    </tr>
                    </thead>
                    <tbody id="tableBody"></tbody>
                </table>
                <div class="dataTables_paginate paging_full_numbers" id="list_info_paginate"></div>
            </div>
            <%--<button class="btn btn-sm btn-success print-btn no-margin pull-right" type="button" id="excelDownBtn"><i class="fa fa-print"></i> Excel Down</button>--%>
        </div>
    </div>
</div>
<!-- DATA TABLE END -->


<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#detailView" id="showModal" style="display:none;">레이어팝업오픈버튼</button>

<div class="modal fade" id="detailView" tabindex="-1" role="dialog" aria-labelledby="detailViewLabel" aria-hidden="true"></div>

<form name="excelForm" id="excelForm"></form>

<script type="text/javascript" src="/js/lib/jquery.table2excel.js"></script>
<script type="text/javascript" src="/js/code/money/exchangeCodeList.js?${dummyData}"></script>
<script type="text/javascript" src="/js/code/member/memberCodeList.js?${dummyData}"></script>
<script type="text/javascript" src="/js/handlebars/moneyHelper.js?${dummyData}"></script>
<script type="text/javascript" src="/js/handlebars/statusHelper.js?${dummyData}"></script>
<script type="text/javascript">

    $(function(){
        $("#changeList_searchType").html(util.getCommonCodeSelect(-1, changeList_searchType));
    });

    var itemPagingInfo = new PAGING_INFO(0,1,50);

    function fn_succ_list(dst_id, response) {

        var template = $('#tmp_changeItemList').html();
        var templateScript = Handlebars.compile(template);
        var context = response.data;
        var html = templateScript(context);
        $("#tableBody").html(html);
        itemPagingInfo.totalCnt = response.data.changeItemCnt;

        if(response.data.changeItemList.length > 0){
            util.renderPagingNavigation("list_info_paginate_top", itemPagingInfo);
            util.renderPagingNavigation("list_info_paginate", itemPagingInfo);
        }
        change_summary(response);
    }

    function change_summary(json){
        console.log(json.data.changeItemSummary);

        var template = $("#change_tableSummary").html();
        var templateScript = Handlebars.compile(template);
        var data = {
            content : json.data.changeItemSummary
            , length : json.data.changeItemSummary
        };
        var html = templateScript(data);
        $("#change_summaryArea").html(html);
        ui.tableHeightSet();
    }

    function handlebarsPaging(targetId, pagingInfo){
        itemPagingInfo = pagingInfo;
        getList();
    }

    $('#excelDownBtn').on('click', function(){
        var hidden = '<input type="hidden" name="{name}" value="{value}">';

        var hiddenData = '';
        hiddenData += hidden.replace('{name}', 'isSpecial').replace('{value}', getParameter().isSpecial);
        hiddenData += hidden.replace('{name}', 'search_year').replace('{value}', getParameter().search_year);
        hiddenData += hidden.replace('{name}', 'search_month').replace('{value}', getParameter().search_month);
        hiddenData += hidden.replace('{name}', 'search_state').replace('{value}', 0);
        hiddenData += hidden.replace('{name}', 'search_testId').replace('{value}', getParameter().search_testId);
        hiddenData += hidden.replace('{name}', 'search_type').replace('{value}', getParameter().search_type);
        hiddenData += hidden.replace('{name}', 'search_value').replace('{value}', getParameter().search_value);

        $("#excelForm").html(hiddenData).attr({
            method : 'post'
            , action : '/money/exchange/listExcel'
            , target : 'iframe_excel_download'
        }).submit();
    });

    function fn_success_excel(response) {
        console.log(response);
    }

    function changeList_searchType_click(){
        itemPagingInfo.pageNo = 1;
        orderType = $("select[name='changeList']").val();
        getList();
    }

</script>

<script type="text/x-handlebars-template" id="tmp_changeItemList">
    {{#each this.changeItemList as |data|}}
    <tr {{#dalbit_if data.inner '==' 1}} style="background-color : #dae3f3" {{/dalbit_if}}>
        <td>
            {{indexDesc ../changeItemCnt data.rowNum}}
        </td>
        <td>
            {{data.last_upd_date}}
        </td>
        <td><a href="javascript://" class="_openMemberPop" data-memno="{{data.mem_no}}">{{data.mem_no}}</a></td>
        <td>{{data.mem_nick}}</td>
        <td>{{{sexIcon data.mem_sex data.mem_birth_year}}}</td>
        <td>{{addComma data.mem_grade}}</td>
        <td>{{addComma data.mem_level}}</td>
        <td>{{addComma data.changeCnt}}번</td>
        <td>{{addComma data.gold_old}}별</td>
        <td>{{addComma data.ruby_old}}달</td>
        <td>{{addComma data.gold}}별</td>
        <td>{{addComma data.ruby}}달</td>
        <td>{{addComma data.gold_new}}별</td>
        <td>{{addComma data.ruby_new}}달</td>
    </tr>

    {{else}}
    <tr>
        <td colspan="20">{{isEmptyData}}</td>
    </tr>
    {{/each}}
</script>

<script id="change_tableSummary" type="text/x-handlebars-template">
    <table class="table table-condensed table-dark-header table-bordered no-margin _tableHeight no-padding no-margin" data-height="19px">
        <colgroup>
            <col width="20%"/><col width="20%"/><col width="20%"/><col width="20%"/><col width="20%"/>
        </colgroup>
        <tr>
            <th colspan="5" style="background-color: #4472c4; color: white;">교환 현황</th>
        </tr>
        <tr style="background-color: #cfd5ea">
            <td>구분</td>
            <td>회원 수</td>
            <td>별 수</td>
            <td>교환 달 수</td>
            <td>환전 가치 금액</td>
        </tr>
        <tr style="color: blue;">
            <td>{{{sexIcon 'm'}}}</td>
            <td>{{addComma content.maleCnt}}명</td>
            <td>{{addComma content.maleByeolCnt}}별</td>
            <td>{{addComma content.maleDalCnt}}달</td>
            <td>{{addComma content.maleExchangeAmt}}원</td>
        </tr>
        <tr style="color: red;">
            <td>{{{sexIcon 'f'}}}</td>
            <td>{{addComma content.femaleCnt}}명</td>
            <td>{{addComma content.femaleByeolCnt}}별</td>
            <td>{{addComma content.femaleDalCnt}}달</td>
            <td>{{addComma content.femaleExchangeAmt}}원</td>
        </tr>
        <tr>
            <td>{{{sexIcon 'n'}}}</td>
            <td>{{addComma content.noneCnt}}명</td>
            <td>{{addComma content.noneByeolCnt}}별</td>
            <td>{{addComma content.noneDalCnt}}달</td>
            <td>{{addComma content.noneExchangeAmt}}원</td>
        </tr>
        <tr style="color: black;">
            <td>테스트</td>
            <td>{{addComma content.testCnt}}명</td>
            <td>{{addComma content.testByeolCnt}}별</td>
            <td>{{addComma content.testDalCnt}}달</td>
            <td>{{addComma content.testExchangeAmt}}원</td>
        </tr>
        <tr class="font-bold" style="color: #ff6600;">
            <th style="background-color: #d9d9d9">총합</th>
            <th style="background-color: #f2f2f2">{{addComma content.totalCnt}}명</th>
            <th style="background-color: #f2f2f2">{{addComma content.sumTotalByeol}}별</th>
            <th style="background-color: #f2f2f2">{{addComma content.sumTotalDal}}달</th>
            <th style="background-color: #f2f2f2">{{addComma content.totalExchangeAmt}}원</th>
        </tr>
    </table>
</script>