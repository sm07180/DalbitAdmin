<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="col-lg-12 no-padding">
            <label style="height: 30px;"> ㆍ회원상세 정보입니다. 일부 정보 수정 시 버튼 클릭하면 즉시 적용 됩니다.</label>
        </div>
        <div class="col-md-12 no-padding">
            <div class="col-md-6 no-padding">
                <div class="col-md-3 no-padding" style="border: 1px solid #DDDDDD; background-color: #DCE6F2;">
                    <label class="control-label" style="">프로필 이미지</label>
                </div>
                <div class="col-md-9 no-padding" style="border: 1px solid #DDDDDD;">
                    <form id="profileImg" method="post" enctype="multipart/form-data">
                        <img id="image_section" src="#" alt="your image" style="width: 142px;height: 142px" data-toggle="modal" data-target="#imgModal" onclick="fullSize(this.src);"/>
                        <button type="button" id="bt_img" class="btn btn-default btn-sm  pull-right">이미지초기화</button>
                    </form>
                </div>
            </div>
            <div class="col-md-6 no-padding">
                <div class="col-md-12 no-padding" style="border: 1px solid #DDDDDD;">
                    <div class="col-md-3 lb_style"><label>회원레벨</label></div>
                    <div class="col-md-9" style="height: 34px">
                        <form id="cob_level">
                            <select id="cob_userLevel" name="emailSelection" class="form-control">
                                <option value="9999" selected="selected">직접입력</option>
                            </select>
                        </form>
                    </div>
                </div>
                <div class="col-md-12 no-padding" style="border: 1px solid #DDDDDD;">
                    <div class="col-md-3 lb_style"><label>DJ등급</label></div>
                    <div class="col-md-9" style="height: 34px">
                        <form id="cob_grade">
                            <select id="cob_djLevel" name="emailSelection" class="form-control">
                            </select>
                        </form>
                    </div>
                </div>
                <div class="col-md-12 no-padding" style="border: 1px solid #DDDDDD;">
                    <div class="col-md-3 lb_style"><label>회원상태</label></div>
                    <div class="col-md-9">
                        <label id="lb_status"></label>
                        <button class="btn btn-default btn-sm pull-right _openPop" id="bt_report" data-url="" data-width="1000" data-height="520" name="reportPop">경고/정지</button>
                    </div>
                </div>
                <div class="col-md-12 no-padding" style="border: 1px solid #DDDDDD;">
                    <div class="col-md-3 lb_style"><label>접속상태</label></div>
                    <div class="col-md-9">
                        <label id="lb_loginStatus"></label>
                        <button type="button" id="bt_loginStatus" class="btn btn-default btn-sm pull-right">자세히</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-12 no-padding">
            <div class="col-md-6 no-padding">
                <div class="col-md-12 no-padding" style="border: 1px solid #DDDDDD;">
                    <div class="col-md-3 lb_style"><label>회원번호</label></div>
                    <div class="col-md-9"><label id="lb_memNo"></label></div>
                </div>
                <div class="col-md-12 no-padding" style="border: 1px solid #DDDDDD;">
                    <div class="col-md-3 lb_style"><label>UserID</label></div>
                    <div class="col-md-9"><label id="lb_memId"></label></div>
                </div>
                <div class="col-md-12 no-padding" style="border: 1px solid #DDDDDD;">
                    <div class="col-md-3 lb_style"><label>소셜아이디</label></div>
                    <div class="col-md-9"><label id="lb_Id"></label></div>
                </div>
                <div class="col-md-12 no-padding" style="border: 1px solid #DDDDDD;">
                    <div class="col-md-3 lb_style"><label>연락처</label></div>
                    <div class="col-md-9">
                        <input type="text" class="form-control" id="txt_phon">
                        <button type="button" id="bt_phon" class="btn btn-default btn-sm pull-right">변경</button>
                    </div>
                </div>
                <div class="col-md-12 no-padding" style="border: 1px solid #DDDDDD;">
                    <div class="col-md-3 lb_style"><label>닉네임</label></div>
                    <div class="col-md-9">
                        <input type="text" class="form-control" id="txt_memNick">
                        <button type="button" id="bt_resatNick" class="btn btn-default btn-sm pull-right">변경</button>
                    </div>
                </div>
                <div class="col-md-12 no-padding" style="border: 1px solid #DDDDDD;">
                    <div class="col-md-3 lb_style"><label>생년월일</label></div>
                    <div class="col-md-9">
                        <div class="input-group date" id="date_birth">
                            <input type="text" class="form-control" id="txt_birth"><span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                        </div>
                        <button type="button" id="bt_birth" class="btn btn-default btn-sm pull-right">변경</button>
                    </div>
                </div>
                <div class="col-md-12 no-padding" style="border: 1px solid #DDDDDD;">
                    <div class="col-md-3 lb_style"><label>나이</label></div>
                    <div class="col-md-2"><label id="lb_age"></label></div>
                    <div class="col-md-2 lb_style"><label>성별</label></div>
                    <div class="col-md-5">
                        <label class="radio-inline"><input type="radio" name="radio_gender" value="m" checked>남자</label>
                        <label class="radio-inline"><input type="radio" name="radio_gender" value="g">여자</label>
                        <button type="button" id="bt_gender" class="btn btn-default btn-sm pull-right">변경</button>
                    </div>
                </div>
                <div class="col-md-12 no-padding" style="border: 1px solid #DDDDDD;">
                    <div class="col-md-3 lb_style"><label>비밀번호</label></div>
                    <button type="button" id="bt_resatPass" class="btn btn-default btn-sm">비밀번호 초기화</button>
                </div>
            </div>
            <div class="col-md-6 no-padding">
                <div class="col-md-12 no-padding" style="border: 1px solid #DDDDDD;">
                    <div class="col-md-3 lb_style"><label>방송상태</label></div>
                    <div class="col-md-3"><label id="lb_liveStatus"></label></div>
                </div>
                <div class="col-md-12 no-padding" style="border: 1px solid #DDDDDD;">
                    <div class="col-md-3 lb_style"><label>청취상태</label></div>
                    <div class="col-md-9"><label id="lb_listenStatus"></label></div>
                </div>
                <div class="col-md-12 no-padding" style="border: 1px solid #DDDDDD;">
                    <div class="col-md-3 lb_style"><label>보유달</label></div>
                    <div class="col-md-9"><label id="lb_moonCnt"></label></div>
                </div>
                <div class="col-md-12 no-padding" style="border: 1px solid #DDDDDD;">
                    <div class="col-md-3 lb_style"><label>보유별</label></div>
                    <div class="col-md-9"><label id="lb_startCnt"></label></div>
                </div>
                <div class="col-md-12 no-padding" style="border: 1px solid #DDDDDD;">
                    <div class="col-md-3 lb_style"><label>(내가/나를 등록한)<br/>매니저정보</label></div>
                    <div class="col-md-9">
                        <label id="lb_manager"></label>
                        <button type="button" id="bt_myManager" class="btn btn-default btn-sm pull-right">자세히</button>
                    </div>
                </div>
                <div class="col-md-12 no-padding" style="border: 1px solid #DDDDDD;">
                    <div class="col-md-3 lb_style"><label>(내가/나를 등록한)<br/>블랙리스트</label></div>
                    <div class="col-md-9">
                        <label id="lb_black"></label>
                        <button type="button" id="bt_myBlack" class="btn btn-default btn-sm pull-right">자세히</button>
                    </div>
                </div>
                <div class="col-md-12 no-padding" style="border: 1px solid #DDDDDD;">
                    <div class="col-md-3 lb_style"><label>가입플랫폼</label></div>
                    <div class="col-md-9"><label id="lb_joinPlatform"></label></div>
                </div>
                <div class="col-md-12 no-padding" style="border: 1px solid #DDDDDD;">
                    <div class="col-md-3 lb_style"><label>회원가입일시</label></div>
                    <div class="col-md-9"><label id="lb_joinDate"></label></div>
                </div>
            </div>
        </div>
        <div class="col-md-12 no-padding">
            <div class="col-md-6 no-padding">
                <div class="col-md-12 no-padding" style="border: 1px solid #DDDDDD;">
                    <div class="col-md-3 lb_style" style="height: 142px;"><label>운영자 메모</label></div>
                    <div class="col-md-9" style="border: 1px solid #DDDDDD;">
                        <label id="lb_adminMemoCnt">등록 : 0건</label>
                        <button type="button" id="bt_adminMemoList" class="btn btn-default btn-sm pull-right">자세히</button>
                    </div>
                    <div class="col-md-9" style="border: 1px solid #DDDDDD;">
                        <textarea type="textarea" class="form-control" id="txt_adminMemo" style="height: 110px"></textarea>
                        <button type="button" id="bt_adminMemo" class="btn btn-default btn-sm pull-right">변경</button>
                    </div>
                </div>
            </div>
            <div class="col-md-6 no-padding">
                <div class="col-md-12 no-padding" style="border: 1px solid #DDDDDD;">
                    <div class="col-md-3 lb_style"><label>회원탈퇴일시</label></div>
                    <div class="col-md-9"><label id="lb_cancelMb"></label></div>
                </div>
                <div class="col-md-12 no-padding" style="border: 1px solid #DDDDDD;">
                    <div class="col-md-3 lb_style"><label>최초방송일시</label></div>
                    <div class="col-md-9"><label id="lb_date"></label></div>
                </div>
                <div class="col-md-12 no-padding" style="border: 1px solid #DDDDDD;">
                    <div class="col-md-3 lb_style"><label>최근 정보 수정 처리일시</label></div>
                    <div class="col-md-7" style="height: 34px;border: 1px solid #DDDDDD;"><label id="lb_editDate"></label></div>
                    <div class="col-md-3 lb_style"><label>최근 정보 수정 자</label></div>
                    <div class="col-md-7" style="height: 34px;border: 1px solid #DDDDDD;"><label id="lb_editUser"></label></div>
                    <button type="button" id="bt_editHistory" class="btn btn-default btn-sm pull-right">자세히</button>
                </div>
            </div>
        </div>
        <!-- 이미지 원본 보기 -->
        <div class="modal fade" id="imgModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog" style="max-width: 100%; width: auto; display: table;">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                    <div class="modal-body">
                        <img id="image_full_size" src="#" alt="your image"/>
                    </div>
                    <div class="modal-footer">
                    </div>
                </div>
            </div>
        </div>
        <!-- detail -->
        <form id="detailForm"></form>
    </div>
