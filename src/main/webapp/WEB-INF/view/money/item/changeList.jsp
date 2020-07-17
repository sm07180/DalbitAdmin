<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="cfn" uri="/WEB-INF/tld/comFunction.tld" %>
<!-- DATA TABLE -->
<div class="row col-lg-12 form-inline block ml0 pl0 pr0">
    <div>
        <div class="row col-lg-12 pl0 pr0">
            <div class="col-lg-12">
                <div class="col-lg-4 pull-right">
                    <span id="change_summaryArea"></span>
                </div>
            </div>
            <div class="col-lg-12 mt15">
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
            </div>
            <div class="dataTables_paginate paging_full_numbers" id="list_info_paginate"></div>
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

    });

    var itemPagingInfo = new PAGING_INFO(0,1,50);

    function fn_succ_list(dst_id, response) {

        var template = $('#tmp_changeItemList').html();
        var templateScript = Handlebars.compile(template);
        var context = response.data;
        var html = templateScript(context);
        $("#tableBody").html(html);

        itemPagingInfo.totalCnt = response.data.changeItemCnt;
        util.renderPagingNavigation("list_info_paginate_top", itemPagingInfo);
        util.renderPagingNavigation("list_info_paginate", itemPagingInfo);

        change_summary(response);


    }

    function change_summary(json){
        console.log(json);

        var template = $("#change_tableSummary").html();
        var templateScript = Handlebars.compile(template);
        var data = {
            content : json
            , length : json
        };
        var html = templateScript(data);
        $("#change_summaryArea").html(html);
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

</script>

<script type="text/x-handlebars-template" id="tmp_changeItemList">
    {{#each this.changeItemList as |data|}}
    <tr>
        <td>
            {{indexDesc ../changeItemCnt data.rowNum}}
        </td>
        <td>
            {{data.last_upd_date}}
        </td>
        <td><a href="javascript://" class="_openMemberPop" data-memno="{{data.mem_no}}">{{data.mem_no}}</a></td>
        <td>{{data.mem_nick}}</td>
        <td>{{{sexIcon data.mem_sex}}}</td>
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
    <table class="table table-condensed table-dark-header table-bordered no-margin">
        <colgroup>
            <col width="35%"/><col width="15%"/><col width="50%"/>
        </colgroup>
        <tr>
            <th>총 교환 횟 수</th>
            <td colspan="2">{{addComma content.data.changeItemCnt}} 건</td>
        </tr>
        <tr>
            <th>1인당 평균 교환 수</th>
            <td colspan="2">약 {{division content.data.changeItemCnt content.data.changeItemMemCnt}} 건</td>
        </tr>
        <tr>
            <th>총 교환 별/달 수</th>
            <td colspan="2">{{addComma content.data.changeItemSummary.sumTotalByeol}} 개 / {{addComma content.data.changeItemSummary.sumTotalDal}} 개</td>
        </tr>
        <tr>
            <th>교환 후 총 남은 별/달 수</th>
            <td colspan="2">{{addComma content.data.changeItemModCnt.modByeol}} 개 / {{addComma content.data.changeItemModCnt.modDal}} 개</td>
        </tr>
        <tr>
            <th colspan="1" rowspan="2">교환 성별 수 (비율)</th>
            <td>{{{sexIcon 'm'}}}</td>
            <td>{{content.data.changeItemSummary.changeMale}} ({{average content.data.changeItemSummary.changeMale content.data.changeItemCnt}}%)</td>
        </tr>
        <tr>
            <td>{{{sexIcon 'f'}}}</td>
            <td>{{content.data.changeItemSummary.changeFemale}} ({{average content.data.changeItemSummary.changeFemale content.data.changeItemCnt}}%)</td>
        </tr>
    </table>
</script>