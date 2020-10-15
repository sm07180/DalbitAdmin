<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 로그인 > 총계 -->
<div class="widget widget-table mb10">
    <div class="widget-content mt10">
        <span class="_searchDate"></span>

        <table class="table table-bordered _tableHeight" data-height="23px">
            <colgroup>
                <col width="8.3%"/><col width="8.3%"/><col width="8.3%"/><col width="8.3%"/><col width="8.3%"/>
                <col width="8.3%"/><col width="8.3%"/><col width="8.3%"/><col width="8.3%"/><col width="8.3%"/>
                <col width="8.3%"/><col width="8.3%"/><col width="8.3%"/><col width="8.3%"/><col width="8.3%"/>
            </colgroup>
            <thead>
            <tr>
                <th rowspan="2" class="_bgColor _fontColor" data-bgColor="#4472c4">구분</th>
                <th colspan="6" class="_bgColor _fontColor" data-bgColor="#b4c7e7">SNS 별</th>
                <th></th>
                <th colspan="3" class="_bgColor _fontColor" data-bgColor="#f8cbad">플랫폼 별</th>
                <th rowspan="2" class="_bgColor _fontColor" data-bgColor="#d9d9d9">총 가입 수</th>
            </tr>
            <tr>
                <th class="_bgColor" data-bgColor="#dae3f3">전화</th>
                <th class="_bgColor" data-bgColor="#dae3f3">카카오</th>
                <th class="_bgColor" data-bgColor="#dae3f3">네이버</th>
                <th class="_bgColor" data-bgColor="#dae3f3">페이스북</th>
                <th class="_bgColor" data-bgColor="#dae3f3">애플</th>
                <th class="_bgColor" data-bgColor="#dae3f3">구글</th>
                <th></th>
                <th class="_bgColor" data-bgColor="#fbe5d6">AOS</th>
                <th class="_bgColor" data-bgColor="#fbe5d6">IOS</th>
                <th class="_bgColor" data-bgColor="#fbe5d6">PC</th>
            </tr>
            </thead>
            <tbody id="timeTableBody"></tbody>
        </table>


        <table class="table table-bordered _tableHeight" data-height="23px">
            <colgroup>
                <col width="8.3%"/><col width="8.3%"/><col width="8.3%"/><col width="8.3%"/><col width="8.3%"/>
                <col width="8.3%"/><col width="8.3%"/><col width="8.3%"/><col width="8.3%"/><col width="8.3%"/>
                <col width="8.3%"/><col width="8.3%"/><col width="8.3%"/><col width="8.3%"/><col width="8.3%"/>
            </colgroup>
            <thead>
            <tr>
                <th rowspan="2" class="_bgColor _fontColor" data-bgColor="#4472c4">구분</th>
                <th colspan="6" class="_bgColor _fontColor" data-bgColor="#b4c7e7">SNS 별</th>
                <th></th>
                <th colspan="3" class="_bgColor _fontColor" data-bgColor="#f8cbad">플랫폼 별</th>
                <th rowspan="2" class="_bgColor _fontColor" data-bgColor="#d9d9d9">총 가입 수</th>
            </tr>
            <tr>
                <th class="_bgColor" data-bgColor="#dae3f3">전화</th>
                <th class="_bgColor" data-bgColor="#dae3f3">카카오</th>
                <th class="_bgColor" data-bgColor="#dae3f3">네이버</th>
                <th class="_bgColor" data-bgColor="#dae3f3">페이스북</th>
                <th class="_bgColor" data-bgColor="#dae3f3">애플</th>
                <th class="_bgColor" data-bgColor="#dae3f3">구글</th>
                <th></th>
                <th class="_bgColor" data-bgColor="#fbe5d6">AOS</th>
                <th class="_bgColor" data-bgColor="#fbe5d6">IOS</th>
                <th class="_bgColor" data-bgColor="#fbe5d6">PC</th>
            </tr>
            </thead>
            <tbody id="timeTableBody2"></tbody>
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

    });

    function getTime(){

        beforeSDate = moment($("#startDate").val()).add("months", -1).format('YYYY.MM.01');
        var data = {
            startDate: $("#startDate").val()
            , endDate: $("#endDate").val()
            , beforeStartDate: beforeSDate
            , beforeEndDate: beforeSDate
            , slctType: 0
            , slctTab: 1
        };

        util.getAjaxData("month", "/rest/enter/newjoin2/info/state", data, fn_time_success);

    }

    function fn_time_success(dst_id, response){
        dalbitLog("--------- fn_time_success ---------");
        dalbitLog(response);


        for(var i=0;i<response.data.detailList.length;i++){
            var total_join_cnt = [

                response.data.detailList[i].aos_total_join_cnt
                ,response.data.detailList[i].ios_total_join_cnt
                ,response.data.detailList[i].pc_total_join_cnt
            ];
            response.data.detailList[i].total_join_cnt = common.getListSum(total_join_cnt);
        }

        var template = $('#tmp_dummytime').html();
        var templateScript = Handlebars.compile(template);
        var context = response.data.detailList;
        var html=templateScript(context);
        $("#timeTableBody").html(html);

        // var template = $('#tmp_dummytime2').html();
        // var templateScript = Handlebars.compile(template);
        // var context = data;
        // var html=templateScript(context);
        // $("#timeTableBody2").html(html);

        ui.tableHeightSet();
        ui.paintColor();
    }

