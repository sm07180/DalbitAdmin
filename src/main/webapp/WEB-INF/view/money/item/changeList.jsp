<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="cfn" uri="/WEB-INF/tld/comFunction.tld" %>
<!-- DATA TABLE -->
<div class="row col-lg-12 form-inline block ml0 pl0 pr0">
    <div>
        <div class="row col-lg-12 pl0 pr0">
            <div class="col-lg-12 mt15">
                <div class="dataTables_paginate paging_full_numbers" id="list_info_paginate_top"></div>
                <table id="list_info" class="table table-sorting table-hover table-bordered">
                    <thead id="tableTop">
                    <tr>
                        <th>No</th>
                        <th>교환일시</th>
                        <th>아이디</th>
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


    }

    function handlebarsPaging(targetId, pagingInfo){
        itemPagingInfo = pagingInfo;
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

<script type="text/x-handlebars-template" id="tmp_changeItemList">
    {{#each this.changeItemList as |data|}}
    <tr>
        <td>
            {{indexDesc ../changeItemCnt data.rowNum}}
        </td>
        <td>
            {{data.last_upd_date}}
        </td>
        <td><a href="javascript://" class="_openMemberPop" data-memno="{{data.mem_no}}">{{data.mem_userid}}</a></td>
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