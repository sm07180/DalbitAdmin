var SplashDataTableSource = {
    'splashList': {
        'url': '/rest/content/splash/list'

        , 'columns': [
             {'title': 'OS구분', 'data': 'splash_col1'},
             {'title': '수신대상', 'data': 'splash_col2', 'width':'100px'},
             {'title': '메시지 제목', 'data': 'splash_col3', 'width':'200px', 'render': function (data, type, row, meta) {
                     return '<a href="javascript://" class="_getNoticeDetail" data-idx="'+meta.row+'">' + data + '</a>'
                 }},
             {'title': '노출 기간', 'data': 'splash_col4', 'width':'100px', 'render': function (data, type, row, meta) {
                     return common.convertToDate(data);
                 }},
             {'title': '게시상태', 'data': 'splash_col5', 'width':'100px'},
             {'title': '등록/수정기간', 'data': 'splash_col6', 'width':'100px', 'render': function (data, type, row, meta) {
                     return common.convertToDate(data);
                 }},
             {'title': '처리자명', 'data': 'splash_col7', 'defaultContent': '로그아웃', 'width':'100px'},
        ]
        , 'comments': ' 방송 중 운영자 공지/알림/이벤트 안내 메시지등을 발송 할 수 있습니다.'
    }
}
