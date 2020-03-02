var BroadcastDataTableSource = {
    'listenDetail': {
        'url': '/rest/member/report/list'
        , 'columns': [
            {'title': '구분', 'data': '', 'defaultContent': ''},
            {'title': '회원번호', 'data': '', 'defaultContent': ''},
            {'title': 'User ID', 'data': '', 'defaultContent': ''},
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
        , 'comments': '방송 중 (게스트와 매니저를 포함한)청취자 변동사항을 확인할 수 있습니다.<br> 청취자 리스트는 방송 Live상태 내에서의 데이터로 방송 입퇴장 정보를 포함합니다.'
    },

    'likeDetail': {
        'url': '/rest/member/report/list'
        , 'columns': [
            {'title': '회원번호', 'data': '', 'defaultContent': ''},
            {'title': '보낸 User Id', 'data': '', 'defaultContent': ''},
            {'title': '보낸 User 닉네임', 'data': '', 'defaultContent': ''},
            {'title': '보낸 일시', 'data': '', 'defaultContent': ''},
            {'title': '보낸 좋아요', 'data': '', 'defaultContent': ''},
            {'title': '보낸 부스터', 'data': '', 'defaultContent': ''},
            {'title': '적용완료 일시', 'data': '', 'defaultContent': ''},
        ]
        , 'comments': '방송 중 좋아요와 부스터 적용상태를 확인할 수 있습니다.'
    },

    'giftDetail': {
        'url': '/rest/member/report/list'
        , 'columns': [
            {'title': '회원번호', 'data': '', 'defaultContent': ''},
            {'title': '보낸 User ID', 'data': '', 'defaultContent': ''},
            {'title': '보낸 User 닉네임', 'data': '', 'defaultContent': ''},
            {'title': '보낸 일시', 'data': '', 'defaultContent': ''},
            {'title': '이미지', 'data': '', 'defaultContent': ''},
            {'title': '선물 명', 'data': '', 'defaultContent': ''},
            {'title': '보낸 선물 수', 'data': '', 'defaultContent': ''},
            {'title': '적용완료 일시', 'data': '', 'defaultContent': ''},
        ]
        , 'comments': '방송 중 DJ에게 보낸 회원 및 선물 세부 내역을 확인할 수 있습니다.'
    },
    'storyDetail': {
        'url': '/rest/member/report/list'
        , 'columns': [
            {'title': '회원번호', 'data': '', 'defaultContent': ''},
            {'title': '사연 보낸 청취자 ID', 'data': '', 'defaultContent': ''},
            {'title': '사연 보낸 청취자 닉네임', 'data': '', 'defaultContent': ''},
            {'title': '보낸 일시', 'data': '', 'defaultContent': ''},
            {'title': '사연 내용', 'data': '', 'defaultContent': ''},
        ]
        , 'comments': '방송 중 받은 사연 내역을 확인할 수 있습니다.'
    },
}
