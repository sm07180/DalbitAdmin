<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    Object in_clip_path = request.getParameter("clipPath");
    Object in_clip_no = request.getParameter("clipNo");
%>

<div class="pt10">
    <div class="tab-content">
        <div class="col-md-12 no-padding">
            <span id="memNick" class="font-bold" style="color: #1f3b73;font-size: 16px;"></span>
        </div>
        <div class="row col-md-12">
            <audio class="clipPlayer" id="clipPlayer" onended="playEnd()" onplay="ClipPlay()" onpause="ClipPause()" controls="controls" autoplay="autoplay"><source src=""></audio>
        </div>
    </div>
</div>

<script>
    var clipPath = "<%=in_clip_path%>";
    var clipNo = "<%=in_clip_no%>";

    $(document).ready(function(){
        init();
    });

    window.onbeforeunload = playEnd;
    opener.clipPlayer = this;

    function init(){
        $(".clipPlayer").find("source").prop("src", PHOTO_SERVER_URL + clipPath);
        document.getElementById("clipPlayer").play();
    }

    function ClipPlay(){
        console.log("[play] : " + clipNo);
        var obj = $(opener.document).find("#play_" + clipNo);
        obj.find("i").removeClass("fa-play");
        obj.find("i").addClass("fa-pause");
        document.getElementById("clipPlayer").play();
    }

    function ClipPause(){
        console.log("[Pause] : " + clipNo);
        var obj = $(opener.document).find("#play_" + clipNo);
        obj.find("i").removeClass("fa-pause");
        obj.find("i").addClass("fa-play");
        document.getElementById("clipPlayer").pause();
    }

    function playEnd(){
        console.log("[playEnd] : " + clipNo);
        var obj = $(opener.document).find("#play_" + clipNo);
        obj.find("i").removeClass("fa-pause");
        obj.find("i").addClass("fa-play");
    }

</script>


