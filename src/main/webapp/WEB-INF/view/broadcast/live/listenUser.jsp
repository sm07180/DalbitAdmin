<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 현재 접속자 > 현재 접속 회원 -->
<div class="widget-table mb10">
    <div class="col-md-12 no-padding">
        <div class="col-md-2 no-padding">
            <span name="listenUserType" id="listenUserType" onchange="listenUserType_sel_change()"></span>
        </div>
        <div class="col-md-4 no-padding pull-right">
            <span id="live_summaryArea2"></span>
        </div>
        <div class="col-md-3 no-padding pull-right">
            <span id="liveListener_summaryArea"></span>
        </div>
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

<script type="text/javascript" src="/js/code/broadcast/broadCodeList.js?${dummyData}"></script>
<script type="text/javascript">
    $("#listenUserType").html(util.getCommonCodeSelect(0, liveListenSort));

    $(function(){
        $("#selJoinDate").hide();
        getListenUserList();

    });

    var dtList_info_lisetnUser;
    function getListenUserList(){
        var dtList_data = function (data) {
            data.pageCnt = 50;
            data.searchText = $("#txt_search").val();
            data.sortState = $("select[name='liveListenSort']").val();
            data.inner = 0;
        };
        dtList_info_lisetnUser = new DalbitDataTable($("#listenUser_tableList"), dtList_data, BroadcastDataTableSource.liveListenerList);
        dtList_info_lisetnUser.setPageLength(50);
        dtList_info_lisetnUser.useCheckBox(false);
        dtList_info_lisetnUser.useIndex(true);
        dtList_info_lisetnUser.createDataTable(liveNextFunc);
    }

    function liveNextFunc(json){
        var template = $("#liveListener_tableSummary").html();
        var templateScript = Handlebars.compile(template);
        var data = {
            content : json.summary
            , length : json.recordsTotal
        };
        var html = templateScript(data);
        $("#liveListener_summaryArea").html(html);

        $("#tab_liveListener").text("실시간 청취자(" + json.recordsTotal + ")");

        var data = {};
        data.slctType = 1;
        data.dj_slctType = 0;
        data.dj_searchText = $('#txt_search').val();
        data.room_slctType = -1;
        data.room_searchText = "";
        data.ortStartDate =2;
        data.room_liveType = 1;
        data.startDate = sDate;

        util.getAjaxData("broadlive", "/rest/broadcast/broadcast/list", data, fn_success_live_summary);
    }

    function getListenUserList_tabClick(tmp){
        $("#selJoinDate").hide();
        liveState = tmp;
        dtList_info_lisetnUser.reload(liveNextFunc);
    }
    function listenUserType_sel_change(){
        dtList_info_lisetnUser.reload(liveNextFunc);
    }

    function fn_success_live_summary(dst_id,response){
        var template = $("#live_tableSummary2").html();
        var templateScript = Handlebars.compile(template);
        var data = {
            content : response.summary
            , length : response.recordsTotal
        };
        var html = templateScript(data);
        $("#live_summaryArea2").html(html);
    }

    function liveListenForced(index){
        var data = dtList_info_lisetnUser.getDataRow(index);
        if(confirm(data.nickNm + "님을 강제 퇴장 하시겠습니까?")){
            var obj = {};
            obj.mem_no = data.memNo;
            obj.room_no = data.roomNo;
            obj.mem_nickName = data.nickNm;
            obj.roomBlock = "N";
            obj.NotificationYn = "N";
            obj.NotiMemo = "청취 강제 퇴장";
            obj.forced = "exit";

            util.getAjaxData("forceLeave", "/rest/broadcast/listener/forceLeave", obj, liveListenForced_success);

        }else{ return false ;}

    }

    function liveListenNotice(index){
        var data = dtList_info_lisetnUser.getDataRow(index);
        tmp = "/broadcast/live/popup/noticeSendPopup?memNo=" + data.memNo + "&memNick=" + data.nickNm;
        util.windowOpen(tmp,"750","320","회원 메시지발송");


        // if(confirm(data.nickNm + "에게 알림을 보내시겠습니까?")){
        //     var obj = {};
        //     obj.image_type = "101";
        //     obj.is_all = "7";
        //     obj.is_direct = "0";
        //     obj.mem_nos = data.memNo;
        //     obj.platform =  "111";
        //     obj.push_idx = "";
        //     obj.send_cnt = 1;
        //     obj.send_cont = "[내부개발] 운영자가 선물을 보냈습니다.";
        //     obj.send_datetime = "202009020000";
        //     obj.send_title = "[내부개발] 테스트 입니다";
        //     obj.send_type = "01";
        //     obj.slct_push = "2";
        //     obj.send_datetime = "202009020000";
        //     obj.status = 0;
        //     obj.target_mem_no = "10000000000001";
        //     obj.timeHour = "00";
        //     obj.timeMinute = "00";
        //     obj.msg_type = 0;
        //
        //     util.getAjaxData("insert", "/rest/content/push/insert", obj, fn_notice_add_success);
        // }else{ return false ;}
    }

    function liveListenForced_success(dst_id, response){
        dalbitLog(response);
        dtList_info_lisetnUser.reload(liveNextFunc);
    }
    function fn_notice_add_success(dst_id, response){
        dalbitLog(response);
    }

