<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="col-lg-12 no-padding">
    <div class="widget widget-table" id="main_table">
        <span id="exchange_summaryArea"></span>
        <div class="widget-content">
            <table id="list_info_detail" class="table table-sorting table-hover table-bordered datatable">
                <thead id="tableTop_detail">
                </thead>
                <tbody id="tableBody_detail">
                </tbody>
            </table>
        </div>
    </div>
</div>

<script type="text/javascript" src="/js/code/money/exchangeCodeList.js?${dummyData}"></script>
<script type="text/javascript" src="/js/handlebars/moneyHelper.js?${dummyData}"></script>

<script>
    $(document).ready(function() {
    });

    function getHistory_exchangeDetail(tmp) {     // 상세보기
        if(tmp.indexOf("_") > 0){ tmp = tmp.split("_"); tmp = tmp[1]; }
        var dtList_info_detail_data = function (data) {
            data.mem_no = memNo;
        }
        dtList_info_detail = new DalbitDataTable($("#"+tmp).find("#list_info_detail"), dtList_info_detail_data, MemberDataTableSource.exchangeList);
        dtList_info_detail.useCheckBox(false);
        dtList_info_detail.useIndex(true);
        dtList_info_detail.setPageLength(50);
        dtList_info_detail.createDataTable();
    }

    $(document).on('click', '._layerOpen', function(title, content){
        var data = {};
        data.idx = $(this).data('exchangeidx');
        data.mem_no = memNo;
        util.getAjaxData("select", "/rest/member/exchange/detail", data, fn_succ_detail);
    });

    function fn_succ_detail(dist_id, response){
        var template = $('#tmp_exchange_detail').html();
        var templateScript = Handlebars.compile(template);
        var context = response.data[0];
        var html = templateScript(context);
        $("#detailView").html(html);
        showModal();
    }

</script>

