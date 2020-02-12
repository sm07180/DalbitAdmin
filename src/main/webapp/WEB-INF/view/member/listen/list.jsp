<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!-- SHOW HIDE COLUMNS DATA TABLE -->
<div class="widget widget-table">

    <div class="widget-content">
        <table id="list" class="table table-sorting table-hover table-bordered datatable">
            <span>
                <button class="btn btn-default print-btn" type="button" id="excelDownBtn"><i class="fa fa-print"></i>Excel Print</button>
            </span>
            <thead>
            <tr>
                <th>NO</th>
                <th>청취방주제</th>
                <th>청취 방송제목</th>
                <th>청취시작시간</th>
                <th>청취종료시간</th>
                <th>청취진행시간</th>
                <th>받은 루비 개수</th>
                <th>청취 DJ 닉네임</th>
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
        getAjaxData("list", "/rest/member/listen/list", "", fn_success, fn_fail);
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

    $('#excelDownBtn').on('click', function() {
        var formElement = document.querySelector("form");
        var formData = new FormData(formElement);

        excelDownload($(this), "/rest/member/listen/listExcel", formData, fn_success_excel, fn_fail_excel)
    });

    function fn_success_excel() {
        alert("fn_success_excel");
    }

    function fn_fail_excel() {
        alert("fn_fail_excel");
    }
</script>

<script id="tmp_list" type="text/x-handlebars-template">
    {{#data}}
    <tr>
        <td>{{index @index}}</td>
        <td>{{subjectType}}</td>
        <td>{{title}}</td>
        <td>{{convertToDate startDate ""}}</td>
        <td>{{convertToDate endDate ""}}</td>
        <td>{{listenTime}}</td>
        <td>{{giftRuby}}</td>
        <td>{{memNick}}</td>
    </tr>
    {{/data}}
</script>