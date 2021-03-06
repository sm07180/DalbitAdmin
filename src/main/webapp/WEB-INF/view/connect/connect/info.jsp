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
                <div class="col-lg-6 pl0 pr5">
                    <div class="widget widget-table mb10">
                        <div class="widget-header">
                            <h3><i class="fa fa-table"></i> 방문자 통계 현황 </h3>
                        </div>
                        <div class="widget-content mt10">
                            <table class="table table-condensed table-dark-header table-bordered">
                                <thead>
                                <tr>
                                    <th></th>
                                    <th>실시간</th>
                                    <th>전일</th>
                                    <th>증감</th>
                                    <th>주간</th>
                                    <th>증감</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <th>방문자수</th>
                                    <td> 40 </td>
                                    <td> 30 </td>
                                    <td class="_up"><i class="fa fa-caret-up"></i>10</td>
                                    <td> 325 </td>
                                    <td class="_up"><i class="fa fa-caret-up"></i> 10 </td>
                                </tr>
                                <tr>
                                    <th>평균 방문시간</th>
                                    <td> 60 </td>
                                    <td> 50 </td>
                                    <td class="_up"><i class="fa fa-caret-up"></i> 10 </td>
                                    <td> 200분 </td>
                                    <td class="_up"><i class="fa fa-caret-up"></i> 10 </td>
                                </tr>
                                <tr>
                                    <th>페이지뷰</th>
                                    <td> 100 </td>
                                    <td> 80 </td>
                                    <td class="_up"><i class="fa fa-caret-up"></i> 20 </td>
                                    <td> 6,000 </td>
                                    <td class="_up"><i class="fa fa-caret-up"></i> 20 </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <div class="col-lg-6 pr0 pl5">
                    <div class="widget widget-table mb10">
                        <div class="widget-header">
                            <h3><i class="fa fa-table"></i> 접속자 통계 현황 </h3>
                        </div>
                        <div class="widget-content mt10">
                            <table class="table table-condensed table-dark-header table-bordered">
                                <thead>
                                <tr>
                                    <th></th>
                                    <th>실시간</th>
                                    <th>전일</th>
                                    <th>증감</th>
                                    <th>주간</th>
                                    <th>증감</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <th>접속자수</th>
                                    <td> 40 </td>
                                    <td> 30 </td>
                                    <td class="_up"><i class="fa fa-caret-up"></i> 10 </td>
                                    <td> 325 </td>
                                    <td class="_up"><i class="fa fa-caret-up"></i> 10 </td>
                                </tr>
                                <tr>
                                    <th>인당 접속회수</th>
                                    <td> 3.2 </td>
                                    <td> 3.1 </td>
                                    <td class="_up"><i class="fa fa-caret-up"></i> 0.1 </td>
                                    <td> 3.3 </td>
                                    <td class="_up"><i class="fa fa-caret-up"></i> 0.1 </td>
                                </tr>
                                <tr>
                                    <th>평균 접속시간</th>
                                    <td> 100 </td>
                                    <td> 80 </td>
                                    <td class="_up"><i class="fa fa-caret-up"></i> 20 </td>
                                    <td> 6,000 </td>
                                    <td class="_up"><i class="fa fa-caret-up"></i> 20 </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
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