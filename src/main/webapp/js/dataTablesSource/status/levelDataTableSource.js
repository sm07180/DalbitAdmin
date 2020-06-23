var levelDataTableSource = {
    'levelList': {
        'url': '/rest/status/level/list'

        , 'columns': [
            {'title': 'level', 'data' : 'level', 'width':'80px'}
            ,{'title': 'Exp(%)', 'data' : 'exp', 'width':'80px'}
            ,{'title': 'Exp(수치)', 'data' : 'exp', 'width':'80px'}
            ,{'title': '레벨등급', 'data' : 'grade', 'width':'80px'}
            ,{'title': 'UserID', 'data' : 'mem_userid', 'width':'80px', 'render': function (data, type, row, meta) {
                    return util.memNoLink(data, row.mem_no);
                }}
            ,{'title': '닉네임', 'data' : 'mem_nick', 'width':'80px'}
            ,{'title': '보유달', 'data' : 'dal', 'width':'80px','render' : function(data){
                    return common.addComma(data) + "개"
                }}
            ,{'title': '보유별', 'data' : 'byeol', 'width':'80px','render' : function(data){
                    return common.addComma(data) + "개"
                }}
        ]
    },
}