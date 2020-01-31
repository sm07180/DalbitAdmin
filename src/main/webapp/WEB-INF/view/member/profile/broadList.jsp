<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!-- SHOW HIDE COLUMNS DATA TABLE -->
<div class="widget widget-table">

    <div class="widget-content">
        <table id="broadList" class="table table-sorting table-hover table-bordered datatable">
            <span>
                <button class="btn btn-default" type="button">Delete</button>
                <button class="btn btn-default" type="button">Excel Print</button>
            </span>
            <thead>
            <tr>
                <th><input type="checkbox">
                    <span>NO</span>
                </th>
                <th>RoomTitle</th>
                <th>StartTime</th>
                <th>EndTime</th>
                <th>OnAirTime</th>
                <th>MaxListener</th>
                <th>AvgListener</th>
                <th>Good</th>
                <th>Gift</th>
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
        getAjaxData("broadList", "/rest/member/profile/broadList", "", fn_success, fn_fail);
    });


    function fn_success(dst_id, response){
        dalbitLog(response);

        var template = $('#tmp_list').html();
        var templateScript = Handlebars.compile(template);
        var context = response;
        var html = templateScript(context);

        $("#tableBody").append(html);

        $('#broadList').DataTable({
            retrieve : true,
            paging : false,
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
        <td>
            <input type="checkbox">
            <span>{{NO}}</span>
        </td>
        <td>{{RoomTitle}}</td>
        <td>{{convertToDate StartTime "YYYY.MM.DD"}}</td>
        <td>{{EndTime}}</td>
        <td>{{OnAirTime}}</td>
        <td>{{MaxListener}}</td>
        <td>{{AvgListener}}</td>
        <td>{{Good}}</td>
        <td>{{Gift}}</td>
    </tr>
    {{/data}}
</script>