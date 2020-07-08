<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="row col-lg-12">
            <!-- 버전 별 사용자 수 -->
            <div class="col-lg-6 mb10">
                <div id="buildUser"></div>
            </div>
            <!-- //버전 별 사용자 수 -->
            <!-- 현재 마켓 노출 버전 -->
            <div class="col-lg-6 mb10">
                <div id="market"></div>
            </div>
            <!-- 현재 마켓 노출 버전 -->
        </div>

        <!-- DATA TABLE -->
        <div class="row form-inline block col-lg-12">
            <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist">
                <li class="tab_select" id="platform" name="platform"></li>
            </ul>

            <div class="widget widget-table no-margin">
                <div class="widget-content">
                    <table id="appVersionList" class="table table-sorting table-hover table-bordered">
                        <thead></thead>
                        <tbody></tbody>
                    </table>
                </div>
            </div>
        </div>
        <!-- //DATA TABLE -->

    </div> <!-- //page-wrapper -->
</div> <!-- //wrapper -->

<script src="/js/dataTablesSource/status/appVersionDataTableSource.js?${dummyData}"></script>
<script src="/js/code/status/statusCodeList.js?${dummyData}"></script>

<script type="text/javascript">

    $(function() {
        $('#platform').html(util.getCommonCodeSelect(null, appVersion_platform));

        // 버전 별 사용자
        // util.getAjaxData("versionUser", "/rest/status/appVersion/selectVersionUser", null, fn_versionUser_success);

        // 빌드번호 별 사용자
        util.getAjaxData("buildUser", "/rest/status/appVersion/selectBuildUser", null, fn_buildUser_success);
        // 현재 마켓 노출 버전
        util.getAjaxData("marketList", "/rest/status/appVersion/selectMarketVersion", null, fn_marketList_success);
        // 전체 리스트 조회, dataTable
        getTotalList();
    });

    var dtList_info;
    var platform=0;
    function getTotalList() {
        var dtList_info_data = function (data) {
            data.platform = platform;
        };

        dtList_info = new DalbitDataTable($('#appVersionList'), dtList_info_data, appVersionDataTableSource.appVersionList, $('#searchForm'));
        dtList_info.useCheckBox(false);
        dtList_info.useIndex(false);
        dtList_info.setPageLength(50);
        dtList_info.useInitReload(true);
        dtList_info.createDataTable();


        platformType_sel_change();
    }

    function fn_marketList_success(dst_id, response) {
        var template = $("#tmp_market").html();
        var templateScript = Handlebars.compile(template);
        var context = response.data;
        var html = templateScript(context);

        $("#market").html(html);
    }

    function fn_buildUser_success(dst_id, response) {
        var template = $("#tmp_buildUser").html();
        var templateScript = Handlebars.compile(template);
        var context = response.data;
        var html = templateScript(context);

        $("#buildUser").html(html);
    }

    function platformType_sel_change() {
        $('#platform').on('change', function() {
            platform = $('select[name="platform"]').val();
            getTotalList();
        });
    }

    // function fn_versionUser_success(dst_id, response) {
    //     var template = $("#tmp_versionUser").html();
    //     var templateScript = Handlebars.compile(template);
    //     var context = response.data;
    //     var html = templateScript(context);
    //
    //     $("#versionUser").html(html);
    // }

</script>


<script id="tmp_buildUser" type="text/x-handlebars-template">
    <table class="table table-condensed table-dark-header table-bordered mb15">
        <thead>
        <tr>
            <th>AOS</th>
            {{#each aosList}}
            <th>{{buildVersion}}</th>
            {{/each}}
            <th>기타</th>
            <th>총합</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <th>사용자</th>
            {{#each aosList}}
            <td>{{addComma userCnt}}</td>
            {{/each}}
            <td>{{addComma math aosTotUsers "-" aosBuildUser}}</td>
            <td>{{addComma aosTotUsers}}</td>
        </tr>
        </tbody>
    </table>
    <table class="table table-condensed table-dark-header table-bordered">
        <thead>
        <tr>
            <th>IOS</th>
            {{#each iosList}}
            <th>{{buildVersion}}</th>
            {{/each}}
            <th>기타</th>
            <th>총합</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <th>사용자</th>
            {{#each iosList}}
            <td>{{addComma userCnt}}</td>
            {{/each}}
            <td>{{addComma math iosTotUsers "-" iosBuildUser}}</td>
            <td>{{addComma iosTotUsers}}</td>
        </tr>
        </tbody>
    </table>
</script>

<script id="tmp_market" type="text/x-handlebars-template">
    <table class="table table-condensed table-dark-header table-bordered no-margin">
        <thead>
        <tr>
            <th>현재 마켓 노출 버전</th>
            <th>버전</th>
            <th>사용자</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <th>AOS</th>
            {{#each aosMarketList}}
            <td>{{appVersion}}</td>
            <td>{{addComma userCnt}}</td>
            {{/each}}
        </tr>
        <tr>
            <th>IOS</th>
            {{#each iosMarketList}}
            <td>{{appVersion}}</td>
            <td>{{addComma userCnt}}</td>
            {{/each}}
        </tr>
        </tbody>
    </table>
</script>

<%--<script id="tmp_versionUser" type="text/x-handlebars-template">--%>
    <%--<table class="table table-condensed table-dark-header table-bordered mb15">--%>
        <%--<thead>--%>
        <%--<tr>--%>
            <%--<th>AOS</th>--%>
            <%--{{#each aosList}}--%>
            <%--<th>{{appVersion}}</th>--%>
            <%--{{/each}}--%>
            <%--<th>기타</th>--%>
            <%--<th>총합</th>--%>
        <%--</tr>--%>
        <%--</thead>--%>
        <%--<tbody>--%>
        <%--<tr>--%>
            <%--<th>사용자</th>--%>
            <%--{{#each aosList}}--%>
            <%--<td>{{userCnt}}</td>--%>
            <%--{{/each}}--%>
            <%--<td>{{math aosTotUsers "-" aosVersionUsers}}</td>--%>
            <%--<td>{{aosTotUsers}}</td>--%>
        <%--</tr>--%>
        <%--</tbody>--%>
    <%--</table>--%>
    <%--<table class="table table-condensed table-dark-header table-bordered">--%>
        <%--<thead>--%>
        <%--<tr>--%>
            <%--<th>IOS</th>--%>
            <%--{{#each iosList}}--%>
            <%--<th>{{appVersion}}</th>--%>
            <%--{{/each}}--%>
            <%--<th>기타</th>--%>
            <%--<th>총합</th>--%>
        <%--</tr>--%>
        <%--</thead>--%>
        <%--<tbody>--%>
        <%--<tr>--%>
            <%--<th>사용자</th>--%>
            <%--{{#each iosList}}--%>
            <%--<td>{{userCnt}}</td>--%>
            <%--{{/each}}--%>
            <%--<td>{{math iosTotUsers "-" iosVersionUsers}}</td>--%>
            <%--<td>{{iosTotUsers}}</td>--%>
        <%--</tr>--%>
        <%--</tbody>--%>
    <%--</table>--%>
<%--</script>--%>
