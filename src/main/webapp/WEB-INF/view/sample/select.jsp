<%--<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>--%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<div id="wrapper">--%>
    <%--<div id="page-wrapper">--%>
        <%--<div class="container-fluid">--%>
            <%--<div class="row">--%>
                <%--<div class="col-lg-12">--%>
                    <%--<h1 class="page-header">회원관리>리스트</h1>--%>
                <%--</div>--%>
                <%--<!-- /.col-lg-12 -->--%>
            <%--</div>--%>
            <%--<div class="row">--%>
                <%--<div class="well">--%>
                    <%--<table height="20">--%>
                        <%--<th width="120">--%>
                            <%--<label>기본정보</label>--%>
                        <%--</th>--%>
                        <%--<th>--%>
                            <%--<label class="checkbox-inline"><input type="checkbox" id="check_name">이름</label>--%>
                            <%--<label class="checkbox-inline"><input type="checkbox" id="check_nickNeme">닉네임</label>--%>
                            <%--<label class="checkbox-inline"><input type="checkbox" id="check_phon">휴대전화</label>--%>
                            <%--<label class="checkbox-inline"><input type="checkbox" id="check_mail">이메일</label>--%>
                        <%--</th>--%>
                    <%--</table>--%>
                    <%--<table height="40">--%>
                        <%--<th width="120">--%>
                            <%--<label>생년월일</label>--%>
                        <%--</th>--%>
                        <%--<th>--%>
                            <%--<select class="form-control" id="cob_birthYear" ></select>--%>
                        <%--</th>--%>
                        <%--<th width="10"></th><th width="30"><label>년</label></th>--%>
                        <%--<th>--%>
                            <%--<select class="form-control" id="cob_birthMonth"></select>--%>
                        <%--</th>--%>
                        <%--<th width="10"></th><th width="30"><label>월</label></th>--%>
                        <%--<th>--%>
                            <%--<select class="form-control" id="cob_birthDay"></select>--%>
                        <%--</th>--%>
                        <%--<th width="10"></th><th width="30"><label>일</label></th>--%>
                        <%--<th width="50"></th><th width="250">--%>
                        <%--<label>* 달력에서 년/월/일을 선택</label>--%>
                        <%--<label>또는 직접 작성하여 입력할 수 있습니다.</label>--%>
                    <%--</th>--%>
                    <%--</table>--%>
                    <%--<table height="40">--%>
                        <%--<th width="120">--%>
                            <%--<label>가입일</label>--%>
                        <%--</th>--%>
                        <%--<th>--%>
                            <%--<select class="form-control" id="cob_stJoinYear"></select>--%>
                        <%--</th>--%>
                        <%--<th width="10"><th width="30"><label>년</label></th>--%>
                        <%--<th>--%>
                            <%--<select class="form-control" id="cob_stJoinMonth"></select>--%>
                        <%--</th>--%>
                        <%--<th width="10"><th width="30"><label>월</label></th>--%>
                        <%--<th>--%>
                            <%--<select class="form-control" id="cob_stJoinDay"></select>--%>
                        <%--</th>--%>
                        <%--<th width="10"><th width="30"><label>일 ~</label></th>--%>

                        <%--<th>--%>
                            <%--<select class="form-control" id="cob_edJoinYear"></select>--%>
                        <%--</th>--%>
                        <%--<th width="10"><th width="30"><label>년</label></th>--%>
                        <%--<th>--%>
                            <%--<select class="form-control" id="cob_edJoinMonth"></select>--%>
                        <%--</th>--%>
                        <%--<th width="10"><th width="30"><label>월</label></th>--%>
                        <%--<th>--%>
                            <%--<select class="form-control" id="cob_edJoinDay"></select>--%>
                        <%--</th>--%>
                        <%--<th width="10"><th width="30"><label>일</label></th>--%>
                    <%--</table>--%>
                    <%--<table height="40">--%>
                        <%--<th width="120">--%>
                            <%--<label>방송/청취정보</label>--%>
                        <%--</th>--%>
                        <%--<th width="60"><input type="text" class="form-control" id="txt_stTime"></th>--%>
                        <%--<th width="10"><th width="30"><label>시 ~</label></th>--%>
                        <%--<th width="60"><input type="text" class="form-control" id="txt_edTime"></th>--%>
                        <%--<th width="10"><th width="30"><label>시</label></th>--%>
                        <%--<th>--%>
                            <%--<label class="radio-inline">--%>
                                <%--<input type="radio" name="broad" id="radio_all" value="option1" checked="true">전체--%>
                            <%--</label>--%>
                            <%--<label class="radio-inline">--%>
                                <%--<input type="radio" name="broad" id="radio_dj" value="option2">DJ--%>
                            <%--</label>--%>
                            <%--<label class="radio-inline">--%>
                                <%--<input type="radio" name="broad" id="radio_listener" value="option3">청취자--%>
                            <%--</label>--%>
                        <%--</th>--%>
                    <%--</table>--%>
                    <%--<table height="40">--%>
                        <%--<th width="120">--%>
                            <%--<label>생방여부</label>--%>
                        <%--</th>--%>
                        <%--<th>--%>
                            <%--<label class="radio-inline">--%>
                                <%--<input type="radio" name="live" id="radio_liveAll" value="option1" checked="true">전체--%>
                            <%--</label>--%>
                            <%--<label class="radio-inline">--%>
                                <%--<input type="radio" name="live" id="radio_liveOn" value="option2">생방송ON--%>
                            <%--</label>--%>
                            <%--<label class="radio-inline">--%>
                                <%--<input type="radio" name="live" id="radio_liveOff" value="option3">생방송OFF--%>
                            <%--</label>--%>
                        <%--</th>--%>
                    <%--</table>--%>

                    <%--<div align="right">--%>
                        <%--<label width="250">--%>
                            <%--<input type="text" class="form-control" id="txt_search">--%>
                        <%--</label>--%>
                        <%--<label>--%>
                            <%--<button type="submit" class="btn btn-default">검색</button>--%>
                        <%--</label>--%>
                    <%--</div>--%>
                <%--</div>--%>
            <%--</div>--%>

            <%--<!-- /.row -->--%>
            <%--<div class="row">--%>
                <%--<div class="col-lg-12">--%>
                    <%--<div class="panel panel-default">--%>
                        <%--<div class="panel-heading">--%>
                            <%--DataTables Advanced Tables--%>
                        <%--</div>--%>
                        <%--<!-- /.panel-heading -->--%>
                        <%--<div class="panel-body">--%>
                            <%--<div class="table-responsive">--%>
                                <%--<table class="table table-striped table-bordered table-hover" id="dataTables-example">--%>
                                    <%--<thead>--%>
                                    <%--<tr>--%>
                                        <%--<th>Rendering engine</th>--%>
                                        <%--<th>Browser</th>--%>
                                        <%--<th>Platform(s)</th>--%>
                                        <%--<th>Engine version</th>--%>
                                        <%--<th>CSS grade</th>--%>
                                    <%--</tr>--%>
                                    <%--</thead>--%>
                                    <%--<tbody id="tableBody"></tbody>--%>
                                <%--</table>--%>
                            <%--</div>--%>
                            <%--<!-- /.table-responsive -->--%>
                        <%--</div>--%>
                        <%--<!-- /.panel-body -->--%>
                    <%--</div>--%>
                    <%--<!-- /.panel -->--%>
                <%--</div>--%>
                <%--<!-- /.col-lg-12 -->--%>
            <%--</div>--%>
            <%--<!-- /.row -->--%>
        <%--</div>--%>
        <%--<!-- /.container-fluid -->--%>
    <%--</div>--%>
    <%--<!-- /#page-wrapper -->--%>
