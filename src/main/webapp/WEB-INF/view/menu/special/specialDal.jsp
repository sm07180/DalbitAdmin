<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- DATA TABLE -->
<div class="widget widget-table">
    <%--<div class="widget-header">--%>
        <%--<h3><i class="fa fa-desktop"></i> 검색결과</h3>--%>
        <%--<div class="btn-group widget-header-toolbar">--%>
            <%--<a href="#" title="열기/닫기" class="btn-borderless btn-toggle-expand">--%>
                <%--<i class="fa fa-chevron-up" id="_searchToggleIcon"></i>--%>
            <%--</a>--%>
        <%--</div>--%>
    <%--</div>--%>
    <div class="widget-content">
        <table id="specialList" class="table table-sorting table-hover table-bordered">
            <thead>
            </thead>
            <tbody id="tableBody">
            </tbody>
        </table>
    </div>
</div>
<!-- // DATA TABLE -->

<div class="mt15">
    <form id="dalList"></form>
</div>

<script type="text/javascript" src="/js/dataTablesSource/menu/specialDataTableSource.js?${dummyData}"></script>
<script type="text/javascript" src="/js/code/menu/menuCodeList.js?${dummyData}"></script>
<script type="text/javascript">

    var dtList_info;
    function init() {
        var dtList_info_data = function(data) {
        };
        dtList_info = new DalbitDataTable($("#specialList"), dtList_info_data, specialDataTableSource.specialList, $("#searchForm"));
        dtList_info.useCheckBox(true);
        dtList_info.useIndex(false);
        dtList_info.createDataTable();

        ui.checkBoxInit('specialList');
        // $("#specialList-select-all").remove();
    }

    $(document).on('click', '._dalDetail', function() {
        var obj = {
            req_idx : $(this).data('reqidx')
        };
        util.getAjaxData("detail", "/rest/menu/special/dalDetail", obj, fn_success_dalDetail);
    });

    $(document).on('click', '#specialList .dt-body-center input[type="checkbox"]', function() {
        if($(this).prop('checked')) {
            $('#specialList .dt-body-center input[type="checkbox"]').removeAttr('checked');
            $(this).prop('checked', 'checked');
            $(this).parent().parent().find('._dalDetail').click();
        } else {
            $('#dalList').empty();
        }
    });

    function fn_success_dalDetail(dst_id, response) {
        var template = $('#tmp_dalList').html();
        var templateScript = Handlebars.compile(template);
        var context = response.data;
        var html = templateScript(context);

        $('#dalList').html(html);
    }

    $(document).on('click', '#bt_reqCancel', function() {
        if(confirm("승인 취소 하시겠습니까?")) {
            var obj = new Object;
            var data = dtList_info.getDataRow();
            obj.req_idx = data.req_idx;
            obj.mem_no = data.mem_no;
            dalbitLog(data);
            util.getAjaxData("cancel", "/rest/menu/special/reqCancel", obj, fn_success_cancel);
        }
        return false;
    });

    function fn_success_cancel(dst_id, response) {
        alert('승인 취소 처리되었습니다.');
        getList();
    }

</script>


<script id="tmp_dalList" type="text/x-handlebars-template">
    <div class="widget widget-table">
        <div class="widget-header">
            <h3><i class="fa fa-desktop"></i> 스페셜 달D 세부사항</h3>
        </div>
        <div class="widget-content mt15">
            <div class="row col-lg-12 form-inline">
                <table class="table table-bordered table-dalbit">
                    <input type="hidden" name="reqIdx" data-idx="{{req_idx}}"/>
                    <tr>
                        <th>제목</th>
                        <td>{{title}}</td>
                        <th>신청일시</th>
                        <td>{{convertToDate reg_date 'YYYY-MM-DD HH:mm:ss'}}</td>
                        <th>관리자 등록 여부</th>
                        <td>{{is_force}}</td>
                    </tr>
                    <tr>
                        <th>신청내용</th>
                        <td colspan="6" style="height:300px">
                            <textarea type="textarea" class="form-control" id="contents" name="contents" style="width: 100%; height: 100%">{{contents}}</textarea>
                        </td>
                    </tr>
                </table>
                <!-- 승인완료 승인거부-->
                <%--{{#equal state '1'}}--%>
                <button type="button" class="btn btn-danger mb15" id="bt_reqCancel">승인취소</button>
                <%--{{/equal}}--%>
            </div>
        </div>
    </div>
</script>