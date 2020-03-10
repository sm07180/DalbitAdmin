var NoticeDataTableSource = {
    'noticeInfo': {
        'url': '/rest/content/notice/list'

        , 'columns': [
            {'title': '공지 번호', 'data': 'noticeIdx'}
            , {'title': '공지구분', 'data': 'slctType', 'name': 'sortSlct'}
            , {
                'title': '공지 제목', 'data': 'title', 'render': function (data, type, row, meta) {
                    //return '<a href="javascript://" onclick="javascript:getNotice_detail(' + meta.row + ');">' + data + '</a>'
                    console.log(row);
                    return '<a href="javascript://" class="_getNoticeDetail" data-idx="'+row.noticeIdx+'">' + data + '</a>'
                }
            }
            , {'title': '상단 고정 여부', 'data': 'topFix', 'name': 'sortView'}
            , {'title': '노출설정', 'data': 'viewOn', 'name': ''}
            , {'title': '작성자 이름', 'data': 'opName'}
            , {'title': '작성자번호', 'data': 'opName'}
            , {'title': '작성일자', 'data': 'writeDateFormat'}
        ]
        , 'comments': ' 달빛라디오 사이트 내 공지를 등록/수정/삭제할 수 있습니다.'
    },
}