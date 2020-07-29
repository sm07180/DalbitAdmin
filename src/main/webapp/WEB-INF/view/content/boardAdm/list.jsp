<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="wrapper">
    <div id="page-wrapper">
        <!-- serachBox -->
        <div class="row col-lg-12 form-inline">
            <div class="widget widget-table searchBoxArea">
                <div class="widget-header searchBoxRow">
                    <h3 class="title"><i class="fa fa-search"></i><span id="title"/></h3>
                    <div>
                        <span id="searchRadio"></span>
                        <div class="input-group date" id="data_startSel">
                            <label for="start_sel" class="input-group-addon">
                                <span><i class="glyphicon glyphicon-calendar" id="i_startSel"></i></span>
                            </label>
                            <input type="text" class="form-control" id="start_sel" name="start_sel">
                            <%--<input type="hidden" id="txt_startSel" name="txt_startSel">--%>
                        </div>
                        <label>~</label>
                        <div class="input-group date" id="data_endSel">
                            <label for="end_sel" class="input-group-addon">
                                <span><i class="glyphicon glyphicon-calendar" id="i_endSel"></i></span>
                            </label>
                            <input type="text" class="form-control" id="end_sel" name="end_sel">
                            <%--<input type="hidden" id="txt_endSel" name="txt_endSel">--%>
                        </div>
                        <span id="searchType"></span>
                        <label><input type="text" class="form-control" id="txt_search" placeholder="검색할 정보를 입력하세요"></label>
                        <button type="submit" class="btn btn-success" id="bt_search">검색</button>
                        <a href="javascript://" class="_prevSearch">[이전]</a>
                        <a href="javascript://" class="_todaySearch">[오늘]</a>
                        <a href="javascript://" class="_nextSearch">[다음]</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- //serachBox -->

        <!-- tab -->
        <div class="row col-lg-12 form-inline">
            <jsp:include page="boardAdmTab.jsp"/>
        </div>
        <!-- //tab -->

    </div> <!-- //page-wrapper -->
</div> <!-- //wrapper -->

<script type="text/javascript" src="/js/code/content/contentCodeList.js?${dummyData}"></script>
<script type="text/javascript">

</script>