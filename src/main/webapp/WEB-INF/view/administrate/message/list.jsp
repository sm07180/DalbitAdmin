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


<script>
    $(document).ready(function() {
        getAjaxData("list", "/rest/administrate/message/list", "", fn_success, fn_fail);
    });


    function fn_success(dst_id, response){
        dalbitLog(response);

        var template = $('#tmp_list').html();
        var templateScript = Handlebars.compile(template);
        var context = response;
        var html = templateScript(context);

        $("#tableBody").append(html);

        $('#list').DataTable({
            retrieve : true,
            paging : true,
            searching : true,
        });

    }

    function fn_fail(data, textStatus, jqXHR){
        console.log(data, textStatus, jqXHR);
    }
</script>

<script id="tmp_list" type="text/x-handlebars-template">
    {{#data}}
    <tr>
        <td>{{NO}}</td>
        <td>{{UserID}}</td>
        <td>{{NickName}}</td>
        <td>{{Name}}</td>
        <td>{{PhoneNum}}</td>
        <td>{{JoinPlatform}}</td>
        <td>{{Login_out}}</td>
        <td>{{Live}}</td>
    </tr>
    {{/data}}
</script>