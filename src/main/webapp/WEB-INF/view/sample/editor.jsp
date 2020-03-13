<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="content">
    <div class="main-header">
        <title>Text Editor | KingAdmin - Admin Dashboard</title>
    </div>

    <div class="main-content">
        <!-- WYSIWYG EDITOR -->
        <div class="widget">
            <div class="widget-header">
                <h3><i class="fa fa-edit"></i> WYSIWYG Text Editor</h3>
            </div>
            <div class="widget-content no-padding">
                <div class="summernote">Hello there,
                    <br/>
                    <p>The toolbar can be customized and it also supports various callbacks such as <code>oninit</code>, <code>onfocus</code>, <code>onpaste</code> and many more.</p>
                    <p>Please try <b>paste some texts</b> here</p>
                </div>
            </div>
            <div class="widget-footer">
                <button type="button" class="btn btn-primary" id="btnSaveEditor"><i class="fa fa-floppy-o"></i> Save</button>
            </div>
        </div>
            <!-- END WYSIWYG EDITOR -->
        <div class="widget">
            <div class="widget-header">
                <h3><i class="fa fa-user"></i> Text Editor View</h3>
            </div>
            <div class="viewer">
            </div>
        </div>

        <div class="widget">
            <div class="widget-header">
                <h3><i class="fa fa-user"></i> Text Editor Code</h3>
            </div>
            <textarea class="code" style="width: 100%; height: 300px" >
            </textarea>
        </div>
    </div>
    <!-- /main-content -->
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
                    util.fileUpdate("https://devphoto2.dalbitcast.com/upload",formData, function (data) {
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

        $("#btnSaveEditor").on("click", function () {
            console.log(targetEditor.summernote("code"))
            $(".viewer").empty().append(targetEditor.summernote("code"))
            $(".code").text(targetEditor.summernote("code"))
        })
    })

</script>