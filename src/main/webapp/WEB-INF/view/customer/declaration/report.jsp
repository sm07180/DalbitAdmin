<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="wrapper">
    <div id="page-wrapper">
        <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist">
            <li class="active"><a href="#reportDetail" role="tab" data-toggle="tab">신고처리</a></li>
        </ul>
        <div class="col-lg-12 no-padding">
            <label id="report_title"></label>
        </div>

        <input type="hidden" name="reportIdx" value="{{reportIdx}}" />
        <table class="table table-bordered table-dalbit">
            <colgroup>
                <col width="5%" />
                <col width="5%" />
                <col width="5%" />
                <col width="6%" />
                <col width="5%" />
                <col width="5%" />
                <col width="5%" />
                <col width="5%" />
                <col width="5%" />
                <col width="5%" />
                <col width="5%" />
                <col width="5%" />
            </colgroup>
            <tbody>
            <tr class="align-middle">
                <th rowspan="2">No</th>
                <td rowspan="2">{{reportIdx}}</td>

                <th>신고사유</th>
                <td>{{{getCommonCodeSelect report_reason 'declaration_reason'}}}</td>

                <th>Browser</th>
                <td>{{browser}}</td>

                <th rowspan="2">접수일시</th>
                <td rowspan="2">{{reg_date}}</td>

                <th rowspan="2">처리일시</th>
                <td rowspan="2">
                    {{op_date}}
                    {{#equal op_date ''}}-{{/equal}}
                </td>

                <th>처리상태</th>
                <%--<td>{{{getCommonCodeSelect status 'declaration_status'}}}</td>--%>
                {{^equal status '0'}}<td>처리완료</td>{{/equal}}
                {{#equal status '0'}}<td>미처리</td>{{/equal}}
            </tr>
            <tr>
                <th>플랫폼</th>
                <td>{{platform}}</td>

                <th>IP Address</th>
                <td>{{ipAddress}}</td>

                <th>처리자명</th>
                <td>
                    {{op_name}}
                    {{#equal op_name ''}}-{{/equal}}
                </td>
            </tr>
            <tr class="align-middle">
                <th rowspan="1" colspan="4">신고자</th>
                <th rowspan="1" colspan="4">대상자</th>

                <th rowspan="2">제재 조치</th>
                <td rowspan="2" colspan="3">
                    {{{getCommonCodeRadio op_code 'declaration_slctType' 'Y' 'opCode'}}}
                </td>
            </tr>
            <tr>
                <td>{{mem_id}}</td>
                <td>레벨 : {{level}}<br />등급 : {{grade}}</td>
                <td>{{mem_nick}}</td>
                <td>{{memSex}}</td>

                <td>{{reported_mem_id}}</td>
                <td>레벨 : {{reported_level}}<br />등급 : {{reported_grade}}</td>
                <td>{{reported_mem_nick}}</td>
                <td>{{reported_memSex}}</td>
            </tr>
            <tr>
                <th colspan="2">누적 결제 수<br />/금액</th>
                <td colspan="2">{{addComma payCount}}개 <br />{{addComma payAmount}}원</td>

                <th colspan="2">누적 결제 수<br />/금액</th>
                <td colspan="2">{{addComma reported_payCount}}개 <br />{{addComma reported_payAmount}}원</td>

                <th rowspan="3">조치 선택</th>
                <td rowspan="3" colspan="3" id="message"> <%-- style="display:none;"--%>
                    {{{getCommonCodeCheck message 'declaration_Message'}}}
                </td>
            </tr>
            <tr>
                <th colspan="2">누적 선물 수<br />/금액</th>
                <td colspan="2">{{addComma giftCount}}개 <br />{{addComma giftAmount}}원</td>

                <th colspan="2">누적 선물 수<br />/금액</th>
                <td colspan="2">{{addComma reported_giftCount}}개 <br />{{addComma reported_giftAmount}}원</td>
            </tr>
            <tr>
                <th colspan="2">총 신고</th>
                <td colspan="2">프로시저에 없음</td>

                <th colspan="2">총 신고/조치</th>
                <td colspan="2"> 프로시저에 없음<br />/프로시저에 없음</td>
            </tr>
            </tbody>
        </table>

        <%-- 에디터 --%>
        <div class="widget">
            <div class="widget-header">
                <h3><i class="fa fa-user"></i> 신고 시 조치내용 </h3>
            </div>
            <div class="widget-content no-padding">
                <div class="_editor" id="chatEditor" name="charEditor">{{{replaceHtml message}}}</div>
            </div>
        </div>

        <!-- 채팅 내역 -->
        <div class="col-md-12 no-padding" id="chatLeft">
            <table class="table table-bordered" style="margin-bottom: -7px">
                <th>신고 시 캡쳐내용(5분)</th>
            </table>
            <table id="list_chat_detail" class="table table-sorting table-hover table-bordered datatable">
                <thead></thead>
                <tbody></tbody>
            </table>
        </div>
        <div class="col-md-6 no-padding" id="chatRight">
            <table class="table table-bordered" style="margin-bottom: -7px">
                <th id="chatRight_title"></th>
            </table>
            <table id="list_target_chat" class="table table-sorting table-hover table-bordered datatable">
                <thead></thead>
                <tbody></tbody>
            </table>
        </div>
    </div>
</div>
<script type="text/javascript">

    var dtList_info_detail;
    var dtList_info_detail_data = function (data) {
        // data.mem_no = detailData.mem_no;
        data.room_no = "91585286445106";
    }
    dtList_info_detail = new DalbitDataTable($("#list_chat_detail"), dtList_info_detail_data, BroadcastDataTableSource.chatDetail);
    dtList_info_detail.useCheckBox(false);
    dtList_info_detail.useIndex(false);
    dtList_info_detail.useOrdering(false);
    dtList_info_detail.setPageLength(20);
    dtList_info_detail.createDataTable();
    dtList_info_detail.reload();
    $("#chatLeft").removeClass("col-md-6");
    $("#chatLeft").addClass("col-md-12");
    $("#chatRight").addClass("hide");

    $('#bt_declaration').on('click', function(){
        if(confirm('처리하시겠습니까?')) {
            util.getAjaxData("declaration", "/rest/customer/declaration/operate", $("#declarationForm").serialize(), fn_declaration_success);
        }
    });

    function fn_declaration_success(dst_id, response) {
        dalbitLog(response);
        alert(response.message);

        dtList_info.reload();

        $("#declarationForm").empty();
    }

    $('input:radio[name="opCode"]').on('click', function() {
        var radioValue = $(this).val();
        var messageCheck = $('input:checkbox[name="message"]');

        if(radioValue == 0 || radioValue == 1) {
            messageCheck.attr("disabled", "disabled");
        } else {
            messageCheck.removeAttr("disabled");
        }
    });

    $(document).ready(function() {
        $('input:radio[name="opCode"]:checked').click();
    });

    function declarationCheck(data){
        var declarationValue = $('input:radio[name="opCode"], input:checkbox[name="message"], select[name="slctReason"]');

        if(data == 1) {
            declarationValue.attr("disabled", "disabled");
        } else {
            declarationValue.removeAttr("disabled");
        }
    }


    function targetChat(index){
        $("#chatRight").removeClass("hide");
        var metaData = dtList_info_detail.getDataRow(index);
        $("#chatLeft").removeClass("col-md-12");
        $("#chatLeft").addClass("col-md-6");
        $('#chatRight_title').html(util.memNoLink(metaData.nickname, metaData.mem_no)  + "님의 채팅글");
        var dtList_info_detail_data = function (data) {
            data.room_no = "91585286445106";
            data.mem_no = "11584402943774";
        }
        var dblist_chat_detail;
        dblist_chat_detail = new DalbitDataTable($("#list_target_chat"), dtList_info_detail_data, BroadcastDataTableSource.targetchat);
        dblist_chat_detail.useCheckBox(false);
        dblist_chat_detail.useIndex(false);
        dblist_chat_detail.useOrdering(false);
        dblist_chat_detail.setPageLength(20);
        dblist_chat_detail.createDataTable();
        dblist_chat_detail.reload();
    }
</script>