</script>


<th class="_bgColor" data-bgColor="#dae3f3">전화</th>
<th class="_bgColor" data-bgColor="#dae3f3">카카오</th>
<th class="_bgColor" data-bgColor="#dae3f3">네이버</th>
<th class="_bgColor" data-bgColor="#dae3f3">페이스북</th>
<th class="_bgColor" data-bgColor="#dae3f3">애플</th>
<th class="_bgColor" data-bgColor="#dae3f3">구글</th>
<th></th>
<th class="_bgColor" data-bgColor="#fbe5d6">AOS</th>
<th class="_bgColor" data-bgColor="#fbe5d6">IOS</th>
<th class="_bgColor" data-bgColor="#fbe5d6">PC</th>


<script type="text/x-handlebars-template" id="tmp_dummytime">
    {{#each this as |data|}}
    <tr {{#dalbit_if nowHour '==' the_hr}} class="font-bold _bgColor" data-bgColor="#fff2cc"  {{/dalbit_if}}>
        <td {{#dalbit_if nowHour '==' the_hr}} class="font-bold _bgColor" data-bgColor="#fff2cc"  {{/dalbit_if}}
        {{#dalbit_if nowHour '!=' the_hr}} class="font-bold _bgColor" data-bgColor="#d8e2f3"  {{/dalbit_if}}>
        {{data.the_hr}}시
        </td>
        <td>{{phone_join_cnt}}</td>
        <td>{{kakao_join_cnt}}</td>
        <td>{{naver_join_cnt}}</td>
        <td>{{fbook_join_cnt}}</td>
        <td>{{apple_join_cnt}}</td>
        <td>{{google_join_cnt}}</td>
        <td></td>
        <td>{{aos_total_join_cnt}}</td>
        <td>{{ios_total_join_cnt}}</td>
        <td>{{pc_total_join_cnt}}</td>
        <td>{{total_join_cnt}}</td>
    </tr>
    {{else}}
    <tr>
        <td colspan="12" class="noData">{{isEmptyData}}<td>
    </tr>
    {{/each}}
</script>


<%--<script type="text/x-handlebars-template" id="tmp_dummytime">--%>
    <%--{{#each this.slctType_date}}--%>
    <%--<tr class="_tr_{{this}}">--%>
        <%--<td class="font-bold">{{this}}</td>--%>
        <%--<td style="color: blue;background-color: #dae3f3"></td><td></td><td style="color: blue;background-color: #dae3f3"></td><td></td><td style="color: blue;background-color: #dae3f3"></td><td></td>--%>
        <%--<td style="color: blue;background-color: #dae3f3"></td><td></td><td style="color: blue;background-color: #dae3f3"></td><td></td><td style="color: blue;background-color: #dae3f3"></td><td></td>--%>
        <%--<td style="color: red;background-color: #dae3f3"></td><td></td><td style="color: red;background-color: #dae3f3"></td><td></td><td style="color: red;background-color: #dae3f3"></td><td></td>--%>
        <%--<td style="color: red;background-color: #dae3f3"></td><td></td><td style="color: red;background-color: #dae3f3"></td><td></td><td style="color: red;background-color: #dae3f3"></td><td></td>--%>
        <%--<td style="background-color: #dae3f3"></td><td></td><td style="background-color: #dae3f3"></td><td></td><td style="background-color: #dae3f3"></td><td></td>--%>
        <%--<td style="background-color: #dae3f3"></td><td></td><td style="background-color: #dae3f3"></td><td></td><td style="background-color: #dae3f3"></td><td></td>--%>
    <%--</tr>--%>
    <%--{{/each}}--%>
    <%--<tr class="_tr_{{this}} font-bold" style="color: #ff5600;background-color: #f2f2f2">--%>
        <%--<td>총합</td>--%>
        <%--<td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td>--%>
        <%--<td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td>--%>
        <%--<td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td>--%>
    <%--</tr>--%>
<%--</script>--%>

<script type="text/x-handlebars-template" id="tmp_dummytime2">
    <tr class="_tr_{{this}} font-bold" style="background-color: #dae3f3">
        <td>총계</td>
        <td colspan="36">0</td>
    </tr>
    <tr class="_tr_{{this}} font-bold" style="color: #ff5600;background-color: #f2f2f2">
        <td>총합</td>
        <td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td>
        <td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td>
        <td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td>
    </tr>
    {{#each this.slctType_date}}
    <tr class="_tr_{{this}}">
        <td class="font-bold"  style="background-color: #dae3f3">{{this}}</td>
        <td style="color: blue;background-color: #dae3f3"></td><td></td><td style="color: blue;background-color: #dae3f3""></td><td></td><td style="color: blue;background-color: #dae3f3""></td><td></td>
        <td style="color: blue;background-color: #dae3f3"></td><td></td><td style="color: blue;background-color: #dae3f3"></td><td></td><td style="color: blue;background-color: #dae3f3"></td><td></td>
        <td style="color: red;background-color: #dae3f3"></td><td></td><td style="color: red;background-color: #dae3f3"></td><td></td><td style="color: red;background-color: #dae3f3"></td><td></td>
        <td style="color: red;background-color: #dae3f3"></td><td></td><td style="color: red;background-color: #dae3f3"></td><td></td><td style="color: red;background-color: #dae3f3"></td><td></td>
        <td style="background-color: #dae3f3"></td><td></td><td style="background-color: #dae3f3"></td><td></td><td style="background-color: #dae3f3"></td><td></td>
        <td style="background-color: #dae3f3"></td><td></td><td style="background-color: #dae3f3"></td><td></td><td style="background-color: #dae3f3"></td><td></td>
    </tr>
    {{/each}}
    <tr class="_tr_{{this}} font-bold" style="color: #ff5600;background-color: #f2f2f2">
        <td>소계</td>
        <td colspan="2">0</td><td colspan="2">0</td><td colspan="2">0</td><td colspan="2">0</td><td colspan="2">0</td><td colspan="2">0</td>
        <td colspan="2">0</td><td colspan="2">0</td><td colspan="2">0</td><td colspan="2">0</td><td colspan="2">0</td><td colspan="2">0</td>
        <td colspan="2">0</td><td colspan="2">0</td><td colspan="2">0</td><td colspan="2">0</td><td colspan="2">0</td><td colspan="2">0</td>
    </tr>
    <tr class="_tr_{{this}} font-bold" style="background-color: #dae3f3">
        <td>총계</td>
        <td colspan="36">0</td>
    </tr>
</script>