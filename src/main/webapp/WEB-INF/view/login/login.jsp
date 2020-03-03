<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="wrapper full-page-wrapper page-auth page-login text-center">
    <div class="inner-page">
        <div class="logo">
            <a href="index.html"><img src="https://devimage.dalbitcast.com/images/api/ic_logo_normal.png" alt="달빛라디오 관리자" /></a>
        </div>

        <div class="login-box center-block">
            <form class="form-horizontal" id="form">
                <p class="title">Use your username</p>
                <div class="form-group">
                    <label for="memId" class="control-label sr-only">ID</label>
                    <div class="col-sm-12">
                        <div class="input-group">
                            <input class="form-control" type="text" placeholder="ID" name="memId" id="memId" value="01055606434" autofocus>
                            <span class="input-group-addon"><i class="fa fa-user"></i></span>
                        </div>
                    </div>
                </div>
                <label for="memPwd" class="control-label sr-only">Password</label>
                <div class="form-group">
                    <div class="col-sm-12">
                        <div class="input-group">
                            <input class="form-control" type="password" placeholder="Password" name="memPwd" id="memPwd" value="123qweasd">
                            <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                        </div>
                    </div>
                </div>
                <label class="fancy-checkbox">
                    <input type="checkbox">
                    <span>Remember me next time</span>
                </label>
                <button type="button" class="btn btn-custom-primary btn-lg btn-block btn-auth" id="loginBtn">
                    <i class="fa fa-arrow-circle-o-right"></i> Login
                </button>
            </form>
        </div>
    </div>
</div>

<script type="text/javascript">
    ajaxLogin();
    $('#loginBtn').on('click', function(e){
        ajaxLogin();
    });

    function ajaxLogin(){
        getAjaxData("login", "/login/authenticate", $("#form").serialize(), loginSuccess, loginFail);
    }

    function loginSuccess(dst_id, data){
        dalbitLog(dst_id, data);

        if(data.result == 'success'){
            alert(data.message);
            if(data.data.returnUrl != undefined){
                location.href = data.data.returnUrl;
            }
        }else if(data.result == 'fail'){
            alert(data.message);
        }
    }

    function loginFail(dst_id, data, textStatus, jqXHR){
        dalbitLog(dst_id, data, textStatus, jqXHR);
        alert(textStatus + "로그인 중 오류가 발생했습니다.");
    }
</script>