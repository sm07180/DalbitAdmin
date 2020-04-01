<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div>
    <form id="memberInfoFrm"></form>
</div>

<!-- 이미지 원본 보기 -->
<div class="modal fade" id="imgModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="max-width: 100%; width: auto; display: table;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body">
                <img id="image_full_size" src="#" alt="your image" style="max-width: 1000px;max-height: 1000px;">
            </div>
            <div class="modal-footer">
            </div>
        </div>
    </div>
</div>
<!-- detail -->
<form id="detailForm" class="hide"></form>

<script type="text/javascript" src="/js/code/member/memberCodeList.js"></script>
<script type="text/javascript" src="/js/code/customer/customerCodeList.js"></script>

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
        var html=templateScript(context);
        $("#memberInfoFrm").html(html);
        init();

        $("#image_section").prop("src", common.profileImage(IMAGE_SERVER_URL,response.data.profileImage,response.data.memSex));
        $("#txt_birth").val(response.data.birthDate.substr(0, 10));
        $("#memSlct").html(util.renderSlct(response.data.memSlct,"20"));
        report = "../member/popup/reportPopup?memNo=" + "'" + response.data.mem_no + "'" + "&memNick=" + "'" + response.data.nickName + "'" + "&memSex=" + "'" + response.data.memSex + "'";

        $('#div_info_detail').removeClass("show");
        $('#report_detail').removeClass("show");
        $('#question_tab').removeClass("show");
        $("#detailForm").html("");
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
        $('#bt_adminMemoList').click(function() {       //운영자 메모 정보
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
        $('#bt_editHistory').click(function() {           //최근정보 수정일
            getInfoDetail(this.id,"정보수정내역");
        });
        $('#bt_report').click(function() {           //최근정보 수정일
            reportPopup();
        });
        // 버튼 끝
    }

    function fullSize(url) {     // 이미지 full size
        $("#image_full_size").prop("src", url);
    }

    var tmp_bt;
    function bt_click(tmp) {
        tmp_bt = tmp;
        console.log($("#"+tmp).data('nickname'));
        if(memNo == "unknown"){
            alert("변경대상 회원을 선택해 주십시오.");
            return;
        }
        if(tmp == "bt_adminMemo") {            //운영자 메모 변경
            if ($("#txt_adminMemo").val() == "" || $("#txt_adminMemo").val() == null) {
                alert("등록할 운영자 메모를 입력해 주십시오.");
                return;
            }
            getInfoDetail("bt_adminMemoList", "운영자메모");
            var obj = new Object();
            obj.mem_no = memNo;
            obj.memo = $("#txt_adminMemo").val();
            util.getAjaxData("adminMemoAdd", "/rest/member/member/adminMemoAdd", obj, update_success, fn_fail);
        }else{
            var obj = new Object();
            obj.mem_no = memNo;
            if(tmp == "bt_img"){                        //사진초기화
                obj.memSex = $('input[name="memSex"]:checked').val();
                obj.photoUrl = IMAGE_SERVER_URL;
            }else if(tmp == "bt_resatPass"){            //비밀번호 초기화
                if ($("#"+tmp).data('nickname') + "님의 비밀번호를 초기화 하여 휴대폰 연락처로 임의 비밀번호를 전송합니다. 지금 바로 전송하시겠습니까?") {
                    obj.passwdReset = $("#lb_memId").html();
                }else{
                    return;
                }
            }else if(tmp == "bt_resatNick"){
                obj.nickName = $("#txt_memNick").val();     //0
            }else if(tmp == "bt_phon"  || tmp == "bt_birth" || tmp == "bt_gender"){
                var tmp_phone = $("#txt_phon").val().replace(/-/gi,"");
                if(tmp_phone.length > 11 || tmp_phone.length < 10){
                    alert("전화번호를 정확히 입력해 주십시오.");
                    return;
                }
                obj.phoneNum = tmp_phone;                   //0
                obj.birthDate = $("#txt_birth" ).val();
                obj.memSex = $('input[name="memSex"]:checked').val();
            }
            util.getAjaxData("editor", "/rest/member/member/editor", obj, update_success, fn_fail);
        }
    }

    function update_success(dst_id, response) {
        dalbitLog(response);
        if (tmp_bt == "bt_img") {                        //사진변경
            alert($("#"+tmp_bt).data('nickname') + "님의 프로필 이미지가 초기화 되었습니다.");
        } else if (tmp_bt == "bt_phon") {                 //휴대폰 번호 변경
            alert($("#"+tmp_bt).data('nickname') + "님의 연락처가 변경되었습니다.");
        } else if (tmp_bt == "bt_resatNick") {            // 닉네임 변경
            if(response == "0"){
                alert("닉네임 중복");
            }else{
                alert($("#"+tmp_bt).data('nickname') + "님의 닉네임이 변경되었습니다.");
            }
        } else if (tmp_bt == "bt_birth") {                //생일 변경
            alert($("#"+tmp_bt).data('nickname') + "님의 생년월일이 변경되었습니다.");
        } else if (tmp_bt == "bt_gender") {               //성별 변경
            alert($("#"+tmp_bt).data('nickname') + "님의 성별이 변경되었습니다.");
        } else if (tmp_bt == "bt_resatPass") {            //비밀번호 초기화
            alert($("#"+tmp_bt).data('nickname') + "님의 비밀번호가 초기화 되었습니다.");
        }

        if (dst_id == "adminMemoAdd") {
            dtList_info_detail.reload();
            // getMemNo_info_reload(memNo);
        } else {
            getMemNo_info_reload(memNo);
        }
    }

    function getMemNo_info_reload(memNo){
        console.log("memNo : "  + memNo);
        var obj = new Object();
        obj.mem_no =  memNo;
        util.getAjaxData("info", "/rest/member/member/info", obj, info_sel_success, fn_fail);
    }

    function reportPopup(){
        util.windowOpen(report,"1000","720","경고/정지");
    }

    function getInfoDetail(tmp,tmp1) {     // 상세보기
        var template = $('#tmp_detailFrm').html();
        var templateScript = Handlebars.compile(template);
        $("#detailForm").html(templateScript);

        $('#tab_memberInfoDetail').text(tmp1);           //텝 이름 변경
        $('#detailForm').addClass("show");
        if(tmp.indexOf("_") > 0){ tmp = tmp.split("_"); tmp = tmp[1]; }
        console.log("tmp : " + tmp);

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
                    <img id="image_section" src="#" alt="your image" style="width: 150px;height: 150px" data-toggle="modal" data-target="#imgModal" onclick="fullSize(this.src);"/>
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
                {{#equal memState '1'}}정상{{/equal}}
                {{#equal memState '2'}}블럭{{/equal}}
                {{#equal memState '3'}}탈퇴{{/equal}}
                <button type="button" class="btn btn-default btn-sm pull-right" id="bt_report">경고/정지</button>
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
            <th>소셜아이디</th>
            <td colspan="3" style="text-align: left">{{socialId}}</td>
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
                <input type="text" class="form-control" id="txt_memNick" style="width: 90%;" value="{{nickName}}">
                <button type="button" id="bt_resatNick" class="btn btn-default btn-sm pull-right" data-memno="{{mem_no}}" data-nickname="{{nickName}}">변경</button>
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
            <td colspan="3" style="text-align: left"><button type="button" id="bt_resatPass" class="btn btn-default btn-sm">초기화</button></td>
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
<script id="tmp_detailFrm" type="text/x-handlebars-template">
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


