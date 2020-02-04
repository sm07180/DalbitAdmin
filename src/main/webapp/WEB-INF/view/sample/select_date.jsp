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
    .p_0{
        padding-top: 0px;
        padding-bottom: 0px;
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
                        <label class="radio-inline"><input type="radio" name="broad" id="radio_dateAll" value="option1" checked="true">전체</label>
                        <label class="radio-inline"><input type="radio" name="broad" id="radio_dateDay" value="option2">오늘</label>
                        <label class="radio-inline"><input type="radio" name="broad" id="radio_dateWeek" value="option3">1주일</label>
                        <label class="radio-inline"><input type="radio" name="broad" id="radio_dateMon" value="option3">한달</label>
                    </div>

                    <div class="col-lg-12">
                        <label class="checkbox-inline"><input type="checkbox" id="check_dateSel">기간 선택</label>
                        <div class="input-group date col-lg-4" id="date_startSel">
                            <input type="text" class="form-control" id="txt_startSel"><span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                        </div>
                        <label>~</label>
                        <div class="input-group date col-lg-4" id="date_endSel">
                            <input type="text" class="form-control" id="txt_endSel"><span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
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
                            <select class="form-control" id="selectGubun" name="selectGubun">
                                <option value="1" selected="selected">전체</option>
                                <option value="userid">User ID</option>
                                <option value="usernickname">User 닉네임</option>
                                <option value="phonnumber">연락처</option>
                            </select>

                            <label><input type="text" class="form-control" id="txt_search"></label>
                            <button type="submit" class="btn btn-default">검색</button>
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
                <div class="col-lg-12" id="ex1_Result1" ></div>
                <div class="col-lg-12" id="ex1_Result2" ></div>
                <div class="widget widget-table">
                    <div class="widget-content">
                        <table id="list" class="table table-sorting table-hover table-bordered datatable">
                            <span>
                                <button class="btn btn-default" type="button"><i class="fa fa-close"></i>Delete</button>
                                <button class="btn btn-default print-btn" type="button"><i class="fa fa-print"></i>Excel Print</button>
                            </span>
                            <thead>
                            <tr>
                                <th>NO</th>
                                <th>UserID</th>
                                <th>NickName</th>
                                <th>Name</th>
                                <th>PhoneNum</th>
                                <th>JoinPlatform</th>
                                <th>Login_out</th>
                                <th>Live</th>
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
                <div class="col-lg-1 p_0">
                    <label class="text_center text_middle" style="font-weight: bold;font-size: 13px;color: #ffffff;background: #3e3e3e;width: 10%;height: 27px"> 검색 상세 정보 </label>
                </div>
                <div class="col-lg-4 p_0">
                    <label class="text_middle" style="font-size: 11px;height: 27px;"> ㆍ회원 상세 정보는 [수정하기] 버튼을 통해 변경이 가능합니다.</label>
                </div>
                <div class="col-lg-7 p_0">
                    <button type="button" id="bt_edite" class="btn-primary pull-right btn-xs form-control"  style="border-radius:3px;width: 80px;;height: 24px">수정하기</button>
                </div>
            </div>
            <div class="row col-lg-12 form-inline " style="padding-top: 0px;">
                <hr style="border:solid 1px ;margin-top: 0px;margin-bottom: 3px;color: #0d6aad">
            </div>
            <div class="row col-lg-12 form-inline p">
                <div class="col-lg-6">
                    <div class="col-lg-12 p">
                        <p class="data-row" style="height:203.94px">
                            <span class="data-name col-lg-3 form-control text_center text_middle" style="height:203.94px">프로필 이미지</span>
                            <img src="../../../template2/assets/img/profile-avatar.png" alt="Profile Picture" style="width:150px; height: 150px" id="img_profileImg"/>
                            <button type="submit" class="btn btn-default" id="bt_imgChg">사진변경</button>
                        </p>
                    </div>
                    <div class="col-lg-12 p">
                        <p class="data-row">
                            <span class="data-name col-lg-6 form-control text_center">UserID</span>
                            <span class="data-value col-lg-6" id="lb_userId">DaldalE</span>
                        </p>
                    </div>
                    <div class="col-lg-12 p">
                        <p class="data-row">
                            <span class="data-name col-lg-3 form-control text_center">닉네임</span>
                            <input type="text" class="form-control col-lg-6" id="txt_nickName" value="다달이">
                        </p>
                    </div>

                    <div class="col-lg-12 p">
                        <p class="data-row">
                            <span class="data-name col-lg-3 form-control text_center">이름</span>
                            <input type="text" class="form-control col-lg-6" id="txt_name" value="양달님">
                        </p>
                    </div>
                    <div class="col-lg-12 p">
                        <p class="data-row">
                            <%--<p class="data-row input-group date">--%>
                            <span class="data-name col-lg-3 form-control text_center">생년월일</span>
                            <%--<input type="text" class="form-control col-lg-4" id="txt_birth" >--%>
                            <%--<span class="input-group-addon" style="display: inline-block;"><i class="glyphicon glyphicon-calendar"  style="height: 17px"></i></span>--%>
                        </p>
                    </div>
                    <div class="col-lg-12 p">
                        <p class="data-row">
                            <span class="data-name col-lg-3 form-control text_center">나이</span>
                            <span class="data-value col-lg-5" id="lb_age">33세</span>
                        </p>
                    </div>
                    <div class="col-lg-12 p">
                        <p class="data-row">
                            <span class="data-name col-lg-3 form-control text_center">성별</span>
                            <label class="radio-inline"><input class="" type="radio" name="broad" id="radio_male" value="option1" checked="true">남자</label>
                            <label class="radio-inline"><input type="radio" name="broad" id="radio_female" value="option2">여자</label>
                        </p>
                    </div>
                    <div class="col-lg-12 p">
                        <p class="data-row">
                            <span class="data-name col-lg-3 form-control text_center">연락처</span>
                            <input type="text" class="form-control col-lg-6" id="txt_phon" value="010-1111-2222">
                        </p>
                    </div>
                    <div class="col-lg-12 p">
                        <p class="data-row">
                            <span class="data-name col-lg-3 form-control text_center">이메일</span>
                            <input type="text" class="form-control col-lg-6" id="txt_eMail" value="dabit00@gmail.com">
                        </p>
                    </div>
                    <div class="col-lg-12 p">
                        <p class="data-row">
                            <span class="data-name col-lg-3 form-control text_center">비밀번호</span>
                            <input type="password" class="form-control col-lg-6" id="txt_pass" value="123412341234">
                            <button type="button" id="bt_resatPass" class="btn-primary pull-right btn-xs form-control"  style="border-radius:3px">비밀번호 초기화</button>
                        </p>
                    </div>

                    <div class="col-lg-12 p">
                        <p class="data-row">
                            <span class="data-name col-lg-3 form-control text_center">방송기록</span>
                            <span class="data-value col-lg-6" id="lb_broadCnt">총00건</span>
                            <button type="button" id="bt_broadHistory" class="btn-primary pull-right btn-xs form-control"  style="border-radius:3px;">세부내역</button>
                        </p>
                    </div>
                    <div class="col-lg-12 p">
                        <p class="data-row">
                            <span class="data-name col-lg-3 form-control text_center">청취기록</span>
                            <span class="data-value col-lg-6" id="lb_listenCnt">총00건</span>
                            <button type="button" id="bt_listenHistory" class="btn-primary pull-right btn-xs form-control"  style="border-radius:3px;">세부내역</button>
                        </p>
                    </div>

                    <div class="col-lg-12 p">
                        <p class="data-row">
                            <span class="data-name col-lg-3 form-control text_center">개인결제정보</span>
                            <span class="data-value col-lg-6" id="lb_payCnt">총00건</span>
                            <button type="button" id="bt_payHistory" class="btn-primary pull-right btn-xs form-control"  style="border-radius:3px;">세부내역</button>
                        </p>
                    </div>

                    <div class="col-lg-12 p">
                        <p class="data-row">
                            <span class="data-name col-lg-3 form-control text_center">개인환불정보</span>
                            <span class="data-value col-lg-6" id="lb_refundCnt">총00건</span>
                            <button type="button" id="bt_refundHistory" class="btn-primary pull-right btn-xs form-control"  style="border-radius:3px;">세부내역</button>
                        </p>
                    </div>

                    <div class="col-lg-12 p">
                        <p class="data-row">
                            <span class="data-name col-lg-3 form-control text_center">개인선물정보</span>
                            <span class="data-value col-lg-6" id="lb_giftCnt">총00건</span>
                            <button type="button" id="bt_giftHistory" class="btn-primary pull-right btn-xs form-control"  style="border-radius:3px;">세부내역</button>
                        </p>
                    </div>
                    <div class="col-lg-12 p">
                        <p class="data-row">
                            <span class="data-name col-lg-3 form-control text_center">개인환전정보</span>
                            <span class="data-value col-lg-6" id="lb_exchangeCnt">총00건</span>
                            <button type="button" id="bt_exchangeHistory" class="btn-primary pull-right btn-xs form-control"  style="border-radius:3px;">세부내역</button>
                        </p>
                    </div>
                </div>

                <div class="col-lg-6">
                    <div class="col-lg-12 p">
                        <p class="data-row">
                            <span class="data-name col-lg-3 form-control text_center">회원레벨</span>
                            <select id="cob_userLevel" name="emailSelection" class="col-lo-6 form-control text_center">
                                <option value="1" selected="selected">직접입력</option>
                                <option value="1">01레벨</option>
                                <option value="2">02레벨</option>
                                <option value="3">03레벨</option>
                            </select>
                        </p>
                    </div>
                    <div class="col-lg-12 p">
                        <p class="data-row">
                            <span class="data-name col-lg-3 form-control text_center">DJ등급</span>
                            <select id="cob_djLevel" name="emailSelection" class="col-lo-6 form-control text_center">
                                <option value="normal">일반DJ</option>
                                <option value="best">베스트DJ</option>
                            </select>
                        </p>
                    </div>
                    <div class="col-lg-12 p">
                        <p class="data-row">
                            <span class="data-name col-lg-3 form-control text_center">청취자 등급</span>
                            <select id="cob_lisLevel" name="emailSelection" class="col-lo-6 form-control text_center">
                                <option value="normal">일반청취자</option>
                                <option value="best">베스트 청취자</option>
                            </select>
                        </p>
                    </div>
                    <div class="col-lg-12 p">
                        <p class="data-row">
                            <span class="data-name col-lg-3 form-control text_center">접속상태</span>
                            <label class="radio-inline"><input type="radio" name="broad" id="radio_login" value="option1" checked="true">Login</label>
                            <label class="radio-inline"><input type="radio" name="broad" id="radio_logout" value="option2">Logout</label>
                        </p>
                    </div>
                    <div class="col-lg-12 p">
                        <p class="data-row">
                            <span class="data-name col-lg-3 form-control text_center">생방상태</span>
                            <label class="radio-inline"><input type="radio" name="broad" id="radio_liveOn" value="option1" checked="true">생방중</label>
                            <label class="radio-inline"><input type="radio" name="broad" id="radio_liveOff" value="option2">방송OFF</label>
                        </p>
                    </div>
                    <div class="col-lg-12 p">
                        <p class="data-row">
                            <span class="data-name col-lg-3 form-control text_center">청취상태</span>
                            <label class="radio-inline"><input type="radio" name="broad" id="radio_lisOn" value="option1" checked="true">청취중</label>
                            <label class="radio-inline"><input type="radio" name="broad" id="radio_lisOff" value="option2">청취OFF</label>
                        </p>
                    </div>
                    <%--<div class="col-lg-12">--%>
                    <%--<p class="data-row">--%>
                    <%--<span class="data-name col-lg-3 form-control text_center" >&nbsp;</span><span class="data-value" style="width: 50%">&nbsp;</span>--%>
                    <%--</p>--%>
                    <%--</div>--%>
                    <div class="col-lg-12 p">
                        <p class="data-row">
                            <span class="data-name col-lg-3 form-control text_center">가입플랫폼(첫연동일)</span>
                            <span class="data-value" style="width: 50%" id="lb_platform">달빛</span>
                        </p>
                    </div>
                    <div class="col-lg-12 p">
                        <p class="data-row">
                            <span class="data-name col-lg-3 form-control text_center">회원가입일시</span>
                            <span class="data-value" style="width: 50%" id="lb_joinDate">2020.02.03 09:27:30</span>
                        </p>
                    </div>
                    <div class="col-lg-12 p">
                        <p class="data-row">
                            <span class="data-name col-lg-3 form-control text_center">회원탈퇴일시</span>
                            <span class="data-value" style="width: 50%" id="lb_cancelMb">2020.02.03 09:27:30</span>
                        </p>
                    </div>
                    <div class="col-lg-12 p">
                        <p class="data-row">
                            <span class="data-name col-lg-3 form-control text_center">최근 정보 수정일시</span>
                            <span class="data-value" style="width: 50%" id="lb_editDate">2020.02.03 09:27:30</span>
                        </p>
                    </div>
                    <div class="col-lg-12 p">
                        <p class="data-row">
                            <span class="data-name col-lg-3 form-control text_center">최근 정보 수정 처리자</span>
                            <span class="data-value" style="width: 50%" id="lb_editUser">admin</span>
                        </p>
                    </div>
                    <div class="col-lg-12 p">
                        <p class="data-row">
                            <span class="data-name col-lg-3 form-control text_center">내가 등록한 Mystar</span>
                            <span class="data-value col-lg-6" id="lb_myStarCnt">총00건</span>
                            <button type="button" id="bt_registmyStarList" class="btn-primary pull-right btn-xs form-control"  style="border-radius:3px;">세부내역</button>
                        </p>
                    </div>
                    <div class="col-lg-12 p">
                        <p class="data-row">
                            <span class="data-name col-lg-3 form-control text_center">나를 Mystar로 등록한 회원</span>
                            <span class="data-value col-lg-6" id="lb_meStarList">총00건</span>
                            <button type="button" id="bt_registMeStarList" class="btn-primary pull-right btn-xs form-control"  style="border-radius:3px;">세부내역</button>
                        </p>
                    </div>
                    <div class="col-lg-12 p">
                        <p class="data-row">
                            <span class="data-name col-lg-3 form-control text_center">내가 등록한 Fan</span>
                            <span class="data-value col-lg-6" id="lb_myFan">총00건</span>
                            <button type="button" id="bt_registMyFanlist" class="btn-primary pull-right btn-xs form-control"  style="border-radius:3px;">세부내역</button>
                        </p>
                    </div>
                    <div class="col-lg-12 p">
                        <p class="data-row">
                            <span class="data-name col-lg-3 form-control text_center">나를 등록한 Fan</span>
                            <span class="data-value col-lg-6" id="lb_meFan">총00건</span>
                            <button type="button" id="bt_registMeFanlist" class="btn-primary pull-right btn-xs form-control"  style="border-radius:3px;">세부내역</button>
                        </p>
                    </div>
                    <div class="col-lg-12 p">
                        <p class="data-row">
                            <span class="data-name col-lg-3 form-control text_center">개인공지</span>
                            <span class="data-value col-lg-6" id="lb_noticeCnt">총00건</span>
                            <button type="button" id="bt_myNotice" class="btn-primary pull-right btn-xs form-control"  style="border-radius:3px;">세부내역</button>
                        </p>
                    </div>
                    <div class="col-lg-12 p">
                        <p class="data-row">
                            <span class="data-name col-lg-3 form-control text_center">방송 중 공지</span>
                            <span class="data-value col-lg-6" id="lb_broadNoticeCnt">총00건</span>
                            <button type="button" id="bt_broadNotice" class="btn-primary pull-right btn-xs form-control"  style="border-radius:3px;">세부내역</button>
                        </p>
                    </div>
                    <div class="col-lg-12 p">
                        <p class="data-row">
                            <span class="data-name col-lg-3 form-control text_center">내가 신고한 정보</span>
                            <span class="data-value col-lg-6" id="lb_myDeclarCnt">총00건</span>
                            <button type="button" id="bt_registMyDeclar" class="btn-primary pull-right btn-xs form-control"  style="border-radius:3px;">세부내역</button>
                        </p>
                    </div>
                    <div class="col-lg-12 p">
                        <p class="data-row">
                            <span class="data-name col-lg-3 form-control text_center">나를 신고한 정보</span>
                            <span class="data-value col-lg-6" id="lb_meDeclarCnt">총00건</span>
                            <button type="button" id="bt_registMeDeclar" class="btn-primary pull-right btn-xs form-control"  style="border-radius:3px;">세부내역</button>
                        </p>
                    </div>
                    <div class="col-lg-12 p">
                        <p class="data-row">
                            <span class="data-name col-lg-3 form-control text_center">1:1문의 정보</span>
                            <span class="data-value col-lg-6" id="lb_resPonseCnt">총00건</span>
                            <button type="button" id="bt_resPonse" class="btn-primary pull-right btn-xs form-control"  style="border-radius:3px;">세부내역</button>
                        </p>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.row -->
    </div>
    <!-- /.container-fluid -->
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
        getAjaxData("list", "/rest/member/member/list", "", fn_success, fn_fail);

        $('.input-group.date').datepicker({
            todayBtn: "linked",
            keyboardNavigation: false,
            forceParse: false,
            todayHighlight: true,
            calendarWeeks: false,
            autoclose: true,
            format: "yyyy/mm/dd",
            language: 'kr'
        }).datepicker("setDate", new Date());

    });

    var tmp_sw="true";

    $('#cob_mail').change(function () {
        var tmp = $('#cob_mail').val();
        if(tmp == "1"){
            $("#txt_mailAdr").val("");
        }else{
            $("#txt_mailAdr").val($('#cob_mail').val());
        }
    });
    $("#txt_authNumber").hide();
    $('#bt_authNumberSend').click( function() {
        if($(this).val() == '인증번호 발송'){
            $(this).val("재발송");
        }
        $("#txt_authNumber").show();
        if (tmp_sw == "true") {
            tmp_sw = "false";
            time();
        }
    });

    $('#bt_edite').click( function() {       //리스트
        var str = ""
        var tdArr = new Array();	// 배열 선언
        var checkBtn = $(this);

        // checkBtn.parent() : checkBtn의 부모는 <td>이다.
        // checkBtn.parent().parent() : <td>의 부모이므로 <tr>이다.
        var tr = checkBtn.parent().parent();
        var td = tr.children();

        console.log("클릭한 Row의 모든 데이터 : "+tr.text());

        var no = td.eq(0).text();
        var userid = td.eq(1).text();
        var name = td.eq(2).text();
        var email = td.eq(3).text();


        // 반복문을 이용해서 배열에 값을 담아 사용할 수 도 있다.
        td.each(function(i){
            tdArr.push(td.eq(i).text());
        });

        console.log("배열에 담긴 값 : "+tdArr);

        str +=	" * 클릭된 Row의 td값 = No. : <font color='red'>" + no + "</font>" +
            ", 아이디 : <font color='red'>" + userid + "</font>" +
            ", 이름 : <font color='red'>" + name + "</font>" +
            ", 이메일 : <font color='red'>" + email + "</font>";

    });

    $("#list").click(function(){

        var str = "";
        // var tdArr = new Array();    // 배열 선언

        // 현재 클릭된 Row(<tr>)
        var tr = $(this);
        var td = tr.children();

        // console.log("클릭한 Row의 모든 데이터 : "+tr.text());

        // td.each(function(i){
        //     tdArr.push(td.eq(i).text());
        // });

        // console.log("배열에 담긴 값 : "+tdArr);

        // var mem_no = td.eq(1).text();
        var mem_no = "1111111111111";

        var list = new Array();
        var obj = new Object();
        obj.men_no = mem_no;
        list.push(obj);
        var jsonData = JSON.stringify(list);
        //
        alert(jsonData) ;
        getAjaxData("info", "/rest/member/member/info", jsonData, info_sel_success, fn_fail);
        console.log("@@@@@@@@@@@@@@@@@@@@@@@  2");
    });

    var num = 60 * 1; // 몇분을 설정할지의 대한 변수 선언
    var myVar;
    function time(){
        myVar = setInterval(alertFunc, 1000);
    }
    function alertFunc() {
        var min = num / 60;
        min = Math.floor(min);
        var sec = num - (60 * min);
        var input = min + '분' + sec + '초';
        console.log(input);
        $("#lb_authNumber").text(input);

        if(num == 0){
            num = 60 * 1;
            myVar;
            tmp_sw ="true";
            clearInterval(myVar); // num 이 0초가 되었을대 clearInterval로 타이머 종료
        }
        num--;
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
            paging: false,
            searching: true,
            /*sDom: "RC"+
            "t"+
            "<'row'<'col-sm-6'i><'col-sm-6'p>>",
            colVis: {
                buttonText: 'Show / Hide Columns',
                restore: "Restore",
                showAll: "Show all"
            },*/
        });
    }
    function info_sel_success(dst_id, response) {
        console.log("@@@@@@@@@@@@@@@@@@@ 3");
    }

    function fn_fail(data, textStatus, jqXHR){
        console.log(data, textStatus, jqXHR);
    }

    function getDetail(id){
        // alert(id);
        var mem_no = id;
        getAjaxData("info", "/rest/member/member/info", mem_no, info_sel_success, fn_fail);

    }
</script>

<script id="tmp_list" type="text/x-handlebars-template">
    {{#data}}
    <tr>
        <td>{{NO}}</td>
        <td>{{MemNo}}</td>
        <td><a href="#" onclick="javascript:getDetail(this.id);" id="{{MemNo}}">{{UserID}}</a></td>
        <td>{{NickName}}</td>
        <td>{{Name}}</td>
        <td>{{PhoneNum}}</td>
        <td>{{JoinPlatform}}</td>
        <td>{{Login_out}}</td>
        <td>{{Live}}</td>
    </tr>
    {{/data}}
</script>