<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--<div class="row">
    <div class="col-md-4 col-md-offset-4">
        <div class="login-panel panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">Please Sign In</h3>
            </div>
            <div class="panel-body">
                <form id="form">
                    <fieldset>
                        <div class="form-group">
                            <input class="form-control" placeholder="ID" name="memId" type="memId" value="010-1234-0006" autofocus>
                        </div>
                        <div class="form-group">
                            <input class="form-control" placeholder="Password" name="memPwd" type="memPwd" value="1234">
                        </div>
                        <div class="checkbox">
                            <label>
                                <input name="remember" type="checkbox" value="Remember Me">Remember Me
                            </label>
                        </div>
                        <!-- Change this to a button or input when using this as a form -->
                        <a href="javascrript://" id="loginBtn" class="btn btn-lg btn-success btn-block">Login</a>
                    </fieldset>
                </form>
            </div>
        </div>
    </div>
</div>--%>

<div class="wrapper full-page-wrapper page-auth page-login text-center">
    <div class="inner-page">
        <div class="logo">
            <a href="index.html"><img src="assets/img/kingadmin-logo.png" alt="" /></a>
        </div>

        <div class="login-box center-block">
            <form class="form-horizontal" id="form">
                <p class="title">Use your username</p>
                <div class="form-group">
                    <label for="memId" class="control-label sr-only">ID</label>
                    <div class="col-sm-12">
                        <div class="input-group">
                            <input class="form-control" type="text" placeholder="ID" name="memId" id="memId" value="010-1234-0006" autofocus>
                            <span class="input-group-addon"><i class="fa fa-user"></i></span>
                        </div>
                    </div>
                </div>
                <label for="memPwd" class="control-label sr-only">Password</label>
                <div class="form-group">
                    <div class="col-sm-12">
                        <div class="input-group">
                            <input class="form-control" type="password" placeholder="Password" name="memPwd" id="memPwd" value="1234">
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

           <%-- <div class="links">
                <p><a href="#">Forgot Username or Password?</a></p>
                <p><a href="#">Create New Account</a></p>
            </div>--%>
        </div>
    </div>
</div>

<script type="text/javascript">
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
