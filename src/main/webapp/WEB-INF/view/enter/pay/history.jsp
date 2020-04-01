<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    Date nowTime = new Date();
    SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
%>

<!-- 결제/환불 > 결제내역 -->
<div class="widget widget-table mb10">
    <div class="widget-header">
        <div class="btn-group widget-header-toolbar">
            <a href="#" title="Expand/Collapse" class="btn-borderless btn-toggle-expand"><i class="fa fa-chevron-up"></i></a>
        </div>
    </div>
    <div class="widget-content mt10">
        <a href="javascript://">[이전]</a>
        <%= sf.format(nowTime)%>
        <a href="javascript://">[다음]</a>
        <table class="table table-bordered">
            <thead>
            <tr>
                <th>No</th>
                <th>결제 일시</th>
                <th>결제 번호</th>
                <th>결제 회원ID </th>
                <th>닉네임</th>
                <th>결제 수단</th>
                <th>결제 금액</th>
                <th>결제 금액(V.A.T별도)</th>
                <th>성공 여부</th>
                <th>누적 건수</th>
                <th>누적 금액</th>
                <th>취소 여부</th>
                <th>취소 일시</th>
            </tr>
            </thead>
            <tbody>
            <%
                for(int i=1; i<21; i++) {
            %>
            <tr>
                <th><%=i%></th>
                <td>2020-02-24 00:01:30</td>
                <td>150,2020022401200</td>
                <td>tlscjswlrrjwu</td>
                <td>닉네임</td>
                <td>휴대폰</td>
                <td>5,500</td>
                <td>5,000</td>
                <td>Y</td>
                <td>233</td>
                <td>5,222,000</td>
                <td>결제 취소</td>
                <td>2020-02-25 00:01:30</td>
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