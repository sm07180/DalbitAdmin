<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- DATA TABLE -->
<div class="row col-lg-12 form-inline">
    <div class="widget widget-table">
        <div class="widget-header">
            <h3><i class="fa fa-desktop"></i> 검색결과</h3>
            <div class="btn-group widget-header-toolbar">
                <a href="#" title="열기/닫기" class="btn-borderless btn-toggle-expand">
                    <i class="fa fa-chevron-up" id="_searchToggleIcon"></i>
                </a>
            </div>
        </div>
        <div class="widget-content">
            <table id="reqSpecialList" class="table table-sorting table-hover table-bordered">
                <thead>
                </thead>
                <tbody id="tableBody">
                </tbody>
            </table>
        </div>
    </div>
</div>
<!-- // DATA TABLE -->


<script type="text/javascript" src="/js/dataTablesSource/menu/specialDataTableSource.js?${dummyData}"></script>
<script type="text/javascript">


    function request() {
        var dtList_info;
        var dtList_info_data = function(data) {
        };
        dtList_info = new DalbitDataTable($("#reqSpecialList"), dtList_info_data, specialDataTableSource.reqSpecialList);
        dtList_info.useCheckBox(true);
        dtList_info.useIndex(true);
        dtList_info.createDataTable();

        ui.checkBoxInit('reqSpecialList');
    }

    $(document).on('click', '._reqDalDetail', function() {
       // var data = {
       //     'idx': $(this).data('idx')
       // };
       alert($(this).data('idx'));
    });

    $(document).on('click', '#reqSpecialList .dt-body-center input[type="checkbox"]', function() {
       if($(this).prop('checked')) {
           $('#reqSpecialList .dt-body-center input[type="checkbox"]').removeAttr('checked');
           $(this).prop('checked', 'checked');
           $(this).parent().parent().find('._reqDalDetail').click();
       }
    });

</script>