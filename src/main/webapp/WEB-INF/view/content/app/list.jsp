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
            <div class="row col-lg-12 form-inline">
                <div class="widget widget-table">
                    <div class="widget-header">
                        <h3><i class="fa fa-desktop"></i>검색결과</h3>
                    </div>
                    </div>
                    <div class="widget-content">
                        <table id="list_info" class="table table-sorting table-hover table-bordered">
                            <thead>
                                <tr>
                                    <th>idx</th>
                                    <th>os</th>
                                    <th>version</th>
                                    <th>is_force</th>
                                    <th>is_use</th>
                                    <th>reg_date</th>
                                </tr>
                            </thead>
                            <tbody id="tableBody"></tbody>
                        </table>
                    </div>
                </div> <!-- #DataTable -->
                <div class="dataTables_paginate paging_full_numbers" id="list_info_paginate">
            </div>
        </div> <!-- #container-fluid -->
    </div> <!-- #page-wrapper -->
</div> <!-- #wrapper -->

<script type="text/javascript" src="/js/code/content/contentCodeList.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
        init();
        getAppList();
    });

    $("#bt_search").click(function() {
        getAppList();
    });

    function init() {
        $("#search_os_area").html(util.getCommonCodeSelect(-1, content_app));
    }

    function getAppList(){
        util.getAjaxData("list", "/rest/content/app/list", $("#searchForm").serialize, fn_success);
    }

    function fn_success(dst_id, response) {
        dalbitLog(response);
        var template = $("#tmp_list").html();
        var templateScript = Handlebars.compile(template);
        var context = response.data;
        var html = templateScript(context);

        $("#tableBody").html(html);
    }
</script>

<script id="tmp_list" type="text/x-handlebars-template">
    {{#each this}}
    <tr>
        <td>{{idx}}</td>
        <td>{{#equal os '1'}}
            안드로이드
            {{else}}
            IOS
            {{/equal}}
        </td>
        <td>{{version}}</td>
        <td>{{is_force}}</td>
        <td>{{is_use}}</td>
        <td>{{reg_date}}
            {{#equal reg_date ''}}
                -
            {{/equal}}
        </td>
    </tr>
    {{/each}}
</script>