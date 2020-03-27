<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="wrapper">
    <div id="page-wrapper">
        <div id="container-fluid">
            <div class="row col-lg-12 form-inline">
                <div class="widget-content mt10">
                    <table class="table table-condensed table-dark-header table-bordered">
                        <thead>
                        <tr>
                            <th></th>
                            <th>실시간</th>
                            <th>전일</th>
                            <th>증감</th>
                            <th>주간</th>
                            <th>전주</th>
                            <th>증감</th>
                            <th>월간</th>
                            <th>전월</th>
                            <th>증감</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <th>남성</th>
                            <td><a href="javascript://">40</a></td>
                            <td><a href="javascript://">30</a></td>
                            <td class="_up"><i class="fa fa-caret-up"></i><a href="javascript://">10</a></td>
                            <td><a href="javascript://">40</a></td>
                            <td><a href="javascript://">30</a></td>
                            <td class="_up"><i class="fa fa-caret-up"></i><a href="javascript://">10</a></td>
                            <td><a href="javascript://">40</a></td>
                            <td><a href="javascript://">30</a></td>
                            <td class="_up"><i class="fa fa-caret-up"></i><a href="javascript://">10</a></td>
                        </tr>
                        <tr>
                            <th>여성</th>
                            <td><a href="javascript://">40</a></td>
                            <td><a href="javascript://">30</a></td>
                            <td class="_up"><i class="fa fa-caret-up"></i><a href="javascript://">10</a></td>
                            <td><a href="javascript://">10</a></td>
                            <td><a href="javascript://">10</a></td>
                            <td class="_up"><i class="fa fa-caret-up"></i><a href="javascript://">10</a></td>
                            <td><a href="javascript://">10</a></td>
                            <td><a href="javascript://">10</a></td>
                            <td class="_up"><i class="fa fa-caret-up"></i><a href="javascript://">10</a></td>
                        </tr>
                        <tr class="success">
                            <th>합계</th>
                            <td><a href="javascript://">40</a></td>
                            <td><a href="javascript://">30</a></td>
                            <td class="_up"><i class="fa fa-caret-up"></i><a href="javascript://">10</a></td>
                            <td><a href="javascript://">40</a></td>
                            <td><a href="javascript://">30</a></td>
                            <td class="_up"><i class="fa fa-caret-up"></i><a href="javascript://">10</a></td>
                            <td><a href="javascript://">10</a></td>
                            <td><a href="javascript://">10</a></td>
                            <td class="_up"><i class="fa fa-caret-up"></i><a href="javascript://">10</a></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- tab -->
            <div class="no-padding" id="infoTab">
                <jsp:include page="infoTab.jsp"/>
            </div>
            <!-- //tab -->
        </div> <!-- // container-fluid -->
    </div> <!-- // page-wrapper -->
</div> <!-- // wrapper -->