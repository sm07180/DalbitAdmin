<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    Date nowTime = new Date();
    SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
%>

<!-- 캐스트 > 조회수 -->
<div class="widget widget-table mb10">
    <div class="widget-content mt10">
        <a href="javascript://">[이전]</a>
        <%= sf.format(nowTime)%>
        <a href="javascript://">[다음]</a>
        <table class="table table-bordered">
            <thead>
            <tr>
                <th></th>
                <th>소계</th>
                <th>일상/채팅</th>
                <th>연애/오락</th>
                <th>노래/연주</th>
                <th>고민/사연</th>
                <th>책/힐링</th>
                <th>ASMR</th>
                <th>스포츠</th>
                <th>노래방</th>
                <th>건강</th>
                <th>공포</th>
                <th>먹방</th>
                <th>성우</th>
                <th>요리</th>
                <th>기타</th>
            </tr>
            </thead>
            <tbody>
            <tr class="success">
                <th>총계</th>
                <td>300</td>
                <td>20</td>
                <td>20</td>
                <td>20</td>
                <td>20</td>
                <td>20</td>
                <td>20</td>
                <td>20</td>
                <td>20</td>
                <td>20</td>
                <td>20</td>
                <td>20</td>
                <td>20</td>
                <td>20</td>
                <td>20</td>
            </tr>

            <%
                for(int i=0; i<24; i++) {
            %>
            <tr>
                <th><%=i%>시 ~ <%=i+1%>시</th>
                <td>300</td>
                <td>20</td>
                <td>20</td>
                <td>20</td>
                <td>20</td>
                <td>20</td>
                <td>20</td>
                <td>20</td>
                <td>20</td>
                <td>20</td>
                <td>20</td>
                <td>20</td>
                <td>20</td>
                <td>20</td>
                <td>20</td>
            </tr>
            <%
                }
            %>

            <tr class="success">
                <th>총계</th>
                <td>300</td>
                <td>20</td>
                <td>20</td>
                <td>20</td>
                <td>20</td>
                <td>20</td>
                <td>20</td>
                <td>20</td>
                <td>20</td>
                <td>20</td>
                <td>20</td>
                <td>20</td>
                <td>20</td>
                <td>20</td>
                <td>20</td>
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