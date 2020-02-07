<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!-- SHOW HIDE COLUMNS DATA TABLE -->
<div class="widget widget-table">
    <div class="widget-content">
        <table id="list" class="table table-sorting table-hover table-bordered datatable">
            <span>
                <button class="btn btn-default print-btn" type="button"><i class="fa fa-print"></i>Excel Print</button>
            </span>
            <thead>
            <tr>
                <th>NO</th>
                <th>회원번호</th>
                <th>UserID</th>
                <th>닉네임</th>
                <th>이름</th>
                <th>연락처</th>
                <th>가입플랫폼</th>
                <th>접속상태</th>
                <th>생방상태</th>
            </tr>
            </thead>
            <tbody id="tableBody">

            </tbody>
        </table>
    </div>
</div>
<!-- END SHOW HIDE COLUMNS DATA TABLE -->






<script>
    $(document).ready(function() {
        getAjaxData("list", "/rest/member/member/list", "", fn_success, fn_fail);
    });

    function fn_success(dst_id, response){
        dalbitLog(response);


        var template = $('#tmp_list').html();
        var templateScript = Handlebars.compile(template);
        var context = response;
        var html = templateScript(context);

        $("#tableBody").append(html);

        $('#list').DataTable({
            retrieve: true,
            paging: false,
            searching: true,
            /*sDom: "RC"+
            "t"+
            "<'row'<'col-sm-6'i><'col-sm-6'p>>",
            colVis: {
                buttonText: 'Show / Hide Columns',
                restore: "Restore",
                showAll: "Show all"
            },*/


        });
    }

    function fn_fail(data, textStatus, jqXHR){
        console.log(data, textStatus, jqXHR);
    }
</script>

<script id="tmp_list" type="text/x-handlebars-template">
    {{#data}}
    <tr>
        <td></td>
        <td>{{memNo}}</td>
        <td>{{memId}}</td>
        <td>{{memNick}}</td>
        <td>{{memName}}</td>
        <td>{{memPhone}}</td>
        <td>{{memSlct}}</td>
        <td></td>
        <td></td>
    </tr>
    {{/data}}
</script>
