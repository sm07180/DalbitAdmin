<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    Date nowTime = new Date();
    SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
%>

<%-- 로그인 현황 > 연령대 별--%>
<div class="widget widget-table mb10">
    <div class="widget-header">
        <div class="btn-group widget-header-toolbar">
            <a href="#" title="Expand/Collapse" class="btn-borderless btn-toggle-expand"><i class="fa fa-chevron-up"></i></a>
        </div>
    </div>
    <div class="widget-content mt10">
        <a>[이전]</a>
        <%= sf.format(nowTime)%>
        <a>[다음]</a>
        <table class="table table-bordered">
            <thead>
            <tr>
                <th rowspan="2">시간대</th>
                <th colspan="7">실시간</th>
                <th colspan="7">전일</th>
            </tr>
            <tr>
                <th>소계</th>
                <th>10대</th>
                <th>20대</th>
                <th>30대</th>
                <th>40대</th>
                <th>50대</th>
                <th>60대 이상</th>

                <th>소계</th>
                <th>10대</th>
                <th>20대</th>
                <th>30대</th>
                <th>40대</th>
                <th>50대</th>
                <th>60대 이상</th>
            </tr>
            </thead>
            <tbody>
            <tr class="success">
                <th>총계</th>
                <td>100</td>
                <td>10</td>
                <td>20</td>
                <td>20</td>
                <td>20</td>
                <td>20</td>
                <td>10</td>

                <td>80</td>
                <td>10</td>
                <td>20</td>
                <td>20</td>
                <td>20</td>
                <td>10</td>
                <td>0</td>
            </tr>

            <%
                for(int i=0; i<24; i++) {
            %>
            <tr>
                <th><%=i%>시 ~ <%=i+1%>시</th>
                <td>10</td>
                <td>1</td>
                <td>2</td>
                <td>2</td>
                <td>2</td>
                <td>2</td>
                <td>1</td>

                <td>8</td>
                <td>1</td>
                <td>2</td>
                <td>2</td>
                <td>2</td>
                <td>1</td>
                <td>0</td>
            </tr>
            <%
                }
            %>

            <tr class="success">
                <th>총계</th>
                <td>100</td>
                <td>10</td>
                <td>20</td>
                <td>20</td>
                <td>20</td>
                <td>20</td>
                <td>10</td>

                <td>80</td>
                <td>10</td>
                <td>20</td>
                <td>20</td>
                <td>20</td>
                <td>10</td>
                <td>0</td>
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