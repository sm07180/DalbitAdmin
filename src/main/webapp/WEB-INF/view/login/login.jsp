<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="cfn" uri="/WEB-INF/tld/comFunction.tld" %>

<div class="wrapper full-page-wrapper page-auth page-login text-center">
    <div class="inner-page">
        <div class="logo">
            <img src="https://image.dalbitcast.com/images/api/ic_logo_normal.png" alt="달빛라디오 관리자" />
        </div>

        <div class="login-box center-block">
            <h4 style="text-align: center">인포렉스 아이디로 로그인해주세요.</h4>
            <hr />
            <form class="form-horizontal" id="form">
                <p class="title">아이디</p>
                <div class="form-group">
                    <label for="memId" class="control-label sr-only">ID</label>
                    <div class="col-sm-12">
                        <div class="input-group">
                            <input class="form-control _loginInput" type="text" placeholder="아이디를 입력해주세요." name="memId" id="memId" value="bgko" autofocus>
                            <span class="input-group-addon"><i class="fa fa-user"></i></span>
                        </div>
                    </div>
                </div>
                <label for="memPwd" class="control-label sr-only">Password</label>
                <p class="title">비밀번호</p>
                <div class="form-group">
                    <div class="col-sm-12">
                        <div class="input-group">
                            <input class="form-control _loginInput" type="password" placeholder="비밀번호를 입력해주세요." name="memPwd" id="memPwd" value="kbg5702!">
                            <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                        </div>
                    </div>
                </div>
                <label class="fancy-checkbox">
                    <input type="checkbox">
                    <span>Remember me</span>
                </label>
                <button type="button" class="btn btn-custom-primary btn-lg btn-block btn-auth" id="loginBtn">
                    <i class="fa fa-arrow-circle-o-right"></i> Login
                </button>
            </form>
        </div>
    </div>
</div>

<script type="text/javascript" src="/js/cookie.js"></script>
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
            for(var i=0;i<data.data.loginCookieVo.length;i++){
                var cookie = data.data.loginCookieVo[i];
                var option = {
                    path : cookie.path
                    , domain : cookie.domain
                }
                var value = cookie.value;

                config(cookie.key, value, option);
            }

            callInforexMenuApi();

            //location.href = '/index.html';
        }else if(data.result == 'fail'){
            alert(data.message);
        }
    }

    function callInforexMenuApi(){
        var url = "${cfn:getProperty("inforex.api.menu.url")}";
        var data = new Object();
        data.url = url;

        var option = {
            type : 'GET'
            , dataType : 'json'
        };
        util.getAjaxData("menu", url, null, menuSuccess, null, option);
    }

    function loginFail(dst_id, data, textStatus, jqXHR){
        dalbitLog(dst_id, data, textStatus, jqXHR);
        alert(textStatus + "로그인 중 오류가 발생했습니다.");
    }

    function menuSuccess(dst_id, data){
        dalbitLog('menuSuccess');
        dalbitLog(data);

        var menuInfo = [];
        $.each(data, function(key, value){
            var menuId = Math.floor(Math.random() * 1000000000);
            //console.log('key:' + key + ' / ' + 'value:' + value);
            if(value == '[object Object]'){
                if(key != '인포렉스'){
                    menuInfo.push(new INFOREX_MENU(menuId, 1, key, null));
                }

                $.each(data[key], function(key2, value2){
                    if(value2 == '[object Object]'){

                        var menuId2 = Math.floor(Math.random() * 1000000000);

                        //console.log('2뎁스 object'+ key2 + "/" + value2);
                        menuInfo.push(new INFOREX_MENU(menuId2, 1, key2, null));
                        $.each(data[key][key2], function(key3, value3){
                            //비상연락망 default '콘텐츠사업부'로 세팅
                            if(value3 == 'http://admin.inforex.co.kr/mng_common/inforex/staff/unusualcall.html'){
                                value3 += '?wdivi=4000';
                            }

                            //자리배치도 default '서울'로 세팅
                            if(value3 == 'http://admin.inforex.co.kr/mng_common/board/company/board.html?brd_category=seatquarter'){
                                value3 += '&doc_no=320';
                            }
                            menuInfo.push(new INFOREX_MENU(menuId2, 2, key3, value3));
                        });

                    }else{
                        //console.log('2뎁스 추가' + key2 + "/" + value2);
                        menuInfo.push(new INFOREX_MENU(menuId, 2, key2, value2));
                    }
                });
            }
        });

        util.getAjaxData("menu", "/rest/main/inforex/menu", {data : JSON.stringify(menuInfo)}, menuSave);
    }

    function menuSave(dst_id, data){
        alert("로그인이 완료되었습니다.");
        location.href="/index.html";
    }
</script>