</div>
<!-- /#page-wrapper -->

<script>
    $(document).ready(function() {
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
        $('#bt_img').click(function() {				 //사진변경
            bt_click(this.id);
        });
        $('#bt_phon').click(function() {                //휴대폰 번호 변경
            bt_click(this.id);
        });
        $('#bt_resatNick').click(function() {           // 닉네임 변경
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
        $('#bt_adminMemoList').click(function() {           //최근정보 수정일
            getInfoDetail(this.id,"운영자메모","");
        });
        $('#bt_loginStatus').click(function() {         //접속상태
            getInfoDetail(this.id,"접속상태","");
        });
        $('#bt_myManager').click(function() {             //매니저 자세히
            getInfoDetail(this.id,"(내가 등록한) 매니저");
        });
        $('#bt_myBlack').click(function() {               //블랙리스트 자세히
            getInfoDetail(this.id,"(내가 등록학) 블랙리스트");
        });
        $('#bt_editHistory').click(function() {           //최근정보 수정일
            getInfoDetail(this.id,"정보수정내역");
        });
        // 버튼 끝
    });

    var memNo = "";
    var obj = new Object();
    obj.level = "level";
    getAjaxData("level", "/rest/member/member/level",obj, fn_code_list_success, fn_fail);

    var obj = new Object();
    obj.level = "grade";
    getAjaxData("level", "/rest/member/member/level",obj, fn_code_list_success, fn_fail);

    function fn_code_list_success(dst_id, response){
        // dalbitLog(response);
        if(response.data[0].gubun == "level"){
            var template = $('#level_select').html();
            var templateScript = Handlebars.compile(template);
            var context = response;
            var html = templateScript(context);
            $("#cob_userLevel").append(html);
        }else if (response.data[0].gubun == "grade"){
            var template = $('#grade_select').html();
            var templateScript = Handlebars.compile(template);
            var context = response;
            var html = templateScript(context);
            $("#cob_djLevel").append(html);
        }
    }
    function getMemNo_info(index){
        $('#tabList').removeClass("hide");
        var data = dtList_info.getDataRow(index);
        var obj = new Object();
        obj.memNo = data.memNo;
        getAjaxData("info", "/rest/member/member/info", obj, info_sel_success, fn_fail);
    }
    function getMemNo_info_popup(tmp){
        var obj = new Object();
        obj.memNo = tmp;
        getAjaxData("info", "/rest/member/member/info", obj, info_sel_success, fn_fail);
    }

    function info_sel_success(dst_id, response) {
        dalbitLog(response);
        // profImgDel = "false";
        memNo = response.data[0].memNo;
        $("#lb_memNo").html(response.data[0].memNo);
        $("#lb_memId").html(response.data[0].memId);
        $("#txt_memNick").val(response.data[0].memNick);
        $("#txt_name").val(response.data[0].memName);
        $("#txt_phon").val(response.data[0].memPhone);
        $("#txt_pass").val(response.data[0].memPasswd);
        $("#cob_djLevel").val(response.data[0].grade);
        $("#cob_userLevel").val(response.data[0].level);
        $("#lb_broadCnt").html("총" + response.data[0].broadcastingCnt + "건");
        $("#lb_listenCnt").html("총" + response.data[0].listeningCnt + "건");
        $("#lb_joinDate").html(response.data[0].memJoinDate);
        $("#lb_editDate").html(response.data[0].lastUpdDate);
        $("#lb_myStarCnt").html("총" + response.data[0].starCnt + "건");
        $("#lb_myFanCnt").html("총" + response.data[0].fanCnt + "건");
        $("#lb_broadNoticeCnt").html("총" + response.data[0].noticeCnt + "건");
        $( "#txt_birth" ).datepicker( "setDate", response.data[0].birthYear + "-" + response.data[0].birthMonth + "-" + response.data[0].birthDay);
        var age = Number(moment().format("YYYY")) + 1 - Number( response.data[0].birthYear);
        $("#lb_age").html(age + "세");
        $("input[name=radio_gender][value=" + response.data[0].memSex + "]").prop("checked", true);
        $("#lb_myReportCnt").html("총" + response.data[0].reportCnt + "건" + "/" + "총" + response.data[0].reportMemCnt + "건");
        $("#image_section").prop("src", IMAGE_SERVER_URL + response.data[0].profileImage);
        $('#bt_report').data('url',"http://localhost:8081/member/member/popup/reportPopup?memNo=" + "'" +memNo + "'" + "&memNick=" + "'" + response.data[0].memNick + "'" + "&memSex=" + "'" + response.data[0].memSex+ "'");

        dtList_info_detail.reload();

        $('#div_info_detail').removeClass("show");
        $('#report_detail').removeClass("show");
        $('#question_tab').removeClass("show");
        $("#detailForm").html("");
    }
    function getInfoDetail(tmp,tmp1) {     // 상세보기
        var template = $('#tmp_detailFrm').html();
        var templateScript = Handlebars.compile(template);
        $("#detailForm").html(templateScript);

        var source = MemberDataTableSource["loginStatus"];
        var dtList_info_detail_data = function (data) {
            data.memNo = memNo;
        }
        dtList_info_detail = new DalbitDataTable($("#info_detail"), dtList_info_detail_data, source);
        dtList_info_detail.useCheckBox(false);
        dtList_info_detail.useIndex(true);
        dtList_info_detail.createDataTable();
        $('#div_info_detail').addClass("show");
        if(tmp.indexOf("_") > 0){       // userid 클릭시 _ 없이 호출
            tmp = tmp.split("_");
            tmp = tmp[1];
        }
        $('#tab_infoDetail1').text(tmp1);           //텝 이름 변경
        var source = MemberDataTableSource[tmp];
        dtList_info_detail.changeReload(null,null,source,null);

        if(tmp == "myManager" || tmp == "myBlack"){
            getInfoDetail2(tmp);
        }
    }
    function getInfoDetail2(tmp){
        $('#detail2').addClass("show");
        if(tmp == "myManager") {
            $('#tab_infoDetail2').text("(나를 등록한) 매니저");           //텝 이름 변경
            var source = MemberDataTableSource["meManager"];
            dtList_info_detail.changeReload(null,null,source,null);
        }else if(tmp == "myBlack") {
            $('#tab_infoDetail2').text("(나를 등록한) 블랙리스트");           //텝 이름 변경
            var source = MemberDataTableSource["meBlack"];
            dtList_info_detail.changeReload(null,null,source,null);
        }
    }
    function bt_click(tmp) {
        if(tmp == "bt_img"){                        //사진변경
            alert($("#lb_userId").html() + "님의 프로필 이미지가 초기화 되었습니다.");
        }else if(tmp == "bt_phon"){                 //휴대폰 번호 변경
            alert($("#lb_userId").html() + "님의 연락처가 변경되었습니다.");
        }else if(tmp == "bt_resatNick"){            // 닉네임 변경
            alert($("#lb_userId").html() + "님의 닉네임이 변경되었습니다.");
        }else if(tmp == "bt_birth"){                //생일 변경
            alert($("#lb_userId").html() + "님의 생년월일이 변경되었습니다.");
        }else if(tmp == "bt_gender"){               //성별 변경
            alert($("#lb_userId").html() + "님의 성별이 변경되었습니다.");
        }else if(tmp == "bt_resatPass"){            //비밀번호 초기화
            if(confirm($("#lb_userId").html() + "님의 비밀번호를 초기화 하여 휴대폰 연락처로 임의 비밀번호를 전송합니다. 지금 바로 전송하시겠습니까?")){
                alert("전송");
            }else{
                alert("취소");
            }
        }else if(tmp == "bt_adminMemo"){            //운영자 메모 변경
            alert("운영자 메모 등록")
        }
    }
    function fullSize(url) {     // 이미지 원래 크기
        $("#image_full_size").prop("src", url);
    }
    function fn_fail(data, textStatus, jqXHR){
        console.log(data, textStatus, jqXHR);
    }

</script>

<script id="level_select" type="text/x-handlebars-template">
    {{#data}}
    <option value="{{level}}">{{level}}레벨</option>
    {{/data}}
</script>
<script id="grade_select" type="text/x-handlebars-template">
    {{#data}}
    <option value="{{grade}}">{{grade}}</option>
    {{/data}}
</script>

<!-- info detail -->
<script id="tmp_detailFrm" type="text/x-handlebars-template">
    <div class="widget-content hide" id="div_info_detail">
        <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist">
            <li class="active" id="detail1"><a href="#infoDetail" role="tab" data-toggle="tab" id="tab_infoDetail1"></a></li>
            <li class="hide" id="detail2"><a href="#infoDetail" role="tab" data-toggle="tab" id="tab_infoDetail2"></a></li>
        </ul>
        <div class="tab-content" style="padding-top: 0px;">
            <div class="tab-pane fade in active" id="infoDetail">
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
        </div>
    </div>
</script>