<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 현재 접속자 > 현재 접속 회원 -->
<div class="widget-table mb10">
    <div class="col-md-12 no-padding">
        <%--<div class="col-md-2 no-padding">--%>
            <%--<span name="loginUserType" id="loginUserType" onchange="loginUserType_sel_change()"></span>--%>
        <%--</div>--%>

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
        dtList_info_loginUser = new DalbitDataTable($("#loginUser_tableList"), dtList_data, connectDataTableSource.current);
        dtList_info_loginUser.setPageLength(50);
        dtList_info_loginUser.useCheckBox(false);
        dtList_info_loginUser.useIndex(true);
        dtList_info_loginUser.createDataTable(loginNextFunc);
    }
    function loginNextFunc(json){
        dalbitLog(json);
        // var template = $("#live_tableSummary").html();
        // var templateScript = Handlebars.compile(template);
        // var data = {
        //     content : json.summary
        //     , length : json.recordsTotal
        // };
        // var html = templateScript(data);
        // $("#live_summaryArea").html(html);

        $("#tab_LoginUser").text("방송 외 접속 회원(" + json.recordsTotal + ")");
    }

    function getLoginUserList_tabClick(tmp){
        $("#selJoinDate").hide();
        liveState = tmp;
        dtList_info_loginUser.reload();
    }

</script>