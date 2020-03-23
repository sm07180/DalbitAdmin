<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="content">
    <div class="main-header">
        <h2>관리자 로그인 테스트</h2>
    </div>

    <div>
        <form class="form-horizontal" id="form">
            <label for="memId" class="control-label sr-only">ID</label>
            <input type="text" placeholder="ID" name="memId" id="memId" value="bgko">
            <label for="memPwd" class="control-label sr-only">Password</label>
            <input type="password" placeholder="Password" name="memPwd" id="memPwd" value="kbg5702!">
            <button type="button" class="btn" id="loginBtn">로그인</button>
        </form>
    </div>
    <div>
        <button type="button" class="btn" id="logoutBtn">로그아웃</button>
    </div>

    <button type="button" class="btn" id="callmanuBtn">메뉴불러오기</button>
    <iframe id="inforexMenu" width="100%" height="300"></iframe>
    <textarea type="textarea" class="form-control" id="txt_Menu" style="width: 100%;height: 300px"></textarea>

    <div>
        <li id="adminmenu">

        </li>
    </div>
</div>

<script type="text/javascript" src="/js/cookie.js"></script>
<%--<script type="text/javascript" src="/js/jquery.ajax-cross-origin.min.js"></script>--%>
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
    $('#callmanuBtn').on('click', function(e){
        callmanu();
    });

    $('#inforexMenu').load( function() {
        menu();
        menu2();
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
            return;
        }
        // ADMIN_COOKIE
        var ADMIN_COOKIE = "eJxLtDK3qi62MrNSSs0tiM%2FLV7IutjK1UjIyMDA0ArFNrJTyEnNTQUygmg1vd23ZeBzKKS1OLcpMgSpKSs8G6zW2UipOrQCxDK2UcsG0AZCRmlcan16UX1oAEjGyUjI2BzEsoTIllQWpUIvhigyB%2BotLEtPSgPoSU1KhJhooWdcCAJ9aN6c%3D";
        var USER_ID = data.userInfo.userid;
        var NAME = data.userInfo.name;
        var gSTAFF = "staff_pos=k0|staff_duty=fa|dept_no=4003|emp_no=20012|staff_grade=0|secure=2|div=4000|team=4003|in=t|userid=" + data.userInfo.userid + "|name=|sex= + " + data.userInfo.sex;

        var option = new Object();
        option.domain = ".inforex.co.kr";
        option.path = "/";

        config("ADMIN_COOKIE",ADMIN_COOKIE,option);
        config("USER_ID",USER_ID,option);
        config("NAME",NAME,option);
        config("gSTAFF",gSTAFF,option);

        // %B0%ED%BA%B4%B1%C7
        // %EA%B3%A0%EB%B3%91%EA%B6%8C


    }
    function logoutSuccess(dst_id, data){
        dalbitLog(data);
    }

    function loginFail(dst_id, data, textStatus, jqXHR){
        dalbitLog(data);
    }

    function menu(){
        var data = new Object();
        //data.url = "http://admin.inforex.co.kr/getCommonMenu.php";

        var option = {
            type : 'GET'
            , dataType : 'json'
        };
        util.getAjaxData("menu", "http://admin.inforex.co.kr/getCommonMenu.php", null, menuSuccess, menuFail, option);
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

    function generateAdminCookie(){

    }


</script>

<%--<li>
    <a href="#" class="js-sub-menu-toggle"><i class="fa fa-bars"></i>
        <span class="text">Menu Lvl 1 </span>
        <i class="toggle-icon fa fa-angle-left"></i>
    </a>
    <ul class="sub-menu"><li>
        <a href="#"><span class="text">Menu Lvl 2</span></a>
    </li></ul>
</li>--%>
