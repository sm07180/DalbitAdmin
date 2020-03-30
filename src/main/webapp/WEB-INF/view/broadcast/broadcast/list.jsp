
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="container-fluid">
            <!-- serachBox -->
            <div class="row col-lg-12 form-inline">
                <div class="widget widget-table searchBoxArea">
                    <div class="widget-header searchBoxRow">
                        <h3 class="title"><i class="fa fa-search"></i> 방송 검색</h3>
                        <div>
                            <span id="searchRadio"></span>
                            <span id="searchType_broad"></span>
                            <label><input type="text" class="form-control" id="txt_search"></label>
                            <button type="submit" class="btn btn-success" id="bt_search">검색</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- //serachBox -->
            <!-- DATA TABLE -->
            <div class="row col-lg-12 form-inline" id="div_broadcastList">
                <div class="widget widget-table" id="main_table">
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
                            <thead></thead>
                            <tbody></tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!-- DATA TABLE END -->
            <!-- TAB -->
            <div class="no-padding hide" id="broadcastTab">
                <jsp:include page="broadcastTab.jsp"/>
            </div>
            <!-- TAB END -->
        </div>
    </div>
</div>

<script type="text/javascript" src="/js/code/broadcast/broadCodeList.js"></script>

<script>
    $("#searchType_broad").html(util.getCommonCodeSelect(-1, searchType_broad));
    $("#searchRadio").html(util.getCommonCodeRadio(1, searchRadio));

    $(document).ready(function() {
        $('#searchRadio').change(function() {
            console.log($('input[name="searchRadio"]:checked').val());
            if($('input[name="searchRadio"]:checked').val() == "1"){
                $("#searchType_broad").html(util.getCommonCodeSelect(-1, searchType_broad));
            }else{
                $("#searchType_broad").html(util.getCommonCodeSelect(-1, searchBroad_broad));
            }
        });
        $('input[id="txt_search"]').keydown(function() {
            if (event.keyCode === 13) {
                getSearch();
            };
        });
        <!-- 버튼 -->
        $('#bt_search').click( function() {       //검색
            getSearch();
        });
        <!-- 버튼 끝 -->
    });

    var dtList_info_data = function ( data ) {
        var slctType = $('input[name="searchRadio"]:checked').val()
        data.slctType = $('input[name="searchRadio"]:checked').val();
        if(slctType == "1"){      // DJ정보
            data.dj_slctType = $("select[name='searchType_broad']").val();
            data.dj_searchText = $('#txt_search').val();
            data.room_slctType = -1;
            data.room_searchText = "";
            data.ortStartDate =2;
        }else{                                                              // 방송정보
            data.dj_slctType = -1;
            data.dj_searchText = "";
            data.room_slctType = $("select[name='searchBroad_broad']").val();
            data.room_searchText = $('#txt_search').val();
            data.ortStartDate =2;
        }
    };
    dtList_info = new DalbitDataTable($("#list_info"), dtList_info_data, BroadcastDataTableSource.broadcastList);
    dtList_info.useCheckBox(true);
    dtList_info.useIndex(true);
    dtList_info.createDataTable();

    var excelBtn = '<button class="btn btn-default btn-sm print-btn pull-right" type="button" id="excelDownBtn"><i class="fa fa-print"></i>Excel Print</button>';
    $("#div_broadcastList").find("#main_table").find(".footer-right").append(excelBtn);


    var tmp_slctType;
    var tmp_dj_slctType = -1;
    var tmp_dj_searchText;
    var tmp_room_slctType = -1;
    var tmp_room_searchText;
    function getSearch(){                 // 검색
        /* 엑셀저장을 위해 조회조건 임시저장 */
        var slctType = $('input[name="searchRadio"]:checked').val()
        tmp_slctType = $('input[name="searchRadio"]:checked').val();
        if(slctType == "1"){
            tmp_dj_slctType = $("select[name='searchType_broad']").val();
            tmp_dj_searchText = $('#txt_search').val();
        }else {
            tmp_room_slctType = $("select[name='searchBroad_broad']").val();
            tmp_room_searchText = $('#txt_search').val();
        }
        dtList_info.reload();
        ui.toggleSearchList();
        $('#detailFrm').addClass("hid");

    }

    function getBroadCast_info(index){
        var data = dtList_info.getDataRow(index);
        var obj = new Object();
        obj.room_no = data.room_no;
        $('#broadcastTab').addClass("show");
        util.getAjaxData("type", "/rest/broadcast/broadcast/info",obj, info_sel_success);
    }

    $(document).on('click', '#list_info .dt-body-center input[type="checkbox"]', function(){
        if($(this).prop('checked')){
            $(this).parent().parent().find('.getBroadCast_info').click();
        }
    });

    /*=============엑셀==================*/
    $('#excelDownBtn').on('click', function(){
        var formElement = document.querySelector("form");
        var formData = new FormData(formElement);
        formData.append("slctType", tmp_slctType);
        formData.append("dj_slctType", tmp_dj_slctType);
        formData.append("dj_searchText", tmp_dj_searchText);
        formData.append("room_slctType", tmp_room_slctType);
        formData.append("room_searchText", tmp_room_searchText);
        util.excelDownload($(this), "/rest/broadcast/broadcast/listExcel", formData, fn_success_excel, fn_fail_excel)
    });
    function fn_success_excel(){
        console.log("fn_success_excel");
    }
    function fn_fail_excel(){
        console.log("fn_fail_excel");
    }

</script>