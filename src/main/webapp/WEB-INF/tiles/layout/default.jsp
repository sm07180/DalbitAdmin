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
        <tiles:insertAttribute name="body"/>
    </div>
</div>
<!-- /wrapper -->

<tiles:insertAttribute name="setting"/>



