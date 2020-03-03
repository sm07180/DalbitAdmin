/**
 * ========= DataTable Source =============
 * key:{
 *      'url': ajax호출 URL (필수)
 *      ','columns': [       (필수)
 *          {'title': 필드헤더명, 'data': 출력데이터변수명, 'defaultContent': 값이 없을 경우 Default값}
 *      ]
 * }
 *
 **/

var customerDataTableSource = {
    'DeclareList': {
        'url': '/rest/customer/declaration/list'

        ,'columns': [
            /*{'title': '플랫폼 구분', 'data': 'type', 'render': function (data) {
                    if(data == 1){
                        return "Android";
                    }else if(data == 2){
                        return "<a> IOS </a>";
                    }else{
                        return "PC";
                    }
                }}*/
            {'title': '플랫폼 구분', 'data' : 'memNo'}
            , {'title': '신고 구분', 'data' : 'memBirth'}
            ,{'title': '신고 UserID', 'data': 'memId',
                'render': function(data, type, row, meta) {return '<a href="javascript://" onclick="javascript:getUser_detail('+meta.row+');">' + data + '</a>'}}
                /* data는 데이터테이블에 들어가는 실제 데이터, row는 한 열, meta는 데이터의 메타정보*/
            ,{'title': '신고 대상 UserID', 'data': 'memId'}
            ,{'title': '접수 일시', 'data': 'memJoin'}
            ,{'title': '처리 일시', 'data': 'memJoin'}
            ,{'title': '처리 상태', 'data': 'memState',
                'render': function(data, type, row, meta) {return '<a href="javascript://" onclick="javascript:getDeclare_detail('+meta.row+');">' + data + '</a>'}}
            ,{'title': '처리자', 'data': 'memPhone'}
        ]
        , 'comments' : '최신 신고자를 기준으로 상위 구성하고, 확인하고자 하는 회원 정보 내 선택을 클릭하면 상세정보 및 회원 신고조치를 처리할 수 있습니다.'
    },

    'QuestionList': {
        'url': '/rest/customer/question/list'

        , 'columns': [
            {'title': '선택', 'data': 'memState',
                'render': function(data, type, row, meta) {return '<a href="javascript://" onclick="javascript:getQuestion_detail('+meta.row+');">' + data + '</a>'}}
            ,{'title': '문의 내용', 'data': 'memId'}
            ,{'title': '플랫폼 구분', 'data': 'memNo'}
            ,{'title': 'Browser', 'data': 'memId'}
            ,{'title': '회원번호', 'data':'memNo'}
            ,{'title': '문의자 UserID', 'data': 'memId',
                'render': function(data, type, row, meta) {return '<a href="javascript://" onclick="javascript:getQUser_detail('+meta.row+');">' + data + '</a>'}}
            ,{'title': '문의자 닉네임', 'data': 'memId'}
            ,{'title': '문의제목', 'data': 'memNo'}
            ,{'title': '접수일시/처리일시', 'data': 'memJoin'}
            ,{'title': '첨부파일', 'data': 'memId'}
            ,{'title': '처리상태', 'data': 'memId'}
            ,{'title': '처리자', 'data': 'memNo'}
        ]
        , 'comments' : '최근 1:1문의 정보입니다. 문의 제목을 클릭하시면 세부 정보를 확인 및 답변, 수정할 수 있습니다.'
    },

    'chattingHistory': {
        'url': '/rest/member/member/list'
        , 'columns': [
            {'title': 'memNo', 'data': 'memNo','width':'100px'},
            {'title': '채팅시작일', 'data': 'memNo','width':'100px'},
            {'title': 'User닉네임', 'data': 'memId', 'render': function (data, type, row, meta) {
                    return '<a href="javascript://" onclick="javascript:userChatting('+meta.row+');">' + data + '</a>'
                },'width':'80px'},
            {'title': '채팅내용', 'data': 'memNick','width':'100px'},
        ]
        , 'comments': '전체 채팅 목록'
    },
    'userChattingHistory': {
        'url': '/rest/member/member/list'
        , 'columns': [
            {'title': 'memNo', 'data': 'memNo','width':'100px'},
            {'title': '채팅시작일', 'data': 'memNo'},
            {'title': 'User닉네임', 'data': 'memId'},
            {'title': '채팅내용', 'data': 'memNick'},
        ]
        , 'comments': '선택한 사람의 채팅 목록'
    },


    'processingStatusHistory': {
        'url': '/rest/member/member/list'
        , 'columns': [
            {'title': '문의유형', 'data': 'memNo','width':'100px'},
            {'title': '플랫폼', 'data': 'memNo','width':'100px'},
            {'title': 'Browser', 'data': 'memNo','width':'100px'},
            {'title': '회원번호', 'data': 'memNo','width':'100px'},
            {'title': '문의자UserId', 'data': 'memId', 'render': function (data, type, row, meta) {
                    return '<a href="javascript://" onclick="javascript:questionCall('+meta.row+');">' + data + '</a>'
                },'width':'80px'},
            {'title': '문의자닉네임', 'data': 'memNo','width':'100px'},
            {'title': '문의제목', 'data': 'memNo','width':'100px'},
            {'title': '접수일시/처리일시', 'data': 'memNo','width':'100px'},
            {'title': '첨부파일', 'data': 'memNo','width':'100px'},
            {'title': '처리상태', 'data': 'memNo','width':'100px'},
            {'title': '처리자', 'data': 'memNo','width':'100px'},
        ]
        , 'comments': '회원 검색 시 신고자와 신고 대상자를 구분하여 검색하고, 상세정보를 확인할 수 있습니다.'
    },
}
