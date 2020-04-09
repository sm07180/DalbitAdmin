var BroadcastDataTableSource = {
    'liveList': {
        'url': '/rest/broadcast/broadcast/list'
        , 'columns': [
            {'title': '방송주제', 'data': 'subjectType','width' : '60px', 'render' : function (data){
                    return util.getCommonCodeLabel(data, subject_type);
                }},
            {'title': '방송제목', 'data': 'title','width' : '200px', 'render': function (data, type, row, meta) {
                    return util.roomNoLink(data, row.room_no);
                }},
            {'title': '프로필이미지', 'data': 'dj_profileImage', 'render' : function(data, type, row){
                    return '<img src="'+ common.profileImage(IMAGE_SERVER_URL,data,row.dj_memSex) +'" width="50px" height="50px" ' +
                            'onclick="fullSize_live(this.src)"/>';
                }},
            {'title': '테그부분', 'data': 'tag','width' : '60px', 'render': function (data, type, row, meta) {
                    var tmp = "";
                    if(row.recommBadge == "1"){
                        tmp = '<span class ="label" style="background-color:#d9534f">' + "추천" + '</span><br/>';
                    }
                    if(row.popularBadge == "1"){
                        tmp = tmp + '<span class ="label" style="background-color:#3761d9">' + "인기" + '</span><br/>';
                    }
                    if(row.newjdBadge == "1"){
                        tmp = tmp + '<span class ="label" style="background-color:#d9c811">' + "신입" + '</span>';
                    }
                    return tmp;
                }},
            {'title': 'DJ ID', 'data': 'dj_userid','width' : '65px','render': function (data, type, row, meta) {
                    var tmp = util.memNoLink(data, row.dj_mem_no);
                    tmp = tmp + '<br/>' +  row.dj_level +" / "+ row.dj_grade;
                    return tmp;
                }},
            {'title': 'User 닉네임', 'data': 'dj_nickname','width' : '75px'},
            {'title': '방송시작일시', 'data': 'start_date','width' : '120px'},
            {'title': '진행시간', 'data': 'airTime','width' : '65px','render': function (data){
                    return common.timeStamp(data);
                }},
            {'title': '누적청취자', 'data': 'totalListener','width' : '70px','render': function (data){
                    var tmp = common.addComma(data);
                    return tmp + "명";
                }},
            {'title': '청취자', 'data': 'liveListener','width' : '45px','render': function (data){
                    var tmp = common.addComma(data);
                    return tmp + "명";
                }},
            {'title': '좋아요', 'data': 'goodCnt','width' : '45px','render': function (data){
                    var tmp = common.addComma(data);
                    return tmp + "건";
                }},
            {'title': '부스터', 'data': 'boosterCnt','width' : '45px','render': function (data){
                    var tmp = common.addComma(data);
                    return tmp + "건";
                }},
            {'title': '선물', 'data': 'giftCnt','width' : '45px','render': function (data){
                    var tmp = common.addComma(data);
                    return tmp + "건";
                }},
            {'title': '팬 수', 'data': 'fanCnt','width' : '45px','render': function (data){
                    var tmp = common.addComma(data);
                    return tmp + "명";
                }},
            {'title': '강제퇴장', 'data': 'forcedCnt','width' : '60px','render': function (data){
                    var tmp = common.addComma(data);
                    return tmp + "명";
                }},
        ]
        , 'comments' : 'ㆍ실시간 생방송 시작된 방송이 최상위 누적되어 보여집니다.<br/>ㆍDJ가 방송을 완료한 경우 해당 방송은 리스트에서 삭제됩니다.'
    },

    'broadcastList': {
        'url': '/rest/broadcast/broadcast/list'
        , 'columns': [
            {'title': '방송주제', 'data': 'subjectType', 'render' : function (data){
                    return util.getCommonCodeLabel(data, subject_type);
                }},
            {'title': '방송제목', 'data': 'title', 'render': function (data, type, row, meta) {
                    return '<a href="javascript://" class="getBroadCast_info" onclick="javascript:getBroadCast_info('+meta.row+');">'+data+'</a>'
                }},
            {'title': '방송시작일시', 'data': 'start_date'},
            {'title': '방송진행시간', 'data': 'airTime','render':function(data){
                    return common.timeStamp(data);
                }},
            {'title': 'DJ ID', 'data': 'dj_userid','render': function (data, type, row, meta) {
                    var tmp = util.memNoLink(data, row.dj_mem_no);
                    tmp = tmp + '<br/>' +  row.dj_level +" / "+ row.dj_grade;
                    return tmp;
                }},
            {'title': 'DJ 닉네임', 'data': 'dj_nickname'},
            {'title': '누적청취자', 'data': 'totalListener','render': function (data){
                    var tmp = common.addComma(data);
                    return tmp + "명";
                }},
            {'title': '청취자', 'data': 'liveListener','render': function (data){
                    var tmp = common.addComma(data);
                    return tmp + "명";
                }},
            {'title': '좋아요', 'data': 'goodCnt','render': function (data){
                    var tmp = common.addComma(data);
                    return tmp + "건";
                }},
            {'title': '선물', 'data': 'giftCnt','render': function (data){
                    var tmp = common.addComma(data);
                    return tmp + "건";
                }},
            {'title': '사연수', 'data': 'storyCnt','render': function (data){
                    var tmp = common.addComma(data);
                    return tmp + "건";
                }},
            {'title': '방송상태', 'data': 'state','render': function (data, type, row, meta) {
                    if(data == "1"){
                        return "방송중";
                    } else if (data == "2"){
                        return "mic off";
                    } else if (data == "3"){
                        return data + "통화중";
                    } else if (data == "5"){
                        return "DJ비정상종료";
                    }
                }},
        ]
        , 'comments': 'ㆍ방송제목을 클릭하시면 현재 방송중인 정보를 확인 할 수 있습니다.'
    },

    'listenDetail': {
        'url': '/rest/broadcast/listener/list'
        , 'columns': [
            {'title': '구분', 'data': 'state', 'width':'80px', 'render': function (data, type, row, meta) {
                    if(data == "1") {
                        return '<lable style="color:#d98000">퇴장</lable>';
                    }else if(data == "2"){
                        return '<lable style="color:#ff1600">강제퇴장자</lable>';
                    }else if(data == "0"){
                        if(row.auth == "0"){
                        return '<lable style="color:#080004">청취자</lable>';
                        }else if(row.auth == "1"){
                            return '<lable style="color:#00ff32">매니저</lable>';
                        }else if(row.auth == "2"){
                            return '<lable style="color:#0036ff">게스트</lable>';
                        }
                    }
                }},

            {'title': 'User ID', 'data': 'userID', 'width':'100px', 'render': function (data, type, row, meta) {
                    var tmp = util.memNoLink(data, row.mem_no);
                    tmp = tmp + '<br/>' +  row.level +" / "+ row.grade;
                    return tmp;
                }},
            {'title': 'User 닉네임', 'data': 'nickName', 'width':'140px'},
            {'title': '청취 시작 일시', 'data': 'startDateFormat', 'width':'120px'},
            {'title': '청취 종료시간', 'data': 'endDateFormat', 'width':'120px'},
            {'title': '권한 시작 일시', 'data': 'authStartDateFormat', 'width':'120px'},
            {'title': '권한 종료 일시', 'data': 'authEndDateFormat', 'width':'120px'},
            {'title': '청취진행시간', 'data': 'listenTime', 'width':'120px'},
            {'title': '좋아요', 'data': 'goodCnt', 'width':'60px'},
            {'title': '부스터', 'data': 'boosterCnt', 'width':'60px'},
            {'title': '보낸아이템', 'data': 'giftCnt', 'width':'80px'},
        ]
        , 'comments' : 'ㆍ방송 중 (게스트와 매니저를 포함한) 청취자 변동사항을 확인할 수 있습니다.<br/>' +
                       'ㆍ청취자 리스트는 방송 Live상태 내에서의 데이터로 방송 입퇴장 정보를 포함합니다.'
    },

    'chatList': {
        'url': '/rest/member/report/list'
        , 'columns': [
            {'title': '채팅 장성 시간', 'data': ''},
            {'title': '채팅 내용', 'data': ''},
        ]
    },


    'likeDetail': {
        'url': '/rest/broadcast/like/list'
        , 'columns': [
            {'title': '보낸 User ID', 'data': 'mem_userid', 'width':'100px', 'render': function (data, type, row, meta) {
                    var tmp = util.memNoLink(data, row.mem_no);
                    tmp = tmp + '<br/>' +  row.level +" / "+ row.grade;
                    return tmp;
                }},
            {'title': '보낸 User 닉네임', 'data': 'mem_nick','width' : '150px'},
            {'title': '좋아요 보낸 일시', 'data': 'goodDate','width' : '150px'},
            {'title': '누적 부스터', 'data': 'accumCnt','width' : '150px', 'render': function (data) {
                    var tmp = common.addComma(data);
                    return tmp + "건";
                }},
            {'title': '부스터 적용 일시', 'data': 'boosterDate','width' : '150px'},
            {'title': '실시간 순위', 'data': 'rank','width' : '100px', 'render': function (data) {
                    var tmp = common.addComma(data);
                    return tmp + "위";
                }},
        ]
        , 'comments': 'ㆍ방송 중 좋아요와 부스터 적용상태를 확인할 수 있습니다.'
    },

    'giftDetail': {
        'url': '/rest/broadcast/gift/list'
        , 'columns': [
            {'title': '보낸 User ID', 'data': 'userId', 'render': function (data, type, row, meta) {
                    var tmp = util.memNoLink(data, row.mem_no);
                    tmp = tmp + '<br/>' +  row.level +" / "+ row.grade;
                    return tmp;
                }},
            {'title': '보낸 User 닉네임', 'data': 'nickName'},
            {'title': '보낸 일시', 'data': 'giftDate'},
            {'title': '이미지', 'data': 'itemImage', 'render' : function(data, type, row, meta){
                    return '<img src="'+ IMAGE_SERVER_URL + data+'" width="50px" height="50px"/>';
                }},
            {'title': '선물 명', 'data': 'itemName'},
            {'title': '누적 선물', 'data': 'accumCnt'},
        ]
        , 'comments': 'ㆍ방송 중 DJ에게 보낸 회원 및 선물 세부 내역을 확인할 수 있습니다.'
    },

    'storyDetail': {
        'url': '/rest/broadcast/story/list'
        , 'columns': [
            {'title': '사연 보낸 청취자 ID','data':'userId', 'render': function (data, type, row, meta) {
                    var tmp = util.memNoLink(data, row.mem_no);
                    tmp = tmp + '<br/>' +  row.level +" / "+ row.grade;
                    return tmp;
                }},
            {'title': '사연 보낸 청취자 닉네임', 'data': 'nickName'},
            {'title': '보낸 일시', 'data': 'writeDateFormat'},
            {'title': '사연 내용', 'data': 'contents', 'render': function (data, type, row, meta) {
                    return data.replace(/\\n/gi,"<br/>");
                }},
        ]
        , 'comments': 'ㆍ방송 중 받은 사연 내역을 확인할 수 있습니다.'
    },

    'chatDetail': {
        'url': '/rest/broadcast/chat/list'
        , 'columns': [
            {'title': '채팅 시작 일시', 'data': 'writeDateFormat', 'width':'120px'},
            {'title': '채팅 내용', 'data': 'nickname','className' : 'text-left', 'render': function (data, type, row, meta) {
                    var tmp_auth;
                    if(row.auth == "0"){             //일반
                        tmp_auth = '<i class="fa fa-volume-up" style="color: #080004"></i>';
                    }else if(row.auth == "1"){      //매니저
                        tmp_auth = '<i class="fa fa-street-view" style="color: #00ff32"></i>';
                    }else if(row.auth == "2"){      //게스트
                        tmp_auth = '<i class="fa fa-star" style="color: #0036ff"></i>';
                    }else if(row.auth == "3"){      //dj
                        tmp_auth = '<i class="fa fa-microphone" style="color: #8556F6"></i>';
                    }
                    var tmp = tmp_auth + '<a href="javascript://" onclick="targetChat(' + meta.row + ')">' + data + '</a>' + " :" +row.msg;
                    return tmp;
                }},
        ]
    },

    'targetchat': {
        'url': '/rest/broadcast/chat/targetList'
        , 'columns': [
            {'title': '채팅 시작 일시', 'data': 'writeDateFormat', 'width':'120px'},
            {'title': '채팅 내용', 'data': 'nickname','className' : 'text-left', 'render': function (data, type, row, meta) {
                    var tmp_auth;
                    if(row.auth == "0"){             //일반
                        tmp_auth = '<i class="fa fa-volume-up" style="color: #080004"></i>';
                    }else if(row.auth == "1"){      //매니저
                        tmp_auth = '<i class="fa fa-street-view" style="color: #00ff32"></i>';
                    }else if(row.auth == "2"){      //게스트
                        tmp_auth = '<i class="fa fa-star" style="color: #0036ff"></i>';
                    }else if(row.auth == "3"){      //dj
                        tmp_auth = '<i class="fa fa-microphone" style="color: #8556F6"></i>';
                    }
                    var tmp = tmp_auth + util.memNoLink(data, row.mem_no) + " :" +row.msg;
                    return tmp;
                }},
        ]
    },

    'editHistory': {
        'url': '/rest/broadcast/broadcast/editHist'
        , 'columns': [
            {'title': '수정일자', 'data': 'editDateFormat','width':'120px'},
            {'title': '수정 내용', 'data': 'editContents','width':'900px'},
            {'title': '처리자명', 'data': 'opName','width':'100px'},
        ]
        , 'comments': 'ㆍ회원 또는 운영자에 의해 정보가 수정된 일시를 확인할 수 있습니다.'
    },

    'adminMemoList': {
        'url': '/rest/member/member/adminMemolist'
        , 'columns': [
            {'title': '등록 일시', 'data': 'regDate','width':'180px'},
            {'title': '등록 관리자', 'data': 'opName','width':'100px'},
            {'title': '운영자 메모 내용', 'data': 'memo'},
        ]
    },
}
