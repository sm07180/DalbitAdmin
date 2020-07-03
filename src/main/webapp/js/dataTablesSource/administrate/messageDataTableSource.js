var MessageDataTableSource = {
    'messageList': {
        'url': '/rest/content/message/list'
        , 'columns': [
            {'title': '제목', 'data': 'title', 'render': function (data, type, row, meta) {
                    return '<a href="javascript://" class="_getDetail" data-idx="'+meta.row+'">' + data + '</a>'
            }},
            {'title': '총 발송 건수', 'width': '100px', 'data': 'send_cnt'},
            {'title': '등록일시', 'width': '150px', 'data': 'reg_dateFormat'},
            {'title': '등록자', 'width': '50px', 'data': 'op_name'},
        ]
        , 'comments': 'ㆍ모든 라이브 방송방에 채팅 메시지를 발송합니다.'
    },
}