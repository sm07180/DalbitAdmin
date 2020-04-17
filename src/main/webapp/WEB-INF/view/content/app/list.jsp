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
</div>
<!-- #page-wrapper -->
</div> <!-- #wrapper -->

<script type="text/javascript" src="/js/code/content/contentCodeList.js"></script>
<script type="text/javascript">
    var dtList_info;
    $(document).ready(function () {
        init();
        ui.checkBoxInit('list_info');
    });

    $("#bt_search").click(function () {
        getAppList();
    });

    /** Data Table **/
    function init() {
        var dtList_info_data = function (data) {
        };
        dtList_info = new DalbitDataTable($("#list_info"), dtList_info_data, AppDataTableSource.appInfo, $("#searchForm"));
        dtList_info.useCheckBox(true);
        dtList_info.useIndex(false);
        dtList_info.createDataTable();

        $("#search_os_area").html(util.getCommonCodeSelect(-1, content_selectApp));

        getAppList();
    }

    function getAppList() {
        dtList_info.reload();
        ui.toggleSearchList();
    }

    $(document).on('click', '._appDetail', function () {

        var data = {
            'idx': $(this).data('idx')
        };
        util.getAjaxData("detail", "/rest/content/app/detail", data, fn_success);
    });

    $(document).on('click', '#list_info .dt-body-center input[type="checkbox"]', function () {
        if ($(this).prop('checked')) {
            $(this).parent().parent().find('._appDetail').click();
        } else {
            $("#appList").empty();
        }
    });

    function fn_success(dst_id, response) {
        dalbitLog(response);
        var template = $("#tmp_appList").html();
        var templateScript = Handlebars.compile(template);
        var context = response.data;
        var html = templateScript(context);

        $("#appList").html(html);
        $("#insertAppBtn").hide();
        disabled();
    }

    function disabled() {
        if($("#bt_insert").length > 0) {
            $('input:radio[name="os"]').attr("disabled", "disabled");
            $('input:radio[name="is_use"]').attr("disabled", "disabled");
            $('input:radio[name="is_force"]').attr("disabled", "disabled");
            $('input:text[name="version"]').attr("disabled", "disabled");
        } else {
            $('input:radio[name="os"]').removeAttr("disabled");
            $('input:radio[name="is_use"]').removeAttr("disabled");
            $('input:radio[name="is_force"]').removeAttr("disabled");
            $('input:text[name="version"]').removeAttr("disabled");
        }
    }


    $("#bt_insert").on('click', function () {
            $("#appList").empty();
            $(this).hide();
            generateForm();
    });

    function generateForm() {
        var template = $('#tmp_appList').html();
        var templateScript = Handlebars.compile(template);
        $("#appList").html(templateScript);
    }


    $(document).on('click', '#insertAppBtn', function () {
        util.getAjaxData("insert", "/rest/content/app/insert", $("#appList").serialize() , fn_insert_success, fn_insert_fail);
    });

    function fn_insert_success(dst_id, response) {
        alert(response.message);
        generateForm();
        dtList_info.reload();
        $('html').animate({scrollTop : 0}, 100);

        $("#appList").empty();
        $("#bt_insert").show();
    }

    function fn_insert_fail() {
        dalbitLog("#####실패");
    }


</script>

<script id="tmp_appList" type="text/x-handlebars-template">
    <input type="hidden" name="idx" value="{{idx}}"/>
    <div class="row col-lg-12 mt15">
        <div class="col-md-12 no-padding">
            <span>
                <button class="btn btn-default pull-right mb15" type="button" id="insertAppBtn">등록하기</button>
            </span>
        </div>
        <table class="table table-bordered table-dalbit">
            <colgroup>
                <col width="5%"/>
                <col width="10%"/>
            </colgroup>
            <tr>
                <th>idx</th>
                <td style="text-align: left">
                    {{idx}}
                </td>
            </tr>
            <tr>
                <th>os</th>
                <td>
                    {{{getCommonCodeRadio os 'content_radioApp' 'Y' 'os'}}}
                </td>
            </tr>
            <tr>
                <th>version</th>
                <td>
                    <input type="text" name="version" id="version" value="{{version}}"/>
                </td>
            </tr>
            <tr>
                <th>강제 업데이트 여부</th>
                <td>
                    {{{getCommonCodeRadio is_force 'content_isForce' 'Y' 'is_force'}}}
                </td>
            </tr>
            <tr>
                <th>사용여부</th>
                <td>
                    {{{getCommonCodeRadio is_use 'content_isUse' 'Y' 'is_use'}}}
                </td>
            </tr>
            <tr>
                <th>등록일</th>
                <td>{{convertToDate reg_date "YYYY-MM-DD HH:mm"}}</td>
            </tr>
        </table>
    </div>
</script>