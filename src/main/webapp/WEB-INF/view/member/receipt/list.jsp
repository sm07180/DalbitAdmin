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
                <th>
                    <input type="checkbox">
                </th>
                <th>No</th>
                <th>구분</th>
                <th>신고대상 ID</th>
                <th>신고 내용</th>
                <th>신고 접수일시</th>
                <th>처리일시</th>
                <th>처리내용</th>
                <th>처리상태</th>
                <th>처리자ID</th>
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
        getAjaxData("list", "/rest/member/receipt/list", "", fn_success, fn_fail);
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
        <td>{{NO}}</td>
        <td>{{index @index}}</td>
        <td>{{NickName}}</td>
        <td>{{Name}}</td>
        <td>{{PhoneNum}}</td>
        <td>{{JoinPlatform}}</td>
        <td>{{Login_out}}</td>
        <td>{{Live}}</td>
    </tr>
    {{/data}}
</script>