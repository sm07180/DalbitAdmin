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
                    <button type="button" id="bt_questMem" class="btn-sm">회원검색</button>
                </div>
            </div>
            <div class="col-md-3 no-padding">
                <div class="col-md-4 lb_style"><label>신고대상UserID</label></div>
                <div class="col-md-8">
                    <input type="text" class="form-control" id="txt_reportMem" style="width: 60%">
                    <button type="button" id="bt_reportMem" class="btn-sm">회원검색</button>
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
        <div class="row col-md-12 vertical-align">
            <div class="col-md-2 no-padding lb_style"> <label>문의 관련 메모</label> </div>
            <div class="col-md-10" style="height: 300px"><textarea id="question" style="width: 100%; height: 100%"></textarea></div>
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
    })


</script>
