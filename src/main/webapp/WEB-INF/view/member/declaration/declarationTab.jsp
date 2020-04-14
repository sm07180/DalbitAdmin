<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="widget-content hide" id="tab_memberReport">
    <div class="tab-pane fade in active" id="report_tab">
        <%--<button type="button" class="btn btn-default print-btn pull-right" id="bt_declaration">처리완료</button>--%>
        <!-- 상세 -->
        <jsp:include page="../../customer/declaration/report.jsp"/>
    </div>
</div>

<script>
    $(document).ready(function() {
    });
</script>