<script type="text/x-handlebars-template" id="tmp_exchange_detail">
    <form id="exchangeForm">
        <input type="hidden" name="idx" value="{{idx}}" />
        <div class="modal-dialog" style="max-width: 900px; width: auto; display: table;">
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
                                <th>신청금액</th>
                                <td colspan="3" style="font-weight:bold; color: #ff5600">
                                    {{addComma cash_basic}}원
                                </td>
                            </tr>
                            <tr>
                                <th>은행명</th>
                                <td>
                                    {{{getCommonCodeSelect bank_code 'inforex_bank_code' 'Y' ''}}}
                                </td>

                                <th>계좌번호</th>
                                <td>
                                    <input type="text" class="form-control" id="account_no" name="account_no" maxlength="25" value="{{account_no}}" />
                                </td>
                            </tr>
                            <tr>
                                <th>예금주</th>
                                <td>
                                    <input type="text" class="form-control" id="account_name" name="account_name" maxlength="25" value="{{account_name}}" />
                                    <br />
                                    {{mem_name}}
                                </td>
                                <th>주민번호</th>
                                <td>
                                    <input type="text" class="form-control" id="social_no" name="social_no" maxlength="13" value="{{social_no}}" />
                                    [{{convertJumin social_no}}]
                                </td>
                            </tr>

                            <tr>
                                <th>가입시<br />생년월일</th>
                                <td>
                                    <%--<input type="text" class="form-control" id="birth" name="birth" maxlength="25" value="{{birth}}" />--%>
                                    {{birth}}
                                </td>
                                <th>미성년자<br />여부</th>
                                <td>
                                    <%--<input type="text" class="form-control" id="calcAge" name="calcAge" maxlength="13" value="{{{calcAge birth}}}" />--%>
                                    {{{calcAge birth}}}
                                </td>
                            </tr>

                            <tr>
                                <th>주소</th>
                                <td colspan="3">
                                    <input type="text" class="form-control _fullWidth" id="address_1" name="address_1" value="{{address_1}}" />
                                </td>
                            </tr>

                            <tr>
                                <th>상세주소</th>
                                <td colspan="3">
                                    <input type="text" class="form-control _fullWidth" id="address_2" name="address_2" value="{{address_2}}" />
                                </td>
                            </tr>

                            <tr>
                                <th>전화번호</th>
                                <td colspan="3">
                                    <input type="hidden" name="phone_no" value="{{phoneNumHyphen phone_no}}" />
                                    {{phoneNumHyphen phone_no}}
                                    / {{phoneNumHyphen mem_phone}}
                                </td>
                            </tr>

                            <tr>
                                <th>접수서류</th>
                                <td colspan="3">
                                    <div class="col-lg-6" style="border:solid 1px black">
                                        <a href="javascript://">
                                            <img src="{{renderImage add_file1}}" class="_fullWidth _openImagePop thumbnail" />
                                        </a>
                                        {{#equal state '0'}}<input id="files1" type="file" onchange="photoSubmit($(this))">{{/equal}}
                                        <input type="hidden" class="_hidden_filename" name="add_file1" id="add_file1" value="{{add_file1}}" />
                                    </div>
                                    <div class="col-lg-6" style="border:solid 1px black">
                                        <a href="javascript://">
                                            <img src="{{renderImage add_file2}}" class="_fullWidth _openImagePop thumbnail" />
                                        </a>
                                        {{#equal state '0'}}<input id="files2" type="file" onchange="photoSubmit($(this))"/>{{/equal}}
                                        <input type="hidden" class="_hidden_filename" name="add_file2" id="add_file2" value="{{add_file2}}" />
                                    </div>
                                </td>
                            </tr>

                            <tr>
                                <th>신청일자</th>
                                <td>
                                    {{convertToDate reg_date 'YYYY-MM-DD HH:mm:ss'}}
                                </td>

                                <th>완료일자</th>
                                <td>
                                    {{#equal op_date ''}}
                                    -
                                    {{else}}
                                    {{convertToDate op_date 'YYYY-MM-DD HH:mm:ss'}}
                                    {{/equal}}
                                </td>
                            </tr>

                            <tr>
                                <th>
                                    미처리 사유
                                </th>
                                <td colspan="3">
                                    <input type="hidden" id="send_title" name="send_title">
                                    {{{getCommonCodeSelect send_type 'exchange_cancel_type'}}} <label id="label_send_title">{{send_title}}</label>
                                    <p class="no-margin no-padding" style="font-size:0.9em; color:red;">* 사유 선택 후 불가 처리 시 회원에게 푸시 메시지, SMS로 발송됩니다</p>
                                </td>
                            </tr>

                            {{#dalbit_if send_type "==" "0"}}
                            <tr id="tr_send_cont" style="display:none;">
                                {{else}}
                            <tr id="tr_send_cont">
                                {{/dalbit_if}}
                                <th>
                                    미처리 사유<br>내용
                                </th>
                                <td colspan="3">
                                    <textarea class="form-control" name="send_cont" id="send_cont" oninput="util.textareaResize(this)" placeholder="" style="width:100%; height:90px; resize: none">{{replaceHtml send_cont}}</textarea>
                                </td>
                            </tr>

                            <tr>
                                <th>메모</th>
                                <td colspan="3">
                                    <input type="text" class="form-control _fullWidth" id="op_msg" name="op_msg" maxlength="1000" value="{{op_msg}}" />
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary pull-left" data-dismiss="modal"><i class="fa fa-times-circle"></i> 닫기</button>

                    <%--{{#equal state '0'}}--%>
                    <%--<button type="button" class="btn btn-custom-primary _updateBtn"><i class="fa fa-times-circle"></i> 수정</button>--%>
                    <%--<button type="button" class="btn btn-danger _rejectBtn"><i class="fa fa-times-circle"></i> 불가</button>--%>
                    <%--<button type="button" class="btn btn-success _completeBtn"><i class="fa fa-check-circle"></i> 완료</button>--%>
                    <%--{{/equal}}--%>

                    {{#equal state '1'}}
                    <span class="exchange_complete_txt">완료되었습니다.</span>
                    {{/equal}}

                    {{#equal state '2'}}
                    <span class="exchange_reject_txt">불가처리 되었습니다.</span>
                    {{/equal}}

                </div>
            </div>
        </div>
    </form>
</script>