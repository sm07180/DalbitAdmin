<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="col-lg-6 no-padding">
    <label>ㆍ방송 중 채팅내역을 확인 할 수 있습니다.<br/>ㆍ회원 닉네임을 클릭하시면 해당 회원의 채팅글만 확인할 수 있습니다.</label>
</div>
<div class="col-lg-6 no-padding">
    <table id="top_info" class="table table-sorting table-hover table-bordered datatable">
        <thead id="table_Top">
        </thead>
        <tbody id="table_Body">
        </tbody>
    </table>
</div>
<table class="table table-bordered table-dalbit" style="margin-bottom: 0px;">
    <colgroup>
        <col width="5%"/><col width="5%"/><col width="10%"/><col width="10%"/><col width="15%"/><col width="55%"/>
    </colgroup>
    <tbody>
    <tr>
        <th>No</th>
        <td>50</td>
        <th>방송OS구분</th>
        <td><span id="platform"></span></td>
        <th>방송제목</th>
        <td>다달이와 함께하는 뜨거운 만남!!</td>
    </tr>
    </tbody>
</table>
<div class="col-md-6 no-padding" style="margin-top:-7px">
    <table id="list_chat_detail" class="table table-sorting table-hover table-bordered datatable">
        <thead id="tableTop_chat_detail">
        </thead>
        <tbody id="tableBody_chat_detail">
        </tbody>
    </table>
</div>
<div class="col-md-6 no-padding" style="margin-top:-7px">
    <table id="list_chat_user_detail" class="table table-sorting table-hover table-bordered datatable">
        <thead id="tableTop_chat_user_detail">
        </thead>
        <tbody id="tableBody_chat_user_detail">
        </tbody>
    </table>
</div>


<script>
    $(document).ready(function() {
    });

    $("#platform").html(util.getCommonCodeSelect(1, platform,'Y'));

    function getBroadHistory_chat(tmp) {     // 상세보기
        if(tmp.indexOf("_") > 0){ tmp = tmp.split("_"); tmp = tmp[1]; }
        var top = tmp.replace("Detail","_top");
        var source = BroadcastDataTableSource[top];
        var dtList_info_detail_data = function (data) {
            data.roomNo = roomNo;
        }
        dtList_top_info = new DalbitDataTable($("#"+tmp).find("#top_info"), dtList_info_detail_data, source);
        dtList_top_info.useCheckBox(false);
        dtList_top_info.useIndex(false);
        dtList_top_info.useOrdering(false);
        dtList_top_info.onlyTableView();            //테이블만
        dtList_top_info.createDataTable();
        dtList_top_info.reload();

        var dtlist_chat_detail;
        var dtList_info_detail_data = function (data) {
            data.roomNo = roomNo;
        }
        dtlist_chat_detail = new DalbitDataTable($('#list_chat_detail'), dtList_info_detail_data, BroadcastDataTableSource.chatList);
        dtlist_chat_detail.useCheckBox(false);
        dtlist_chat_detail.useIndex(false);
        dtlist_chat_detail.useOrdering(false);
        dtlist_chat_detail.onlyTableView();            //테이블만
        dtlist_chat_detail.createDataTable();
        dtlist_chat_detail.reload();

        var dtList_info_detail_data = function (data) {
            data.roomNo = roomNo;
        }
        dblist_chat_detail = new DalbitDataTable($("#"+tmp).find("#list_chat_user_detail"), dtList_info_detail_data, BroadcastDataTableSource.chatUserList);
        dblist_chat_detail.useCheckBox(false);
        dblist_chat_detail.useIndex(false);
        dblist_chat_detail.useOrdering(false);
        dblist_chat_detail.onlyTableView();            //테이블만
        dblist_chat_detail.createDataTable();
        dblist_chat_detail.reload();

    }

    function Chat(index){
        var data = dtList_info_detail.getDataRow(index);
        var chat_roomNo = data.roomNo;
    }

</script>
