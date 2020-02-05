<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!-- SHOW HIDE COLUMNS DATA TABLE -->
<div class="widget widget-table">

    <div class="widget-content">
        <table id="list" class="table table-sorting table-hover table-bordered datatable">
            <span>
                <button class="btn btn-default" type="button"><i class="fa fa-close"></i>Delete</button>
                <button class="btn btn-default print-btn" type="button"><i class="fa fa-print"></i>Excel Print</button>
            </span>
            <thead>
            <tr>
                <th>NO</th>
                <th>UserID</th>
                <th>NickName</th>
                <th>Name</th>
                <th>PhoneNum</th>
                <th>JoinPlatform</th>
                <th>Login_out</th>
                <th>Live</th>
                </tr>
            </thead>
            <tbody id="tableBody">

            </tbody>
        </table>
    </div>
</div>
<!-- END SHOW HIDE COLUMNS DATA TABLE -->

<%-- 연습용 --%>











<%-- RestController --%>
<script>
    $(document).ready(function() {
        getAjaxData("list", "/rest/member/member/memberList", "", fn_success, fn_fail);
    });

    function fn_success(dst_id, response){
        dalbitLog(response);
        var template = $('#tmp_list').html();
        console.log(template);
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
        <td>{{memNo}}</td>
        <td>{{memId}}</td>
        <td>{{memNick}}</td>
        <td>{{memNick}}</td>
        <td>{{memPhone}}</td>
        <td>{{memSlct}}</td>
        <td>{{memState}}</td>
        <td>{{memState}}</td>
    </tr>
    {{/data}}
</script>
