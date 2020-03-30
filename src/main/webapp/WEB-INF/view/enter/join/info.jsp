<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="container-fluid">
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

            <div class="row col-lg-12 form-inline">
                <div class="col-lg-6 pl0 pr5">
                    <!-- 가입자수 -->
                    <div class="widget widget-table mb10">
                        <div class="widget-header">
                            <h3><i class="fa fa-table"></i> 가입자수 통계 현황</h3>
                            <div class="btn-group widget-header-toolbar">
                                <a href="#" title="Expand/Collapse" class="btn-borderless btn-toggle-expand"><i class="fa fa-chevron-up"></i></a>
                            </div>
                        </div>
                        <div class="widget-content mt10">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>가입자수</th>
                                        <th>실시간</th>
                                        <th>전일</th>
                                        <th>증감</th>
                                        <th>주간</th>
                                        <th>증감</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <th>남</th>
                                        <td>32</td>
                                        <td>64</td>
                                        <td class="_up"><i class="fa fa-caret-up"></i> 10</td>
                                        <td>64</td>
                                        <td class="_up"><i class="fa fa-caret-up"></i> 10</td>
                                    </tr>
                                    <tr>
                                        <th>여</th>
                                        <td>20</td>
                                        <td>40</td>
                                        <td class="_up"><i class="fa fa-caret-up"></i> 10</td>
                                        <td>64</td>
                                        <td class="_up"><i class="fa fa-caret-up"></i> 10</td>
                                    </tr>
                                    <tr>
                                        <th>총계</th>
                                        <td>52</td>
                                        <td>104</td>
                                        <td class="_up"><i class="fa fa-caret-up"></i> 20</td>
                                        <td>104</td>
                                        <td class="_up"><i class="fa fa-caret-up"></i> 20</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!-- //가입자수 -->
                </div>

                <div class="col-lg-6 pr0 pl5">
                    <!-- 탈퇴자수 -->
                    <div class="widget widget-table mb10">
                        <div class="widget-header">
                            <h3><i class="fa fa-table"></i> 탈퇴자수 통계 현황</h3>
                            <div class="btn-group widget-header-toolbar">
                                <a href="#" title="Expand/Collapse" class="btn-borderless btn-toggle-expand"><i class="fa fa-chevron-up"></i></a>
                            </div>
                        </div>
                        <div class="widget-content mt10">
                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th>탈퇴자수</th>
                                    <th>실시간</th>
                                    <th>전일</th>
                                    <th>증감</th>
                                    <th>주간</th>
                                    <th>증감</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <th>남</th>
                                    <td>32</td>
                                    <td>64</td>
                                    <td class="_up"><i class="fa fa-caret-up"></i> 10</td>
                                    <td>64</td>
                                    <td class="_up"><i class="fa fa-caret-up"></i> 10</td>
                                </tr>
                                <tr>
                                    <th>여</th>
                                    <td>20</td>
                                    <td>40</td>
                                    <td class="_up"><i class="fa fa-caret-up"></i> 10</td>
                                    <td>64</td>
                                    <td class="_up"><i class="fa fa-caret-up"></i> 10</td>
                                </tr>
                                <tr>
                                    <th>총계</th>
                                    <td>52</td>
                                    <td>104</td>
                                    <td class="_up"><i class="fa fa-caret-up"></i> 20</td>
                                    <td>104</td>
                                    <td class="_up"><i class="fa fa-caret-up"></i> 20</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!-- //탈퇴자수 -->
                </div>
            </div>

            <!-- tab -->
            <div class="no-padding" id="infoTab">
                <jsp:include page="infoTab.jsp"/>
            </div>
            <!-- //tab -->
        </div>
    </div>
</div>

</script>