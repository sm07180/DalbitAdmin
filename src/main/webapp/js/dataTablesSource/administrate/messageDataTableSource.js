var MessageDataTableSource = {
    'messageList': {
        'url': '/rest/content/message/list'
        , 'columns': [
            {'title': '메시지', 'data': 'send_cont', 'render': function (data, type, row, meta) {
                    return '<a href="javascript://" class="_getDetail" data-idx="'+meta.row+'">' + data + '</a>'
            }},
            {'title': '등록일시', 'data': 'reg_dateFormat'},
            {'title': '등록자', 'data': 'op_name'},
        ]
        , 'comments': 'ㆍ모든 라이브 방송방에 채팅 메시지를 발송합니다.'
    },
}