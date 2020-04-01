<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 현재 접속자 > 현재 접속 회원 -->
<div class="widget widget-table mb10">
    <div class="widget-header">
        <div class="btn-group widget-header-toolbar">
            <a href="#" title="Expand/Collapse" class="btn-borderless btn-toggle-expand"><i class="fa fa-chevron-up"></i></a>
        </div>
    </div>
    <div class="widget-content mt10">
        <table id="list" class="table table-sorting table-hover table-bordered datatable">
            <span>
                <select name="userSelect" id="userSelect" class="form-control" style="float:right">
                    <option value="on">접속 순으로 보기</option>
					<option value="join">가입 순으로 보기</option>
					<option value="pay">결제액 높은 순으로 보기</option>
					<option value="air">방송회수 높은 순으로 보기</option>
					<option value="gift">선물 많이 한 순으로 보기</option>
				</select>
            </span>
            <thead>
            <tr>
                <th>NO</th>
                <th>접속일시</th>
                <th>회원번호</th>
                <th>UserID</th>
                <th>닉네임</th>
                <th>이름</th>
                <th>소셜가입</th>
                <th>접속 플랫폼</th>
                <th>접속 IP</th>
                <th>결제 건 수/금액</th>
                <th>보유 달/보유 별</th>
                <th>접속 상태</th>
                <th>방송 상태</th>
            </tr>
            </thead>
            <tbody id="tableBody">
                <td>1</td>
                <td>2020-03-20 11:11:11</td>
                <td>123456</td>
                <td><a href="javascript://" class="_openMemberPop" data-memNo="' + memNo + '">DalDalE</a></td>
                <td>다달이</td>
                <td>이상훈</td>
                <td>FaceBook</td>
                <td>안드로이드</td>
                <td>125.125.125.125</td>
                <td>0건/55,000원</td>
                <td>1달/1별</td>
                <td>Login</td>
                <td>방송ON</td>
            </tbody>
        </table>
    </div>
    <div class="widget-footer">
        <span>
            <button class="btn btn-default print-btn pull-right" type="button" id="excelDownBtn"><i class="fa fa-print"></i>Excel Down</button>
        </span>
    </div>
</div>

<script type="text/javascript">


</script>