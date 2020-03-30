<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    Date nowTime = new Date();
    SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
%>

<!-- 회원가입 > 플랫폼(성별) -->
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
                <th rowspan="2">소계</th>
                <th colspan="3">PC웹</th>
                <th colspan="3">모바일웹</th>
                <th colspan="3">안드로이드</th>
                <th colspan="3">아이폰</th>
            </tr>
            <tr>
                <th>남성</th>
                <th>여성</th>
                <th>알 수 없음</th>

                <th>남성</th>
                <th>여성</th>
                <th>알 수 없음</th>

                <th>남성</th>
                <th>여성</th>
                <th>알 수 없음</th>

                <th>남성</th>
                <th>여성</th>
                <th>알 수 없음</th>
            </tr>
            </thead>
            <tbody>
            <tr class="success">
                <th>소계</th>
                <td>44</td>
                <td>5</td>
                <td>6</td>
                <td>0</td>

                <td>5</td>
                <td>6</td>
                <td>0</td>

                <td>5</td>
                <td>6</td>
                <td>0</td>

                <td>5</td>
                <td>6</td>
                <td>0</td>
            </tr>

            <%
                for(int i=0; i<24; i++) {
            %>
            <tr>
                <th><%=i%>시 ~ <%=i+1%>시</th>

                <td>44</td>
                <td>5</td>
                <td>6</td>
                <td>0</td>

                <td>5</td>
                <td>6</td>
                <td>0</td>

                <td>5</td>
                <td>6</td>
                <td>0</td>

                <td>5</td>
                <td>6</td>
                <td>0</td>
            </tr>
            <%
                }
            %>

            <tr class="success">
                <th>소계</th>
                <td>44</td>
                <td>5</td>
                <td>6</td>
                <td>0</td>

                <td>5</td>
                <td>6</td>
                <td>0</td>

                <td>5</td>
                <td>6</td>
                <td>0</td>

                <td>5</td>
                <td>6</td>
                <td>0</td>
            </tr>

            <tr class="success">
                <th>총계</th>
                <td>44</td>
                <td colspan="3">11</td>
                <td colspan="3">11</td>
                <td colspan="3">11</td>
                <td colspan="3">11</td>
            </tr>
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