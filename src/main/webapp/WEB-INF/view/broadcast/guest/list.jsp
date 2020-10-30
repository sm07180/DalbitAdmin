<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authentication var="principal" property="principal" />
<c:set var="dummyData"><%= java.lang.Math.round(java.lang.Math.random() * 1000000) %></c:set>

<div class="col-lg-12 no-padding">
    <div class="widget widget-table" id="main_table">
        <span id="guest_summaryArea"></span>
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

<!-- 강제퇴장 Modal -->
<div class="modal fade" id="guestModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 600px;display: table;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body">
                <%--<div class="col-md-12 no-padding">--%>
                    <span id="guestProposeList"></span>
                <%--</div>--%>
            </div>
            <div class="modal-footer">
            </div>
        </div>
    </div>
</div>
<!-- Modal 끝 -->

<script type="text/javascript" src="/js/code/customer/customerCodeList.js?${dummyData}"></script>
<script type="text/javascript" src="/js/message/broadcast/broadCastMessage.js?${dummyData}"></script>

<script>
    $(document).ready(function() {
    });
    var tmp_sortAuth = -1;
    function getBroadHistory_guest(tmp) {     // 상세보기
        if(tmp.indexOf("_") > 0){ tmp = tmp.split("_"); tmp = tmp[1]; }
        var source = BroadcastDataTableSource[tmp];

        if(!common.isEmpty(type) == 1){
            tmp_sortAuth = 0;
        }
        var dtList_info_detail_data = function (data) {
            data.room_no = room_no;
            data.sortAuth = tmp_sortAuth;       // 청취자인지, 퇴장인지, 강퇴인지
        }
        dtList_info_detail = new DalbitDataTable($("#"+tmp).find("#list_info_detail"), dtList_info_detail_data, source);
        dtList_info_detail.useCheckBox(false);
        dtList_info_detail.useIndex(true);
        dtList_info_detail.setPageLength(50);
        dtList_info_detail.createDataTable(guest_summary_table);

        $("#state").html(util.getCommonCodeSelect(-1, state));

        if(!common.isEmpty(type) == 1){
            $("select[name='state']").val(0);
        }
    }

    function guest_summary_table(json){

        console.log(json);

        var template = $("#guest_tableSummary").html();
        var templateScript = Handlebars.compile(template);
        var data = {
            header : guest_summary
            , content : json.summary
        }
        var html = templateScript(data);
        $("#guest_summaryArea").html(html);
    }

    function guestOut(index){
        var data = dtList_info_detail.getDataRow(index);
        console.log(data);
        util.getAjaxData("type", "/rest/broadcast/guest/out", data, guest_out_success);
    }
    function guest_out_success(dst_id, response, param){
        alert(response.message);
        getBroadHistory_guest("tab_guestDetail");

    }
    function guestDetail(index){
        var data = dtList_info_detail.getDataRow(index);
        $('#guestModal').modal('show');

        util.getAjaxData("type", "/rest/broadcast/guest/pro/list", data, guest_propose_list_success);

    }

    function guest_propose_list_success(dst_id, response, param){

        response.data.totalCnt = response.pagingVo.totalCnt;
        var template = $("#guestProposeDetailList_tmp").html();
        var templateScript = Handlebars.compile(template);
        var html = templateScript(response.data);
        $("#guestProposeList").html(html);
    }
</script>

<script id="guest_tableSummary" type="text/x-handlebars-template">
    <table class="table table-bordered table-summary pull-right">
        <thead>
        <tr>
            {{#each this.header}}
                <th>{{this.code}}</th>
            {{/each}}
        </tr>
        </thead>
        <tbody id="summaryDataTable">
            <td>{{addComma content.totalCnt}}회</td>
            <td>
                남성 : {{addComma content.totalSexM}}명 <br />
                여성 : {{addComma content.totalSexF}}명 <br />
                알수없음 : {{addComma content.totalSexN}}명
            </td>
            <td>{{content.totalAirTime}}</td>
            <td>
                {{addComma content.totalGiftCnt}}건<br />
                {{addComma content.totalGiftGold}}별
            </td>
        </tbody>
    </table>
</script>


<script id="guestProposeDetailList_tmp" type="text/x-handlebars-template">
    <table class="table table-bordered">
        <thead>
            <th>No.</th>
            <th>상태</th>
            <th>시각</th>
        </thead>
        <tbody>
            {{#each this as |data|}}
            <tr>
                <td>{{indexDesc ../totalCnt rowNum}}</td>
                <td>{{{getCommonCodeLabel state 'guestProposeState'}}}</td>
                <td>{{lastUpdDate}}</td>
            </tr>
            {{/each}}
        </tbody>
    </table>
</script>