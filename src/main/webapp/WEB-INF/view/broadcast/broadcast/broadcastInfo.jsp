<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authentication var="principal" property="principal" />

<div>
    <form id="broadcast_detailFrm"></form>
    <form id="editHistFrm" class="hide"></form>
</div>

<!-- 이미지 원본 보기 -->
<div id="imageFullSize"></div>

<!-- 입장제한, 얼리기, 방송강제종료 Modal -->
<div class="modal fade" id="entryModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 600px;display: table;">
        <div class="modal-content">
            <div class="modal-header">
                <lable>운영자에 의한 변경 사유를 선택하여 주세요</lable>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body">
                <span id="broadCast_Message"></span>
                <input type="text" id="entry_message" class="form-control"/>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" id="bt_modalEntry"><i class="fa fa-times-circle"></i> 확인</button>
                <button type="button" class="btn btn-custom-primary" id="bt_modalEntryNotice"><i class="fa fa-check-circle"></i> 확인+메시지 발송</button>
            </div>
        </div>
    </div>
</div>
<!-- Modal 끝 -->

<script type="text/javascript" src="/js/code/broadcast/broadCodeList.js?${dummyData}"></script>

<script type="text/javascript">
    $(document).ready(function() {
        $('input[id="txt_search"]').keydown(function() {
            if (event.keyCode === 13) {
                getSearch();
            };
        });
        $('input[id="txt_broad"]').keydown(function() {
            if (event.keyCode === 13) {
                getSearch();
            };
        });

        $("#bt_modalEntry").on("click", function () {             //입장제한변경 팝업 알림X
            entry(this.id);
        });
        $("#bt_modalEntryNotice").on("click", function () {    //입장제한변경 팝업 알림O
            entry(this.id);
        });
    });

    $("#subjectType").html(util.getCommonCodeSelect(1, subject_type, "Y"));
    $("#dj_memSex").html(util.getCommonCodeRadio(2, gender, "Y"));
    $("#entryType").html(util.getCommonCodeRadio(-1, entryType));
    $("#freezeMsg").html(util.getCommonCodeRadio(1, freezing));
    $("#forcedQuit").html(util.getCommonCodeRadio(1, forcedExit));

    function getBroadCast_info_popup(tmp){
        var obj = new Object();
        obj.room_no = tmp;
        util.getAjaxData("type", "/rest/broadcast/broadcast/info", obj, info_sel_success);
    }

    var room_no;
    var mem_no;
    var dj_nickname;
    var detailData;
    var broadCast_responseData
    function info_sel_success(dst_id, response, param) {
        dalbitLog(response);
        broadCast_responseData = response.data;
        $('#detailFrm').addClass("hid");
        room_no = param.room_no;
        response.data.room_no = param.room_no;
        detailData = response.data;
        mem_no = response.data.dj_mem_no;
        dj_nickname = detailData.dj_nickName;

        if(response.data.dj_memSex == "m")        response.data["dj_memSex"] = "2";
        else if(response.data.dj_memSex == "f")  response.data["dj_memSex"] = "3";
        else                                      response.data["dj_memSex"] = "4";

        if(response.data.broadcastState == "ON")
            response.data["icon_broadcastState"] = '<i class="fa fa-circle" style="color: #ff0000;font-size:20px;"></i> ' + response.data.broadcastState;
        else
            response.data["icon_broadcastState"] = '<i class="fa fa-circle" style="color: #000000;font-size:20px;"></i> ' + response.data.broadcastState;

        if(response.data.micState == "ON")
            response.data["icon_micState"] = '<i class="fa fa-microphone" style="color: #a037d9;font-size:20px;"></i> ' + response.data.micState;
        else
            response.data["icon_micState"] = '<i class="fa fa-microphone-slash" style="color: #000000;font-size:20px;"></i> ' + response.data.micState;

        if(response.data.guestState == "NO")
            response.data["icon_guestState"] = response.data.guestState;
        else
            response.data["icon_guestState"] = '<i class="fa fa-user" style="color: #a037d9;font-size:20px;"></i> ' + response.data.guestState + " / " + response.data.guest_userId;


        if(response.data.broadcastState == "ON"){
            response.data["freezing"] = util.getCommonCodeRadio(response.data.freezeMsg, freezing);
            response.data["forcedExit"] = util.getCommonCodeRadio(response.data.forcedQuit, forcedExit);
        }else{
            response.data["freezing"] = "방송종료";
            response.data["forcedExit"] = "방송종료";
        }
        dalbitLog(response);
        var template = $('#tmp_broadcast_detailFrm').html();
        var templateScript = Handlebars.compile(template);
        var context = response.data;
        var html=templateScript(context);
        $("#broadcast_detailFrm").html(html);
        btn_init();
        $("#tablist_con").find('.active').find('a').click();
        if(editEntry != "adminMemoAdd" ){
            $("#editHistFrm").removeClass("show");
        }

        var scrollPosition = $("#tabList_top").offset();
        util.scrollPostion(scrollPosition.top);

    }

    function btn_init(){
        // 버튼 시작
        $('#bt_img').click(function() {                     // 배경이미지 초기화
            bt_click(this.id);
        });
        $('#bt_freezing').click(function() {                // 얼리기 변경
            bt_click(this.id);
        });
        $('#bt_forcedExit').click(function() {              // 방 강제종료
            bt_click(this.id);
        });
        $('#bt_msgWelcom').click(function() {               // 환영메시지 삭제
            bt_click(this.id);
        });
        $('#bt_title').click(function() {                   // 방송제목 변경
            bt_click(this.id);
        });
        $('#bt_adminMemo').click(function() {               // 운영자메모 변경
            bt_click(this.id);
        });

        $('#bt_adminMemoList').click(function() {          // 운영자메모 자세히보기
            getInfoDetail(this.id,"운영자 메모");
        });
        $('#bt_editDate').click(function() {               // 정보수정내역
            getInfoDetail(this.id);
        });

        $('#bt_editHistory').click(function() {
            getInfoDetail(this.id,"정보수정내역");
        });
        // 버튼 끝
    }

    function fullSize_background(url) {     // 이미지 full size
        $("#imageFullSize").html(util.imageFullSize("fullSize_background",url));
        $('#fullSize_background').modal('show');
    }
    function modal_close(){
        $("#fullSize_background").modal('hide');
    }

    function getInfoDetail(tmp, tmp1) {
        var buttonId = tmp;
        var template = $('#tmp_editHistFrm').html();
        var templateScript = Handlebars.compile(template);
        $("#editHistFrm").html(templateScript);
        $('#tab_memberInfoDetail').text(tmp1);           //텝 이름 변경
        $("#editHistFrm").addClass("show");

        if(tmp.indexOf("_") > 0){
            tmp = tmp.split("_");
            tmp = tmp[1];
        }
        var source = BroadcastDataTableSource[tmp];
        var dtList_info_detail_data = function (data) {
            data.room_no = room_no;
            data.mem_no = room_no;
        }

        dtList_info_detail = new DalbitDataTable($("#info_detail"), dtList_info_detail_data, source);
        dtList_info_detail.useCheckBox(false);
        dtList_info_detail.useIndex(true);
        dtList_info_detail.createDataTable();
        dtList_info_detail.reload();
    }

    var editEntry;
    function bt_click(tmp) {
        var obj = new Object();
        obj.room_no = room_no;
        obj.mem_no = mem_no;
        obj.backgroundImage = "";
        obj.forceExit = $('input:radio[name="forcedExit"]:checked').val();
        obj.freezeMsg = $('input:radio[name="freezing"]:checked').val();
        obj.forceExit = 0;

        if(tmp == "bt_adminMemo") {            //운영자 메모 변경
            if ($("#txt_adminMemo").val() == "" || $("#txt_adminMemo").val() == null) {
                alert("등록할 운영자 메모를 입력해 주십시오.");
                return;
            }
            var obj = new Object();
            obj.mem_no = room_no;
            obj.memo = $("#txt_adminMemo").val();

            getInfoDetail("bt_adminMemoList", "운영자메모");
            util.getAjaxData("adminMemoAdd", "/rest/member/member/adminMemoAdd", obj, update_success, fn_fail);
        }else {
            if (tmp == "bt_img") {
                if(broadCast_responseData.backgroundImage.indexOf("/bg_3/roombg") > -1){
                   alert("이미 기본 배경이미지 입니다.");
                   return;
                }
                if (confirm('배경 이미지를 초기화하시겠습니까?')) {
                    obj.backgroundImage = "backImageDel";
                } else return;
            } else if (tmp == "bt_msgWelcom") {
                if (broadCast_responseData.welcomeMsg == "환영합니다!! 여기는 " + detailData.dj_nickName + " 님의 방송방입니다.") {
                    alert("이미 초기화된 환영 메시지입니다.");
                    return;
                } else {
                    if (confirm('초기화하시겠습니까?')) {
                        obj.welcomMsg = "환영합니다!! 여기는 " + detailData.dj_nickName + " 님의 방송방입니다.";
                    } else return;
                }
            } else if (tmp == "bt_title") {
                console.log();
                if (broadCast_responseData.title == detailData.dj_nickName + " 님의 방송입니다.") {
                    alert("이미 초기화된 방송 제목입니다.");
                    return;
                } else {
                    if (confirm('초기화하시겠습니까?')) {
                        obj.title = detailData.dj_nickName + " 님의 방송입니다.";
                    } else return;
                }
            } else if (tmp == "bt_freezing") {
                editEntry = tmp;
                $("#broadCast_Message").html(util.getCommonCodeCheck(-1, freezeMsg_Message, "Y"));
                $('#entryModal').modal('show');
                return;
            } else if (tmp == "bt_forcedExit") {
                editEntry = tmp;
                if ($('input:radio[name="forcedExit"]:checked').val() != 1) {
                    alert("방송 강제종료 여부를 선택하여 주십시오.");
                    return;
                }
                $("#broadCast_Message").html(util.getCommonCodeCheck(-1, forceExit_Message, "Y"));
                $('#entryModal').modal('show');
                return;
            }
            obj.notiContents = broadCastMessage.notiContents;
            obj.sendNoti = "1";
            obj.subjectType = broadCast_responseData.subjectType;
            obj.beforBackgroundImage = broadCast_responseData.backgroundImage;

            util.getAjaxData("edit", "/rest/broadcast/broadcast/edit", obj, update_success, fn_fail);
        }
    }

    function entry(tmp){
        var sendNoti;
        if(tmp == "bt_modalEntry") {    // 강제퇴장 알림X
            sendNoti = 0;
        }else if(tmp == "bt_modalEntryNotice"){      // 강제퇴장 알림O
            sendNoti = 1;
        }

        var entryMessage="";

        var messageCheck = false;
        $('input:checkbox[name="entry_message"]').each(function() {
            if(this.checked){           //checked 처리된 항목의 값
                if(this.id == "entry_message99" ){
                    entryMessage = entryMessage + " - " + this.value + " : " + $("#entry_message").val() + "\n";
                }else {
                    entryMessage = entryMessage + " - " + this.value + "\n";
                }
            }
        });
        if($("#entry_message99").prop('checked')){
            if($("#entry_message").val().length < 1){
                alert("기타 사유를 입력해 주십시오.");
                return false;
            }
        }

        var tmp_msg;
        if(entryMessage == "" && editEntry == "bt_forcedExit"){
            alert("방송 강제종료 사유를 선택해 주십시오.");
            return;
        }else if(entryMessage == "" && editEntry == "bt_freezing") {
            alert("방송 얼리기 변경 조치 사유를 선택해 주십시오.");
            return;
        }

        if(editEntry == "bt_freezing"){

            alert("준비중입니다.");
            return;
            // tmp_msg = "방송방을 얼리시겠습니까?";
        }else if(editEntry == "bt_forcedExit"){
            tmp_msg = "방송을 강제종료 하시겠습니까?";
        }
        if (confirm(tmp_msg)) {
            var date = new Date();
            var timestamp = date.getFullYear() + "-" +
                common.lpad(date.getMonth() + 1,2,"0") + "-" +
                common.lpad(date.getDate(),2,"0") + " " +
                common.lpad(date.getHours(),2,"0") + "." +
                common.lpad(date.getMinutes(),2,"0") + "." +
                common.lpad(date.getSeconds(),2,"0");

            var memo;
            var title;
            if(editEntry == "bt_forcedExit"){
                memo = broadCastMessage.forceExit;
                title = broadCastMessage.forceExitTitle;
            }else if(editEntry == "bt_freezing"){
                memo = broadCastMessage.freezing;
                title = broadCastMessage.freezingTitle;
            }
            memo = broadCastMessage.forceExitMsg;
                // memo.replace("{{name}}",ADMIN_NICKNAME)
                // .replace("{{nickName}}",detailData.dj_nickName)
                // .replace("{{message}}",entryMessage)
                // .replace("{{timestamp}}",timestamp);

            // console.log(memo);

            var obj = new Object();
            obj.room_no = room_no;
            obj.backgroundImage = "";
            obj.notiMemo = memo;
            obj.sendNoti = sendNoti;
            obj.notiContents = title;
            obj.forceExit = $('input:radio[name="forcedExit"]:checked').val();
            obj.freezeMsg = $('input:radio[name="freezing"]:checked').val();
            console.log(mem_no);
            obj.mem_no = mem_no;

            util.getAjaxData("edit", "/rest/broadcast/broadcast/edit", obj, update_success, fn_fail);
        }else{
            return;
        }
    }

    function update_success(dst_id, response) {
        dalbitLog(response);
        $('#entryModal').modal('hide');
        $('#entry_message').val("");

        if (dst_id == "adminMemoAdd") {
            editEntry = dst_id;
            dtList_info_detail.reload();
            var obj = new Object();
            obj.room_no = room_no;
            util.getAjaxData("type", "/rest/broadcast/broadcast/info",obj, info_sel_success);
        }else{
            var obj = new Object();
            obj.room_no = room_no;
            util.getAjaxData("type", "/rest/broadcast/broadcast/info", obj, info_sel_success);
            getInfoDetail("editHistory", "정보수정내역");
        }
        // $("#broadcast_detailFrm").empty();
    }

    function fn_fail(data, textStatus, jqXHR){
        console.log(data, textStatus, jqXHR);
        alert('정보 변경에 실패하였습니다');
    }
