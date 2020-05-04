<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    Date nowTime = new Date();
    SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
%>

<!-- 1:1문의 > 미처리 -->
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
                <th>시간대</th>
                <th>소계</th>
                <th>회원정보</th>
                <th>방송하기</th>
                <th>청취하기</th>
                <th>결제</th>
                <th>건의하기</th>
                <th>장애/버그</th>
                <th>선물/아이템</th>
                <th>기타</th>
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
                <td></td>
            </tr>

            <%
                for(int i=0; i<24; i++) {
            %>
            <tr>
                <th><%=i%>시 ~ <%=i+1%>시</th>
                <td></td>
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