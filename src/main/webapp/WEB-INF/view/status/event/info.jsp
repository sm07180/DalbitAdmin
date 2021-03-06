<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="container-fluid">
            <form id="searchForm">
                <div class="row col-lg-12 form-inline">
                    <div class="widget widget-table searchBoxArea">
                        <div class="widget-header searchBoxRow">
                            <h3 class="title"><i class="fa fa-search"></i> 이벤트 검색 </h3>
                            <div>
                                <select id="status" name="status" class="form-control searchType">
                                    <option value="all">전체</option>
                                    <option value="ing">진행 중</option>
                                    <option value="end">종료</option>
                                    <option value="will">예정</option>
                                </select>

                                <select id="condition" name="condition" class="form-control searchType">
                                    <option value="all">전체</option>
                                    <option value="no">회원번호</option>
                                    <option value="id">UserID</option>
                                    <option value="nick">User닉네임</option>
                                    <option value="phone">연락처</option>
                                </select>

                                <input type="text" id="search" name="search" class="form-control" placeholder="검색할 정보를 입력하세요"/>
                                <button type="button" id="searchBtn" class="btn btn-default">검색</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>

            <div class="row col-lg-12 form-inline">
                <label id="descArea">ㆍ이벤트명을 클릭하여 상세정보를 확인할 수 있습니다.</label>
                <div class="widget widget-table mb10">
                    <div class="widget-content mt10">
                        <table class="table table-condensed table-dark-header table-bordered">
                            <thead>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                    </div>
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

<script type="text/javascript">

</script>