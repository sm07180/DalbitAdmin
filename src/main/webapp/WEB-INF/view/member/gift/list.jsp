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
                <th>구분</th>
                <th>아이템명</th>
                <th>보낸/받은/교환 건 수</th>
                <th>보낸 선물 금액</th>
                <th>보낸/받은 선물 일시</th>
                <th>선물 보낸/받은 UserID</th>
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
        getAjaxData("list", "/rest/member/gift/list", "", fn_success, fn_fail);
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
            paging: true,
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
        <td>{{index @index}}</td>
        <td>{{Sort}}</td>
        <td>{{Item}}</td>
        <td>{{Num}}</td>
        <td>{{Amount}}</td>
        <td>{{Date}}</td>
        <td>{{UserID}}</td>
        <td>{{Refund}}</td>
    </tr>
    {{/data}}
</script>