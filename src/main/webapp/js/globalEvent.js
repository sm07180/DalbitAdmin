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
    var url = "/member/member/popup/memberPopup?memNo="+$(this).data('memno');
    util.windowOpen(url, 1500, 800, 'memberInfo');
});

/*방송정보보기 팝업*/
$(document).on('click', '._openBroadcastPop', function(){
    var url = "/broadcast/broadcast/popup/broadcastPopup?roomNo="+$(this).data('roomno')+"&state="+$(this).data('state');
    util.windowOpen(url, 1500, 800, 'broadcastInfo');
});