<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 현재 접속자 > 현재 접속 회원 -->
<div class="widget-table mb10">
    <div class="col-md-12 no-padding">
        <%--<div class="col-md-2 no-padding">--%>
            <%--<span name="listenUserType" id="listenUserType" onchange="listenUserType_sel_change()"></span>--%>
        <%--</div>--%>

        <table id="listenUser_tableList" class="table table-sorting table-hover table-bordered datatable">
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
    $("#listenUserType").html(util.getCommonCodeSelect(1, currentType,"Y"));

    $(function(){
        $("#selJoinDate").hide();
        getListenUserList();

    });

    var dtList_info_lisetnUser;
    function getListenUserList(){
        var dtList_data = function (data) {
            data.pageCnt = 50;
            data.searchText = $("#txt_search").val();
            data.inner = 0;
        };
        dtList_info_lisetnUser = new DalbitDataTable($("#listenUser_tableList"), dtList_data, BroadcastDataTableSource.liveListenerList);
        dtList_info_lisetnUser.setPageLength(50);
        dtList_info_lisetnUser.useCheckBox(false);
        dtList_info_lisetnUser.useIndex(true);
        dtList_info_lisetnUser.createDataTable(liveNextFunc);
    }

    function liveNextFunc(json){
        dalbitLog(json);
        // var template = $("#live_tableSummary").html();
        // var templateScript = Handlebars.compile(template);
        // var data = {
        //     content : json.summary
        //     , length : json.recordsTotal
        // };
        // var html = templateScript(data);
        // $("#live_summaryArea").html(html);

        $("#tab_liveListener").text("실시간 청취자(" + json.recordsTotal + ")");
    }

    function getListenUserList_tabClick(tmp){
        $("#selJoinDate").hide();
        liveState = tmp;
        dtList_info_lisetnUser.reload();
    }

</script>