</script>


<script id="liveListener_tableSummary" type="text/x-handlebars-template">
    <table class="table table-bordered table-summary pull-right no-margin" style="width: 80%">
        <tr>
            <th colspan="6" style="background-color: #2f5597;color: white">청취자</th>
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
            <td colspan="6" class="font-bold" style="background-color: #7f7f7f;color: white">{{addComma content.totalCnt}}</td>
        </tr>
    </table>
</script>

<script id="live_tableSummary2" type="text/x-handlebars-template">
    <table class="table table-bordered table-summary pull-right no-margin" style="width: 100%">
        <tr>
            <th colspan="8" style="background-color: #bf9000;color: white">방송방</th>
        </tr>
        <tr>
            <th colspan="3" style="background-color: #fff2cc;">플랫폼</th>
            <th colspan="2" style="background-color: #fff2cc;">DJ구분</th>
            <th colspan="3" style="background-color: #fff2cc;">DJ성별</th>
        </tr>
        <tr>
            <th style="background-color: #f2f2f2;">Android</th>
            <th style="background-color: #f2f2f2;">IOS</th>
            <th style="background-color: #f2f2f2;">PC</th>
            <th style="background-color: #fee599;">일반(스페셜DJ)</th>
            <th style="background-color: #fee599;">신입</th>
            <th style="background-color: #f2f2f2;">{{{sexIcon 'm'}}}</th>
            <th style="background-color: #f2f2f2;">{{{sexIcon 'f'}}}</th>
            <th style="background-color: #f2f2f2;">{{{sexIcon 'n'}}}</th>
        </tr>
        <tr>
            <td>{{#equal length '0'}}0{{/equal}}{{content.totalAosCnt}}</td>
            <td>{{#equal length '0'}}0{{/equal}}{{content.totalIosCnt}}</td>
            <td>{{#equal length '0'}}0{{/equal}}{{content.totalPcCnt}}</td>
            <td>{{#equal length '0'}}0{{/equal}}{{content.normalDjCnt}} ({{content.specialDjCnt}})</td>
            <td>{{#equal length '0'}}0{{/equal}}{{content.newDjCnt}}명</td>
            <td>{{content.broadMaleCnt}}</td>
            <td>{{content.broadFemaleCnt}}</td>
            <td>{{content.broadNoneCnt}}</td>
        </tr>
        <tr>
            <td class="font-bold" style="background-color: #d8d8d8;" colspan="3">총 수(방송중/끊김)</td>
            <td class="font-bold" style="background-color: #d8d8d8; color: #ed7d31" colspan="5">{{content.totalBroadCastCnt}} ({{content.broadStateNomal}}/{{content.broadBreak}})</td>
        </tr>
    </table>
</script>