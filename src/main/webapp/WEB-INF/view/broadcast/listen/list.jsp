<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authentication var="principal" property="principal" />

<div class="col-lg-12 no-padding">
    <div class="widget widget-table" id="main_table">
        <span id="listen_summaryArea"></span>
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

<div class="modal fade" id="forcedModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 600px;display: table;">
        <div class="modal-content">
            <div class="modal-header">
                <lable>운영자에 의한 변경 사유를 선택하여 주세요</lable>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body">
                <span id="declaration_Message"></span>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" id="bt_modalForced"><i class="fa fa-times-circle"></i> 확인</button>
                <button type="button" class="btn btn-custom-primary" id="bt_modalForcedNotice"><i class="fa fa-check-circle"></i> 확인+메시지 발송</button>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="/js/code/customer/customerCodeList.js"></script>
<script type="text/javascript" src="/js/message/broadcast/broadCastMessage.js"></script>

<script>
    $(document).ready(function() {
        $("#bt_modalForced").on("click", function () {          //강제퇴장 팝업 알림X
            forced(this.id);
        });
        $("#bt_modalForcedNotice").on("click", function () {    //강제퇴장 팝업 알림O
            forced(this.id);
        });
    });

    var tmp_sortState = -1;
    function getBroadHistory_listen(tmp) {     // 상세보기
        if(tmp.indexOf("_") > 0){ tmp = tmp.split("_"); tmp = tmp[1]; }
        var source = BroadcastDataTableSource[tmp];
        var dtList_info_detail_data = function (data) {
            data.room_no = room_no;
            if(tmp_sortState != -1){
                if(tmp_sortState == 0 || tmp_sortState == 3 || tmp_sortState == 4 || tmp_sortState == 5) {
                    data.sortState = 0;          // 접속상태가 접속중이면
                    if (tmp_sortState == 3) {          data.sortAuth = 1;   // 접속중이면서 매니저
                    } else if (tmp_sortState == 4) {  data.sortAuth = 2;   // 접속중이면서 게스트
                    } else if (tmp_sortState == 5) {  data.sortAuth = 0;   // 접속중이면서 청취자
                    }
                }else if(tmp_sortState == 1 || tmp_sortState == 2) {
                    data.sortState = tmp_sortState;       // 접속중이 아니면서 퇴장인지, 강퇴인지
                }
            }
        }
        dtList_info_detail = new DalbitDataTable($("#"+tmp).find("#list_info_detail"), dtList_info_detail_data, source);
        dtList_info_detail.useCheckBox(true);
        dtList_info_detail.useIndex(true);
        dtList_info_detail.createDataTable(listen_summary_table);
        dtList_info_detail.reload();

        initDataTableTop_select_report(tmp)
    }

    function initDataTableTop_select_report(tmp){

        var topTable = '<span name="state" id="state" onchange="sel_change()"></span>';
        var forcedBtn = '<input type="button" value="강제퇴장" class="btn btn-danger btn-sm" id="btn_forced" style="margin-right: 3px;"/>'

        $("#"+tmp).find("#main_table").find(".top-left").addClass("no-padding").append(topTable);
        $("#"+tmp).find("#main_table").find(".footer-left").append(forcedBtn);

        $("#state").html(util.getCommonCodeSelect(-1, state));
        eventInit();
    }

    function sel_change(){
        tmp_sortState = $("select[name='state']").val();
        dtList_info_detail.reload();
    }
    function listen_summary_table(json){
        var template = $("#listen_tableSummary").html();
        var templateScript = Handlebars.compile(template);
        var data = {
            header : Listen_summary
            , content : json.summary
        }
        var html = templateScript(data);
        $("#listen_summaryArea").html(html);
    }

    function eventInit(){
        $("#btn_forced").on("click", function () { //강제퇴장
            forcedData();
        });
    }

    function forcedData(){
        if(dtList_info_detail.getCheckedData().length <= 0){
            alert("강제퇴장자를 선택해 주십시오");
            return;
        }
        $("#declaration_Message").html(util.getCommonCodeCheck(-1, declaration_Message,"Y"));
        $('#forcedModal').modal('show');
    }
    function forced(tmp){
        var sendNoti;
        if(tmp == "bt_modalForced") {    // 강제퇴장 알림X
            sendNoti = 0;
        }else if(tmp == "bt_modalForcedNotice"){      // 강제퇴장 알림O
            sendNoti = 1;
        }

        var forceMessage="";
        $('input:checkbox[name="message"]').each(function() {
            if(this.checked){           //checked 처리된 항목의 값
                forceMessage = forceMessage + " - " + this.value + "\n";
            }
        });
        if(forceMessage == ""){
            alert("강제 퇴장 사유를 선택해 주십시오");
            return;
        }
        var strName = '${principal.getUserInfo().getName()}';
        var date = new Date();
        var timestamp = date.getFullYear() + "." + common.lpad(date.getMonth(),2,"0") + "." + common.lpad(date.getDay(),2,"0") + " " +
                        common.lpad(date.getHours(),2,"0") + "." + common.lpad(date.getMinutes(),2,"0") + "." + common.lpad(date.getSeconds(),2,"0");

        var checkDatas = dtList_info_detail.getCheckedData();
        for(var i=0;i<checkDatas.length;i++){
            var meno = message.forceLeave.replace("{{name}}",strName)
                                          .replace("{{nickName}}",checkDatas[i].nickName)
                                          .replace("{{message}}",forceMessage)
                                          .replace("{{timestamp}}",timestamp);
            var data = new Object();
            data.room_no = room_no;
            data.mem_no = checkDatas[i].mem_no;
            data.sendNoti = sendNoti;
            data.notiContents = message.forceLeaveTitle;
            data.notiMeno = meno;

            util.getAjaxData("forceLeave", "/rest/broadcast/listener/forceLeave",data, forceLeave_success);
        }
    }
    function forceLeave_success(dst_id, response){
        dalbitLog(response);
        $('#forcedModal').modal('hide');
        dtList_info_detail.reload();
        alert(response.message);
    }
</script>

<script id="listen_tableSummary" type="text/x-handlebars-template">
    <table class="table table-bordered table-summary pull-right">
        <thead>
        <tr>
            {{#each this.header}}
                <th>{{this.code}}</th>
            {{/each}}
        </tr>
        </thead>
        <tbody id="summaryDataTable">
            <td>{{content.listenerCnt}}명</td>
            <td>{{content.guestId}}</td>
            <td>{{content.managerCnt}}명</td>
            <td>{{content.forcedCnt}}명</td>
            <td>{{content.totalGoodCnt}}명</td>
            <td>{{content.totalBoosterCnt}}명</td>
            <td>{{content.totalGiftCnt}}명</td>
        </tbody>
    </table>
</script>
