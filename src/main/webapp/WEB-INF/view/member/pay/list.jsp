<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div>

    <jsp:include page="../../payment/pay/payList.jsp"/>
</div>
<script>
    $(document).ready(function() {

    });

    function getHistory_payDetail(tmp) {     // 상세보기
        if(tmp.indexOf("_") > 0){ tmp = tmp.split("_"); tmp = tmp[1]; }
        txt_search = memNo;
        sDate = "";
        eDate = "";
        getPayList("memPayHistory");
    }

</script>
