<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <tiles:insertAttribute name="header"/>
</head>
<body>
    <div id="wrapper">
        <tiles:insertAttribute name="navi"/>

        <script src="/template/js/jquery.min.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="/template/js/bootstrap.min.js"></script>

        <!-- Metis Menu Plugin JavaScript -->
        <script src="/template/js/metisMenu.min.js"></script>

        <!-- DataTables JavaScript -->
        <script src="/template/js/dataTables/jquery.dataTables.min.js"></script>
        <script src="/template/js/dataTables/dataTables.bootstrap.min.js"></script>

        <!-- Custom Theme JavaScript -->
        <script src="/template/js/startmin.js"></script>
        <script src="/js/handlebars-v4.7.2.js"></script>
        <script src="/js/common.js"></script>

        <tiles:insertAttribute name="body"/>
    </div>
</body>
</html>
