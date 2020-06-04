<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="cfn" uri="/WEB-INF/tld/comFunction.tld" %>
<div id="wrapper">
    <div id="page-wrapper">
        <div class="container-fluid">
            <!-- serachBox -->
            <form id="searchForm">
                <div class="row col-lg-12 form-inline">
                    <%--<input type="hidden" name="pageStart" id="pageStart">
                    <input type="hidden" name="pageCnt" id="pageCnt">--%>
                    <div class="widget widget-table searchBoxArea">
                        <div class="widget-header searchBoxRow">
                            <h3 class="title"><i class="fa fa-search"></i> 환전 검색</h3>
                            <div>
                                <span id="searchYearArea"></span>
                                <span id="searchMonthArea"></span>
                                <span id="searchStateArea"></span>

                                <span id="searchTypeArea" class="ml10"></span>
                                <label><input type="text" class="form-control" id="search_value" name="search_value"></label>
                                <button type="button" class="btn btn-success" id="bt_search">검색</button>

                                <%--<button type="button" class="btn btn-primary" id="bt_search_special">600달 이상 보유 회원</button>--%>
                                <label class="control-inline fancy-checkbox custom-color-green">
                                    <input type="checkbox" name="search_testId" id="search_testId" value="1" checked="true">
                                    <span>테스트 아이디 제외</span>
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            <!-- //serachBox -->

            <!-- DATA TABLE -->
            <div class="row col-lg-12 form-inline block">
                <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist">
                    <li class="_tab active">
                        <a href="#recommend" id="tab_specialDj" name="tab_specialDj" role="tab" data-toggle="tab" data-specialDj="1"><i class="fa fa-home"></i> 스페셜DJ</a>
                    </li>
                    <li class="_tab">
                        <a href="#recommend" id="tab_user" name="tab_user" role="tab" data-toggle="tab" data-specialDj="0"><i class="fa fa-home"></i> 일반회원</a>
                    </li>
                </ul>

                <div>
                    <div class="row col-lg-12">

                        <div>
                            <div class="pt10 col-lg-4">
                                <ul>
                                    <li>환전완료 정보를 확인하고, 처리 불가 회원에 대한 응대를 할 수 있습니다.</li>
                                    <li>경영지원부에서 환전 처리를 완료한 후, 운영 담당자가 최종 확인하여 [SMS 발송]으로 회원에게 환전결과를 알립니다.</li>
                                    <li>[SMS발송] 후 [최종완료] 처리를 하면 더 이상 변경이 불가합니다.</li>
                                    <li>환전 불가처리 시 신청한 환전별은 환불처리 됩니다.</li>
                                </ul>

                                <div>
                                    <button class="btn btn-sm btn-success print-btn no-margin" type="button" id="excelDownBtn"><i class="fa fa-print"></i> Excel Down</button>
                                    <button class="btn btn-sm btn-primary print-btn" type="button" id="completeBtn"><i class="fa fa-check-square"></i> 선택 완료처리</button>
                                </div>
                            </div>

                            <div class="col-lg-8">
                                <table class="table table-bordered table-summary pull-right">
                                    <thead>
                                    <tr>
                                        <th colspan="7">일반회원</th>
                                    </tr>
                                    <tr>
                                        <th>신청 인원</th>
                                        <th>신청 별 수</th>
                                        <th>신청 금액</th>
                                        <th>완료 별 수</th>
                                        <th>완료 금액</th>
                                        <th>불가 별 수</th>
                                        <th>불가 처리 금액</th>
                                    </tr>
                                    </thead>
                                    <tbody id="tb_user_summary">
                                    <tr>
                                        <td><span>0</span>명</td>
                                        <td><span>0</span>별</td>
                                        <td><span>0</span>원</td>
                                        <td><span>0</span>별</td>
                                        <td><span>0</span>원</td>
                                        <td><span>0</span>별</td>
                                        <td><span>0</span>원</td>
                                    </tr>
                                    </tbody>
                                </table>

                                <table class="table table-bordered table-summary pull-right">
                                    <thead>
                                    <tr>
                                        <th colspan="7">스페셜DJ</th>
                                    </tr>
                                    <tr>
                                        <th>신청 인원</th>
                                        <th>신청 별 수</th>
                                        <th>신청 금액</th>
                                        <th>완료 별 수</th>
                                        <th>완료 금액</th>
                                        <th>불가 별 수</th>
                                        <th>불가 처리 금액</th>
                                    </tr>
                                    </thead>
                                    <tbody id="tb_special_summary">
                                        <tr>
                                            <td><span>0</span>명</td>
                                            <td><span>0</span>별</td>
                                            <td><span>0</span>원</td>
                                            <td><span>0</span>별</td>
                                            <td><span>0</span>원</td>
                                            <td><span>0</span>별</td>
                                            <td><span>0</span>원</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <div class="col-lg-12 mt15">
                            <div class="dataTables_paginate paging_full_numbers" id="list_info_paginate_top"></div>
                            <table id="list_info" class="table table-sorting table-hover table-bordered">
                                <thead id="tableTop">
                                <tr>
                                    <th>No</th>
                                    <th>상태</th>
                                    <th><input type="checkbox" id="allChk"></th>
                                    <th>아이디</th>
                                    <th>닉네임</th>
                                    <th>이름</th>
                                    <th>예금주</th>
                                    <th>환전신청금액</th>
                                    <th>스페셜DJ혜택</th>
                                    <th>환전실수령액</th>
                                    <th>신청 별 수</th>
                                    <th>현재 별 수</th>
                                    <%--<th>환전 후 별 수</th>--%>
                                    <th>환전횟수</th>
                                    <th>신청일자</th>
                                    <th>처리일자</th>
                                    <th>처리현황</th>
                                    <th>처리자</th>
                                    <th>상세보기</th>
                                </tr>
                                </thead>
                                <tbody id="tableBody"></tbody>
                            </table>
                        </div>
                        <%--<span>
                            <button class="btn btn-default print-btn pull-right mb10" type="button"><i class="fa fa-print"></i>Excel 출력</button>
                        </span>--%>
                        <div class="dataTables_paginate paging_full_numbers" id="list_info_paginate"></div>
                    </div>
                </div>
            </div>
            <!-- DATA TABLE END -->

        </div>
    </div>
