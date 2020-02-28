<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    .text_center{
        text-align: center;
    }
    .text_middle{
        display:table-cell;
        vertical-align:middle
    }
    .p_10{
        padding-top: 10px;
        padding-bottom: 10px;
        padding-left: 10px;
        padding-right: 10px;
    }
</style>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="row col-lg-12 form-inline " style="padding-top: 2px;">
                <label class="text_center text_middle" style="font-weight: bold;font-size: 13px;color: #ffffff;background: #3e3e3e;width: 80px;height: 27px"> 회원검색 </label>
                <hr style="border:solid 1px ;margin-top: 0px;margin-bottom: 3px;color: #0d6aad">
            </div>
            <div class="row col-lg-12 form-inline " style="padding-top: 2px;" >
                <div class="col-lg-6 p_10" style="background: #f8efc0">
                    <div class="col-lg-12" >
                        <label style="font-weight: bold">회원가입/탈퇴기간</label>
                    </div>
                    <div class="col-lg-12">
                        <form id="date_radio">
                            <label class="radio-inline"><input type="radio" name="radio_date" value="all" checked>전체</label>
                            <label class="radio-inline"><input type="radio" name="radio_date" value="today">오늘</label>
                            <label class="radio-inline"><input type="radio" name="radio_date" value="week">1주일</label>
                            <label class="radio-inline"><input type="radio" name="radio_date" value="month">한달</label>
                        </form>
                    </div>
                    <div class="col-lg-12">
                        <label class="checkbox-inline"><input type="checkbox" id="check_dateSel">기간 선택</label>
                        <div class="input-group date col-lg-4" id="date_startSel">
                            <input type="text" class="form-control" id="txt_startSel" disabled><span class="input-group-addon"><i class="glyphicon glyphicon-calendar" id="i_startSel"></i></span>
                        </div>
                        <label>~</label>
                        <div class="input-group date col-lg-4" id="date_endSel">
                            <input type="text" class="form-control" id="txt_endSel" disabled><span class="input-group-addon"><i class="glyphicon glyphicon-calendar" id="i_endSel"></i></span>
                        </div>
                    </div>
                </div>
                <div class="row col-lg-6 form-inline p_10">
                    <div class="col-lg-12 " >
                        <div class="col-lg-12">
                            <label style="font-weight: bold">로그인된 아이콘</label>
                        </div>
                    </div>
                    <div class="row col-lg-12 form-inline" >
                        <div class="col-lg-12">
                            <select class="form-control" name="selectGubun">
                                <option value="9999" selected="selected">전체</option>
                                <option value="1">User ID</option>
                                <option value="2">User 닉네임</option>
                                <option value="3">연락처</option>
                                <option value="4">이름</option>
                            </select>

                            <label><input type="text" class="form-control" id="txt_search"></label>
                            <button type="submit" class="btn btn-default" id="bt_search">검색</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row col-lg-12 form-inline " style="padding-top: 2px;">
                <label class="text_center text_middle" style="font-weight: bold;font-size: 13px;color: #ffffff;background: #3e3e3e;width: 100px;height: 27px"> 검색 결과 정보 </label>
                <label class="text_middle" style="font-size: 11px;height: 27px;width: 300px"> ㆍ회원 아이디를 클릭하시면 상세정보를 확인할 수 있습니다. </label>
                <hr style="border:solid 1px ;margin-top: 0px;margin-bottom: 3px;color: #0d6aad">
            </div>
            <!-- DATA TABLE -->
            <div class="row col-lg-12 form-inline">
                <div class="widget widget-table">
                    <div class="widget-content">
                        <table id="list_info" class="table table-sorting table-hover table-bordered">
                            <span>
                                <button class="btn btn-default" type="button" id="excelDownBtn"><i class="fa"></i>Excel Print</button>
                                <button class="btn btn-default" type="button" id="excelBtn"><i class="fa"></i>Excel</button>
                            </span>
                            <thead>
                            </thead>
                            <tbody id="tableBody">
                            </tbody>
                        </table>
                        <%--<body>--%>
                        <%--<div id="paging"></div>--%>
                        <%--</body>--%>
                        <%--<div class="row text-center" id="list_info_wrapper">--%>
                        <%--<ul class="pagination">--%>
                        <%--</ul>--%>
                        <%--</div>--%>
                    </div>
                </div>
            </div>
            <!-- DATA TABLE END -->
            <div class="row col-lg-12 form-inline " style="padding-top: 2px; padding-bottom: 0px;">
                <div class="col-lg-1 no-padding">
                    <label class="text_center text_middle" style="font-weight: bold;font-size: 13px;color: #ffffff;background: #3e3e3e;width: 120px;height: 27px"> 검색 상세 정보 </label>
                </div>
                <div class="col-lg-4 no-padding">
                    <label class="text_middle" style="font-size: 11px;height: 27px;"> ㆍ회원 상세 정보는 [수정하기] 버튼을 통해 변경이 가능합니다.</label>
                </div>
                <div class="col-lg-7 no-padding">
                    <button type="button" id="bt_edite" class="pull-right btn-xs form-control"  style="border-radius:3px;width: 80px;;height: 24px">수정하기</button>
                </div>
            </div>
            <div class="row col-lg-12 form-inline" style="padding-top: 0px;">
                <hr style="border:solid 1px ;margin-top: 0px;margin-bottom: 3px;color: #0d6aad">
            </div>
            <div class="widget-content">
                <div class="form-horizontal">
                    <div class="col-md-12 no-padding" >
                        <div class="col-md-6">
                            <label class="col-md-4 control-label">프로필 이미지</label>
                            <div class="col-md-8">
                                <div class="input-file">
                                    <input type='file' id="imgInput"/>
                                    <img id="image_section" src="#" alt="your image" style="width: 150px;height: 150px"/>
                                    <%--<img src="/template2/assets/img/profile-avatar.png" alt="Profile Picture" style="height:150px;width: 150px">--%>
                                    <%--<div id='View_area' style='position:relative; width: 150px; height: 150px; color: black; border: 0px solid black; dispaly: inline; '></div>--%>
                                    <%--<input type="file" name="profile_pt" id="profile_pt" onchange="previewImage(this,'View_area')">--%>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label class="col-md-4">회원레벨</label>
                            <div class="col-md-8">
                                <form id="cob_level">
                                    <select id="cob_userLevel" name="emailSelection" class="form-control">
                                        <option value="9999" selected="selected">직접입력</option>
                                    </select>
                                </form>
                            </div>
                            <label class="col-md-4">DJ등급</label>
                            <div class="col-md-8">
                                <form id="cob_grade">
                                    <select id="cob_djLevel" name="emailSelection" class="form-control">
                                    </select>
                                </form>
                            </div>
                            <label class="col-md-4">청취자 등급</label>
                            <div class="col-md-8">
                                <select id="cob_lisLevel" name="emailSelection" class="form-control">
                                    <option value="normal">일반청취자</option>
                                    <option value="best">베스트 청취자</option>
                                </select>
                            </div>
                            <label class="col-md-4">접속상태</label>
                            <div class="col-md-8">
                                <form id="login_radio">
                                    <label class="radio-inline"><input type="radio" name="radio_login" value="option1" checked="true">Login</label>
                                    <label class="radio-inline"><input type="radio" name="radio_login" value="option2">Logout</label>
                                </form>
                            </div>
                            <label class="col-md-4">생방상태</label>
                            <div class="col-md-8">
                                <form id="live_radio">
                                    <label class="radio-inline"><input type="radio" name="radio_liveOn" value="option1" checked="true">생방중</label>
                                    <label class="radio-inline"><input type="radio" name="radio_liveOn" value="option2">방송OFF</label>
                                    <%--<div class="col-md-3">--%>
                                    <button type="button" id="bt_liveSms" class="btn-sm pull-right">메시지발송</button>
                                    <%--</div>--%>
                                </form>
                            </div>
                            <label class="col-md-4">청취상태</label>
                            <div class="col-md-8">
                                <form id="listen_radio">
                                    <label class="radio-inline"><input type="radio" name="radio_listenOn" value="option1" checked="true">청취중</label>
                                    <label class="radio-inline"><input type="radio" name="radio_listenOn" value="option2">청취OFF</label>
                                    <button type="button" id="bt_listenSms" class="btn-sm pull-right">메시지발송</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 no-padding">
                        <div class="col-md-6">
                            <div class="col-md-12 no-padding">
                                <label class="col-md-4">UserID</label>
                                <div class="col-md-8"><label id="lb_userId"></label></div>
                            </div>
                            <div class="col-md-12 no-padding">
                                <label class="col-md-4">연락처</label>
                                <div class="col-md-5"><input type="text" class="form-control" id="txt_phon"></div>
                                <div class="col-md-3">
                                    <button type="button" id="bt_phon" class="btn-sm pull-right">인증번호전송</button>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label class="col-md-4 control-label">가입플랫폼<br />(첫 연동일)</label>
                            <div class="col-md-8">
                                <div></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 no-padding">
                        <div class="col-md-6">
                            <label class="col-md-4">닉네임</label>
                            <div class="col-md-5"><input type="text" class="form-control" id="txt_nickName"></div>
                            <div class="col-md-3">
                                <button type="button" id="bt_resatNick" class="btn-sm pull-right">닉네임 초기화</button>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label class="col-md-4">회원가입일시</label>
                            <div class="col-md-8">
                                <label id="lb_joinDate"></label>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 no-padding">
                        <div class="col-md-6">
                            <label class="col-md-4">생년월일</label>
                            <div class="col-md-8">
                                <div class="col-md-12 input-group date" id="date_birth">
                                    <input type="text" class="form-control" id="txt_birth"><span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label class="col-md-4">회원탈퇴일시</label>
                            <div class="col-md-8">
                                <label id="lb_cancelMb"></label>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 no-padding">
                        <div class="col-md-6">
                            <label class="col-md-4">나이</label>
                            <div class="col-md-2">
                                <label id="lb_age"></label>
                            </div>
                            <label class="col-md-2">성별</label>
                            <div class="col-md-4">
                                <label class="radio-inline"><input type="radio" name="radio_gender" value="m" checked>남자</label>
                                <label class="radio-inline"><input type="radio" name="radio_gender" value="g">여자</label>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label class="col-md-4">최근 정보 수정일시</label>
                            <div class="col-md-8">
                                <label id="lb_editDate"></label>
                                <button type="button" id="bt_editDateHistory" class="btn-xs pull-right">세부내역</button>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 no-padding">
                        <div class="col-md-6">
                            <label class="col-md-4">비밀번호</label>
                            <div class="col-md-5"><input type="password" class="form-control" id="txt_pass" value="1234"></div>
                            <div class="col-md-3"><button type="button" id="bt_resatPass" class="btn-sm pull-right">비밀번호 초기화</button></div>
                        </div>
                        <div class="col-md-6">
                            <label class="col-md-4">최근 정보 수정 처리자</label>
                            <div class="col-md-8">
                                <label id="lb_editUser"></label>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 no-padding">
                        <div class="col-md-6">
                            <label class="col-md-4">방송기록</label>
                            <div class="col-md-8">
                                <label id="lb_broadCnt">총0건</label>
                                <button type="button" id="bt_broadHistory" class="btn-xs pull-right">세부내역</button>
                                <%--<a class="btn btn-xs pull-right" id="bt_broadHistory" data-toggle="collapse" href="#detail" role="button" aria-expanded="false" aria-controls="detail">--%>
                                <%--세부내역--%>
                                <%--</a>--%>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label class="col-md-4">MyStar</label>
                            <div class="col-md-8">
                                <label id="lb_myStarCnt">총0건</label>
                                <button type="button" id="bt_registMyStarList" class="btn-xs pull-right">세부내역</button>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 no-padding">
                        <div class="col-md-6">
                            <label class="col-md-4">청취기록</label>
                            <div class="col-md-8">
                                <label id="lb_listenCnt">총0건</label>
                                <button type="button" id="bt_listenHistory" class="btn-xs pull-right">세부내역</button>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label class="col-md-4">Fan</label>
                            <div class="col-md-8">
                                <label id="lb_myFanCnt">총0건</label>
                                <button type="button" id="bt_registMyFanlist" class="btn-xs pull-right">세부내역</button>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 no-padding">
                        <div>
                            <div class="col-md-6">
                                <div class="col-md-12 no-padding">
                                    <div class="col-md-2">개인결제 정보</div>
                                    <div class="col-md-10 no-padding">
                                        <div class="col-md-12">
                                            <div class="col-md-3">결제/환불</div>
                                            <div class="col-md-9 no-padding">
                                                <label id="lb_payCnt">총0건</label>
                                                <button type="button" id="bt_payHistory" class="btn-xs pull-right">세부내역</button>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="col-md-3">교환/선물</div>
                                            <div class="col-md-9 no-padding">
                                                <label id="lb_giftCnt">총0건</label>
                                                <button type="button" id="bt_giftHistory" class="btn-xs pull-right">세부내역</button>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="col-md-3">환전</div>
                                            <div class="col-md-9 no-padding">
                                                <label id="lb_exchangeCnt">총0건</label>
                                                <button type="button" id="bt_exchangeHistory" class="btn-xs pull-right">세부내역</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12 no-padding">
                                    <div class="col-md-4">최근 접속 플랫폼</div>
                                    <div class="col-md-8">
                                        <label id="lb_platform"></label>
                                        <button type="button" id="bt_platform" class="btn-xs pull-right">세부내역</button>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="col-md-2">공지</div>
                                <div class="col-md-10 no-padding">
                                    <div class="col-md-12 no-padding">
                                        <div class="col-md-3">개인공지</div>
                                        <div class="col-md-9">
                                            <label id="lb_noticeCnt">총0건</label>
                                            <button type="button" id="bt_myNotice" class="btn-xs pull-right">세부내역</button>
                                        </div>
                                    </div>

                                    <div class="col-md-12 no-padding">
                                        <div class="col-md-3">방송중공지</div>
                                        <div class="col-md-9">
                                            <label id="lb_broadNoticeCnt">총0건</label>
                                            <button type="button" id="bt_broadNotice" class="btn-xs pull-right">세부내역</button>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-2">신고</div>
                                <div class="col-md-10 no-padding">
                                    <div class="col-md-12 no-padding">
                                        <div class="col-md-3">내가/나를 신고한 정보</div>
                                        <div class="col-md-9">
                                            <label id="lb_myReportCnt">총0건/총0건</label>
                                            <button type="button" id="bt_registReport" class="btn-xs pull-right">세부내역</button>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12 no-padding">
                                    <div class="col-md-4">1:1 문의</div>
                                    <div class="col-md-8">
                                        <label id="lb_response"></label>
                                        <button type="button" id="bt_response" class="btn-xs pull-right">세부내역</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row col-lg-12 form-inline" id="detail" style="padding-top: 2px;">
                    <label class="text_center text_middle" id="detail_label" style="font-weight: bold;font-size: 13px;color: #ffffff;background: #3e3e3e;width: 110px;height: 27px"> 세부내역 </label>
                    <label class="text_middle" id="detail_comments" style="font-size: 11px;height: 27px"></label>
                    <hr style="border:solid 1px ;margin-top: 0px;margin-bottom: 3px;color: #0d6aad">
                    <!-- DATA TABLE -->
                    <div class="col-lg-12 no-padding">
                        <div class="widget widget-table">
                            <div class="widget-content">
                                <table id="list_info_detail" class="table table-sorting table-hover table-bordered datatable">
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
        </div>
    </div>
    <!-- /#page-wrapper -->
