var specialDataTableSource = {
    'reqSpecialList': {
        'url': '/rest/menu/special/reqDalList'
        , 'columns': [
            {'title': '회원번호', 'data': 'mem_no', 'render': function(data, type, row) {
                return '<a href="javascript://" class="_openMemberPop" data-memno="' + row.mem_no + '">' + data + '</a>'
                }}
            , {'title': '신청일', 'data': 'reg_date', 'render': function(data, type, row) {
                return '<div style="width:70px;">' + common.convertToDate(data, 'YYYY-MM-DD HH:mm:ss'); + '</div>'
                }}
            , {'title': '이름', 'data': 'mem_name', 'render': function(data) {
                return '<div style="width:40px;">' + data + '</div>'
                }}
            , {'title': '연락처', 'data': 'mem_phone', 'render': function(data){
                return '<div style="width:60px;">' + common.phoneNumHyphen(data) + '</div>'
                }}
            , {'title': '제목', 'data': 'title', 'render': function(data, type, row) {
                    return '<a href="javascript://" class="_reqDalDetail" data-idx="' + row.idx + '">' + data + '</a>'
                }}
            , {'title': '내용', 'data': 'contents'}
            , {'title': '상태', 'data': 'state', 'render': function(data) {
                return '<div style="width:40px;">' + util.getCommonCodeLabel(data, special_state); + '</div>'
                }}
            , {'title': '처리자', 'data': 'op_name', 'render': function(data) {
                    return '<div style="width:40px;">' + data + '</div>'
                }}
            , {'title': '처리 일시', 'data': 'last_upd_date', 'render': function(data, type, row) {
                    return '<div style="width:70px;">' + common.convertToDate(data, 'YYYY-MM-DD HH:mm:ss'); + '</div>'
                }}
        ]
        // , 'comments': ''
    },

    'specialList': {
        'url': '/rest/menu/special/dalList'
        , 'columns': [
            {'title': '회원번호', 'data': 'mem_no', 'render': function(data, type, row) {
                return '<a href="javascript://" class="_openMemberPop" data-memno="' + row.mem_no + '">' + data + '</a>' +
                    '<a href="javascript://" style="display:none;" class="_dalDetail" data-reqidx="' + row.req_idx + '"></a>'
                }}
            , {'title': '등록일', 'data': 'reg_date', 'render': function(data, type, row) {
                    return common.convertToDate(data, 'YYYY-MM-DD HH:mm:ss');
                }}
            , {'title': '관리자 등록여부', 'data': 'is_force', 'render': function(data, type, row) {
                    return util.getCommonCodeLabel(data, special_isForce);
                }}
            , {'title': '순서', 'data': 'order'}
            , {'title': '등록자', 'data': 'op_name'}
        ]
        // , 'comments': ''
    },

    'modalSpecialList': {
        'url': '/rest/member/member/list'
        , 'columns': [
            {'title': 'memNo', 'data': 'mem_no' , 'visible' : false},
            {'title': 'UserID', 'data': 'mem_userid','width':'50px'},
            {'title': '닉네임', 'data': 'mem_nick','width':'100px'},
            {'title': '연락처', 'data': 'mem_phone','width':'50px'},
            {'title': '스페셜DJ등록하기', 'data': '','defaultContent': '', 'render': function (data, type, row, meta) {
                    return '<a onclick="javascript:setModalMemeberData('+meta.row+')" data-dismiss="modal">' + "[등록하기]" + '</a>'
                },'width':'60px'},
        ]
    },
};