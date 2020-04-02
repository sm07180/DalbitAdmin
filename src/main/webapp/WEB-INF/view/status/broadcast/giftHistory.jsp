<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    Date nowTime = new Date();
    SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
%>

<!-- 방송 > 선물내역 -->
<div class="widget widget-table mb10">
    <div class="widget-header">
        <div class="btn-group widget-header-toolbar">
            <a href="#" title="Expand/Collapse" class="btn-borderless btn-toggle-expand"><i class="fa fa-chevron-up"></i></a>
        </div>
    </div>
    <div class="widget-content mt10">
        <div class="row">
            <div class="col-md-4" style="float:right;">
            <table class="table table-condensed table-dark-header table-bordered">
                <thead>
                <tr>
                    <th></th>
                    <th>건수</th>
                    <th>금액</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <th>합계</th>
                    <td>900</td>
                    <td>900</td>
                </tr>
                </tbody>
            </table>
            </div>
        </div>
        <a href="javascript://">[이전]</a>
        <%= sf.format(nowTime)%>
        <a href="javascript://">[다음]</a>
        <table class="table table-bordered">
            <thead>
            <tr>
                <th>NO</th>
                <th>선물 일시</th>
                <th>선물한 회원 ID</th>
                <th>닉네임</th>
                <th>방송방 제목</th>
                <th>DJ ID</th>
                <th>닉네임</th>
                <th>아이템명</th>
                <th>아이템 금액</th>
                <th>비밀선물</th>
                <th>선물받은 회원 ID</th>
                <th>닉네임</th>
            </tr>
            </thead>
            <tbody>

            <%
                for(int i=1; i<21; i++) {
            %>
            <tr>
                <th><%=i%></th>
                <td>2020-03-10 11:11:11</td>
                <td><a href="javascript://" class="_openMemberPop" data-memNo="'+memNo+'">zhfhskout</a></td>
                <td>붉은주작</td>
                <td><a href="javascript://" class="_openBroadcastPop" data-roomNo="' + roomNo + '">[스페셜] 코D와 함께하는 코로나 생중계</a></td>
                <td><a href="javascript://" class="_openMemberPop" data-memNo="'+memNo+'">dlaksgml</a></td>
                <td>이마니많의</td>
                <td>당근</td>
                <td>50,000</td>
                <td>Y</td>
                <td><a href="javascript://" class="_openMemberPop" data-memNo="'+memNo+'">glaksgml</a></td>
                <td>이마니많의</td>
            </tr>
            <%
                }
            %>
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