</script>

<script id="tmp_broadcast_detailFrm" type="text/x-handlebars-template">
    <div class="col-lg-12 no-padding">
        <label style="height: 30px;"> ㆍ라이브 중인 방송 정보를 확인하고, 부득이한 상황시 방송 컨트롤 할 수 있습니다.</label>
        {{#equal broadcastState 'ON'}}<button type="button" id="bt_broadcastGo" class="btn btn-default btn-sm pull-right _openPlayerPop" data-roomno="{{../room_no}}" >방송방 입장하기</button>{{/equal}}
        <button type="button" class="btn btn-danger btn-sm pull-right _openAdminMessagePop mr5" data-roomno="{{room_no}}" data-djmemno="{{dj_mem_no}}">방송방 메시지 발송</button>
    </div>
    <table class="table table-bordered table-dalbit" style="margin-bottom: 0px;">
        <colgroup>
            <col width="10%"/><col width="40%"/><col width="10%"/><col width="40%"/>
        </colgroup>
        <tbody>
        <tr>
            <th rowspan="4">배경 이미지</th>
            <td rowspan="4">
                <form id="profileImg" method="post" enctype="multipart/form-data">
                    <img id="image_section" class="thumbnail" src="{{renderImage backgroundImage}}" alt="your image" style="width: 134px;height: 134px" onclick="fullSize_background(this.src);"/>
                </form>
                {{#equal broadcastState 'ON'}}<button type="button" id="bt_img" class="btn btn-default btn-sm pull-right" data-memno="{{mem_no}}">초기화</button>{{/equal}}
            </td>
        <tr>
            <th>입장제한</th>
            <td style="text-align: left">
                {{{getCommonCodeLabel entryType 'entryType'}}}
            </td>
        </tr>
        <tr>
            <th>얼리기</th>
            <td style="text-align: left">
                {{{freezing}}}
                {{#equal broadcastState 'ON'}}<button type="button" id="bt_freezing" class="btn btn-default btn-sm pull-right">변경</button>{{/equal}}
            </td>
        </tr>
        <tr>
            <th>방송강제종료</th>
            <td style="text-align: left">
                나가기 시도 횟수 : {{{fontColor exitTryCount 1 'red'}}}번<br />
                {{{forcedExit}}}
                {{#equal broadcastState 'ON'}}<button type="button" id="bt_forcedExit" class="btn btn-default btn-sm pull-right">변경</button>{{/equal}}
            </td>
        </tr>
        <tr>
            <th rowspan="3">환영 인사말</th>
            <td rowspan="3" style="text-align: left">
                <label id="welcomeMsg" style="width: 80%;height: auto; resize:none;">{{{replaceEnter welcomeMsg}}}</label>
                {{#equal broadcastState 'ON'}}<button type="button" id="bt_msgWelcom" class="btn btn-default btn-sm pull-right">초기화</button>{{/equal}}
            </td>
            <th>방송상태</th>
            <td style="text-align: left">{{{icon_broadcastState}}}</td>
        </tr>
        <tr>
            <th>마이크</th>
            <td style="text-align: left">{{{icon_micState}}}</td>
        </tr>
        <tr>
            <th>게스트 / 게스트 ID</th>
            <td style="text-align: left">{{{icon_guestState}}}
        </tr>
        </tr>
        <tr>
            <th>방송 주제</th>
            <td style="text-align: left">{{{getCommonCodeLabel subjectType 'subject_type'}}}</td>
            <th>매니저</th>
            <td style="text-align: left">{{managerCnt}} 명</td>
        </tr>
        <tr>
            <th>방송 제목</th>
            <td style="text-align: left">
                <label id="title" style="width: 70%;">{{title}}</label>
                {{#equal broadcastState 'ON'}}<button type="button" id="bt_title" class="btn btn-default btn-sm pull-right">초기화</button>{{/equal}}
            </td>
            <th>방송 중 강제퇴장</th>
            <td style="text-align: left">{{forcedLeaveCnt}} 명</td>
        </tr>
        <tr>
            <th>DJ 회원번호</th>
            <td style="text-align: left">{{dj_mem_no}}</td>
            <th>방송 플랫폼</th>
            <td style="text-align: left">{{{getCommonCodeLabel osType 'os_type'}}}</td>
        </tr>
        <tr>
            <th>DJ ID</th>
            <td style="text-align: left">
                {{dj_userId}}
                {{#equal dj_userId ''}}-{{/equal}}
            </td>
            <th>방송 시작일</th>
            <td style="text-align: left">{{startDate}}</td>
        </tr>
        <tr>
            <th>DJ 닉네임</th>
            <td style="text-align: left">
                {{dj_nickName}}
                {{#equal dj_nickName ''}}-{{/equal}}
            </td>
            <th>방송 종료일시</th>
            <td style="text-align: left">
                {{endDate}}
                {{#equal endDate ''}}-{{/equal}}
            </td>
        </tr>
        <tr>
            <th>성별</th>
            <td style="text-align: left">
                {{{getCommonCodeLabel dj_memSex 'gender'}}}
            </td>
            <th>방송 진행시간</th>
            <td style="text-align: left">
                {{timeStamp airTime}}
            </td>
        </tr>
        <tr>
            <th rowspan="2">운영자메모</th>
            <td rowspan="1" style="text-align: left">
                등록 : {{opMemoCnt}} 건
                <button type="button" id="bt_adminMemoList" class="btn btn-default btn-sm pull-right" data-memno="{{mem_no}}">자세히</button>
            </td>
            <th>방송 정보<br/>수정일시</th>
            <td style="text-align: left">
                {{lastOpDate}}
                {{#equal lastOpDate ''}}-{{/equal}}
            </td>
        </tr>
        <tr>
            <td style="text-align: left">
                <textarea type="textarea" class="form-control" id="txt_adminMemo" style="width: 90%;height: 90px"></textarea>
                <button type="button" id="bt_adminMemo" class="btn btn-default btn-sm pull-right">등록</button>
            </td>
            <th>방송 정보<br/>수정 처리자</th>
            <td style="text-align: left">
                {{lastOpName}}
                {{#equal lastOpName ''}}-{{/equal}}
                <button type="button" id="bt_editHistory" class="btn btn-default btn-sm pull-right" data-roomno="{{room_no}}">자세히</button>
            </td>
        </tr>
        </tbody>
    </table>
</script>

<script id="tmp_editHistFrm" type="text/x-handlebars-template">
    <div class="widget-content mt5">
        <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist">
            <li class="active" id="detail1"><a href="#memberInfoDetail" role="tab" data-toggle="tab" id="tab_memberInfoDetail"></a></li>
            <li class="hide" id="detail2"><a href="#memberInfoDetail2" role="tab" data-toggle="tab" id="tab_memberInfoDetail2"></a></li>
        </ul>
        <div class="tab-content" style="padding-top: 0px;">
            <div class="tab-pane fade in active" id="memberInfoDetail">
                <div class="widget widget-table">
                    <div class="widget-content">
                        <table id="info_detail" class="table table-sorting table-hover table-bordered datatable">
                            <thead id="tableTop_detail">
                            </thead>
                            <tbody id="tableBody_detail">
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="tab-pane fade" id="memberInfoDetail2">
                <div class="widget widget-table">
                    <div class="widget-content">
                        <table id="info_detail2" class="table table-sorting table-hover table-bordered datatable">
                            <thead id="tableTop_detail2">
                            </thead>
                            <tbody id="tableBody_detail2">
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</script>