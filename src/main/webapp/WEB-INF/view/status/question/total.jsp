<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    Date nowTime = new Date();
    SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
%>

<!-- 로그인 현황 > 총계 -->
<div class="widget widget-table mb10">
    <div class="widget-content mt10">
        <span class="_searchDate"></span>
        <table class="table table-bordered">
            <colgroup>
                <col width="9%"/><col width="9%"/><col width="9%"/><col width="9%"/><col width="9%"/>
                <col width="9%"/><col width="9%"/><col width="9%"/><col width="9%"/><col width="9%"/>
                <col width="9%"/>

            </colgroup>
            <thead id="totalTable">
            <tr>
                <th rowspan="2" class="_stateTopTh">구분</th>
                <th rowspan="2" class="_stateTopTh">총합</th>
                <th colspan="3" class="_stateTopTh">등록 건 수</th>
                <th colspan="3" class="_stateTopTh">처리 건 수</th>
                <th colspan="3" class="_stateTopTh">미처리 건 수</th>
            </tr>
            <tr>
                <th class="_stateSubTh">회원</th>
                <th class="_stateSubTh">비회원</th>
                <th class="_stateSubTh">소계</th>
                <th class="_stateSubTh">회원</th>
                <th class="_stateSubTh">비회원</th>
                <th class="_stateSubTh">소계</th>
                <th class="_stateSubTh">회원</th>
                <th class="_stateSubTh">비회원</th>
                <th class="_stateSubTh">소계</th>
            </tr>
            </thead>
            <tbody id="totalTableBody"></tbody>
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
        getTotalList();
    });

    function getTotalList(){
        util.getAjaxData("total", "/rest/status/question/total", $("#searchForm").serialize(), fn_total_success);
    }

    function fn_total_success(data, response){
        var isDataEmpty = response.data.detailList == null;

        var sum_regCnt_total = [
            response.data.totalInfo.sum_regCnt,
            response.data.totalInfo.sum_no_regCnt,
        ];
        response.data.totalInfo["sum_regCnt_total"] = common.getListSum(sum_regCnt_total);
        var sum_opCnt_total = [
            response.data.totalInfo.sum_opCnt,
            response.data.totalInfo.sum_no_opCnt,
        ];
        response.data.totalInfo["sum_opCnt_total"] = common.getListSum(sum_opCnt_total);
        var sum_nopCnt_total = [
            response.data.totalInfo.sum_nopCnt,
            response.data.totalInfo.sum_no_nopCnt,
        ];
        response.data.totalInfo["sum_nopCnt_total"] = common.getListSum(sum_nopCnt_total);

        var sum_totalCnt = [
            response.data.totalInfo.sum_regCnt_total,
            response.data.totalInfo.sum_opCnt_total,
            response.data.totalInfo.sum_nopCnt_total,
        ];
        response.data.totalInfo["sum_totalCnt"] = common.getListSum(sum_totalCnt);

        for(var i=0;i<response.data.detailList.length;i++){
            var regCnt_total = [
                response.data.detailList[i].regCnt,
                response.data.detailList[i].no_regCnt,
            ];
            response.data.detailList[i]["regCnt_total"] = common.getListSum(regCnt_total);
            var opCnt_total = [
                response.data.detailList[i].opCnt,
                response.data.detailList[i].no_opCnt,
            ];
            response.data.detailList[i]["opCnt_total"] = common.getListSum(opCnt_total);
            var nopCnt_total = [
                response.data.detailList[i].nopCnt,
                response.data.detailList[i].no_nopCnt,
            ];
            response.data.detailList[i]["nopCnt_total"] = common.getListSum(nopCnt_total);
            var totalCnt = [
                response.data.detailList[i].regCnt_total,
                response.data.detailList[i].opCnt_total,
                response.data.detailList[i].nopCnt_total,
            ];
            response.data.detailList[i]["totalCnt"] = common.getListSum(totalCnt);
        }

        $("#totalTableBody").empty();
        if(!isDataEmpty){
            var template = $('#tmp_total').html();
            var templateScript = Handlebars.compile(template);
            var totalContext = response.data.totalInfo;
            var totalHtml = templateScript(totalContext);
            $("#totalTableBody").append(totalHtml);
            response.data.detailList.slctType = $('input[name="slctType"]:checked').val();
        }

        var template = $('#tmp_detailList').html();
        var templateScript = Handlebars.compile(template);
        var detailContext = response.data.detailList;
        var html=templateScript(detailContext);
        $("#totalTableBody").append(html);

        if(isDataEmpty){
            $("#totalTableBody td:last").remove();
        }else{
            $("#totalTableBody").append(totalHtml);
        }
        ui.tableHeightSet();
        ui.paintColor();
    }
</script>
<script type="text/x-handlebars-template" id="tmp_total">
    <tr class="font-bold _stateSumTd">
        <td>총계</td>
        <td>{{addComma sum_totalCnt}}</td>
        <td>{{addComma sum_regCnt}}</td>
        <td>{{addComma sum_no_regCnt}}</td>
        <td class="_fontColor" data-fontcolor="#ff5600">{{addComma sum_regCnt_total}}</td>

        <td>{{addComma sum_opCnt}}</td>
        <td>{{addComma sum_no_opCnt}}</td>
        <td class="_fontColor" data-fontcolor="#ff5600">{{addComma sum_opCnt_total}}</td>

        <td>{{addComma sum_nopCnt}}</td>
        <td>{{addComma sum_no_nopCnt}}</td>
        <td class="_fontColor" data-fontcolor="#ff5600">{{addComma sum_nopCnt_total}}</td>
    </tr>
</script>

<script type="text/x-handlebars-template" id="tmp_detailList">
    {{#each this as |data|}}
    <tr>
        <td class="font-bold _stateSubTh">
            {{#equal ../slctType 0}}{{data.hour}}시{{/equal}}
            {{#equal ../slctType 1}}{{data.daily}}{{/equal}}
            {{#equal ../slctType 2}}{{data.monthly}}월{{/equal}}
        </td>
        <td>{{addComma totalCnt  'Y'}}</td>
        <td>{{addComma regCnt  'Y'}}</td>
        <td>{{addComma no_regCnt  'Y'}}</td>
        <td>{{addComma regCnt_total  'Y'}}</td>

        <td>{{addComma opCnt  'Y'}}</td>
        <td>{{addComma no_opCnt  'Y'}}</td>
        <td>{{addComma opCnt_total  'Y'}}</td>

        <td>{{addComma nopCnt  'Y'}}</td>
        <td>{{addComma no_nopCnt  'Y'}}</td>
        <td>{{addComma nopCnt_total  'Y'}}</td>
    </tr>
    {{else}}
    <%--<tr>--%>
    <td colspan="11" class="noData">{{isEmptyData}}<td>
    <%--</tr>--%>
    {{/each}}
</script>