<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="wrapper">
    <div id="page-wrapper">
        <!-- serachBox -->
        <label class="control-inline fancy-checkbox custom-color-green">
            <input type="checkbox" name="search_testId_level" id="search_testId_level" value="1" checked="true">
            <span>테스트 아이디 제외</span>
        </label>
        <div>
            <div class="col-md-12 no-padding mb10">
                <div class="pull-right">
                    <span id="levelList_summaryArea"></span>
                </div>
            </div>

            <div class="col-md-12 no-padding">
                <table id="level_list_info" class="table table-sorting table-hover table-bordered">
                    <thead></thead>
                    <tbody></tbody>
                </table>
            </div>
        </div>
    </div> <!-- //page-wrapper -->
</div> <!-- //wrapper -->

<script src="/js/dataTablesSource/status/levelDataTableSource.js?${dummyData}"></script>

<script type="text/javascript">

    $(document).ready(function() {
        getLevelList();
    });

    // function getLevelList(){
    //     sDate = $("#startDate").val();
    //     eDate = $("#endDate").val();
    //     txt_search = $('#txt_search').val();
    //     tmp_inner = $('input[name="search_testId"]').is(":checked") ? "0" : "-1";
    //
    //     dtLevel_List_info.reload(level_listSummary);
    // }

    $("input[name='search_testId_level']").change(function () {
        dtLevel_List_info.reload(levelList_listSummary);
    });

    var dtLevel_List_info;
    function getLevelList() {
        var dtList_info_data = function(data) {
            data.level = tmp_level;
            data.inner = $('input[name="search_testId_level"]').is(":checked") ? "0" : "-1";
        };
        dtLevel_List_info = new DalbitDataTable($("#level_list_info"), dtList_info_data, levelDataTableSource.levelList);
        dtLevel_List_info.useCheckBox(false);
        dtLevel_List_info.useIndex(false);
        dtLevel_List_info.setPageLength(1000);
        dtLevel_List_info.useInitReload(true);
        dtLevel_List_info.onlyTableView();
        dtLevel_List_info.createDataTable(levelList_listSummary);
    }

    function levelList_listSummary(json){
        var template = $("#levelList_listSummary").html();
        var templateScript = Handlebars.compile(template);
        var data = {
            content : json.summary
            , length : json.recordsTotal
        };
        var html = templateScript(data);
        $("#levelList_summaryArea").html(html);

    }

</script>

<script id="levelList_listSummary" type="text/x-handlebars-template">
    <table class="table table-condensed table-dark-header table-bordered no-margin" style="width: 600px;">
        <colgroup>
            <col width="40%"/><col width="60%"/>
        </colgroup>
        <tr>
            <th>총 회원 수</th>
            <td>{{addComma content.memAllCount}}</td>
        </tr>
    </table>
</script>