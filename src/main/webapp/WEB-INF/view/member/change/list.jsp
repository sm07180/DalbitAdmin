<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div>
    <jsp:include page="../../money/item/changeList.jsp"/>
</div>
<script>
    $(document).ready(function() {

    });

    function getHistory_changeDetail() {     // 상세보기
        getList();
    }

    function getParameter(){
        return data = {
            search_year : ""
            , search_month : ""
            , search_type : ""
            , search_value : memNo
            , search_testId : 0
            , pageStart : itemPagingInfo.pageNo
            , pageCnt : itemPagingInfo.pageCnt
        };
    }

    function getList(){
        console.log(getParameter());
        util.getAjaxData("select", "/rest/money/item/list", getParameter(), fn_succ_list);
    }

</script>
