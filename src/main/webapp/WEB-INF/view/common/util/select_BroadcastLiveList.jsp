<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    .lb_style{
        border: 1px solid #DDDDDD;
        background-color: #DCE6F2;
        height: 34px;
        padding-left: 0px;
        padding-right: 0px;
    }
</style>

<div id="select_BroadcastLiveList">
    <div id="wrapper">
        <div class="modal fade" id="modal_select_broadcastLive" tabindex="-1" role="dialog" aria-labelledby="broadcastLiveModalLabel" aria-hidden="true">
            <div class="modal-dialog" style="max-width: 100%; width: auto; display: table;">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true" onclick="bt_x();">&times;</button>
                    </div>
                    <div class="modal-body" style="height:320px">
                        <!-- serachBox -->
                        <div class="row col-lg-12 form-inline">
                            <div class="col-md-12 no-padding">
                                <div class="widget widget-table searchBoxArea">
                                    <div class="widget-header searchBoxRow">
                                        <h3 class="title"><i class="fa fa-search"></i> 방송 검색</h3>
                                        <div>
                                            <span id="searchRadio"></span>
                                            <span id="searchType_broad"></span>
                                            <label><input type="text" class="form-control" id="txt_search"></label>
                                            <button type="button" class="btn btn-success" id="bt_search">검색</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12 no-padding">
                                <div class="widget-content">
                                    <table id="modal_broadcastLive_list_info" class="table table-sorting table-hover table-bordered">
                                        <thead>
                                        </thead>
                                        <tbody id="tableBody">
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <!-- //serachBox -->
                    </div>
                    <div class="modal-footer" style="border-width:0px;">
                        <%--<button type="button" class="btn" data-dismiss="modal">닫기</button>--%>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>

    var broadcastModalId = "select_BroadcastLiveList";

    $(document).ready(function () {
        $("#"+broadcastModalId).find('input[id="txt_search"]').keydown(function() {
            if (event.keyCode === 13) {
                getModalUserInfo();
            };
        });
        <!-- 버튼 -->
        $("#"+broadcastModalId).find('#bt_search').click( function() {       //검색
            getModalUserInfo();
        });
        <!-- 버튼 끝 -->

        $("#"+broadcastModalId).find("#searchType_broad").html(util.getCommonCodeSelect(0, searchType_broad));
        $("#"+broadcastModalId).find("#searchRadio").html(util.getCommonCodeRadio(1, searchRadio));

        $("#"+broadcastModalId).find('#searchRadio').change(function() {
            if($("#"+broadcastModalId).find('input[name="searchRadio"]:checked').val() == "1"){
                $("#"+broadcastModalId).find("#searchType_broad").html(util.getCommonCodeSelect(0, searchType_broad));
            }else{
                $("#"+broadcastModalId).find("#searchType_broad").html(util.getCommonCodeSelect(-1, searchBroad_broad));
            }
        });
    });

    var callbackFn;
    function showPopBroadcastLiveList(fn) {
        callbackFn = fn;
        $("#"+broadcastModalId).find("#modal_select_broadcastLive").modal();
    }

    var dtList_modal_info_broadcast_live;
    var dtList_info_data = function (data) {
        var slctType = $("#"+broadcastModalId).find('input[name="searchRadio"]:checked').val();
        data.slctType = slctType;
        if(slctType == "1"){      // DJ정보
            data.dj_slctType = $("#"+broadcastModalId).find("select[name='searchType_broad']").val();
            data.dj_searchText = $("#"+broadcastModalId).find('#txt_search').val();
            data.room_slctType = -1;
            data.room_searchText = "";
            data.ortStartDate =2;
        }else {                                                              // 방송정보
            data.dj_slctType = -1;
            data.dj_searchText = "";
            data.room_slctType = $("#"+broadcastModalId).find("select[name='searchBroad_broad']").val();
            data.room_searchText = $("#"+broadcastModalId).find('#txt_search').val();
            data.ortStartDate =2;
        }
        data.room_liveType = 1; // live:1 , end:2
        data.sortStartDate = 0;
    };
    console.log(dtList_info_data);
    dtList_modal_info_broadcast_live = new DalbitDataTable($("#"+broadcastModalId).find("#modal_broadcastLive_list_info"), dtList_info_data, UtilDataTableSource.modalBroadcastLiveList);
    dtList_modal_info_broadcast_live.useCheckBox(false);
    dtList_modal_info_broadcast_live.useIndex(true);
    dtList_modal_info_broadcast_live.setPageLength(10);
    dtList_modal_info_broadcast_live.createDataTable();


    function setModalBroadcastLiveData(index){
        var data = dtList_modal_info_broadcast_live.getDataRow(index);
        // var obj = new Object();
        console.log(data);

        //callback
        callbackFn(data);
    }

    function getModalUserInfo() {                 // 검색
        dtList_modal_info_broadcast_live.reload();
    }
    function bt_x(){

    };



</script>
