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
    .p{
        padding-left: 0px;
        padding-right: 0px;
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
                        <label style="font-weight: bold">공지등록 기간</label>
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
                        <label class="checkbox-inline"><input type="checkbox" id="check_dateSel" checked>기간 선택</label>
                        <div class="input-group date col-lg-4" id="date_startSel">
                            <input type="text" class="form-control" id="txt_startSel"><span class="input-group-addon"><i class="glyphicon glyphicon-calendar" id="i_startSel"></i></span>
                        </div>
                        <label>~</label>
                        <div class="input-group date col-lg-4" id="date_endSel">
                            <input type="text" class="form-control" id="txt_endSel"><span class="input-group-addon"><i class="glyphicon glyphicon-calendar" id="i_endSel"></i></span>
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
                                <option value="0" selected="selected">전체</option>
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
                                <button class="btn btn-default print-btn" type="button"><i class="fa fa-print"></i>Excel Print</button>
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
                                <th>자세히보기</th>
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
                    <label class="text_center text_middle" style="font-weight: bold;font-size: 13px;color: #ffffff;background: #3e3e3e;width: 10%;height: 27px"> 검색 상세 정보 </label>
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
                                        <option value="00" selected="selected">직접입력</option>

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
                            <label class="col-md-3">UserID</label>
                            <div class="col-md-3"><label id="lb_userId">DaldalE</label></div>
                            <label class="col-md-2">닉네임</label>
                            <div class="col-md-4"><input type="text" class="form-control" id="txt_nickName" value="다달이"></div>
                        </div>
                    </div>

                    <div class="col-md-12 no-padding">
                        <div class="col-md-6">
                            <label class="col-md-3">이름</label>
                            <div class="col-md-9"><input type="text" class="form-control" id="txt_name" value="양달님"></div>
                            <label class="col-md-3">생년월일</label>
                            <div class="col-md-9 input-group date " id="date_birth">
                                <input type="text" class="form-control" id="txt_birth"><span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
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
                            <label class="col-md-3">회원가입일시</label>
                            <div class="col-md-9">
                                <label id="lb_joinDate">2020.02.03 09:27:30</label>
                            </div>
                        </div>

                    </div>
                    <div class="col-md-12 no-padding">
                        <div class="col-md-6">
                            <label class="col-md-3">연락처</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control col-md-12" id="txt_phon" value="010-1111-2222">
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
                            <label class="col-md-3">이메일</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control col-md-9" id="txt_eMail" value="dabit00@gmail.com">
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
                            <div class="col-md-9">
                                <div class="col-md-9">
                                    <input type="password" class="form-control" id="txt_pass" value="1234">
                                </div>
                                <div class="col-md-3">
                                    <button type="button" id="bt_resatPass" class="btn-xs pull-right">비밀번호 초기화</button>
                                </div>
                            </div>
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
                            </div>
                        </div>
                        <div class="col-md-1">
                            <label class="col-md-3 control-label">MyStar</label>
                        </div>
                        <div class="col-md-5">
                            <label class="col-md-6">내가 등록한 Mystar</label>
                            <div class="col-md-6">
                                <label class="col-md-6" id="lb_myStarCnt">총0건</label>
                                <button type="button" id="bt_registmyStarList" class="btn-xs pull-right">세부내역</button>
                            </div>
                            <label class="col-md-6">나를 Mystar로 등록한 회원</label>
                            <div class="col-md-6">
                                <label class="col-md-6" id="lb_meStarCnt">총0건</label>
                                <button type="button" id="bt_registMeStarList" class="btn-xs pull-right">세부내역</button>
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
                        <div class="col-md-1">
                            <label class="col-md-3 control-label">Fan</label>
                        </div>
                        <div class="col-md-5">
                            <label class="col-md-6">내가 등록한 Fan</label>
                            <div class="col-md-6">
                                <label class="col-md-6" id="lb_myFanCnt">총0건</label>
                                <button type="button" id="bt_registMyFanlist" class="btn-xs pull-right">세부내역</button>
                            </div>
                            <label class="col-md-6">나를 등록한 Fan</label>
                            <div class="col-md-6">
                                <label class="col-md-6" id="lb_meFanCnt">총0건</label>
                                <button type="button" id="bt_registMeFanlist" class="btn-xs pull-right">세부내역</button>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 no-padding">
                        <div>
                            <div class="col-md-6">
                                <div class="col-md-12 no-padding">
                                    <div class="col-md-3">개인결제 정보</div>
                                    <div class="col-md-9 no-padding">
                                        <div class="col-md-12">
                                            <div class="col-md-3">결제</div>
                                            <div class="col-md-9 no-padding">
                                                <div>
                                                    <label id="lb_payCnt">총0건</label>
                                                    <button type="button" id="bt_payHistory" class="btn-xs pull-right">세부내역</button>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-md-12">
                                            <div class="col-md-3">환불</div>
                                            <div class="col-md-9 no-padding">
                                                <div>
                                                    <label id="lb_refundCnt">총0건</label>
                                                    <button type="button" id="bt_refundHistory" class="btn-xs pull-right">세부내역</button>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-md-12">
                                            <div class="col-md-3">선물</div>
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

                                <div class="col-md-12">
                                    <div class="col-md-6">접속 플랫폼</div>
                                    <div class="col-md-6 no-padding">
                                        <label id="lb_platform">Mobile(Android)</label>
                                        <button type="button" id="bt_platform" class="btn-xs pull-right">세부내역</button>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <div>
                                    <div class="col-md-2">공지</div>
                                    <div class="col-md-10">
                                        <div class="col-md-12">
                                            <div class="col-md-3">개인공지</div>
                                            <div class="col-md-9 no-padding">
                                                <div>
                                                    <label id="lb_noticeCnt">총0건</label>
                                                    <button type="button" id="bt_myNotice" class="btn-xs pull-right">세부내역</button>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-md-12">
                                            <div class="col-md-3">방송중공지</div>
                                            <div class="col-md-9 no-padding">
                                                <div>
                                                    <label id="lb_broadNoticeCnt">총0건</label>
                                                    <button type="button" id="bt_broadNotice" class="btn-xs pull-right">세부내역</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div>
                                    <div class="col-md-2">신고/문의</div>
                                    <div class="col-md-10">
                                        <div class="col-md-12">
                                            <div class="col-md-3">내가 신고한 정보</div>
                                            <div class="col-md-9 no-padding">
                                                <div>
                                                    <label id="lb_myDeclarCnt">총0건</label>
                                                    <button type="button" id="bt_registMyDeclar" class="btn-xs pull-right">세부내역</button>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-md-12">
                                            <div class="col-md-3">나를 신고한 정보</div>
                                            <div class="col-md-9 no-padding">
                                                <div>
                                                    <label id="lb_meDeclarCnt">총0건</label>
                                                    <button type="button" id="bt_registMeDeclar" class="btn-xs pull-right">세부내역</button>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-md-12">
                                            <div class="col-md-3">1:1 문의정보</div>
                                            <div class="col-md-9 no-padding">
                                                <div>
                                                    <label id="lb_resPonseCnt">총0건</label>
                                                    <button type="button" id="bt_resPonse" class="btn-xs pull-right">세부내역</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
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

<!-- jQuery -->
<script src="/template/js/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="/template/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="/template/js/metisMenu.min.js"></script>

<!-- DataTables JavaScript -->
<script src="/template/js/dataTables/jquery.dataTables.min.js"></script>
<script src="/template/js/dataTables/dataTables.bootstrap.min.js"></script>

<!-- Custom Theme JavaScript -->
<script src="/template/js/startmin.js"></script>
<script src="/js/lib/handlebars-v4.7.2.js"></script>
<script src="/js/common.js"></script>


<!-- Datepicker -->
<link rel="stylesheet" href="/css/bootstrap-datepicker3.min.css">
<script type='text/javascript' src="/js/lib/bootstrap-datepicker.min.js"></script>
<script src="/js/lib/bootstrap-datepicker.kr.js" charset="UTF-8"></script>
<!-- Page-Level Demo Scripts - Tables - Use for reference -->


<%-- bt_edite                         // 수정하기--%>

<%-- img_profileImg					// 프로필 이미지--%>
<%-- lb_userId						// 사용자 ID--%>
<%-- txt_nickName						// 닉네임--%>
<%-- txt_name							// 이름--%>
<%-- lb_age							// 나이--%>
<%-- radio_male						// 남--%>
<%-- radio_female						// 여--%>
<%-- txt_phon							// 핸드폰번호--%>
<%-- txt_eMail						// 이메일--%>
<%-- txt_pass							// 비밀번호--%>
<%-- lb_broadCnt						// 방송 기록 수--%>
<%-- lb_listenCnt						// 청취자 기록 수--%>
<%-- lb_payCnt						// 결재 건 수--%>
<%-- lb_refundCnt						// 환불 정보 수--%>
<%-- lb_giftCnt						// 선물 수--%>
<%-- lb_exchangeCnt					// 환전 수--%>

<%-- lb_platform						// 가입 플랫폼--%>
<%-- lb_joinDate						// 회원 가입 일시--%>
<%-- lb_cancelMb						// 회원 탈퇴 일시--%>
<%-- lb_editDate						// 최근정보 수정 일--%>
<%-- lb_editUser						// 최근정보 수정 처리자--%>
<%-- lb_myStarCnt						// 내가 등록한 mystar 수--%>
<%-- lb_meStarList					// 나를 mystart등록한 수--%>
<%-- lb_myFan							// 내가 등록한 fan--%>
<%-- lb_meFan							// 나를 등록한 fan 수--%>
<%-- lb_noticeCnt						// 개인공지 수--%>
<%-- lb_broadNoticeCnt				// 방송중 공지 수--%>
<%-- lb_myDeclarCnt					// 내가 신고한 수--%>
<%-- lb_meDeclarCnt					// 나를 신고한 수--%>
<%-- lb_resPonseCnt					// 1:1 문의 정보--%>

<%-- cob_userLevel					// 회원레벨--%>
<%-- cob_djLevel						// DC등급--%>
<%-- cob_lisLevel						// 청취자등급--%>
<%-- radio_login						// 로그인--%>
<%-- radio_lgout						// 로그아웃--%>
<%-- radio_liveOn						// 생방중--%>
<%-- radio_liveOff					// 생방아님--%>
<%-- radio_lisOn						// 청취중--%>
<%-- radio_lisOn						// 청취 아님--%>

<%-- bt_imgChg						// 사진변경--%>
<%-- bt_resatPass						// 비밀번호초기화--%>
<%-- bt_broadHistory					// 방송 기록 세부내역--%>
<%-- bt_listenHistory  			    // 청취 기록 세부내역--%>
<%-- bt_payHistory					// 개인 결제 정보--%>
<%-- bt_refundHistory				    // 개인 환불 정보--%>
<%-- bt_giftHistory					// 개인 선물 정보--%>
<%-- bt_exchangeHistory			    // 개인 환불 정보--%>
<%-- bt_registMyStarList			    // 내가 등록한 mystart--%>
<%-- bt_registMeStarList			    // 나를 mystart로 등록한 회원--%>
<%-- bt_registFanMylist			    // 내가 등록한 fan--%>
<%-- bt_registMeFanlist			    // 나를 fan 으로 등록한 회원--%>
<%-- bt_myNotice						// 개인 공지--%>
<%-- bt_broadNotice					// 방송 중 공지--%>
<%-- bt_registMyDeclar				// 내가 신고한 정보--%>
<%-- bt_registMeDeclar				// 나를 신고한 정보--%>
<%-- bt_resPonse						// 1:1 문의 정보--%>

<script>
    $(document).ready(function() {
        getAjaxData("memberList", "/rest/member/member/list", "", fn_success, fn_fail);
        // getUserInfo();
        getLevelData();
        getGradeData();



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
                console.log(moment().add(-1,'M').format("YYYY-MM-DD"));
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
                $('#txt_startSel').attr('disabled', false);
                $('#txt_endSel').attr('disabled', false);
                $('#i_startSel').attr('disabled', false);
                $('#i_endSel').attr('disabled', false);
            } else {
                $('#txt_startSel').attr('disabled', true);
                $('#txt_endSel').attr('disabled', true);
                $('#i_startSel').attr('disabled', true);
                $('#i_endSel').attr('disabled', true);
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

            var form = document.createElement('form');
            var objs;
            objs = document.createElement('input');
            objs.setAttribute('type', 'hidden');
            objs.setAttribute('id', $("#lb_userId").val());
            form.appendChild(objs);
            form.setAttribute('method', 'post');
            form.setAttribute('action', "/sample/select_date_edit");
            document.body.appendChild(form);
            form.submit();
        });
        $('#bt_listenHistory').click(function() {		    //   청취기록세부내역
        });
        $('#bt_payHistory').click(function() {			    //   개인결제정보
        });
        $('#bt_refundHistory').click(function() {		    //   개인환불정보
        });
        $('#bt_giftHistory').click(function() {			//   개인선물정보
        });
        $('#bt_exchangeHistory').click(function() {	    //   개인환불정보
        });
        $('#bt_registMyStarList').click(function() {	    //   내가등록한mystart
        });
        $('#bt_registMeStarList').click(function() {	    //   나를mystart로등록한회원
        });
        $('#bt_registFanMylist').click(function() {		//   내가등록한fan
        });
        $('#bt_registMeFanlist').click(function() {		//   나를fan으로등록한회원
        });
        $('#bt_myNotice').click(function() {				//   개인공지
        });
        $('#bt_broadNotice').click(function() {			//   방송중공지
        });
        $('#bt_registMyDeclar').click(function() {		    //   내가신고한정보
        });
        $('#bt_registMeDeclar').click(function() {		    //   나를신고한정보
        });
        $('#bt_resPonse').click(function() {				//   1:1문의정보
        });
        // $(document).on('click', '#list_info tbody tr', function(){
        //     var tr = $(this); // 현재 클릭된 row
        //     var td = tr.children();
        //     // var tdArray = new Array(); // 배열선언
        //     // td.each(function(i){
        //     //     tdArray.push(td.eq(i).text());
        //     // });
        //     // console.log("배열에 담은 값 : " + tdArray);
        //     // 특정 셀 값 알아내기
        //     var mem_no = td.eq(1).text();
        //     var obj = new Object();
        //     obj.mem_no = mem_no;
        //
        //     getAjaxData("info", "/rest/member/member/info", obj, info_sel_success, fn_fail);
        // });
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
        $("#list_info tr:not(:first)").remove();
        var obj = new Object();
        obj.search = $('#txt_search').val();                   // 검색명
        obj.date = $('input[name="radio_date"]:checked').val();     // 기간 radio
        obj.gubun = $("select[name='selectGubun']").val();          // 검색 조건
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

        $('#list').DataTable({
            retrieve: true,
            paging: true,
            searching: true,
        });
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
        $("#lb_userId").html(response.data.mem_no);
        // $("#lb_userId").html(response.data.memId);
        $("#txt_nickName").val(response.data.nickName);
        $("#txt_name").val(response.data.name);
        $("#lb_age").html(response.data.age + "세");
        $("#txt_phon").val(response.data.phone);
        $("#txt_eMail").val(response.data.email);
        // $("#txt_pass").val(response.data.passwd);
        $("#cob_djLevel").val(response.data.grade);
        $("#cob_userLevel").val(response.data.level);
        $("#lb_broadCnt").html("총" + response.data.broadcastingCnt + "건");
        $("#lb_listenCnt").html("총" + response.data.listeningCnt + "건");
        $("#lb_joinDate").html(response.data.join_date);
        $("#lb_editDate").html(response.data.upd_date);
        $("#lb_meStarCnt").html("총" + response.data.starCnt + "건");
        $("#lb_meFanCnt").html("총" + response.data.fanCnt + "건");
        console.log("birth : " + response.data.birthYear + "-" + response.data.birthMonth + "-" + response.data.birthDay);
        //$("txt_birth#").val(response.data.birthYear + "-" + response.data.birthMonth + "-" + response.data.birthDay);
        $("input[name=radio_gender][value=" + response.data.memSex + "]").prop("checked", true);

        // $("#").val(response.data.profileImage);

        // if(response.data.gender == "m"){
        //     $("#radio_male").prop("checked", true).change();
        // }else{
        //     $("#radio_female").prop("checked", true).change();
        // }
    }

    function getDetail(id){
        var obj = new Object();
        obj.mem_no = id;

        console.log(id);

        getAjaxData("info", "/rest/member/member/info", obj, info_sel_success, fn_fail);
    }

    function fn_fail(data, textStatus, jqXHR){
        console.log(data, textStatus, jqXHR);
    }


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
    <tr><td>{{NO}}</td>
        <td>{{memNo}}</td>
        <td><a href="javascript://" onclick="javascript:getDetail(this.id);" id="{{memNo}}">{{memId}}</a></td>
        <td>{{memNick}}</td>
        <td>{{memName}}</td>
        <td>{{memPhone}}</td>
        <td>{{memSlct}}</td>
        <td>{{Login_out}}</td>
        <td>{{Live}}</td>
        <td>
            <button type="button" class="btn btn-indigo btn-sm m-0">자세히보기</button>
        </td>
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