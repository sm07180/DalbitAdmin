<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div>
    <form id="memberInfoFrm"></form>
</div>

<!-- 이미지 원본 보기 -->
<div id="imageFullSize"></div>
<!-- detail -->
<form id="member_detailFrm" class="hide"></form>

<script type="text/javascript" src="/js/code/member/memberCodeList.js"></script>
<script type="text/javascript" src="/js/code/customer/customerCodeList.js"></script>
<script type="text/javascript" src="/js/message/member/memberMessage.js"></script>
<script type="text/javascript" src="/js/code/broadcast/broadCodeList.js"></script>

<script>
    $(document).ready(function() {

    });

    $("#select_level").html(util.getCommonCodeSelect(-1, level));
    $("#select_grade").html(util.getCommonCodeSelect(-1, grade));
    $("#gender").html(util.getCommonCodeRadio(2, gender, "Y"));

    var profImgDel;
    var report;
    function info_sel_success(dst_id, response) {
        dalbitLog(response);
        profImgDel = "false";
        memNo = response.data.mem_no;

        var template = $('#tmp_memberInfoFrm').html();
        var templateScript = Handlebars.compile(template);
        var context = response.data;
        var html = templateScript(context);
        $("#memberInfoFrm").html(html);
        init();

        $("#txt_birth").val(response.data.birthDate.substr(0, 10));
        $("#memSlct").html(util.renderSlct(response.data.memSlct, "20"));
        report = "../member/popup/reportPopup?memNo=" + "'" + response.data.mem_no + "'" + "&memNick=" + "'" + response.data.nickName + "'" + "&memSex=" + "'" + response.data.memSex + "'";

        if(response.data.memSlct != "p" ){
            $("#div_socialId").empty();
            var tmp = '<label>' + response.data.socialId + '</label>';
            $("#div_socialId").append(tmp);
        }

        if(tmp_bt != "adminMemoAdd" ){
            $("#member_detailFrm").html("");
        }
        // // 상단 목록 클릭시 detail 재 조회
        $("#tablist_con").find('.active').find('a').click();
    }

    function init(){
        $('#date_birth').datetimepicker({
            format: 'L',
            maxDate:new Date(),
            format: "YYYY-MM-DD",
        })
        $('#date_birth').datetimepicker().on('dp.change',function(e){
            var age = Number(moment().format("YYYY")) + 1 - Number( moment($('#txt_birth').val()).format("YYYY"));
            $("#lb_age").html(age + "세");
        })
        // 버튼
        $('#bt_img').click(function() {				 //이미지초기화
            bt_click(this.id);
        });
        $('#bt_socialId').click(function() {            //로그인아이디 변경
            // alert('준비중입니다.');
            // return;
            bt_click(this.id);
        });
        $('#bt_phon').click(function() {                //휴대폰 번호 변경
            bt_click(this.id);
        });
        $('#bt_resatNick').click(function() {           //닉네임 변경
            bt_click(this.id);
        });
        $('#bt_birth').click(function() {               //생일 변경
            bt_click(this.id);
        });
        $('#bt_gender').click(function() {              //성별 변경
            bt_click(this.id);
        });
        $('#bt_resatPass').click(function() {           //비밀번호 초기화
            bt_click(this.id);
        });
        $('#bt_adminMemo').click(function() {           //운영자 메모 변경
            bt_click(this.id);
        });
        $('#bt_adminMemoList').click(function() {       //운영자 메모 리스트
            getInfoDetail(this.id,"운영자메모");
        });
        $('#bt_connectState').click(function() {         //접속상태
            getInfoDetail(this.id,"접속상태");
        });
        $('#bt_manager').click(function() {             //매니저 자세히
            getInfoDetail(this.id,"(내가 등록한) 매니저");
        });
        $('#bt_black').click(function() {               //블랙리스트 자세히
            getInfoDetail(this.id,"(내가 등록학) 블랙리스트");
        });
        $('#bt_editHistory').click(function() {         //최근정보 내역
            getInfoDetail(this.id,"정보수정내역");
        });
        $('#bt_report').click(function() {           // 회원상태(경고/정지)
            reportPopup();
        });
        $('#bt_state').click(function() {           // 상태 정상으로 변경
            stateEdit();
        });
        // 버튼 끝
    }

    function fullSize_profile(url) {     // 이미지 full size
        $("#imageFullSize").html(util.imageFullSize("fullSize_profile",url));
        $('#fullSize_profile').modal('show');
    }

    var tmp_bt;
    function bt_click(tmp) {
        tmp_bt = tmp;
        var obj = new Object();
        if (memNo == "unknown") {
            alert("변경대상 회원을 선택해 주십시오.");
            return;
        }
        if (tmp == "bt_adminMemo") {            //운영자 메모 변경
            if (common.isEmpty($("#txt_adminMemo").val())) {
                alert("등록할 운영자 메모를 입력해 주십시오.");
                return;
            }
            getInfoDetail("bt_adminMemoList", "운영자메모");
            obj.mem_no = memNo;
            obj.memo = $("#txt_adminMemo").val();
            util.getAjaxData("adminMemoAdd", "/rest/member/member/adminMemoAdd", obj, update_success, fn_fail);
        } else if(tmp == "bt_socialId" ){       // 로그인ID변경
            if (common.isEmpty($("#txt_socialId").val())) {
                alert("로그인 아이디를 입력해 주십시오.");
                return;
            }
            if(confirm("로그인 아이디를 변경 하시겠습니까?")) {
                obj.mem_no = memNo;
                obj.socialId = $("#txt_socialId").val().replace(/-/gi, "");
                util.getAjaxData("editor", "/rest/member/member/socialId_edit", obj, update_success, fn_fail);
            }else return;
        }else{
            var sendNoti;
            if(common.isEmpty($("#txt_phon").val().replace(/-/gi, ""))){
                alert("전화번호를 입력해 주십시오.");
                return;
            }
            var tmp_phone = $("#txt_phon").val().replace(/-/gi, "");
            if(tmp == "bt_resatPass" || tmp == "bt_phon"){          // 비밀번호초기화, 휴대폰 번호 변경 Check
                if (tmp_phone.substring(0, 3) == "010" && (tmp_phone.length > 11 || tmp_phone.length < 10)) {
                    alert("전화번호를 정확히 입력해 주십시오.");
                    return;
                }
            }
            obj.mem_no = memNo;
            if(tmp == "bt_img"){                        //사진초기화
                if(confirm("프로필 이미지를 초기화 하시겠습니까?")){
                    obj.memSex = $('input[name="memSex"]:checked').val();
                    obj.photoUrl = IMAGE_SERVER_URL;
                    sendNoti = 0;
                    obj.notiContents = memberMessage.notiContents;
                    obj.notiMemo = memberMessage.profileReset;
                }else return;
            }else if(tmp == "bt_resatPass"){
                //비밀번호 변경 후 문자 보내기
                if (confirm($("#bt_resatPass").data('nickname') + memberMessage.passwordReset)) {
                    obj.passwdReset = "Reset";
                    obj.phoneNum = tmp_phone;                   //0
                    sendNoti = 0;
                    obj.notiContents = memberMessage.notiContents;
                    obj.notiMemo = memberMessage.passwordResetSms;
                }else return;
            }else if(tmp == "bt_resatNick"){
                if(confirm("닉네임을 초기화 하시겠습니까?")) {
                    obj.nickName = $("#bt_resatNick").data('userid');
                    sendNoti = 0;
                    obj.notiContents = memberMessage.notiContents;
                    obj.notiMemo = memberMessage.nickNameReset;
                }else return;
            }else if(tmp == "bt_phon"){
                if(confirm("연락처를 변경 하시겠습니까?")) {
                    obj.phoneNum = tmp_phone;                   //0
                    sendNoti = 0;
                }else return;
            }else if(tmp == "bt_birth"){
                if(confirm("생년월일을 변경 하시겠습니까?")) {
                    obj.birthDate = $("#txt_birth").val();
                    sendNoti = 0;
                }else return;
            }else if(tmp == "bt_gender"){
                if(confirm("성별을 변경 하시겠습니까?")) {
                    obj.memSex = $('input[name="memSex"]:checked').val();
                    sendNoti = 0;
                }else return;
            }
            obj.sendNoti=sendNoti;
            util.getAjaxData("editor", "/rest/member/member/editor", obj, update_success, fn_fail);
        }
    }

    function update_success(dst_id, response) {
        dalbitLog(response);
        if (tmp_bt == "bt_img") {                        //사진변경
            alert($("#"+tmp_bt).data('nickname') + "님의 프로필 이미지가 초기화 되었습니다.");
        } else if (tmp_bt == "bt_phon") {                 //휴대폰 번호 변경
            if(response == 0){
                alert("비정상적인 연락처 입니다. 연락처를 확인 해주십시오.");
                return;
            }
            alert($("#"+tmp_bt).data('nickname') + "님의 연락처가 변경되었습니다.");
        } else if (tmp_bt == "bt_resatNick") {            // 닉네임 변경
            alert($("#"+tmp_bt).data('nickname') + "님의 닉네임이 변경되었습니다.");
        } else if (tmp_bt == "bt_birth") {                //생일 변경
            alert($("#"+tmp_bt).data('nickname') + "님의 생년월일이 변경되었습니다.");
        } else if (tmp_bt == "bt_gender") {               //성별 변경
            alert($("#"+tmp_bt).data('nickname') + "님의 성별이 변경되었습니다.");
        } else if (tmp_bt == "bt_resatPass") {            //비밀번호 초기화
            if(response == 0){
                alert("비정상적인 연락처 입니다. 연락처를 확인 해주십시오.");
                return;
            }
            alert($("#"+tmp_bt).data('nickname') + "님의 비밀번호가 초기화 되었습니다.");
        } else if (tmp_bt == "bt_socialId") {            //비밀번호 초기화
            if(response.code == "1"){
                alert(response.message);
            }else{
                alert($("#"+tmp_bt).data('nickname') + "님의 로그인 아이디가 변경되었습니다.");
            }
        }

        if (dst_id == "adminMemoAdd") {
            dtList_info_detail.reload();
            tmp_bt = dst_id;
            getMemNo_info_reload(memNo);
        } else {
            var obj = new Object();
            obj.mem_no =  memNo;
            util.getAjaxData("info", "/rest/member/member/info", obj, info_sel_success, fn_fail);
        }
    }
    function getMemNo_info_reload(memNo){
        var data = new Object;
        data.mem_no = memNo;

        util.getAjaxData("info", "/rest/member/member/info", data, info_sel_success, fn_fail);
    }
    function reportPopup(){
        util.windowOpen(report,"1000","750","경고/정지");
    }

    function getInfoDetail(tmp,tmp1) {     // 상세보기
        var template = $('#tmp_member_detailFrm').html();
        var templateScript = Handlebars.compile(template);
        $("#member_detailFrm").html(templateScript);

        $('#tab_memberInfoDetail').text(tmp1);           //텝 이름 변경
        $('#member_detailFrm').addClass("show");
        if(tmp.indexOf("_") > 0){ tmp = tmp.split("_"); tmp = tmp[1]; }

        console.log("@@@@@@@@@@@@@@@@@@@@@@ : " + tmp);
        console.log("@@@@@@@@@@@@@@@@@@@@@@ : " + memNo);

        var source = MemberDataTableSource[tmp];
        var dtList_info_detail_data = function (data) {
            data.mem_no = memNo;
            if(tmp == "connectState"){
                data.sortDate = "1";
            }else if(tmp == "manager" || tmp == "black" ){
                data.slctType = "1";
            }
        }
        console.log(dtList_info_detail_data);
        dtList_info_detail = new DalbitDataTable($("#info_detail"), dtList_info_detail_data, source);
        dtList_info_detail.useCheckBox(false);
        dtList_info_detail.useIndex(true);
        dtList_info_detail.createDataTable()
        dtList_info_detail.reload();

        if(tmp == "manager" || tmp == "black"){
            $('#detail2').addClass("show");
            getInfoDetail2(tmp);
        }
    }
    function getInfoDetail2(tmp){
        var dtList_info_detail_data = function (data) {
            data.mem_no = memNo;
            data.slctType = "2";
        }
        if(tmp == "manager") {
            $('#tab_memberInfoDetail2').text("(나를 등록한) 매니저");           //텝 이름 변경
            var source = MemberDataTableSource["meManager"];
        }else if(tmp == "black") {
            $('#tab_memberInfoDetail2').text("(나를 등록한) 블랙리스트");           //텝 이름 변경
            var source = MemberDataTableSource["meBlack"];
        }

        dtList_info_detail = new DalbitDataTable($("#info_detail2"), dtList_info_detail_data, source);
        dtList_info_detail.useCheckBox(false);
        dtList_info_detail.useIndex(true);
        dtList_info_detail.createDataTable()
        dtList_info_detail.reload();
    }

    function stateEdit() {
        var obj = new Object();
        obj.mem_no = memNo;
        util.getAjaxData("editor", "/rest/member/member/state_edit", obj, state_edit_success, fn_fail);
    }

    function state_edit_success(dst_id, response) {
        getMemNo_info_reload(memNo);
    }



    function fn_fail(data, textStatus, jqXHR){
        console.log(data, textStatus, jqXHR);
    }
