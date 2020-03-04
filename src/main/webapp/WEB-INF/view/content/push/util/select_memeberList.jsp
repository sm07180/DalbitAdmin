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

<div id="wrapper">
    <div class="modal fade" id="modal_select_memebet" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
                                    <h3 class="title"><i class="fa fa-search"></i> 회원 검색</h3>
                                    <div>
                                        <select class="form-control searchType" name="selectGubun">
                                            <option selected="selected">검색조건 ▼</option>
                                            <option value="9999">전체</option>
                                            <option value="1">회원 번호</option>
                                            <option value="2">User ID</option>
                                            <option value="3">User 닉네임</option>
                                            <option value="4">연락처</option>
                                        </select>

                                        <label><input type="text" class="form-control" id="txt_modal_search" placeholder="검색할 정보를 입력하세요"></label>
                                        <button type="submit" class="btn btn-success" id="bt_modal_search">검색</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 no-padding">
                            <div class="widget-content">
                                <table id="modal_list_info" class="table table-sorting table-hover table-bordered">
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
                <div class="modal-footer">
                    <%--<button type="button" class="btn" data-dismiss="modal">닫기</button>--%>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function () {
        $("#bt_modal_search").click (function(){     // 검색
            getModalUserInfo();
        });
    });

    var callbackFn;
    function showPopMemberList(fn) {
        callbackFn = fn;
        $("#modal_select_memebet").modal("show");
    }

    var dtList_modal_info_detail;
    var source = UtilDataTableSource.modalMemberList;       //callback : setModalMemeberData()
    var dtList_info_detail_data = function (data) {
        data.search = $('#bt_modal_search').val();
        data.gubun = $("select[name='selectGubun']").val();
    }
    dtList_modal_info_detail = new DalbitDataTable($("#modal_list_info"), dtList_info_detail_data, source);
    dtList_modal_info_detail.useCheckBox(false);
    dtList_modal_info_detail.useIndex(true);
    dtList_modal_info_detail.createDataTable();

    function setModalMemeberData(index){
        var data = dtList_modal_info_detail.getDataRow(index);
        // var obj = new Object();
        console.log(data);
        console.log(data.memNo);

        //callback
        callbackFn(data);

    }
    function getModalUserInfo() {                 // 검색
        dtList_modal_info_detail.reload();
    }
    function bt_x(){

    };



</script>
