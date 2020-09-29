<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dummyData"><%= java.lang.Math.round(java.lang.Math.random() * 1000000) %></c:set>

<!-- 결제/환불 > 결제내역 -->
<div class="widget-table mb10">
    <div class="col-md-12" style="background-color: #fbe5d6;padding:7px;margin-top: 8px">
        <span class="font-bold" id="sp_type" style="color: #7792c9;"></span><span class="font-bold">&nbsp;상세내역</span>
    </div>
    <div class="widget-content mt10">
        <table class="table table-bordered" id="list">
            <thead>
            </thead>
            <tbody>
            </tbody>
        </table>
    </div>
</div>


<script type="text/javascript">
    var dtList_info;

    var type = '${param.type}';

    getEditList();
    function getEditList() {
        console.log(type);
        if(type == "1"){
            $("#sp_type").text("방송방공지");
        }else if(type == "2"){
            $("#sp_type").text("프로필 메시지");
        }

        var dtList_info_data = function(data) {
            data.mem_no = '${param.mem_no}';
            data.room_no = '${param.room_no}';
            data.noticeidx = '${param.noticeidx}';
            data.type = '${param.type}';
        };

        dtList_info = new DalbitDataTable($("#list"), dtList_info_data, NoticeDataTableSource.editHistory);
        dtList_info.useCheckBox(false);
        dtList_info.useIndex(true);
        dtList_info.setPageLength(50);
        dtList_info.useInitReload(true);
        dtList_info.createDataTable();
    }


</script>


