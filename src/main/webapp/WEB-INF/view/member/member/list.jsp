
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    .lb_style{
        border: 1px solid #DDDDDD;
        background-color: #DCE6F2;
        height: 34px;
    }
</style>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="container-fluid">
            <!-- serachBox -->
            <div class="row col-lg-12 form-inline">
                <div class="widget widget-table searchBoxArea">
                    <div class="widget-header searchBoxRow">
                        <h3 class="title"><i class="fa fa-search"></i> 회원 검색</h3>
                        <div>
                            <span id="meminfo"></span>
                            <label><input type="text" class="form-control" id="txt_search"></label>
                            <button type="submit" class="btn btn-success" id="bt_search">검색</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- //serachBox -->
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
                        <table id="list_info" class="table table-sorting table-hover table-bordered">
                            <thead>
                            </thead>
                            <tbody id="tableBody">
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!-- DATA TABLE END -->
            <!-- TAB -->
            <div class="no-padding">
                <jsp:include page="memberTab.jsp"></jsp:include>
            </div>
            <!-- TAB END -->
        </div>
    </div>
</div>

<script>
    $(document).ready(function() {
        $('input[id="txt_search"]').keydown(function() {
            if (event.keyCode === 13) {
                getUserInfo();
            };
        });
        <!-- 버튼 -->
        $('#bt_search').click( function() {       //검색
            getUserInfo();
        });
        <!-- 버튼 끝 -->
    });

    $("#meminfo").html(getCommonCodeSelect(-1, meminfo));

    var dtList_info_data = function ( data ) {
        data.search = $('#txt_search').val();                        // 검색명
        data.gubun = $("select[name='selectGubun']").val();
    };
    dtList_info = new DalbitDataTable($("#list_info"), dtList_info_data, MemberDataTableSource.userInfo);
    dtList_info.useCheckBox(false);
    dtList_info.useIndex(true);
    dtList_info.createDataTable();
    getUserInfo();

    function init(){
    }

    function getUserInfo(){                 // 검색
        /* 엑셀저장을 위해 조회조건 임시저장 */
        tmp_search = $('#txt_search').val();
        tmp_gubun = $("select[name='selectGubun']").val();
        dtList_info.reload();
        /*검색결과 영역이 접혀 있을 시 열기*/
        var toggleIcon = $('#_searchToggleIcon');
        if(toggleIcon.hasClass('fa-chevron-down')){
            toggleIcon.click();
        }
        $('#tabList').removeClass("show");
    }

    function getMemNo_info(index){
        console.log("@@@@@@@@@@@@ 1");
        $('#tabList').addClass("show");
        var data = dtList_info.getDataRow(index);
        var obj = new Object();
        obj.memNo = data.memNo;
        getAjaxData("info", "/rest/member/member/info", obj, info_sel_success, fn_fail);
    }


    /*=============엑셀==================*/
    $('#excelDownBtn').on('click', function(){
        var formElement = document.querySelector("form");
        var formData = new FormData(formElement);

        formData.append("search", tmp_search);
        formData.append("date", tmp_date);
        formData.append("gubun", tmp_gubun);
        formData.append("checkDate", tmp_checkDate);
        formData.append("stDate", tmp_stDate);
        formData.append("edDate", tmp_edDate);
        /*formData.append("test003", "test003");*/
        excelDownload($(this), "/rest/member/member/listExcel", formData, fn_success_excel, fn_fail_excel)
    });

    function fn_success_excel(){
        console.log("fn_success_excel");
    }

    function fn_fail_excel(){
        console.log("fn_fail_excel");
    }
    /*==================================*/
</script>