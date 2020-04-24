<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    Date nowTime = new Date();
    SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
%>

<!-- 방송 > 방송개설 -->
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
            <tbody id="airOpenBody">
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
        getAirOpenList();
    });

    function getAirOpenList(){
        util.getAjaxData("getAirOpenList", "/rest/status/broadcast/info/subject/create", $("#searchForm").serialize(), fn_airOpenList_success);
    }

    function fn_airOpenList_success(dst_id, response) {
        dalbitLog(response);
        var isDataEmpty = response.data.detailList == null;
        $("#airOpenBody").empty();
        if(!isDataEmpty){
            var template = $('#tmp_airOpen').html();
            var templateScript = Handlebars.compile(template);
            var totalContext = response.data.totalInfo;
            var totalTtml = templateScript(totalContext);
            $("#airOpenBody").append(totalTtml);

            response.data.detailList.slctType = $('input:radio[name="slctType"]:checked').val();
        }

        var template = $('#tmp_airOpenDetailList').html();
        var templateScript = Handlebars.compile(template);
        var detailContext = response.data.detailList;
        var html=templateScript(detailContext);
        $("#airOpenBody").append(html);

        if(isDataEmpty){
            $("#airOpenBody td:last").remove();
        }else{
            $("#airOpenBody").append(totalTtml);
        }
    }
</script>

<script type="text/x-handlebars-template" id="tmp_airOpen">
    <tr class="success">
        <td>소계</td>
        <td>{{addComma sum_totalCreateCnt}}</td>
        <td>{{addComma sum_create00Cnt}}</td>
        <td>{{addComma sum_create01Cnt}}</td>
        <td>{{addComma sum_create02Cnt}}</td>
        <td>{{addComma sum_create03Cnt}}</td>
        <td>{{addComma sum_create04Cnt}}</td>
        <td>{{addComma sum_create05Cnt}}</td>
        <td>{{addComma sum_create06Cnt}}</td>
        <td>{{addComma sum_create07Cnt}}</td>
        <td>{{addComma sum_create08Cnt}}</td>
        <td>{{addComma sum_create09Cnt}}</td>
        <td>{{addComma sum_create10Cnt}}</td>
        <td>{{addComma sum_create11Cnt}}</td>
        <%--<td>{{addComma sum_create12Cnt}}</td>--%>
        <td>{{addComma sum_create13Cnt}}</td>
        <td>{{addComma sum_create14Cnt}}</td>
        <td>{{addComma sum_create15Cnt}}</td>
        <td>{{addComma sum_create16Cnt}}</td>
        <td>{{addComma sum_create17Cnt}}</td>
        <%--<td>{{addComma sum_create18Cnt}}</td>--%>
        <td>{{addComma sum_create19Cnt}}</td>
        <td>{{addComma sum_create20Cnt}}</td>
        <td>{{addComma sum_create21Cnt}}</td>
        <%--<td>{{addComma sum_create22Cnt}}</td>--%>
        <%--<td>{{addComma sum_create23Cnt}}</td>--%>
        <%--<td>{{addComma sum_create24Cnt}}</td>--%>
        <%--<td>{{addComma sum_create25Cnt}}</td>--%>
        <%--<td>{{addComma sum_create26Cnt}}</td>--%>
        <%--<td>{{addComma sum_create27Cnt}}</td>--%>
        <%--<td>{{addComma sum_create28Cnt}}</td>--%>
        <%--<td>{{addComma sum_create29Cnt}}</td>--%>
        <%--<td>{{addComma sum_create30Cnt}}</td>--%>
        <td>{{addComma sum_create99Cnt}}</td>
    </tr>
</script>

<script type="text/x-handlebars-template" id="tmp_airOpenDetailList">
    {{#each this as |data|}}
    <tr>
        <td>
            {{#equal ../slctType 0}}{{data.hour}}시{{/equal}}
            {{#equal ../slctType 1}}{{data.daily}}{{/equal}}
            {{#equal ../slctType 2}}{{data.monthly}}월{{/equal}}
        </td>
        <td>{{addComma totalCreateCnt}}</td>
        <td>{{addComma create00Cnt}}</td>   <!--00	일상 -->
        <td>{{addComma create01Cnt}}</td>   <!--01	수다/챗 -->
        <td>{{addComma create02Cnt}}</td>   <!--02	노래/연주 -->
        <td>{{addComma create03Cnt}}</td>   <!--03	노래방 -->
        <td>{{addComma create04Cnt}}</td>   <!--04	책/스토리 -->
        <td>{{addComma create05Cnt}}</td>   <!--05	여행 -->
        <td>{{addComma create06Cnt}}</td>   <!--06	힐링 -->
        <td>{{addComma create07Cnt}}</td>   <!--07	고민/사연 -->
        <td>{{addComma create08Cnt}}</td>   <!--08	사랑/우정 -->
        <td>{{addComma create09Cnt}}</td>   <!--09	ASMR -->
        <td>{{addComma create10Cnt}}</td>   <!--10	유머 -->
        <td>{{addComma create11Cnt}}</td>   <!--11	스터디 -->
        <%--<td>{{addComma create12Cnt}}</td>   --%>
        <td>{{addComma create13Cnt}}</td>    <!--13	성우 -->
        <td>{{addComma create14Cnt}}</td>    <!--14	연애/오락 -->
        <td>{{addComma create15Cnt}}</td>    <!--15	먹방/요리 -->
        <td>{{addComma create16Cnt}}</td>    <!--16	건강/스포츠 -->
        <td>{{addComma create17Cnt}}</td>    <!--17	게임 -->
        <%--<td>{{addComma create18Cnt}}</td>     --%>
        <td>{{addComma create19Cnt}}</td>    <!-- 19	드라마/영화 -->
        <td>{{addComma create20Cnt}}</td>    <!-- 20	외국어 -->
        <td>{{addComma create21Cnt}}</td>    <!-- 21	판매/영업 -->
        <%--<td>{{addComma create22Cnt}}</td>--%>
        <%--<td>{{addComma create23Cnt}}</td>--%>
        <%--<td>{{addComma create24Cnt}}</td>--%>
        <%--<td>{{addComma create25Cnt}}</td>--%>
        <%--<td>{{addComma create26Cnt}}</td>--%>
        <%--<td>{{addComma create27Cnt}}</td>--%>
        <%--<td>{{addComma create28Cnt}}</td>--%>
        <%--<td>{{addComma create29Cnt}}</td>--%>
        <%--<td>{{addComma create30Cnt}}</td>--%>
        <td>{{addComma create99Cnt}}</td>
    </tr>
    {{else}}
    <tr>
        <td colspan="22" class="noData">{{isEmptyData}}<td>
    </tr>
    {{/each}}
</script>