</div>

<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#detailView" id="showModal" style="display:none;">레이어팝업오픈버튼</button>

<div class="modal fade" id="detailView" tabindex="-1" role="dialog" aria-labelledby="detailViewLabel" aria-hidden="true"></div>

<form name="excelForm" id="excelForm"></form>

<script type="text/javascript" src="/js/lib/jquery.table2excel.js"></script>
<script type="text/javascript" src="/js/code/money/exchangeCodeList.js?${dummyData}"></script>
<script type="text/javascript" src="/js/code/member/memberCodeList.js?${dummyData}"></script>
<script type="text/javascript" src="/js/handlebars/moneyHelper.js?${dummyData}"></script>
<script type="text/javascript">
    var exchangePagingInfo = new PAGING_INFO(0,1,50);
    var limitDay = moment(new Date()).format('YYYYMMDD');

    $(function(){

        $("#searchYearArea").html(util.getCommonCodeSelect(moment(new Date()).format('YYYY'), search_exchange_years));
        $("#searchMonthArea").html(util.getCommonCodeSelect(moment(new Date()).format('MM'), search_exchange_months));
        $("#searchTypeArea").html(util.getCommonCodeSelect('', search_exchange_type));
        $("#searchStateArea").html(util.getCommonCodeSelect('', search_exchange_state));

        $('#searchTestIdArea').html(util.getCommonCodeRadio(-1, testId));
        getList();
    });

    function getParameter(){
        return data = {
            isSpecial : $('._tab.active a').data('specialdj')
            , search_year : $("#search_year").val()
            , search_month : $("#search_month").val()
            , search_state : $("#search_state").val()
            , search_type : $("#search_type").val()
            , search_value : $("#search_value").val()
            , search_testId : $('input[name="search_testId"]').prop('checked') ? 1 : 0
            , pageStart : exchangePagingInfo.pageNo
            , pageCnt : exchangePagingInfo.pageCnt
            , limitDay : limitDay
        };
    }

    function getSummary(){
        util.getAjaxData("select", "/rest/money/exchange/summary", getParameter(), fn_succ_summary);
    }

    function fn_succ_summary(dst_id, response){
        //var target = ;
        response.data.specialSummaryList.forEach(function(data, i){
            $('#tb_special_summary tr td:eq('+i+') span').html(common.addComma(data));
        });

        response.data.generalSummaryList.forEach(function(data, i){
            $('#tb_user_summary tr td:eq('+i+') span').html(common.addComma(data));
        });


    }

    function getList(){
        $("#allChk").removeAttr('checked');
        getSummary();
        util.getAjaxData("select", "/rest/money/exchange/list", getParameter(), fn_succ_list);
    }

    $('#bt_search').on('click', function(){
        exchangePagingInfo.pageNo = 1;
        getList();
    });

    $('input[id="search_value"]').on('keydown', function(e) {    // textBox 처리
        if(e.keyCode == 13) {
            exchangePagingInfo.pageNo = 1;
            getList();
        };
    });

    $('._tab').on('click', function(){
        $('._tab').removeClass('active');
        $(this).addClass('active');

        exchangePagingInfo.pageNo = 1;
        getList();
    });

    $('input[name="search_testId"]').on('change', function(){
        exchangePagingInfo.pageNo = 1;
        getList();
    });

    function fn_succ_list(dst_id, response) {
        if(getParameter().isSpecial == 0){
            var curDay = moment().day();
            var prevDay = 0;
            if(curDay == 0){
                prevDay = -3
            }else if(curDay == 3 || curDay == 6){
                prevDay = -2
            }else if(curDay == 2 || curDay ==5){
                prevDay = -1
            }
            limitDay = moment(new Date()).add('days', prevDay).format('YYYYMMDD');
        }else{
            limitDay = moment(new Date()).format('YYYYMMDD');
        }

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

    function handlebarsPaging(targetId, pagingInfo){
        exchangePagingInfo = pagingInfo;
        getList();
    }

    $('#excelDownBtn').on('click', function(){
        /*var formElement = document.querySelector("form");
        var formData = new FormData(formElement);
        formData.append("isSpecial", getParameter().isSpecial);
        formData.append("search_year", getParameter().search_year);
        formData.append("search_month", getParameter().search_month);
        formData.append("search_state", 0);
        formData.append("search_testId", getParameter().search_testId);
        formData.append("search_type", getParameter().search_type);
        formData.append("search_value", getParameter().search_value);
        formData.append("limitDay", getParameter().limitDay);

        util.excelDownload($(this), "/money/exchange/listExcel", formData, fn_success_excel, fn_fail_excel)

        util.changeLoadingBtn($("#excelDownBtn"), 'reset');*/
        var hidden = '<input type="hidden" name="{name}" value="{value}">';

        var hiddenData = '';
        hiddenData += hidden.replace('{name}', 'isSpecial').replace('{value}', getParameter().isSpecial);
        hiddenData += hidden.replace('{name}', 'search_year').replace('{value}', getParameter().search_year);
        hiddenData += hidden.replace('{name}', 'search_month').replace('{value}', getParameter().search_month);
        hiddenData += hidden.replace('{name}', 'search_state').replace('{value}', 0);
        hiddenData += hidden.replace('{name}', 'search_testId').replace('{value}', getParameter().search_testId);
        hiddenData += hidden.replace('{name}', 'search_type').replace('{value}', getParameter().search_type);
        hiddenData += hidden.replace('{name}', 'search_value').replace('{value}', getParameter().search_value);
        hiddenData += hidden.replace('{name}', 'limitDay').replace('{value}', getParameter().limitDay);

        $("#excelForm").html(hiddenData).attr({
            method : 'post'
           , action : '/money/exchange/listExcel'
            , target : 'iframe_excel_download'
        }).submit();
    });

    function fn_success_excel(response) {
        console.log(response);
    }

    function fn_fail_excel(response){
        alert('현재 환전 처리일이 아니거나, 처리되지 않은 신청 건이 없습니다.');
    }

    $(document).on('click', '._layerOpen', function(title, content){

        var detailData = getParameter();
        detailData.idx = $(this).data('exchangeidx');

        util.getAjaxData("select", "/rest/money/exchange/detail", detailData, fn_succ_detail);
    });

    function fn_succ_detail(dist_id, response){
        var template = $('#tmp_layer_detail').html();
        var templateScript = Handlebars.compile(template);
        var context = response.data;
        var html = templateScript(context);
        $("#detailView").html(html);

        showModal();
    }

    function showModal(){
        $("#showModal").click();
    }

    function closeModal(){
        $("#layerCloseBtn").click();
    }

    $(document).on('click', '._updateBtn', function(){
        if(confirm('수정하시겠습니까?')){

            var account_name = $("#account_name");
            if(common.isEmpty(account_name)){
                alert('예금주명을 입력해주세요.');
                account_name.focus();
                return
            }

            var data = $("#exchangeForm").serialize();
            util.getAjaxData("update", "/rest/money/exchange/update", $("#exchangeForm").serialize(), fn_succ_update);
        }
    });

    function fn_succ_update(dist_id, response){
        alert(response.message);
        closeModal();
        getList();
    }

    $(document).on('click', '._completeBtn', function(){
        if(confirm('완료처리하시겠습니까?')){
            var data = $("#exchangeForm").serialize();
            data += '&state=1';
            util.getAjaxData("complete", "/rest/money/exchange/complete", data, fn_succ_complete);
        }
    });

    $(document).on('click', '._rejectBtn', function(){
        if(confirm('불가처리 하시겠습니까?\n불가처리 시 환전 신청한 별 수가 반환됩니다.')){
            var data = $("#exchangeForm").serialize();
            data += '&state=2';
            util.getAjaxData("reject", "/rest/money/exchange/complete", data, fn_succ_complete);
        }
    });

    function fn_succ_complete(dist_id, response){
        if(dist_id == 'complete'){
            alert('완료처리 되었습니다.');
        }else if(dist_id == 'reject'){
            alert(response.message);
        }
        closeModal();
        getList();
    }

    $('#allChk').on('click', function(){

        if(0 == $('._chk:enabled').length){
            alert('선택할 회원이 없습니다.');
            return false;
        }

        if($(this).prop('checked')){
            $('._chk:enabled').prop('checked', 'checked');
        }else{
            $('._chk').removeAttr('checked');
        }

    });

    $("#completeBtn").on('click', function(){
        var checks = $('._chk:checked');
        if(0 == checks.length){
            alert('선택된 회원이 없습니다.');
            return false;
        }

        if(confirm(checks.length + '건을 완료처리 하시겠습니까?')){
            var idxs = '';
            $('._chk:checked').each(function(){
                idxs += $(this).data('exchangeidx')+ '@';
            });

            var data = {
                idxs : idxs
            }
            util.getAjaxData("complete", "/rest/money/exchange/multiComplete", data, fn_succ_complete);
        }
    });


</script>

<script type="text/x-handlebars-template" id="tmp_exchangeList">
    {{#each this.exchangeList as |data|}}
    <tr>
        <td>
            {{indexDesc ../exchangeCnt data.rowNum}}
        </td>
        <td>
            {{getMemStateName data.mem_state}}
        </td>
        <td>
            {{#workdayCheck ../limitDay data.reg_date}}
            <input type="checkbox" class="_chk"
                   data-exchangeidx='{{data.idx}}'
                   data-regdate="{{convertToDate data.reg_date 'YYYYMMDD'}}"
                   {{^equal data.state '0'}}disabled{{/equal}} />
            {{else}}
                {{{fontColor '대기' 1 'gray'}}}
            {{/workdayCheck}}
        </td>
        <td><a href="javascript://" class="_openMemberPop" data-memno="{{data.mem_no}}">{{data.mem_id}}</a></td>
        <td>{{data.mem_nick}}</td>
        <td>{{data.mem_name}}</td>
        <td>{{data.account_name}}</td>
        <td>{{addComma data.cash_basic}}원</td>
        <td>{{addComma data.benefit}}원</td>
        <td>{{addComma data.cash_real}}원</td>
        <td>{{addComma data.byeol}}별</td>
        <td>{{addComma data.gold}}별</td>
        <!--<td>{{math data.gold '-' data.byeol}}별</td>-->
        <td>{{addComma data.exchangeCnt}}번</td>
        <td>{{convertToDate data.reg_date 'YYYY-MM-DD HH:mm:ss'}}</td>
        <td>{{convertToDate data.op_date 'YYYY-MM-DD HH:mm:ss'}}</td>
        <td>{{stateName data.state}}</td>
        <td>{{data.op_name}}</td>
        <td><button type="button" class="btn btn-primary btn-sm _layerOpen" data-exchangeidx='{{data.idx}}'>보기</button></td>
    </tr>

    {{else}}
    <tr>
        <td colspan="18">{{isEmptyData}}</td>
    </tr>
    {{/each}}
</script>

<script type="text/x-handlebars-template" id="tmp_layer_detail">
    <form id="exchangeForm">
        <input type="hidden" name="idx" value="{{detail.idx}}" />
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true" id="layerCloseBtn">&times;</button>
                    <h4 class="modal-title" id="_layerTitle">상세보기</h4>
                </div>
                <div class="modal-body">
                    <div class="col-lg-12 form-inline block _modalLayer">
                        <table id="list_info" class="table table-sorting table-hover table-bordered">
                            <tbody id="tableBody">
                                <tr>
                                    <th>
                                        신청금액
                                    </th>
                                    <td>
                                        {{addComma detail.cash_basic}}원
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        은행명
                                    </th>
                                    <td>
                                        {{{getCommonCodeSelect detail.bank_code 'inforex_bank_code' 'Y' ''}}}
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        계좌번호
                                    </th>
                                    <td>
                                        <input type="text" class="form-control" id="account_no" name="account_no" maxlength="25" value="{{detail.account_no}}" />
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        예금주
                                    </th>
                                    <td>
                                        <input type="text" class="form-control" id="account_name" name="account_name" maxlength="25" value="{{detail.account_name}}" />
                                        / {{detail.mem_name}}
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        주민번호
                                    </th>
                                    <td>
                                        <input type="text" class="form-control" id="social_no" name="social_no" maxlength="13" value="{{detail.social_no}}" />
                                        [{{convertJumin detail.social_no}}]
                                    </td>
                                </tr>

                                <tr>
                                    <th>
                                        주소
                                    </th>
                                    <td>
                                        <input type="text" class="form-control _fullWidth" id="address_1" name="address_1" value="{{detail.address_1}}" />
                                    </td>
                                </tr>

                                <tr>
                                    <th>
                                        상세주소
                                    </th>
                                    <td>
                                        <input type="text" class="form-control _fullWidth" id="address_2" name="address_2" value="{{detail.address_2}}" />
                                    </td>
                                </tr>

                                <tr>
                                    <th>
                                        전화번호
                                    </th>
                                    <td>
                                        <input type="hidden" name="phone_no" value="{{phoneNumHyphen detail.phone_no}}" />
                                        {{phoneNumHyphen detail.phone_no}}
                                        / {{phoneNumHyphen detail.mem_phone}}
                                    </td>
                                </tr>

                                <tr>
                                    <th>
                                        접수서류
                                    </th>
                                    <td>
                                        <div class="col-lg-6" style="border:solid 1px black">
                                            <a href="javascript://">
                                                <img src="${cfn:getProperty("server.photo.url")}{{detail.add_file1}}" class="_fullWidth _openImagePop thumbnail" />
                                            </a>
                                        </div>
                                        <div class="col-lg-6" style="border:solid 1px black">
                                            <a href="javascript://">
                                                <img src="${cfn:getProperty("server.photo.url")}{{detail.add_file2}}" class="_fullWidth _openImagePop thumbnail" />
                                            </a>
                                        </div>
                                    </td>
                                </tr>

                                <tr>
                                    <th>
                                        신청일자
                                    </th>
                                    <td>
                                        {{convertToDate detail.reg_date 'YYYY-MM-DD HH:mm:ss'}}
                                    </td>
                                </tr>

                                <tr>
                                    <th>
                                        완료일자
                                    </th>
                                    <td>
                                        {{#equal detail.op_date ''}}
                                            -
                                        {{else}}
                                            {{convertToDate detail.op_date 'YYYY-MM-DD HH:mm:ss'}}
                                        {{/equal}}
                                    </td>
                                </tr>

                                <tr>
                                    <th>
                                        메모
                                    </th>
                                    <td>
                                        <input type="text" class="form-control _fullWidth" id="op_msg" name="op_msg" maxlength="1000" value="{{detail.op_msg}}" />
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary pull-left" data-dismiss="modal"><i class="fa fa-times-circle"></i> 닫기</button>

                    {{#equal detail.state '0'}}
                        <button type="button" class="btn btn-custom-primary _updateBtn"><i class="fa fa-times-circle"></i> 수정</button>
                        <button type="button" class="btn btn-danger _rejectBtn"><i class="fa fa-times-circle"></i> 불가</button>
                        <button type="button" class="btn btn-success _completeBtn"><i class="fa fa-check-circle"></i> 완료</button>
                    {{/equal}}

                    {{#equal detail.state '1'}}
                        <span class="exchange_complete_txt">완료되었습니다.</span>
                    {{/equal}}

                    {{#equal detail.state '2'}}
                        <span class="exchange_reject_txt">불가처리 되었습니다.</span>
                    {{/equal}}

                </div>
            </div>
        </div>
    </form>
</script>