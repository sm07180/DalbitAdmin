var NoticeDataTableSource = {
    'noticeInfo': {
        'url': '/rest/content/notice/list'

        , 'columns': [
            {'title': '플랫폼', 'data': 'platform', 'name': 'sortPlat', 'render': function (data) {
                    return util.getCommonCodeLabel(data, platform) ;
                }}
            , {'title': '구분', 'data': 'slctType', 'name': 'sortSlct', 'render': function (data) {
                    return util.getCommonCodeLabel(data, notice_slctType) ;
                }}
            , {'title': '성별', 'data' : 'gender', 'name': 'sortGender', 'render': function (data) {
                    return util.getCommonCodeLabel(data, gender) ;
                }}
            , {
                'title': '제목', 'data': 'title', 'render': function (data, type, row, meta) {
                    //return '<a href="javascript://" onclick="javascript:getNotice_detail(' + meta.row + ');">' + data + '</a>'
                    return '<a href="javascript://" class="_getNoticeDetail" data-idx="'+row.noticeIdx+'">' + data + '</a>'
                }
            }
            , {'title': '등록일시', 'data': 'writeDateFormat'}
            , {'title': '조회수', 'data': 'viewCnt', 'render' : function(data){
                    return common.addComma(data);
                }}
            , {'title': '게시상태', 'data': 'viewOn', 'render': function (data) {
                    return util.renderOnOff(data);
                }}
            , {'title': '바로알림', 'data': '', 'render': function (data) {
                    return '<a href="javascript://" class="_notice">'+'[바로알림]'+'</a>';
                }}
            , {'title': '처리자명', 'data': 'opName'}
        ]
        , 'comments': ' • 달빛라이브 사이트 내 공지를 등록/수정/삭제할 수 있습니다.'
    },
}