<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    Date nowTime = new Date();
    SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
%>

<!-- 캐스트 > 총계 -->
<div class="widget widget-table mb10">
    <div class="widget-content mt10">
        <a href="javascript://">[이전]</a>
        <%= sf.format(nowTime)%>
        <a href="javascript://">[다음]</a>
        <table class="table table-bordered">
            <thead>
            <tr>
                <th>시간대</th>
                <th>캐스트 건</th>
                <th>DJ</th>
                <th>조회 수</th>
                <th>좋아요</th>
                <th>선물 건수</th>
                <th>선물 금액</th>
                <th>댓글 수</th>
            </tr>
            </thead>
            <tbody>
            <tr class="success">
                <th>총계</th>
                <td>23</td>
                <td>23</td>
                <td>230</td>
                <td>230</td>
                <td>50</td>
                <td>200,000</td>
                <td>10</td>
            </tr>

            <%
                for(int i=0; i<24; i++) {
            %>
            <tr>
                <th><%=i%>시 ~ <%=i+1%>시</th>
                <td>23</td>
                <td>23</td>
                <td>230</td>
                <td>230</td>
                <td>50</td>
                <td>200,000</td>
                <td>10</td>
            </tr>
            <%
                }
            %>

            <tr class="success">
                <th>총계</th>
                <td>23</td>
                <td>23</td>
                <td>230</td>
                <td>230</td>
                <td>50</td>
                <td>200,000</td>
                <td>10</td>
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