<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="col-lg-12 no-padding">
    <div class="widget widget-table" id="main_table">
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

<!-- 팬보드 댓글 보기 -->
<div class="modal fade" id="fanboardModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 600px;display: table;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body">
            </div>
            <div class="modal-footer">
            </div>
        </div>
    </div>
</div>
<!-- Modal 끝 -->

<div id="imageFullSize_fanboard"></div>

<script>
    $(document).ready(function() {
    });

    function getHistory_fanbroadDetail(tmp) {     // 상세보기
        if(tmp.indexOf("_") > 0){ tmp = tmp.split("_"); tmp = tmp[1]; }
        var source = MemberDataTableSource[tmp];
        var dtList_info_detail_data = function (data) {
            data.mem_no = memNo;
        }
        dtList_info_detail = new DalbitDataTable($("#"+tmp).find("#list_info_detail"), dtList_info_detail_data, source);
        dtList_info_detail.useCheckBox(true);
        dtList_info_detail.useIndex(true);
        dtList_info_detail.createDataTable();
        dtList_info_detail.reload();
    }
    function Fanboard(index){
        var data = dtList_info_detail.getDataRow(index);
        if(data.replyCnt > 0){
            $('#fanboardModal').modal("show");
            util.getAjaxData("info", "/rest/member/fanboard/replyList", data, replyList_success, fn_fail);
        }
    }
    function replyList_success(dst_id, response) {
        dalbitLog(response)
    }

    function FullSize_fanboard(url) {     // 이미지 full size
        $("#imageFullSize_fanboard").html(util.imageFullSize("fanboardFullSize",url));
        $('#fanboardFullSize').modal('show');
    }

</script>
