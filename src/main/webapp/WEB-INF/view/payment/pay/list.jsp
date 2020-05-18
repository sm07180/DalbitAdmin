<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="wrapper">
    <div id="page-wrapper">
        <!-- serachBox -->
        <form>

        </form> <!-- //serachBox -->
        <!-- DATA TABLE -->
        <div class="row col-lg-12 form-inline">
            <div class="widget widget-table">
                <div class="widget-header">
                    <h3><i class="fa fa-desktop"></i>결제 내역</h3>
                    <div class="btn-group widget-header-toolbar">
                        <a href="#" title="열기/닫기" class="btn-borderless btn-toggle-expand">
                            <i class="fa fa-chevron-up" id="_searchToggleIcon"></i>
                        </a>
                    </div>
                </div>
                <div class="widget-content">
                    <table id="list_info" class="table table-sorting table-hover table-bordered">
                        <thead></thead>
                        <tbody></tbody>
                    </table>
                </div>
            </div>
        </div>
        <!-- // DATA TABLE -->
    </div> <!-- //page-wrapper -->
</div> <!-- //wrapper -->

<script type="text/javascript">
    $(document).ready(function() {
        init();
    });

    function init() {
        var dtList_info;
        var dtList_info_data = function(data) {
        };
        dtList_info = new DalbitDataTable($("#list_info"), dtList_info_data, payDataTableSource.payList);
        dtList_info.useCheckBox(false);
        dtList_info.useIndex(true);
        dtList_info.createDataTable();
    }

    function cancelClick(){
        alert("취소요청 개발 진행중");




    }

    function codeString(data) {
        console.log(data);
        var str;
        if(data == 'VA'){
            str = '가상계좌'
        } else if (data == 'CN') {
            str = '신용카드';
        } else if (data == 'MC') {
            str = '휴대폰';
        } else if (data == 'RA') {
            str = '계좌이체';
        } else {
            str = '-'
        }
        return str;
    }


</script>