</div>
<!-- /#wrapper -->


<script>
    $(document).ready(function() {

        $('#detail').hide();
        init("new");
        // $('#list_info').DataTable();

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

        $('input[id="txt_search"]').keydown(function() {
            if (event.keyCode === 13) {
                getUserInfo(0,10);
            };
        });

        $('#date_birth').change(function(){
            if($('#bt_edite').text() == "수정완료"){
                var age = Number(moment().format("YYYY")) + 1 - Number( moment($('#txt_birth').val()).format("YYYY"));
                $("#lb_age").html(age + "세");
            }
        });

        <!-- 버튼 -->
        $('#bt_search').click( function() {       //검색
            getUserInfo(0,10,1);
        });
        $('#bt_edite').click( function() {                //    수정하기
            if($('#bt_edite').text() == "수정하기"){
                edit("edit");
            }else if($('#bt_edite').text() == "수정완료"){
                edit("edit_complet");
            }
        });
        $('#bt_imgChg').click(function() {					//   사진변경
        });
        $('#bt_resatPass').click(function() {				//   비밀번호초기화
        });
        $('#bt_phon').click(function() {				    //   인증번호전송
            if($('#bt_phon').text() == "인증번호전송"){
                authenNum("submit");
            }else if($('#bt_phon').text() == "재발송"){
                authenNum("re_submit");
            }
        });
        $('#bt_broadHistory').click(function() {		    //   방송기록세부내역
            getHistoryDetail("broadHistory");
        });
        $('#bt_listenHistory').click(function() {		    //   청취기록세부내역
            getHistoryDetail("listenHistory");
        });
        $('#bt_payHistory').click(function() {			    //   결제/환불정보
            getHistoryDetail("payHistory");
        });
        $('#bt_giftHistory').click(function() {			//   교환/선물정보
            getHistoryDetail("giftHistory");
        });
        $('#bt_exchangeHistory').click(function() {	    //   환전정보
            getHistoryDetail("exchangeHistory");
        });
        $('#bt_platform').click(function() {				//   접속플랫폼
            getHistoryDetail("platformHistory");
        });
        $('#bt_registMyStarList').click(function() {	    //   mystart
            getHistoryDetail("myStarHistory");
        });
        $('#bt_registMyFanlist').click(function() {		//   fan
            getHistoryDetail("myFanHistory");
        });
        $('#bt_myNotice').click(function() {				//   개인공지
            getHistoryDetail("noticeHistory");
        });
        $('#bt_broadNotice').click(function() {			//   방송중공지
            getHistoryDetail("noticeHistory");
        });
        $('#bt_registReport').click(function() {		    //   내가신고한정보
            getHistoryDetail("reportHistory");
        });
        $('#bt_response').click(function() {				//   1:1문의정보
            getHistoryDetail("responseHistory");
        });
        $('#bt_editDateHistory').click(function() {		//   최근정보 수정 일시
            getHistoryDetail("editDateHistory");
        });
        <!-- 버튼 끝 -->
    });

    var memNo = "";
    function init(tmp){
        getUserInfo(0,10);
        getLevelData();
        getGradeData();

        $('#bt_edite').text('수정하기');
        $("input[id='txt_phon'] ,input[id='txt_nickName'] ,input[id='txt_birth'] ,input[id='txt_pass']").attr('readonly', true);
        $("select[id='cob_userLevel'],select[id='cob_djLevel'],select[id='cob_lisLevel']").attr("disabled", "disabled");
        $("[name='radio_login']:not(:checked),[name='radio_liveOn']:not(:checked),[name='radio_listenOn']:not(:checked),[name='radio_gender']:not(:checked)").attr("disabled", "disabled");
        $('#bt_phon').hide();
        $('#bt_resatNick').hide();
        $('#bt_listenSms').hide();
        $('#bt_resatPass').hide();
        $('#bt_liveSms').hide();
        $('#imgInput').hide();
    }

    function edit(tmp){

        if (tmp == "edit_complet"){
            alert("@")

            //
            // var form = jQuery("#ajaxFrom")[0];
            // var formData = new FormData(form);
            // formData.append("message", "ajax로 파일 전송하기");
            // formData.append("file", jQuery("#imgInput")[0].files[0]);
            //
            // alert(formData);

        }

        if(tmp == "edit") {
            $('#bt_edite').text('수정완료');
            $("input[id='txt_phon'] ,input[id='txt_nickName'] ,input[id='txt_birth'] ,input[id='txt_pass']").removeAttr('readonly', false);
            $("select[id='cob_userLevel'],select[id='cob_djLevel'],select[id='cob_lisLevel']").removeAttr("disabled", "");
            $("[name='radio_login']:not(:checked),[name='radio_liveOn']:not(:checked),[name='radio_listenOn']:not(:checked),[name='radio_gender']:not(:checked)").removeAttr("disabled", "");
            $('#bt_phon').show();
            $('#bt_resatNick').show();
            $('#bt_listenSms').show();
            $('#bt_resatPass').show();
            $('#bt_liveSms').show();
            $('#imgInput').show();
        }else if (tmp == "edit_complet") {
            $('#bt_edite').text('수정하기');
            $("input[id='txt_phon'] ,input[id='txt_nickName'] ,input[id='txt_birth'] ,input[id='txt_pass']").attr('readonly', true);
            $("select[id='cob_userLevel'],select[id='cob_djLevel'],select[id='cob_lisLevel']").attr("disabled", "disabled");
            $("[name='radio_login']:not(:checked),[name='radio_liveOn']:not(:checked),[name='radio_listenOn']:not(:checked),[name='radio_gender']:not(:checked)").attr("disabled", "disabled");
            $('#bt_phon').hide();
            $('#bt_resatNick').hide();
            $('#bt_listenSms').hide();
            $('#bt_resatPass').hide();
            $('#bt_liveSms').hide();
            $('#imgInput').hide();
        }
    }
    function authenNum(tmp){
        if(tmp == "submit"){
            $('#bt_phon').text('재발송');
        }else if(tmp == "re_submit") {
            $('#bt_phon').text('인증번호전송');
        }
    }
    function getLevelData(){
        var obj = new Object();
        obj.level = "level";
        getAjaxData("level", "/rest/member/member/level",obj, fn_code_list_success, fn_fail);
    }
    function getGradeData(){
        var obj = new Object();
        obj.level = "grade";
        getAjaxData("level", "/rest/member/member/level",obj, fn_code_list_success, fn_fail);
    }
    var StCnt;
    var EdCnt;
    var dtList_info = "false";          /* 초기 조회인지 구분하기 위한 switch*/
    var SelPage = 1;
    function getUserInfo(StartCnt,EndCnt,selectedPage){                 // 검색
        StCnt = StartCnt;
        EdCnt = EndCnt;
        SelPage = nvl(selectedPage,1);
        tmp_search = $('#txt_search').val();
        tmp_date = $('input[name="radio_date"]:checked').val();
        tmp_gubun = $("select[name='selectGubun']").val();
        tmp_checkDate = $("input:checkbox[id='check_dateSel']").is(":checked");
        tmp_stDate = $('#txt_startSel').val();
        tmp_edDate = $('#txt_endSel').val();

        var dtList_info_data = function ( data ) {
            data.search = $('#txt_search').val();                        // 검색명
            data.date = $('input[name="radio_date"]:checked').val();     // 기간 radio
            data.gubun = $("select[name='selectGubun']").val();          // 검색 조건
            data.checkDate = $("input:checkbox[id='check_dateSel']").is(":checked");                       // 기간선택 여부
            data.stDate = $('#txt_startSel').val();                      // 검색일 시작
            data.edDate = $('#txt_endSel').val();                        // 검색일 끝
            data.startCnt = StCnt;          // 시작 단위 0,10,20,30~
            data.endCnt = EndCnt;           // 보여질 개수 3,5,10
        };
        if(dtList_info != "false"){
            dtList_info.reload();
        }else{
            dtList_info = new DalbitDataTable($("#list_info"), dtList_info_data, MemberDataTableSource.userInfo);
            dtList_info.useCheckBox(false);
            dtList_info.useIndex(false);
            // dtList_info.setEventClick(test01,0);
            dtList_info.createDataTable();
        }
    }
    // function pagingSet(){
    //     $('#list_cnt').html("검색 결과 총" + dtList_info.getDataRow(0).totalCnt + "건");
    //     new dataTablePaging($("#list_info"),dtList_info.getDataRow(0).totalCnt, dtList_info.getSource().pageLength ,EdCnt,SelPage,getUserInfo);
    // paging(dtList_info.getDataRow(0).totalCnt, dataPerPage, pageCount, selectedPage);
    // }
    // function test01(t1, t2 ,t3) {
    //     dalbitLog("=-----");
    //     dalbitLog(t1);
    //     dalbitLog(t2);
    //     dalbitLog(t3);
    //     paging(dtList_info.getDataRow(0).totalCnt, 10, 5, 1);
    //     dtList_info.createPage(dtList_info.getDataRow(0).totalCnt,EdCnt);
    //     dalbitLog("-----=");
    // }

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

    function info_sel_success(dst_id, response) {
        dalbitLog(response);

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

        $("#tableTop_detail").empty();
        $("#tableBody_detail").empty();
    }

    function getMemNo_info(index){
        var data = dtList_info.getDataRow(index);
        var obj = new Object();
        obj.mem_no = data.memNo;
        getAjaxData("info", "/rest/member/member/info", obj, info_sel_success, fn_fail);
    }

    var dtList_info_detail;
    function getHistoryDetail() {     // 상세보기
        if (memNo == "") {
            alert("회원ID를 선택하세요.");
        }else{
            var source = MemberDataTableSource[tmp];
            $('#detail').show();
            $("#detail_label").html(source.title);
            $("#detail_comments").html(source.comments);
            var dtList_info_detail_data = function (data) {
                data.mem_no = memNo;
            }
            if (isEmpty(dtList_info_detail)) {
                dtList_info_detail = new DalbitDataTable($("#list_info_detail"), dtList_info_detail_data, source);
                dtList_info_detail.useCheckBox(false);
                dtList_info_detail.useIndex(true);
                dtList_info_detail.createDataTable();
            } else {
                dtList_info_detail.changeReload(null, null, source);
            }
        }
    }
    function Broad(index){
        var data = dtList_info_detail.getDataRow(index);
        var roomNo = data.roomNo;
        console.log('종료된 방송 상세정보 새창 오픈~ roomNo : ' + roomNo);
    }
    function Listen(index){
        var data = dtList_info_detail.getDataRow(index);
        var roomNo = data.roomNo;
        console.log('종료된 청취 방송 상세정보 새창 오픈~ roomNo : ' + roomNo);
    }
    function MyStar(index){
        var data = dtList_info_detail.getDataRow(index);
        var memNo = data.memNo;
        console.log('MyStar 해제~ memNo : ' + memNo);
    }
    function Fan(index){
        var data = dtList_info_detail.getDataRow(index);
        var memNo = data.memNo;
        console.log('Fan 해제~ memNo : ' + memNo);
    }
    function Notice(index){
        var data = dtList_info_detail.getDataRow(index);
        var roomNo = data.roomNo;
        console.log('공지사항 삭제~ roomNo : ' + roomNo);
    }
    function Report(index){
        var data = dtList_info_detail.getDataRow(index);
        var idx = data.idx;
        var reportId = data.reportId;
        var reportMemId = data.reportMemId;
        console.log("신고대상 삭제~ idx: " + idx + " reportId: " + reportId + " reportMemId:" + reportMemId);
    }
    function fn_fail(data, textStatus, jqXHR){
        console.log(data, textStatus, jqXHR);
        // $('#list_info_detail').DataTable().draw();
    }

    /*=============엑셀==================*/
    $('#excelDownBtn').on('click', function(){
        var formElement = document.querySelector("form");
        var formData = new FormData(formElement);

        formData.append("search", tmp_search);
        formData.append("date", tmp_date);
        formData.append("gubun", tmp_gubun);
        formData.append("checkDate", tmp_checkDate);
        formData.append("stDate", tmp_stDate);
        formData.append("edDate", tmp_edDate);
        /*formData.append("test003", "test003");*/
        excelDownload($(this), "/rest/member/member/listExcel", formData, fn_success_excel, fn_fail_excel)
    });

    $("#excelBtn").on("click", function () {
        $("#list_info").table2excel({
            exclude: ".noExl",
            name: "Excel Document Name",
            filename: "report" +'.xls', //확장자를 여기서 붙여줘야한다.
            fileext: ".xls",
            exclude_img: true,
            exclude_links: true,
            exclude_inputs: true
        });
    });

    function fn_success_excel(){
        console.log("fn_success_excel");
    }

    function fn_fail_excel(){
        console.log("fn_fail_excel");
    }
    /*==================================*/

    // var tmp_sw="true";
    // $('#cob_mail').change(function () {
    //     var tmp = $('#cob_mail').val();
    //     if(tmp == "1"){
    //         $("#txt_mailAdr").val("");
    //     }else{
    //         $("#txt_mailAdr").val($('#cob_mail').val());
    //     }
    // });
    // $("#txt_authNumber").hide();
    // $('#bt_authNumberSend').click( function() {
    //     if($(this).val() == '인증번호 발송'){
    //         $(this).val("재발송");
    //     }
    //     $("#txt_authNumber").show();
    //     if (tmp_sw == "true") {
    //         tmp_sw = "false";
    //         time();
    //     }
    // });
    // var num = 60 * 1; // 몇분을 설정할지의 대한 변수 선언
    // var myVar;
    // function time(){
    //     myVar = setInterval(alertFunc, 1000);
    // }
    // function alertFunc() {
    //     var min = num / 60;
    //     min = Math.floor(min);
    //     var sec = num - (60 * min);
    //     var input = min + '분' + sec + '초';
    //     console.log(input);
    //     $("#lb_authNumber").text(input);
    //
    //     if(num == 0){
    //         num = 60 * 1;
    //         myVar;
    //         tmp_sw ="true";
    //         clearInterval(myVar); // num 이 0초가 되었을대 clearInterval로 타이머 종료
    //     }
    //     num--;
    // }

    // <img src="/template2/assets/img/profile-avatar.png" alt="Profile Picture" style="height:150px;width: 150px">
    // function previewImage(targetObj, View_area) {
    //     console.log("targetObj: " + targetObj +"  /  View_area: "+ View_area);
    //     var preview = document.getElementById(View_area); //div id
    //     var ua = window.navigator.userAgent;
    //
    //     //ie일때(IE8 이하에서만 작동)
    //     if (ua.indexOf("MSIE") > -1) {
    //         targetObj.select();
    //         try {
    //             var src = document.selection.createRange().text; // get file full path(IE9, IE10에서 사용 불가)
    //             var ie_preview_error = document.getElementById("ie_preview_error_" + View_area);
    //             if (ie_preview_error) {
    //                 preview.removeChild(ie_preview_error); //error가 있으면 delete
    //             }
    //
    //             var img = document.getElementById(View_area); //이미지가 뿌려질 곳
    //             //이미지 로딩, sizingMethod는 div에 맞춰서 사이즈를 자동조절 하는 역할
    //             img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"+src+"', sizingMethod='scale')";
    //         } catch (e) {
    //             if (!document.getElementById("ie_preview_error_" + View_area)) {
    //                 var info = document.createElement("<p>");
    //                 info.id = "ie_preview_error_" + View_area;
    //                 info.innerHTML = e.name;
    //                 preview.insertBefore(info, null);
    //             }
    //         }
    //         //ie가 아닐때(크롬, 사파리, FF)
    //     } else {
    //         var files = targetObj.files;
    //         for ( var i = 0; i < files.length; i++) {
    //             var file = files[i];
    //             var imageType = /image.*/; //이미지 파일일경우만.. 뿌려준다.
    //             if (!file.type.match(imageType))
    //                 continue;
    //             var prevImg = document.getElementById("prev_" + View_area); //이전에 미리보기가 있다면 삭제
    //             if (prevImg) {
    //                 preview.removeChild(prevImg);
    //             }
    //             var img = document.createElement("img");
    //             img.id = "prev_" + View_area;
    //             img.classList.add("obj");
    //             img.file = file;
    //             img.style.width = '150px';
    //             img.style.height = '150px';
    //             preview.appendChild(img);
    //             if (window.FileReader) { // FireFox, Chrome, Opera 확인.
    //                 var reader = new FileReader();
    //                 reader.onloadend = (function(aImg) {
    //                     return function(e) {
    //                         aImg.src = e.target.result;
    //                     };
    //                 })(img);
    //                 reader.readAsDataURL(file);
    //             } else { // safari is not supported FileReader
    //                 //alert('not supported FileReader');
    //                 if (!document.getElementById("sfr_preview_error_"+ View_area)) {
    //                     var info = document.createElement("p");
    //                     info.id = "sfr_preview_error_" + View_area;
    //                     info.innerHTML = "not supported FileReader";
    //                     preview.insertBefore(info, null);
    //                 }
    //             }
    //         }
    //     }
    // }

    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#image_section').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }

    $("#imgInput").change(function(){

        var file = this.files;
        if(file[0].size > 1024 * 1024 * 2){
            alert('2MB 이하 파일만 등록할 수 있습니다.\n\n' + '현재파일 용량 : ' + (Math.round(file[0].size / 1024 / 1024 * 100) / 100) + 'MB');
            return;
        }
        readURL(this);
    });

    function paging(totalData, dataPerPage, pageCount, currentPage){
        console.log("currentPage 선택한 페이지 : " + currentPage);
        var row_Cnt = ((currentPage-1) * dataPerPage);
        console.log("limit startCnt: " + row_Cnt + " / endCnt:" + dataPerPage);
        getUserInfo(row_Cnt,dataPerPage);
        var totalPage = Math.ceil(totalData/dataPerPage);    // 총 페이지 수
        var pageGroup = Math.ceil(currentPage/pageCount);    // 페이지 그룹
        // console.log("pageGroup 페이지 그룹: " + pageGroup);
        var last = pageGroup * pageCount;    // 화면에 보여질 마지막 페이지 번호
        if(last > totalPage)
            last = totalPage;
        var first = last - (pageCount-1);    // 화면에 보여질 첫번째 페이지 번호
        var next = last+1;
        var prev = first-1;

        // console.log("last 마지막 페이지 번호 : " + last);
        // console.log("first 화면에 보여질 첫번쨰 페이지 번호: " + first);
        // console.log("next 다음 : " + next);
        // console.log("prev 이전 : " + prev);
        // var $pingingView = $("#paging");
        var html = "";
        if(prev > 0)
            html += "<a href=# id='prev'><</a> ";
        for(var i=first; i <= last; i++){
            html += "<a href='#' id=" + i + ">" + i + "</a> ";
        }
        if(last < totalPage)
            html += "<a href=# id='next'>></a>";
        $("#paging").html(html);    // 페이지 목록 생성
        $("#paging a").css("color", "black");
        $("#paging a#" + currentPage).css({"text-decoration":"none",
            "color":"red",
            "font-weight":"bold"});    // 현재 페이지 표시
        $("#paging a").click(function(){
            var $item = $(this);
            var $id = $item.attr("id");
            var selectedPage = $item.text();
            if($id == "next")    selectedPage = next;
            if($id == "prev")    selectedPage = prev;
            paging(totalData, dataPerPage, pageCount, selectedPage);
        });
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