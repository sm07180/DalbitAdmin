<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 방송 > 방송시간 -->
<div class="widget widget-table mb10">
    <div class="widget-header">
        <div class="btn-group widget-header-toolbar">
            <a href="#" title="Expand/Collapse" class="btn-borderless btn-toggle-expand"><i class="fa fa-chevron-up"></i></a>
        </div>
    </div>
    <div class="widget-content mt10">
        <a href="javascript://" class="_prevSearch">[이전]</a>
        <span class="_searchDate"></span>
        <a href="javascript://" class="_nextSearch">[다음]</a>
        <table class="table table-bordered">
            <thead>
            <tr>
                <th>시간대</th>
                <th>소계</th>
                <th>일상</th>
                <th>수다/챗</th>
                <th>노래/연주</th>
                <th>노래방</th>
                <th>책/스토리</th>
                <th>여행</th>
                <th>힐링</th>
                <th>고민/사연</th>
                <th>사랑/우정</th>
                <th>ASMR</th>
                <th>유머</th>
                <th>스터디</th>
                <th>성우</th>
                <th>연애/오락</th>
                <th>먹방/요리</th>
                <th>건강/스포츠</th>
                <th>게임</th>
                <th>드라마/영화</th>
                <th>외국어</th>
                <th>판매/영업</th>
                <th>기타</th>
            </tr>
            </thead>
            <tbody id="airTimeListBody">
            </tbody>
        </table>
    </div>
    <div class="widget-footer">
        <span>
            <button class="btn btn-default print-btn pull-right" type="button" id="excelDownBtn"><i class="fa fa-print"></i>Excel Down</button>
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
    <tr class="success">
        <td>소계</td>
        <td>{{addComma sum_totalBroadcast}}</td>
        <td>{{addComma sum_broadcast00Time}}</td>
        <td>{{addComma sum_broadcast01Time}}</td>
        <td>{{addComma sum_broadcast02Time}}</td>
        <td>{{addComma sum_broadcast03Time}}</td>
        <td>{{addComma sum_broadcast04Time}}</td>
        <td>{{addComma sum_broadcast05Time}}</td>
        <td>{{addComma sum_broadcast06Time}}</td>
        <td>{{addComma sum_broadcast07Time}}</td>
        <td>{{addComma sum_broadcast08Time}}</td>
        <td>{{addComma sum_broadcast09Time}}</td>
        <td>{{addComma sum_broadcast10Time}}</td>
        <td>{{addComma sum_broadcast11Time}}</td>
        <%--<td>{{addComma sum_broadcast12Time}}</td>--%>
        <td>{{addComma sum_broadcast13Time}}</td>
        <td>{{addComma sum_broadcast14Time}}</td>
        <td>{{addComma sum_broadcast15Time}}</td>
        <td>{{addComma sum_broadcast16Time}}</td>
        <td>{{addComma sum_broadcast17Time}}</td>
        <%--<td>{{addComma sum_broadcast18Time}}</td>--%>
        <td>{{addComma sum_broadcast19Time}}</td>
        <td>{{addComma sum_broadcast20Time}}</td>
        <td>{{addComma sum_broadcast21Time}}</td>
        <%--<td>{{addComma sum_broadcast22Time}}</td>--%>
        <%--<td>{{addComma sum_broadcast23Time}}</td>--%>
        <%--<td>{{addComma sum_broadcast24Time}}</td>--%>
        <%--<td>{{addComma sum_broadcast25Time}}</td>--%>
        <%--<td>{{addComma sum_broadcast26Time}}</td>--%>
        <%--<td>{{addComma sum_broadcast27Time}}</td>--%>
        <%--<td>{{addComma sum_broadcast28Time}}</td>--%>
        <%--<td>{{addComma sum_broadcast29Time}}</td>--%>
        <%--<td>{{addComma sum_broadcast30Time}}</td>--%>
        <td>{{addComma sum_broadcast99Time}}</td>
    </tr>
</script>

<script type="text/x-handlebars-template" id="tmp_airTimeDetailList">
    {{#each this as |data|}}
    <tr>
        <td>
            {{#equal ../slctType 0}}{{data.hour}}시{{/equal}}
            {{#equal ../slctType 1}}{{data.daily}}{{/equal}}
            {{#equal ../slctType 2}}{{data.monthly}}월{{/equal}}
        </td>
        <td>{{addComma totalBroadcast}}</td>
        <td>{{addComma broadcast00Time}}</td>   <!--00	일상 -->
        <td>{{addComma broadcast01Time}}</td>   <!--01	수다/챗 -->
        <td>{{addComma broadcast02Time}}</td>   <!--02	노래/연주 -->
        <td>{{addComma broadcast03Time}}</td>   <!--03	노래방 -->
        <td>{{addComma broadcast04Time}}</td>   <!--04	책/스토리 -->
        <td>{{addComma broadcast05Time}}</td>   <!--05	여행 -->
        <td>{{addComma broadcast06Time}}</td>   <!--06	힐링 -->
        <td>{{addComma broadcast07Time}}</td>   <!--07	고민/사연 -->
        <td>{{addComma broadcast08Time}}</td>   <!--08	사랑/우정 -->
        <td>{{addComma broadcast09Time}}</td>   <!--09	ASMR -->
        <td>{{addComma broadcast10Time}}</td>   <!--10	유머 -->
        <td>{{addComma broadcast11Time}}</td>   <!--11	스터디 -->
        <%--<td>{{addComma broadcast12Time}}</td>   --%>
        <td>{{addComma broadcast13Time}}</td>    <!--13	성우 -->
        <td>{{addComma broadcast14Time}}</td>    <!--14	연애/오락 -->
        <td>{{addComma broadcast15Time}}</td>    <!--15	먹방/요리 -->
        <td>{{addComma broadcast16Time}}</td>    <!--16	건강/스포츠 -->
        <td>{{addComma broadcast17Time}}</td>    <!--17	게임 -->
        <%--<td>{{addComma broadcast18Time}}</td>     --%>
        <td>{{addComma broadcast19Time}}</td>    <!-- 19	드라마/영화 -->
        <td>{{addComma broadcast20Time}}</td>    <!-- 20	외국어 -->
        <td>{{addComma broadcast21Time}}</td>    <!-- 21	판매/영업 -->
        <%--<td>{{addComma broadcast22Time}}</td>--%>
        <%--<td>{{addComma broadcast23Time}}</td>--%>
        <%--<td>{{addComma broadcast24Time}}</td>--%>
        <%--<td>{{addComma broadcast25Time}}</td>--%>
        <%--<td>{{addComma broadcast26Time}}</td>--%>
        <%--<td>{{addComma broadcast27Time}}</td>--%>
        <%--<td>{{addComma broadcast28Time}}</td>--%>
        <%--<td>{{addComma broadcast29Time}}</td>--%>
        <%--<td>{{addComma broadcast30Time}}</td>--%>
        <td>{{addComma broadcast99Time}}</td>
    </tr>
    {{else}}
    <tr>
        <td colspan="22" class="noData">{{isEmptyData}}<td>
    </tr>
    {{/each}}
</script>