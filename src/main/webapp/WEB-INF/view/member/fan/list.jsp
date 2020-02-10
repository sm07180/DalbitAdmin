<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!-- SHOW HIDE COLUMNS DATA TABLE -->
<div class="widget widget-table">

    <div class="widget-content">
        <table id="list" class="table table-sorting table-hover table-bordered datatable">
            <span>
                <button class="btn btn-default" type="button">Fan등록</button>
                <button class="btn btn-default print-btn" type="button"><i class="fa fa-print"></i>Excel Print</button>
            </span>
            <%-- <i class="fa fa-close"></i> 선택삭제 버튼 만들어야함 --%>
            <thead>
            <tr>
                <th>
                    <input type="checkbox">
                </th>
                <th>NO</th>
                <th>Fan ID</th>
                <th>Fan 닉네임</th>
                <th>받는 건 수</th>
                <th>받은 개수</th>
                <th>등록 일시</th>
                <th>해제 일시</th>
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
        getAjaxData("list", "/rest/member/fan/list", "", fn_success, fn_fail);
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
        <td><input type="checkbox"></td>
        <td>{{index @index}}</td>
        <td>{{memId}}</td>
        <td>{{memNick}}</td>
        <td></td>
        <td></td>
        <td>{{convertToDate regDate ""}}</td>
        <td></td>
    </tr>
    {{/data}}
</script>