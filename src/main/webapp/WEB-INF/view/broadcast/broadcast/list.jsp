
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dummyData"><%= java.lang.Math.round(java.lang.Math.random() * 1000000) %></c:set>

<div id="wrapper">
    <div id="page-wrapper">
        <!-- serachBox -->
        <form id="searchForm">
        <div class="row col-lg-12 form-inline">
            <div class="widget widget-table searchBoxArea">

                <table>
                    <tr>
                        <th rowspan="2" style="background-color:#4472c4;color:#e9ee17;width: 70px">
                            <i class="fa fa-search"></i><br/>검색
                        </th>
                        <td style="text-align: left">
                            <span id="searchRadio"></span>
                            <span id="searchRoom_state"></span>
                            <div class="input-group date" id="seldate" style="display: none;">
                                <label for="onedayDate" class="input-group-addon">
                                    <span><i class="fa fa-calendar" id="seldateDateBtn"></i></span>
                                </label>
                                <input type="text" class="form-control" id="onedayDate" name="onedayDate" style="width: 110px">
                            </div>
                            <label><input type="text" class="form-control" name="searchText" id="searchText" placeholder="검색어를 입력해주세요." ></label>

                            <button type="button" class="btn btn-success" id="bt_search">검색</button>

                        </td>
                    </tr>
                </table>
            </div>
        </div>
        </form>
        <!-- //serachBox -->
        <!-- DATA TABLE -->
        <div class="row col-lg-12 form-inline" id="div_broadcastList">
            <div class="widget widget-table" id="main_table">
                <div class="widget-header">
                    <h3><i class="fa fa-desktop"></i> 검색결과</h3>
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

<script type="text/javascript" src="/js/util/memberUtil.js?${dummyData}"></script>
<script type="text/javascript" src="/js/code/broadcast/broadCodeList.js?${dummyData}"></script>
<script>

    var type;       // 팝업type

    $("#searchType_broad").html(util.getCommonCodeSelect(-1, searchType_broad));
    $("#searchRoom_state").html(util.getCommonCodeSelect(1, searchRoom_state));
    $("#searchRadio").html(util.getCommonCodeRadio(1, searchRadio));

    $(document).ready(function() {
        getSearch();
        ui.checkBoxInit('list_info');
    });

    $('#searchRadio').change(function() {
        if($('input[name="searchRadio"]:checked').val() == "1"){
            $("#searchType_broad").html(util.getCommonCodeSelect(-1, searchType_broad));
        }else{
            $("#searchType_broad").html(util.getCommonCodeSelect(-1, searchBroad_broad));
        }
    });

    $('input[id="searchText"]').keydown(function() {
        if (event.keyCode === 13) {
            getSearch();
        };
    });
    $('#bt_search').click( function() {
        getSearch();
    });

    var tmp_room_liveType = 1;
    var dtList_info;
    var dtList_info_data = function ( data ) {
        var slctType = $('input[name="searchRadio"]:checked').val();
        data.slctType = slctType;
        if(slctType == "1"){      // DJ정보
            data.dj_slctType = $("select[name='searchType_broad']").val();
            data.dj_searchText = $('#searchText').val();
            data.room_slctType = -1;
            data.room_searchText = "";
            data.ortStartDate =2;
        }else{                                                              // 방송정보
            data.dj_slctType = -1;
            data.dj_searchText = "";
            data.room_slctType = $("select[name='searchBroad_broad']").val();
            data.room_searchText = $('#searchText').val();
            data.ortStartDate =2;
        }
        data.room_liveType = tmp_room_liveType;
    };
    dtList_info = new DalbitDataTable($("#list_info"), dtList_info_data, BroadcastDataTableSource.broadcastList);
    dtList_info.useCheckBox(true);
    dtList_info.useIndex(true);
    dtList_info.createDataTable();

    var excelBtn = '<button class="btn btn-default btn-sm print-btn pull-right" type="button" id="broadexcelDownBtn"><i class="fa fa-print"></i>Excel Down</button>';
    $("#main_table").find(".footer-right").append(excelBtn);

    var tmp_slctType;
    var tmp_dj_slctType = -1;
    var tmp_dj_searchText;
    var tmp_room_slctType = -1;
    function getSearch(){                 // 검색
        /* 엑셀저장을 위해 조회조건 임시저장 */
        var slctType = $('input[name="searchRadio"]:checked').val();
        tmp_slctType = $('input[name="searchRadio"]:checked').val();
        tmp_dj_searchText = $('#searchText').val();
        tmp_room_searchText = $('#searchText').val();
        // if(slctType == "1"){
        //     tmp_dj_slctType = $("select[name='searchType_broad']").val();
        // }else {
        //     tmp_room_slctType = $("select[name='searchBroad_broad']").val();
        // }
        tmp_room_liveType = $("select[name='searchRoom_state']").val();
        dtList_info.reload();
        ui.toggleSearchList();
        $('#detailFrm').addClass("hid");

        $('#broadcastTab').removeClass("show");
    }

    function getBroadCast_info(index){
        editEntry = "";
        var data = dtList_info.getDataRow(index);
        var obj = new Object();
        obj.room_no = data.room_no;
        $('#broadcastTab').addClass("show");
        util.getAjaxData("type", "/rest/broadcast/broadcast/info",obj, info_sel_success);
    }

    $(document).on('click', '#list_info .dt-body-center input[type="checkbox"]', function(){
        if($(this).prop('checked')){
            $(this).parent().parent().find('.getBroadCast_info').click();
        } else {
            $('#broadcastTab').removeClass("show");
        }
    });

    /*=============엑셀==================*/
    $('#broadexcelDownBtn').on('click', function(){
        var formElement = document.querySelector("form");
        var formData = new FormData(formElement);
        formData.append("slctType", tmp_slctType);
        formData.append("dj_slctType", tmp_dj_slctType);
        formData.append("dj_searchText", tmp_dj_searchText);
        formData.append("room_slctType", tmp_room_slctType);
        formData.append("room_searchText", tmp_room_searchText);
        formData.append("room_liveType", tmp_room_liveType);
        util.excelDownload($(this), "/rest/broadcast/broadcast/broadcastListExcel", formData)
    });

</script>