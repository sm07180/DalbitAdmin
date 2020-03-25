<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("utf-8"); %>

<div class="main-header">
    <h2>Inforx 메뉴 불러오기</h2>
</div>

<%--<div>--%>
    <%--<form class="form-horizontal" id="form">--%>
        <%--<label for="memId" class="control-label sr-only">ID</label>--%>
        <%--<input type="text" placeholder="ID" name="memId" id="memId" value="bgko">--%>
        <%--<label for="memPwd" class="control-label sr-only">Password</label>--%>
        <%--<input type="password" placeholder="Password" name="memPwd" id="memPwd" value="kbg5702!">--%>
        <%--<button type="button" class="btn" id="loginBtn">로그인</button>--%>
    <%--</form>--%>
<%--</div>--%>
<%--<div>--%>
    <%--<button type="button" class="btn" id="logoutBtn">로그아웃</button>--%>
<%--</div>--%>

<%--<button type="button" class="btn" id="callManuBtn">iframe 메뉴 불러오기</button>--%>
<button type="button" class="btn" id="ajaxManuBtn">ajax 메뉴 불러오기</button>
<%--<iframe id="inforexMenu" width="100%" height="300"></iframe>--%>
<textarea type="textarea" class="form-control" id="txt_Menu" style="width: 100%;height: 300px"></textarea>

<%--<div>--%>
    <%--<li id="adminmenu">--%>

    <%--</li>--%>
<%--</div>--%>
<xmp>
    Date: Tue, 24 Mar 2020 02:11:51 GMT
    Server: Apache
    Access-Control-Allow-Origin: *
    X-UA-Compatible: IE=EmulateIE9; requiresActiveX=true
    Set-Cookie: S_FASTCALL_END=y; path=/; domain=club5678.com
    Set-Cookie: ADMIN_COOKIE=deleted; expires=Mon, 25-Mar-2019 02:11:50 GMT; path=/; domain=.inforex.co.kr
    Set-Cookie: USER_ID=deleted; expires=Mon, 25-Mar-2019 02:11:50 GMT; path=/; domain=.inforex.co.kr
    Set-Cookie: NAME=deleted; expires=Mon, 25-Mar-2019 02:11:50 GMT; path=/; domain=.inforex.co.kr
    Set-Cookie: gSTAFF=deleted; expires=Mon, 25-Mar-2019 02:11:50 GMT; path=/; domain=.inforex.co.kr
    Content-Length: 136
    Keep-Alive: timeout=5, max=100
    Connection: Keep-Alive
    Content-Type: text/html



    <script>

        alert('�α��� ��å�� ����Ǿ����Ƿ� �ٽ� �α��� ���ּ���.')

        top.location.replace('/')
    </script>
</xmp>


