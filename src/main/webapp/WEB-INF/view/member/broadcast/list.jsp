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
                <th>RoomType</th>
                <th>RoomTitle</th>
                <th>StartTime</th>
                <th>EndTime</th>
                <th>OnAirTime</th>
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
        getAjaxData("list", "/rest/member/broadcast/list", "", fn_success, fn_fail);
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
        <td>{{NO}}</td>
        <td>{{RoomType}}</td>
        <td>{{convertToDate RoomTitle "YYYY.MM.DD"}}</td>
        <td>{{convertToDate StartTime "YYYY.MM.DD"}}</td>
        <td>{{EndTime}}</td>
        <td>{{OnAirTime}}</td>
        <td>{{AvgListener}}</td>
        <td>{{Good}}</td>
        <td>{{Gift}}</td>
    </tr>
    {{/data}}
</script>