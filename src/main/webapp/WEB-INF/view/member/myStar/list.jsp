<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<label>ㆍMyStar : 내가 Fan으로 등록하거나, 방송 중 선물을 보낸 회원입니다.<br>ㆍFan: 타 회원이 Fan으로 등록하면 해당회원이 MyStar 가 됩니다.</label>
<div class="widget-content">
    <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist">
        <li class="active"><a href="#mystar" role="tab" data-toggle="tab" onclick="getHistory_mystarDetail(this.id);"> My Star </a></li>
        <li><a href="#myfan" role="tab" data-toggle="tab"  onclick="getHistory_myfanDetail(this.id);"> My Fan </a></li>
    </ul>
    <div class="tab-content">
        <div class="tab-pane fade in active" id="mystar">
            <div class="widget widget-table" id="mystar_table">
                <div class="widget-content">
                    <table id="list_mystar" class="table table-sorting table-hover table-bordered datatable">
                        <thead></thead>
                        <tbody></tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="tab-pane fade" id="myfan">
            <div class="widget widget-table" id="mysfan_table">
                <div class="widget-content">
                    <table id="list_myfan" class="table table-sorting table-hover table-bordered datatable">
                        <thead></thead>
                        <tbody></tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>


<script>
    $(document).ready(function() {
    });

    function getHistory_mystarDetail(tmp) {     // 상세보기
        var dtList_info_detail_data = function (data) {
            data.mem_no = memNo;
        }
        dtList_info_detail = new DalbitDataTable($("#mystar").find("#list_mystar"), dtList_info_detail_data, MemberDataTableSource.mystar);
        dtList_info_detail.useCheckBox(false);
        dtList_info_detail.useIndex(true);
        dtList_info_detail.setPageLength(50);
        dtList_info_detail.createDataTable();

        getHistory_myfanDetail(tmp)
    }

    var dtList_info_detail2;
    function getHistory_myfanDetail(tmp) {     // 상세보기
        var dtList_info_detail_data = function (data) {
            data.mem_no = memNo;
        }
        dtList_info_detail2 = new DalbitDataTable($("#myfan").find("#list_myfan"), dtList_info_detail_data, MemberDataTableSource.myfan);
        dtList_info_detail2.useCheckBox(false);
        dtList_info_detail2.useIndex(true);
        dtList_info_detail2.setPageLength(50);
        dtList_info_detail2.createDataTable();
    }

</script>
