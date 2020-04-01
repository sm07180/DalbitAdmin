<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    Date nowTime = new Date();
    SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
%>

<!-- 결제/환불 > 결제상품별 -->
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
                <th colspan="2">5,500원</th>
                <th colspan="2">11,000원</th>
                <th colspan="2">55,000원</th>
                <th colspan="2">110,000원</th>
                <th colspan="2">220,000원</th>
                <th colspan="2">330,000원</th>
                <th colspan="2">5,900원</th>
                <th colspan="2">12,000원</th>
                <th colspan="2">36,000원</th>
                <th colspan="2">50,000원</th>
                <th colspan="2">109,000원</th>
                <th colspan="2">299,000원</th>
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
                <th>건</th>
                <th>금액</th>
            </tr>
            </thead>
            <tbody>
            <tr class="success">
                <th>총계</th>
                <td>12</td>
                <td>1,000,000</td>
                <td>1</td>
                <td>5,500</td>
                <td>1</td>
                <td>11,000</td>
                <td>1</td>
                <td>55,000</td>
                <td>1</td>
                <td>110,000</td>
                <td>1</td>
                <td>220,000</td>
                <td>1</td>
                <td>330,000</td>
                <td>1</td>
                <td>5,900</td>
                <td>1</td>
                <td>12,000</td>
                <td>1</td>
                <td>36,000</td>
                <td>1</td>
                <td>50,000</td>
                <td>1</td>
                <td>109,000</td>
                <td>1</td>
                <td>299,000</td>
            </tr>

            <%
                for(int i=0; i<24; i++) {
            %>
            <tr>
                <th><%=i%>시 ~ <%=i+1%>시</th>
                <td>12</td>
                <td>1,000,000</td>
                <td>1</td>
                <td>5,500</td>
                <td>1</td>
                <td>11,000</td>
                <td>1</td>
                <td>55,000</td>
                <td>1</td>
                <td>110,000</td>
                <td>1</td>
                <td>220,000</td>
                <td>1</td>
                <td>330,000</td>
                <td>1</td>
                <td>5,900</td>
                <td>1</td>
                <td>12,000</td>
                <td>1</td>
                <td>36,000</td>
                <td>1</td>
                <td>50,000</td>
                <td>1</td>
                <td>109,000</td>
                <td>1</td>
                <td>299,000</td>
            </tr>
            <%
                }
            %>

            <tr class="success">
                <th>총계</th>
                <td>12</td>
                <td>1,000,000</td>
                <td>1</td>
                <td>5,500</td>
                <td>1</td>
                <td>11,000</td>
                <td>1</td>
                <td>55,000</td>
                <td>1</td>
                <td>110,000</td>
                <td>1</td>
                <td>220,000</td>
                <td>1</td>
                <td>330,000</td>
                <td>1</td>
                <td>5,900</td>
                <td>1</td>
                <td>12,000</td>
                <td>1</td>
                <td>36,000</td>
                <td>1</td>
                <td>50,000</td>
                <td>1</td>
                <td>109,000</td>
                <td>1</td>
                <td>299,000</td>
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