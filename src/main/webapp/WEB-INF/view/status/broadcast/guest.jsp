<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 방송 > 게스트 -->
<div class="widget widget-table mb10">
    <div class="widget-content mt10">
        <span class="_searchDate"></span>
        <table class="table table-bordered">
            <thead>
            <tr>
                <th></th>
                <th>게스트 인원</th>
                <th>방송 건수</th>
                <th>방송 시간</th>
                <th>선물 건수</th>
                <th>선물 금액</th>
                <th>비밀선물 건수</th>
                <th>비밀선물 금액</th>
            </tr>
            </thead>
            <tbody>
            <tr class="success">
                <th>총계</th>
                <td>10</td>
                <td>22</td>
                <td>22</td>
                <td>22</td>
                <td>22,000</td>
                <td>22</td>
                <td>22,000</td>
            </tr>

            <%
                for(int i=0; i<24; i++) {
            %>
            <tr>
                <th><%=i%>시 ~ <%=i+1%>시</th>
                <td>10</td>
                <td>22</td>
                <td>22</td>
                <td>22</td>
                <td>22,000</td>
                <td>22</td>
                <td>22,000</td>
            </tr>
            <%
                }
            %>

            <tr class="success">
                <th>총계</th>
                <td>10</td>
                <td>22</td>
                <td>22</td>
                <td>22</td>
                <td>22,000</td>
                <td>22</td>
                <td>22,000</td>
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