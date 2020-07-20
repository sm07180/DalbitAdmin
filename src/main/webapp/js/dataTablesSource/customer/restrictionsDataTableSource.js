var RestrictionsDataTableSource = {

    'withdrawalList': {
        'url': '/rest/customer/restrictions/withdrawal/list'
        , 'columns': [
            {'title': '회원번호', 'data': 'mem_no', 'width':'100px', 'render': function (data, type, row, meta) {
                    return '<a href="javascript://" class="_openMemberPop" data-memNo="' + data + '">' + data + '</a>';
                }}
            ,{'title': '닉네임', 'data': 'mem_nick', 'width':'110px'}
            ,{'title': '성별', 'data': 'mem_sex', 'width':'70px', 'render': function (data, type, row, meta) {
                    return common.sexIcon(data, row.mem_birth_year);
                }}
            ,{'title': '제재횟수', 'data': 'sanctions_cnt', 'width':'50px'}
            ,{'title': '회원상태', 'data': 'op_code', 'width':'50px', 'render': function (data, type, row, meta) {
                    return util.getCommonCodeLabel(data, declaration_opCode);
                }}
            ,{'title': '처리자', 'data': 'op_name', 'width':'50px'}
            ,{'title': '상태', 'data': 'reason', 'width':'50px', 'render': function (data, type, row, meta) {
                    return '<button type="button" class="btn btn-info btn-xs no-margin" id="bt_state" data-memno="'+ row.mem_no +'">정상변경</button>';
                }}
            ,{'title': '정지사유', 'data': 'reason', 'width':'80px', 'render': function (data, type, row, meta) {
                    return util.getCommonCodeLabel(data, declaration_reason);
                }}
            ,{'title': '조치사항', 'data': 'op_msg', 'className':'al', 'width':'300px', 'render': function (data, type, row, meta) {
                    return common.replaceHtml(data);
                }}
            ,{'title': '디바이스 UUID', 'data': 'device_uuid', 'width':'100px'}
            ,{'title': '연락처', 'data': 'mem_phone', 'width':'80px'}
            ,{'title': '시작일자', 'data': 'start_date', 'width':'120px', 'render': function (data, type, row, meta) {
                    return common.convertToDate(data);
                }}
            ,{'title': '종료일자', 'data': 'end_date', 'width':'120px', 'render': function (data, type, row, meta) {
                    return common.convertToDate(data);
                }}
        ]
    }

    ,'forcedList': {
        'url': '/rest/customer/restrictions/forced/list'
        , 'columns': [
            {'title': '회원번호', 'data': 'mem_no', 'width':'100px', 'render': function (data, type, row, meta) {
                    return '<a href="javascript://" class="_openMemberPop" data-memNo="' + data + '">' + data + '</a>';
                }}
            ,{'title': '닉네임', 'data': 'mem_nick', 'width':'120px'}
            ,{'title': '성별', 'data': 'mem_sex', 'width':'70px', 'render': function (data, type, row, meta) {
                    return common.sexIcon(data, row.mem_birth_year);
                }}
            ,{'title': '퇴장횟수', 'data': 'exit_cnt', 'width':'50px'}
            ,{'title': '연락처', 'data': 'mem_phone', 'width':'100px', 'render': function (data, type, row, meta) {
                    // return common.phoneNumHyphen(data);
                    return data;
                }}
            ,{'title': 'IP', 'data': 'mem_ip', 'width':'90px'}
            ,{'title': '강퇴일자', 'data': 'last_upd_date', 'width':'120px', 'render': function (data, type, row, meta) {
                    return common.convertToDate(data);
                }}
            ,{'title': '방송방제목', 'data': 'title', 'render': function (data, type, row, meta) {
                    return util.roomNoLink(data, row.room_no);
                }}
            ,{'title': 'DJ 회원번호', 'data': 'dj_mem_no', 'width':'100px', 'render': function (data, type, row, meta) {
                    return '<a href="javascript://" class="_openMemberPop" data-memNo="' + data + '">' + data + '</a>';
                }}
            ,{'title': 'DJ 닉네임', 'data': 'dj_mem_nick', 'width':'120px'}
            // ,{'title': '회원디바이스', 'data': 'device_token'}
        ]
    }
}
