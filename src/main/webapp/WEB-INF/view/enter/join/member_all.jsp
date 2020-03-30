<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 회원가입 > 전체 회원 -->
<div class="widget widget-table mb10">
    <div class="widget-header">
        <div class="btn-group widget-header-toolbar">
            <a href="#" title="Expand/Collapse" class="btn-borderless btn-toggle-expand"><i class="fa fa-chevron-up"></i></a>
        </div>
    </div>
    <div class="widget-content mt10">
        <table id="list" class="table table-sorting table-hover table-bordered datatable">

            <div class="searchBoxArea" style="float:right;">
                <select name="userSelect" id="userSelect" class="form-control">
                    <option value="join">가입 순으로 보기</option>
                    <option value="on">접속 순으로 보기</option>
                    <option value="pay">결제액 높은 순으로 보기</option>
                    <option value="air">방송회수 높은 순으로 보기</option>
                    <option value="gift">선물 많이 한 순으로 보기</option>
                </select>
            </div>

            <div class="pt10" style="float:right;">
                <label class="control-inline fancy-radio custom-color-green">
                   <input type="radio" name="inline-radio2">
                   <span><i></i>가입회원</span>
               </label>
               <label class="control-inline fancy-radio custom-color-green">
                   <input type="radio" name="inline-radio2">
                   <span><i></i>탈퇴회원</span>
               </label>
            </div>

            <thead>
            <tr>
                <th>NO</th>
                <th>회원가입일시</th>
                <th>UserID</th>
                <th>닉네임</th>
                <th>연락처</th>
                <th>소셜가입</th>
                <th>가입경로</th>
                <th>가입브라우저</th>
                <th>가입IP</th>
                <th>결제 건 수/금액</th>
                <th>회원상태</th>
                <th>접속상태</th>
                <th>방송상태</th>
            </tr>
            </thead>
            <tbody id="tableBody">
            <td>1</td>
            <td>2020-03-20 11:11:11</td>
            <td>DaldalE</td>
            <td><a href="javascript://" class="_openMemberPop" data-memNo="' + memNo + '">DalDalE</a></td>
            <td>다달이</td>
            <td>010-8841-0000</td>
            <td>FaceBook</td>
            <td>PC web</td>
            <td>125.125.125</td>
            <td>0건/55,000원</td>
            <td>정상</td>
            <td>Login</td>
            <td>방송ON</td>
            </tbody>
        </table>
    </div>
    <div class="widget-footer">
        <span>
            <button class="btn btn-default print-btn pull-right" type="button" id="excelDownBtn"><i class="fa fa-print"></i>Excel Print</button>
        </span>
    </div>
</div>

<script type="text/javascript">


</script>