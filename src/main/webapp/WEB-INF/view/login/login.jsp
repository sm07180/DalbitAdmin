<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row">
    <div class="col-md-4 col-md-offset-4">
        <div class="login-panel panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">Please Sign In</h3>
            </div>
            <div class="panel-body">
                <form id="form">
                    <fieldset>
                        <div class="form-group">
                            <input class="form-control" placeholder="아이디" name="memId" type="memId" value="010-1234-0006" autofocus>
                        </div>
                        <div class="form-group">
                            <input class="form-control" placeholder="비밀번호" name="memPwd" type="memPwd" value="1234">
                        </div>
                        <div class="checkbox">
                            <label>
                                <input name="remember" type="checkbox" value="Remember Me">Remember Me
                            </label>
                        </div>
                        <!-- Change this to a button or input when using this as a form -->
                        <a href="javascript://" id="loginBtn" class="btn btn-lg btn-success btn-block">Login</a>
                    </fieldset>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-md-4 col-md-offset-4">
        <div class="login-panel panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">Please Sign In</h3>
            </div>
            <div class="panel-body">
                <form role="form">
                    <fieldset>
                        <div class="form-group">
                            <input class="form-control" placeholder="E-mail" name="email" type="email" autofocus>
                        </div>
                        <div class="form-group">
                            <input class="form-control" placeholder="Password" name="password" type="password" value="">
                        </div>
                        <div class="checkbox">
                            <label>
                                <input name="remember" type="checkbox" value="Remember Me">Remember Me
                            </label>
                        </div>
                        <!-- Change this to a button or input when using this as a form -->
                        <a href="index.html" class="btn btn-lg btn-success btn-block">Login</a>
                    </fieldset>
                </form>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    $('#loginBtn').on('click', function(e){
        ajaxLogin();
    });

    function ajaxLogin(){
        $.ajax({
            type: "POST",
            url: "/login/authenticate",
            dataType: "json",
            data: $("#form").serialize(),
            success: function (response) {
                console.log(response);
                if(response.result == 'success'){    //로그인성공
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
