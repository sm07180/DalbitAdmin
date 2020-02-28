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
    .checkbox {

    }

</style>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="col-lg-12">
            <label>ㆍ전화문의 시 정보를 등록하고 처리한 정보입니다.</label><br>
            <label>ㆍ전화문의 시 회원이 문의 한 내용을 최대한 자세히 작성해 주세요.</label><br>
        </div>
        <div class="row">
            <div class="col-lg-2">
                <p class="data-row">
                    <span class="data-name">No</span>
                    <span class="data-value">41</span>
                </p>
            </div>
            <div class="col-lg-3">
                <p class="data-row">
                    <span class="data-name">문의 UserID </span>
                    <span class="data-value">
                        <button class="btn btn-default" type="submit">회원 검색</button> textbox
                    </span>
                </p>
            </div>
            <div class="col-lg-3">
                <p class="data-row">
                    <span class="data-name">신고대상 UserID</span>
                    <span class="data-value">
                         <button class="btn btn-default" type="submit">회원 검색</button> textbox
                    </span>
                </p>
            </div>
            <div class="col-lg-2">
                <p class="data-row">
                    <span class="data-name">접수일시</span>
                    <span class="data-value">YY.MM.DD</span>
                </p>
            </div>
            <div class="col-lg-2">
                <p class="data-row">
                    <span class="data-name">처리상태</span>
                    <span class="data-value">
                        <select class="form-control" name="sortType" id="sortType">
                            <option value="1">처리완료</option>
                            <option value="2">처리 중</option>
                        </select>
                    </span>
                </p>
            </div>
        </div>

        <br>

        <div class="row">
            <div class="col-lg-6">
                <p class="data-row">
                    <span class="data-name">신고/문의 내용</span>
                    <span class="data-value">textbox</span>
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
                    <span class="data-value"> YY.MM.DD </span>
                </p>
            </div>
            <div class="col-lg-2">
                <p class="data-row">
                    <span class="data-name">처리자명</span>
                    <span class="data-value"> NA </span>
                </p>
            </div>
        </div>

        <br>

        <div class="row">
            <div class="col-lg-12">
                <p class="data-row">
                    <span class="data-name">문의 관련 메모</span>
                    <span class="data-value">
                        <textarea name="call" id="call" cols="100" rows="5"></textarea>
                    </span>
                </p>
            </div>
        </div>

        <br>

        <span class="button_right">
            <button class="btn btn-default print-btn" type="button">처리완료</button>
        </span>

    </div> <%-- #page-wrapper --%>
</div> <%-- #wrapper --%>

<script>
    $(document).ready(function() {

    });

    function getMemNo_info(index) {
        var data = dtList_info.getDataRow(index);
        var obj = new Object();
        obj.memNo = data.memNo;
        getAjaxData("info", "/rest/customer/question/call", obj, info_sel_success, fn_fail);
    }

    function info_sel_success(dst_id, response) {
        dalbitLog(response);

        memNo = response.data.memNo;

        getDetail(tab_id);
    }
</script>

