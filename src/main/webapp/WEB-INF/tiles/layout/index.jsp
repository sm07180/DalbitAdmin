<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <tiles:insertAttribute name="header"/>
</head>

<body>
    <tiles:insertAttribute name="script"/>

<!-- WRAPPER -->
<div class="wrapper">
    <tiles:insertAttribute name="top"/>

    <tiles:insertAttribute name="left"/>

    <div id="main-content-wrapper" class="content-wrapper ">
    <!-- top 버튼 -->
    <div>
        <a id="back-to-top" href="#" class="btn btn-primary btn-sm back-to-top-css" role="button" title="Move Top" data-toggle="tooltip" data-placement="left">
        <span class="glyphicon glyphicon-chevron-up"></span>
        </a>
    </div>
        <%--<tiles:insertAttribute name="gnb"/>--%>

        <%--<tiles:insertAttribute name="body"/>--%>
    </div>
</div>
<!-- /wrapper -->

<tiles:insertAttribute name="setting"/>
<script type="text/javascript">
    $('._dalbit:not([data-url=""]):first').click();

    window.onload = function() {
        window.addEventListener("message", function(e) {
            try{
                document.getElementById("iframePageContent").height = e.data.scrollHeight;
            }catch (exception){

            }

        });
    };
</script>
</body>
</html>


