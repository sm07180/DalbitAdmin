<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 방송 > 방송시간 -->
<div class="widget widget-table mb10">
    <div class="widget-content mt10">
        <span class="_searchDate"></span>
        <table class="table table-bordered">
            <colgroup>
                <col width="5.4%"/><col width="4.3%"/><col width="4.3%"/><col width="4.3%"/><col width="4.3%"/>
                <col width="4.3%"/><col width="4.3%"/><col width="4.3%"/><col width="4.3%"/><col width="4.3%"/>
                <col width="4.3%"/><col width="4.3%"/><col width="4.3%"/><col width="4.3%"/><col width="4.3%"/>
                <col width="4.3%"/><col width="4.3%"/><col width="4.3%"/><col width="4.3%"/><col width="4.3%"/>
                <col width="4.3%"/><col width="4.3%"/><col width="4.3%"/>
            </colgroup>
            <thead>
            <tr>
                <th></th>
                <th>소계</th>
                <th>수다/챗</th>
                <th>일상/소통</th>
                <th>힐링</th>
                <th>노래/연주</th>
                <th>미팅/소개팅</th>
                <th>고민/사연</th>
                <th>책/여행</th>
                <th>ASMR</th>
                <th>성우</th>
            </tr>
            </thead>
            <tbody id="airTimeListBody">
            </tbody>
        </table>
    </div>
    <div class="widget-footer">
        <span>
            <%--<button class="btn btn-default print-btn pull-right" type="button" id="excelDownBtn"><i class="fa fa-print"></i>Excel Down</button>--%>
        </span>
    </div>
</div>

<script type="text/javascript">
    $(function(){
        getAirTimelList();
    });

    function getAirTimelList(){
        util.getAjaxData("getAirTimelList", "/rest/status/broadcast/info/subject/time", $("#searchForm").serialize(), fn_airTimeJoin_success);
    }


    function fn_airTimeJoin_success(dst_id, response) {
        var isDataEmpty = response.data.detailList == null;
        $("#airTimeListBody").empty();
        if(!isDataEmpty){
            var template = $('#tmp_airTime').html();
            var templateScript = Handlebars.compile(template);
            var totalContext = response.data.totalInfo;
            var totalHtml = templateScript(totalContext);
            $("#airTimeListBody").append(totalHtml);

            response.data.detailList.slctType = $('input:radio[name="slctType"]:checked').val();
        }

        var template = $('#tmp_airTimeDetailList').html();
        var templateScript = Handlebars.compile(template);
        var detailContext = response.data.detailList;
        var html=templateScript(detailContext);
        $("#airTimeListBody").append(html);

        if(isDataEmpty){
            $("#airTimeListBody td:last").remove();
        }else{
            $("#airTimeListBody").append(totalHtml);
        }
    }
</script>

<script type="text/x-handlebars-template" id="tmp_airTime">
    <tr class="success font-bold">
        <td>소계</td>
        <td>{{addComma sum_totalBroadcastTime}}</td>
        <td>{{addComma sum_broadcast03Time}}</td>
        <td>{{addComma sum_broadcast00Time}}</td>
        <td>{{addComma sum_broadcast01Time}}</td>
        <td>{{addComma sum_broadcast02Time}}</td>
        <td>{{addComma sum_broadcast04Time}}</td>
        <td>{{addComma sum_broadcast05Time}}</td>
        <td>{{addComma sum_broadcast06Time}}</td>
        <td>{{addComma sum_broadcast09Time}}</td>
        <td>{{addComma sum_broadcast13Time}}</td>
    </tr>
</script>

<script type="text/x-handlebars-template" id="tmp_airTimeDetailList">
    {{#each this as |data|}}
    <tr>
        <td class="font-bold">
            {{#equal ../slctType 0}}{{data.hour}}시{{/equal}}
            {{#equal ../slctType 1}}{{data.daily}}{{/equal}}
            {{#equal ../slctType 2}}{{data.monthly}}월{{/equal}}
        </td>
        <td>{{addComma totalBroadcastTime}}</td>
        <td>{{addComma broadcast03Time}}</td>   <!--03	수다/챗 -->
        <td>{{addComma broadcast00Time}}</td>   <!--00	일상/소통 -->
        <td>{{addComma broadcast01Time}}</td>   <!--01	힐링 -->
        <td>{{addComma broadcast02Time}}</td>   <!--02	노래/연주 -->
        <td>{{addComma broadcast04Time}}</td>   <!--04	미팅/소개팅 -->
        <td>{{addComma broadcast05Time}}</td>   <!--05	고민/사연 -->
        <td>{{addComma broadcast06Time}}</td>   <!--06	책/여행 -->
        <td>{{addComma broadcast09Time}}</td>   <!--09	ASMR -->
        <td>{{addComma broadcast13Time}}</td>   <!--13	성우 -->
    </tr>
    {{else}}
    <tr>
        <td colspan="22" class="noData">{{isEmptyData}}<td>
    </tr>
    {{/each}}
</script>