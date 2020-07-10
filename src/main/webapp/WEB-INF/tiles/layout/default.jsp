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

    <div id="main-content-wrapper" class="content-wrapper ">
    <!-- top 버튼 -->
        <div>
            <a id="back-to-top" href="#" class="btn btn-primary btn-sm back-to-top-css" role="button" title="Move Top" data-toggle="tooltip" data-placement="left" style="z-index: 2">
            <span class="glyphicon glyphicon-chevron-up"></span>
            </a>
        </div>
        <%--<tiles:insertAttribute name="gnb"/>--%>

        <tiles:insertAttribute name="body"/>
    </div>
</div>
<!-- /wrapper -->
<!-- 이미지 원본 크기 -->
<div id="imageFullSize"></div>
<div class="dalbit_modal"></div>

<tiles:insertAttribute name="setting"/>

<script>
    $(document).ready(function() {
        common.scrollTop();
        $('._sex_male').html(common.sexIcon('m'));
        $('._sex_female').html(common.sexIcon('f'));
        $('._sex_none').html(common.sexIcon('n'));
    });
</script>

</body>
</html>
