
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="wrapper">
    <div id="page-wrapper">
        <!-- serachBox -->
        <div class="row col-lg-12 form-inline">
            <div class="widget widget-table searchBoxArea">
                <div class="widget-header searchBoxRow">
                    <h3 class="title"><i class="fa fa-search"></i> 회원 검색</h3>
                    <div>
                        <span id="searchType"></span>
                        <label><input type="text" class="form-control" id="txt_search"></label>
                        <button type="submit" class="btn btn-success" id="bt_search">검색</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- //serachBox -->
        <!-- DATA TABLE -->
        <ul class="nav nav-tabs nav-tabs-custom-colored mt5">
            <li class="active"><a href="#memberList" role="tab" data-toggle="tab" onclick="memberList();">회원</a></li>
            <li><a href="#withdrawalList" role="tab" data-toggle="tab" id="tab_withdrawalList" onclick="withdrawalList();">탈퇴회원</a></li>
        </ul>
        <div class="row col-lg-12 form-inline">
            <div class="widget widget-table" id="div_memberList">
                <div class="widget-header">
                    <h3><i class="fa fa-desktop"></i> 검색결과</h3>
                    <div class="btn-group widget-header-toolbar">
                        <a href="#" title="열기/닫기" class="btn-borderless btn-toggle-expand">
                            <i class="fa fa-chevron-up" id="_searchToggleIcon"></i>
                        </a>
                    </div>
                </div>
                <div class="tab-content no-padding">
                    <div class="tab-pane fade in active " id="memberList">       <!-- 회원 -->
                        <div class="widget-content">
                            <table id="tb_memberList" class="table table-sorting table-hover table-bordered">
                                <thead></thead>
                                <tbody></tbody>
                            </table>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="withdrawalList">       <!-- 회원 -->
                        <div class="widget-content">
                            <table id="tb_withdrawalList" class="table table-sorting table-hover table-bordered">
                                <thead></thead>
                                <tbody></tbody>
                            </table>
                        </div>
                    </div>
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

<script>
    $(document).ready(function() {

        ui.checkBoxInit('tb_memberList');

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

    $("#searchType").html(util.getCommonCodeSelect(-1, searchType));

    var memWithdrawal = "0";

    var dtList_info;
    var dtList_info_data = function ( data ) {
        data.searchType = $("select[name='searchType']").val();          // 검색구분
        data.searchText = $('#txt_search').val();                        // 검색명
        data.memWithdrawal = memWithdrawal;
        // data.pageCnt = 10;
    };
    dtList_info = new DalbitDataTable($("#tb_memberList"), dtList_info_data, MemberDataTableSource.userInfo);
    dtList_info.useCheckBox(true);
    dtList_info.useIndex(true);
    dtList_info.useInitReload(false);
    dtList_info.createDataTable();

    var dtList_info2;
    var dtList_info_data2 = function ( data ) {
        data.searchType = $("select[name='searchType']").val();          // 검색구분
        data.searchText = $('#txt_search').val();                        // 검색명
        data.memWithdrawal = memWithdrawal;
        // data.pageCnt = 10;
    };
    dtList_info2 = new DalbitDataTable($("#tb_withdrawalList"), dtList_info_data2, MemberDataTableSource.userInfo);
    dtList_info2.useCheckBox(true);
    dtList_info2.useIndex(true);
    dtList_info2.useInitReload(false);
    dtList_info2.createDataTable();

    var excel = '<button class="btn btn-default btn-sm print-btn pull-right" type="button" id="excelDownBtn"><i class="fa fa-print"></i>Excel Down</button>';
    $("#div_memberList").find(".footer-right").append(excel);

    var tmp_searchType;
    var tmp_searchText;
    var memNo = "unknown";
    function getUserInfo() {                 // 검색
        if ($('#txt_search').val().length < 2) {
            alert("검색대상을 입력해 주세요.");
            return;
        }
        if(memWithdrawal == "0"){
            dtList_info.reload();
            ui.checkBoxInit('tb_memberList');
        }else{
            dtList_info2.reload();
            ui.checkBoxInit('tb_withdrawalList');
        }
        /* 엑셀저장을 위해 조회조건 임시저장 */
        tmp_searchType = $("select[name='searchType']").val();
        tmp_searchText = $('#txt_search').val();
        /*검색결과 영역이 접혀 있을 시 열기*/
        ui.toggleSearchList()
        $('#tabList_top').removeClass("show");

    }
    function memberList(){
        memWithdrawal = "0";
    }
    function withdrawalList(){
        memWithdrawal = "1";
    }

    $(document).on('click', '#tb_memberList .dt-body-center input[type="checkbox"]', function(){
        if($(this).prop('checked')){
            $(this).parent().parent().find('.getMemberDetail').click();
        } else {
            $("#tabList_top").removeClass("show");
        }
    });

    $(document).on('click', '#tb_withdrawalList .dt-body-center input[type="checkbox"]', function(){
        if($(this).prop('checked')){
            $(this).parent().parent().find('.getMemberDetail').click();
        }
    });


    function getMemNo_info(index){
        tmp_bt = "";
        $('#tabList_top').addClass("show");
        var obj = new Object();
        if(memWithdrawal == "0"){
            var data = dtList_info.getDataRow(index);
            obj.mem_no = data.mem_no;
        }else{
            var data = dtList_info2.getDataRow(index);
            obj.mem_no = data.mem_no;
        }
        obj.memWithdrawal = memWithdrawal;

        console.log("1");
        util.getAjaxData("info", "/rest/member/member/info", obj, info_sel_success, fn_fail);
    }

    /*=============엑셀==================*/
    $('#excelDownBtn').on('click', function(){
        var formElement = document.querySelector("form");
        var formData = new FormData(formElement);
        formData.append("searchType", tmp_searchType);
        formData.append("searchText", tmp_searchText);
        formData.append("memWithdrawal", memWithdrawal);
        util.excelDownload($(this), "/rest/member/member/listExcel", formData, fn_success_excel, fn_fail_excel)
    });

    function fn_success_excel(){
        console.log("fn_success_excel");
    }

    function fn_fail_excel(){
        console.log("fn_fail_excel");
    }
    /*==================================*/
</script>