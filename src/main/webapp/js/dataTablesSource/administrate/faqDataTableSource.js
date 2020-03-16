var FaqDataTableSource = {
    'faqInfo': {
        'url': '/rest/administrate/faq/list'
        , 'columns': [
            {'title': 'FAQ구분', 'data': 'slctType', 'name': 'sortSlct', 'render': function (data) {
                    return util.getCommonCodeLabel(data, faq_slctType) ;
                }}
            , {
                'title': 'FAQ 질문', 'data': 'question', 'render': function (data, type, row, meta) {
                    return '<a href="javascript://" class="_getFaqDetail" data-idx="'+row.faqIdx+'">' + data + '</a>'
                }
            }
            , {'title': '등록일시', 'data': 'writeDateFormat'}
            , {'title': '조회수', 'data': 'viewCnt', 'name': ''}
            , {'title': '사이트 적용', 'data': 'viewOn', 'render': function (data) {
                    if(data == 1){
                        return ' <i class="fa fa-circle"></i>' + " ON" ;
                    }else{
                        return ' <i class="fa fa-circle-o"></i>' + " OFF" ;
                    }
                }}
            , {'title': '처리자명', 'data': 'opName'}
        ]
        // , 'comments': '검색결과 내 질문을 클릭하면 해당 상세정보를 확인할 수 있습니다.'
    },
}