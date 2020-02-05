<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div class="basic-info">
    <p></p>


    <%-- 프로필 이미지 --%>
    <div class="row">
        <div class="col-sm-6">
            <p class="data-row">
                <span class="data-name">ProfileImg</span>
                <span class="data-value"> <%-- --%></span>
            </p>
        </div>

    <%-- 열 6줄--%>
        <div class="col-sm-6">
             <p class="data-row">
                 <span class="data-name">회원레벨</span>
                 <span class="data-value">
                     <select name="select2" id="level" class="select2">
                         <option value="option1">1레벨</option>
                         <option value="option2">2레벨</option>
                         <option value="option3">3레벨</option>
                         <option value="option4">4레벨</option>
                     </select>
                 </span>
             </p>
            <p class="data-row">
                <span class="data-name">DJ등급</span>
                <span class="data-value">
                    <select name="select2" id="DjGrade" class="select2">
                         <option value="option1">베스트DJ</option>
                         <option value="option2">전체DJ</option>
                    </select>
                </span>

            </p>
            <p class="data-row">
                <span class="data-name">청취자 등급</span>
                <span class="data-value">
                    <select name="select2" id="ListenerGrade" class="select2">
                         <option value="option1">베스트청취자</option>
                         <option value="option2">전체청취자</option>
                    </select>
                </span>
            </p>
            <p class="data-row">
                <span class="data-name">접속상태</span>
                <span class="data-value">
                    <label class="control-inline fancy-radio">
                        <input type="radio" name="log" value="in" checked>
                        <span><i></i>LogIn</span>
                    </label>
                    <label class="control-inline fancy-radio">
                        <input type="radio" name="log" value="out">
                        <span><i></i>LogOut</span>
                    </label>
                </span>
            </p>
            <p class="data-row">
                <span class="data-name">생방상태</span>
                <span class="data-value">
                    <label class="control-inline fancy-radio">
                        <input type="radio" name="onair" value="on" checked>
                        <span><i></i>생방중</span>
                    </label>
                    <label class="control-inline fancy-radio">
                        <input type="radio" name="onair" value="off">
                        <span><i></i>방송 OFF</span>
                    </label>
                </span>
            </p>
            <p class="data-row">
                <span class="data-name">청취상태</span>
                <span class="data-value">
                    <label class="control-inline fancy-radio">
                        <input type="radio" name="listen" value="on" checked>
                        <span><i></i>청취중</span>
                    </label>
                    <label class="control-inline fancy-radio">
                        <input type="radio" name="listen" value="off">
                        <span><i></i>청취 OFF</span>
                    </label>
                </span>
            </p>
        </div>

    </div>



        <div class="row">

                <div class="col-sm-6">
                    <div class="row">
                        <div class="col-sm-5">
                            <p class="data-row">
                                <span class="data-name">UserID</span>
                                <span class="data-value">
                                    DaldalE
                                </span>
                            </p>
                        </div>
                        <div class="col-sm-7">
                            <p class="data-row">
                                <span class="data-name">닉네임</span>
                                <span class="data-value">
                                    <%--<input type="text" class="bootstrap-slider" value="다달이">--%>
                                    다달이
                                </span>
                            </p>
                        </div>
                    </div>
                </div>

            <%--<div class="col-sm-6">
                <p class="data-row">
                    <span class="data-name"></span>
                    <span class="data-value"></span>
                </p>
            </div>--%>
        </div>



    <div class="row">
        <div class="col-sm-6">
            <p class="data-row">
                <span class="data-name">이름</span>
                <span class="data-value">
                    <input type="text" class="bootstrap-slider-vertical" value="양달님">
                </span>
            </p>
        </div>

        <%--가입 플랫폼(1) --%>
        <div class="col-sm-6">
            <p class="data-row">
                <span class="data-name">가입플랫폼 (첫 연동일)</span>
                <span class="data-value">
                    달빛 <i class="fa fa-moon-o"></i>  &nbsp&nbsp&nbsp&nbsp&nbsp YY.MM.DD tt.mm.ss <br>
                    페이스북 <i class="fa fa-facebook-official"></i> YY.MM.DD tt.mm.ss
                </span>
            </p>
        </div>
    </div>



    <div class="row">
        <div class="col-sm-6">
            <p class="data-row">
                <span class="data-name">생년월일</span>
                <span class="data-value">
                    <input type="text" class="bootstrap-slider" value="2020-01-30">
                </span>
            </p>
        </div>


        <%--가입 플랫폼(2) --%>
        <%--<div class="col-sm-6">
            <p class="data-row">
                <span class="data-name">가입플랫폼 (첫 연동일)</span>
                <span class="data-value">
                    달빛 <i class="fa fa-moon-o"></i>  &nbsp&nbsp&nbsp&nbsp&nbsp YY.MM.DD tt.mm.ss <br>
                    페이스북 <i class="fa fa-facebook-official"></i> YY.MM.DD tt.mm.ss
                </span>
            </p>
        </div>--%>
    </div>



    <div class="row">

        <div class="col-sm-6">
            <div class="row">
                <div class="col-sm-5">
                    <p class="data-row">
                        <span class="data-name">나이</span>
                        <span class="data-value">33세</span>
                    </p>
                </div>
                <div class="col-sm-7">
                    <p class="data-row">
                        <span class="data-name">성별</span>
                        <span class="data-value">
                            <label class="control-inline fancy-radio">
                                <input type="radio" name="gender" value="man" checked>
                                <span><i></i>남자</span>
                            </label>
                            <label class="control-inline fancy-radio">
                                <input type="radio" name="gender" value="woman">
                                <span><i></i>여자</span>
                            </label>
                        </span>
                    </p>
                </div>
            </div>
        </div>






        <div class="col-sm-6">
            <p class="data-row">
                <span class="data-name">회원 가입일시</span>
                <span class="data-value">YY.MM.DD tt.mm.ss</span>
            </p>
        </div>
    </div>



    <div class="row">
        <div class="col-sm-6">
            <p class="data-row">
                <span class="data-name">연락처</span>
                <span class="data-value">
                    <input type="text" class="bootstrap-slider-vertical" value="010-9941-0000">
                </span>
            </p>
        </div>
        <div class="col-sm-6">
            <p class="data-row">
                <span class="data-name">회원 탈퇴일시</span>
                <span class="data-value">YY.MM.DD tt.mm.ss</span>
            </p>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-6">
            <p class="data-row">
                <span class="data-name">이메일</span>
                <span class="data-value">
                    <input type="text" class="bootstrap-slider-vertical" value="Dalbit00@gmail.com">
                </span>
            </p>
        </div>
        <div class="col-sm-6">
            <p class="data-row">
                <span class="data-name">최근 정보 수정일시</span>
                <span class="data-value">YY.MM.DD tt.mm.ss</span>
            </p>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-6">
            <p class="data-row">
                <span class="data-name">비밀번호</span>
                <span class="data-value">

                    <input type="password" class="bootstrap-slider" value="1234">
                    <button type="button" class="btn-group-xs btn-default">비밀번호 초기화</button>
                </span>
            </p>
        </div>
        <div class="col-sm-6">
            <p class="data-row">
                <span class="data-name">최근 정보 수정처리자</span>
                <span class="data-value">DaldalE</span>
            </p>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-6">
            <p class="data-row">
                <span class="data-name">방송기록</span>
                <span class="data-value">총 OO건
                        <button type="button" class="btn-group-xs btn-default">세부내역</button>
                </span>
            </p>
        </div>
        <div class="col-sm-6">
            <p class="data-row">

                <span class="data-name">My Star</span>
                <%-- 2개로 나뉨 --%>

                <span class="data-value">
                    <div class="row">
                        <%--<button type="button" class="btn-group-xs btn-default">세부내역</button>--%>
                        <div class="col-sm-6">

                        </div>

                    </div>
                </span>
            </p>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-6">
            <p class="data-row">
                <span class="data-name">청취기록</span>
                <span class="data-value">총 OO건
                        <button type="button" class="btn-group-xs btn-default">세부내역</button>
                </span>
            </p>
        </div>
        <div class="col-sm-6">
            <p class="data-row">
                <span class="data-name">Fan</span>
                <%-- 2개로 나뉨 --%>


                <span class="data-value">총 OO명
                    <button type="button" class="btn-group-xs btn-default">세부내역</button>
                </span>
            </p>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-6">
            <p class="data-row">
                <span class="data-name">개인결제정보</span>
                <%-- 4개로 나뉨 --%>


                <span class="data-value">총 OO건
                    <button type="button" class="btn-group-xs btn-default">세부내역</button>
                </span>
            </p>
        </div>
        <div class="col-sm-6">
            <p class="data-row">
                <span class="data-name">공지</span>
                <%-- 2개로 나뉨 --%>

                <span class="data-value">총 OO건
                    <button type="button" class="btn-group-xs btn-default">세부내역</button>
                </span>
            </p>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-6">
            <p class="data-row">
                <span class="data-name">현재 접속 플랫폼</span>
                <span class="data-value">Mobile (Android)
                    <button type="button" class="btn-group-xs btn-default">세부내역</button>
                </span>
            </p>
        </div>
        <div class="col-sm-6">
            <p class="data-row">
                <span class="data-name">신고/문의</span>
                <%-- 3개로 나뉨 --%>

                <span class="data-value">총 OO건
                    <button type="button" class="btn-group-xs btn-default">세부내역</button>
                </span>
            </p>
        </div>
    </div>





</div>