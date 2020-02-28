<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>

    .data-row .data-name {
        width: 7em;
        background-color: #e3e3e3;
        color: #5b5b5b;
        font-size: 0.9em;
        vertical-align: top;
    }
    .button_right{
        float: right;
        white-space:nowrap;
    }
    .btn btn-default lower {
        color: #fff;
        background-color: #828282;
        border-color: #777777;
    }

</style>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="col-lg-12">
            <label>ㆍ1:1 문의 제목 클릭 시 상세 정보를 확인할 수 있습니다. 신속한 처리 바랍니다.</label><br>
        </div>
        <div class="row">
            <div class="col-lg-2">
                <p class="data-row">
                    <span class="data-name">No</span>
                    <span class="data-value">41</span>
                </p>
            </div>
            <div class="col-lg-2">
                <p class="data-row">
                    <span class="data-name">문의 구분</span>
                    <span class="data-value">
                        <select class="form-control" name="searchType" id="searchType">
                            <option value="1">1:1문의</option>
                            <option value="2">전화문의</option>
                        </select>
                    </span>
                </p>
                <p class="data-row">
                    <span class="data-name">구분</span>
                    <span class="data-value">
                        <select class="form-control" name="sortType" id="sortType">
                            <option value="1">음란성</option>
                            <option value="2">방송</option>
                            <option value="3">욕설</option>
                        </select>
                    </span>
                </p>
            </div>
            <div class="col-lg-2">
                <p class="data-row">
                    <span class="data-name">문의 UserID</span>
                    <span class="data-value">ID</span>
                </p>
            </div>
            <div class="col-lg-2">
                <p class="data-row">
                    <span class="data-name">신고대상 UserID</span>
                    <span class="data-value">ID</span>
                </p>
            </div>
            <div class="col-lg-2">
                <p class="data-row">
                    <span class="data-name">접수일시</span>
                    <span class="data-value">날짜</span>
                </p>
            </div>
            <div class="col-lg-2">
                <p class="data-row">
                    <span class="data-name">첨부파일</span>
                    <span class="data-value">OO건</span>
                </p>
                <p class="data-row">
                    <span class="data-name">처리상태</span>
                    <span class="data-value">미처리</span>
                </p>
            </div>
        </div>

        <br>

        <div class="row">
            <div class="col-lg-6">
                <p class="data-row">
                    <span class="data-name">문의 제목</span>
                    <span class="data-value"></span>
                </p>
            </div>
            <div class="col-lg-2">
                <p class="data-row">
                    <span class="data-name">플랫폼</span>
                    <span class="data-value">셀렉박스</span><br>
                </p>
            </div>
            <div class="col-lg-2">
                <p class="data-row">
                    <span class="data-name">처리일시</span>
                    <span class="data-value"> - </span>
                </p>
            </div>
            <div class="col-lg-2">
                <p class="data-row">
                    <span class="data-name">처리자명</span>
                    <span class="data-value"> - </span>
                </p>
            </div>
        </div>

        <br>

        <div class="row">
            <div class="col-lg-6">
                <p class="data-row">
                    <span class="data-name">문의 내용</span>
                    <span class="data-value">
                        <textarea name="question" id="question" cols="60" rows="5"></textarea>
                    </span>
                </p>
            </div>
            <div class="col-lg-6">
                <p class="data-row">
                    <span class="data-name">첨부파일</span>
                    <span class="data-value">이미지 파일 삽입</span>
                </p>
            </div>
        </div>

        <br>

        <div class="row">
            <div class="col-lg-6">
                <p class="data-row">
                    <span class="data-name">매크로 답변하기</span>
                    <span class="data-value">문의 구분</span>
                    <span class="data-value">구분</span>
                </p>
            </div>
            <div class="col-lg-6">
                <p class="data-row">
                    <span class="data-name">바로가기 버튼</span>
                    <span class="data-value"><button class="btn btn-default lower" type="submit">달결제 bt</button></span>
                    <span class="data-value"><button class="btn btn-default lower" type="submit">내지갑 bt</button></span>
                    <span class="data-value"><button class="btn btn-default lower" type="submit">사진등록 bt</button></span>
                </p>
            </div>
        </div>

        <br>

        <div class="row">
            <div class="col-lg-12">
                <p class="data-row">
                    <span class="data-name">신고처리</span>

                    <span class="data-value">
                        <label class="control-inline fancy-radio">
                            <input type="radio" name="inline-radio" checked>
                            <span><i></i>상태 유지</span>
                        </label>
                    </span>
                    <span class="data-value">
                        <label class="control-inline fancy-radio">
                            <input type="radio" name="inline-radio">
                            <span><i></i>처리 유예</span>
                        </label>
                    </span>
                    <span class="data-value">
                        <label class="control-inline fancy-radio">
                            <input type="radio" name="inline-radio">
                            <span><i></i>1일 정지</span>
                        </label>
                    </span>
                    <span class="data-value">
                        <label class="control-inline fancy-radio">
                            <input type="radio" name="inline-radio">
                            <span><i></i>3일 정지</span>
                        </label>
                    </span>
                    <span class="data-value">
                        <label class="control-inline fancy-radio">
                            <input type="radio" name="inline-radio">
                            <span><i></i>5일 정지</span>
                        </label>
                    </span>
                    <span class="data-value">
                        <label class="control-inline fancy-radio">
                            <input type="radio" name="inline-radio">
                            <span><i></i>7일 정지</span>
                        </label>
                    </span>
                    <span class="data-value">
                        <label class="control-inline fancy-radio">
                            <input type="radio" name="inline-radio">
                            <span><i></i>15일 정지</span>
                        </label>
                    </span>
                    <span class="data-value">
                        <label class="control-inline fancy-radio">
                            <input type="radio" name="inline-radio">
                            <span><i></i>회원 탈퇴</span>
                        </label>
                    </span>
                </p>
            </div>
        </div>

        <br>

        <span class="button_right">
            <button class="btn btn-default print-btn" type="button">처리완료</button>
        </span>


    </div>
</div> <%-- #page-wrapper --%>

<script>
    $(document).ready(function() {

    });

    function getMemNo_info(index) {
        var data = dtList_info.getDataRow(index);
        var obj = new Object();
        obj.memNo = data.memNo;
        getAjaxData("info", "/rest/customer/question/one", obj, info_sel_success, fn_fail);
    }

    function info_sel_success(dst_id, response) {
        dalbitLog(response);

        memNo = response.data.memNo;

        getDetail(tab_id);
    }
</script>

