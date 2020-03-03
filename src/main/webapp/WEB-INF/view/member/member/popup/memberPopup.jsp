<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String in_roomNo = request.getParameter("in_roomNo");
%>

<html>
<title>test</title>

<body>
<script>
    // $(document).ready(function() {
    // });

    init();
    function init(){
        var roomNo =  <%=in_roomNo%>;

        alert("roomNo : " + roomNo );
        // $("#test").val(roomNo);

        memNo = "11577690655946";
        var obj = new Object();
        obj.memNo = memNo;
        getAjaxData("info", "/rest/member/member/info", obj, info_sel_success, fn_fail);
    }

</script>

<%--<div id="wrapper">--%>
    <%--<div id="page-wrapper">--%>
        <%--<div class="container-fluid">--%>
            <%--<div class="row col-lg-12 form-inline">--%>
                <%--<label style="font-weight: bold;color: #000000;">회원 검색</label>--%>
                <%--<input type="text" class="form-control" id="test">--%>
                <%--<jsp:include page="../memberTab.jsp"></jsp:include>--%>
            <%--</div>--%>
        <%--</div>--%>
    <%--</div>--%>
<%--</div>--%>

</body>
</html>