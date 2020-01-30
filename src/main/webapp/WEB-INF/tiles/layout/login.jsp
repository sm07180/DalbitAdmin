<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>달빛라디오 관리자 - 로그인</title>

<!-- Bootstrap Core CSS -->
<link href="/template/css/bootstrap.min.css" rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="/template/css/metisMenu.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="/template/css/startmin.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="/template/css/font-awesome.min.css" rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
</head>
<body>
<div class="container">
    login.jsp
    <tiles:insertAttribute name="body" />
</div>
</div>
</div>
</div>
</form>
</div>

<!-- jQuery -->
<script src="/template/js/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="/template/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="/template/js/metisMenu.min.js"></script>

<!-- Custom Theme JavaScript -->
<script src="/template/js/startmin.js"></script>
<script type="text/javascript">
$('#loginBtn').on('click', function(){
ajaxLogin();
});

function ajaxLogin(){
$.ajax({
type: "POST",
url: "/login/authenticate",
dataType: "json",
data: $("#loginFrm").serialize(),
success: function (response) {
console.log(response);
if(response.result == 'success'){ //로그인성공
alert(response.message);
if(response.data.returnUrl != undefined){
location.href = response.data.returnUrl;
}
}else if(response.result == 'fail'){
alert(response.message);
}
}, error: function (xhr, textStatus) {
alert(xhr.status + "로그인 중 오류가 발생했습니다.");
}
});
}
</script>
</body>
</html>
