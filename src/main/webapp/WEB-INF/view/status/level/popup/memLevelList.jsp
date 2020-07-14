<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    String in_level = request.getParameter("level");
%>

<div id="wrapper">
    <div id="page-wrapper">
        <!-- serachBox -->
        <form id="searchForm">
            <div class="col-lg-12 form-inline no-padding">
                <label class="control-inline fancy-checkbox custom-color-green">
                    <input type="checkbox" name="search_testId" id="search_testId" value="1" checked="true">
                    <span>테스트 아이디 제외</span>
                </label>
            </div>
            <!-- //serachBox -->
        </form>
        <div>
            <div class="col-md-12 no-padding">
                <table id="list_info" class="table table-sorting table-hover table-bordered">
                    <thead></thead>
                    <tbody></tbody>
                </table>
            </div>
        </div>
    </div> <!-- //page-wrapper -->
</div> <!-- //wrapper -->

<script src="/js/dataTablesSource/status/levelDataTableSource.js?${dummyData}"></script>

<script type="text/javascript">

    init();

    var tmp_level;
    function init(){
        tmp_level = <%=in_level%>;
        getMemLevelList();
    };

    $("input[name='search_testId']").change(function () {
        dtList_info.reload();
    });

    var dtList_info;
    function getMemLevelList() {
        var dtList_info_data = function(data) {
            data.searchText = "";
            data.level = tmp_level;
            data.inner = $('input[name="search_testId"]').is(":checked") ? "0" : "-1";
        };
        dtList_info = new DalbitDataTable($("#list_info"), dtList_info_data, levelDataTableSource.memLevelList);
        dtList_info.useCheckBox(false);
        dtList_info.useIndex(true);
        dtList_info.setPageLength(100);
        dtList_info.useInitReload(true);
        dtList_info.createDataTable();
    }
</script>
