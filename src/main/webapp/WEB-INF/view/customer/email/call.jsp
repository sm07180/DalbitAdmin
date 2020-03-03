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
    <div id="page-wrapper">
        <div class="col-md-12 no-padding">
            <label id="call_title"></label>
        </div>
        <div class="row col-md-12">
            <div class="col-md-2 no-padding">
                <div class="col-md-6 lb_style"><label>No</label></div>
                <div class="col-md-6"><label>41</label></div>
            </div>
            <div class="col-md-3 no-padding">
                <div class="col-md-4 lb_style"><label>문의UserID</label></div>
                <div class="col-md-8">
                    <input type="text" class="form-control" id="txt_questMem" style="width: 60%">
                    <button type="button" id="bt_questMem" class="btn-sm" data-toggle="modal" data-target="#myModal">회원검색</button>
                </div>
            </div>
            <div class="col-md-3 no-padding">
                <div class="col-md-4 lb_style"><label>신고대상UserID</label></div>
                <div class="col-md-8">
                    <input type="text" class="form-control" id="txt_reportMem" style="width: 60%">
                    <button type="button" id="bt_reportMem" class="btn-sm" data-toggle="modal" data-target="#myModal">회원검색</button>
                </div>
            </div>
            <div class="col-md-2 no-padding">
                <div class="col-md-4 lb_style"><label>접수일시</label></div>
                <div class="col-md-8" style="height: 34px;"><label>2020.02.02 11:16:11</label></div>
            </div>
            <div class="col-md-2 no-padding">
                <div class="col-md-4 lb_style"><label>처리상태</label></div>
                <div class="col-md-8" style="height: 34px;">
                    <select class="form-control" name="sortType" id="sortType">
                        <option value="1">처리중</option>
                        <option value="2">완료</option>
                    </select>
                </div>
            </div>
        </div>
        <div class="row col-md-12">
            <div class="col-md-2 no-padding">
                <div class="col-md-12 lb_style"><label>신고/문의 내용</label></div>
            </div>
            <div class="col-md-3">
                <input type="text" class="form-control" id="txt_reportContent" style="width: 100%">
            </div>
            <div class="col-md-3 no-padding">
                <div class="col-md-4 lb_style"><label>플랫폼</label></div>
                <div class="col-md-8" style="height: 34px;">
                    <select class="form-control" name="sortType" id="platformType">
                        <option value="9999">플랫폼</option>
                        <option value="1">PC</option>
                        <option value="2">Android-Mobile</option>
                        <option value="3">IOS-Mobile</option>
                        <option value="4">Web-Mobile</option>
                    </select>
                </div>
            </div>
            <div class="col-md-2 no-padding">
                <div class="col-md-4 lb_style"><label>처리일시</label></div>
                <div class="col-md-8" style="height: 34px;"><label>-</label></div>
            </div>
            <div class="col-md-2 no-padding">
                <div class="col-md-4 lb_style"><label>처리자명</label></div>
                <div class="col-md-8" style="height: 34px;"><label>양달이</label></div>
            </div>
        </div>
        <div class="row col-md-12">
            <div class="col-md-2 no-padding lb_style"> <label>문의 관련 메모</label> </div>
            <div class="col-md-10" style="height: 300px"><textarea id="question" style="width: 100%; height: 100%"></textarea></div>
        </div>
    </div>

    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
        /* summernote */
        var targetEditor = $('.summernote');

        targetEditor.summernote({
            height: 300,
            focus: true,
            // onpaste: function() {
            //     alert('You have pasted something to the editor');
            // },
            callbacks: { // 콜백을 사용
                // 이미지를 업로드할 경우 이벤트를 발생
                onImageUpload: function(files, editor, welEditable) {
                    console.log("[onImageUpload]")

                    var formData = new FormData();
                    formData.append("file",files[0]);
                    //TODO  업로드 타입은 상황에 맞게 수정 부탁드립니다.
                    formData.append("uploadType","bg");
                    fileUpdate("https://devphoto2.dalbitcast.com/upload",formData, function (data) {
                        var json = jQuery.parseJSON(data);
                        console.log(json);
                        if(json.code != "0"){
                            alert(json.message);
                            return;
                        }
                        // UPLOAD IMAGE URL 적용
                        var imgURL = json.data.url;
                        targetEditor.summernote('editor.insertImage', imgURL);
                    });
                }
            }
        });

        $("#bt_ban").on("click", function () {
            console.log(targetEditor.summernote("code"))
            // $(".viewer").empty().append(targetEditor.summernote("code"))
            // $(".code").text(targetEditor.summernote("code"))
        });

        $("#bt_questMem").click (function(){        // 문의 회원검색
            modalView("quest");
        });
        $("#bt_reportMem").click (function(){        // 문의 회원검색
            modalView("report");
        });
        $("#bt_modal_search").click (function(){     // 검색
            getModalUserInfo();
        });

    });

    var dtList_modal_info_detail;
    var source = customerDataTableSource["emailModalHistory"];
    var dtList_info_detail_data = function (data) {
        data.search = $('#bt_modal_search').val();
    }
    dtList_modal_info_detail = new DalbitDataTable($("#modal_list_info"), dtList_info_detail_data, source);
    dtList_modal_info_detail.useCheckBox(false);
    dtList_modal_info_detail.useIndex(true);
    dtList_modal_info_detail.createDataTable();

    var viewGubun;
    function modalView(tmp){
        viewGubun = tmp;
    }
    function setModalData(index){
        var data = dtList_modal_info_detail.getDataRow(index);
        // var obj = new Object();
        console.log(data);
        console.log(data.memNo);
        // obj.memNo = data.memNo;
        if(viewGubun == "quest"){
            $('#txt_questMem').val(data.memId);
        }else{
            $('#txt_reportMem').val(data.memId);
        }
    }
    function getModalUserInfo() {                 // 검색
        dtList_modal_info_detail.reload();
    }
    function bt_x(){

    };



</script>
