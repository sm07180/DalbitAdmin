<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    Date nowTime = new Date();
    SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
%>

<!-- 아이템 > 구매내역 -->
<div class="widget widget-table mb10">
    <div class="widget-content mt10">
        <%= sf.format(nowTime)%>
        <table class="table table-bordered">
            <thead>
            <tr>
                <th>No</th>
                <th>구매 일시</th>
                <th>구매 회원 ID</th>
                <th>닉네임</th>
                <th>서비스 유형</th>
                <th>서비스 상세</th>
                <th>아이템 명</th>
                <th>아이템 금액</th>
                <th>수신회원ID</th>
                <th>닉네임</th>
            </tr>
            </thead>
            <tbody>

            <%
                for(int i=1; i<21; i++) {
            %>
            <tr>
                <th><%=i%></th>
                <td>2020-03-10 11:11:11</td>
                <td><a href="javascript://" class="_openMemberPop" data-memNo="'+memNo+'">zhfhskout</a></td>
                <td>붉은주작</td>
                <td>방송</td>
                <td><a href="javascript://">붉은주작이 들려주는 오늘의 행복뉴스</a></td>
                <td>당근</td>
                <td>5,000</td>
                <td><a href="javascript://" class="_openMemberPop" data-memNo="'+memNo+'">dlaksgml</a></td>
                <td>붉은주작</td>
            </tr>
            <%
                }
            %>

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