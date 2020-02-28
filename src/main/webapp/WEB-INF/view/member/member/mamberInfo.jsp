<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    .text_center{
        text-align: center;
    }
    .middle{
        display:table-cell;
        vertical-align:middle;
    }
    .lb_style{
        border: 1px solid #DDDDDD;
        background-color: #DCE6F2;
        height: 34px;
    }
</style>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="col-lg-12 no-padding">
            <label style="height: 30px;"> ㆍ회원상세 정보입니다. 일부 정보 수정 시 버튼 클릭하면 즉시 적용 됩니다.</label>
        </div>
        <div class="col-md-12 no-padding">
            <div class="col-md-6 no-padding">
                <div class="col-md-3" style="border: 1px solid #DDDDDD;">
                    <label class="control-label" style="border: 1px solid #DDDDDD;background-color: #DCE6F2;">프로필 이미지</label>
                </div>
                <div class="col-md-9" style="border: 1px solid #DDDDDD;">
                    <div class="input-file">
                        <form id="profileImg" method="post" enctype="multipart/form-data">
                            <img id="image_section" src="#" alt="your image" style="width: 150px;height: 150px"/>
                            <%--<input type='file' id="imgInput"/>--%>
                            <button type="button" id="bt_img" class="btn-sm pull-right">이미지초기화</button>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-md-6 no-padding">
                <div class="col-md-12 no-padding" style="border: 1px solid #DDDDDD;">
                    <div class="col-md-3 lb_style"><label>회원레벨</label></div>
                    <div class="col-md-9">
                        <form id="cob_level">
                            <select id="cob_userLevel" name="emailSelection" class="form-control">
                                <option value="9999" selected="selected">직접입력</option>
                            </select>
                        </form>
                    </div>
                </div>
                <div class="col-md-12 no-padding" style="border: 1px solid #DDDDDD;">
                    <div class="col-md-3 lb_style"><label>DJ등급</label></div>
                    <div class="col-md-9">
                        <form id="cob_grade">
                            <select id="cob_djLevel" name="emailSelection" class="form-control">
                            </select>
                        </form>
                    </div>
                </div>
                <div class="col-md-12 no-padding" style="border: 1px solid #DDDDDD;">
                    <div class="col-md-3 lb_style"><label>회원상태</label></div>
                    <div class="col-md-3"><label id="lb_status"></label></div>
                    <button type="button" id="bt_stop" class="btn-sm pull-right">사용정지</button>
                    <button type="button" id="bt_ban" class="btn-sm pull-right">강제탈퇴</button>
                </div>
                <div class="col-md-12 no-padding" style="border: 1px solid #DDDDDD;">
                    <div class="col-md-3 lb_style"><label>접속상태</label></div>
                    <div class="col-md-3"><label id="lb_loginStatus"></label></div>
                    <button type="button" id="bt_loginStatus" class="btn-sm pull-right">자세히</button>
                </div>
                <div class="col-md-12 no-padding" style="border: 1px solid #DDDDDD;">
                    <div class="col-md-3 lb_style"><label>방송상태</label></div>
                    <div class="col-md-3"><label id="lb_liveStatus"></label></div>
                </div>
            </div>
        </div>
        <div class="col-md-12 no-padding">
            <div class="col-md-6 no-padding">
                <div class="col-md-12 no-padding" style="border: 1px solid #DDDDDD;">
                    <div class="col-md-3 lb_style"><label>UserID</label></div>
                    <div class="col-md-9"><label id="lb_userId"></label></div>
                </div>
                <div class="col-md-12 no-padding" style="border: 1px solid #DDDDDD;">
                    <div class="col-md-3 lb_style"><label>소셜아이디</label></div>
                    <div class="col-md-9"><label id="lb_Id"></label></div>
                </div>
                <div class="col-md-12 no-padding" style="border: 1px solid #DDDDDD;">
                    <div class="col-md-3 lb_style"><label>연락처</label></div>
                    <div class="col-md-7"><input type="text" class="form-control" id="txt_phon" style="width: 100%"></div>
                    <button type="button" id="bt_phon" class="btn-sm pull-right">변경</button>
                </div>
                <div class="col-md-12 no-padding" style="border: 1px solid #DDDDDD;">
                    <div class="col-md-3 lb_style"><label>닉네임</label></div>
                    <div class="col-md-7"><input type="text" class="form-control" id="txt_nickName" style="width: 100%"></div>
                    <button type="button" id="bt_resatNick" class="btn-sm pull-right">변경</button>
                </div>
                <div class="col-md-12 no-padding" style="border: 1px solid #DDDDDD;">
                    <div class="col-md-3 lb_style"><label>생년월일</label></div>
                    <div class="col-md-7">
                        <div class="col-md-12 input-group date" id="date_birth">
                            <input type="text" class="form-control" id="txt_birth"><span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                        </div>
                    </div>
                    <button type="button" id="bt_birth" class="btn-sm pull-right">변경</button>
                </div>
                <div class="col-md-12 no-padding" style="border: 1px solid #DDDDDD;">
                    <div class="col-md-3 lb_style"><label>나이</label></div>
                    <div class="col-md-2"><label id="lb_age"></label></div>
                    <div class="col-md-2 lb_style"><label>성별</label></div>
                    <div class="col-md-4">
                        <label class="radio-inline"><input type="radio" name="radio_gender" value="m" checked>남자</label>
                        <label class="radio-inline"><input type="radio" name="radio_gender" value="g">여자</label>
                    </div>
                    <button type="button" id="bt_gender" class="btn-sm pull-right">변경</button>
                </div>
                <div class="col-md-12 no-padding" style="border: 1px solid #DDDDDD;">
                    <div class="col-md-3 lb_style"><label>비밀번호</label></div>
                    <div class="col-md-6"><input type="password" class="form-control" id="txt_pass"value="1234" style="width: 100%"></div>
                    <button type="button" id="bt_resatPass" class="btn-sm pull-right">비밀번호 초기화</button>
                </div>
            </div>
            <div class="col-md-6 no-padding">
                <div class="col-md-12 no-padding" style="border: 1px solid #DDDDDD;">
                    <div class="col-md-3 lb_style"><label>청취상태</label></div>
                    <div class="col-md-9"><label id="lb_listenStatus"></label></div>
                </div>
                <div class="col-md-12 no-padding" style="border: 1px solid #DDDDDD;">
                    <div class="col-md-3 lb_style"><label>매니저정보</label></div>
                    <div class="col-md-6"><label id="lb_manager"></label></div>
                    <button type="button" id="bt_manager" class="btn-sm pull-right">자세히</button>
                </div>
                <div class="col-md-12 no-padding" style="border: 1px solid #DDDDDD;">
                    <div class="col-md-3 lb_style"><label>블랙리스트</label></div>
                    <div class="col-md-6"><label id="lb_black"></label></div>
                    <button type="button" id="bt_black" class="btn-sm pull-right">자세히</button>
                </div>
                <div class="col-md-12 no-padding" style="border: 1px solid #DDDDDD;">
                    <div class="col-md-3 lb_style"><label>가입플랫폼</label></div>
                    <div class="col-md-8"><label id="lb_joinPlatform"></label></div>
                </div>
                <div class="col-md-12 no-padding" style="border: 1px solid #DDDDDD;">
                    <div class="col-md-3 lb_style"><label>회원가입일시</label></div>
                    <div class="col-md-8"><label id="lb_joinDate"></label></div>
                </div>
                <div class="col-md-12 no-padding" style="border: 1px solid #DDDDDD;">
                    <div class="col-md-3 lb_style"><label>회원탈퇴일시</label></div>
                    <div class="col-md-8"><label id="lb_cancelMb"></label></div>
                </div>
                <div class="col-md-12 no-padding" style="border: 1px solid #DDDDDD;">
                    <div class="col-md-3 lb_style"><label>최초방송일시</label></div>
                    <div class="col-md-8"><label id="lb_date"></label></div>
                </div>
            </div>
        </div>
        <div class="col-md-12 no-padding">
            <div class="col-md-6 no-padding">
                <div class="col-md-12 no-padding" style="border: 1px solid #DDDDDD;">
                    <div class="col-md-3 lb_style"><label>운영자 메모</label></div>
                    <div class="col-md-7"><textarea type="textarea" class="form-control" id="txt_adminMemo" style="width: 100%"></textarea></div>
                    <button type="button" id="bt_adminMemo" class="btn-sm pull-right">변경</button>
                </div>
            </div>
            <div class="col-md-6 no-padding">
                <div class="col-md-12 no-padding" style="border: 1px solid #DDDDDD;">
                    <div class="col-md-3 lb_style"><label>최근 정보 수정 처리일시</label></div>
                    <div class="col-md-6"><label id="lb_editDate"></label></div>
                    <button type="button" id="bt_editHistory" class="btn-sm pull-right">자세히</button>
                </div>
                <div class="col-md-12 no-padding" style="border: 1px solid #DDDDDD;">
                    <div class="col-md-3 lb_style"><label>최근 정보 수정 자</label></div>
                    <div class="col-md-8"><label id="lb_editUser"></label></div>
                </div>
            </div>
        </div>
        <div class="widget-content" id="div_info_detail">
            <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist">
                <li class="active"><a href="#infoDetail" role="tab" data-toggle="tab">상세정보</a></li>
            </ul>
            <div class="tab-content" style="padding-top: 0px;">
                <div class="tab-pane fade in active" id="detail_list">
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
                </div>     <!-- 자세히보기 -->
            </div>
        </div>
    </div>
