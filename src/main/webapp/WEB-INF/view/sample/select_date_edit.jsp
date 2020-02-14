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
                            <input type="text" class="form-control " id="txt_startSel" disabled><span class="input-group-addon"><i class="glyphicon glyphicon-calendar" id="i_startSel"></i></span>
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
                <label class="text_middle" style="font-size: 11px;height: 27px"> ㆍ회원 아이디를 클릭하시면 상세정보를 확인할 수 있습니다. </label>
                <hr style="border:solid 1px ;margin-top: 0px;margin-bottom: 3px;color: #0d6aad">
            </div>

            <!-- DATA TABLE -->
            <div class="row col-lg-12 form-inline">
                <div class="widget widget-table">
                    <div class="widget-content">
                        <table id="list_info" class="table table-sorting table-hover table-bordered datatable">
                            <span>
                                <a download ="aaa.xlsx" onclick="return ExcellentExport.excel(this, 'list_info','aaa.xlsx');">Excel</a>
                                <button class="btn btn-default print-btn" type="button" id="excelDownBtn"><i class="fa fa-print"></i>Excel Print</button>
                            </span>
                            <thead>
                            <tr>
                                <th>NO</th>
                                <th>회원번호</th>
                                <th>UserID</th>
                                <th>닉네임</th>
                                <th>이름</th>
                                <th>연락처</th>
                                <th>가입플랫폼</th>
                                <th>접속상태</th>
                                <th>생방상태</th>
                            </tr>
                            </thead>
                            <tbody id="tableBody">

                            </tbody>
                        </table>
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
                    <div class="col-md-12 no-padding">
                        <div class="col-md-6">
                            <label class="col-md-3 control-label">프로필 이미지</label>
                            <div class="col-md-9">
                                <img src="/template2/assets/img/profile-avatar.png" alt="Profile Picture" style="height:100px;">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label class="col-md-3">회원레벨</label>
                            <div class="col-md-9">
                                <form id="cob_level">
                                    <select id="cob_userLevel" name="emailSelection" class="form-control">
                                        <option value="9999" selected="selected">직접입력</option>

                                    </select>
                                </form>
                            </div>
                            <label class="col-md-3">DJ등급</label>
                            <div class="col-md-9">
                                <form id="cob_grade">
                                    <select id="cob_djLevel" name="emailSelection" class="form-control">
                                    </select>
                                </form>
                            </div>
                            <label class="col-md-3">청취자 등급</label>
                            <div class="col-md-9">
                                <select id="cob_lisLevel" name="emailSelection" class="form-control">
                                    <option value="normal">일반청취자</option>
                                    <option value="best">베스트 청취자</option>
                                </select>
                            </div>
                            <label class="col-md-3">접속상태</label>
                            <div class="col-md-9">
                                <form id="login_radio">
                                    <label class="radio-inline"><input type="radio" name="radio_login" value="option1" checked="true">Login</label>
                                    <label class="radio-inline"><input type="radio" name="radio_login" value="option2">Logout</label>
                                </form>
                            </div>
                            <label class="col-md-3">생방상태</label>
                            <div class="col-md-9">
                                <form id="live_radio">
                                    <label class="radio-inline"><input type="radio" name="radio_liveOn" value="option1" checked="true">생방중</label>
                                    <label class="radio-inline"><input type="radio" name="radio_liveOn" value="option2">방송OFF</label>
                                </form>
                            </div>
                            <label class="col-md-3">청취상태</label>
                            <div class="col-md-9">
                                <form id="listen_radio">
                                    <label class="radio-inline"><input type="radio" name="radio_listenOn" value="option1" checked="true">청취중</label>
                                    <label class="radio-inline"><input type="radio" name="radio_listenOn" value="option2">청취OFF</label>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 no-padding">
                        <div class="col-md-6">
                            <div class="col-md-12 no-padding">
                                <label class="col-md-3">UserID</label>
                                <div class="col-md-9"><label id="lb_userId"></label></div>
                            </div>
                            <div class="col-md-12 no-padding">
                                <label class="col-md-3">연락처</label>
                                <div class="col-md-9">
                                    <input type="text" class="form-control col-md-12" id="txt_phon" value="010-1111-2222">
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <label class="col-md-3 control-label">가입플랫폼<br />(첫 연동일)</label>
                            <div class="col-md-9">
                                <div>달빛 : 2020.03.02 15:40:21</div>
                                <div>페이스북 : 2020.03.12 09:40:40</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 no-padding">
                        <div class="col-md-6">
                            <label class="col-md-3">닉네임</label>
                            <div class="col-md-6"><input type="text" class="form-control" id="txt_nickName"></div>
                            <div class="col-md-3">
                                <button type="button" id="bt_resatNick" class="btn-xs pull-right">닉네임 초기화</button>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label class="col-md-3">회원가입일시</label>
                            <div class="col-md-9">
                                <label id="lb_joinDate">2020.02.03 09:27:30</label>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 no-padding">
                        <div class="col-md-6">
                            <label class="col-md-3">생년월일</label>
                            <div class="col-md-9">
                                <div class="col-md-12 input-group date" id="date_birth">
                                    <input type="text" class="form-control" id="txt_birth"><span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label class="col-md-3">회원탈퇴일시</label>
                            <div class="col-md-9">
                                <label id="lb_cancelMb">2020.02.03 09:27:30</label>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-12 no-padding">
                        <div class="col-md-6">
                            <label class="col-md-3">나이</label>
                            <div class="col-md-3">
                                <label id="lb_age">33세</label>
                            </div>
                            <label class="col-md-2">성별</label>
                            <div class="col-md-4">
                                <label class="radio-inline"><input type="radio" name="radio_gender" value="m" checked>남자</label>
                                <label class="radio-inline"><input type="radio" name="radio_gender" value="g">여자</label>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label class="col-md-3">최근 정보 수정일시</label>
                            <div class="col-md-9">
                                <label id="lb_editDate">2020.02.03 09:27:30</label>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-12 no-padding">
                        <div class="col-md-6">
                            <label class="col-md-3">비밀번호</label>
                            <div class="col-md-6"><input type="password" class="form-control" id="txt_pass" value="1234"></div>
                            <div class="col-md-3"><button type="button" id="bt_resatPass" class="btn-xs pull-right">비밀번호 초기화</button></div>
                        </div>
                        <div class="col-md-6">
                            <label class="col-md-3">최근 정보 수정 처리자</label>
                            <div class="col-md-9">
                                <label id="lb_editUser">admin</label>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 no-padding">
                        <div class="col-md-6">
                            <label class="col-md-3">방송기록</label>
                            <div class="col-md-9">
                                <label id="lb_broadCnt">총0건</label>
                                <button type="button" id="bt_broadHistory" class="btn-xs pull-right">세부내역</button>
                                <%--<a class="btn btn-xs pull-right" id="bt_broadHistory" data-toggle="collapse" href="#detail" role="button" aria-expanded="false" aria-controls="detail">--%>
                                <%--세부내역--%>
                                <%--</a>--%>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label class="col-md-3">MyStar</label>
                            <div class="col-md-9">
                                <label id="lb_myStarCnt">총0건</label>
                                <button type="button" id="bt_registMyStarList" class="btn-xs pull-right">세부내역</button>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 no-padding">
                        <div class="col-md-6">
                            <label class="col-md-3">청취기록</label>
                            <div class="col-md-9">
                                <label id="lb_listenCnt">총0건</label>
                                <button type="button" id="bt_listenHistory" class="btn-xs pull-right">세부내역</button>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label class="col-md-3">Fan</label>
                            <div class="col-md-9">
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
                                                <div>
                                                    <label id="lb_payCnt">총0건</label>
                                                    <button type="button" id="bt_payHistory" class="btn-xs pull-right">세부내역</button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="col-md-3">교환/선물</div>
                                            <div class="col-md-9 no-padding">
                                                <div>
                                                    <label id="lb_giftCnt">총0건</label>
                                                    <button type="button" id="bt_giftHistory" class="btn-xs pull-right">세부내역</button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="col-md-3">환전</div>
                                            <div class="col-md-9 no-padding">
                                                <div>
                                                    <label id="lb_exchangeCnt">총0건</label>
                                                    <button type="button" id="bt_exchangeHistory" class="btn-xs pull-right">세부내역</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12no-padding">
                                    <div class="col-md-3">최근 접속 플랫폼</div>
                                    <div class="col-md-9">
                                        <label id="lb_platform">Mobile(Android)</label>
                                        <button type="button" id="bt_platform" class="btn-xs pull-right">세부내역</button>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div>
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
                                </div>

                                <div>
                                    <div class="col-md-2">신고/문의</div>
                                    <div class="col-md-10 no-padding">
                                        <div class="col-md-12 no-padding">
                                            <div class="col-md-3">내가/나를 신고한 정보</div>
                                            <div class="col-md-9">
                                                <label id="lb_myReportCnt">총0건</label>
                                                <button type="button" id="bt_registReport" class="btn-xs pull-right">세부내역</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row col-lg-12 form-inline" id="detail">
                    <div class="row col-lg-12 form-inline" style="padding-top: 2px;">
                        <label class="text_center text_middle" id="detail_label" style="font-weight: bold;font-size: 13px;color: #ffffff;background: #3e3e3e;width: 110px;height: 27px"> 세부내역 </label>
                        <label class="text_middle" id="detail_comments" style="font-size: 11px;height: 27px"></label>
                        <hr style="border:solid 1px ;margin-top: 0px;margin-bottom: 3px;color: #0d6aad">
                    </div>
                    <!-- DATA TABLE -->
                    <div class="row col-lg-12 form-inline">
                        <div class="widget widget-table">
                            <div class="widget-content">
                                <table id="list_info_detail" class="table table-sorting table-hover table-bordered datatable">
                                    <thead id="tableTop_detail">
                                    </thead>
                                    <tbody id="tableBody_detail">
                                    </tbody>
                                </table>
                                <span>
                                    <button class="btn btn-default print-btn" type="button"><i class="fa fa-print"></i>Excel Print</button>
                                </span>
                            </div>
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
<script src ="../../js/lib/excellentexport.js"></script>
<script>
    $(document).ready(function() {
        $('#list_info').DataTable();

        var memNo;
        // getUserInfo();
        getLevelData();
        getGradeData();
        $('#detail').hide();

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
                getUserInfo();
            };
        });

        <!-- 버튼 -->
        $('#bt_search').click( function() {       //검색
            getUserInfo();
        });

        $('#bt_edite').click( function() {                //    수정하기
        });
        $('#bt_imgChg').click(function() {					//   사진변경
        });
        $('#bt_resatPass').click(function() {				//   비밀번호초기화
        });
        $('#bt_broadHistory').click(function() {		    //   방송기록세부내역
            getHistoryDetail("broadHistory","방송기록","ㆍ회원이 방송을 진행하고, 청취한 과거기록을 확인할 수 있습니다.");
        });
        $('#bt_listenHistory').click(function() {		    //   청취기록세부내역
            getHistoryDetail("listenHistory","청취기록","ㆍ회원이 방송을 청취한 과거기록을 확인할 수 있습니다.");
        });
        $('#bt_payHistory').click(function() {			    //   결제/환불정보
            getHistoryDetail("payHistory","결제/환불정보","ㆍ회원의 결제정보를확인하고 결제 취소처리를 할 수 있습니다.");
        });
        $('#bt_giftHistory').click(function() {			//   교환/선물정보
            getHistoryDetail("giftHistory","교환/선물정보","ㆍ회원이 달에서 별로 교환한 정보를 확인하고, 보내고 받은 선물 내역을 확인할 수 있습니다.ㆍ이벤트 당첨선물로 제공되어 처리된 사안일 경우 처리직원ID로 표기됩니다.");
        });
        $('#bt_exchangeHistory').click(function() {	    //   환전정보
            getHistoryDetail("exchangeHistory","개인환불정보","ㆍ회원의 과거에서 현재까지의 환전 내역을 모두 확인하고, 증빙서류를 확인한 후 즉시 처리할 수 있습니다.");
        });
        $('#bt_platform').click(function() {				//   접속플랫폼
            getHistoryDetail("platformHistory","1:1 문의 정보","ㆍ회원의 가입일로부터의 접속 기록을 확인할 수 있습니다.");
        });
        $('#bt_registMyStarList').click(function() {	    //   mystar
            getHistoryDetail("myStarHistory","MyStar 정보","ㆍMyStar 회원 리스트를 확인하고 등록/삭제 할 수 있습니다.");
        });
        $('#bt_registMyFanlist').click(function() {		//   fan
            getHistoryDetail("myFanHistory","Fan 정보","ㆍFan으로 등록한 회원들의 리스트를 확인하고 등록/삭제 할 수 있습니다.");
        });
        $('#bt_myNotice').click(function() {				//   개인공지
            getHistoryDetail("noticeHistory","개인공지(팬보드)","ㆍ회원의 팬보드 내 연동된 공지정보를 확인하고, 관리할 수 있습니다.");
        });
        $('#bt_broadNotice').click(function() {			//   방송중공지
            getHistoryDetail("noticeHistory","방송 중 공지","ㆍ회원의 방송중 업로드 된 공지정보를 확인하고, 관리할 수 있습니다.");
        });
        $('#bt_registReport').click(function() {		    //   내가신고한정보
            getHistoryDetail("reportHistory","신고 처리 정보","ㆍ회원이 신고하고, 신고당한 정보를 한눈에 확인할 수 있습니다.");
        });
        $('#bt_resPonse').click(function() {				//   1:1문의정보
            getHistoryDetail("responseHistory","1:1 문의 정보","ㆍ1:1문의 또는 전화로 문의한 내용의 세부 정보를 확인할 수 있도록 연동 되어있습니다.");
        });
    });

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
    function getUserInfo(){                 // 검색
        $('#list_info').DataTable().destroy();
        $("#tableBody").empty();
        var obj = new Object();
        obj.search = $('#txt_search').val();                        // 검색명
        obj.date = $('input[name="radio_date"]:checked').val();     // 기간 radio
        obj.gubun = $("select[name='selectGubun']").val();          // 검색 조건
        obj.checkDate = $("input:checkbox[id='check_dateSel']").is(":checked");                       // 기간선택 여부
        obj.stDate = $('#txt_startSel').val();                      // 검색일 시작
        obj.edDate = $('#txt_endSel').val();                        // 검색일 끝

        getAjaxData("memberList", "/rest/member/member/list", obj, fn_success, fn_fail);
    }

    function fn_success(dst_id, response){
        dalbitLog(response);

        var template = $('#tmp_list').html();
        var templateScript = Handlebars.compile(template);
        var context = response;
        var html = templateScript(context);

        $("#tableBody").append(html);

        $('#list_info').DataTable().draw();
    }
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
        $("#lb_age").html(response.data.age + "세");
        $("#txt_phon").val(response.data.memPhone);
        $("#txt_eMail").val(response.data.memEmail);
        // $("#txt_pass").val(response.data.memPasswd);
        $("#cob_djLevel").val(response.data.grade);
        $("#cob_userLevel").val(response.data.level);
        $("#lb_broadCnt").html("총" + response.data.broadcastingCnt + "건");
        $("#lb_listenCnt").html("총" + response.data.listeningCnt + "건");
        $("#lb_joinDate").html(response.data.mem_join_date);
        $("#lb_editDate").html(response.data.last_upd_date);
        $("#lb_myStarCnt").html("총" + response.data.starCnt + "건");
        $("#lb_myFanCnt").html("총" + response.data.fanCnt + "건");
        $("#lb_broadNoticeCnt").html("총" + response.data.noticeCnt + "건");
        // console.log("birth : " + response.data.birthYear + "-" + response.data.birthMonth + "-" + response.data.birthDay);
        //$("txt_birth#").val(response.data.birthYear + "-" + response.data.birthMonth + "-" + response.data.birthDay);
        $("input[name=radio_gender][value=" + response.data.memSex + "]").prop("checked", true);

        $("#tableTop_detail").empty();
        $("#tableBody_detail").empty();
    }

    function getMemNo_info(id){
        var obj = new Object();
        obj.mem_no = id;
        getAjaxData("info", "/rest/member/member/info", obj, info_sel_success, fn_fail);
    }
    function getHistoryDetail(tmp,tmp2,tmp3){     // 상세보기
        $("#tableTop_detail").empty();
        table_col_set(tmp,tmp2,tmp3);
    }

    function table_col_set(id,title,comments){
        if($("#lb_userId").text() == null || $("#lb_userId").text() == ""){
            alert("확인 대상 선택 해주십시오");
            return;
        }
        $('#detail').show();
        $("#detail_label").html(title);
        $("#detail_comments").html(comments);
        if(id == "broadHistory"){
            var data = {header: [
                    { columnNm : "NO"},
                    { columnNm : "방송주제"},
                    { columnNm : "방송제목"},
                    { columnNm : "방송시작시간"},
                    { columnNm : "방송종료시간"},
                    { columnNm : "방송진행시간"},
                    { columnNm : "종료시 평균 청취자 수"},
                    { columnNm : "받은 좋아요 수"},
                    { columnNm : "받은 아이템 수"}
                ]};
        }else if(id == "listenHistory") {
            var data = {header: [
                    { columnNm : "NO"},
                    { columnNm : "청취방주제"},
                    { columnNm : "청취 방송제목"},
                    { columnNm : "청취시작시간"},
                    { columnNm : "청취종료시간"},
                    { columnNm : "청취진행시간"},
                    { columnNm : "받은 루비 개수"},
                    { columnNm : "청취 DJ 닉네임"}
                ]};
        }else if(id == "payHistory") {
            var data = {header: [
                    {columnNm: "NO"},
                    {columnNm: "구분"},
                    {columnNm: "아이템사용유무"},
                    {columnNm: "아이템명"},
                    {columnNm: "환불건수"},
                    {columnNm: "환불 수단"},
                    {columnNm: "요청 금액"},
                    {columnNm: "환불 일시"},
                    {columnNm: "처리 일시"},
                    {columnNm: "처리 상태"},
                    {columnNm: "처리자ID"},
                ]};
        }else if(id == "giftHistory") {
            var data = {header: [
                    {columnNm: "NO"},
                    {columnNm: "구분"},
                    {columnNm: "아이템명"},
                    {columnNm: "보낸/받은/교환 건 수"},
                    {columnNm: "교환/선물 금액"},
                    {columnNm: "교환/선물 일시"},
                    {columnNm: "User ID"},
                    {columnNm: "User 닉네임"},
                    {columnNm: "처리자 ID"},
                ]};
        }else if(id == "exchangeHistory") {
            var data = {header: [
                    {columnNm: "NO"},
                    {columnNm: "보유 골드 수 "},
                    {columnNm: "환전 요청 건 수"},
                    {columnNm: "환전 요청금액"},
                    {columnNm: "환전 신청일"},
                    {columnNm: "환전 처리일"},
                    {columnNm: "증빙서류 확인"},
                    {columnNm: "본인 확인"},
                    {columnNm: "환전상태"},
                    {columnNm: "처리자ID"},
                ]}
        }else if(id == "platformHistory") {
            var data = {header: [
                    {columnNm: "NO"},
                    {columnNm: "접속 일시"},
                    {columnNm: "OS환경"},
                    {columnNm: "App Ver"},
                    {columnNm: "Browser"},
                    {columnNm: "Device"},
                    {columnNm: "Mobile Device ID"},
                    {columnNm: "Mobile AD ID"},
                    {columnNm: "IP주소"},
                ]};
        }else if(id == "myStarHistory") {
            var data = {header: [
                    {columnNm: "NO"},
                    {columnNm: "MyStar ID"},
                    {columnNm: "MyStar 닉네임"},
                    {columnNm: "보낸 건 수"},
                    {columnNm: "보낸 개 수"},
                    {columnNm: "등록 일시"},
                    {columnNm: "해제 일시"},
                ]};
        }else if(id == "myFanHistory") {
            var data = {header: [
                    {columnNm: "NO"},
                    {columnNm: "Fan ID"},
                    {columnNm: "Fan 닉네임"},
                    {columnNm: "보낸 건 수"},
                    {columnNm: "보낸 개 수"},
                    {columnNm: "등록 일시"},
                    {columnNm: "해제 일시"},
                ]}
        }else if(id == "noticeHistory") {
            var data = {header: [
                    {columnNm: "NO"},
                    {columnNm: "구분"},
                    {columnNm: "방송제목"},
                    {columnNm: "공지내용"},
                    {columnNm: "등록일시"},
                ]};
        }else if(id == "reportHistory") {
            var data = {header: [
                    {columnNm: "NO"},
                    {columnNm: "플랫폼구분"},
                    {columnNm: "문의구분"},
                    {columnNm: "신고UserId"},
                    {columnNm: "신고대상UserID"},
                    {columnNm: "신고내용"},
                    {columnNm: "접수일시"},
                    {columnNm: "처리일시"},
                    {columnNm: "처리상태"},
                    {columnNm: "처리자"},
                ]};
        }else if(id == "responseHistory") {
            var data = {header: [
                    {columnNm: "NO"},
                    {columnNm: "플랫폼구분"},
                    {columnNm: "문의구분"},
                    {columnNm: "신고UserID"},
                    {columnNm: "신고대상UserID"},
                    {columnNm: "신고 내용"},
                    {columnNm: "접수일시/처리일시"},
                    {columnNm: "첨부파일"},
                    {columnNm: "처리상태"},
                    {columnNm: "처리자"},
                ]};
        }

        var template = $('#tmp_list_top_column').html();
        var templateScript = Handlebars.compile(template);
        var context = data;
        var html = templateScript(context);
        $("#tableTop_detail").append(html);


        $('#list_info_detail').DataTable().destroy();
        $("#tableBody_detail").empty();
        var obj = new Object();
        obj.mem_no = memNo;
        if(id == "broadHistory") {
            getAjaxData(id, "/rest/member/broadcast/list", obj, fn_success_detail, fn_fail);
        } else if(id == "listenHistory") {
            getAjaxData(id, "/rest/member/listen/list", obj, fn_success_detail, fn_fail);
        } else if(id == "myStarHistory") {
            getAjaxData(id, "/rest/member/myStar/list", obj, fn_success_detail, fn_fail);
        } else if(id == "myFanHistory") {
            getAjaxData(id, "/rest/member/fan/list", obj, fn_success_detail, fn_fail);
        } else if(id == "payHistory") {
            getAjaxData(id, "/rest/member/pay/list", obj, fn_success_detail, fn_fail);
        } else if(id == "giftHistory") {
            getAjaxData(id, "/rest/member/gift/list", obj, fn_success_detail, fn_fail);
        } else if(id == "exchangeHistory") {
            getAjaxData(id, "/rest/member/exchange/list", obj, fn_success_detail, fn_fail);
        } else if(id == "platformHistory") {            x
            getAjaxData(id, "/rest/member/platform/list", obj, fn_success_detail, fn_fail);
        } else if(id == "noticeHistory") {
            getAjaxData(id, "/rest/member/notice/list", obj, fn_success_detail, fn_fail);
        } else if(id == "reportHistory") {
            getAjaxData(id, "/rest/member/report/list", obj, fn_success_detail, fn_fail);
        } else if(id == "responseHistory") {
            getAjaxData(id, "/rest/member/response/list", obj, fn_success_detail, fn_fail);
        }
    }

    function fn_success_detail(dst_id, response) {
        dalbitLog(response);
        var template;
        if(dst_id == "broadHistory"){
            template = $('#broadHistory_detail').html();
        } else if(dst_id == "listenHistory") {
            template = $('#listenHistory_detail').html();
        } else if(dst_id == "myStarHistory") {
            template = $('#myStarHistory_detail').html();
        } else if(dst_id == "myFanHistory") {
            template = $('#myFanHistory_detail').html();
        } else if(dst_id == "payHistory") {
            template = $('#payHistory_detail').html();
        } else if(dst_id == "giftHistory") {
            template = $('#giftHistory_detail').html();
        } else if(dst_id == "exchangeHistory") {
            template = $('#exchangeHistory_detail').html();
        } else if(dst_id == "platformHistory") {
            template = $('#platformHistory_detail').html();
        } else if(dst_id == "noticeHistory") {
            template = $('#noticeHistory_detail').html();
        } else if(dst_id == "reportHistory") {
            template = $('#reportHistory_detail').html();
        } else if(dst_id == "responseHistory") {
            template = $('#responseHistory_detail').html();
        }
        var templateScript = Handlebars.compile(template);
        var context = response;
        var html = templateScript(context);

        $("#tableBody_detail").append(html);
        $('#list_info_detail').DataTable().draw();
    }

    function fn_fail(data, textStatus, jqXHR){
        console.log(data, textStatus, jqXHR);
        $('#list_info_detail').DataTable().draw();
    }

    /*=============엑셀==================*/
    // $('#excelDownBtn').on('click', function(){
    //     var formElement = document.querySelector("form");
    //     var formData = new FormData(formElement);
    //     /*formData.append("search", "test001");
    //     formData.append("test003", "test003");*/
    //     excelDownload($(this), "/rest/member/member/listExcel", formData, fn_success_excel, fn_fail_excel)
    // });




    function fn_success_excel(){
        alert("fn_success_excel");
    }

    function fn_fail_excel(){
        alert("fn_fail_excel");
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

</script>

<script id="tmp_list" type="text/x-handlebars-template">
    {{#data}}
    <tr>
        <td>{{index @index}}</td>
        <td>{{memNo}}</td>
        <td><a href="javascript://" onclick="javascript:getMemNo_info(this.id);" id="{{memNo}}">{{memId}}</a></td>
        <td>{{memNick}}</td>
        <td>{{memName}}</td>
        <td>{{memPhone}}</td>
        <td>{{memSlct}}</td>
        <td>{{Login_out}}</td>
        <td>{{Live}}</td>
    </tr>
    {{/data}}
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
<script id="tmp_list_top_column" type="text/x-handlebars-template">
    <tr>
        {{#header}}
        <th>{{columnNm}}</th>
        {{/header}}
    </tr>
</script>

<script id="broadHistory_detail" type="text/x-handlebars-template">
    {{#data}}
    <tr>
        <td>{{index @index}}</td>
        <td>{{subjectType}}</td>
        <td>{{title}}</td>
        <td>{{startDate}}</td>
        <td>{{endDate}}</td>
        <td>{{airtime}}</td>
        <td>{{listener}}</td>
        <td>{{good}}</td>
        <td>{{gold}}</td>
    </tr>
    {{/data}}
</script>
<script id="listenHistory_detail" type="text/x-handlebars-template">
    {{#data}}
    <tr>
        <td>{{index @index}}</td>
        <td>{{subjectType}}</td>
        <td>{{title}}</td>
        <td>{{startDate}}</td>
        <td>{{endDate}}</td>
        <td>{{listenTime}}</td>
        <td>{{giftRuby}}</td>
        <td>{{memNick}}</td>
    </tr>
    {{/data}}
</script>
<script id="myStarHistory_detail" type="text/x-handlebars-template">
    {{#data}}
    <tr>
        <td>{{index @index}}</td>
        <td>{{memId}}</td>
        <td>{{memNick}}</td>
        <td>{{tmp1}}</td>
        <td>{{tmp2}}</td>
        <td>{{regDate}}</td>
        <td>{{tmp3}}</td>
    </tr>
    {{/data}}
</script>
<script id="myFanHistory_detail" type="text/x-handlebars-template">
    {{#data}}
    <tr>
        <td>{{index @index}}</td>
        <td>{{memId}}</td>
        <td>{{memNick}}</td>
        <td>{{tmp1}}</td>
        <td>{{tmp2}}</td>
        <td>{{regDate}}</td>
        <td>{{tmp3}}</td>
    </tr>
    {{/data}}
</script>
<script id="noticeHistory_detail" type="text/x-handlebars-template">
    {{#data}}
    <tr>
        <td>{{index @index}}</td>
        <td>{{type}}</td>
        <td>{{title}}</td>
        <td>{{notice}}</td>
        <td>{{lastUpdDate}}</td>
    </tr>
    {{/data}}
</script>
<script id="reportHistory_detail" type="text/x-handlebars-template">
    {{#data}}
    <tr>
        <td>{{index @index}}</td>
        <td>{{platform}}</td>
        <td>{{type}}</td>
        <td>{{memNo}}</td>
        <td>{{reportMemNo}}</td>
        <td>{{etc}}</td>
        <td>{{lastUpdDate}}</td>
        <td>{{etc}}</td>
        <td>{{status}}</td>
        <td>{{etc}}</td>
    </tr>
    {{/data}}
</script>