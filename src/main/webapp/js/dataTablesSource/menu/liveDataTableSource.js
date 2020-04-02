var LiveDataTableSource = {
    'liveList': {
        'url': '/rest/menu/live/list'
        , 'columns': [
            {'title': '프로필 이미지', 'data': 'bjProfImg.path', 'name': 'sortSlct', 'render': function (data) {
                    return util.getCommonCodeLabel(data, faq_slctType) ;
                }}
            , {
                'title': '태그부분', 'data': 'question', 'render': function (data, type, row, meta) {
                    return '<a href="javascript://" class="_getFaqDetail" data-idx="'+row.faqIdx+'">' + data + '</a>'
                }
            }
            , {'title': 'User ID', 'data': 'writeDateFormat'}
            , {'title': 'User 닉네임', 'data': 'lastUpdateDateFormat'}
            , {'title': '보유결제금액', 'data': 'viewCnt', 'name': '', 'render' : function(data){
                    return common.addComma(data)
                }}
            , {'title': '누적 받은 별', 'data': 'viewOn', 'render': function (data) {
                    return util.renderOnOff(data);
                }}
            , {'title': '누적 받은 선물', 'data': 'opName'}
        ]
        // , 'comments': '검색결과 내 질문을 클릭하면 해당 상세정보를 확인할 수 있습니다.'
    },
}