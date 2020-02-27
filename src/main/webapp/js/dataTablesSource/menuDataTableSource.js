var MenuDataTableSource = {
    'recommend': {
        'url': '/rest/menu/recommend/list'
        , 'columns': [
            {'title': '순위', 'data': '' , 'defaultContent': '', 'width' : '100px', 'render': function (data, type, row, meta) {
                    return '<button type="button" class="btn btn-info _down"><i class="toggle-icon fa fa-angle-down"></i></button>' +
                        '<button type="button" class="btn btn-danger _up" disabled=""><i class="toggle-icon fa fa-angle-up"></i></button>'
                }},
            {'title': 'Main추천상태', 'data': '', 'defaultContent': ''},
            {'title': '레벨/등급', 'data': 'level', 'defaultContent': ''},
            {'title': '프로필이미지', 'data': 'image_profile', 'defaultContent': ''},
            {'title': 'UserID', 'data': 'mem_id', 'defaultContent': ''},
            {'title': 'User닉네임', 'data': 'mem_nick', 'defaultContent': ''},
            {'title': '보유결제금액', 'data': 'gold', 'defaultContent': ''},
            {'title': '보낸선물수', 'data': 'item_cnt', 'defaultContent': ''},
            {'title': '방송방 당 평균 받은 선물', 'data': 'receive_average_cnt', 'defaultContent': ''},
            {'title': '누적방송횟수', 'data': 'broad_cnt', 'defaultContent': ''},
            {'title': '최초방송시작일', 'data': 'first_broad_date', 'defaultContent': ''},
            {'title': '최근방송일시', 'data': 'last_broad_date', 'defaultContent': ''},
        ]
        , 'comments': '1) 추천/인기 DJ Main 노출 수는 10명입니다. 2) 추천/인기DJ를 변경하시려면 DJ를 검색하여 결과리스트에서 [리스트추가하기]를 한 후 추천중 상태로 변경하세요.'
    },

    'best': {
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