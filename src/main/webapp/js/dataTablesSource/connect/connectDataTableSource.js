var connectDataTableSource = {

    'current': {
        'url': '/rest/connect/user/info/current'
        , 'columns': [
            {'title': '접속일시', 'data': 'connectDateFormat'},
            {'title': '회원번호', 'data': 'mem_no'},
            {'title': 'UserId', 'data': 'mem_userid', 'render': function (data, type, row, meta) {
                    return util.memNoLink(data, row.mem_no);
                }},
            {'title': '닉네임', 'data': 'mem_nick'},
            {'title': '성별', 'data': 'mem_sex', 'width':'120px', 'render': function (data, type, row, meta) {
                    return common.sexIcon(data, row.mem_birth_year);
                }},
            {'title': '이름', 'data': 'mem_name'},
            {'title': '방송횟수/시간', 'data': 'broadcastingCnt', 'render': function (data, type, row, meta) {
                    return data + " / " + common.timeStamp(row.broadcastingTime);
                }},
            {'title': '선물횟수/금액', 'data': 'giftCnt', 'render': function (data, type, row, meta) {
                    return data + " / " + common.addComma(row.giftAmount);
                }},
            {'title': '결제 건 수/금액', 'data': 'payCnt', 'render': function (data, type, row, meta) {
                    return data + " / " + common.addComma(row.payAmount);
                }},
            {'title': '보유 달', 'data': 'dal', 'render': function (data, type, row, meta) {
                    return common.addComma(data) + " 개";
                }},
            {'title': '보유 별', 'data': 'byeol', 'render': function (data, type, row, meta) {
                    return common.addComma(data) + " 개";
                }},
            {'title': '가입일시', 'data': 'memJoinDateFormat'},
        ]
    },
}
