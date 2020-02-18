var SampleDataTableSource = {
    'userInfo': {
        'url': '/rest/member/member/list'

        ,'columns': [
            {'title': '회원번호', 'data': 'memNo'}
            ,{'title': 'UserID', 'data': 'memId', 'render': function (data, type, row, meta) {
                    return '<a href="javascript://" onclick="javascript:getMemNo_info(this.id);" id="' + row.memNo + '">' + data + '</a>'
                }
            }
            ,{'title': '닉네임', 'data': 'memNick'}
            ,{'title': '이름', 'data': 'memName'}
            ,{'title': '연락처', 'data': 'memPhone'}
            ,{'title': '가입플랫폼', 'data': 'memSlct'}
            ,{'title': '접속상태', 'data': 'Login_out', 'defaultContent': '로그아웃'}
            ,{'title': '생방상태', 'data': 'Live', 'defaultContent': '퇴근'}
        ]
    },

    'broadHistory': {
        'url': '/rest/member/broadcast/list'

        ,'columns': [
            {'title': '방송주제', 'data': 'subjectType'}
            ,{'title': '방송제목', 'data': 'title'}
            ,{'title': '방송시작시간', 'data': 'startDate'}
            ,{'title': '방송종료시간', 'data': 'endDate'}
            ,{'title': '방송진행시간', 'data': 'airtime'}
            ,{'title': '종료시 평균 청취자 수', 'data': 'listener'}
            ,{'title': '받은 좋아요 수', 'data': 'good'}
            ,{'title': '받은 아이템 수', 'data': 'gold'}
        ]

        ,'title': '청취기록'
        ,'comments': '회원이 방송을 청취한 과거기록을 확인할 수 있습니다.'
    },

    'listenHistory':{
        'url': '/rest/member/listen/list'

        ,'columns': [
            { 'title': '청취방주제', 'data': 'subjectType' }
            ,{ 'title': '청취 방송제목', 'data': 'title' }
            ,{ 'title': '청취시작시간', 'data': 'startDate' }
            ,{ 'title': '청취종료시간', 'data': 'endDate' }
            ,{ 'title': '청취진행시간', 'data': 'listenTime' }
            ,{ 'title': '받은 루비 개수', 'data': 'giftRuby' }
            ,{ 'title': '청취 DJ 닉네임', 'data': 'memNick' }
        ]

        ,'title': '결제/환불정보'
        ,'comments': '회원의 결제정보를확인하고 결제 취소처리를 할 수 있습니다.'
    }
}
