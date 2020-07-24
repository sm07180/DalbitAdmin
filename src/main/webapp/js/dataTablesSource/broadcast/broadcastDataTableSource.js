var BroadcastDataTableSource = {
    'liveList': {
        'url': '/rest/broadcast/broadcast/list'
        , 'columns': [
            {'title': '플랫폼', 'data': 'osType','width' : '50px', 'render': function (data) {
                    if(data == 3){
                        var tmp = '<img src="https://cdn.zeplin.io/5e841bd8a790d06f2465dd87/assets/4bb20760-4afb-46a1-8bdf-35106f1a4e46.svg"> <br/>' ;
                    }else{
                        var tmp = '<img src="https://cdn.zeplin.io/5e841bd8a790d06f2465dd87/assets/dca7b592-edb6-4080-b763-7e535529661f.svg"> <br/>' ;
                    }
                    return tmp + util.getCommonCodeLabel(data, os_type);
                }},
            {'title': '주제', 'data': 'subject_name','width' : '65px'},
            {'title': '제목', 'data': 'title','width' : '150px', 'render': function (data, type, row, meta) {
                    return util.roomNoLink(data, row.room_no);
                }},
            {'title': '방송방', 'data': 'backgroundImage', 'width' : '50px', 'render' : function(data, type, row){
                    return '<img class="thumbnail fullSize_background" src="'+ PHOTO_SERVER_URL + data +'" width="65px" height="65px" />';
                }},
            {'title': '프로필', 'data': 'dj_profileImage', 'width' : '50px', 'render' : function(data, type, row){
                    return '<img class="thumbnail fullSize_background" src="'+ common.profileImage(PHOTO_SERVER_URL,data,row.dj_memSex) +'" width="65px" height="65px" />';
                }},
            {'title': '테그부분', 'data': 'tag','width' : '60px', 'render': function (data, type, row, meta) {
                    var tmp = "";
                    if(row.recommBadge == "1"){
                        tmp = '<span class ="label" style="background-color:#d943c1">' + "추천" + '</span><br/>';
                    }
                    if(row.popularBadge == "1"){
                        tmp = tmp + '<span class ="label" style="background-color:#3761d9">' + "인기" + '</span><br/>';
                    }
                    if(row.newjdBadge == "1"){
                        tmp = tmp + '<span class ="label" style="background-color:#d9c811">' + "신입" + '</span><br/>';
                    }
                    if(row.specialdj_badge == "1"){
                        tmp = tmp + '<span class ="label" style="background-color:red">' + "스페셜DJ" + '</span>';
                    }
                    return tmp;
                }},
            {'title': '회원번호<br/>닉네임', 'data': 'dj_nickname','width' : '75px','render': function (data, type, row, meta) {
                    var tmp = util.memNoLink(row.dj_mem_no, row.dj_mem_no);
                    return tmp + '<br/>' + data;
                }},
            {'title': '성별', 'data': 'dj_memSex', 'width':'55px', 'render': function (data, type, row, meta) {
                    return common.sexIcon(data) + '<br/>' + "(" +row.dj_korean_age + "세)";
                }},
            {'title': '방송 개설', 'data': 'broadCastCnt','width' : '70px', 'render': function (data, type, row, meta) {
                    return common.addComma(data);
                }},
            {'title': '상태', 'data': 'state', 'width':'120px', 'render': function (data, type, row, meta) {
                    return util.getCommonCodeLabel(data,room_state);
                }},
            {'title': '시작일시', 'data': 'start_date','width' : '60px'},
            {'title': '진행시간', 'data': 'airTime','width' : '65px','render': function (data){
                    return common.timeStamp(data);
                }},
            {'title': '방송연장', 'data': 'extend_time_count','width' : '55px','render': function (data){
                    if(data > 0){
                        return 'YES';
                    }
                    return 'NO';
                }},
            {'title': '누적<br/>청취자', 'data': 'totalListener','width' : '55px','render': function (data){
                    var tmp = common.addComma(data);
                    return tmp + "명";
                }},
            {'title': '<lable style="color:red">청취자</lable>', 'data': 'liveListener','color': 'red','width' : '40px','render': function (data){
                    return '<lable style="color:red">' + common.addComma(data) + ' 명</lable>';
                }},
            {'title': '좋아요', 'data': 'goodCnt','width' : '40px','render': function (data){
                    var tmp = common.addComma(data);
                    return tmp + "건";
                }},
            {'title': '부스터', 'data': 'boosterCnt','width' : '40px','render': function (data){
                    var tmp = common.addComma(data);
                    return tmp + "건";
                }},
            {'title': '선물', 'data': 'giftCnt','width' : '40px','render': function (data){
                    var tmp = common.addComma(data);
                    return tmp + "건";
                }},
            // {'title': '팬 수', 'data': 'fanCnt','width' : '40px','render': function (data){
            //         var tmp = common.addComma(data);
            //         return tmp + "명";
            //     }},
            // {'title': '강제퇴장', 'data': 'forcedCnt','width' : '50px','render': function (data){
            //         var tmp = common.addComma(data);
            //         return tmp + "명";
            //     }},
            {'title': '사연', 'data': 'storyCnt','width' : '40px','render': function (data, type, row, meta) {
                    var url = "/broadcast/live/popup/storyPopup?roomNo=" + encodeURIComponent(row.room_no);
                    // var tmp = '<a href="javascript://" class="_openPop" data-url="' + url + '" data-width="'+ 1250 +'" data-height="'+ 700 +'">' + 0 + '</a>';
                    var tmp = '<a href="javascript://" class="_openPop" data-url="' + url + '" data-width="'+ 1250 +'" data-height="'+ 700 +'">' + common.addComma(data) + '건</a>';
                    return tmp;
                }},
            {'title': '나가기<br/>시도', 'data': 'exit_try_count','width' : '55px','render': function (data){
                    return common.fontColor(data, 1, 'red') +'번';
                }},
            {'title': '입장/<br/>강제종료', 'data': '','width' : '55px','render': function (data, type, row, meta) {
                    var tmp =  '<button type="button" id="bt_broadcastGo" class="btn btn-default btn-xs _openPlayerPop" style="width: 60px;margin-bottom: 1px" data-roomno="' + row.room_no + '" >입장</button><br/>';
                    tmp = tmp + '<button type="button" class="btn btn-danger btn-xs" onclick="forcedEnd($(this).data());" data-memno= "' + row.dj_mem_no + '" data-roomno="' + row.room_no + '" >강제종료</button>';

                    return tmp;
                }},
            {'title': '숨김<br/>상태', 'data': 'hide', 'width':'30px', 'render': function (data, type, row, meta) {
                    if(data == 0) return "N";
                    else return "Y";
                }},
        ]
    },

    'endLiveList': {
        'url': '/rest/broadcast/broadcast/list'
        , 'columns': [
            {'title': '플랫폼', 'data': 'osType','width' : '65px', 'render': function (data) {
                    if(data == 3){
                        var tmp = '<img src="https://cdn.zeplin.io/5e841bd8a790d06f2465dd87/assets/4bb20760-4afb-46a1-8bdf-35106f1a4e46.svg"> <br/>' ;
                    }else{
                        var tmp = '<img src="https://cdn.zeplin.io/5e841bd8a790d06f2465dd87/assets/dca7b592-edb6-4080-b763-7e535529661f.svg"> <br/>' ;
                    }
                    return tmp + util.getCommonCodeLabel(data, os_type);
                }},
            {'title': '주제', 'data': 'subject_name','width' : '65px'},
            {'title': '제목', 'data': 'title','width' : '150px', 'render': function (data, type, row, meta) {
                    return util.roomNoLink(data, row.room_no);
                }},
            {'title': '배경', 'data': 'backgroundImage', 'width' : '50px', 'render' : function(data, type, row){
                    return '<img class="thumbnail fullSize_background" src="'+ PHOTO_SERVER_URL + data +'" width="65px" height="65px" />';
                }},
            {'title': '프로필', 'data': 'dj_profileImage', 'width' : '50px', 'render' : function(data, type, row){
                    return '<img class="thumbnail fullSize_background" src="'+ common.profileImage(PHOTO_SERVER_URL,data,row.dj_memSex) +'" width="65px" height="65px" />';
                }},
            {'title': '테그부분', 'data': 'tag','width' : '60px', 'render': function (data, type, row, meta) {
                    var tmp = "";
                    if(row.recommBadge == "1"){
                        tmp = '<span class ="label" style="background-color:#d943c1">' + "추천" + '</span><br/>';
                    }
                    if(row.popularBadge == "1"){
                        tmp = tmp + '<span class ="label" style="background-color:#3761d9">' + "인기" + '</span><br/>';
                    }
                    if(row.newjdBadge == "1"){
                        tmp = tmp + '<span class ="label" style="background-color:#d9c811">' + "신입" + '</span><br/>';
                    }
                    if(row.specialdj_badge == "1"){
                        tmp = tmp + '<span class ="label" style="background-color:red">' + "스페셜DJ" + '</span>';
                    }
                    return tmp;
                }},
            {'title': '회원번호<br/>닉네임', 'data': 'dj_nickname','width' : '75px','render': function (data, type, row, meta) {
                    var tmp = util.memNoLink(row.dj_mem_no, row.dj_mem_no);
                    return tmp + '<br/>' + data;
                }},
            {'title': '성별', 'data': 'dj_memSex', 'width':'55px', 'render': function (data, type, row, meta) {
                    return common.sexIcon(data) + '<br/>' + "(" +row.dj_korean_age + "세)";
                }},
            {'title': '방송 개설', 'data': 'broadCastCnt','width' : '70px', 'render': function (data, type, row, meta) {
                    return common.addComma(data);
                }},
            {'title': '상태', 'data': 'state', 'width':'120px', 'render': function (data, type, row, meta) {
                    return util.getCommonCodeLabel(data,room_state);
                }},
            {'title': '시작일시', 'data': 'start_date','width' : '60px'},
            {'title': '종료일시', 'data': 'end_date','width' : '60px'},
            {'title': '진행시간', 'data': 'airTime','width' : '65px','render': function (data){
                    return common.timeStamp(data);
                }},
            {'title': '방송연장', 'data': 'extend_time_count','width' : '55px','render': function (data){
                    if(data > 0){
                        return 'YES';
                    }
                    return 'NO';
                }},
            {'title': '<lable style="color:red">누적<br/>청취자</lable>', 'data': 'totalListener','width' : '65px','render': function (data){
                    return '<lable style="color:red">' + common.addComma(data) + ' 명</lable>';
                }},
            {'title': '좋아요', 'data': 'goodCnt','width' : '40px','render': function (data){
                    var tmp = common.addComma(data);
                    return tmp + "건";
                }},
            {'title': '부스터', 'data': 'boosterCnt','width' : '40px','render': function (data){
                    var tmp = common.addComma(data);
                    return tmp + "건";
                }},
            {'title': '선물', 'data': 'giftCnt','width' : '40px','render': function (data){
                    var tmp = common.addComma(data);
                    return tmp + "건";
                }},
            // {'title': '팬 수', 'data': 'fanCnt','width' : '40px','render': function (data){
            //         var tmp = common.addComma(data);
            //         return tmp + "명";
            //     }},
            // {'title': '강제퇴장', 'data': 'forcedCnt','width' : '50px','render': function (data){
            //         var tmp = common.addComma(data);
            //         return tmp + "명";
            //     }},
            {'title': '사연', 'data': 'storyCnt','width' : '40px','render': function (data, type, row, meta) {
                    var url = "/broadcast/live/popup/storyPopup?roomNo=" + encodeURIComponent(row.room_no);
                    // var tmp = '<a href="javascript://" class="_openPop" data-url="' + url + '" data-width="'+ 1250 +'" data-height="'+ 700 +'">' + 0 + '</a>';
                    var tmp = '<a href="javascript://" class="_openPop" data-url="' + url + '" data-width="'+ 1250 +'" data-height="'+ 700 +'">' + common.addComma(data) + '건</a>';
                    return tmp;
                }},
            {'title': '나가기<br/>시도', 'data': 'exit_try_count','width' : '55px','render': function (data){
                    return common.fontColor(data, 1, 'red') +'번';
                }},
            {'title': '숨김<br/>상태', 'data': 'hide', 'width':'30px', 'render': function (data, type, row, meta) {
                    if(data == 0) return "N";
                    else return "Y";
                }},
        ]
    },

    'broadcastList': {
        'url': '/rest/broadcast/broadcast/list'
        , 'columns': [
            {'title': '상태', 'data': 'state','render': function (data, type, row, meta) {
                    return util.getCommonCodeLabel(data, room_state);
                }},
            {'title': '주제', 'data': 'subject_name'},
            {'title': '제목', 'data': 'title', 'render': function (data, type, row, meta) {
                    return '<a href="javascript://" class="getBroadCast_info" onclick="javascript:getBroadCast_info('+meta.row+');">'+data+'</a>'
                }},
            {'title': '시작일시', 'data': 'start_date'},
            {'title': '종료일시', 'data': 'end_date'},
            {'title': '진행시간', 'data': 'airTime','render':function(data){
                    return common.timeStamp(data);
                }},
            {'title': 'DJ 회원번호', 'data': 'dj_mem_no','render': function (data, type, row, meta) {
                    var tmp = util.memNoLink(data, row.dj_mem_no);
                    tmp = tmp + '<br/>' +  row.dj_level +" / "+ row.dj_grade;
                    return tmp;
                }},
            {'title': 'DJ 닉네임', 'data': 'dj_nickname'},
            {'title': '성별', 'data': 'dj_memSex', 'width':'100px', 'render': function (data, type, row, meta) {
                    return common.sexIcon(data) + "(" +row.dj_korean_age + "세)";
                }},
            {'title': '누적청취자', 'data': 'totalListener','render': function (data){
                    var tmp = common.addComma(data);
                    return tmp + "명";
                }},
            {'title': '<lable style="color:red">청취자</lable>', 'data': 'liveListener','render': function (data){
                    return '<lable style="color:red">' + common.addComma(data) + ' 명</lable>';
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
            {'title': '나가기 횟수', 'data': 'exit_try_count','width' : '70px','render': function (data){
                    return common.fontColor(data, 1, 'red')+'번';
                }},
            {'title': '숨김상태', 'data': 'hide', 'render': function (data, type, row, meta) {
                    if(data == 0) return "N";
                    else return "Y";

                }},
        ]
        , 'comments': 'ㆍ방송제목을 클릭하시면 현재 방송중인 정보를 확인 할 수 있습니다.'
    },

    'listenDetail': {
        'url': '/rest/broadcast/listener/list'
        , 'columns': [
            {'title': '구분', 'data': 'state', 'width':'80px', 'render': function (data, type, row, meta) {
                    var tmp = "";
                    if(row.recomm_badge == "1"){
                        tmp = '<span class ="label" style="background-color:#d943c1">' + "추천" + '</span><br/>';
                    }
                    if(row.newdj_badge == "1"){
                        tmp = tmp + '<span class ="label" style="background-color:#d9c811">' + "신입" + '</span><br/>';
                    }
                    if(row.specialdj_badge == "1"){
                        tmp = tmp + '<span class ="label" style="background-color:red">' + "스페셜DJ" + '</span>';
                    }
                    if(data == "1") {
                        return '<lable style="color:#d98000">퇴장</lable><br/>' + tmp;
                    }else if(data == "2"){
                        return '<lable style="color:#ff1600">강제퇴장자</lable><br/>' + tmp;
                    }else if(data == "0"){
                        if(row.auth == "0"){
                        return '<lable style="color:#080004">청취자</lable><br/>' + tmp;
                        }else if(row.auth == "1"){
                            return '<lable style="color:#00ff32">매니저</lable><br/>' + tmp;
                        }else if(row.auth == "2"){
                            return '<lable style="color:#0036ff">게스트</lable><br/>' + tmp;
                        }
                    }
                }},

            {'title': '회원번호', 'data': 'mem_no', 'width':'100px', 'render': function (data, type, row, meta) {
                    var tmp = util.memNoLink(data, row.mem_no);
                    tmp = tmp + '<br/>' +  row.level +" / "+ row.grade;
                    return tmp;
                }},
            {'title': 'User 닉네임', 'data': 'nickName', 'width':'140px'},
            {'title': '성별', 'data': 'mem_sex', 'width':'70px', 'render': function (data, type, row, meta) {
                    return common.sexIcon(data, row.mem_birth_year);
                }},
            {'title': '청취 시작 일시', 'data': 'startDateFormat', 'width':'120px'},
            {'title': '청취 종료시간', 'data': 'endDateFormat', 'width':'120px'},
            {'title': '권한 시작 일시', 'data': 'authStartDateFormat', 'width':'120px'},
            {'title': '권한 종료 일시', 'data': 'authEndDateFormat', 'width':'120px'},
            {'title': '청취진행시간', 'data': 'listenTime', 'width':'120px','render' : function (data){
                    return common.timeStamp(data);
                }},
            {'title': '좋아요', 'data': 'goodCnt', 'width':'60px'},
            {'title': '부스터', 'data': 'boosterCnt', 'width':'60px', 'render': function (data) {
                    return data + " 개"
                }},
            {'title': '보낸아이템', 'data': 'giftCnt', 'width':'80px', 'render': function (data) {
                    return data + " 개"
                }},
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
            {'title': '회원번호', 'data': 'mem_no', 'width':'100px', 'render': function (data, type, row, meta) {
                    var tmp = util.memNoLink(data, row.mem_no);
                    tmp = tmp + '<br/>' +  row.level +" / "+ row.grade;
                    return tmp;
                }},
            {'title': '보낸 User 닉네임', 'data': 'mem_nick','width' : '150px'},
            {'title': '성별', 'data': 'mem_sex', 'width':'70px', 'render': function (data, type, row, meta) {
                    return common.sexIcon(data, row.mem_birth_year);
                }},
            {'title': '좋아요 보낸 일시', 'data': 'goodDate','width' : '150px'},
            {'title': '누적 부스터', 'data': 'accumCnt','width' : '150px', 'render': function (data) {
                    var tmp = common.addComma(data);
                    return tmp + "건";
                }},
            {'title': '부스터 적용 일시', 'data': 'boosterDateFormat','width' : '150px'},
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
            {'title': '회원번호', 'data': 'mem_no', 'render': function (data, type, row, meta) {
                    var tmp = util.memNoLink(data, row.mem_no);
                    tmp = tmp + '<br/>' +  row.level +" / "+ row.grade;
                    return tmp;
                }},
            {'title': '보낸 User 닉네임', 'data': 'nickName'},
            {'title': '성별', 'data': 'mem_sex', 'width':'70px', 'render': function (data, type, row, meta) {
                    return common.sexIcon(data, row.mem_birth_year);
                }},
            {'title': '보낸 일시', 'data': 'giftDateFormat'},
            {'title': '몰래보낸선물', 'data': 'secret', 'render': function (data, type, row, meta) {
                    if(data == 1) var tmp = "O";
                    else var tmp = "X";
                    return tmp;
                }},
            {'title': '이미지', 'data': 'item_thumbnail', 'render' : function(data, type, row, meta){
                    return '<img class="thumbnail" src="'+ data+'" width="50px" height="50px"/>';
                }},
            {'title': '선물 명', 'data': 'itemName'},
            {'title': '선물 수', 'data': 'itemCnt', 'render': function (data) {
                    return data + " 개"
                }},
            {'title': '누적 선물', 'data': 'accumCnt', 'render': function (data) {
                    return data + " 개"
                }},
        ]
        , 'comments': 'ㆍ방송 중 DJ에게 보낸 회원 및 선물 세부 내역을 확인할 수 있습니다.'
    },

    'storyDetail': {
        'url': '/rest/broadcast/story/list'
        , 'columns': [
            {'title': '회원번호','data':'mem_no', 'render': function (data, type, row, meta) {
                    var tmp = util.memNoLink(data, row.mem_no);
                    tmp = tmp + '<br/>' +  row.level +" / "+ row.grade;
                    return tmp;
                }},
            {'title': '사연 보낸 청취자 닉네임', 'data': 'nickName'},
            {'title': '성별', 'data': 'mem_sex', 'width':'70px', 'render': function (data, type, row, meta) {
                    return common.sexIcon(data, row.mem_birth_year);
                }},
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
            {'title': '채팅 시작 일시', 'data': 'writeDateFormat', 'width':'140px'},
            {'title': '채팅 내용', 'data': 'nickname','className': 'al','render': function (data, type, row, meta) {
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
            {'title': '채팅 시작 일시', 'data': 'writeDateFormat', 'width':'140px'},
            {'title': '채팅 내용', 'data': 'nickname','className': 'al','render': function (data, type, row, meta) {
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
            {'title': '수정 내용', 'data': 'editContents','width':'900px','className':'al','render' : function(data){
                    return memberUtil.convertEditHistory(data);
                }},
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
