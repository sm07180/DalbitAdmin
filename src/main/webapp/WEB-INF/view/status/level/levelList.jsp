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
            <div class="col-md-12 no-padding">
                <div class="col-md-10 no-padding mb10">
                    <div class="pull-right">
                        <span id="levelList_summaryArea"></span>
                    </div>
                </div>
            </div>

            <div class="col-md-12 no-padding">
                <div class="col-md-5 no-padding mr5">
                    <table class="table table-bordered">
                        <colgroup>
                            <col width="20%"/><col width="20%"/><col width="20%"/><col width="20%"/><col width="20%"/>
                        </colgroup>
                        <thead>
                        <tr>
                            <th>레벨</th>
                            <th>레벨 명칭</th>
                            <th>경험치 범위(上)</th>
                            <th>회원 수</th>
                            <th>비율</th>
                        </tr>
                        </thead>
                        <tbody id="level_body1"></tbody>
                    </table>
                </div>
                <div class="col-md-5 no-padding">
                    <table class="table table-bordered">
                        <colgroup>
                            <col width="20%"/><col width="20%"/><col width="20%"/><col width="20%"/><col width="20%"/>
                        </colgroup>
                        <thead>
                        <tr>
                            <th>레벨</th>
                            <th>레벨 명칭</th>
                            <th>경험치 범위(上)</th>
                            <th>회원 수</th>
                            <th>비율</th>
                        </tr>
                        </thead>
                        <tbody id="level_body2"></tbody>
                    </table>
                </div>
            </div>
        </div>
    </div> <!-- //page-wrapper -->
</div> <!-- //wrapper -->

<script src="/js/dataTablesSource/status/levelDataTableSource.js?${dummyData}"></script>

<script type="text/javascript">

    $(document).ready(function() {
        getLevelList();
    });

    $("input[name='search_testId_level']").change(function () {
        getLevelList();
    });

    function getLevelList() {
        var data = {inner : $('input[name="search_testId_level"]').is(":checked") ? "0" : "-1"};
        util.getAjaxData("select", "/rest/status/level/level", data, fn_succ_list);
    }

    function fn_succ_list(data,response,param){
        dalbitLog(response);

        // var tmp_url = '<a href="javascript://" class="_openPop" data-url="' + url + '" data-width="'+ width +'" data-height="'+ height +'">' + display + '</a>';
        // util.popupLink(common.addComma(data),"/status/level/popup/memLevelList?level=" + row.level,1600,900);

        for(var i=0;i<response.data.length;i++){
            var tmp = "/status/level/popup/memLevelList?level=" + response.data[i].level;
            response.data[i]["levelUrl"] = '<a href="javascript://" class="_openPop" data-url="' + tmp + '" data-width="'+ 1600 +'" data-height="'+ 900 +'">' + response.data[i].memCount + '</a>';
        }

        var leftCnt = (response.data.length/2).toFixed(0);
        console.log(leftCnt);
        var responseLeft = [];
        var responseRight = [];
        for(var i=0;i<leftCnt;i++){
            responseLeft[i] = response.data[i];
        }
        for(var i=leftCnt;i<response.data.length;i++){
            responseRight[i] = response.data[i];
        }

        console.log("----------------------------------------------");
        console.log(responseLeft);
        console.log(responseRight);
        console.log("----------------------------------------------");


        $("#level_body1").empty();
        $("#level_body2").empty();

        var template = $('#tmp_levelBody1').html();
        var templateScript = Handlebars.compile(template);
        var detailContext = responseLeft;
        var html=templateScript(detailContext);
        $("#level_body1").append(html);

        var template = $('#tmp_levelBody2').html();
        var templateScript = Handlebars.compile(template);
        var detailContext = responseRight;
        var html=templateScript(detailContext);
        $("#level_body2").append(html);

        levelList_listSummary(response);
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


        ui.tableHeightSet();

    }

</script>

<script id="levelList_listSummary" type="text/x-handlebars-template">
    <table class="table table-condensed table-dark-header table-bordered no-margin" style="width: 300px;">
        <colgroup>
            <col width="40%"/><col width="60%"/>
        </colgroup>
        <tr>
            <th>총 회원 수</th>
            <td>{{addComma content.memAllCount}}</td>
        </tr>
    </table>
</script>

<script type="text/x-handlebars-template" id="tmp_levelBody1">
    {{#each this as |content|}}
    <tr>
        <td>{{level}}</td>
        <td>{{grade}}</td>
        <td>
            {{addComma levelExp}} ~ {{addComma expRange}}
        </td>
        <td>{{{levelUrl}}}</td>
        <td>{{pro}}%</td>
    </tr>
    {{else}}
        <td colspan="11" class="noData">{{isEmptyData}}<td>
    {{/each}}
</script>

<script type="text/x-handlebars-template" id="tmp_levelBody2">
    {{#each this as |content|}}
    <tr>
        <td>{{level}}</td>
        <td>{{grade}}</td>
        <td>
            {{addComma levelExp}} ~ {{addComma expRange}}
        </td>
        <td>{{{levelUrl}}}</td>
        <td>{{pro}}%</td>
    </tr>
    {{else}}
    <td colspan="11" class="noData">{{isEmptyData}}<td>
        {{/each}}
</script>