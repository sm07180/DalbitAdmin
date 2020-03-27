<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="col-lg-12 no-padding">
    <div class="widget widget-table" id="main_table">
        <span id="story_summaryArea"></span>
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
    function getBroadHistory_story(tmp) {     // 상세보기
        if(tmp.indexOf("_") > 0){ tmp = tmp.split("_"); tmp = tmp[1]; }
        var source = BroadcastDataTableSource[tmp];
        var dtList_info_detail_data = function (data) {
            data.room_no = room_no;
            data.sortState = tmp_sortState;       // 청취자인지, 퇴장인지, 강퇴인지
        }
        dtList_info_detail = new DalbitDataTable($("#"+tmp).find("#list_info_detail"), dtList_info_detail_data, source);
        dtList_info_detail.useCheckBox(true);
        dtList_info_detail.useIndex(true);
        dtList_info_detail.createDataTable(story_summary_table);
        dtList_info_detail.reload();

        initDataTableTop_select_report(tmp)
    }

    function initDataTableTop_select_report(tmp){
        var storyDelBtn = '<input type="button" value="선택삭제" class="btn btn-danger btn-sm" id="btn_storyDel" style="margin-right: 3px;"/>'
        $("#"+tmp).find("#main_table").find(".footer-left").append(storyDelBtn);

        eventInit();
    }

    function force_sel_change(){
        tmp_sortState = $("select[name='state']").val();
        dtList_info_detail.reload();
    }
    function story_summary_table(json){
        var template = $("#story_tableSummary").html();
        var templateScript = Handlebars.compile(template);
        var data = {
            header : story_summary
            , content : json.summary
        }
        var html = templateScript(data);
        $("#story_summaryArea").html(html);
    }
    function eventInit(){
        $("#btn_storyDel").on("click", function () { //선택삭제
            if (confirm("선택한 사연을 삭제하시겠습니까?")) {
                storyDelData();
            }
        });
    }
    function storyDelData(){
        var checkDatas = dtList_info_detail.getCheckedData();
        if(checkDatas.length <= 0){
            alert("삭제할 사연을 선택해 주십시오");
            return;
        }

        for(var i=0;i<checkDatas.length;i++){
            var data = new Object();
            data.room_no = checkDatas[i].room_no;
            data.storyIdx = checkDatas[i].storyIdx;

            util.getAjaxData("delete", "/rest/broadcast/story/delete",data, storyDel_success);
        }
    }
    function storyDel_success(dst_id, response){
        dalbitLog(response);
        dtList_info_detail.reload();
    }
</script>

<script id="story_tableSummary" type="text/x-handlebars-template">
    <table class="table table-bordered table-summary pull-right">
        <thead>
        <tr>
            {{#each this.header}}
            <th>{{this.code}}</th>
            {{/each}}
        </tr>
        </thead>
        <tbody id="summaryDataTable">
        <td>{{content.storyCnt}}건</td>
        <td>{{content.male}}건</td>
        <td>{{content.female}}건</td>
        <td>{{content.none}}건</td>
        </tbody>
    </table>
</script>
