<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    Date nowTime = new Date();
    SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
%>

<!-- 결제/환불 > 결제수단별 -->
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
                <th colspan="2">소계</th>
                <th colspan="2">휴대폰</th>
                <th colspan="2">카드</th>
                <th colspan="2">인앱결제(아이폰)</th>
                <th colspan="2">실시간 계좌이체</th>
                <th colspan="2">무통장 입금</th>
            </tr>

            <tr>
                <th>건</th>
                <th>금액</th>
                <th>건</th>
                <th>금액</th>
                <th>건</th>
                <th>금액</th>
                <th>건</th>
                <th>금액</th>
                <th>건</th>
                <th>금액</th>
                <th>건</th>
                <th>금액</th>
            </tr>
            </thead>
            <tbody>
            <tr class="success">
                <th>총계</th>
                <td>23</td>
                <td>150,000</td>
                <td>10</td>
                <td>15,000</td>
                <td>10</td>
                <td>15,000</td>
                <td>10</td>
                <td>15,000</td>
                <td>10</td>
                <td>15,000</td>
                <td>10</td>
                <td>15,000</td>
            </tr>

            <%
                for(int i=0; i<24; i++) {
            %>
            <tr>
                <th><%=i%>시 ~ <%=i+1%>시</th>
                <td>23</td>
                <td>150,000</td>
                <td>10</td>
                <td>15,000</td>
                <td>10</td>
                <td>15,000</td>
                <td>10</td>
                <td>15,000</td>
                <td>10</td>
                <td>15,000</td>
                <td>10</td>
                <td>15,000</td>
            </tr>
            <%
                }
            %>

            <tr class="success">
                <th>총계</th>
                <td>23</td>
                <td>150,000</td>
                <td>10</td>
                <td>15,000</td>
                <td>10</td>
                <td>15,000</td>
                <td>10</td>
                <td>15,000</td>
                <td>10</td>
                <td>15,000</td>
                <td>10</td>
                <td>15,000</td>
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