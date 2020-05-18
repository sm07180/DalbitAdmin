<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="container-fluid">
            <!-- serachBox -->
            <div class="row col-lg-12 form-inline">
                <div class="widget widget-table searchBoxArea">
                    <div class="widget-header searchBoxRow">
                        <h3 class="title"><i class="fa fa-search"></i> DJ 검색</h3>
                        <div>
                            <span id="searchArea"></span>
                            <label><input type="text" class="form-control" id="txt_search" name="txt_search"></label>
                            <button type="button" class="btn btn-success" id="bt_search">검색</button>
                        </div>
                    </div>
                </div>

                <form id="searchForm">
                </form>
                <!-- //serachBox -->

                <!-- summary -->
                <div class="widget-content">
                    <table class="table table-bordered table-summary">
                        <thead>
                        <tr>
                            <th>총 신청 달D</th>
                            <th>승인 달D</th>
                        </tr>
                        </thead>
                        <tbody id="tableBody">
                        </tbody>
                    </table>
                </div>
                <!-- //summary -->
            </div>
            <!-- tab -->
            <div class="no-padding" id="listTab">
                <jsp:include page="listTab.jsp"/>
            </div>
            <!-- //tab -->
        </div>
    </div>
</div>

<script type="text/javascript">

    $(document).ready(function() {
        $('#searchArea').html(util.getCommonCodeSelect(-1, special_searchType));
        util.getAjaxData("summary", "/rest/menu/special/summary", null, fn_summary_success);
    });

    function fn_summary_success(dst_id, response){
        var template = $('#tmp_summary').html();
        var templateScript = Handlebars.compile(template);
        var context = response;
        var html = templateScript(context);

        $("#tableBody").append(html);
    }

    $('#bt_search').on('click', function() {
        var me = $(this);
        var tab = me.parent();

        var tabIndex = $('#tablist_con li').index(tab);
        dalbitLog(tabIndex);
        // util.getAjaxData("search", "/rest/menu/special/search", $('#searchForm').serialize(), fn_search_success);
    });




</script>

<script id="tmp_summary" type="text/x-handlebars-template">
    {{#data}}
    <tr>
        <td>{{addComma requestDal}}건</td> <%-- 총 신청 달D--%>
        <td>{{addComma approveDal}}건</td> <%-- 승인 달D --%>
    </tr>
    {{/data}}
</script>