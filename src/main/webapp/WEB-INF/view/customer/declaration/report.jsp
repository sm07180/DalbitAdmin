<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="wrapper">
    <div id="page-wrapper">
        <div class="col-lg-12 no-padding">
            <label id="report_title"></label>
        </div>
        <%--<div class="col-lg-12 no-padding">
            <div class="col-md-4 no-padding">
                <div class="col-md-5 no-padding">
                    <div class="col-md-5 lb_style" style="height: 68px"><label>No</label></div>
                    <div class="col-md-7" style="height: 68px"><label>41</label></div>
                </div>
                <div class="col-md-7 no-padding">
                    <div class="col-md-5 lb_style"><label>신고</label></div>
                    <div class="col-md-7" style="height: 34px;">
                        <form id="cob_report">
                            <select id="cob_reportGubun" class="form-control searchType">
                                <option value="9999" selected="selected">직접입력 ▼</option>
                            </select>
                        </form>
                    </div>
                    <div class="col-md-5 lb_style"><label>플랫폼</label></div>
                    <div class="col-md-7" style="height: 34px;">
                        <form id="cob_platform">
                            <select id="cob_platformGubun" class="form-control searchType">
                                <option value="9999" selected="selected">직접입력 ▼</option>
                            </select>
                        </form>
                    </div>
                </div>
                <div class="col-md-12 no-padding">
                    <div class="col-md-12 lb_style"><label>신고자</label></div>
                    <div class="col-md-3" style="height: 34px;"><label>123456</label></div>
                    <div class="col-md-3" style="height: 34px;"><label>DalDal</label></div>
                    <div class="col-md-3" style="height: 34px;"><label>달달이</label></div>
                    <div class="col-md-3" style="height: 34px;"><label>남</label></div>
                </div>
                <div class="col-md-6 lb_style"><label>누적 결제 수/금액</label></div>
                <div class="col-md-6" style="height: 34px;"><label>75건/10,000,000원</label></div>
                <div class="col-md-6 lb_style"><label>누적 선물 수/금액</label></div>
                <div class="col-md-6" style="height: 34px;"><label>75건/10,000,000원</label></div>
            </div>
            <div class="col-md-4 no-padding">
                <div class="col-md-7 no-padding">
                    <div class="col-md-5 lb_style"></div>
                    <div class="col-md-7" style="height: 34px;"></div>
                    <div class="col-md-5 lb_style"></div>
                    <div class="col-md-7" style="height: 34px;"></div>
                </div>
                <div class="col-md-5 no-padding">
                    <div class="col-md-5 lb_style" style="height: 68px"><label>접수일시</label></div>
                    <div class="col-md-7" style="height: 68px"><label>2020-03-02 12:01:22</label></div>
                </div>
                <div class="col-md-12 no-padding">
                    <div class="col-md-12 lb_style"><label>신고대상자</label></div>
                    <div class="col-md-3" style="height: 34px;"><label>123456</label></div>
                    <div class="col-md-3" style="height: 34px;"><label>DalDal</label></div>
                    <div class="col-md-3" style="height: 34px;"><label>달달이</label></div>
                    <div class="col-md-3" style="height: 34px;"><label>남</label></div>
                </div>
                <div class="col-md-6 lb_style"><label>누적 결제 수/금액</label></div>
                <div class="col-md-6" style="height: 34px;"><label>1건/10,000,000원</label></div>
                <div class="col-md-6 lb_style"><label>누적 선물 수/금액</label></div>
                <div class="col-md-6" style="height: 34px;"><label>1건/10,000,000원</label></div>
            </div>
            <div class="col-md-4 no-padding">
                <div class="col-md-6 no-padding">
                    <div class="col-md-6 lb_style" style="height: 68px"><label>처리일시</label></div>
                    <div class="col-md-6" style="height: 68px"><label>2020-03-02 12:01:22</label></div>
                </div>
                <div class="col-md-6 no-padding">
                    <div class="col-md-6 lb_style"><label>처리상태</label></div>
                    <div class="col-md-6" style="height: 34px;"><label>미처리</label></div>
                    <div class="col-md-6 lb_style"><label>처리자명</label></div>
                    <div class="col-md-6" style="height: 34px;"><label>-</label></div>
                </div>
                <div class="col-md-12 no-padding">
                    <div class="col-md-3 no-padding">
                        <div class="col-md-12 lb_style" style="height: 136px"><label>조치내역</label></div>
                    </div>
                    <div class="col-md-7 no-padding">
                        <label class="radio-inline"><input type="radio" name="radio_ban" value="ban_pre" checked>유지</label>
                        <label class="radio-inline"><input type="radio" name="radio_ban" value="ban_war">경고</label>
                        <label class="radio-inline"><input type="radio" name="radio_ban" value="ban_1">1일 정지</label>
                        <label class="radio-inline"><input type="radio" name="radio_ban" value="ban_3">3일 정지</label>
                        <label class="radio-inline"><input type="radio" name="radio_ban" value="ban_7">7일 정지</label>
                        <label class="radio-inline"><input type="radio" name="radio_ban" value="ban_15">15일 정지</label>
                        <label class="radio-inline"><input type="radio" name="radio_ban" value="ban_30">30일 정지</label>
                        <label class="radio-inline"><input type="radio" name="radio_ban" value="ban_ban">강제탈퇴</label>
                        <button type="button" id="bt_ban" class="btn btn-default btn-sm pull-right">완료</button>
                    </div>
                </div>
            </div>
        </div>--%>
        <%--<div class="col-md-6 no-padding">
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
        </div>--%>

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
                <td>{{op_date}}</td>

                <th>처리자명</th>
                <td>{{opName}}</td>
            </tr>
            <tr class="align-middle">
                <th colspan="4">신고자</th>
                <th colspan="4">대상자</th>

                <th rowspan="5">조치내역</th>
                <td rowspan="5">
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
                <td colspan="2">{{payCount}} <br />{{payAmount}}</td>

                <th colspan="2">누적 결제 수<br />/금액</th>
                <td colspan="2">{{reported_payCount}} <br />{{reported_payAmount}}</td>
            </tr>
            <tr>
                <th colspan="2">누적 선물 수<br />/금액</th>
                <td colspan="2">{{giftCount}} <br />{{giftAmount}}</td>

                <th colspan="2">누적 선물 수<br />/금액</th>
                <td colspan="2">{{reported_giftCount}} <br />{{reported_giftAmount}}</td>
            </tr>
            <tr>
                <th colspan="2">총 신고</th>
                <td colspan="2"></td>

                <th colspan="2">총 신고/조치</th>
                <td colspan="2"> <br /></td>
            </tr>
            </tbody>
        </table>
    </div>
</div>
<script>
    $(document).ready(function() {
    });
    var report_roomNo;
    var report_memNo;

    var dtList_list_report_detail;
    var dtList_list_report_user_detail;
    var dtList_info_detail_data = function (data) {
        data.memNo = report_memNo;
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
            data.memNo = report_memNo;
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
        report_memNo = data.memNo;

        dtList_list_report_user_detail.reload();
    }
</script>
