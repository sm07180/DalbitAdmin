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

var UtilDataTableSource = {
    'modalMemberList': {
        'url': '/rest/member/member/list'
        , 'columns': [
            {'title': 'memNo', 'data': 'memNo' , 'visible' : false},
            {'title': 'UserID', 'data': 'memId','width':'50px'},
            {'title': '닉네임', 'data': 'memNick','width':'100px'},
            {'title': '연락처', 'data': 'memPhone','width':'50px'},
            {'title': '수신대상등록하기', 'data': '','defaultContent': '', 'render': function (data, type, row, meta) {
                    return '<a onclick="javascript:setModalMemeberData('+meta.row+')" data-dismiss="modal">' + "[등록하기]" + '</a>'
                },'width':'60px'},
        ]
    }

}