<%--</div>--%>
<%--<!-- /#wrapper -->--%>

<%--<!-- jQuery -->--%>
<%--<script src="/template/js/jquery.min.js"></script>--%>

<%--<!-- Bootstrap Core JavaScript -->--%>
<%--<script src="/template/js/bootstrap.min.js"></script>--%>

<%--<!-- Metis Menu Plugin JavaScript -->--%>
<%--<script src="/template/js/metisMenu.min.js"></script>--%>

<%--<!-- DataTables JavaScript -->--%>
<%--<script src="/template/js/dataTables/jquery.dataTables.min.js"></script>--%>
<%--<script src="/template/js/dataTables/dataTables.bootstrap.min.js"></script>--%>

<%--<!-- Custom Theme JavaScript -->--%>
<%--<script src="/template/js/startmin.js"></script>--%>
<%--<script src="/js/handlebars-v4.7.2.js"></script>--%>
<%--<script src="/js/common.js"></script>--%>

<%--<!-- Page-Level Demo Scripts - Tables - Use for reference -->--%>
<%--<script>--%>
    <%--$(document).ready(function() {--%>
        <%--getAjaxData("list", "/rest/sample/list", "", fn_success, fn_fail);--%>
        <%--setDateBox();--%>

        <%--$('#cob_birthMonth').change(function () {--%>
            <%--var day = getMaxDay($("#cob_birthYear option:selected").val(), $("#cob_birthMonth option:selected").val());--%>
            <%--for (var i = 1; i <= day; i++) {--%>
                <%--$("#cob_birthDay").append("<option value='" + i + "'>" + i + "</option>");--%>
            <%--}--%>
        <%--});--%>
        <%--$('#cob_stJoinMonth').change(function () {--%>
            <%--var day = getMaxDay($("#cob_stJoinYear option:selected").val(), $("#cob_stJoinMonth option:selected").val());--%>
            <%--for (var i = 1; i <= day; i++) {--%>
                <%--$("#cob_stJoinDay").append("<option value='" + i + "'>" + i + "</option>");--%>
            <%--}--%>
        <%--});--%>
        <%--$('#cob_edJoinMonth').change(function () {--%>
            <%--var day = getMaxDay($("#cob_edJoinYear option:selected").val(), $("#cob_edJoinMonth option:selected").val());--%>
            <%--for (var i = day; i >= 1; i--) {--%>
                <%--$("#cob_edJoinDay").append("<option value='" + i + "'>" + i + "</option>");--%>
            <%--}--%>
        <%--});--%>
        <%--$('#cob_birthMonth').change();--%>
        <%--$('#cob_stJoinMonth').change();--%>
        <%--$('#cob_edJoinMonth').change();--%>
    <%--});--%>

    <%--function fn_success(dst_id, response){--%>
        <%--dalbitLog(response);--%>

        <%--var template = $('#tmp_list').html();--%>
        <%--var templateScript = Handlebars.compile(template);--%>
        <%--var context = response;--%>
        <%--var html = templateScript(context);--%>

        <%--$("#tableBody").append(html);--%>

        <%--$('#dataTables-example').DataTable({--%>
            <%--responsive: true--%>
        <%--});--%>
    <%--}--%>

    <%--function fn_fail(data, textStatus, jqXHR){--%>
        <%--console.log(data, textStatus, jqXHR);--%>
    <%--}--%>

    <%--// select box 연도 , 월 표시--%>
    <%--function setDateBox(){--%>
        <%--var date = new Date();--%>
        <%--var com_year = date.getFullYear();--%>
        <%--for(var y = (com_year-1); y >= (com_year-5); y--){--%>
            <%--$("#cob_birthYear").append("<option value='"+ y +"'>"+ y +"</option>");--%>
            <%--$("#cob_stJoinYear").append("<option value='"+ y +"'>"+ y +"</option>");--%>
            <%--$("#cob_edJoinYear").append("<option value='"+ y +"'>"+ y +"</option>");--%>
        <%--}--%>
        <%--for(var i = 1; i <= 12; i++){   //1월--%>
            <%--$("#cob_birthMonth").append("<option value='"+ i +"'>"+ i +"</option>");--%>
            <%--$("#cob_stJoinMonth").append("<option value='"+ i +"'>"+ i +"</option>");--%>
        <%--}--%>
        <%--for(var i = 12; i >= 1; i--){  //12월--%>
            <%--$("#cob_edJoinMonth").append("<option value='"+ i +"'>"+ i +"</option>");--%>
        <%--}--%>
    <%--}--%>

<%--</script>--%>

<%--<script id="tmp_list" type="text/x-handlebars-template">--%>
    <%--{{#data}}--%>
    <%--<tr>--%>
        <%--<td>{{renderingEngine}}</td>--%>
        <%--<td>{{browser}}</td>--%>
        <%--<td>{{platform}}</td>--%>
        <%--<td class="center">{{version}}</td>--%>
        <%--<td class="center">{{grade}}</td>--%>
    <%--</tr>--%>
    <%--{{/data}}--%>
<%--</script>--%>
