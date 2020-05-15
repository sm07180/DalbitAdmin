/* 화면 로딩 시 검색박스 안에 dummy를 넣어서 검색어에 엔터 누를 시 submit을 방지한다. */
$(function(){
    $("#searchForm").append('<input type="text" id="dummy" style="display:none;" />');
});

/*이벤트 바인딩*/
$(document).on('click', '._openPop', function(){
    util.windowOpen($(this).data());
});

/*회원정보보기 팝업*/
$(document).on('click', '._openMemberPop', function(){
    var url = "/member/member/popup/memberPopup?memNo="+encodeURIComponent($(this).data('memno'));
    util.windowOpen(url, 1500, 850, 'memberInfo');
});

/*방송정보보기 팝업*/
$(document).on('click', '._openBroadcastPop', function(){
    var url = "/broadcast/broadcast/popup/broadcastPopup?roomNo="+encodeURIComponent($(this).data('roomno'));
    util.windowOpen(url, 1500, 800, 'broadcastInfo');
});

/*방송방메시지보내기 팝업*/
$(document).on('click', '._openAdminMessagePop', function(){
    var url = "/broadcast/broadcast/popup/messagePopup?roomNo="+encodeURIComponent($(this).data('roomno'))+"&djmemno=" + encodeURIComponent($(this).data('djmemno'));
    util.windowOpen(url, 800, 370, 'adminMessageInfo');
});

/*방송방플레이어 팝업*/
$(document).on('click', '._openPlayerPop', function(){
    var url = "/broadcast/broadcast/popup/playerPopup?roomNo="+encodeURIComponent($(this).data('roomno'));
    util.windowOpen(url, 560, 880, 'roomPlayer');
});

$(document).on('click', 'img._imageFullPop', function(){
    $("#_imgFullLayer").html(util.imageFullSize("_imgFullLayer_modal", $(this).attr('src')));
    $('#_imgFullLayer_modal').modal('show');
});

$(document).on('focusout', '._trim', function(){
    var a = $(this).val().replace(/ /gi, '');
    $(this).val(a);
});