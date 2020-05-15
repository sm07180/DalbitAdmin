<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<script src="https://webrtc.github.io/adapter/adapter-latest.js"></script>--%>
<script src="/js/webrtc_adaptor.js"></script>
<%
    Object in_BroadInfo = request.getAttribute("BroadInfo");
    String in_roomNo = request.getParameter("roomNo");
%>

<style>
    .player {
        text-align: center;
    }

    .player input[type="text"]{
        width: 400px;
    }

    .liveChat {
        font-family: 'NanumSquare', sans-serif;
    }

    .liveChat p {
        color: rgb(255, 255, 255);
        font-size: 12px;
        font-weight: 600;
        letter-spacing: -0.3px;
        transform: skew(-0.03deg);
    }

    .liveChat p b.dj {
        background: rgb(133, 86, 246);
        color: rgb(255, 255, 255);
    }

    .liveChat p b.manager {
        background: rgb(254, 172, 44);
        color: rgb(255, 255, 255);
    }

    .liveChat .date{
        display: inline;
        padding-bottom: 9px;
        margin-bottom: 10px;
        font-size: 3px;
    }

    .liveChat pre {
        display: inline-block;
        color: rgb(255, 255, 255);
        font-size: 12px;
        font-weight: 600;
        line-height: 18px;
        white-space: pre-wrap;
        overflow-wrap: break-word;
        word-break: break-word;
        letter-spacing: -0.35px;
        transform: skew(-0.03deg);
        padding: 9px 14px;
        border-radius: 10px;
        border-width: 0px;
        background: rgba(0, 0, 0, 0.3);
        font-family: 'NanumSquare', sans-serif;
    }

    .liveChat p b {
         display: inline-block;
         margin-right: 5px;
         font-size: 10px;
         padding: 2px 6px;
         border-radius: 20px;
     }

    .liveChat p {
        color: rgb(255, 255, 255);
    }

</style>

<div class="container player">
    <div class="header clearfix">
        <h3 class="text-muted" id="title"></h3>
    </div>
    <div>
        <p>
            <audio id="remoteVideo" autoplay="autoplay" controls="controls"></audio>
        </p>
        <p>
            <input type="text" class="form-control" value="" id="roomNo" placeholder="Room No">
            <input type="text" class="form-control" value="" id="streamId" placeholder="Type stream ID">
            <input type="text" class="form-control" value="" id="tokenId" placeholder="Type token ID">
        </p>
        <p>
            <button onclick="joinRoom()" class="btn btn-info" id="joinRoom">RoomJoin</button>
            <button onclick="loadChat()" class="btn btn-info" id="callChat">Chat</button>
            <button onclick="play()" class="btn btn-info" id="play">Play</button>
        </p>
    </div>
    <div class="liveChat__bgImg" style="overflow:auto; width:500px; height:800px; position: relative; background-size: contain; padding: 10px;">
        <div class="liveChat__chat" id="liveChat__chat" style="position: absolute; z-index: 2;">
            <div class="liveChat comment ">
                <figure></figure>
                <div>
                        <p><b class="dj">DJ</b>동동이임돠</p>
                        <pre>가나다라마바사?</pre>
                </div>
            </div>
            <div class="liveChat comment ">
                <figure></figure>
                <div>
                    <p><b class="dj">DJ</b>동동이임돠</p>
                    <pre>r</pre>
                </div>
            </div>
            <div class="liveChat comment ">
                <figure></figure>
                <div>
                    <p><b class="manager">매니저</b>동동이임돠</p>
                    <pre>r</pre>
                    <p class="date">2020.05.13 13:40:33</p>
                </div>
            </div>
            <div class="liveChat comment ">
                <figure></figure>
                <div>
                    <p><b class="dj">DJ</b>동동이임돠</p>
                    <pre>r</pre>
                </div>
            </div>
        </div>
    </div>
</div>


