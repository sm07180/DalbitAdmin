<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="cfn" uri="/WEB-INF/tld/comFunction.tld" %>
<c:set var="dummyData"><%= java.lang.Math.round(java.lang.Math.random() * 1000000) %></c:set>

<div class="wrapper full-page-wrapper page-auth page-login text-center">
    <div class="inner-page">
        <div class="logo">
            <img src="https://image.dalbitlive.com/images/api/logo_real.png" alt="달빛라이브 관리자" />
        </div>

        <div class="login-box center-block">
            <h4 style="text-align: center">여보야 아이디로 로그인해주세요.</h4>
            <hr />
            <form class="form-horizontal" id="form">
                <p class="title">아이디</p>
                <div class="form-group">
                    <label for="memId" class="control-label sr-only">ID</label>
                    <div class="col-sm-12">
                        <div class="input-group">
                            <input class="form-control _loginInput" type="text" placeholder="아이디를 입력해주세요." name="memId" id="memId" value="" autofocus>
                            <span class="input-group-addon"><i class="fa fa-user"></i></span>
                        </div>
                    </div>
                </div>
                <label for="memPwd" class="control-label sr-only">Password</label>
                <p class="title">비밀번호</p>
                <div class="form-group">
                    <div class="col-sm-12">
                        <div class="input-group">
                            <input class="form-control _loginInput" type="password" placeholder="비밀번호를 입력해주세요." name="memPwd" id="memPwd" value="">
                            <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                        </div>
                    </div>
                </div>
                <%--<label class="fancy-checkbox">
                    <label for="remember-me-new">
                        <input type="checkbox" name="remember-me-new" id="remember-me-new" value="true" />
                        <span>Remember me</span>
                    </label>
                </label>--%>
                <button type="button" class="btn btn-custom-primary btn-lg btn-block btn-auth" id="loginBtn">
                    <i class="fa fa-arrow-circle-o-right"></i> Login
                </button>
            </form>
        </div>
    </div>
</div>

<script type="text/javascript" src="/js/cookie.js?${dummyData}"></script>
<script type="text/javascript" src="/js/inforexApi.js?${dummyData}"></script>
<script type="text/javascript">
    $('#loginBtn').on('click', function(e){
        ajaxLogin();
    });

    $('._loginInput').on('keydown', function(e){
        if(e.keyCode == '13'){
            ajaxLogin();
        }
    });

    function ajaxLogin(){
        var memId = $("#memId");
        if(common.isEmpty(memId.val())){
            alert('아이디를 입력해주세요.');
            memId.focus();
            return false;
        }

        var memPwd = $("#memPwd");
        if(common.isEmpty(memPwd.val())){
            alert('비밀번호를 입력해주세요.');
            memPwd.focus();
            return false;
        }

        util.getAjaxData("login", "/login/authenticate", $("#form").serialize(), loginSuccess, loginFail);
    }

    function loginSuccess(dst_id, data){
        dalbitLog(dst_id, data);
        if(data.result == 'success'){

            try{
                for(var i=0;i<data.data.loginCookieVo.length;i++){
                    var cookie = data.data.loginCookieVo[i];
                    var option = {
                        path : cookie.path
                        , domain : cookie.domain
                    }
                    var value = cookie.value;

                    config(cookie.key, value, option);
                }

                inforexApi.callInforexMenuApi();
            }catch (e) {
                alert('인포렉스 메뉴 가져오기 실패.');
                location.href = '/index.html';
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