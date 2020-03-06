var MemberDataTableSource = {
    'userInfo': {
        'url': '/rest/member/member/list'
        , 'columns': [
            {'title': 'memNo', 'data': 'memNo', 'visible' : false},
             {'title': 'UserID', 'data': 'memId', 'width':'100px', 'render': function (data, type, row, meta) {
                    return '<a href="javascript://" onclick="javascript:getMemNo_info('+meta.row+');">' + data + '</a>'
                }},
             {'title': '닉네임', 'data': 'memNick', 'width':'200px'},
             {'title': '이름', 'data': 'memName', 'width':'100px'},
             {'title': '연락처', 'data': 'memPhone', 'width':'100px'},
             {'title': '가입플랫폼', 'data': 'memSlct', 'width':'100px'},
             {'title': '접속상태', 'data': 'Login_out', 'defaultContent': '로그아웃', 'width':'100px'},
             {'title': '생방상태', 'data': 'Live', 'defaultContent': '퇴근', 'width':'100px'},
        ]
        , 'comments': 'ㆍ회원 아이디를 클릭하시면 상세정보를 확인할 수 있습니다.'
    },

    'broadDetail': {
        'url': '/rest/member/broadcast/list'
        , 'columns': [
            {'title': 'roomNo', 'data': 'roomNo' , 'visible' : false},
            {'title': 'status', 'data': 'status', 'visible' : false},
            {'title': 'statusNm', 'data': 'statusNm'},
            {'title': '방송주제', 'data': 'subjectType', 'width':'100px'},
            {'title': '방송제목', 'data': 'title', 'width':'250px', 'render': function (data, type, row, meta) {
                    // return '<a href="javascript://" onclick="javascript:Broad('+meta.row+');">' + data + '</a>'
                    return roomNoLink(data, row.roomNo, row.status);
                }},
            {'title': '방송시작시간', 'data': 'startDate', 'width':'120px'},
            {'title': '방송종료시간', 'data': 'endDate', 'width':'120px'},
            {'title': '방송진행시간', 'data': 'airtime', 'width':'100px'},
            {'title': '청취자', 'data': 'listener', 'width':'80px'},
            {'title': '누적청취자', 'data': 'listener', 'width':'80px'},
            {'title': '받은좋아요', 'data': 'good', 'width':'80px'},
            {'title': '받은선물', 'data': 'like', 'width':'80px'},
        ]
        ,'comments': 'ㆍ회원이 방송을 진행하고, 청취한 기록을 확인할 수 있습니다.'
    },
    'listenDetail': {
        'url': '/rest/member/listen/list'
        , 'columns': [
            {'title': 'roomNo', 'data': 'roomNo' , 'visible' : false},
            {'title': '회원번호', 'data': 'memId', 'width':'100px'},
            {'title': 'DJID', 'data': 'memId', 'width':'100px'},
            {'title': 'DJ닉네임', 'data': 'memNick', 'width':'100px'},
            {'title': '청취방주제', 'data': 'subjectType', 'width':'100px'},
            {'title': '청취방송제목', 'data': 'title', 'width':'250px', 'render': function (data, type, row, meta) {
                    return '<a href="javascript://" onclick="javascript:Listen('+meta.row+')">' + data + '</a>'
                }},
            {'title': '최초 청취시작시간', 'data': 'startDate', 'width':'120px'},
            {'title': '청취종료시간', 'data': 'endDate', 'width':'120px'},
            {'title': '청취진행시간', 'data': 'listenTime', 'width':'100px'},
        ]
        ,'comments': 'ㆍ회원이 청취한 방송기록을 확인할 수 있습니다.'
    },

    'payDetail': {
        'url': '/rest/member/pay/list'
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
        'url': '/rest/member/exchange/list'
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
        'url': '/rest/member/gift/list'
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

    'mystarDetail': {
        'url': '/rest/member/myStar/list'
        , 'columns': [
            {'title': '회원번호', 'data': 'memNo'},
            {'title': '마이스타ID', 'data': 'memId', 'render': function (data, type, row, meta) {
                    return '<a href="javascript://" onclick="javascript:Mystar('+meta.row+');">' + data + '</a>'
                }},
            {'title': '마이스타 닉네임', 'data': 'memNick'},
            {'title': '아이템보낸건수', 'data': 'tmp1'},
            {'title': '아이템보낸개수', 'data': 'tmp2'},
            {'title': 'FanID', 'data': 'tmp2'},
            {'title': 'Fan닉네임', 'data': 'tmp2'},
            {'title': '받은 선물 건 수', 'data': 'regDate'},
            {'title': '받은 선물 금액', 'data': 'tmp3'}
        ]
        , 'comments': 'ㆍMyStar : 내가 Fan으로 등록하거나, 방송 중 선물을 보낸 회원입니다.<br>ㆍFan: 타 회원이 Fan으로 등록하면 해당회원이 MyStar 가 됩니다.'
    },

    'noticeDetail': {
        'url': '/rest/member/notice/list'
        , 'columns': [
            {'title': '구분', 'data': 'type','width':'100px'},
            {'title': '방송제목', 'data': 'title','width':'250px', 'render': function (data, type, row, meta) {
                    return '<a href="javascript://" onclick="javascript:Notice('+meta.row+');">' + data + '</a>'
                }},
            {'title': '공지내용', 'data': 'notice','width':'200px'},
            {'title': '등록일시', 'data': 'lastUpdDate','width':'100px'},
        ]
        , 'comments': 'ㆍ각 회원의 방송중 공지와 팬보드 내 연동된 공지 및 팬보드에서의 개인공지를 확인하고, 관리할 수 있습니다.'
    },

    'fanbordDetail': {
        'url': '/rest/member/gift/list'
        , 'columns': [
            {'title': '프로필이미지', 'data': 'memNo'},
            {'title': '회원번호', 'data': 'memNo'},
            {'title': '팬ID', 'data': 'memNo'},
            {'title': '팬닉네임', 'data': 'memNo'},
            {'title': '등록일시', 'data': 'memNo'},
            {'title': '작성내용', 'data': 'memNo'},
            {'title': '총 댓글 수', 'data': 'memNo'},
        ]
        , 'comments': 'ㆍ회원의 팬보드 내 작성 된 팬보드에서의 작성 글 및 댓글정보를 확인할 수 있습니다.'
    },

    'banDetail': {
        'url': '/rest/member/gift/list'
        , 'columns': [
            {'title': '금지어', 'data': 'type'},
        ]
        , 'comments': 'ㆍ회원이 직접 100개까지 관리를 할 수 있고, 관리자에 의해 등록/수정/삭제도 할 수 없습니다.'
    },

    'reportDetail': {
        'url': '/rest/member/exchange/list'
        , 'columns': [
            {'title': 'idx', 'data': 'idx', 'visible' : false},
            {'title': '문의구분', 'data': 'type'},
            {'title': '신고구분', 'data': 'type'},
            {'title': '신고Id', 'data': 'reportId'},
            {'title': '신고자닉네임', 'data': 'reportMemId'},
            {'title': '신고대상Id', 'data': 'reportId'},
            {'title': '신고대상닉네임', 'data': 'reportMemId'},
            {'title': '접수일시', 'data': 'lastUpdDate'},
            {'title': '처리일시', 'data': 'deployDate'},
            {'title': '처리상태', 'data': 'status'},
            {'title': '처리자', 'data': 'deployUser'},
            {'title': '처리상태', 'data': 'etc', 'render': function (data, type, row, meta) {
                    return '<a href="javascript://" onclick="javascript:Report('+meta.row+');">' + data + '</a>'
                }},
        ]
        , 'comments': 'ㆍ회원이 신고하고, 신고 당한 정보를 한눈에 확인할 수 있습니다.'
    },
    'questionDetail': {
        'url': '/rest/member/report/list'
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


    'loginStatus': {
        'url': '/rest/member/report/list'
        , 'columns': [
            {'title': '접속일시', 'data': 'type'},
            {'title': 'OS환경', 'data': 'type'},
            {'title': 'App Ver', 'data': 'type'},
            {'title': 'Browser', 'data': 'type'},
            {'title': 'Device', 'data': 'type'},
            {'title': 'Mobile Device ID', 'data': 'type'},
            {'title': 'Mobile AD ID', 'data': 'type'},
            {'title': 'IP 주소', 'data': 'type'},
        ]
        // , 'comments': 'ㆍ문의 제목을 클릭하시면 세부 정보를 확인 및 답변, 수정할 수 있습니다.'
    },

    'manager': {
        'url': '/rest/member/report/list'
        , 'columns': [
            {'title': '회원번호', 'data': 'type'},
            {'title': 'User ID', 'data': 'type'},
            {'title': 'User 닉네임', 'data': 'type'},
            {'title': '청취 시작 일시', 'data': 'type'},
            {'title': '청취 종료 일시', 'data': 'type'},
            {'title': '임명 일시', 'data': 'type'},
            {'title': '해제 일시', 'data': 'type'},
            {'title': '임명상태', 'data': 'type'},
        ]
        , 'comments': 'ㆍ마이페이지 내 매니저 임명 변동사항을 확인할 수 있습니다. <br>ㆍ매니저 권한은 최대 10명까지 가능합니다.'
    },

    'black': {
        'url': '/rest/member/report/list'
        , 'columns': [
            {'title': '회원번호', 'data': 'type'},
            {'title': 'User ID', 'data': 'type'},
            {'title': 'User 닉네임', 'data': 'type'},
            {'title': '선물 건 수', 'data': 'type'},
            {'title': '보유 결제금액', 'data': 'type'},
            {'title': '등록 일시', 'data': 'type'},
            {'title': '해제 일시', 'data': 'type'},
        ]
        , 'comments': 'ㆍ회원이 블랙리스트로 등록/해제한 내역을 확인할 수 있습니다.'
    },

    'editHistory': {
        'url': '/rest/member/report/list'
        , 'columns': [
            {'title': '정보 수정일시', 'data': 'type'},
            {'title': '수정 처리 내역', 'data': 'type'},
            {'title': '처리자명', 'data': 'type'},
        ]
        , 'comments': 'ㆍ회원 또는 운영자에 의해 정보가 수정된 일시를 확인할 수 있습니다.'
    },


    'broad_top': {
        'url': '/rest/member/report/list'
        , 'columns': [
            {'title': '총 청취자', 'data': 'type'},
            {'title': '총 선물 주고/받음', 'data': 'type'},
            {'title': '총 받은 별', 'data': 'type'},
            {'title': '총 받은 좋아요', 'data': 'type'},
            {'title': '총 받은 부스터', 'data': 'type'},
        ]
    },
    'listen_top': {
        'url': '/rest/member/report/list'
        , 'columns': [
            {'title': '총 강제퇴장', 'data': 'type'},
            {'title': '총 보낸 별', 'data': 'type'},
            {'title': '총 좋아요', 'data': 'type'},
            {'title': '총 부스터', 'data': 'type'},
        ]
    },
    'exchange_top': {
        'url': '/rest/member/report/list'
        , 'columns': [
            {'title': '환전 총 건 수', 'data': 'type'},
            {'title': '환전 골드 총 금액', 'data': 'type'},
        ]
    },
    'report_top': {
        'url': '/rest/member/report/list'
        , 'columns': [
            {'title': '미처리', 'data': 'type'},
            {'title': '누적 처리 건', 'data': 'type'},
            {'title': '조치내역', 'data': 'type','width':'400px'},
            {'title': '전화문의/처리', 'data': 'type'},
        ]
    },
    'question_top': {
        'url': '/rest/member/report/list'
        , 'columns': [
            {'title': '총 1:1문의', 'data': 'type'},
            {'title': '회원정보', 'data': 'type'},
            {'title': '방송정보', 'data': 'type'},
            {'title': '청취하기', 'data': 'type'},
            {'title': '결제', 'data': 'type'},
            {'title': '건의하기', 'data': 'type'},
            {'title': '장애/버그', 'data': 'type'},
            {'title': '선물/아이템', 'data': 'type'},
            {'title': '기타', 'data': 'type'},
            {'title': '전화문의', 'data': 'type'},
            {'title': '메일문의', 'data': 'type'},
        ]
    },
}
