var MemberDataTableSource = {
    'userInfo': {
        'url': '/rest/member/member/list'
        , 'columns': [
            {'title': '회원번호', 'data': 'mem_no', 'width':'100px'},
             {'title': 'UserID', 'data': 'mem_userid', 'width':'100px', 'render': function (data, type, row, meta) {
                    return '<a href="javascript://" class="getMemberDetail" onclick="javascript:getMemNo_info('+meta.row+');">' + data + '</a>'
                }},
             {'title': '닉네임', 'data': 'mem_nick', 'width':'200px'},
             {'title': '연락처', 'data': 'mem_phone', 'width':'100px'},
             {'title': '가입플랫폼', 'data': 'mem_slct', 'width':'100px'},
             {'title': '회원가입일시', 'data': 'joinDate', 'width':'100px'},
             {'title': '최근 접속 일시', 'data': 'last_connect_date', 'width':'100px'},
             {'title': '누적 접속 수', 'data': 'connectCnt', 'width':'100px'},
             {'title': '결제 건 수/금액', 'data': 'payCntAmount', 'width':'100px'},
             {'title': '회원상태', 'data': 'mem_state',  'width':'100px'},
             {'title': '접속상태', 'data': 'connectState', 'width':'100px'},
             {'title': '방송상태', 'data': 'liveBroad', 'width':'100px'},
        ]
        , 'comments': 'ㆍ회원 아이디를 클릭하시면 상세정보를 확인할 수 있습니다.'
    },

    'broadDetail': {
        'url': '/rest/member/broadcast/list'
        , 'columns': [
            {'title': 'roomNo', 'data': 'roomNo' , 'visible' : false},
            {'title': 'state', 'data': 'state', 'visible' : false},
            {'title': 'status', 'data': 'status'},
            {'title': '방송주제', 'data': 'subjectType', 'width':'100px'},
            {'title': '방송제목', 'data': 'title', 'width':'250px', 'render': function (data, type, row, meta) {
                    return util.roomNoLink(data, row.roomNo, row.state);
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
        'url': '/rest/member/report/list'
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
        'url': '/rest/member/report/list'
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
        'url': '/rest/member/report/list'
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
        'url': '/rest/member/report/list'
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
        'url': '/rest/member/report/list'
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
        'url': '/rest/member/report/list'
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
        'url': '/rest/member/report/list'
        , 'columns': [
            {'title': '프로필이미지', 'data': 'memNo'},
            {'title': '회원번호', 'data': 'memNo'},
            {'title': '팬ID', 'data': 'memNo'},
            {'title': '팬닉네임', 'data': 'memNo'},
            {'title': '등록일시', 'data': 'memNo'},
            {'title': '작성내용', 'data': 'memNo'},
            {'title': '총 댓글 수', 'data': 'memNo', 'render': function (data, type, row, meta) {
                    return data + '<br/><a href="javascript://" onclick="javascript:Fanbord(' + meta.row + ');" data-toggle="modal" data-target="#myModal">' + "[댓글]" + '</a>'
                }},
        ]
        , 'comments': 'ㆍ회원의 팬보드 내 작성 된 팬보드에서의 작성 글 및 댓글정보를 확인할 수 있습니다.'
    },

    'banDetail': {
        'url': '/rest/member/report/list'
        , 'columns': [
            {'title': '금지어', 'data': 'type'},
        ]
        , 'comments': 'ㆍ회원이 직접 100개까지 관리를 할 수 있고, 관리자에 의해 등록/수정/삭제도 할 수 없습니다.'
    },

    'reportDetail': {
        'url': '/rest/customer/declaration/list'
        , 'columns': [
            {'title': '플랫폼', 'data': 'platform', 'name': 'sortPlat'}
            ,{'title': '신고 구분', 'data' : 'reason', 'name' : 'sortReport', 'render': function(data) {
                    return util.getCommonCodeLabel(data, declaration_reason);
                }}
            ,{'title': '신고자 UserID', 'data': 'mem_id', 'render': function (data, type, row) {
                    return '<a href="javascript://" class="Report" data-idx="' + row.reportIdx + '">' + data + '</a>'}}
            ,{'title': '신고 대상 UserID', 'data': 'reported_mem_id', 'render': function (data, type, row) {
                    return '<a href="javascript://" class="Report" data-idx="' + row.reportIdx + '">' + data + '</a>'}
            }
            ,{'title': '신고 대상 User닉네임', 'data': 'reported_mem_nick'}
            ,{'title': '접수 일시', 'data': 'regDate'}
            ,{'title': '처리 일시', 'data': 'opDate', 'defaultContent':'-'}
            ,{'title': '처리 상태', 'data': 'status', 'name': 'slctType', 'render' : function(data) {
                    return util.getCommonCodeLabel(data, declaration_slctType)
                }}
            ,{'title': '처리자', 'data': 'opName', 'defaultContent':'-'}
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
        , 'comments': 'ㆍ회원의 가입일부터 현재까지의 접속 기록을 확인할 수 있습니다.'
    },


    'adminMemoList': {
        'url': '/rest/member/member/adminMemolist'
        , 'columns': [
            {'title': '등록 일시', 'data': 'regDate','width':'180px'},
            {'title': '등록 관리자', 'data': 'opName','width':'100px'},
            {'title': '운영자 메모 내용', 'data': 'memo', 'textAlign': 'left'},
        ]
    },

    'myManager': {
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
        , 'comments': 'ㆍ마이페이지 내 매니저 임명 변동사항을 확인할 수 있습니다. <br>ㆍ아래 정보는 현재 권한을 갖은 매니저 리스트이고, 매니저 권한은 최대 10명까지 가능합니다.'
    },
    'meManager': {
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
        , 'comments': 'ㆍ나를 매니저로 등록한 DJ정보 입니다.'
    },

    'myBlack': {
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
        , 'comments': 'ㆍ마이페이지 내 블랙리스트로 등록한 회원 정보를 확인할 수 있습니다.'
    },
    'meBlack': {
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
        , 'comments': 'ㆍ나를 블랙리스트로 등록한 DJ정보 입니다. <br/>ㆍ해당 정보는 운영관리를 위한 정보입니다. 따라서, 회원에게 보이거나 알려주어서는 안됩니다.'
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
            {'title': '미처리', 'data': 'type','defaultContent': ''},
            {'title': '누적 처리 건', 'data': 'type','defaultContent': ''},
            {'title': '조치내역', 'data': 'type','width':'400px','defaultContent': ''},
            {'title': '전화문의/처리', 'data': 'type','defaultContent': ''},
        ]
    },
    'question_top': {
        'url': '/rest/member/report/list'
        , 'columns': [
            {'title': '총 1:1문의', 'data': 'type','defaultContent': ''},
            {'title': '회원정보', 'data': 'type','defaultContent': ''},
            {'title': '방송정보', 'data': 'type','defaultContent': ''},
            {'title': '청취하기', 'data': 'type','defaultContent': ''},
            {'title': '결제', 'data': 'type','defaultContent': ''},
            {'title': '건의하기', 'data': 'type','defaultContent': ''},
            {'title': '장애/버그', 'data': 'type','defaultContent': ''},
            {'title': '선물/아이템', 'data': 'type','defaultContent': ''},
            {'title': '기타', 'data': 'type','defaultContent': ''},
            {'title': '전화문의', 'data': 'type','defaultContent': ''},
            {'title': '메일문의', 'data': 'type','defaultContent': ''},
        ]
    },
}