<script>
    var pc_config = null;

    var sdpConstraints = {
        OfferToReceiveAudio : true,
        OfferToReceiveVideo : true

    };
    var mediaConstraints = {
        video : false,
        audio : false
    };

    var websocketURL = ANT_SERVER_URL + "/" + ANT_APP_NAME + "/websocket";

    if (websocketURL.startsWith("https")) {
        websocketURL = websocketURL.replace("https:", "wss:");
    }else{
        websocketURL = websocketURL.replace("http:", "ws:");
    }

    var webRTCAdaptor = new WebRTCAdaptor({
        websocket_url : websocketURL,
        mediaConstraints : mediaConstraints,
        peerconnection_config : pc_config,
        sdp_constraints : sdpConstraints,
        remoteVideoId : "remoteVideo",
        isPlayMode: true,
        debug: true,
        callback : function(info, description) {
            if (info == "initialized") {
                console.log("initialized");
            } else if (info == "play_started") {
                //joined the stream
                console.log("play started");
                isReloadChat = true;
                loadChat();
            } else if (info == "play_finished") {
                //leaved the stream
                console.log("play finished");
                alert("방송이 종료되었습니다.");
            }
            else if (info == "closed") {
                if (typeof description != "undefined") {
                    console.log("Connecton closed: " + JSON.stringify(description));
                }
            }
        },
        callbackError : function(error) {
            //some of the possible errors, NotFoundError, SecurityError,PermissionDeniedError
            console.log("error callback: " + JSON.stringify(error));
            alert(JSON.stringify(error));
        }
    });

    var broadInfo = <%=in_BroadInfo%>;
    var roomNo = "<%=in_roomNo%>";

    var streamId = broadInfo.bjStreamId;
    var tokenId = broadInfo.bjPlayToken;
    var lastChatIdx = 0;
    var isReloadChat = false;

    $(window).load(function(){
        console.log("load");
        console.log(broadInfo);

        if(common.isEmpty(broadInfo)){
            alert("방송이 종료되었습니다.");
            return;
        }

        $("#title").html(broadInfo.title);
        $("#streamId").val(streamId);
        $("#tokenId").val(tokenId);
        console.log(IMAGE_SERVER_URL + broadInfo.roomBgImg);
        $(".liveChat__bgImg").css("background-image", "url("+IMAGE_SERVER_URL + broadInfo.roomBgImg+")");


        setTimeout(function(){
            $("#play").click()
        },1000)
    })



    /**
     * TEST용
     * room 연결
     * */
    function joinRoom(){
        var roomNo = $("#roomNo").val();

        if (common.isEmpty(roomNo)){
            var streamId = $("#streamId").val();
            var tokenId = $("#tokenId").val();
            console.log(streamId + "/" + tokenId);
            webRTCAdaptor.play(streamId, tokenId);
        }else{
            window.location.search = "?roomNo="+roomNo;
        }
    }



    /**
     * player 연결
     * */
    function play(){
        webRTCAdaptor.play("549871316289693942766656", "289455789173375822465282");
        webRTCAdaptor.play(streamId, tokenId);
    }



    /**
     * 채팅내용 호출
    * */
    function loadChat(){
        console.log("[loadChat]");
        var data = {
            "room_no" : roomNo
            ,"chatIdx" : lastChatIdx
        }

        util.getAjaxData("upldate", "/rest/broadcast/broadcast/chat", data, fn_chat_load_success);
    }

    function fn_chat_load_success(dst_id, response, dst_params){
        console.log(response);
        isReloadChat = true;

        if(response.result != "fail" && !common.isEmpty(response.data) && !response.data.length <= 0){
            lastChatIdx = response.data[response.data.length -1 ].chatIdx;

            var template = $('#tmp_liveChat').html();
            var templateScript = Handlebars.compile(template);
            var context = response.data;
            var html=templateScript(context);


            $(".liveChat__chat").append(html);
            $(".liveChat__bgImg").scrollTop($(".liveChat__bgImg")[0].scrollHeight);
        }else{

        }

        // 5초마다 재호출
        setTimeout(function(){
            if(isReloadChat){
                loadChat();
            }
        },5000)
    }



</script>

<script type="text/x-handlebars-template" id="tmp_liveChat">
    {{#each this as |data|}}
        <div class="liveChat comment ">
            <figure></figure>
            <div>
                <p>
                    {{#dalbit_if auth "==" "3"}}<b class="dj">DJ</b>{{/dalbit_if}}
                    {{#dalbit_if auth "==" "1"}}<b class="manager">매니저</b>{{/dalbit_if}}
                    {{this.nickname}}
                </p>
                <pre>{{this.msg}}</pre>
                <p class="date">{{this.writeDateFormat}}</p>
            </div>
        </div>
    {{/each}}

</script>