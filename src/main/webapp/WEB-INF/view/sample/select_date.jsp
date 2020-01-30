<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%--<%@include file="../include/header.jsp"%>--%>
</head>
<body>

<div id="wrapper">

    <%--<%@include file="../tiles/layout/include/navigation.jsp"%>--%>

    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">회원관리>리스트</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>

            <!-- /.row well-->
            <div class="row well">
                <!-- /.1 row -->
                <div class="row">
                    <div class="form-group form-inline">
                        <label style="width:10%">기본정보</label>
                        <label class="checkbox-inline"><input type="checkbox" id="check_name">이름</label>
                        <label class="checkbox-inline"><input type="checkbox" id="check_nickNeme">닉네임</label>
                        <label class="checkbox-inline"><input type="checkbox" id="check_phon">휴대전화</label>
                        <label class="checkbox-inline"><input type="checkbox" id="check_mail">이메일</label>
                    </div>
                </div>
                <!-- /.1 row -->
                <!-- /.2 row -->
                <div class="row">
                    <div class="form-group form-inline">
                        <label style="width:10%">생년월일</label>
                        <div class="input-group date col-sm-2" id="date_birth">
                            <input type="text" class="form-control" id="txt_birth"><span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                        </div>
                        <label>* 달력에서 년/월/일을 선택</label>
                        <label>또는 직접 작성하여 입력할 수 있습니다.</label>
                    </div>
                </div>
                <!-- /.2 row -->
                <!-- /.3 row -->
                <div class="row">
                    <div class="form-group form-inline">
                        <label style="width:10%">가입일</label>
                        <div class="input-group date col-sm-2" id="date_stJoin">
                            <input type="text" class="form-control" id="txt_stJoin"><span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                        </div>
                        <label>~</label>
                        <div class="input-group date col-sm-2" id="date_edJoin">
                            <input type="text" class="form-control" id="txt_etJoin"><span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                        </div>
                    </div>
                </div>
                <!-- /.3 row -->
                <!-- /.4 row -->
                <div class="row">
                    <div class="form-group form-inline">
                        <label style="width: 10%">방송/청취정보</label>
                        <div class="input-group col-sm-2"><input type="text" class="form-control" id="txt_stTime"></div>
                        <label>시 ~</label>
                        <div class="input-group col-sm-2"><input type="text" class="form-control" id="txt_edTime"></div>
                        <label>시</label>
                        <label class="radio-inline"><input type="radio" name="broad" id="radio_all" value="option1" checked="true">전체</label>
                        <label class="radio-inline"><input type="radio" name="broad" id="radio_dj" value="option2">DJ</label>
                        <label class="radio-inline"><input type="radio" name="broad" id="radio_listener" value="option3">청취자</label>
                    </div>
                </div>
                <!-- /.4 row -->
                <!-- /.5 row -->
                <div class="row">
                    <div class="form-group form-inline">
                        <label style="width:10%">생방여부</label>
                        <label class="radio-inline"><input type="radio" name="live" id="radio_liveAll" value="option1" checked="true">전체</label>
                        <label class="radio-inline"><input type="radio" name="live" id="radio_liveOn" value="option2">생방송ON</label>
                        <label class="radio-inline"><input type="radio" name="live" id="radio_liveOff" value="option3">생방송OFF</label>
                    </div>
                </div>
                <!-- /.5 row -->
                <!-- /.6 row -->
                <div align="right">
                    <label><input type="text" class="form-control" id="txt_search"></label>
                    <button type="submit" class="btn btn-default">검색</button>
                </div>
                <!-- /.6 row -->
            </div>
            <!-- /.row well-->

            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            DataTables Advanced Tables
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                    <tr>
                                        <th>Rendering engine</th>
                                        <th>Browser</th>
                                        <th>Platform(s)</th>
                                        <th>Engine version</th>
                                        <th>CSS grade</th>
                                    </tr>
                                    </thead>
                                    <tbody id="tableBody"></tbody>
                                </table>
                            </div>
                            <!-- /.table-responsive -->
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
<script src="/js/common.js"></script>


<!-- Datepicker -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">
<script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>
<script src="/js/bootstrap-datepicker.kr.js" charset="UTF-8"></script>
<!-- Page-Level Demo Scripts - Tables - Use for reference -->

<script>
    $(document).ready(function() {
        getAjaxData("list", "/rest/sample/list", "", fn_success, fn_fail);
        $('.input-group.date').datepicker({
            todayBtn: "linked",
            keyboardNavigation: false,
            forceParse: false,
            todayHighlight: true,
            calendarWeeks: false,
            autoclose: true,
            format: "yyyy/mm/dd",
            language: 'kr'
        }).datepicker("setDate", new Date());

    });

    function fn_success(dst_id, response){
        dalbitLog(response);

        var template = $('#tmp_list').html();
        var templateScript = Handlebars.compile(template);
        var context = response;
        var html = templateScript(context);

        $("#tableBody").append(html);

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
        <td>{{renderingEngine}}</td>
        <td>{{browser}}</td>
        <td>{{platform}}</td>
        <td class="center">{{version}}</td>
        <td class="center">{{grade}}</td>
    </tr>
    {{/data}}
</script>

</body>
</html>