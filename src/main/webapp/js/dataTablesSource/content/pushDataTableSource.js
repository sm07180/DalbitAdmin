var PushDataTableSource = {
    'pushMsgList': {
        'url': '/rest/content/push/list'

        , 'columns': [
             {'title': '플랫폼', 'data': 'push_col1'},
             {'title': '수신대상', 'data': 'push_col2', 'width':'100px'},
             {'title': '메세지 제목', 'data': 'push_col3', 'width':'200px', 'render': function (data, type, row, meta) {
                     return '<a href="javascript:;">' + data + '</a>'
                 }},
             {'title': '발송 일시', 'data': 'push_col4', 'width':'100px', 'render': function (data, type, row, meta) {
                     return convertToDate(data);
                 }},
             {'title': '발송상태', 'data': 'push_col5', 'width':'100px'},
             {'title': '등록/수정기간', 'data': 'push_col6', 'width':'100px', 'render': function (data, type, row, meta) {
                     return convertToDate(data);
                 }},
             {'title': '처리자명', 'data': 'push_col7', 'defaultContent': '로그아웃', 'width':'100px'},
        ]
        , 'comments': ' 방송 중 운영자 공지/알림/이벤트 안내 메세지등을 발송 할 수 있습니다.'
    },

    'pushClosedEventList': {
        'url': '/rest/content/push/closed-event'

        , 'columns': [
            {'title': 'OS구분', 'data': 'push_col1', 'visible' : false},
            {'title': '수신상태', 'data': 'push_col2', 'width':'100px', 'render': function (data, type, row, meta) {
                    return '<a href="javascript://" onclick="javascript:getMemNo_info('+meta.row+');">' + data + '</a>'
                }},
            {'title': '메세지 제목', 'data': 'push_col3', 'width':'200px'},
            {'title': '발송시간', 'data': 'push_col4', 'width':'100px', 'render': function (data, type, row, meta) {
                    return convertToDate(data);
                }},
            {'title': '발송상태', 'data': 'push_col5', 'width':'100px'},
            {'title': '등록/수정기간', 'data': 'push_col6', 'width':'100px', 'render': function (data, type, row, meta) {
                    return convertToDate(data);
                }},
            {'title': '처리자명', 'data': 'push_col7', 'defaultContent': '로그아웃', 'width':'100px'},
        ]
        , 'comments': 'zzzzzzzzzzz 방송 중 운영자 공지/알림/이벤트 안내 메세지등을 발송 할 수 있습니다.'
    }
}
