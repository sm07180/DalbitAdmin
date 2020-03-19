<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="content">
    <div class="main-header">
        <h2>관리자 로그인 테스트</h2>
    </div>

    <div>
        <form class="form-horizontal" id="form">
            <label for="memId" class="control-label sr-only">ID</label>
            <input type="text" placeholder="ID" name="memId" id="memId">
            <label for="memPwd" class="control-label sr-only">Password</label>
            <input type="password" placeholder="Password" name="memPwd" id="memPwd">
            <button type="button" class="btn" id="loginBtn">로그인</button>
        </form>
    </div>
    <div>
        <button type="button" class="btn" id="logoutBtn">로그아웃</button>
    </div>

    <li class=active>
        <a href="javascript://" class="js-sub-menu-toggle">
            <i class="toggle-icon fa fa-angle-down"/>
        </a>
        <ul class="sub-menu" style="display:block;">
            <li>
                <iframe width="100%" height="300" src="http://admin.inforex.co.kr/menu.php">
                </iframe>
            </li>
        </ul>
    </li>
</div>


<script type="text/javascript">
    $('#loginBtn').on('click', function(e){
        ajaxLogin();
    });
    $('#logoutBtn').on('click', function(e){
        ajaxLogout();
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
    function ajaxLogout(){
        var data = new Object();
        data.mode = "logout";
        data.where = "dalbit";

        util.getAjaxData("login", "http://admin.inforex.co.kr/loginout.html", data, logoutSuccess, loginFail);
    }

    function loginSuccess(dst_id, data){
        dalbitLog(data);
        if(data.success == "n"){
            alert("로그인 중 오류가 발생했습니다." + data.reason);
        }
    }
    function logoutSuccess(dst_id, data){
        dalbitLog(data);
    }

    function loginFail(dst_id, data, textStatus, jqXHR){
        dalbitLog(data);
    }
</script>