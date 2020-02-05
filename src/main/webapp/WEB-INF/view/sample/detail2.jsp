<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="content">
    <div class="main-header">
        <h2>Dynamic Table</h2>
        <em>tables with lot of features and interactivity</em>
    </div>

    <div class="main-content">
        <!-- SHOW HIDE COLUMNS DATA TABLE -->
        <div class="widget">
            <div class="widget-header">
                <h3><i class="fa fa-edit"></i> 회원상세</h3>
            </div>
            <div class="widget-content">
                <div class="form-horizontal">
                    <div class="form-group">
                        <div class="col-md-6">
                            <label class="col-md-3 control-label">프로필 이미지</label>
                            <div class="col-md-9">
                                <img src="/template2/assets/img/profile-avatar.png" alt="Profile Picture" style="height:100px;">
                            </div>
                        </div>

                        <div class="col-md-6">
                            <label class="col-md-3 control-label">회원레벨</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" placeholder="text field">
                            </div>

                            <label class="col-md-3 control-label">DJ 등급</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" placeholder="text field">
                            </div>

                            <label class="col-md-3 control-label">청취자 등급</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" placeholder="text field">
                            </div>

                            <label class="col-md-3 control-label">접속상태</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" placeholder="text field">
                            </div>

                            <label class="col-md-3 control-label">생방상태</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" placeholder="text field">
                            </div>

                            <label class="col-md-3 control-label">청취상태</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" placeholder="text field">
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-md-6">
                            <label class="col-md-3 control-label">UserID</label>
                            <div class="col-md-3"><span>TEST1234</span></div>
                            <label class="col-md-2 control-label">닉네임</label>
                            <div class="col-md-4"><input type="text" class="form-control" placeholder="text field"></div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-md-6">
                            <label class="col-md-3 control-label">이름</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" placeholder="text field">
                            </div>
                            <label class="col-md-3 control-label">생년월일</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" placeholder="text field">
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

                    <div class="form-group">
                        <div class="col-md-6">
                            <label class="col-md-3 control-label">나이</label>
                            <div class="col-md-3">
                                <input type="text" class="form-control" placeholder="text field">
                            </div>
                            <label class="col-md-2 control-label">성별</label>
                            <div class="col-md-4">
                                <div class="col-lg-12">
                                    <label class="control-inline fancy-radio">
                                        <input type="radio" name="inline-radio">
                                        <span><i></i>남자</span>
                                    </label>
                                    <label class="control-inline fancy-radio">
                                        <input type="radio" name="inline-radio">
                                        <span><i></i>여자</span>
                                    </label>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <label class="col-md-3 control-label">회원 가입일시</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" placeholder="text field">
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-md-6">
                            <label class="col-md-3 control-label">연락처</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" placeholder="text field">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label class="col-md-3 control-label">회원 탈퇴일시</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" placeholder="text field">
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-md-6">
                            <label class="col-md-3 control-label">이메일</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" placeholder="text field">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label class="col-md-3 control-label">최근 정보 수정 처리자</label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" placeholder="text field">
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-md-6">
                            <label class="col-md-3 control-label">방송기록</label>
                            <div class="col-md-9">
                                총 00건
                                <button type="button" class="btn pull-right">세부내역</button>
                            </div>
                        </div>
                        <div class="col-md-1">
                            <label class="col-md-3 control-label">MyStar</label>
                        </div>
                        <div class="col-md-5">
                            <label class="col-md-6 control-label">내가 등록한 MyStar</label>
                            <div class="col-md-6">
                                총 00건
                                <button type="button" class="btn pull-right">세부내역</button>
                            </div>

                            <label class="col-md-6 control-label">나를 MyStar로 등록한 회원</label>
                            <div class="col-md-6">
                                총 00건
                                <button type="button" class="btn pull-right">세부내역</button>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-md-6">
                            <label class="col-md-3 control-label">청취기록</label>
                            <div class="col-md-9">
                                총 00건
                                <button type="button" class="btn pull-right">세부내역</button>
                            </div>
                        </div>

                        <div class="col-md-1">
                            <label class="col-md-3 control-label">Fan</label>
                        </div>

                        <div class="col-md-5">
                            <label class="col-md-6 control-label">내가 등록한 Fan</label>
                            <div class="col-md-6">
                                총 00건
                                <button type="button" class="btn pull-right">세부내역</button>
                            </div>

                            <label class="col-md-6 control-label">나를 등록한 Fan</label>
                            <div class="col-md-6">
                                총 00건
                                <button type="button" class="btn pull-right">세부내역</button>
                            </div>
                        </div>
                    </div>


                    <div class="form-group">
                        <div>
                            <div class="col-md-6">
                                <div class="col-md-12 no-padding">
                                    <div class="col-md-3">개인결제 정보</div>
                                    <div class="col-md-9 no-padding">
                                        <div class="col-md-12">
                                            <div class="col-md-3">결제</div>
                                            <div class="col-md-9 no-padding">
                                                <div>
                                                    총 00건
                                                    <button type="button" class="btn pull-right">세부내역</button>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-md-12">
                                            <div class="col-md-3">환불</div>
                                            <div class="col-md-9 no-padding">
                                                <div>
                                                    총 00건
                                                    <button type="button" class="btn pull-right">세부내역</button>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-md-12">
                                            <div class="col-md-3">선물</div>
                                            <div class="col-md-9 no-padding">
                                                <div>
                                                    총 00건
                                                    <button type="button" class="btn pull-right">세부내역</button>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-md-12">
                                            <div class="col-md-3">환전</div>
                                            <div class="col-md-9 no-padding">
                                                <div>
                                                    총 00건
                                                    <button type="button" class="btn pull-right">세부내역</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-12">
                                    <div class="col-md-6">접속 플랫폼</div>
                                    <div class="col-md-6 no-padding">
                                        총 00건
                                        <button type="button" class="btn pull-right">세부내역</button>
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
                                                    총 00건
                                                    <button type="button" class="btn pull-right">세부내역</button>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-md-12">
                                            <div class="col-md-3">방송중공지</div>
                                            <div class="col-md-9 no-padding">
                                                <div>
                                                    총 00건
                                                    <button type="button" class="btn pull-right">세부내역</button>
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
                                                    총 00건
                                                    <button type="button" class="btn pull-right">세부내역</button>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-md-12">
                                            <div class="col-md-3">나를 신고한 정보</div>
                                            <div class="col-md-9 no-padding">
                                                <div>
                                                    총 00건
                                                    <button type="button" class="btn pull-right">세부내역</button>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-md-12">
                                            <div class="col-md-3">1:1 문의정보</div>
                                            <div class="col-md-9 no-padding">
                                                <div>
                                                    총 00건
                                                    <button type="button" class="btn pull-right">세부내역</button>
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
        <!-- END SHOW HIDE COLUMNS DATA TABLE -->
    </div>
    <!-- /main-content -->
</div>
