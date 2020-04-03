var MemberDataTableSource = {
    'userInfo': {
        'url': '/rest/member/member/list'
        , 'columns': [
            {'title': '회원번호', 'data': 'mem_no', 'width':'100px'},
             {'title': 'UserID', 'data': 'mem_userid', 'width':'100px', 'render': function (data, type, row, meta) {
                    return '<a href="javascript://" class="getMemberDetail" onclick="javascript:getMemNo_info('+meta.row+');">' + data + '</a>'
                }},
             {'title': '닉네임', 'data': 'mem_nick', 'width':'80px'},
             {'title': '연락처', 'data': 'mem_phone', 'width':'80px'},
             {'title': '가입플랫폼', 'data': 'mem_slct', 'width':'80px', 'render': function (data) {
                    return util.renderSlct(data,"15");
                 }},
             {'title': '회원가입일시', 'data': 'joinDateFormat', 'width':'120px'},
             {'title': '최근 접속 일시', 'data': 'last_connect_DateFormat', 'width':'120px'},
             {'title': '누적 접속 수', 'data': 'connectCnt', 'width':'80px', 'render': function (data) {
                     return common.addComma(data);
                 }},
             {'title': '결제 건 수/금액', 'data': 'payCntAmount', 'width':'90px'},
             {'title': '회원상태', 'data': 'mem_state',  'width':'60px'},
             {'title': '접속상태', 'data': 'connectState', 'width':'80px'},
             {'title': '방송상태', 'data': 'liveBroad', 'width':'80px'},
        ]
        , 'comments': 'ㆍ회원 아이디를 클릭하시면 상세정보를 확인할 수 있습니다.'
    },

    'broadDetail': {
        'url': '/rest/member/broadcast/list'
        , 'columns': [
            {'title': 'roomNo', 'data': 'room_no', 'visible' : false},
            {'title': '방송주제', 'data': 'subject_type', 'width':'100px'},
            {'title': '방송제목', 'data': 'title', 'width':'250px', 'render': function (data, type, row, meta) {
                    return util.roomNoLink(data, row.room_no);
                }},
            {'title': '방송시작시간', 'data': 'startDateFormat', 'width':'120px'},
            {'title': '방송종료시간', 'data': 'endDateFormat', 'width':'120px'},
            {'title': '방송진행시간', 'data': 'airtime', 'width':'100px'},
            {'title': '청취자', 'data': 'listenerCnt', 'width':'80px', 'render': function (data) {
                    return common.addComma(data) + "명";
                }},
            {'title': '방송 중<br/>매니저', 'data': 'managerCnt', 'width':'80px', 'render': function (data) {
                    return common.addComma(data) + "명";
                }},
            {'title': '선물<br/>주고/받음', 'data': 'giftCnt', 'width':'80px', 'render': function (data) {
                    return common.addComma(data) + "건";
                }},
            {'title': '받은 별', 'data': 'byeolCnt', 'width':'80px', 'render': function (data) {
                    return common.addComma(data) + "건";
                }},
            {'title': '받은 좋아요', 'data': 'goodCnt', 'width':'80px', 'render': function (data) {
                    return common.addComma(data) + "건";
                }},
            {'title': '받은 부스터', 'data': 'boosterCnt', 'width':'80px', 'render': function (data) {
                    return common.addComma(data) + "건";
                }},
        ]
        ,'comments': 'ㆍ회원이 방송을 진행하고, 청취한 기록을 확인할 수 있습니다.'
    },
    'listenDetail': {
        'url': '/rest/member/listen/list'
        , 'columns': [
            {'title': 'roomNo', 'data': 'room_no' , 'visible' : false},
            {'title': 'DJID', 'data': 'dj_userId', 'width':'100px'},
            {'title': 'DJ닉네임', 'data': 'dj_nickName', 'width':'100px'},
            {'title': '청취방주제', 'data': 'subject_type', 'width':'100px'},
            {'title': '청취방송제목', 'data': 'title', 'width':'250px', 'render': function (data, type, row, meta) {
                    return util.roomNoLink(data, row.room_no);
                }},
            {'title': '청취시작시간', 'data': 'startDateFormat', 'width':'120px'},
            {'title': '청취종료시간', 'data': 'endDateFormat', 'width':'120px'},
            {'title': '청취진행시간', 'data': 'listentime', 'width':'120px'},
            {'title': '강제퇴장', 'data': 'forcedLeave', 'width':'80px'},
            {'title': '보낸 별', 'data': 'giftByeol', 'width':'80px', 'render': function (data) {
                    return common.addComma(data) + "건";
                }},
            {'title': '보낸 좋아요', 'data': 'goodCnt', 'width':'80px', 'render': function (data) {
                    return common.addComma(data) + "건";
                }},
            {'title': '보낸 부스터', 'data': 'boosterCnt', 'width':'80px', 'render': function (data) {
                    return common.addComma(data) + "건";
                }},
        ]
        ,'comments': 'ㆍ회원이 청취한 방송기록을 확인할 수 있습니다.'
    },

    'payDetail': {
        'url': ''
        , 'columns': [
            {'title': '구분', 'data': 'type'},
            {'title': '환불가능여부', '': 'type'},
            {'title': '아이템명', 'data': 'type'},
            {'title': '결제/환불 건 수', 'data': 'type'},
            {'title': '결제/환불 수단', 'data': 'type'},
            {'title': '요청 금액', 'data': 'type'},
            {'title': '결제/환불 일시', 'data': 'type'},
            {'title': '처리 일시', 'data': 'type'},
            {'title': '처리 상태', 'data': 'type'},
            {'title': '처리자명', 'data': 'type'},
        ]
        , 'comments': 'ㆍ회원의 결제/환불 정보를 확인하고, 결제 건에 한해 구분>결제를 클릭 시 취소처리를 할 수 있습니다.'
    },

    'exchangeDetail': {
        'url': ''
        , 'columns': [
            {'title': '회원번호', 'data': 'type'},
            {'title': 'UserID', 'data': 'type'},
            {'title': '닉네임', 'data': 'type'},
            {'title': '환전요청금액', 'data': 'type'},
            {'title': '처리일시', 'data': 'type'},
            {'title': '신청 골드 금액', 'data': 'type'},
            {'title': '누적환전건수', 'data': 'type'},
            {'title': '누적완료건수', 'data': 'type'},
            {'title': '처리상태', 'data': 'type'},
            {'title': '상세보기', 'data': 'type', 'render': function (data, type, row, meta) {
                    return '<a onclick="javascript:exchangeStatus('+meta.row+')" data-toggle="modal" data-target="#myModal">' + data + '</a>'
                }},
            {'title': '처리자명', 'data': 'type'},
        ]
        , 'comments': 'ㆍ회원의 과거에서 현재까지의 환전 내역을 모두 확인하고, 증빙서류를 통한 본인확인 여부를 확인 하여 처리할 수 있습니다.<br/>ㆍ해당 처리는 CS가 아닌 별도 담당자에 의해 처리됩니다.'
    },

    'giftDetail': {
        'url': ''
        , 'columns': [
            {'title': '회원번호', 'data': 'type'},
            {'title': 'UserID', 'data': 'type'},
            {'title': 'User닉네임', 'data': 'type'},
            {'title': '구분', 'data': 'type'},
            {'title': '이미지', 'data': 'type'},
            {'title': '아이템명', 'data': 'type'},
            {'title': '보낸/받은/교환건수', 'data': 'giftCnt'},
            {'title': '선물/교환 금액', 'data': 'type'},
            {'title': '선물/교환 일시', 'data': 'type'},
        ]
        , 'comments': 'ㆍ회원이 보내고 받은 선물 내역과 달에서 별로 교환한 정보를 확인할 수 있습니다.<br>ㆍ이벤트에 당첨되어 받은 선물은 "받은선물-이벤트"로 부분되어 이벤트 당첨 - 당첨선물'
    },

    'mystar': {
        'url': '/rest/member/mystar/mystarlist'
        , 'columns': [
            {'title': 'MyStar ID', 'data': 'mem_no_start_id', 'render': function (data, type, row, meta) {
                    return util.memNoLink(data, row.mem_no_star);
                }},
            {'title': 'MyStar 닉네임', 'data': 'mem_no_start_nick'},
            {'title': '아이템보낸 건 수', 'data': 'accumCnt', 'width':'120px', 'render': function (data) {
                    return common.addComma(data) + "건";
                }},
            {'title': '보낸 달 수', 'data': 'totalItemCnt', 'width':'120px', 'render': function (data) {
                    return common.addComma(data) + "건";
                }},
            {'title': 'Mystar등록일', 'data': 'regDateFormat'},
        ]
    },

    'myfan': {
        'url': '/rest/member/mystar/myfanlist'
        , 'columns': [
            {'title': 'Fan ID', 'data': 'mem_no_fan_id', 'render': function (data, type, row, meta) {
                    return util.memNoLink(data, row.mem_no_fan);
                }},
            {'title': 'Fan 닉네임', 'data': 'mem_no_fan_nick'},
            {'title': '아이템보낸 건 수', 'data': 'accumCnt', 'width':'120px', 'render': function (data) {
                    return common.addComma(data) + "건";
                }},
            {'title': '보낸 달 수', 'data': 'totalItemCnt', 'width':'120px', 'render': function (data) {
                    return common.addComma(data) + "건";
                }},
            {'title': 'Fan 등록일', 'data': 'regDateFormat'},
        ]
    },

    'noticeDetail': {
        'url': '/rest/member/notice/list'
        , 'columns': [
            {'title': '구분', 'data': 'type','width':'100px'},
            {'title': '공지내용', 'data': 'contents','width':'200px'},
            {'title': '등록일시', 'data': 'lastUpdDateFormat','width':'100px'},
        ]
        , 'comments': 'ㆍ각 회원의 방송중 공지와 팬보드 내 연동된 공지 및 팬보드에서의 개인공지를 확인하고, 관리할 수 있습니다.'
    },

    'fanboardDetail': {
        'url': '/rest/member/fanboard/list'
        , 'columns': [
            {'title': '프로필이미지', 'data': 'image_profile', 'render' : function(data, type, row){
                    return '<img src="'+ common.profileImage(IMAGE_SERVER_URL,data,row.dj_memSex) +'" width="50px" height="50px" ' +
                        'onclick="FullSize_fanboard(this.src)"/>';
                }},
            {'title': '회원번호', 'data': 'mem_no'},
            {'title': '팬ID', 'data': 'mem_userid'},
            {'title': '팬닉네임', 'data': 'mem_nick'},
            {'title': '등록일시', 'data': 'lastUpdDateFormat'},
            {'title': '작성내용', 'data': 'contents'},
            {'title': '상태', 'data': 'status', 'render':function(data){
                    if(data == "1"){
                        return "정상";
                    }else{
                        return "삭제";
                    }
                }},
            {'title': '총 댓글 수', 'data': 'replyCnt', 'render': function (data, type, row, meta) {
                    return data + '<br/><a href="javascript://" onclick="javascript:Fanboard(' + meta.row + ');">' + "[댓글]" + '</a>'
                }},
        ]
        , 'comments': 'ㆍ회원의 팬보드 내 작성 된 팬보드에서의 작성 글 및 댓글정보를 확인할 수 있습니다.'
    },

    'banDetail': {
        'url': ''
        , 'columns': [
            {'title': '금지어', 'data': 'type'},
        ]
        , 'comments': 'ㆍ회원이 직접 100개까지 관리를 할 수 있고, 관리자에 의해 등록/수정/삭제도 할 수 없습니다.'
    },

    'declarationDetail': {
        'url': '/rest/customer/declaration/list'

        ,'columns': [
            {'title': '플랫폼', 'data': 'platform', 'name': 'sortPlatform'}
            ,{'title': '신고 구분', 'data' : 'reason', 'name' : 'sortReport', 'render': function(data) {
                    return util.getCommonCodeLabel(data, declaration_reason);
                }}
            ,{'title': '신고자 UserID', 'data': 'mem_userid', 'render': function (data, type, row) {
                    return '<a href="javascript://" class="_getDeclarationDetail" data-idx="' + row.reportIdx + '">' + data + '</a>'}}
            ,{'title': '신고자 User닉네임', 'data': 'mem_nick'}
            ,{'title': '신고 대상 UserID', 'data': 'reported_userid', 'render': function (data, type, row) {
                    return '<a href="javascript://" class="_getDeclarationDetail" data-idx="' + row.reportIdx + '">' + data + '</a>'}
                , 'defaultContent': '-'}
            ,{'title': '신고 대상 User닉네임', 'data': 'reported_nick'}
            ,{'title': '접수 일시', 'data': 'regDateFormat'}
            ,{'title': '처리 일시', 'data': 'opDateFormat', 'defaultContent':'-'}
            ,{'title': '처리 상태', 'data': 'op_code', 'name': 'slctType', 'render' : function(data) {
                    return util.getCommonCodeLabel(data, declaration_slctType);
                }}
            ,{'title': '처리자', 'data': 'opName', 'defaultContent':'-'}
        ]
        , 'comments' : ' • 최신 신고자를 기준으로 상위 구성하고, 확인하고자 하는 회원 정보 내 선택을 클릭하면 상세정보 및 회원 신고조치를 처리할 수 있습니다.'
    },

    'questionDetail': {
        'url': ''
        , 'columns': [
            {'title': '문의 구분', 'data': 'type'},
            {'title': '문의유형', 'data': 'type'},
            {'title': '문의자ID', 'data': 'type'},
            {'title': '문의자닉네임', 'data': 'type'},
            {'title': '문의 내용', 'data': 'type'},
            {'title': '접수일시/처리일시', 'data': 'type'},
            {'title': '첨부파일', 'data': 'type'},
            {'title': '처리상태', 'data': 'type'},
            {'title': '처리자', 'data': 'type'},
        ]
        , 'comments': 'ㆍ해당 회원의 1:1문의, 전화문의, 메일문의 전체내역을 리스트로 확인할 수 있습니다.'
    },

    'adminMemoList': {
        'url': '/rest/member/member/adminMemolist'
        , 'columns': [
            {'title': '등록 일시', 'data': 'regDate','width':'180px'},
            {'title': '등록 관리자', 'data': 'opName','width':'100px'},
            {'title': '운영자 메모 내용', 'data': 'memo', 'className' : 'text-left'},
        ]
    },

    'connectState': {
        'url': '/rest/member/member/connect'
        , 'columns': [
            {'title': '접속일시', 'data': 'connectDate'},
            {'title': 'App Ver', 'data': 'appVersion'},
            {'title': 'Browser', 'data': 'Browser'},
            {'title': 'Device', 'data': 'Device'},
            {'title': 'Mobile Device ID', 'data': 'deviceUUID'},
            {'title': 'Mobile AD ID', 'data': 'adID'},
            {'title': 'IP 주소', 'data': 'ip'},
        ]
        , 'comments': 'ㆍ회원의 가입일부터 현재까지의 접속 기록을 확인할 수 있습니다.'
    },

    'manager': {
        'url': '/rest/member/member/managerList'
        , 'columns': [
            {'title': '회원번호', 'data': 'mem_no'},
            {'title': 'User ID', 'data': 'mem_userid'},
            {'title': 'User 닉네임', 'data': 'mem_nick'},
            {'title': '권한부여 일시', 'data': 'regDate'},
            {'title': '선물', 'data': 'gift'},
        ]
        , 'comments': 'ㆍ마이페이지 내 매니저 임명 변동사항을 확인할 수 있습니다. <br>ㆍ아래 정보는 현재 권한을 갖은 매니저 리스트이고, 매니저 권한은 최대 10명까지 가능합니다.'
    },
    'meManager': {
        'url': '/rest/member/member/managerList'
        , 'columns': [
            {'title': '회원번호', 'data': 'mem_no'},
            {'title': 'User ID', 'data': 'mem_userid'},
            {'title': 'User 닉네임', 'data': 'mem_nick'},
            {'title': '권한부여 일시', 'data': 'regDate'},
            {'title': '선물', 'data': 'gift'},
        ]
        , 'comments': 'ㆍ나를 매니저로 등록한 DJ정보 입니다.'
    },

    'black': {
        'url': '/rest/member/member/blackList'
        , 'columns': [
            {'title': '회원번호', 'data': 'mem_no'},
            {'title': 'User ID', 'data': 'mem_userid'},
            {'title': 'User 닉네임', 'data': 'mem_nick'},
            {'title': '권한부여 일시', 'data': 'regDate'},
            {'title': '선물', 'data': 'gift'},
        ]
        , 'comments': 'ㆍ마이페이지 내 블랙리스트로 등록한 회원 정보를 확인할 수 있습니다.'
    },
    'meBlack': {
        'url': '/rest/member/member/blackList'
        , 'columns': [
            {'title': '회원번호', 'data': 'mem_no'},
            {'title': 'User ID', 'data': 'mem_userid'},
            {'title': 'User 닉네임', 'data': 'mem_nick'},
            {'title': '권한부여 일시', 'data': 'regDate'},
            {'title': '선물', 'data': 'gift'},
        ]
        , 'comments': 'ㆍ나를 블랙리스트로 등록한 DJ정보 입니다. <br/>ㆍ해당 정보는 운영관리를 위한 정보입니다. 따라서, 회원에게 보이거나 알려주어서는 안됩니다.'
    },

    'editHistory': {
        'url': ''
        , 'columns': [
            {'title': '정보 수정일시', 'data': 'type'},
            {'title': '수정 처리 내역', 'data': 'type'},
            {'title': '처리자명', 'data': 'type'},
        ]
        , 'comments': 'ㆍ회원 또는 운영자에 의해 정보가 수정된 일시를 확인할 수 있습니다.'
    },
}
