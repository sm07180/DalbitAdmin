var RestrictionsDataTableSource = {

    'withdrawalList': {
        'url': '/rest/customer/restrictions/withdrawal/list'
        , 'columns': [
            {'title': '회원번호', 'data': 'mem_no', 'width':'100px', 'render': function (data, type, row, meta) {
                    return '<a href="javascript://" class="_openMemberPop" data-memNo="' + data + '">' + data + '</a>';
                }}
            ,{'title': '닉네임', 'data': 'mem_nick', 'width':'110px'}
            ,{'title': '성별', 'data': 'mem_sex', 'width':'50px', 'render': function (data, type, row, meta) {
                    return common.sexIcon(data, row.mem_birth_year, true);
                }}
            ,{'title': '제재<br>횟수', 'data': 'sanctions_cnt', 'width':'35px'}
            ,{'title': '회원<br>상태', 'data': 'op_code', 'width':'50px', 'render': function (data, type, row, meta) {
                    return util.getCommonCodeLabel(data, declaration_opCode);
                }}
            ,{'title': '처리자', 'data': 'op_name', 'width':'50px'}
            ,{'title': '상태', 'data': 'reason', 'width':'60px', 'render': function (data, type, row, meta) {
                    return '<button type="button" class="btn btn-info btn-xs no-margin" id="bt_state_withdrawalList" data-memno="'+ row.mem_no +'">정상변경</button>';
                }}
            ,{'title': '정지사유', 'data': 'reason', 'width':'90px', 'render': function (data, type, row, meta) {
                    return util.getCommonCodeLabel(data, declaration_reason);
                }}
            ,{'title': '조치사항', 'data': 'op_msg', 'className':'al', 'render': function (data, type, row, meta) {
                    return common.replaceHtml(data);
                }}
            ,{'title': '디바이스 UUID', 'data': 'device_uuid', 'width':'100px'}
            ,{'title': '연락처', 'data': 'mem_phone', 'width':'80px'}
            ,{'title': '시작일자', 'data': 'start_date', 'width':'70px', 'render': function (data, type, row, meta) {
                    return common.convertToDate(data);
                }}
            ,{'title': '종료일자', 'data': 'end_date', 'width':'70px', 'render': function (data, type, row, meta) {
                    return common.convertToDate(data);
                }}
        ]
        ,'createdRow' : function( row, data, dataIndex ) {
            if (data.inner == 1) {    // 테스트계정 row 색상 표시
                $(row).addClass("bg-testMember");
            }
        }
    }

    ,'forcedList': {
        'url': '/rest/customer/restrictions/forced/list'
        , 'columns': [
            {'title': '회원번호', 'data': 'mem_no', 'width':'130px', 'render': function (data, type, row, meta) {
                    return '<a href="javascript://" class="_openMemberPop" data-memNo="' + data + '">' + data + '</a>';
                }}
            ,{'title': '닉네임', 'data': 'mem_nick', 'width':'140px'}
            ,{'title': '성별', 'data': 'mem_sex', 'width':'70px', 'render': function (data, type, row, meta) {
                    return common.sexIcon(data, row.mem_birth_year, true);
                }}
            ,{'title': '누적퇴장', 'data': 'exit_cnt', 'width':'50px'}
            ,{'title': '연락처', 'data': 'mem_phone', 'width':'110px', 'render': function (data, type, row, meta) {
                    // return common.phoneNumHyphen(data);
                    return data;
                }}
            ,{'title': 'IP', 'data': 'mem_ip', 'width':'110px'}
            ,{'title': '강퇴일자', 'data': 'last_upd_date', 'width':'130px', 'render': function (data, type, row, meta) {
                    return common.convertToDate(data);
                }}
            ,{'title': '방송방제목', 'data': 'title', 'render': function (data, type, row, meta) {
                    return util.roomNoLink(data, row.room_no);
                }}
            ,{'title': 'DJ 회원번호', 'data': 'dj_mem_no', 'width':'130px', 'render': function (data, type, row, meta) {
                    return '<a href="javascript://" class="_openMemberPop" data-memNo="' + data + '">' + data + '</a>';
                }}
            ,{'title': 'DJ 닉네임', 'data': 'dj_mem_nick', 'width':'140px'}
            // ,{'title': '회원디바이스', 'data': 'device_token'}
        ]
        ,'createdRow' : function( row, data, dataIndex ) {
            if (data.inner == 1) {    // 테스트계정 row 색상 표시
                $(row).addClass("bg-testMember");
            }
            if (data.dj_inner == 1) {    // 테스트계정 row 색상 표시
                $(row).addClass("bg-testMember");
            }
        }
    }

  ,'ageLimitList': {
    'url': '/rest/customer/restrictions/age/limit/list'
    , 'columns': [
      {'title': '회원번호', 'data': 'memNo', 'width':'50px', 'render': function (data, type, row, meta) {
          return '<a href="javascript://" class="_openMemberPop" data-memNo="' + data + '">' + data + '</a>';
        }}
      ,{'title': '닉네임', 'data': 'memNick', 'width':'90px'}
      ,{'title': '아이디', 'data': 'memId', 'width':'70px'}
      ,{'title': '정지일시', 'data': 'stopDate', 'width':'130px'}
      ,{'title': '회원 가입일시', 'data': 'memJoinDate', 'width':'130px'}
      ,{'title': '본인인증 여부', 'data': 'certYn', 'width':'40px'}
    ]
    ,'createdRow' : function( row, data, dataIndex ) {
      if (data.inner == 1) {    // 테스트계정 row 색상 표시
        $(row).addClass("bg-testMember");
      }
      if (data.dj_inner == 1) {    // 테스트계정 row 색상 표시
        $(row).addClass("bg-testMember");
      }
    }
  }
}
