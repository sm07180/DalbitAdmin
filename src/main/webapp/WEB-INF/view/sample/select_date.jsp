<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    .a{
        border:1px solid #5e5e5e;
    }

</style>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="container-fluid">

            <div class="row col-lg-12 form-inline" >
                <div class="row well col-lg-6 form-inline">
                    <div class="row col-lg-12 form-inline" >
                        <label style="font-weight: bold">공지등록 기간</label>
                    </div>
                    <div class="row col-lg-12 form-inline">
                        <label class="radio-inline"><input type="radio" name="broad" id="radio_dateAll" value="option1" checked="true">전체</label>
                        <label class="radio-inline"><input type="radio" name="broad" id="radio_dateDay" value="option2">오늘</label>
                        <label class="radio-inline"><input type="radio" name="broad" id="radio_dateWeek" value="option3">1주일</label>
                        <label class="radio-inline"><input type="radio" name="broad" id="radio_dateMon" value="option3">한달</label>
                    </div>

                    <div class="row col-lg-12 form-inline">
                        <label class="checkbox-inline"><input type="checkbox" id="check_dateSel">기간 선택</label>
                        <div class="input-group date col-lg-6" id="date_startSel">
                            <input type="text" class="form-control" id="txt_startSel"><span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                        </div>
                        <label>~</label>
                        <div class="input-group date col-sm-4" id="date_endSel">
                            <input type="text" class="form-control" id="txt_endSel"><span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                        </div>
                    </div>
                </div>
                <div class="row col-lg-6 form-inline">
                    <div class="row col-lg-12 form-inline" >
                        <div class="col-lg-12">
                            <label style="font-weight: bold">로그인된 아이콘</label>
                        </div>
                    </div>
                    <div class="row col-lg-12 form-inline" >
                        <div class="col-lg-12">

                            <select id="selectGubun" name="selectGubun">
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

            <div class="row col-lg-12 form-inline">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        DataTables Advanced Tables
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                <tr>
                                    <th>Rendering engine</th>
                                    <th>Browser</th>
                                    <th>Platform(s)</th>
                                    <th>Engine version</th>
                                    <th>CSS grade</th>
                                </tr>
                                </thead>
                                <tbody id="tableBody"></tbody>
                            </table>
                        </div>
                        <!-- /.table-responsive -->
                    </div>
                    <!-- /.panel-body -->
                </div>
            </div>

            <%--<div class="row">--%>
            <%--<div class="col-xs-6 col-sm-3">.col-xs-6 .col-sm-3<br>Resize your viewport or check it out on your phone for an example.</div>--%>
            <%--&lt;%&ndash;<div class="col-xs-6 col-sm-3">.col-xs-6 .col-sm-3</div>&ndash;%&gt;--%>

            <%--<!-- Add the extra clearfix for only the required viewport -->--%>
            <%--<div class="clearfix visible-xs-block"></div>--%>

            <%--<div class="col-xs-6 col-sm-3">.1</div>--%>
            <%--<div class="col-xs-6 col-sm-3">.1</div>--%>
            <%--<div class="col-xs-6 col-sm-3">.1</div>--%>
            <%--<div class="col-xs-6 col-sm-3">.1</div>--%>
            <%--<div class="col-xs-6 col-sm-3">.1</div>--%>
            <%--<div class="col-xs-6 col-sm-3">.1</div>--%>

            <%--<div class="clearfix visible-xs-block"></div>--%>

            <%--<div class="col-xs-6 col-sm-3">.col-xs-6 .col-sm-3</div>--%>
            <%--<div class="col-xs-6 col-sm-3">.col-xs-6 .col-sm-3</div>--%>
            <%--<div class="col-xs-6 col-sm-3">.col-xs-6 .col-sm-3</div>--%>
            <%--<div class="col-xs-6 col-sm-3">.col-xs-6 .col-sm-3</div>--%>
            <%--<div class="col-xs-6 col-sm-3">.col-xs-6 .col-sm-3</div>--%>
            <%--<div class="col-xs-6 col-sm-3">.col-xs-6 .col-sm-3</div>--%>

            <%--</div>--%>

            <div class="row col-lg-12 form-inline">
                <div class="col-lg-5">
                    <div class="col-lg-12">
                        <p class="data-row">
                            <span class="data-name col-lg-3" style="height:150px;text-align: center;display:table-cell;vertical-align:middle">프로필 이미지</span>
                            <img src="../../../template2/assets/img/profile-avatar.png" alt="Profile Picture" style="width:150px; height: 150px"/>
                            <button type="submit" class="btn btn-default" id="bt_imgChg">사진변경</button>
                        </p>
                    </div>
                    <div class="col-lg-12">
                        <p class="data-row">
                            <span class="data-name col-lg-3" style="text-align: center">UserID</span><span class="data-value col-lg-5">DaldalE</span>
                        </p>
                    </div>
                    <div class="col-lg-12">
                        <p class="data-row">
                            <span class="data-name col-lg-3" style="text-align: center">닉네임</span>
                            <input type="text" class="bootstrap-slider col-lg-6" id="txt_nickName" value="다달이">
                        </p>
                    </div>

                    <div class="col-lg-12">
                        <p class="data-row">
                            <span class="data-name col-lg-3" style="text-align: center">이름</span>
                            <input type="text" class="bootstrap-slider col-lg-6" id="txt_name" value="양달님">
                        </p>
                    </div>
                    <div class="col-lg-12">
                        <p class="data-row">
                            <%--<p class="data-row input-group date">--%>
                            <span class="data-name col-lg-3" style="text-align: center">생년월일</span>
                            <%--<input type="text" class="bootstrap-slider" id="txt_birth" style="width: 47%">--%>
                            <%--<span class="input-group-addon" style="display: inline-block; width: 13%;"><i class="glyphicon glyphicon-calendar"  style="height: 17px"></i></span>--%>
                        </p>
                    </div>
                    <div class="col-lg-12">
                        <p class="data-row">
                            <span class="data-name col-lg-3" style="text-align: center">나이</span>
                            <span class="data-value col-lg-5" id="lb_age">33세</span>
                        </p>
                    </div>
                    <div class="col-lg-12">
                        <p class="data-row">
                            <span class="data-name col-lg-3" style="text-align: center">성별</span>
                            <label class="radio-inline"><input type="radio" name="broad" id="radio_male" value="option1" checked="true">남자</label>
                            <label class="radio-inline"><input type="radio" name="broad" id="radio_female" value="option2">여자</label>
                        </p>
                    </div>
                    <div class="col-lg-12">
                        <p class="data-row">
                            <span class="data-name col-lg-3" style="text-align: center">연락처</span>
                            <input type="text" class="bootstrap-slider col-lg-6" id="txt_phon" value="010-1111-2222">
                        </p>
                    </div>
                    <div class="col-lg-12">
                        <p class="data-row">
                            <span class="data-name col-lg-3" style="text-align: center">이메일</span>
                            <input type="text" class="bootstrap-slider col-lg-6" id="txt_eMail" value="dabit00@gmail.com">
                        </p>
                    </div>
                    <div class="col-lg-12">
                        <p class="data-row">
                            <span class="data-name col-lg-3" style="text-align: center">비밀번호</span>
                            <input type="password" class="bootstrap-slider col-lg-6" id="txt_pass" value="123412341234">
                            <button type="button" id="bt_resatPass" class="btn btn-primary btn-xs disabled"  style="border-radius:3px;width: 110px;float:right">비밀번호 초기화</button>
                        </p>
                    </div>

                    <div class="col-lg-12" style="height:56px;">
                        <p class="data-row">
                            <span class="data-name col-lg-3" style="height:56px;text-align: center;">방송기록</span>
                            <span class="data-value col-lg-6">총00건</span>
                            <button type="button" id="bt_broadHistory" class="btn btn-primary btn-xs disabled"  style="border-radius:3px;width: 110px;float:right">세부내역</button>
                        </p>
                    </div>
                    <div class="col-lg-12" style="height:56px;">
                        <p class="data-row">
                            <span class="data-name col-lg-3" style="height:56px;text-align: center">청취기록</span>
                            <span class="data-value col-lg-6">총00건</span>
                            <button type="button" id="bt_listenHistory" class="btn btn-primary btn-xs disabled"  style="border-radius:3px;width: 110px;float:right">세부내역</button>
                        </p>
                    </div>

                    <%--<div class="col-lg-12" style="height:87px;">--%>
                    <%--<p class="data-row">--%>
                    <%--<span class="data-name col-lg-2" style="height:87px;text-align: center">개인결제정보</span>--%>
                    <%--</p>--%>
                    <%--<div class="col-lg-9">--%>
                    <%--<p class="data-row">--%>
                    <%--<span class="data-name col-lg-2" style="width: 20%;">결제</span><span class="data-value">총00건</span>--%>
                    <%--<button type="button" id="bt_payHistory" class="btn btn-primary btn-xs disabled"  style="border-radius:3px;width: 110px;float:right">세부내역</button>--%>
                    <%--</p>--%>
                    <%--</div>--%>
                    <%--<div class="col-lg-9">--%>
                    <%--<p class="data-row">--%>
                    <%--<span class="data-name col-lg-2" style="width: 20%">환불</span><span class="data-value">총00건</span>--%>
                    <%--<button type="button" id="bt_refundHistory" class="btn btn-primary btn-xs disabled"  style="border-radius:3px;width: 110px;float:right">세부내역</button>--%>
                    <%--</p>--%>
                    <%--</div>--%>
                    <%--<div class="col-lg-9">--%>
                    <%--<p class="data-row">--%>
                    <%--<span class="data-name col-lg-2" style="width: 20%">선물</span><span class="data-value">총00건</span>--%>
                    <%--<button type="button" id="bt_giftHistory" class="btn btn-primary btn-xs disabled"  style="border-radius:3px;width: 110px;float:right">세부내역</button>--%>
                    <%--</p>--%>
                    <%--</div>--%>
                    <%--<div class="col-lg-9">--%>
                    <%--<p class="data-row">--%>
                    <%--<span class="data-name col-lg-2" style="width: 20%">환전</span><span class="data-value col-lg-2">총00건</span>--%>
                    <%--<button type="button" id="bt_exchangeHistory" class="btn btn-primary btn-xs disabled"  style="border-radius:3px;width: 110px;float:right">세부내역</button>--%>
                    <%--</p>--%>
                    <%--</div>--%>
                    <%--</div>--%>
                    <%--<div class="col-lg-12">--%>
                    <%--<p class="data-row">--%>
                    <%--<span class="data-name col-lg-3">현재 접속 플랫폼</span>--%>
                    <%--<span class="data-value col-lg-5" html="">Mobile (Android)</span>--%>
                    <%--<button type="button" id="bt_accessPlatform" class="btn btn-primary btn-xs disabled"  style="border-radius:3px;width: 110px;float:right">세부내역</button>--%>
                    <%--</p>--%>
                    <%--</div>--%>
                </div>
                <div class="col-lg-6">
                    <div class="col-lg-12">
                        <p class="data-row">
                            <span class="data-name col-lg-3" style="text-align: center">회원레벨</span>
                            <select id="cob_userLevel" name="emailSelection" style="width: 50%">
                                <option value="1" selected="selected">직접입력</option>
                                <option value="gmail.com">gmail.com</option>
                                <option value="naver.com">naver.com</option>
                                <option value="hanmail.net">hanmail.net</option>
                            </select>
                        </p>
                    </div>
                    <div class="col-lg-12">
                        <p class="data-row">
                            <span class="data-name col-lg-3" style="text-align: center">DJ등급</span>
                            <select id="cob_djLevel" name="emailSelection" style="width: 50%">
                                <option value="normal">일반DJ</option>
                                <option value="best">베스트DJ</option>
                            </select>
                        </p>
                    </div>
                    <div class="col-lg-12">
                        <p class="data-row">
                            <span class="data-name col-lg-3" style="text-align: center">청취자 등급</span>
                            <select id="cob_lisLevel" name="emailSelection" style="width: 50%">
                                <option value="normal">일반청취자</option>
                                <option value="best">베스트 청취자</option>
                            </select>
                        </p>
                    </div>
                    <div class="col-lg-12">
                        <p class="data-row">
                            <span class="data-name col-lg-3" style="text-align: center">접속상태</span>
                            <label class="radio-inline"><input type="radio" name="broad" id="radio_login" value="option1" checked="true">Login</label>
                            <label class="radio-inline"><input type="radio" name="broad" id="radio_logout" value="option2">Logout</label>
                        </p>
                    </div>
                    <div class="col-lg-12">
                        <p class="data-row">
                            <span class="data-name col-lg-3" style="text-align: center">생방상태</span>
                            <label class="radio-inline"><input type="radio" name="broad" id="radio_liveOn" value="option1" checked="true">생방중</label>
                            <label class="radio-inline"><input type="radio" name="broad" id="radio_liveOff" value="option2">방송OFF</label>
                        </p>
                    </div>
                    <div class="col-lg-12">
                        <p class="data-row">
                            <span class="data-name col-lg-3" style="text-align: center">청취상태</span>
                            <label class="radio-inline"><input type="radio" name="broad" id="radio_lisOn" value="option1" checked="true">청취중</label>
                            <label class="radio-inline"><input type="radio" name="broad" id="radio_lisOff" value="option2">청취OFF</label>
                        </p>
                    </div>

                    <div class="col-lg-12">
                        <p class="data-row">
                            <span class="data-name col-lg-3" >&nbsp;</span><span class="data-value" style="width: 50%">&nbsp;</span>
                        </p>
                    </div>
                    <div class="col-lg-12" style="height:56px;">
                        <p class="data-row">
                            <span class="data-name col-lg-3" style="height:56px;text-align: center;">가입플랫폼(첫연동일)</span>
                            <span class="data-value" style="width: 20%">달빛</span>
                            <span class="data-value" style="width: 20%">페이스북</span>
                        </p>
                    </div>
                    <div class="col-lg-12">
                        <p class="data-row">
                            <span class="data-name col-lg-3" style="text-align: center">회원가입일시</span>
                            <span class="data-value" style="width: 50%" id="lb_joinDate">2020.02.03 09:27:30</span>
                        </p>
                    </div>
                    <div class="col-lg-12">
                        <p class="data-row">
                            <span class="data-name col-lg-3" style="text-align: center">회원탈퇴일시</span>
                            <span class="data-value" style="width: 50%" id="lb_cancelMb">2020.02.03 09:27:30</span>
                        </p>
                    </div>
                    <div class="col-lg-12">
                        <p class="data-row">
                            <span class="data-name col-lg-3" style="text-align: center">최근 정보 수정일시</span>
                            <span class="data-value" style="width: 50%" id="lb_editDate">2020.02.03 09:27:30</span>
                        </p>
                    </div>
                    <div class="col-lg-12">
                        <p class="data-row">
                            <span class="data-name col-lg-3" style="text-align: center">최근 정보 수정 처리자</span>
                            <span class="data-value" style="width: 50%" id="lb_editUser">admin</span>
                        </p>
                    </div>

                    <div class="col-lg-12" style="height:87">
                        <p class="data-row">
                            <span class="data-row data-name " style="height:87px;text-align: center">개인결제정보</span>
                            <span class="data-name" style="width: 20%;text-align: left;heigth:24">내가 등록한 MyStar</span>
                            <span class="data-value" style="width: 20%;heigth:24">총00건</span>
                            <button type="button" id="bt_mystarHistory1" class="btn btn-primary btn-xs disabled" style="border-radius:3px;width: 110px;float:right">세부내역</button>

                            <span class="data-name" style="width: 20%;text-align: left;heigth:24">나를 MyStar로 등록한 회언</span>
                            <span class="data-value" style="width: 20%;heigth:24">총00건</span>
                            <button type="button" id="bt_mystarHistory2" class="btn btn-primary btn-xs disabled"  style="border-radius:3px;width: 110px;float:right">세부내역</button>
                        </p>
                        <%--<p class="data-row">--%>

                            <%--<span class="data-row data-name " style="height:87px;text-align: center">개인결제정보</span>--%>
                            <%--<span class="data-name" style="width: 20%;text-align: center">내가 등록한 MyStar</span>--%>
                            <%--<span class="data-value" style="width: 20%">총00건</span>--%>
                            <%--<button type="button" id="bt_mystarHistory" class="btn btn-primary btn-xs disabled"  style="border-radius:3px;width: 110px;float:right">세부내역</button>--%>

                            <%--&lt;%&ndash;<span class="data-name" style="width: 20%">나를 MyStar로 등록한 회언</span>&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<span class="data-value" style="width: 20%">총00건</span>&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<button type="button" id="bt_mystarHistory" class="btn btn-primary btn-xs disabled"  style="border-radius:3px;width: 110px;float:right">세부내역</button>&ndash;%&gt;--%>
                        <%--</p>--%>
                    </div>
                </div>




                <%--<div class="col-lg-9">--%>
                <%--<div class="col-lg-12">--%>
                <%--<div class="basic-info col-lg-6">--%>
                <%--<p class="data-row">--%>
                <%--<span class="data-name" style="width: 100px">이름</span>--%>
                <%--<input type="text" class="bootstrap-slider" id="1" value="양위디" style="width: 35%">--%>
                <%--<button type="button" id="bt_nameEdit" class="btn btn-primary btn-xs"  style="border-radius:3px;width: 25%;">수정하기</button>--%>
                <%--</p>--%>
                <%--</div>--%>
                <%--<div class="basic-info col-lg-2">--%>
                <%--<p class="data-row"><span class="data-name" style="width: 100px">나이</span><span class="data-value" >22세</span></p>--%>
                <%--</div>--%>
                <%--<div class="basic-info col-lg-6">--%>
                <%--<p class="data-row">--%>
                <%--<span class="data-name" style="width: 100px">성별</span>--%>
                <%--&lt;%&ndash;<span class="data-value" style="width: 60%">남</span>&ndash;%&gt;--%>
                <%--<label class="control-inline fancy-radio">--%>
                <%--<input type="radio" name="inline-radio" checked>--%>
                <%--<span><i></i>남</span>--%>
                <%--</label>--%>
                <%--<label class="control-inline fancy-radio">--%>
                <%--<input type="radio" name="inline-radio">--%>
                <%--<span><i></i>여</span>--%>
                <%--</label>--%>
                <%--</p>--%>
                <%--</div>--%>
                <%--</div>--%>
                <%--<div class="col-lg-12">--%>
                <%--<div class="basic-info col-lg-6">--%>
                <%--<p class="data-row">--%>
                <%--<span class="data-name" style="width: 100px">닉네임</span>--%>
                <%--&lt;%&ndash;<input type="text" class="bootstrap-slider" id="txt_nickName" value="위디위디" style="width: 35%">&ndash;%&gt;--%>
                <%--<button type="button" id="bt_nickCheck" class="btn btn-primary btn-xs"  style="border-radius:3px;width: 25%;">중복체크</button>--%>
                <%--</p>--%>
                <%--</div>--%>
                <%--<div class="basic-info col-lg-2">--%>
                <%--<p class="data-row"><span class="data-name" style="width: 100px">레벨</span><span class="data-value">52</span></p>--%>
                <%--</div>--%>
                <%--<div class="basic-info col-lg-6">--%>
                <%--<p class="data-row">--%>
                <%--<span class="data-name" style="width: 100px">휴대폰번호</span>--%>
                <%--<input type="text" class="bootstrap-slider" id="txt_phon1" value="010-9999-0000" style="width: 25%">--%>
                <%--<input type="text" class="bootstrap-slider" id="txt_authNumber" placeholder="인증번호" value="" style="width: 15%">--%>
                <%--<label id="lb_authNumber"></label>--%>
                <%--<button type="button" id="bt_authNumberSend" class="btn btn-primary btn-xs"  style="border-radius:3px;width: 20%">인증번호 발송</button>--%>
                <%--</p>--%>
                <%--</div>--%>
                <%--</div>--%>
                <%--<div class="col-lg-12">--%>
                <%--<div class="basic-info col-lg-12">--%>
                <%--<p class="data-row">--%>
                <%--<span class="data-name" style="width: 100px">이메일</span>--%>
                <%--<input type="text" class="bootstrap-slider" id="txt_mailID" value="Redio00" style="width: 13%">@--%>
                <%--<input type="text" class="bootstrap-slider" id="txt_mailAdr" value="naver.com" style="width: 13%">--%>
                <%--<select id="cob_mail" name="emailSelection" style="width: 13%">--%>
                <%--<option value="1" selected="selected">직접입력</option>--%>
                <%--<option value="gmail.com">gmail.com</option>--%>
                <%--<option value="naver.com">naver.com</option>--%>
                <%--<option value="hanmail.net">hanmail.net</option>--%>
                <%--</select>--%>
                <%--</p>--%>
                <%--</div>--%>
                <%--</div>--%>
                <%--<div class="col-lg-12">--%>
                <%--<div class="basic-info col-lg-6">--%>
                <%--<p class="data-row">--%>
                <%--<span class="data-name" style="width: 100px">비밀번호</span>--%>
                <%--<input type="password" class="bootstrap-slider" id="txt_pass1" value="****" style="width: 25%">--%>
                <%--<button type="button" id="bt_tempPassMail" class="btn btn-primary btn-xs disabled"  style="border-radius:3px;width: 27%;">임시 비밀번호 메일 발송</button>--%>
                <%--<button type="button" id="bt_tempPassPhon" class="btn btn-primary btn-xs disabled"  style="border-radius:3px;width: 27%;">임시 비밀번호 문자 발송</button>--%>
                <%--</p>--%>
                <%--</div>--%>
                <%--<div class="basic-info col-lg-6">--%>
                <%--<p class="data-row input-group date">--%>
                <%--&lt;%&ndash;<span class="data-name" style="width: 100px">생년월일</span>&ndash;%&gt;--%>
                <%--&lt;%&ndash;<span class="data-value" style="width: 60%">1990.10.26</span>&ndash;%&gt;--%>
                <%--&lt;%&ndash;<input type="text" class="bootstrap-slider" id="txt_birthEdit" style="width: 25%">&ndash;%&gt;--%>
                <%--&lt;%&ndash;<span class="input-group-addon" style="display: inline-block; width: 13%;"><i class="glyphicon glyphicon-calendar"  style="height: 17px"></i></span>&ndash;%&gt;--%>
                <%--&lt;%&ndash;<input type="text" class="bootstrap-slider" id="txt_birthEdit">&ndash;%&gt;--%>
                <%--</p>--%>

                <%--&lt;%&ndash;<div class="input-group date" id="date_birthEdit">&ndash;%&gt;--%>
                <%--&lt;%&ndash;<input type="text" class="bootstrap-slider" id="txt_birthEdit"><span class="input-group-addon"><i class="glyphicon glyphicon-calendar"  style="height: 17px"></i></span>&ndash;%&gt;--%>
                <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                <%--</div>--%>
                <%--</div>--%>
                <%--<div class="col-lg-12">--%>
                <%--<div class="basic-info col-lg-6">--%>
                <%--<p class="data-row"><span class="data-name" style="width: 100px">생방송여부</span><span class="data-value" style="width: 60%">on air</span></p>--%>
                <%--</div>--%>
                <%--<div class="basic-info col-lg-6">--%>
                <%--<p class="data-row"><span class="data-name" style="width: 100px">회원가입경로</span><span class="data-value" style="width: 60%">Naver</span></p>--%>
                <%--</div>--%>
                <%--<div class="basic-info col-lg-6">--%>
                <%--<p class="data-row"><span class="data-name" style="width: 100px">최근정보 수정일</span><span class="data-value" style="width: 60%">2020.01.03 18:00:00</span></p>--%>
                <%--</div>--%>
                <%--</div>--%>

                <%--</div>--%>
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

<script>
    $(document).ready(function() {
        getAjaxData("list", "/rest/sample/list", "", fn_success, fn_fail);
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

    $('#bt_list').click( function() {       //리스트

    });

    $('#bt_edit').click( function() {       //수정완료

    });


    $('#bt_nameEdit').click( function() {       //이름 수정

    });

    $('#bt_nickCheck').click( function() {       //닉네임중복체크

    });

    $('#bt_tempPassMail').click( function() {       //임시비밀번호메일발송

    });

    $('#bt_tempPassPhon').click( function() {       //임시비밀번호문자발송

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

        $('#dataTables-example').DataTable({
            responsive: true
        });
    }

    function fn_fail(data, textStatus, jqXHR){
        console.log(data, textStatus, jqXHR);
    }
</script>

<script id="tmp_list" type="text/x-handlebars-template">
    {{#data}}
    <tr>
        <td>{{renderingEngine}}</td>
        <td>{{browser}}</td>
        <td>{{platform}}</td>
        <td class="center">{{version}}</td>
        <td class="center">{{grade}}</td>
    </tr>
    {{/data}}
</script>