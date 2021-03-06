<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    Date nowTime = new Date();
    SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
%>

<!-- 아이템 > 스토어/기타 -->
<div class="widget widget-table mb10">
    <div class="widget-content mt10">
        <%= sf.format(nowTime)%>
        <table class="table table-bordered">
            <thead>
            <tr>
                <th>No</th>
                <th>아이템 이미지</th>
                <th>아이템 명</th>
                <th>금액</th>
                <th>구분</th>
                <th>판매량</th>
                <th>판매 금액</th>
                <th>누적 판매량</th>
                <th>누적 판매 금액</th>
            </tr>
            </thead>
            <tbody>
            <tr class="success">
                <th>총계</th>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>

            <%
                for(int i=1; i<21; i++) {
            %>
            <tr>
                <th><%=i%></th>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <%
                }
            %>

            <tr class="success">
                <th>총계</th>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
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