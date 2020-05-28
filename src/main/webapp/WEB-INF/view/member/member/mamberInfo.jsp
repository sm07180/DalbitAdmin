<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="cfn" uri="/WEB-INF/tld/comFunction.tld" %>

<c:set var="readYn" value="N" />
<c:set var="insertYn" value="N" />
<c:set var="deleteYn" value="N" />

<c:forEach var="menu" items="${cfn:getMenuList()}" varStatus="status">
    <c:forEach var="twoDepth" items="${menu.twoDepth}">
        <c:if test="${twoDepth.idx eq 52}">
            <c:set var="readYn" value="${twoDepth.is_read eq 0 ? 'N' : 'Y'}" />
            <c:set var="insertYn" value="${twoDepth.is_insert eq 0 ? 'N' : 'Y'}" />
            <c:set var="deleteYn" value="${twoDepth.is_delete eq 0 ? 'N' : 'Y'}" />
        </c:if>
    </c:forEach>
</c:forEach>

<div>
    <form id="memberInfoFrm"></form>
</div>

<!-- 이미지 원본 보기 -->
<div id="imageFullSize"></div>
<!-- detail -->
<form id="member_detailFrm" class="hide"></form>


<script>
    $(document).ready(function() {

    });
    $("#gender").html(util.getCommonCodeRadio(2, gender, "Y"));

    var memWithdrawal = "0";
    var profImgDel;
    var report;
    var memberInfo_responseDate;
    var withdrawal;
    function info_sel_success(dst_id, response) {
        dalbitLog(response);
        if(response.result == "fail"){
            alert("회원정보 없음");
            return;
        }
        memberInfo_responseDate = response.data;
        profImgDel = "false";
        memNo = response.data.mem_no;

        if (response.data.memState == 3)
            response.data["block"] = " / 정지기간: " + response.data.block_day + " / 정지종료일: " + response.data.blockEndDateFormat;

        if (response.data.memState == 4){
            response.data["memWithdrawal"] = "1";
        }else{
            response.data["memWithdrawal"] = "0";
        }
        response.data["birthData"] = response.data.birthDate.substr(0, 10);
        if(response.data.broadcastState == "ON")
            response.data["icon_broadcastState"] = '<i class="fa fa-circle" style="color: #ff0000;font-size:20px;"></i> ' + response.data.broadcastState;
        else
            response.data["icon_broadcastState"] = '<i class="fa fa-circle" style="color: #000000;font-size:20px;"></i> ' + response.data.broadcastState;

        if(response.data.listeningState == "ON")
            response.data["icon_listeningState"] = '<i class="fa fa-volume-up" style="color: #a037d9;font-size:20px;"></i> ' + response.data.listeningState;
        else
            response.data["icon_listeningState"] = '<i class="fa fa-volume-off" style="color: #000000;font-size:20px;"></i> ' + response.data.listeningState;


        var template = $('#tmp_memberInfoFrm').html();
        var templateScript = Handlebars.compile(template);
        var context = response.data;
        var html = templateScript(context);
        $("#memberInfoFrm").html(html);
        init();

        // $("#txt_birth").val(response.data.birthDate);
        $("#memSlct").html(util.renderSlct(response.data.memSlct, "40"));
        report = "/member/member/popup/reportPopup?memNo='" + encodeURIComponent(response.data.mem_no) + "'&memId='"
                                                            + encodeURIComponent(response.data.userId) + "'&memNick='"
                                                            + encodeURIComponent(common.replaceHtml(response.data.nickName)) + "'&memSex='"
                                                            + encodeURIComponent(response.data.memSex) + "'";

        if (response.data.memSlct != "p") {
            $("#div_socialId").empty();
            var tmp = '<label>' + response.data.socialId + '</label>';
            $("#div_socialId").append(tmp);
        }

        if (tmp_bt != "adminMemoAdd") {
            $("#member_detailFrm").html("");
        }
        if (response.data.memState == 4){
            $("#txt_phon").css("display", "none");
        }else{
            $("#txt_phon").css("display", "");
        }

        $("#tablist_con").find('.active').find('a').click();

        util.scrollPostion(878);
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
        $('#bt_adminMemo').click(function() {           //운영자 메모 등록
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

        $('#bt_dalAdd').click(function() {           // 달변경
            dalbyeolAdd("dal");
        });
        $('#bt_byeolAdd').click(function() {           // 달변경
            dalbyeolAdd("byeol");
        });

        $('#bt_pointHistory').click(function() {           // 달/별 변경 자세히보기
            getInfoDetail(this.id,"보유달/별 수정내역");
        });

        // 버튼 끝
    }

    function fullSize_profile(url) {     // 이미지 full size
        if(common.isEmpty(url)){
            return;
        }

        $("#imageFullSize").html(util.imageFullSize("fullSize_profile",url));
        $('#fullSize_profile').modal('show');
    }
    function modal_close(){
        $("#fullSize_profile").modal('hide');
        $("#fanboard_fullSize_profile").modal('hide');
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
            if(memberInfo_responseDate.socialId == $("#txt_socialId").val()){
                alert("동일한 로그인 아이디 입니다. 변경할 아이디를 입력해 주세요.");
                return;
            }
            if(confirm("로그인 아이디를 변경 하시겠습니까?")) {
                obj.mem_no = memNo;
                obj.socialId = $("#txt_socialId").val().replace(/-/gi, "");
                obj.before_socialId = memberInfo_responseDate.socialId;
                util.getAjaxData("editor", "/rest/member/member/socialId_edit", obj, update_success, fn_fail);
            }else return;
        }else{
            var sendNoti;
            obj.mem_no = memNo;
            if(tmp == "bt_img"){                        //사진초기화
                if(common.isEmpty(memberInfo_responseDate.profileImage)){
                    alert("이미 초기화된 프로필 이미지 입니다. 프로필 초기화가 불가능합니다.");
                    return;
                }
                if(confirm("프로필 이미지를 초기화 하시겠습니까?")){
                    sendNoti = 1;
                    obj.notiContents = memberMessage.notiContents;
                    obj.notiMemo = memberMessage.profileReset;
                    // sockat set
                    obj.profileImage = "";
                    obj.memSex = $('input[name="memSex"]:checked').val();
                    obj.beforNickName = memberInfo_responseDate.nickName;
                }else return;
            }else if(tmp == "bt_resatPass"){
                if(common.isEmpty($("#txt_phon").val().replace(/-/gi, ""))){
                    alert("전화번호를 입력해 주십시오.");
                    return;
                }
                var tmp_phone = $("#txt_phon").val().replace(/-/gi, "");
                console.log(tmp_phone);
                if (tmp_phone.substring(0, 3) != "010" || (tmp_phone.length > 11 || tmp_phone.length < 10)) {
                    alert("전화번호를 정확히 입력해 주십시오.");
                    return;
                }

                //비밀번호 변경 후 문자 보내기
                if (confirm($("#bt_resatPass").data('nickname') + memberMessage.passwordReset)) {
                    obj.passwdReset = "Reset";
                    obj.phoneNum = tmp_phone;                   //0
                    sendNoti = 1;
                    obj.notiContents = memberMessage.notiContents;
                    obj.notiMemo = memberMessage.passwordResetSms;
                }else return;
            }else if(tmp == "bt_resatNick"){
                if(memberInfo_responseDate.nickName == $("#td_userid").text()){
                    alert("이미 초기화된 닉네임 입니다. 닉네임 초기화가 불가능합니다.");
                    return;
                }
                if(confirm("닉네임을 초기화 하시겠습니까?")) {
                    sendNoti = 1;
                    obj.notiContents = memberMessage.notiContents;
                    obj.notiMemo = memberMessage.nickNameReset;

                    // sockat set
                    obj.profileImage = memberInfo_responseDate.profileImage;
                    obj.memSex = $('input[name="memSex"]:checked').val();
                    obj.nickName = $("#td_userid").text();
                }else return;
            }else if(tmp == "bt_phon"){
                if(common.isEmpty($("#txt_phon").val().replace(/-/gi, ""))){
                    alert("전화번호를 입력해 주십시오.");
                    return;
                }
                if(memberInfo_responseDate.phoneNum == $("#txt_phon").val().replace(/-/gi, "")){
                    alert("동일한 전화번호 입니다. 변경할 전화번호를 입력해주세요.");
                    return;
                }
                var tmp_phone = $("#txt_phon").val().replace(/-/gi, "");
                if (tmp_phone.substring(0, 3) != "010" || (tmp_phone.length > 11 || tmp_phone.length < 10)) {
                    alert("전화번호를 정확히 입력해 주십시오.");
                    return;
                }

                if(confirm("연락처를 변경 하시겠습니까?")) {
                    obj.phoneNum = tmp_phone;                   //0
                    sendNoti = 0;
                }else return;
            }else if(tmp == "bt_birth"){
                if(memberInfo_responseDate.birthDate.substr(0, 10) == $("#txt_birth").val()){
                    alert("생년월일을 변경해주세요.");
                    return;
                }
                if(confirm("생년월일을 변경 하시겠습니까?")) {
                    obj.birthDate = $("#txt_birth").val();
                    sendNoti = 0;
                }else return;
            }else if(tmp == "bt_gender"){
                if(memberInfo_responseDate.memSex == $('input[name="memSex"]:checked').val()){
                    alert("성별을 변경해 주세요.");
                    return;
                }
                if(memberInfo_responseDate.memSex != "n" && $('input[name="memSex"]:checked').val() == "n"){
                    alert("성별을 알수없음으로 변경이 불가능합니다.");
                    return false;
                }
                if(confirm("성별을 변경 하시겠습니까?")) {
                    obj.photoUrl = PHOTO_SERVER_URL;
                    sendNoti = 1;
                    obj.notiContents = memberMessage.notiContents;
                    obj.notiMemo = memberMessage.profileReset;

                    // sockat set
                    obj.profileImage = memberInfo_responseDate.profileImage;
                    obj.memSex = $('input[name="memSex"]:checked').val();
                    obj.beforNickName = memberInfo_responseDate.nickName;
                }else return;
            }
            obj.beforProfileImage = memberInfo_responseDate.profileImage;
            obj.sendNoti=sendNoti;

            util.getAjaxData("editor", "/rest/member/member/editor", obj, update_success, fn_fail);
        }
    }

    function update_success(dst_id, response) {
        dalbitLog(response);

        if(response.code == 0){
            if (tmp_bt == "bt_img") {                        //사진변경
                alert("프로필 이미지가 초기화 되었습니다.");
            } else if (tmp_bt == "bt_phon") {                 //휴대폰 번호 변경
                if(response == 0){
                    alert("비정상적인 연락처 입니다. 연락처를 확인 해주십시오.");
                    return;
                }
                alert("연락처가 변경되었습니다.");
            } else if (tmp_bt == "bt_resatNick") {            // 닉네임 변경
                alert("닉네임이 변경되었습니다.");
            } else if (tmp_bt == "bt_birth") {                //생일 변경
                alert("생년월일이 변경되었습니다.");
            } else if (tmp_bt == "bt_gender") {               //성별 변경
                alert("성별이 변경되었습니다.");
            } else if (tmp_bt == "bt_resatPass") {            //비밀번호 초기화
                if(response == 0){
                    alert("비정상적인 연락처 입니다. 연락처를 확인 해주십시오.");
                    return;
                }
                alert("비밀번호가 초기화 되었습니다.");
            } else if (tmp_bt == "bt_socialId") {            //비밀번호 초기화
                if(response.code == "1"){
                    alert(response.message);
                }else{
                    alert("로그인 아이디가 변경되었습니다.");
                }
            }
        }else{
            alert(response.message);
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
        console.log(report);
        util.windowOpen(report,"750","700","경고/정지");
    }

    function fnChkByte(obj) {
        var maxByte = 11; //최대 입력 바이트 수
        var str = obj.value;
        var str_len = str.length;
        var rbyte = 0;
        var rlen = 0;
        var one_char = "";
        var str2 = "";
        for (var i = 0; i < str_len; i++) {
            one_char = str.charAt(i);
            if (escape(one_char).length > 4) {
                rbyte += 2; //한글2Byte
            } else {
                rbyte++; //영문 등 나머지 1Byte
            }
            if (rbyte <= maxByte) {
                rlen = i + 1; //return할 문자열 갯수
            }
        }
        if (rbyte > maxByte) {
            str2 = str.substr(0, rlen); //문자열 자르기
            obj.value = str2;
            fnChkByte(obj, maxByte);
        }
    }

    function getInfoDetail(tmp,tmp1) {     // 상세보기
        var template = $('#tmp_member_detailFrm').html();
        var templateScript = Handlebars.compile(template);
        $("#member_detailFrm").html(templateScript);

        $('#tab_memberInfoDetail').text(tmp1);           //텝 이름 변경
        $('#member_detailFrm').addClass("show");
        if(tmp.indexOf("_") > 0){ tmp = tmp.split("_"); tmp = tmp[1]; }

        var source = MemberDataTableSource[tmp];
        var dtList_info_detail_data = function (data) {
            data.mem_no = memNo;
            if(tmp == "connectState"){
                data.sortDate = "1";
            }else if(tmp == "manager" || tmp == "black" ){
                data.slctType = "1";
            }
        }
        dtList_info_detail = new DalbitDataTable($("#info_detail"), dtList_info_detail_data, source);
        dtList_info_detail.useCheckBox(false);
        dtList_info_detail.useIndex(true);
        dtList_info_detail.createDataTable();

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
        dtList_info_detail.createDataTable();
    }

    function stateEdit() {
        if(confirm("상태를 정상으로 변경 하시겠습니까?")) {
            var obj = new Object();
            obj.mem_no = memNo;
            util.getAjaxData("editor", "/rest/member/member/state_edit", obj, state_edit_success, fn_fail);
        }return false;
    }

    function state_edit_success(dst_id, response) {
        getMemNo_info_reload(memNo);
    }

    $(document).on('click', 'input:radio[name="memSex"]', function(title, content){
        if(memberInfo_responseDate.memState == 4){
            return false;
        }
        if(memberInfo_responseDate.memSex != "n" && $('input[name="memSex"]:checked').val() == "n"){
            alert("성별을 알수 없음으로 변경이 불가능합니다.");
            return false;
        }
    });

    function dalbyeolAdd(tmp){
        var data = new Object();
        data.mem_no = memNo;

        if(tmp == "dal" ){
            if($("#sp_dalPointEdit").find("select[name='pointEditStory']").val() == "-1"){
                alert("달 변경 사유를 선택해 주세요.");
                return;
            }
            if($("#txt_dalAddCnt").val() == ""){
                alert("달 수 를 입력해주세요");
                return;
            }
            if($("select[name='dalPlusMinus']").val() == 2){
                if(memberInfo_responseDate.dal < $("#txt_dalAddCnt").val()){
                    alert("적용할 수 없는 수치입니다.");
                    return;
                }
                data.addDalCnt = "-" + $("#txt_dalAddCnt").val();
            }else{
                data.addDalCnt = $("#txt_dalAddCnt").val();
            }
            if(confirm($("#txt_dalAddCnt").val() + "달을 변경하시겠습니까?")) {
                data.pointEditStroy=$("#sp_dalPointEdit").find("#pointEditStory option:checked").text();
                util.getAjaxData("dalAdd", "/rest/member/member/daladd", data, dalbyeoladd_success, fn_fail);
            } else return;
        }else if(tmp == "byeol"){
            if($("#sp_byeollPointEdit").find("select[name='pointEditStory']").val() == "-1"){
                alert("달 변경 사유를 선택해 주세요.");
                return;
            }
            if($("#txt_byeolAddCnt").val() == ""){
                alert("별 수 를 입력해주세요");
                return;
            }
            if($("select[name='byeolPlusMinus']").val() == 2){
                if(memberInfo_responseDate.byeol < $("#txt_byeolAddCnt").val()){
                    alert("적용할 수 없는 수치입니다.");
                    return;
                }
                data.addByeolCnt = "-" + $("#txt_byeolAddCnt").val();
            }else{
                data.addByeolCnt = $("#txt_byeolAddCnt").val();
            }
            if(confirm($("#txt_byeolAddCnt").val() + "별을 변경하시겠습니까?")) {
                data.pointEditStroy=$("#sp_byeolPointEdit").find("#pointEditStory option:checked").text();
                util.getAjaxData("byeoladd", "/rest/member/member/byeoladd", data, dalbyeoladd_success, fn_fail);

            }else return;
        }
    }

    function dalbyeoladd_success(dst_id, response) {
        dalbitLog(response);
        if(response.code == "0"){
            alert("지급이 정상 처리 되었습니다.");
        }else{
            alert(response.message);
        }
        var obj = new Object();
        obj.mem_no = memNo;
        obj.memWithdrawal = memWithdrawal;
        util.getAjaxData("info", "/rest/member/member/info", obj, info_sel_success, fn_fail);
    }


    function fn_fail(data, textStatus, jqXHR){
        console.log(data, textStatus, jqXHR);
    }

</script>

<script id="tmp_memberInfoFrm" type="text/x-handlebars-template">
    <label style="height: 30px;"> ㆍ회원상세 정보입니다. 일부 정보 수정 시 버튼 클릭하면 즉시 적용 됩니다.</label>
    <table class="table table-bordered table-dalbit" style="margin-bottom: 0px;">
        <colgroup>
            <col width="10%"/><col width="10%"/><col width="10%"/><col width="20%"/><col width="10%"/><col width="35%"/><col width="5%"/>
        </colgroup>
        <tbody>
        <tr>
            <th rowspan="5">프로필이미지</th>
            <td rowspan="5" colspan="3" style="border: white">
                <form id="profileImg" method="post" enctype="multipart/form-data">
                    <img id="image_section" class="thumbnail col-md-10 no-padding" src="{{renderProfileImage profileImage memSex}}" alt="your image" style="width: 150px;height: 150px" onclick="fullSize_profile(this.src);"/>
                    {{#equal memWithdrawal '0'}}
                        <button type="button" id="bt_img" class="btn btn-default btn-sm" style="margin-left: 10px" data-memno="{{mem_no}}" data-nickname="{{nickName}}">초기화</button>
                    {{/equal}}
                </form>
            </td>
        <tr>
            <th>회원레벨</th>
            <td colspan="2" style="text-align: left">{{{getCommonCodeLabel level 'level'}}}</td>
        </tr>
        <tr>
            <th>경험치</th>
            <td colspan="2" style="text-align: left">{{{getCommonCodeLabel grade 'grade'}}}</td>
        </tr>
        <tr>
            <th>회원상태</th>
            <td colspan="2" style="text-align: left">
                {{{getCommonCodeLabel memState 'mem_state'}}}
                {{{block}}}
                {{#equal memWithdrawal '0'}}
                    <button type="button" class="btn btn-default btn-sm pull-right" id="bt_report">경고/정지</button>
                {{/equal}}
                <button type="button" class="btn btn-info btn-sm pull-right" id="bt_state">정상변경</button>
            </td>
        </tr>
        <tr>
            <th>접속상태</th>
            <td colspan="2" style="text-align: left">{{connectState}}
                {{#equal memWithdrawal '0'}}
                    <button type="button" id="bt_connectState" class="btn btn-default btn-sm pull-right">자세히</button>
                {{/equal}}
            </td>
        </tr>
        </tr>
        <tr>
            <th>회원NO</th>
            <td colspan="3" style="text-align: left">{{mem_no}}</td>
            <th>방송상태</th>
            <td colspan="2" style="text-align: left">
                {{{icon_broadcastState}}}
                {{#equal broadcastState 'ON'}}
                 - 방송제목 : {{{roomNoLink ../title ../room_no}}}
                {{/equal}}

            </td>
        </tr>
        <tr>
            <th>회원이름</th>
            <td style="text-align: left">{{userName}}</td>
            <th>내/외국인 구분</th>
            <td style="text-align: left">{{local}}</td>
            <th>청취상태</th>
            <td colspan="2" style="text-align: left">
                {{{icon_listeningState}}}
                {{#equal listeningState 'ON'}}
                 - 방송제목 : {{{roomNoLink ../listen_title ../listen_room_no}}}
                {{/equal}}
            </td>
        </tr>
        <tr>
            <th>UserId</th>
            <td colspan="3" style="text-align: left" id="td_userid">{{userId}}</td>
            <th>보유달</th>
            <td style="text-align: left">
                <span class="col-md-3 no-padding">
                    {{addComma dal}} 달
                </span>
                <c:if test="${insertYn eq 'Y'}">
                    {{#equal memWithdrawal '0'}}
                        <span class="col-md-9 no-padding" id="sp_dalPointEdit">
                            <select id="dalPlusMinus" name="dalPlusMinus" class="form-control searchType">
                                <option value="1">+</option>
                                <option value="2">-</option>
                            </select>
                            <input type="text" class="form-control" id="txt_dalAddCnt" style="width: 100px">
                            {{{getCommonCodeSelect pointEditStory 'pointEditStory'}}}
                            <button type="button" id="bt_dalAdd" class="btn btn-default btn-sm" data-memno="{{mem_no}}">변경</button>
                        </span>
                    {{/equal}}
                </c:if>
            </td>
            <td rowspan="2">
                <c:if test="${readYn eq 'Y'}">
                    <button type="button" id="bt_pointHistory" class="btn btn-default btn-sm pull-right">자세히</button>
                </c:if>
            </td>
        </tr>
        <tr>
            <th>로그인 아이디</th>
            <td colspan="3" style="text-align: left">
                <div id="div_socialId">
                    <input type="text" class="form-control" id="txt_socialId" style="width: 50%;" value="{{socialId}}" onkeyup="fnChkByte(this);">
                    {{#equal memWithdrawal '0'}}
                        <button type="button" id="bt_socialId" class="btn btn-default btn-sm" data-memno="{{mem_no}}" data-nickname="{{nickName}}">변경</button>
                    {{/equal}}
                </div>
            </td>
            <th>보유별</th>
            <td style="text-align: left">
                <span class="col-md-3 no-padding">
                    {{addComma byeol}} 별
                </span>
                <c:if test="${insertYn eq 'Y'}">
                    {{#equal memWithdrawal '0'}}
                        <span class="col-md-9 no-padding" id="sp_byeolPointEdit">
                            <select id="byeolPlusMinus" name="byeolPlusMinus" class="form-control searchType">
                                <option value="1">+</option>
                                <option value="2">-</option>
                            </select>
                            <input type="text" class="form-control" id="txt_byeolAddCnt" style="width: 100px">
                            {{{getCommonCodeSelect pointEditStory 'pointEditStory'}}}
                            <button type="button" id="bt_byeolAdd" class="btn btn-default btn-sm" data-memno="{{mem_no}}">변경</button>
                        </span>
                    {{/equal}}
                </c:if>
            </td>
        </tr>
        <tr>
            <th>연락처</th>
            <td colspan="3" style="text-align: left">
                <input type="text" class="form-control" id="txt_phon" style="width: 50%;" value="{{phoneNum}}">
                {{#equal memWithdrawal '0'}}
                    <button type="button" id="bt_phon" class="btn btn-default btn-sm" data-memno="{{mem_no}}" data-nickname="{{nickName}}">변경</button>
                {{/equal}}
                {{certification}}
            </td>
            <th>(내가/나를등록한)<br/>매니저정보</th>
            <td colspan="2" style="text-align: left">
                {{addComma managerICnt}} 명 / {{addComma managerMeCnt}} 명
                {{#equal memWithdrawal '0'}}
                    <button type="button" id="bt_manager" class="btn btn-default btn-sm pull-right">자세히</button>
                {{/equal}}
            </td>
        </tr>
        <tr>
            <th>닉네임</th>
            <td colspan="3" style="text-align: left">
                {{nickName}}
                {{#equal memWithdrawal '0'}}
                    <button type="button" id="bt_resatNick" class="btn btn-default btn-sm pull-right" data-memno="{{mem_no}}" data-nickname="{{nickName}}" data-userId="{{userId}}">초기화</button>
                {{/equal}}
            </td>
            <th>(내가/나를 등록한)<br/>블랙리스트</th>
            <td colspan="2" style="text-align: left">
                {{addComma blackICnt}} 명 / {{addComma blackMeCnt}} 명
                {{#equal memWithdrawal '0'}}
                    <button type="button" id="bt_black" class="btn btn-default btn-sm pull-right">자세히</button>
                {{/equal}}
            </td>
        </tr>
        <tr>
            <th>생년월일</th>
            <td colspan="3" style="text-align: left">
                <div class="input-group date" id="date_birth">
                    <input type="text" class="form-control" id="txt_birth" value="{{{birthData}}}">
                    {{#equal memWithdrawal '0'}}
                        <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                    {{/equal}}
                </div>
                {{#equal memWithdrawal '0'}}
                    <button type="button" id="bt_birth" class="btn btn-default btn-sm pull-right" data-memno="{{mem_no}}" data-nickname="{{nickName}}">변경</button>
                {{/equal}}
            </td>
            <th>가입방법</th>
            <td colspan="2" style="text-align: left"><label id="memSlct"></label></td>
        </tr>
        <tr>
            <th>나이</th>
            <td style="text-align: left">{{age}}세</td>
            <th>성별</th>
            <td style="text-align: left">
                <label class="mt5">{{{getCommonCodeRadio memSex 'memSex'}}}</label>
                {{#equal memWithdrawal '0'}}
                    <button type="button" id="bt_gender" class="btn btn-default btn-sm pull-right" data-memno="{{mem_no}}" data-nickname="{{nickName}}">변경</button>
                {{/equal}}
            </td>
            <th>회원가입일시</th>
            <td colspan="2" style="text-align: left">{{joinDate}}</td>
        </tr>
        <tr>
            <th>비밀번호</th>
            <td colspan="3" style="text-align: left">
                {{#equal memWithdrawal '0'}}
                    <button type="button" id="bt_resatPass" class="btn btn-default btn-sm" data-memno="{{mem_no}}" data-nickname="{{nickName}}">초기화</button>
                {{/equal}}
            </td>
            <th>회원탈퇴일시</th>
            <td colspan="2" style="text-align: left">{{withdrawalDate}}</td>
        </tr>
        <tr>
            <th rowspan="4">운영자메모</th>
            <td rowspan="1" colspan="3" style="text-align: left">등록: {{addComma opMemoCnt}} 건
                <button type="button" id="bt_adminMemoList" class="btn btn-default btn-sm pull-right">자세히</button>
            </td>
            <th rowspan="1">최초방송일시</th>
            <td rowspan="1" colspan="2" style="text-align: left">{{firstBroadcastDate}}</td>
        </tr>
        <tr>
            <td rowspan="3" colspan="3" style="text-align: left">
                <textarea type="textarea" class="form-control" id="txt_adminMemo" style="width: 90%;height: 76px"></textarea>
                <button type="button" id="bt_adminMemo" class="btn btn-default btn-sm pull-right" data-memno="{{mem_no}}" data-nickname="{{nickName}}">등록</button>
            </td>
            <th rowspan="1">최근 정보 수정<br/> 처리일시</th>
            <td rowspan="1" colspan="2" style="text-align: left">{{lastOpDate}}</td>
        </tr>
        <tr>
            <th rowspan="2" >최근 정보 수정 자</th>
            <td rowspan="2" colspan="2" style="text-align: left">{{lastOpName}}
                <button type="button" id="bt_editHistory" class="btn btn-default btn-sm pull-right">자세히</button>
            </td>
        </tr>
        </tbody>
    </table>
</script>

<!-- info detail -->
<script id="tmp_member_detailFrm" type="text/x-handlebars-template">
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


