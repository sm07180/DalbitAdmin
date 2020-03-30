<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="wrapper">
    <div id="page-wrapper">
        <div id="container-fluid">
            <!-- searchBox -->
            <form id="searchForm">
                <div class="row col-lg-12 form-inline">
                    <div class="widget widget-table searchBoxArea">
                        <div class="widget-header searchBoxRow">
                            <h3 class="title"><i class="fa fa-search"></i> 검색조건</h3>
                            <div>
                                <label class="control-inline fancy-radio custom-color-green">
                                    <input type="radio" name="inline-radio2">
                                    <span><i></i>시간대 별</span>
                                </label>
                                <label class="control-inline fancy-radio custom-color-green">
                                    <input type="radio" name="inline-radio2">
                                    <span><i></i>일자 별</span>
                                </label>
                                <label class="control-inline fancy-radio custom-color-green">
                                    <input type="radio" name="inline-radio2">
                                    <span><i></i>월 별</span>
                                </label>

                                <label class="control-inline fancy-radio custom-color-green">
                                    <input type="radio" name="inline-radio2">
                                    <span><i></i>기간 별</span>
                                </label>
                                <i class="fa fa-calendar"></i>
                                <input type="text" id="startDate" class="form-control">
                                <span>~</span>
                                <i class="fa fa-calendar"></i>
                                <input type="text" id="endDate" class="form-control">
                                <button type="button" class="btn btn-success" id="bt_search">검색</button>

                            </div>
                        </div>
                    </div>
                </div>
            </form>
            <!-- //serachBox -->
            <!-- 접속 관련 통계 데이터-->
            <div class="row col-lg-12 form-inline">
                <div class="widget widget-table mb10">
                    <div class="widget-header">
                        <h3><i class="fa fa-table"></i> 결제/환불 통계 현황 </h3>
                    </div>
                    <div class="widget-content mt10">
                        <table class="table table-condensed table-dark-header table-bordered">
                            <thead>
                            <tr>
                                <th>결제수단</th>
                                <th>합계</th>
                                <th>휴대폰</th>
                                <th>카드</th>
                                <th>실시간계좌이체</th>
                                <th>무통장</th>
                                <th>인앱결제(아이폰)</th>
                                <th>네이버페이</th>
                                <th>페이코</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <th>걸제금액(건수)</th>
                                <td class="_up"><i class="fa fa-caret-up"></i> 222,000(147) </td>
                                <td> 2,000(2) </td>
                                <td> 2,000(2) </td>
                                <td> 2,000(2) </td>
                                <td> 2,000(2) </td>
                                <td> 2,000(2) </td>
                                <td> 2,000(2) </td>
                                <td> 2,000(2) </td>
                            </tr>
                            </tbody>

                            <thead>
                            <tr>
                                <th>결제회원</th>
                                <th>남성</th>
                                <th>여성</th>
                                <th>10대</th>
                                <th>20대</th>
                                <th>30대</th>
                                <th>40대</th>
                                <th>50대</th>
                                <th>60대 이상</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <th>걸제금액(건수)</th>
                                <td> 2,000(2) </td>
                                <td> 2,000(2) </td>
                                <td> 2,000(2) </td>
                                <td> 2,000(2) </td>
                                <td> 2,000(2) </td>
                                <td> 2,000(2) </td>
                                <td> 2,000(2) </td>
                                <td> 2,000(2) </td>
                            </tr>
                            </tbody>

                            <thead>
                            <tr>
                                <th>결제상품(Web, 안드로이드)</th>
                                <th>달 50</th>
                                <th>달 100</th>
                                <th>달 500</th>
                                <th>달 1,000</th>
                                <th>달 2,000</th>
                                <th>달 3,000</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <th>걸제금액(건수)</th>
                                <td> 11,000(2) </td>
                                <td> 2,000(2) </td>
                                <td> 2,000(2) </td>
                                <td> 2,000(2) </td>
                                <td> 2,000(2) </td>
                                <td> 2,000(2) </td>
                            </tr>
                            </tbody>

                            <thead>
                            <tr>
                                <th>결제상품(아이폰)</th>
                                <th>달 49</th>
                                <th>달 100</th>
                                <th>달 300</th>
                                <th>달 420</th>
                                <th>달 920</th>
                                <th>달 2,350</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <th>걸제금액(건수)</th>
                                <td> 2,000(2) </td>
                                <td> 2,000(2) </td>
                                <td> 2,000(2) </td>
                                <td> 2,000(2) </td>
                                <td> 2,000(2) </td>
                                <td> 2,000(2) </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!-- // 접속 관련 통계 데이터 -->
            <!-- tab -->
            <div class="no-padding" id="infoTab">
                <jsp:include page="infoTab.jsp"/>
            </div>
            <!-- //tab -->

        </div> <!-- // container-fluid -->
    </div> <!-- // page-wrapper -->
</div> <!-- // wrapper -->