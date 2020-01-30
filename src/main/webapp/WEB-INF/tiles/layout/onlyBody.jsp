<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <tiles:insertAttribute name="header"/>
</head>
<body>

    <tiles:insertAttribute name="script"/>

    <div class="container">
        <tiles:insertAttribute name="body" />
    </div>
</body>
</html>
