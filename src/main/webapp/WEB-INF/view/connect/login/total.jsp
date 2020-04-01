<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    Date nowTime = new Date();
    SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
%>

<!-- 로그인 현황 > 총계 -->
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
                <th rowspan="2">시간대</th>
                <th colspan="4">실시간</th>
                <th colspan="4">전일</th>
            </tr>
            <tr>
                <th>소계</th>
                <th>남성</th>
                <th>여성</th>
                <th>알수없음</th>

                <th>소계</th>
                <th>남성</th>
                <th>여성</th>
                <th>알수없음</th>
            </tr>
            </thead>
            <tbody>
            <tr class="success">
                <th>총계</th>
                <td>100</td>
                <td>40</td>
                <td>60</td>
                <td>0</td>

                <td>100</td>
                <td>40</td>
                <td>60</td>
                <td>0</td>
            </tr>

            <%
                for(int i=0; i<24; i++) {
            %>
            <tr>
                <th><%=i%>시 ~ <%=i+1%>시</th>
                <td>10</td>
                <td>4</td>
                <td>6</td>
                <td>0</td>

                <td>8</td>
                <td>3</td>
                <td>5</td>
                <td>0</td>
            </tr>
            <%
                }
            %>

            <tr class="success">
                <th>총계</th>
                <td>100</td>
                <td>40</td>
                <td>60</td>
                <td>0</td>
                <td>80</td>
                <td>30</td>
                <td>50</td>
                <td>0</td>
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