</div>
<!-- /#page-wrapper -->

<script>
    $(document).ready(function() {
        $('#div_info_detail').hide();
        $('.input-group.date').datepicker({
            todayBtn: "linked",
            keyboardNavigation: false,
            forceParse: false,
            todayHighlight: true,
            calendarWeeks: false,
            autoclose: true,
            format: "yyyy-mm-dd",
            language: 'kr',
            maxDate:0
        }).datepicker("setDate", new Date());

        $('#date_radio').change(function() {
            if($('input[name="radio_date"]:checked').val() == "all"){               // 전체
                //$('input:checkbox[id="check_dateSel"]').prop("checked", true);
            }else if($('input[name="radio_date"]:checked').val() == "week"){        //1주일
                $('#txt_startSel').val(moment().add(-7,'d').format("YYYY-MM-DD"));
                $('#txt_endSel').val(moment().format("YYYY-MM-DD"));
            }else if($('input[name="radio_date"]:checked').val() == "month"){       // 한달
                // console.log(moment().add(-1,'M').format("YYYY-MM-DD"));
                // $('#txt_startSel').val("123123");
                $('#txt_startSel').val(moment().add(-1,'M').format("YYYY-MM-DD"));
                $('#txt_endSel').val(moment().add('M').format("YYYY-MM-DD"));
            }else{
                $('#txt_startSel').val(moment().format("YYYY-MM-DD"));
                $('#txt_endSel').val(moment().format("YYYY-MM-DD"));
            }
        });

        $('#check_dateSel').click(function () {       //기간 선택
            if ($('input[id="check_dateSel"]:checked').val() == "on") {
                $('#txt_startSel').attr("disabled", false);
                $('#txt_endSel').attr("disabled", false);
                $('#i_startSel').prop("disable", false);
                $('#i_endSel').prop("disabled", false);
            } else {
                $('#txt_startSel').attr("disabled", true);
                $('#txt_endSel').attr("disabled", true);
                $('#i_startSel').prop("disabled", true);
                $('#i_endSel').prop("disabled", true);
            }
        });

        $('#date_startSel').change(function(){
            if(Number(moment($('#txt_startSel').val()).format("YYYYMMDD")) > Number(moment($('#txt_endSel').val()).format("YYYYMMDD"))){
                $('#txt_startSel').val($('#txt_endSel').val());
            }
            if(Number(moment($('#txt_startSel').val()).format("YYYYMMDD")) > Number(moment().format('YYYYMMDD'))){
                $('#txt_startSel').val(moment().format("YYYY-MM-DD"));
            }
        });

        $('#date_birth').change(function(){
            var age = Number(moment().format("YYYY")) + 1 - Number( moment($('#txt_birth').val()).format("YYYY"));
            $("#lb_age").html(age + "세");
        });

        <!-- 버튼 -->
        $('#bt_imgChg').click(function() {				 //사진변경
        });
        $('#bt_stop').click(function() {                //사용정지
        });
        $('#bt_ban').click(function() {                 //강제탈퇴
        });
        $('#bt_loginStatus').click(function() {         //접속상태
            getInfoDetail(this.id);
        });
        $('#bt_phon').click(function() {                //휴대폰 번호 변경
        });
        $('#bt_resatNick').click(function() {           // 닉네임 변경
        });
        $('#bt_birth').click(function() {               //생일 변경
        });
        $('#bt_gender').click(function() {              //성별 변경
        });
        $('#bt_resatPass').click(function() {           //비밀번호 초기화
        });
        $('#bt_manager').click(function() {             //매니저 자세히
            getInfoDetail(this.id);
        });
        $('#bt_black').click(function() {               //블랙리스트 자세히
            getInfoDetail(this.id);
        });
        $('#bt_adminMemo').click(function() {           //운영자 메모 변경
        });
        $('#bt_editHistory').click(function() {           //운영자 메모 변경
            getInfoDetail(this.id);
        });


        <!-- 버튼 끝 -->

        $("#imgInput").change(function(){
            var file = this.files;
            if(file[0].size > 1024 * 1024 * 2){
                alert('2MB 이하 파일만 등록할 수 있습니다.\n\n' + '현재파일 용량 : ' + (Math.round(file[0].size / 1024 / 1024 * 100) / 100) + 'MB');
                return;
            }

            var formData = new FormData();
            formData.append("file",$('#imgInput')[0].files[0]);
            formData.append("uploadType","profile");
            fileUpdate("https://devphoto2.dalbitcast.com/upload",formData, fn_file_upload, fn_fail);
        });
    });

    var memNo = "";
    var obj = new Object();
    obj.level = "level";
    getAjaxData("level", "/rest/member/member/level",obj, fn_code_list_success, fn_fail);

    var obj = new Object();
    obj.level = "grade";
    getAjaxData("level", "/rest/member/member/level",obj, fn_code_list_success, fn_fail);


    var source = MemberDataTableSource["loginStatus"];
    var dtList_info_detail_data = function (data) {
        data.memNo = memNo;
    }
    dtList_info_detail = new DalbitDataTable($("#info_detail"), dtList_info_detail_data, source);
    dtList_info_detail.useCheckBox(false);
    dtList_info_detail.useIndex(true);
    dtList_info_detail.createDataTable();

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
        var data = dtList_info.getDataRow(index);
        var obj = new Object();
        obj.memNo = data.memNo;
        getAjaxData("info", "/rest/member/member/info", obj, info_sel_success, fn_fail);
    }

    function info_sel_success(dst_id, response) {
        dalbitLog(response);

        // profImgDel = "false";
        memNo = response.data.memNo;
        $("#lb_userId").html(response.data.memId);
        $("#txt_nickName").val(response.data.memNick);
        $("#txt_name").val(response.data.memName);
        $("#txt_phon").val(response.data.memPhone);
        $("#txt_eMail").val(response.data.memEmail);
        // $("#txt_pass").val(response.data.memPasswd);
        $("#cob_djLevel").val(response.data.grade);
        $("#cob_userLevel").val(response.data.level);
        $("#lb_broadCnt").html("총" + response.data.broadcastingCnt + "건");
        $("#lb_listenCnt").html("총" + response.data.listeningCnt + "건");
        $("#lb_joinDate").html(response.data.memJoinDate);
        $("#lb_editDate").html(response.data.lastUpdDate);
        $("#lb_myStarCnt").html("총" + response.data.starCnt + "건");
        $("#lb_myFanCnt").html("총" + response.data.fanCnt + "건");
        $("#lb_broadNoticeCnt").html("총" + response.data.noticeCnt + "건");
        $( "#txt_birth" ).datepicker( "setDate", response.data.birthYear + "-" + response.data.birthMonth + "-" + response.data.birthDay);
        var age = Number(moment().format("YYYY")) + 1 - Number( response.data.birthYear);
        $("#lb_age").html(age + "세");
        $("input[name=radio_gender][value=" + response.data.memSex + "]").prop("checked", true);

        $("#lb_myReportCnt").html("총" + response.data.reportCnt + "건" + "/" + "총" + response.data.reportMemCnt + "건");

        profImgDel = response.data.profileImage.url;    // 삭제 url 보내기 위함
        $("#image_section").prop("src", response.data.profileImage.url);

        if(tab_id != "false"){
            getHistoryDetail(tab_id);   // 열려있는 텝 테이블 정보 가져오기 위함
        }
        $('#div_info_detail').hide();
    }

    function edit(tmp){
        var obj = new Object();
        obj.memNo = memNo;
        obj.profileImage = profileImage;
        obj.profImgDel = profImgDel;
        obj.profileImageGrade = "5";
        getAjaxData("edit", "/rest/member/member/edit",obj, fn_edit_success, fn_fail);
    }

    // function fn_file_upload(response){
    //     var data = jQuery.parseJSON( response );
    //     profileImage = data.data.url;         // 새로 선택된 파일의 url
    //     $("#image_section").prop("src", data.data.url);
    // }
    //
    // function imageUpdate(){
    //     var formData = new FormData();
    //     formData.append("tempFileURI",profileImage);
    //     formData.append("deleteFileURI",profImgDel);
    //     console.log("imageUpdate - profileImage : " + profileImage);
    //     console.log("imageUpdate - profImgDel : " + profImgDel);
    //     fileUpdate("https://devphoto2.dalbitcast.com/done",formData, fn_file_upload, fn_fail);
    // }


    function getInfoDetail(tmp) {     // 상세보기
        $('#div_info_detail').show();
        if(tmp.indexOf("_") > 0){       // userid 클릭시 _ 없이 호출
            tmp = tmp.split("_");
            tmp = tmp[1];
        }
        var source = MemberDataTableSource[tmp];
        dtList_info_detail.changeReload(null,null,source,null);
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