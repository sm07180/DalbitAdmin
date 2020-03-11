<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Excel</title>
</head>
<body>
    <div>
            <button type="button" id="loading-example-btn" data-loading-text="DownLoading..." class="btn btn-primary">로딩 버튼 테스트</button>
            <button type="button" id="excelDownLoad" data-loading-text="DownLoading..." class="btn btn-primary" >회원 엑셀다운 TEST</button>
            <a href="/excel/download"><button type="button" data-loading-text="DownLoading..." class="btn btn-primary"> GET 엑셀다운 TEST</button></a>
    </div>

    <script>
        $(document).ready(function() {
            $('#loading-example-btn').click( function() {
                var btn = $(this);

                // btn.button('loading');
                changeLoadingBtn(btn, 'loading');

                setTimeout( function() {
                    // btn.button('reset');
                    changeLoadingBtn(btn, 'reset');
                }, 1000 );
            });


            $("#excelDownLoad").click(function(){
                var formElement = document.querySelector("form");
                var formData = new FormData(formElement);
                formData.append("test001", "test001");
                formData.append("test002", 1234);
                formData.append("test003", "test003");

                excelDownload($(this), "/excel/member", formData, fn_success_excel, fn_fail_excel)
            })
        });


        function fn_success_excel(){
            alert("fn_success_excel");
        }

        function fn_fail_excel(){
            alert("fn_fail_excel");
        }
    </script>
</body>
</html>