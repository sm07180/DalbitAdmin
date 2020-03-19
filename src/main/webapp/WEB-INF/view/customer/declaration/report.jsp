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

                <th>접수일시</th>
                <td>{{reg_date}}</td>

                <th>처리상태</th>
                <td>{{{getCommonCodeSelect status 'declaration_status'}}}</td>
            </tr>
            <tr>
                <th>플랫폼</th>
                <td>{{platform}}</td>

                <th>IP Address</th>
                <td>{{ipAddress}}</td>

                <th>처리일시</th>
                <td>
                    {{op_date}}
                    {{#equal op_date ''}}-{{/equal}}
                </td>

                <th>처리자명</th>
                <td>
                    {{op_name}}
                    {{#equal op_name ''}}-{{/equal}}
                </td>
            </tr>
            <tr class="align-middle">
                <th colspan="4">신고자</th>
                <th colspan="4">대상자</th>

                <th rowspan="2">조치내역</th>
                <td rowspan="2" >
                    {{{getCommonCodeRadio op_code 'declaration_slctType' 'N' 'opCode'}}}
                </td>
            </tr>
            <tr>
                <td>{{mem_id}}</td>
                <td>{{level}}/{{grade}}</td>
                <td>{{mem_nick}}</td>
                <td>{{memSex}}</td>

                <td>{{reported_mem_id}}</td>
                <td>{{reported_level}}/{{reported_grade}}</td>
                <td>{{reported_mem_nick}}</td>
                <td>{{reported_memSex}}</td>
            </tr>
            <tr>
                <th colspan="2">누적 결제 수<br />/금액</th>
                <td colspan="2">{{addComma payCount}}개 <br />{{addComma payAmount}}원</td>

                <th colspan="2">누적 결제 수<br />/금액</th>
                <td colspan="2">{{addComma reported_payCount}}개 <br />{{addComma reported_payAmount}}원</td>

                <th rowspan="3">메세지</th>
                <td rowspan="3" >
                    {{{getCommonCodeRadio message 'declaration_Message'}}}
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
                <h3><i class="fa fa-user"></i> 신고 시 캡쳐내용(5분) </h3>
            </div>
            <div class="widget-content no-padding">
                <div class="_editor" id="chatEditor" name="charEditor">{{{replaceHtml declaration_Message}}}</div>
            </div>
        </div>

        <div class="col-md-6 no-padding">
            <div class="widget widget-table" id="report_detail3">
                <div class="widget-content">
                    <table id="list_report_detail" class="table table-sorting table-hover table-bordered datatable">
                        <thead id="tableTop_detail">
                        </thead>
                        <tbody id="tableBody_detail">
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="col-md-6 no-padding">
            <div class="widget widget-table" id="report_detail4">
                <div class="widget-content">
                    <table id="list_report_user_detail" class="table table-sorting table-hover table-bordered datatable">
                        <thead id="tableTop_detail2">
                        </thead>
                        <tbody id="tableBody_detail2">
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    var report_roomNo;
    var report_memNo;

    var dtList_list_report_detail;
    var dtList_list_report_user_detail;
    var dtList_info_detail_data = function (data) {
        data.mem_no = report_memNo;
        data.roomNo = report_roomNo;
        data.search = report_memNo;
        data.gubun = "9999";
    }
    dtList_list_report_user_detail = new DalbitDataTable($("#list_report_user_detail"), dtList_info_detail_data, customerDataTableSource.userChattingHistory);
    dtList_list_report_user_detail.useCheckBox(false);
    dtList_list_report_user_detail.useIndex(false);
    dtList_list_report_user_detail.createDataTable();

    function getChattingHistoryDetail() {     // 상세보기
        var dtList_info_detail_data = function (data) {
            data.mem_no = report_memNo;
            data.roomNo = report_roomNo;
            data.search = "";
            data.gubun = "9999";
        }
        dtList_list_report_detail = new DalbitDataTable($("#list_report_detail"), dtList_info_detail_data, customerDataTableSource.chattingHistory);
        dtList_list_report_detail.useCheckBox(false);
        dtList_list_report_detail.useIndex(false);
        dtList_list_report_detail.createDataTable();
        dtList_list_report_detail.reload();
    }

    function userChatting(index){
        var data = dtList_list_report_detail.getDataRow(index);
        report_memNo = data.mem_no;

        dtList_list_report_user_detail.reload();
    }

    $('#bt_declaration').on('click', function(){
        var status = $('#declarationForm #status');
        if(status.val() == 1) {
            alert("이미 처리완료된 사항입니다.");
            return false;
        }
        else if(status.val() == 0) {
            if(confirm('처리하시겠습니까?')) {
                util.getAjaxData("declaration", "/rest/customer/declaration/operate", $("#declarationForm").serialize(), fn_declaration_success);
            }
            return false;
        }
    });

    function fn_declaration_success(dst_id, response) {
        dalbitLog(response);
        alert(response.message);

        dtList_info.reload();

        $("#declarationForm").empty();
    }

   $('input:radio[name="opCode"]').on('click', function() {
           alert("클릭이벤트!!");
   });
</script>
