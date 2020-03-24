<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<script>
    $(document).ready(function() {
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
        console.log("tmp : " + tmp);
        var topTable = '<span name="state" id="state" onchange="sel_change()"></span>';
        var delBtn = '<input type="button" value="강제퇴장" class="btn btn-danger btn-sm" id="btn_delete" style="margin-right: 3px;"/>'

        $("#"+tmp).find("#main_table").find(".top-left").addClass("no-padding").append(topTable);
        $("#"+tmp).find("#main_table").find(".footer-left").append(delBtn);

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
        $("#btn_delete").on("click", function () { //삭제
            delListenData();
        });
    }

    function delListenData(){
        var checkDatas = dtList_info_detail.getCheckedData();

        if(checkDatas.length <= 0){
            alert("삭제할 정보를 선택해주세요.");
            return false;
        }
        dalbitLog(checkDatas);
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
