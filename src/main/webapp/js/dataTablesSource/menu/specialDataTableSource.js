var specialDataTableSource = {
    'reqSpecialList': {
        'url': '/rest/menu/special/reqDalList'
        , 'columns': [
            {'title': '회원번호', 'data': 'mem_no', 'render': function(data, type, row) {
                return '<a href="javascript://" class="_openMemberPop" data-memno="' + row.mem_no + '">' + data + '</a>'
                }}
            , {'title': '제목', 'data': 'title', 'render': function(data, type, row) {
                return '<a href="javascript://" class="_reqDalDetail" data-idx="' + row.idx + '">' + data + '</a>'
                }}
            , {'title': '등록일', 'data': 'reg_date'}
            , {'title': '내용', 'data': 'contents'}
            , {'title': '상태', 'data': 'state', 'render': function(data) {
                return util.getCommonCodeLabel(data, special_state);
                }}
            , {'title': '승인자', 'data': 'op_name'}
            , {'title': '승인 일시', 'data': 'last_upd_date'}
        ]
        // , 'comments': ''
    },

    'specialList': {
        'url': '/rest/menu/special/dalList'
        , 'columns': [
            {'title': '회원번호', 'data': 'mem_no', 'render': function(data, type, row) {
                return '<a href="javascript://" class="_dalDetail" data-memno="' + row.mem_no + '">' + data + '</a>'
                }}
            , {'title': '등록일', 'data': 'reg_date'}
            , {'title': '관리자 등록여부', 'data': 'is_force'}
            , {'title': '순서', 'data': 'order'}
            , {'title': '등록자', 'data': 'op_name'}
        ]
        // , 'comments': ''
    }
}