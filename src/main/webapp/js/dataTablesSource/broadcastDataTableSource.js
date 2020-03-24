var BroadcastDataTableSource = {
    'liveList': {
        'url': '/rest/broadcast/live/list'
        , 'columns': [
            {'title': 'roomNo', 'data': 'roomNo' , 'visible' : false},
            {'title': 'state', 'data': 'state', 'visible' : false},
            {'title': '방송주제', 'data': 'type', 'defaultContent': ''},
            {'title': '방송제목', 'data': 'title', 'render': function (data, type, row, meta) {
                    return util.roomNoLink(data, row.roomNo, row.state);
                }},
            {'title': '프로필이미지', 'data': 'imageProfile', 'defaultContent': '', 'render' : function(data, type, row, meta){
                    return '<img src="'+ IMAGE_SERVER_URL + data+'" width="100px" height="100px" />';
                }},
            {'title': '테그부분', 'data': 'tag', 'render': function (data) {
                    if(data == "ALL"){
                        return '<span class ="label" style="background-color:#d9534f">' + "추천" + '</span><br/>' +
                                '<span class ="label" style="background-color:#3761d9">' + "인기" + '</span><br/>' +
                                '<span class ="label" style="background-color:#d9c811">' + "신입" + '</span>';
                    }else if(data == "repo"){
                        return '<span class ="label" style="background-color:#d9534f">' + "추천" + '</span><br/>' +
                                '<span class ="label" style="background-color:#3761d9">' + "인기" + '</span>';
                    }else if(data == "rene"){
                        return '<span class ="label" style="background-color:#d9534f">' + "추천" + '</span><br/>' +
                                '<span class ="label" style="background-color:#d9c811">' + "신입" + '</span>';
                    }else if(data == "pone"){
                        return '<span class ="label"  style="background-color:#3761d9">' + "인기" + '</span><br/>' +
                                '<span class ="label" style="background-color:#d9c811">' + "신입" + '</span>';
                    }else if(data == "re"){
                        return '<span class ="label" style="background-color:#d9534f">' + "추천" + '</span>';
                    }else if(data == "po"){
                        return '<span class ="label" style="background-color:#3761d9">' + "인기" + '</span>';
                    }else{
                        return '<span class ="label" style="background-color:#d9c811">' + "신입" + '</span>';
                    }
                }},
            {'title': 'User ID', 'data': 'memId', 'width':'100px', 'render': function (data, type, row, meta) {
                    return util.memNoLink(data, row.memNo);
                }},
            {'title': 'User 닉네임', 'data': 'memNick', 'defaultContent': ''},
            {'title': '청취자', 'data': '', 'defaultContent': ''},
            {'title': '선물', 'data': '', 'defaultContent': ''},
            {'title': '좋아요', 'data': '', 'defaultContent': ''},
            {'title': '부스터', 'data': '', 'defaultContent': ''},
            {'title': '팬 수', 'data': '', 'defaultContent': ''},
        ]
        , 'comments' : 'ㆍ실시간 생방송 시작된 방송이 최상위 누적되어 보여집니다.<br/>ㆍDJ가 방송을 완료한 경우 해당 방송은 리스트에서 삭제됩니다.'
    },

    'broadcastList': {
        'url': '/rest/broadcast/broadcast/list'
        , 'columns': [
            {'title': '방송주제', 'data': 'subjectType', 'defaultContent': ''},
            {'title': '방송제목', 'data': 'title', 'render': function (data, type, row, meta) {
                    return '<a href="javascript://" class="getBroadCast_info" onclick="javascript:getBroadCast_info('+meta.row+');">'+data+'</a>'
                }},
            {'title': 'DJ ID', 'data': 'dj_userid','render': function (data, type, row, meta) {
                    return util.memNoLink(data, row.memNo);
                }},
            {'title': 'DJ 닉네임', 'data': 'dj_nickname', 'defaultContent': ''},
            {'title': '방송시작일시', 'data': 'start_date', 'defaultContent': ''},
            {'title': '청취자', 'data': 'liveListener', 'defaultContent': ''},
            {'title': '선물', 'data': 'giftCnt', 'defaultContent': ''},
            {'title': '좋아요', 'data': 'goodCnt', 'defaultContent': ''},
            {'title': '부스터', 'data': 'boosterCnt', 'defaultContent': ''},
            {'title': '팬 수', 'data': 'fanCnt', 'defaultContent': ''},
        ]
        , 'comments': 'ㆍ방송제목을 클릭하시면 현재 방송중인 정보를 확인 할 수 있습니다.'
    },

    'listenDetail': {
        'url': '/rest/member/report/list'
        , 'columns': [
            {'title': '구분', 'data': '', 'defaultContent': ''},
            {'title': '회원번호', 'data': '', 'defaultContent': ''},
            {'title': 'User ID', 'data': '', 'render': function (data, type, row, meta) {
                    return util.memNoLink(data, row.memNo);
                }},
            {'title': 'User 닉네임', 'data': '', 'defaultContent': ''},
            {'title': '청취 시작 일시', 'data': '', 'defaultContent': ''},
            {'title': '청취 종료시간', 'data': '', 'defaultContent': ''},
            {'title': '권한 시작 일시', 'data': '', 'defaultContent': ''},
            {'title': '권한 종료 일시', 'data': '', 'defaultContent': ''},
            {'title': '청취진행시간', 'data': '', 'defaultContent': ''},
            {'title': '좋아요', 'data': '', 'defaultContent': ''},
            {'title': '부스터', 'data': '', 'defaultContent': ''},
            {'title': '보낸아이템', 'data': '', 'defaultContent': ''},
        ]
        , 'comments' : 'ㆍ방송 중 (게스트와 매니저를 포함한) 청취자 변동사항을 확인할 수 있습니다.<br/>' +
                       'ㆍ청취자 리스트는 방송 Live상태 내에서의 데이터로 방송 입퇴장 정보를 포함합니다.'
    },

    'chatList': {
        'url': '/rest/member/report/list'
        , 'columns': [
            {'title': '채팅 장성 시간', 'data': '', 'defaultContent': '0건'},
            {'title': '채팅 내용', 'data': '', 'defaultContent': '0건'},
        ]
    },
    'chatUserList': {
        'url': '/rest/member/report/list'
        , 'columns': [
            {'title': '채팅 장성 시간', 'data': '', 'defaultContent': '0건'},
            {'title': '채팅 내용', 'data': '', 'defaultContent': '0건'},
        ]
    },


    'likeDetail': {
        'url': '/rest/member/report/list'
        , 'columns': [
            {'title': '회원번호', 'data': '', 'defaultContent': ''},
            {'title': '보낸 User Id', 'data': '', 'render': function (data, type, row, meta) {
                    return util.memNoLink(data, row.memNo);
                }},
            {'title': '보낸 User 닉네임', 'data': '', 'defaultContent': ''},
            {'title': '보낸 일시', 'data': '', 'defaultContent': ''},
            {'title': '보낸 좋아요', 'data': '', 'defaultContent': ''},
            {'title': '보낸 부스터', 'data': '', 'defaultContent': ''},
            {'title': '적용완료 일시', 'data': '', 'defaultContent': ''},
        ]
        , 'comments': 'ㆍ방송 중 좋아요와 부스터 적용상태를 확인할 수 있습니다.'
    },

    'giftDetail': {
        'url': '/rest/member/report/list'
        , 'columns': [
            {'title': '회원번호', 'data': '', 'defaultContent': ''},
            {'title': '보낸 User ID', 'data': '', 'render': function (data, type, row, meta) {
                    return util.memNoLink(data, row.memNo);
                }},
            {'title': '보낸 User 닉네임', 'data': '', 'defaultContent': ''},
            {'title': '보낸 일시', 'data': '', 'defaultContent': ''},
            {'title': '이미지', 'data': '', 'defaultContent': ''},
            {'title': '선물 명', 'data': '', 'defaultContent': ''},
            {'title': '보낸 선물 수', 'data': '', 'defaultContent': ''},
            {'title': '적용완료 일시', 'data': '', 'defaultContent': ''},
        ]
        , 'comments': 'ㆍ방송 중 DJ에게 보낸 회원 및 선물 세부 내역을 확인할 수 있습니다.'
    },

    'storyDetail': {
        'url': '/rest/member/report/list'
        , 'columns': [
            {'title': '회원번호', 'data': '', 'defaultContent': ''},
            {'title': '사연 보낸 청취자 ID', 'render': function (data, type, row, meta) {
                    return util.memNoLink(data, row.memNo);
                }},
            {'title': '사연 보낸 청취자 닉네임', 'data': '', 'defaultContent': ''},
            {'title': '보낸 일시', 'data': '', 'defaultContent': ''},
            {'title': '사연 내용', 'data': '', 'defaultContent': ''},
        ]
        , 'comments': 'ㆍ방송 중 받은 사연 내역을 확인할 수 있습니다.'
    },

    'live_top': {
        'url': '/rest/member/report/list'
        , 'columns': [
            {'title': '누적청취자', 'data': '', 'defaultContent': '0건'},
            {'title': '누적선물', 'data': '', 'defaultContent': '0건'},
            {'title': '누적좋아요', 'data': '', 'defaultContent': '0건'},
            {'title': '누적DJ부스터', 'data': '', 'defaultContent': '0건'},
            {'title': '누적청취자 부스터', 'data': '', 'defaultContent': '0건'},
            {'title': '강제퇴장', 'data': '', 'defaultContent': '0건'},
        ]
    },

    'listen_top': {
        'url': '/rest/member/report/list'
        , 'columns': [
            {'title': '청취자', 'data': '', 'defaultContent': '0건'},
            {'title': '게스트ID', 'data': '', 'defaultContent': '0건'},
            {'title': '매니저', 'data': '', 'defaultContent': '0건'},
            {'title': '강제퇴장자', 'data': '', 'defaultContent': '0건'},
            {'title': '좋아요', 'data': '', 'defaultContent': '0건'},
            {'title': '부스터', 'data': '', 'defaultContent': '0건'},
            {'title': '아이템', 'data': '', 'defaultContent': '0건'},
        ]
    },

    'chat_top': {
        'url': '/rest/member/report/list'
        , 'columns': [
            {'title': '채팅참여자', 'data': '', 'defaultContent': '0건'},
            {'title': '<i class="fa fa-moon-o" style="color: #009bff"></i>' + ": 달D", 'data': '', 'defaultContent': '0건'},
            {'title': '<i class="fa fa-volume-up" style="color: #080004"></i>' + ": 청취자", 'data': '', 'defaultContent': '0건'},
            {'title': '<i class="fa fa-star" style="color: #ff1600"></i>' + ": 게스트", 'data': '', 'defaultContent': '0건'},
            {'title': '<i class="fa fa-street-view" style="color: #00ff32"></i>' + ": 매니저", 'data': '', 'defaultContent': '0건'},
            {'title': '<i class="fa fa-bomb" style="color: #7400ff"></i>' + ": 강제퇴장자", 'data': '', 'defaultContent': '0건'},
        ]
    },
    'like_top': {
        'url': '/rest/member/report/list'
        , 'columns': [
            {'title': '좋아요', 'data': '', 'defaultContent': '0건'},
            {'title': '청취자 부스터', 'data': '', 'defaultContent': '0건'},
        ]
    },
    'gift_top': {
        'url': '/rest/member/report/list'
        , 'columns': [
            {'title': '방송 중 선물', 'data': '', 'defaultContent': '0건'},
            {'title': 'DJ>청취자', 'data': '', 'defaultContent': '0건'},
            {'title': '남자', 'data': '', 'defaultContent': '0건'},
            {'title': '여자', 'data': '', 'defaultContent': '0건'},
        ]
    },
    'story_top': {
        'url': '/rest/member/report/list'
        , 'columns': [
            {'title': '방송 중 사연', 'data': '', 'defaultContent': '0건'},
            {'title': '남자', 'data': '', 'defaultContent': '0건'},
            {'title': '여자', 'data': '', 'defaultContent': '0건'},
        ]
    },
    
    'adminMemoList': {
        'url': '/rest/member/report/list'
        , 'columns': [
            {'title': '방송제목', 'data': '', 'defaultContent': ''},
            {'title': 'DJ ID', 'data': '', 'defaultContent': ''},
            {'title': 'DJ 닉네임', 'data': '', 'defaultContent': ''},
            {'title': '등록 일시', 'data': '', 'defaultContent': ''},
            {'title': '등록관리자', 'data': '', 'defaultContent': ''},
            {'title': '운영자 조치', 'data': '', 'defaultContent': ''},
            {'title': '운영자 메모내용', 'data': '', 'defaultContent': ''},
        ]
        , 'comments' : 'ㆍ회원 또는 운영자에 의해 정보가 수정된 일시를 확인할 수 있습니다.'
    },
    'editDate': {
        'url': '/rest/member/report/list'
        , 'columns': [
            {'title': '정보 수정 일시', 'data': '', 'defaultContent': ''},
            {'title': '처리 전 정보 및 수정 처리 내역', 'data': '', 'defaultContent': ''},
            {'title': '처리자명', 'data': '', 'defaultContent': ''},
        ]
        , 'comments' : 'ㆍ회원 또는 운영자에 의해 정보가 수정된 일시를 확인할 수 있습니다.'
    },

}
