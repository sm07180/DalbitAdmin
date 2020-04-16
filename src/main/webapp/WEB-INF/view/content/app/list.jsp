<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="container-fluid">
            <form id="searchForm">
                <div class="row col-lg-12 form-inline">
                    <div class="widget widget-table searchBoxArea">
                        <div class="widget-header searchBoxRow">
                            <h3 class="title"><i class="fa fa-search"></i>검색조건</h3>
                            <span id="search_os_area"></span>
                            <button type="button" class="btn btn-success" id="bt_search">검색</button>
                        </div>
                    </div>
                </div>
            </form>
            <div class="row col-lg-12 form-inline" id="insertBtn">
                <button type="button" class="btn btn-default pull-right" id="bt_insert">등록</button>
            </div>
            <div class="row col-lg-12 form-inline">
                <div class="widget widget-table">
                    <div class="widget-header">
                        <h3><i class="fa fa-desktop"></i>검색결과</h3>
                    </div>
                </div>
                    <div class="widget-content">
                        <table id="list_info" class="table table-sorting table-hover table-bordered">
                            <thead></thead>
                            <tbody id="tableBody"></tbody>
                        </table>
                    </div>
                </div> <!-- #DataTable -->
            <form id="appList"></form>
        </div>
        </div> <!-- #container-fluid -->
    </div> <!-- #page-wrapper -->
</div> <!-- #wrapper -->

<script type="text/javascript" src="/js/code/content/contentCodeList.js"></script>
<script type="text/javascript">
    var dtList_info;
    $(document).ready(function() {
        init();
        ui.checkBoxInit('list_info');
    });

    $("#bt_search").click(function() {
        getAppList();
    });

    /** Data Table **/
    function init() {
        var dtList_info_data = function(data) {
        };
        dtList_info = new DalbitDataTable($("#list_info"), dtList_info_data, AppDataTableSource.appInfo, $("#searchForm"));
        dtList_info.useCheckBox(true);
        dtList_info.useIndex(false);
        dtList_info.createDataTable();

        $("#search_os_area").html(util.getCommonCodeSelect(-1, content_app));

        getAppList();
    }

    function getAppList(){
        dtList_info.reload();
        ui.toggleSearchList();
    }

    $(document).on('click', '._appDetail', function() {
       var data = {
           'idx' : $(this).data('idx')
       };
       alert($(this).data('idx')); // undefined
       util.getAjaxData("detail", "/rest/content/app/detail", data, fn_success, fn_fail);
    });

    $(document).on('click', '#list_info .dt-body-center input[type="checkbox"]', function() {
        if($(this).prop == 'checked') {
            $(this).parent().parent().find('._appDetail').click();
        }
    });

    function fn_success(dst_id, response) {
        dalbitLog(response);
        alert('성공?');
        var template = $("#tmp_appList").html();
        var templateScript = Handlebars.compile(template);
        var context = response.data;
        var html = templateScript(context);

        alert('ㅇㅇ');
        $("#appList").html(html);
    }

    function fn_fail() {
        dalbitLog("######fail");
    }


</script>

<script id="tmp_appList" type="text/x-handlebars-template">
    <input type="hidden" name="idx" value="{{idx}}"/>
    <div class="row col-lg-12 mt15">
        <%--<div class="col-md-12 no-padding">--%>
            <%--<span>--%>
                <%--<button class="btn btn-default pull-right mb15" type="button" id="insertBtn">등록</button>--%>
            <%--</span>--%>
        <%--</div>--%>
        <table class="table table-bordered table-dalbit">
            <colgroup>
                <col width="5%"/>
                <col width="10%"/>
            </colgroup>
                <tr>
                    <th>idx</th>
                    <td>{{idx}}</td>
                </tr>
                <tr>
                    <th>os</th>
                    <td>{{os}}</td>
                </tr>
                <tr>
                    <th>version</th>
                    <td>{{version}}</td>
                </tr>
                <tr>
                    <th>강제업데이트 여부</th>
                    <td>{{is_force}}</td>
                </tr>
                <tr>
                    <th>사용함</th>
                    <td>{{is_use}}</td>
                </tr>
                <tr>
                    <th>등록일</th>
                    <td>{{convertToDate reg_date "YYYY-MM-DD HH:mm:ss"}}</td>
                </tr>
        </table>
    </div>
</script>