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
        <table id="reqSpecialList" class="table table-sorting table-hover table-bordered">
            <thead>
            </thead>
            <tbody id="tableBody">
            </tbody>
        </table>
    </div>
</div>
<!-- // DATA TABLE -->

<div class="mt15">
    <form id="reqDalList"></form>
</div>

<script type="text/javascript" src="/js/dataTablesSource/menu/specialDataTableSource.js?${dummyData}"></script>
<script type="text/javascript" src="/js/code/menu/menuCodeList.js?${dummyData}"></script>
<script type="text/javascript">


    function initReq() {
        var dtList_info;
        var dtList_info_data = function(data) {
        };
        dtList_info = new DalbitDataTable($("#reqSpecialList"), dtList_info_data, specialDataTableSource.reqSpecialList, $("#searchForm"));
        dtList_info.useCheckBox(true);
        dtList_info.useIndex(true);
        dtList_info.createDataTable();

        ui.checkBoxInit('reqSpecialList');
    }

    $(document).on('click', '._reqDalDetail', function() {
       var data = {
           'idx': $(this).data('idx')
       };
       util.getAjaxData("detail", "/rest/menu/special/reqDalDetail", data, fn_success_detail);
    });

    $(document).on('click', '#reqSpecialList .dt-body-center input[type="checkbox"]', function() {
       if($(this).prop('checked')) {
           $('#reqSpecialList .dt-body-center input[type="checkbox"]').removeAttr('checked');
           $(this).prop('checked', 'checked');
           $(this).parent().parent().find('._reqDalDetail').click();
       } else {
           $('#reqDalList').empty();
       }
    });

    function fn_success_detail(dst_id, response) {
        var template = $('#tmp_reqDalList').html();
        var templateScript = Handlebars.compile(template);
        var context = response.data;
        var html = templateScript(context);

        $('#reqDalList').html(html);

        $('#contents').attr("disabled", "disabled");

    }

    $(document).on('click', '#bt_reqOk', function() {
        if(confirm("스페셜 DJ로 등록하시겠습니까?")) {

            var checkbox = $('#reqSpecialList > tbody > tr > td.dt-body-center > input[type=checkbox]:checked');

            var data = {
                'idx': checkbox.parent().parent().find('._reqDalDetail').data('idx')
                , 'mem_no': checkbox.parent().parent().find('._openMemberPop').data('memno')
                , is_force : 0
            };
            dalbitLog(data);
            util.getAjaxData("ok", "/rest/menu/special/reqOk", data, fn_success_ok);
        }
        return false;
    });

    function fn_success_ok(dst_id, response) {
        alert(response.message);
        getList();
    }

    $(document).on('click', '#bt_reqReject', function() {
        if (confirm("승인 거부 하시겠습니까?")) {

            var checkbox = $('#reqSpecialList > tbody > tr > td.dt-body-center > input[type=checkbox]:checked');

            var data = {
                'idx': checkbox.parent().parent().find('._reqDalDetail').data('idx')
                , 'mem_no': checkbox.parent().parent().find('._openMemberPop').data('memno')
            };
            util.getAjaxData("ok", "/rest/menu/special/reqReject", data, fn_success_reject);
        }
        return false;
    });

    function fn_success_reject(dst_id, response) {
        alert('승인 거부 처리되었습니다.');
        getList();
    }


</script>

<script id="tmp_reqDalList" type="text/x-handlebars-template">
    <div class="widget widget-table">
        <div class="widget-header">
            <h3><i class="fa fa-desktop"></i> 스페셜 달D 신청 세부사항</h3>
        </div>
        <div class="widget-content mt15">
            <div class="row col-lg-12 form-inline">
                <table class="table table-bordered table-dalbit">
                    <input type="hidden" name="idx" data-idx="{{idx}}"/>
                    <tr>
                        <th>제목</th>
                        <td>{{title}}</td>
                        <th>신청일시</th>
                        <td>{{convertToDate reg_date 'YYYY-MM-DD HH:mm:ss'}}</td>
                        <th>승인일시</th>
                        <td>{{convertToDate last_upd_date 'YYYY-MM-DD HH:mm:ss'}}</td>
                    </tr>
                    <tr>
                        <th>신청내용</th>
                        <td colspan="6" style="height:300px">
                            <textarea type="textarea" class="form-control" id="contents" name="contents" style="width: 100%; height: 100%">{{contents}}</textarea>
                        </td>
                    </tr>
                </table>
                <!-- 승인완료 승인거부-->
                {{^equal state '3'}}<button type="button" class="btn btn-danger pull-right mb15" id="bt_reqReject">승인거부</button>{{/equal}}
                {{^equal state '2'}}<button type="button" class="btn btn-success pull-right mb15 mr10" id="bt_reqOk" data-idx="{{idx}}" data-memno="{{mem_no}}">승인완료</button>{{/equal}}
            </div>
        </div>
    </div>
</script>