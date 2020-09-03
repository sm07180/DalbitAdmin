<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 현재 접속자 > 현재 접속 회원 -->
<div class="widget-table mb10">
    <div class="col-md-12 no-padding">
        <div class="col-md-4 no-padding pull-right">
            <span id="login_summaryArea"></span>
        </div>

        <table id="loginUser_tableList" class="table table-sorting table-hover table-bordered datatable">
            <thead id="tableTop_detail">
            </thead>
            <tbody id="tableBody_detail">
            </tbody>
        </table>
    </div>
    </span>
    <div class="widget-footer">
        <span>
            <%--<button class="btn btn-default print-btn pull-right" type="button" id="excelDownBtn"><i class="fa fa-print"></i>Excel Down</button>--%>
        </span>
    </div>
</div>

<script type="text/javascript" src="/js/code/connect/connectCodeList.js?${dummyData}"></script>
<script type="text/javascript">
    $("#loginUserType").html(util.getCommonCodeSelect(1, currentType,"Y"));

    $(function(){
        getLoginUserList();

    });

    var dtList_info_loginUser;
    var slctType = 1;
    function getLoginUserList(tmp){
        var dtList_data = function (data) {
            data.slctType = slctType;
            data.pageCnt = 20;
            data.searchText = $("#txt_search").val();
            data.inner = 0;
            data.broad = 0;
        };
        dtList_info_loginUser = new DalbitDataTable($("#loginUser_tableList"), dtList_data, BroadcastDataTableSource.loginUser);
        dtList_info_loginUser.setPageLength(50);
        dtList_info_loginUser.useCheckBox(false);
        dtList_info_loginUser.useIndex(true);
        dtList_info_loginUser.createDataTable(loginNextFunc);
    }
    function loginNextFunc(json){
        $("#tab_LoginUser").text("방송 외 접속 회원(" + json.recordsTotal + ")");


        var data = {
            inner : 1
        };

        util.getAjaxData("currentLiveSummary", "/rest/connect/user/info/current/live/summary", data, currentLiveSummary_success);
    }

    function currentLiveSummary_success(dst_id, response){
        console.log(response);

        var template = $("#loginUser_tableSummary").html();
        var templateScript = Handlebars.compile(template);
        var data = {
            content : response.data
        };
        var html = templateScript(data);
        $("#login_summaryArea").html(html);
    }

    function getLoginUserList_tabClick(tmp){
        $("#selJoinDate").hide();
        liveState = tmp;
        dtList_info_loginUser.reload(loginNextFunc);
    }

</script>


<script id="loginUser_tableSummary" type="text/x-handlebars-template">
    <table class="table table-bordered table-summary pull-right no-margin" style="width: 80%">
        <tr>
            <th colspan="6" style="background-color: #2f5597;color: white">방송방 외 접속회원</th>
        </tr>
        <tr>
            <th colspan="3" style="background-color: #d9d9d9;color: black">플랫폼</th>
            <th colspan="3" style="background-color: #d9d9d9;color: black">성별</th>
        </tr>
        <tr>
            <td style="background-color: #dae3f3" class="font-bold">Android</td>
            <td style="background-color: #dae3f3" class="font-bold">IOS</td>
            <td style="background-color: #dae3f3" class="font-bold">PC</td>
            <td style="background-color: #dae3f3">{{{sexIcon 'm'}}}</td>
            <td style="background-color: #dae3f3">{{{sexIcon 'f'}}}</td>
            <td style="background-color: #dae3f3">{{{sexIcon 'n'}}}</td>
        </tr>
        <tr>
            <td>{{addComma content.aosCnt}}</td>
            <td>{{addComma content.iosCnt}}</td>
            <td>{{addComma content.pcCnt}}</td>
            <td>{{addComma content.maleCnt}}</td>
            <td>{{addComma content.femaleCnt}}</td>
            <td>{{addComma content.noneCnt}}</td>
        </tr>
        <tr>
            <td colspan="6" class="font-bold" style="background-color: #7f7f7f;color: white">총 수 {{addComma content.totalCnt}}</td>
        </tr>
    </table>
</script>