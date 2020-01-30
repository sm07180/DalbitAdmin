<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@include file="../../tiles/layout/include/header.jsp"%>
</head>
<body>

<div id="wrapper">

    <%@include file="../../tiles/layout/include/navigation.jsp"%>

    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Tables</h1>
                </div>
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <div align="right">
                                    <button type="button" class="btn btn-default">리스트</button>
                                    <button type="button" class="btn btn-default">수정하기</button>
                            </div>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="panel panel-green">
                            <div class="row">
                                <div class="col-lg-2">
                                    <div class="panel-body"> ProfileImg </div>
                                </div>
                                <div class="col-lg-1">
                                    <div class="panel-heading">Name</div>
                                </div>
                                <div class="col-lg-2">
                                    <div class="panel-body">  </div>
                                </div>
                                <div class="col-lg-1">
                                    <div class="panel-heading">Age</div>
                                </div>
                                <div class="col-lg-1">
                                    <div class="panel-body">  </div>
                                </div>
                                <div class="col-lg-1">
                                    <div class="panel-heading">Id</div>
                                </div>
                                <div class="col-lg-2">
                                    <div class="panel-body">  </div>
                                </div>
                                <div class="col-lg-1">
                                    <div class="panel-heading">Gender</div>
                                </div>
                                <div class="col-lg-1">
                                    <div class="panel-body">  </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-2">
                                    <div class="panel-body"> ProfileImg </div>
                                </div>
                                <div class="col-lg-1">
                                    <div class="panel-heading">NickName</div>
                                </div>
                                <div class="col-lg-2">
                                    <div class="panel-body">  </div>
                                </div>
                                <div class="col-lg-1">
                                    <div class="panel-heading">Level</div>
                                </div>
                                <div class="col-lg-1">
                                    <div class="panel-body">  </div>
                                </div>
                                <div class="col-lg-1">
                                    <div class="panel-heading">DJGrade</div>
                                </div>
                                <div class="col-lg-2">
                                    <div class="panel-body">  </div>
                                </div>
                                <div class="col-lg-1">
                                    <div class="panel-heading">ListenerGrade</div>
                                </div>
                                <div class="col-lg-1">
                                    <div class="panel-body">  </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-2">
                                    <div class="panel-body"> ProfileImg </div>
                                </div>
                                <div class="col-lg-1">
                                    <div class="panel-heading">Email</div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="panel-body">  </div>
                                </div>

                                <div class="col-lg-2">
                                    <div class="panel-heading">PhoneNum</div>
                                </div>
                                <div class="col-lg-3">
                                    <div class="panel-body">  </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-2">
                                    <div class="panel-body"> ProfileImg </div>
                                </div>
                                <div class="col-lg-1">
                                    <div class="panel-heading">Password</div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="panel-body">  </div>
                                </div>

                                <div class="col-lg-2">
                                    <div class="panel-heading">BirthDate</div>
                                </div>
                                <div class="col-lg-3">
                                    <div class="panel-body">  </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-2">
                                    <div class="panel-heading">OnAir</div>
                                </div>
                                <div class="col-lg-1">
                                    <div class="panel-body">  </div>
                                </div>
                                <div class="col-lg-2">
                                    <div class="panel-heading">JoinPath</div>
                                </div>
                                <div class="col-lg-2">
                                    <div class="panel-body">  </div>
                                </div>
                                <div class="col-lg-2">
                                    <div class="panel-heading">RewriteDate</div>
                                </div>
                                <div class="col-lg-3">
                                    <div class="panel-body">  </div>
                                </div>
                            </div>

                            </div>

                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container-fluid -->
    </div>
    <!-- /#page-wrapper -->

</div>
<!-- /#wrapper -->

<!-- jQuery -->
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
<script src="/js/moment-v2.24.0.js"></script>
<script src="/js/common.js"></script>
<script src="/js/helper.js"></script>

<!-- Page-Level Demo Scripts - Tables - Use for reference -->
<script>
    $(document).ready(function() {
        getAjaxData("profile", "/rest/member/profile", "", fn_success, fn_fail);
    });


    function fn_success(dst_id, response){
        dalbitLog(response);

        var template = $('#tmp_list').html();
        var templateScript = Handlebars.compile(template);
        var context = response;
        var html = templateScript(context);

        console.log(html)

        $("#panel-body").append(html);

        $('#dataTables-example').DataTable({
            responsive: true
        });
    }

    function fn_fail(data, textStatus, jqXHR){
        console.log(data, textStatus, jqXHR);
    }
</script>

<script id="tmp_list" type="text/x-handlebars-template">
    {{#data}}
        <tr>
            <td>{{ProfileImg}}</td>
            <td>{{Name}}</td>
            <td>{{Age}}</td>
            <td>{{Id}}</td>
            <td>{{Gender}}</td>
            <td>{{NickName}}</td>
            <td>{{Level}}</td>
            <td>{{DJGrade}}</td>
            <td>{{ListenerGrade}}</td>
            <td>{{Email}}</td>
            <td>{{PhoneNum}}</td>
            <td>{{Password}}</td>
            <td>{{convertToDate BirthDate "YYYY.MM.DD"}}</td>
            <td>{{OnAir}}</td>
            <td>{{JoinPath}}</td>
            <td>{{convertToDate RewriteDate "YYYY.MM.DD"}}</td>
        </tr>
    {{/data}}
</script>

</body>
</html>