<script type="text/javascript" src="/js/cookie.js"></script>
<script type="text/javascript">

    $('input[id="password"]').keydown(function() {
        if (event.keyCode === 13) {
            ajaxLogin();
        };
    });


    $('#loginBtn').on('click', function(e){
        ajaxLogin();
    });
    $('#logoutBtn').on('click', function(e){
        ajaxLogout();
    });
    $('#callManuBtn').on('click', function(e){
        callmanu();
        // menu();
    });

    $('#ajaxManuBtn').on('click', function(e){
        menu();
    });

    $('#inforexMenu').load( function() {

        menu2();
    });
    function ajaxLogin(){
        var data = new Object();
        data.userid = $("#memId").val();
        data.password = $("#memPwd").val();
        data.mode = "login";
        data.where = "dalbit";

        console.log(data);

        var option = {
            // dataType : 'jsonp'
        };

        util.getAjaxData("login", "http://admin.inforex.co.kr/loginout.html", data, loginSuccess, loginFail,option);
    }
    function ajaxLogout(){
        var option = new Object();
        option.domain = ".inforex.co.kr";
        option.path = "/";

        config("ADMIN_COOKIE","",option);
        config("USER_ID","",option);
        config("NAME","",option);
        config("gSTAFF","",option);
    }

    function loginSuccess(dst_id, data){
        dalbitLog(data);
        if(data.success == "n"){
            alert("로그인 중 오류가 발생했습니다." + data.reason);
            return;
        }
    }
    function logoutSuccess(dst_id, data){
        dalbitLog(data);
    }

    function loginFail(dst_id, data, textStatus, jqXHR){
        dalbitLog(data);
    }

    function menu(){
        var url = "http://admin.inforex.co.kr/getCommonMenu.php";
        var data = new Object();
        data.url = url;

        var option = {
            type : 'GET'
            , dataType : 'json'
        };
        // util.getAjaxData("menu", "/rest/sample/menu", data, menuSuccess, menuFail,option);

        util.getAjaxData("menu", url, null, menuSuccess, menuFail,option);
    }
    function menuSuccess(dst_id, data){
        dalbitLog('menuSuccess');
        dalbitLog(data);
        alert(data);
    }

    function menuFail(a, b, c){
        dalbitLog('menuFail');
        console.log(a);
        console.log(b);
        console.log(c);
    }

    function callmanu(){
        document.getElementById("inforexMenu").src = "http://admin.inforex.co.kr/getCommonMenu.php";
    }
    function menu2(){
        var content = "{\"\uad50\uc721\uc790\ub8cc\uc2e4\":{\"OJT \ubc0f \uc2e4\ubb34\uacfc\uc815\":\"http:\\/\\/admin.inforex.co.kr\\/mng_common\\/board\\/company\\/board.html?brd_category=eduojt\",\"\uaddc\uc815\":\"http:\\/\\/admin.inforex.co.kr\\/mng_common\\/board\\/company\\/board.html?brd_category=provision\",\"\uc11c\uc2dd\":\"http:\\/\\/admin.inforex.co.kr\\/mng_common\\/board\\/company\\/board.html?brd_category=format\",\"\uad00\ub828\ubc95\uaddc\":\"http:\\/\\/admin.inforex.co.kr\\/mng_common\\/board\\/company\\/board.html?brd_category=edulaw\",\"\uc131\ud76c\ub871\uc608\ubc29\":\"http:\\/\\/admin.inforex.co.kr\\/mng_common\\/board\\/company\\/board.html?brd_category=eduprevent\",\"\uad34\ub86d\ud798\uc608\ubc29\":\"http:\\/\\/admin.inforex.co.kr\\/mng_common\\/board\\/company\\/board.html?brd_category=eduharass\",\"\uc7a5\uc560\uc778\uc778\uc2dd\uac1c\uc120\":\"http:\\/\\/admin.inforex.co.kr\\/mng_common\\/board\\/company\\/board.html?brd_category=edudisabled\",\"\uc785\ud1f4\uc0ac\uc9c0\uce68\":\"http:\\/\\/admin.inforex.co.kr\\/mng_common\\/board\\/company\\/board.html?brd_category=eduemp\",\"\uc778\uc99d\uc11c\":\"http:\\/\\/admin.inforex.co.kr\\/mng_common\\/board\\/company\\/board.html?brd_category=educert\",\"IDC\uc13c\ud130\":\"http:\\/\\/admin.inforex.co.kr\\/mng_common\\/board\\/company\\/board.html?brd_category=eduidc\",\"\ud68c\uc0ac\uc18c\uac1c\":\"http:\\/\\/admin.inforex.co.kr\\/mng_common\\/board\\/company\\/board.html?brd_category=intrdctn\"},\"\uc778\ud3ec\ub809\uc2a4\":{\"\uc778\ud3ec\ub809\uc2a4\ud604\ud669\":{\"\uc9c1\uc6d0\ud604\ud669\":\"http:\\/\\/admin.inforex.co.kr\\/mng_common\\/inforex\\/staff\\/staff_list.html\",\"\uc870\uc9c1\ub3c4\":\"http:\\/\\/admin.inforex.co.kr\\/mng_common\\/inforex\\/organization_new\\/org_basic.html\",\"\uc778\uc0ac\ubc1c\ub839\":\"http:\\/\\/admin.inforex.co.kr\\/mng_common\\/board\\/company\\/board.html?brd_category=official_order\",\"\uc77c\uc815 \ubc0f \ud589\uc0ac\":\"http:\\/\\/admin.inforex.co.kr\\/mng_common\\/inforex\\/calendar\\/\",\"\uc790\ub9ac\ubc30\uce58\ub3c4\":\"http:\\/\\/admin.inforex.co.kr\\/mng_common\\/board\\/company\\/board.html?brd_category=seatquarter\",\"\uc77c\uc77c\uadfc\ud0dc\ud604\ud669\":\"http:\\/\\/admin.inforex.co.kr\\/mng_common\\/inforex\\/vacation\\/daily.html\",\"\ube44\uc0c1\uc5f0\ub77d\ub9dd\":\"http:\\/\\/admin.inforex.co.kr\\/mng_common\\/inforex\\/staff\\/unusualcall.html\",\"\ud14c\uc2a4\ud2b8\ud3f0 \ud604\ud669\":\"http:\\/\\/admin.inforex.co.kr\\/mng_common\\/inforex\\/staff\\/staff_test_phone_list.html\"},\"\ubb38\uc11c\uad00\ub9ac\":{\"\ubb38\uc11c\ub4f1\ub85d\ub300\uc7a5\":\"http:\\/\\/admin.inforex.co.kr\\/mng_common\\/board\\/company\\/board.html?brd_category=dmethod\",\"\ubb38\uc11c\ubc1c\uc1a1\ub300\uc7a5\":\"http:\\/\\/admin.inforex.co.kr\\/mng_common\\/board\\/company\\/board.html?brd_category=dsend\"},\"\uc9c1\uc6d0\uac8c\uc2dc\ud310\":{\"\ucd5c\uadfc\uac8c\uc2dc\ubb3c\":\"http:\\/\\/admin.inforex.co.kr\\/mng_common\\/board\\/company\\/board_list_new.html\",\"\uc9c1\uc6d0\uc219\uc9c0\uc0ac\ud56d\":\"http:\\/\\/admin.inforex.co.kr\\/mng_common\\/board\\/company\\/board.html?brd_category=company_board\",\"\uc81c\uc548 \ubc0f \uc544\uc774\ub514\uc5b4\":\"http:\\/\\/admin.inforex.co.kr\\/mng_common\\/board\\/company\\/board.html?brd_category=company_propose_idea\"},\"\uc0ac\uc6b0\ud68c\":{\"\uc0ac\uc6b0\ud68c \uac8c\uc2dc\ud310\":\"http:\\/\\/admin.inforex.co.kr\\/mng_common\\/board\\/company\\/board.html?brd_category=company_life\"},\"\uc5f0\ucc28\ud734\uac00\":{\"\ud734\uac00\uc0ac\uc6a9\uc2e4\uc801\":\"http:\\/\\/admin.inforex.co.kr\\/mng_common\\/inforex\\/vacation\\/divi.html\",\"\ud734\uac00\uc0ac\uc6a9\uae30\uc900\":\"http:\\/\\/admin.inforex.co.kr\\/mng_common\\/inforex\\/vacation\\/guide.html\"},\"\uc77c\uc77c\uc5c5\ubb34\":{\"\ucf58\ud150\uce20\uc0ac\uc5c5\ubd80 \uae30\ud68d\ud300\":\"http:\\/\\/admin.inforex.co.kr\\/mng_common\\/board\\/company\\/board.html?brd_category=work_cont_strategy\",\"\ucf58\ud150\uce20\uc0ac\uc5c5\ubd80 \uac1c\ubc1c\ud300\":\"http:\\/\\/admin.inforex.co.kr\\/mng_common\\/board\\/company\\/board.html?brd_category=work_cont_dev\",\"\ucf58\ud150\uce20\uc0ac\uc5c5\ubd80 \ub514\uc790\uc778\ud300\":\"http:\\/\\/admin.inforex.co.kr\\/mng_common\\/board\\/company\\/board.html?brd_category=work_cont_design\"}}}";
        content = JSON.parse(content);
        content = JSON.stringify(content);
        content = content.replace(/\\/gi,"").replace(/","/gi,"\n").replace(/:{/gi,"\n").replace(/},/gi,"\n").replace(/{/gi,"").replace(/}/gi,"").replace(/"/gi,"");    // decode
        console.log(content);
        $('#txt_Menu').html(content);
        var tmp = content.split("\n");
        var tmp_append = "";
        var tmp2;
        for(var i=0;i<tmp.length; i++){
            if(tmp[i].indexOf(":") < 1){
                if(tmp[i]!="인포렉스"){
                    tmp_append = '<a href="#" class="js-sub-menu-toggle"><i class="fa fa-bars"></i>' +
                                '<span class="text"> ' +tmp[i]+ '</span>' +
                            '<i class="toggle-icon fa fa-angle-left"></i><a>'
                }
            }else{
                tmp[i] = tmp[i].replace(":h"," : h");
                tmp2 = tmp[i].split(" : ");
                tmp_append = '<ul class="sub-menu"><li>'
                tmp_append = tmp_append + '<a href=' +"#"+ tmp2[1] + '"><span class="text"> ' + tmp2[0]  + ' </span></a>'
                tmp_append = tmp_append + '</li></ul>';
            }
            $('#adminmenu').append(tmp_append);
        }
    }
</script>