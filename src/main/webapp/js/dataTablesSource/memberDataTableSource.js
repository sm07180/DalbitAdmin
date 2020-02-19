var MemberDataTableSource = {
    'userInfo': {
        'url': '/rest/member/member/list'
        , 'columns': [
            {'title': 'memNo', 'data': 'memNo', 'visible' : false}
            , {'title': 'UserID', 'data': 'memId', 'render': function (data, type, row, meta) {
                    return '<a href="javascript://" onclick="javascript:getMemNo_info('+meta.row+');">' + data + '</a>'
                }}
            , {'title': '닉네임', 'data': 'memNick'}
            , {'title': '이름', 'data': 'memName'}
            , {'title': '연락처', 'data': 'memPhone'}
            , {'title': '가입플랫폼', 'data': 'memSlct'}
            , {'title': '접속상태', 'data': 'Login_out', 'defaultContent': '로그아웃'}
            , {'title': '생방상태', 'data': 'Live', 'defaultContent': '퇴근'}
        ]
    },

    'broadHistory': {
        'url': '/rest/member/broadcast/list'
        , 'columns': [
            {'title': 'roomNo', 'data': 'roomNo', 'visible' : false},
            {'title': '방송주제', 'data': 'subjectType'},
            {'title': '방송제목', 'data': 'title', 'render': function (data, type, row, meta) {
                    return '<a href="javascript://" onclick="javascript:Broad('+meta.row+');">' + data + '</a>'
                }},
            {'title': '방송시작시간', 'data': 'startDate'},
            {'title': '방송종료시간', 'data': 'endDate'},
            {'title': '방송진행시간', 'data': 'airtime'},
            {'title': '종료시평균청취자수', 'data': 'listener'},
            {'title': '받은좋아요수', 'data': 'good'},
            {'title': '받은아이템수', 'data': 'gold'}
        ]
        , 'title': '방송기록'
        , 'comments': 'ㆍ회원이 방송을 진행하고, 청취한 과거기록을 확인할 수 있습니다.'
    },

    'listenHistory': {
        'url': '/rest/member/listen/list'
        , 'columns': [
            {'title': 'roomNo', 'data': 'roomNo' , 'visible' : false},
            {'title': '청취방주제', 'data': 'subjectType'},
            {'title': '청취방송제목', 'data': 'title', 'render': function (data, type, row, meta) {
                    return '<a href="javascript://" onclick="javascript:Listen('+meta.row+')">' + data + '</a>'
                }},
            {'title': '청취시작시간', 'data': 'startDate'},
            {'title': '청취종료시간', 'data': 'endDate'},
            {'title': '청취진행시간', 'data': 'listenTime'},
            {'title': 'DJID', 'data': 'memId'},
            {'title': 'DJ닉네임', 'data': 'memNick'},
            {'title': '보낸좋아요수', 'data': 'like'},
            {'title': '보낸아이템수', 'data': 'ruby'}
        ]
        , 'title': '청취기록'
        , 'comments': 'ㆍ회원이 방송을 청취한 과거기록을 확인할 수 있습니다.'
    },

    'payHistory': {
        'url': '/rest/member/pay/list'
        , 'columns': [
            {'title': '구분', 'data': '' , 'defaultContent': ''},
            {'title': '아이템사용유무', '': '', 'defaultContent': ''},
            {'title': '아이템명', 'data': '', 'defaultContent': ''},
            {'title': '환불건수', 'data': '', 'defaultContent': ''},
            {'title': '환불수단', 'data': ' ', 'defaultContent': ''},
            {'title': '요청금액', 'data': '', 'defaultContent': ''},
            {'title': '환불일시', 'data': '', 'defaultContent': ''},
            {'title': '처리일시', 'data': '', 'defaultContent': ''},
            {'title': '처리상태', 'data': '', 'defaultContent': ''},
            {'title': '처리자ID', 'data': '', 'defaultContent': ''}
        ]
        , 'title': '결제/환불정보'
        , 'comments': '회원의 결제정보를확인하고 결제 취소처리를 할 수 있습니다.'
    },

    'giftHistory': {
        'url': '/rest/member/gift/list'
        , 'columns': [
            {'title': '구분', 'data': '', 'defaultContent': ''},
            {'title': '아이템명', 'data': '', 'defaultContent': ''},
            {'title': '보낸/받은/교환건수', '': 'giftCnt', 'defaultContent': ''},
            {'title': '교환/선물금액', 'data': '', 'defaultContent': ''},
            {'title': '교환/선물일시', 'data': '', 'defaultContent': ''},
            {'title': 'UserID', 'data': '', 'defaultContent': ''},
            {'title': 'User닉네임', 'data': '', 'defaultContent': ''},
            {'title': '처리자ID', 'data': '', 'defaultContent': ''},
        ]
        , 'title': '교환/선물정보'
        , 'comments': 'ㆍ회원이 달에서 별로 교환한 정보를 확인하고, 보내고 받은 선물 내역을 확인할 수 있습니다.ㆍ이벤트 당첨선물로 제공되어 처리된 사안일 경우 처리직원ID로 표기됩니다.'
    },

    'exchangeHistory': {
        'url': '/rest/member/exchange/list'
        , 'columns': [
            {'title': '보유골드수', 'data': '', 'defaultContent': ''},
            {'title': '환전요청건수', 'data': '', 'defaultContent': ''},
            {'title': '환전요청금액', 'data': '', 'defaultContent': ''},
            {'title': '환전신청일', 'data': '', 'defaultContent': ''},
            {'title': '환전처리일', 'data': '', 'defaultContent': ''},
            {'title': '증빙서류확인', 'data': '', 'defaultContent': ''},
            {'title': '본인확인', 'data': '', 'defaultContent': ''},
            {'title': '환전상태', 'data': '', 'defaultContent': ''},
            {'title': '처리자ID', 'data': '', 'defaultContent': ''},
        ]
        , 'title': '개인환불정보'
        , 'comments': 'ㆍ회원의 과거에서 현재까지의 환전 내역을 모두 확인하고, 증빙서류를 확인한 후 즉시 처리할 수 있습니다.'
    },

    'platformHistory': {
        'url': '/rest/member/platform/list'
        , 'columns': [
            {'title': '접속일시', 'data': '', 'defaultContent': ''},
            {'title': 'OS환경', 'data': '', 'defaultContent': ''},
            {'title': 'AppVer', 'data': '', 'defaultContent': ''},
            {'title': 'Browser', 'data': '', 'defaultContent': ''},
            {'title': 'Device', 'data': '', 'defaultContent': ''},
            {'title': 'MobileDeviceID', 'data': '', 'defaultContent': ''},
            {'title': 'MobileADID', 'data': '', 'defaultContent': ''},
            {'title': 'IP주소', 'data': '', 'defaultContent': ''},
        ]
        , 'title': '회원 접속 기록'
        , 'comments': 'ㆍ회원의 가입일로부터의 접속 기록을 확인할 수 있습니다.'
    },

    'myStarHistory': {
        'url': '/rest/member/myStar/list'
        , 'columns': [
            {'title': 'memNo', 'data': 'memNo', 'visible' : false},
            {'title': 'MyStarID', 'data': 'memId', 'render': function (data, type, row, meta) {
                    return '<a href="javascript://" onclick="javascript:MyStar('+meta.row+');">' + data + '</a>'
                }},
            {'title': 'MyStar닉네임', 'data': 'memNick'},
            {'title': '보낸건수', 'data': 'tmp1'},
            {'title': '보낸개수', 'data': 'tmp2'},
            {'title': '등록일시', 'data': 'regDate'},
            {'title': '해제일시', 'data': 'tmp3'}
        ]
        , 'title': 'MyStar 정보'
        , 'comments': 'ㆍMyStar 회원 리스트를 확인하고 등록/삭제 할 수 있습니다.'
    },

    'myFanHistory': {
        'url': '/rest/member/fan/list'
        , 'columns': [
            {'title': 'memNo', 'data': 'memNo', 'visible' : false},
            {'title': 'FanID', 'data': 'memId', 'render': function (data, type, row, meta) {
                    return '<a href="javascript://" onclick="javascript:Fan('+meta.row+');">' + data + '</a>'
                }},
            {'title': 'Fan닉네임', 'data': 'memNick'},
            {'title': '보낸건수', 'data': 'tmp1'},
            {'title': '보낸개수', 'data': 'tmp2'},
            {'title': '등록일시', 'data': 'regDate'},
            {'title': '해제일시', 'data': 'tmp3'}
        ]
        , 'title': 'Fan 정보'
        , 'comments': 'ㆍFan으로 등록한 회원들의 리스트를 확인하고 등록/삭제 할 수 있습니다.'
    },

    'noticeHistory': {
        'url': '/rest/member/notice/list'
        , 'columns': [
            {'title': 'roomNo', 'data': 'roomNo', 'visible' : false},
            {'title': '구분', 'data': 'type'},
            {'title': '방송제목', 'data': 'title', 'render': function (data, type, row, meta) {
                    return '<a href="javascript://" onclick="javascript:Notice('+meta.row+');">' + data + '</a>'
                }},
            {'title': '공지내용', 'data': 'notice'},
            {'title': '등록일시', 'data': 'lastUpdDate'}
        ]
        , 'title': '개별/방송 중 공지'
        , 'comments': 'ㆍ각 회원의 방송중 공지와 팬보드 내 연동된 공지 및 팬보드에서의 개인공지를 확인하고, 관리할 수 있습니다.'
    },

    'reportHistory': {
        'url': '/rest/member/report/list'
        , 'columns': [
            {'title': 'idx', 'data': 'idx', 'visible' : false},
            {'title': '플랫폼구분', 'data': 'platform'},
            {'title': '문의구분', 'data': 'type'},
            {'title': '신고UserId', 'data': 'reportId'},
            {'title': '신고대상UserID', 'data': 'reportMemId'},
            {'title': '신고내용', 'data': 'etc', 'render': function (data, type, row, meta) {

                    return '<a href="javascript://" onclick="javascript:Report('+meta.row+');">' + data + '</a>'
                }},
            {'title': '접수일시', 'data': 'lastUpdDate'},
            {'title': '처리일시', 'data': 'deployDate'},
            {'title': '처리상태', 'data': 'status'},
            {'title': '처리자', 'data': 'deployUser'}
        ]
        , 'title': '신고 처리 정보'
        , 'comments': 'ㆍ회원이 신고하고, 신고당한 정보를 한눈에 확인할 수 있습니다.'
    },

    'responseHistory': {
        'url': '/rest/member/response/list'
        , 'columns': [
            {'title': '플랫폼구분', 'data': '', 'defaultContent': ''},
            {'title': '문의구분', 'data': '', 'defaultContent': ''},
            {'title': '문의UserID', 'data': '', 'defaultContent': ''},
            {'title': '문의대상UserID', 'data': '', 'defaultContent': ''},
            {'title': '문의 제목', 'data': '', 'defaultContent': ''},
            {'title': '접수일시/처리일시', 'data': '', 'defaultContent': ''},
            {'title': '첨부파일', 'data': '', 'defaultContent': ''},
            {'title': '처리상태', 'data': '', 'defaultContent': ''},
            {'title': '처리자', 'data': '', 'defaultContent': ''},
        ]
        , 'title': '1:1 문의 정보'
        , 'comments': 'ㆍ1:1문의 또는 전화로 문의한 내용의 세부 정보를 확인할 수 있도록 연동 되어있습니다.'
    },

    'editDateHistory': {
        'url': '/rest/member/editdate/list'
        , 'columns': [
            {'title': '정보수정일시', 'data': '', 'defaultContent': ''},
            {'title': '수정세부내용', 'data': '', 'defaultContent': ''},
            {'title': '수정처리자', 'data': '', 'defaultContent': ''},
        ]
        , 'title': '정보수정 내역'
        , 'comments': 'ㆍ회원 또는 운영자에 의해 정보가 수정된 일시를 확인할 수 있습니다.'
    }
}
