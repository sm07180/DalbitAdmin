var MenuDataTableSource = {
    'recommend': {
        'url': '/rest/menu/recommend/list'
        , 'columns': [
            {'title': '순위', 'data': '' , 'defaultContent': ''},
            {'title': 'Main추천상태', '': '', 'defaultContent': ''},
            {'title': '레벨/등급', 'data': '', 'defaultContent': ''},
            {'title': '프로필이미지', 'data': '', 'defaultContent': ''},
            {'title': 'UserID', 'data': ' ', 'defaultContent': ''},
            {'title': 'User닉네임', 'data': '', 'defaultContent': ''},
            {'title': '보유결제금액', 'data': '', 'defaultContent': ''},
            {'title': '보낸선물수', 'data': '', 'defaultContent': ''},
            {'title': '방송방 당 평균 받은 선물', 'data': '', 'defaultContent': ''},
            {'title': '누적방송횟수', 'data': '', 'defaultContent': ''},
            {'title': '최초방송시작일', 'data': '', 'defaultContent': ''},
            {'title': '최근방송일시', 'data': '', 'defaultContent': ''},
        ]
        , 'comments': '1) 추천/인기 DJ Main 노출 수는 10명입니다. 2) 추천/인기DJ를 변경하시려면 DJ를 검색하여 결과리스트에서 [리스트추가하기]를 한 후 추천중 상태로 변경하세요.'
    },

    'broadDetail': {
        'url': '/rest/member/pay/list'
        , 'columns': [
            {'title': '순위', 'data': '', 'defaultContent': ''},
            {'title': 'Main추천상태', '': '', 'defaultContent': ''},
            {'title': '레벨/등급', 'data': '', 'defaultContent': ''},
            {'title': '프로필이미지', 'data': '', 'defaultContent': ''},
            {'title': 'UserID', 'data': ' ', 'defaultContent': ''},
            {'title': 'User닉네임', 'data': '', 'defaultContent': ''},
            {'title': '보유결제금액', 'data': '', 'defaultContent': ''},
            {'title': '보낸선물수', 'data': '', 'defaultContent': ''},
            {'title': '방송방 당 평균 받은 선물', 'data': '', 'defaultContent': ''},
            {'title': '누적방송횟수', 'data': '', 'defaultContent': ''},
            {'title': '최초방송시작일', 'data': '', 'defaultContent': ''},
            {'title': '최근방송일시', 'data': '', 'defaultContent': ''},
        ]
        , 'comments': '1) 추천/인기 DJ Main 노출 수는 10명입니다. 2) 추천/인기DJ를 변경하시려면 DJ를 검색하여 결과리스트에서 [리스트추가하기]를 한 후 추천중 상태로 변경하세요.'
    }
}


// {'title': 'memNo', 'data': 'memNo', 'visible' : false},
// {'title': 'UserID', 'data': 'memId', 'width':'100px', 'render': function (data, type, row, meta) {
//     return '<a href="javascript://" onclick="javascript:getMemNo_info('+meta.row+');">' + data + '</a>'
// }},