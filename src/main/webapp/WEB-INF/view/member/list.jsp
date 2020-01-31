<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!-- SHOW HIDE COLUMNS DATA TABLE -->
<div class="widget widget-table">

    <div class="widget-content">
        <table id="memberList" class="table table-sorting table-hover table-bordered datatable">
            <span>
                <button class="btn btn-default" type="button">Delete</button>
                <button class="btn btn-default" type="button">Excel Print</button>
            </span>
            <thead>
            <tr>
                <th><input type="checkbox">
                    <span>NO</span>
                </th>
                <th>Name</th>
                <th>NickName</th>
                <th>PhoneNum</th>
                <th>Email</th>
                <th>JoinDate</th>
                <th>BirthDate</th>
                <th>Live</th>
                <th>Status</th>
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
        getAjaxData("list", "/rest/member/list", "", fn_success, fn_fail);
    });


    function fn_success(dst_id, response){
        dalbitLog(response);

        var template = $('#tmp_list').html();
        var templateScript = Handlebars.compile(template);
        var context = response;
        var html = templateScript(context);



        $("#tableBody").append(html);

        $('#memberList').DataTable({
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
        <td>
            <input type="checkbox">
            <span>{{NO}}</span>
        </td>
        <td>{{Name}}</td>
        <td>{{NickName}}</td>
        <td>{{PhoneNum}}</td>
        <td>{{Email}}</td>
        <td>{{convertToDate JoinDate "YYYY.MM.DD"}}</td>
        <td>{{convertToDate BirthDate "YYYY.MM.DD"}}</td>
        <td>{{Live}}</td>
        <td>
            <select name="select2" id="select2" class="select2">
                <option value="option1">정상</option>
                <option value="option2">탈퇴</option>
                <option value="option3">정지</option>
            </select>
        </td>
    </tr>
    {{/data}}
</script>