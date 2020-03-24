
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
                            <form id="search_radio">
                                <label class="radio-inline"><input type="radio" name="radio_search" value="member" checked>회원</label>
                                <label class="radio-inline"><input type="radio" name="radio_search" value="broad">방송</label>
                                <span id="searchType"></span>
                                <label><input type="text" class="form-control" id="txt_search"></label>
                                <button type="submit" class="btn btn-success" id="bt_search">검색</button>
                            </form>
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
                <jsp:include page="broadcastTab.jsp"/>
            </div>
            <!-- TAB END -->
        </div>
    </div>
</div>

<script type="text/javascript" src="/js/code/broadcast/broadCodeList.js"></script>

<script>
    $("#searchType").html(util.getCommonCodeSelect(-1, searchType));

    $(document).ready(function() {
        $('#search_radio').change(function() {
            if($('input[name="radio_search"]:checked').val() == "member"){
                $("#searchType").html(util.getCommonCodeSelect(-1, searchType));
            }else{
                $("#searchType").html(util.getCommonCodeSelect(-1, searchBroad));
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

    init();
    function init(){

        var dtList_info_data = function ( data ) {
            data.search = $('#txt_search').val();                            // 검색명
            data.gubun = $("select[name='selectGubun']").val();
            data.searchBroad = $('#txt_broad').val();                        // 방송색명
            data.gubunBroad = $("select[name='selectGubun_broad']").val();
        };
        dtList_info = new DalbitDataTable($("#list_info"), dtList_info_data, BroadcastDataTableSource.broadcastList);
        dtList_info.useCheckBox(true);
        dtList_info.useIndex(true);
        dtList_info.createDataTable();
        getSearch();
    }

    function getSearch(){                 // 검색
        dtList_info.reload();
        ui.toggleSearchList();
    }

    function getBroadCast_info(index){
        var data = dtList_info.getDataRow(index);
        var obj = new Object();
        obj.room_no = data.roomNo;
        util.getAjaxData("type", "/rest/broadcast/broadcast/info",obj, info_sel_success);
    }

    $(document).on('click', '#list_info .dt-body-center input[type="checkbox"]', function(){
        if($(this).prop('checked')){
            $(this).parent().parent().find('.getBroadCast_info').click();
        }
    });

</script>