</script>

<script id="tmp_memberInfoFrm" type="text/x-handlebars-template">
    <label style="height: 30px;"> ㆍ회원상세 정보입니다. 일부 정보 수정 시 버튼 클릭하면 즉시 적용 됩니다.</label>
    <table class="table table-bordered table-dalbit" style="margin-bottom: 0px;">
        <colgroup>
            <col width="10%"/><col width="10%"/><col width="10%"/><col width="20%"/><col width="10%"/><col width="40%"/>
        </colgroup>
        <tbody>
        <tr>
            <th rowspan="5">프로필이미지</th>
            <td rowspan="5" colspan="3">
                <form id="profileImg" method="post" enctype="multipart/form-data">
                    <img id="image_section" src="{{renderProfileImage profileImage memSex}}" alt="your image" style="width: 150px;height: 150px" onclick="fullSize_profile(this.src);"/>
                </form>
                <button type="button" id="bt_img" class="btn btn-default btn-sm  pull-right" data-memno="{{mem_no}}" data-nickname="{{nickName}}">초기화</button>
            </td>
        <tr>
            <th>회원레벨</th>
            <td style="text-align: left">{{{getCommonCodeLabel level 'level'}}}</td>
        </tr>
        <tr>
            <th>DJ등급</th>
            <td style="text-align: left">{{{getCommonCodeLabel grade 'grade'}}}</td>
        </tr>
        <tr>
            <th>회원상태</th>
            <td style="text-align: left">
                {{{getCommonCodeLabel memState 'mem_state'}}}
                <button type="button" class="btn btn-default btn-sm pull-right" id="bt_report">경고/정지</button>
                <button type="button" class="btn btn-info btn-sm pull-right" id="bt_state">정상변경</button>
            </td>
        </tr>
        <tr>
            <th>접속상태</th>
            <td style="text-align: left">{{connectState}}
                <button type="button" id="bt_connectState" class="btn btn-default btn-sm pull-right">자세히</button>
            </td>
        </tr>
        </tr>
        <tr>
            <th>회원NO</th>
            <td colspan="3" style="text-align: left">{{mem_no}}</td>
            <th>방송상태</th>
            <td style="text-align: left">{{broadcastState}}</td>
        </tr>
        <tr>
            <th>회원이름</th>
            <td style="text-align: left">{{userName}}</td>
            <th>내/외국인 구분</th>
            <td style="text-align: left">{{local}}</td>
            <th>청취상태</th>
            <td style="text-align: left">{{listeningState}}</td>
        </tr>
        <tr>
            <th>UserId</th>
            <td colspan="3" style="text-align: left">{{userId}}</td>
            <th>보유달</th>
            <td style="text-align: left">{{dal}} 개</td>
        </tr>
        <tr>
            <th>로그인 아이디</th>
            <td colspan="3" style="text-align: left">
                <div id="div_socialId">
                    <input type="text" class="form-control" id="txt_socialId" style="width: 90%;" value="{{socialId}}">
                    <button type="button" id="bt_socialId" class="btn btn-default btn-sm pull-right" data-memno="{{mem_no}}" data-nickname="{{nickName}}">변경</button>
                </div>
            </td>
            <th>보유별</th>
            <td style="text-align: left">{{byeol}} 개</td>
        </tr>
        <tr>
            <th>연락처</th>
            <td colspan="3" style="text-align: left">
                <input type="text" class="form-control" id="txt_phon" style="width: 90%;" value="{{phoneNum}}">
                <button type="button" id="bt_phon" class="btn btn-default btn-sm pull-right" data-memno="{{mem_no}}" data-nickname="{{nickName}}">변경</button>
            </td>
            <th>(내가/나를등록한)<br/>매니저정보</th>
            <td style="text-align: left">
                {{managerICnt}} 명 / {{managerMeCnt}} 명
                <button type="button" id="bt_manager" class="btn btn-default btn-sm pull-right">자세히</button>
            </td>
        </tr>
        <tr>
            <th>닉네임</th>
            <td colspan="3" style="text-align: left">
                <%--<input type="text" class="form-control" id="txt_memNick" style="width: 90%;" value="{{nickName}}">--%>
                <button type="button" id="bt_resatNick" class="btn btn-default btn-sm" data-memno="{{mem_no}}" data-nickname="{{nickName}}" data-userId="{{userId}}">초기화</button>
            </td>
            <th>(내가/나를 등록한)<br/>블랙리스트</th>
            <td style="text-align: left">
                {{blackICnt}} 명 / {{blackMeCnt}} 명
                <button type="button" id="bt_black" class="btn btn-default btn-sm pull-right">자세히</button>
            </td>
        </tr>
        <tr>
            <th>생년월일</th>
            <td colspan="3" style="text-align: left">
                <div class="input-group date" id="date_birth">
                    <input type="text" class="form-control" id="txt_birth"><span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                </div>
                <button type="button" id="bt_birth" class="btn btn-default btn-sm pull-right" data-memno="{{mem_no}}" data-nickname="{{nickName}}">변경</button>
            </td>
            <th>소셜가입</th>
            <td style="text-align: left"><label id="memSlct"></label></td>
        </tr>
        <tr>
            <th>나이</th>
            <td style="text-align: left">{{age}}세</td>
            <th>성별</th>
            <td style="text-align: left">{{{getCommonCodeRadio memSex 'memSex'}}}
                <button type="button" id="bt_gender" class="btn btn-default btn-sm pull-right" data-memno="{{mem_no}}" data-nickname="{{nickName}}">변경</button>
            </td>
            <th>회원가입일시</th>
            <td style="text-align: left">{{joinDate}}</td>
        </tr>
        <tr>
            <th>비밀번호</th>
            <td colspan="3" style="text-align: left"><button type="button" id="bt_resatPass" class="btn btn-default btn-sm" data-memno="{{mem_no}}" data-nickname="{{nickName}}">초기화</button></td>
            <th>회원탈퇴일시</th>
            <td style="text-align: left">{{withdrawalDate}}</td>
        </tr>
        <tr>
            <th rowspan="4">운영자메모</th>
            <td rowspan="1" colspan="3" style="text-align: left">등록: {{opMemoCnt}} 건
                <button type="button" id="bt_adminMemoList" class="btn btn-default btn-sm pull-right">자세히</button>
            </td>
            <th>최초방송일시</th>
            <td style="text-align: left">{{firstBroadcastDate}}</td>
        </tr>
        <tr>
            <td rowspan="3" colspan="3" style="text-align: left">
                <textarea type="textarea" class="form-control" id="txt_adminMemo" style="width: 90%;height: 76px"></textarea>
                <button type="button" id="bt_adminMemo" class="btn btn-default btn-sm pull-right" data-memno="{{mem_no}}" data-nickname="{{nickName}}">등록</button>
            </td>
        <tr>
            <th>최근 정보 수정<br/> 처리일시</th>
            <td style="text-align: left">{{lastOpDate}}</td>
        </tr>
        <tr>
            <th>최근 정보 수정 자</th>
            <td style="text-align: left">{{lastOpName}}
                <button type="button" id="bt_editHistory" class="btn btn-default btn-sm pull-right">자세히</button>
            </td>
        </tr>
        </tr>
        </tbody>
    </table>
</script>

<!-- info detail -->
<script id="tmp_member_detailFrm" type="text/x-handlebars-template">
    <div class="widget-content">
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


