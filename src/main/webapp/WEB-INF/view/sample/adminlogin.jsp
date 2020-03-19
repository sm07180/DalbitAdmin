<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="content">
    <div class="main-header">
        <h2>관리자 로그인 테스트</h2>
    </div>

    <form class="form-horizontal" id="form">
        <label for="memId" class="control-label sr-only">ID</label>
        <input type="text" placeholder="ID" name="memId" id="memId">
        <label for="memPwd" class="control-label sr-only">Password</label>
        <input type="password" placeholder="Password" name="memPwd" id="memPwd">
        <button type="button" class="btn" id="loginBtn">로그인</button>
    </form>

</div>


<script type="text/javascript">
    $('#loginBtn').on('click', function(e){
        ajaxLogin();
    });
    function ajaxLogin(){
        var data = new Object();
        data.userid = $("#memId").val();
        data.password = $("#memPwd").val();
        data.mode = "login";
        data.where = "dalbit";

        console.log(data);

        util.getAjaxData("login", "http://admin.inforex.co.kr/loginout.html", data, loginSuccess, loginFail);
    }

    function loginSuccess(dst_id, data){
        console.log("@@@@@@@@@@@@");
        dalbitLog(dst_id, data);
        console.log("@@@@@@@@@@@@");
    }

    function loginFail(dst_id, data, textStatus, jqXHR){
        dalbitLog(dst_id, data, textStatus, jqXHR);
        alert(textStatus + "로그인 중 오류가 발생했습니다.");
    }
</script>