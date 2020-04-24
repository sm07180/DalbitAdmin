<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    Date nowTime = new Date();
    SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
%>

<!-- 방송 > 청취자 -->
<div class="widget widget-table mb10">
    <div class="widget-header">
        <div class="btn-group widget-header-toolbar">
            <a href="#" title="Expand/Collapse" class="btn-borderless btn-toggle-expand"><i class="fa fa-chevron-up"></i></a>
        </div>
    </div>
    <div class="widget-content mt10">
        <a href="javascript://">[이전]</a>
        <%= sf.format(nowTime)%>
        <a href="javascript://">[다음]</a>
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
            <tbody id="listenerListBody">
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
        broadcastListener();
    });

    function broadcastListener(){
        util.getAjaxData("broadcastListener", "/rest/status/broadcast/listener/list", $("#searchForm").serialize(), fn_broadcastListener_success);
    }

    function fn_broadcastListener_success(dst_id, response) {
        dalbitLog(response);
        var isDataEmpty = response.data.detailList == null;
        $("#listenerListBody").empty();
        if(!isDataEmpty){
            var template = $('#tmp_listenerTotal').html();
            var templateScript = Handlebars.compile(template);
            var totalContext = response.data.totalInfo;
            var totalTtml = templateScript(totalContext);
            $("#listenerListBody").append(totalTtml);

            response.data.detailList.slctType = $('input:radio[name="slctType"]:checked').val();
        }

        var template = $('#tmp_listenerDetailList').html();
        var templateScript = Handlebars.compile(template);
        var detailContext = response.data.detailList;
        var html=templateScript(detailContext);
        $("#listenerListBody").append(html);

        if(isDataEmpty){
            $("#listenerListBody td:last").remove();
        }else{
            $("#listenerListBody").append(totalTtml);
        }
    }
</script>

<script type="text/x-handlebars-template" id="tmp_listenerTotal">
    <tr class="success">
        <td>소계</td>
        <td>{{addComma sum_totalJoinCnt}}</td>
        <td>{{addComma sum_join00Cnt}}</td>
        <td>{{addComma sum_join01Cnt}}</td>
        <td>{{addComma sum_join02Cnt}}</td>
        <td>{{addComma sum_join03Cnt}}</td>
        <td>{{addComma sum_join04Cnt}}</td>
        <td>{{addComma sum_join05Cnt}}</td>
        <td>{{addComma sum_join06Cnt}}</td>
        <td>{{addComma sum_join07Cnt}}</td>
        <td>{{addComma sum_join08Cnt}}</td>
        <td>{{addComma sum_join09Cnt}}</td>
        <td>{{addComma sum_join10Cnt}}</td>
        <td>{{addComma sum_join11Cnt}}</td>
        <%--<td>{{addComma sum_join12Cnt}}</td>--%>
        <td>{{addComma sum_join13Cnt}}</td>
        <td>{{addComma sum_join14Cnt}}</td>
        <td>{{addComma sum_join15Cnt}}</td>
        <td>{{addComma sum_join16Cnt}}</td>
        <td>{{addComma sum_join17Cnt}}</td>
        <%--<td>{{addComma sum_join18Cnt}}</td>--%>
        <td>{{addComma sum_join19Cnt}}</td>
        <td>{{addComma sum_join20Cnt}}</td>
        <td>{{addComma sum_join21Cnt}}</td>
        <%--<td>{{addComma sum_join22Cnt}}</td>--%>
        <%--<td>{{addComma sum_join23Cnt}}</td>--%>
        <%--<td>{{addComma sum_join24Cnt}}</td>--%>
        <%--<td>{{addComma sum_join25Cnt}}</td>--%>
        <%--<td>{{addComma sum_join26Cnt}}</td>--%>
        <%--<td>{{addComma sum_join27Cnt}}</td>--%>
        <%--<td>{{addComma sum_join28Cnt}}</td>--%>
        <%--<td>{{addComma sum_join29Cnt}}</td>--%>
        <%--<td>{{addComma sum_join30Cnt}}</td>--%>
        <td>{{addComma sum_join99Cnt}}</td>
    </tr>
</script>

<script type="text/x-handlebars-template" id="tmp_listenerDetailList">
    {{#each this as |data|}}
    <tr>
        <td>
            {{#equal ../slctType 0}}{{data.hour}}시{{/equal}}
            {{#equal ../slctType 1}}{{data.daily}}{{/equal}}
            {{#equal ../slctType 2}}{{data.monthly}}월{{/equal}}
        </td>
        <td>{{addComma totalJoinCnt}}</td>
        <td>{{addComma join00Cnt}}</td>   <!--00	일상 -->
        <td>{{addComma join01Cnt}}</td>   <!--01	수다/챗 -->
        <td>{{addComma join02Cnt}}</td>   <!--02	노래/연주 -->
        <td>{{addComma join03Cnt}}</td>   <!--03	노래방 -->
        <td>{{addComma join04Cnt}}</td>   <!--04	책/스토리 -->
        <td>{{addComma join05Cnt}}</td>   <!--05	여행 -->
        <td>{{addComma join06Cnt}}</td>   <!--06	힐링 -->
        <td>{{addComma join07Cnt}}</td>   <!--07	고민/사연 -->
        <td>{{addComma join08Cnt}}</td>   <!--08	사랑/우정 -->
        <td>{{addComma join09Cnt}}</td>   <!--09	ASMR -->
        <td>{{addComma join10Cnt}}</td>   <!--10	유머 -->
        <td>{{addComma join11Cnt}}</td>   <!--11	스터디 -->
        <%--<td>{{addComma join12Cnt}}</td>   --%>
        <td>{{addComma join13Cnt}}</td>    <!--13	성우 -->
        <td>{{addComma join14Cnt}}</td>    <!--14	연애/오락 -->
        <td>{{addComma join15Cnt}}</td>    <!--15	먹방/요리 -->
        <td>{{addComma join16Cnt}}</td>    <!--16	건강/스포츠 -->
        <td>{{addComma join17Cnt}}</td>    <!--17	게임 -->
        <%--<td>{{addComma join18Cnt}}</td>     --%>
        <td>{{addComma join19Cnt}}</td>    <!-- 19	드라마/영화 -->
        <td>{{addComma join20Cnt}}</td>    <!-- 20	외국어 -->
        <td>{{addComma join21Cnt}}</td>    <!-- 21	판매/영업 -->
        <%--<td>{{addComma join22Cnt}}</td>--%>
        <%--<td>{{addComma join23Cnt}}</td>--%>
        <%--<td>{{addComma join24Cnt}}</td>--%>
        <%--<td>{{addComma join25Cnt}}</td>--%>
        <%--<td>{{addComma join26Cnt}}</td>--%>
        <%--<td>{{addComma join27Cnt}}</td>--%>
        <%--<td>{{addComma join28Cnt}}</td>--%>
        <%--<td>{{addComma join29Cnt}}</td>--%>
        <%--<td>{{addComma join30Cnt}}</td>--%>
        <td>{{addComma join99Cnt}}</td>
    </tr>
    {{else}}
    <tr>
        <td colspan="22" class="noData">{{isEmptyData}}<td>
    </tr>
    {{/each}}
</script>