var BannerDataTableSource = {
    'bannerList': {
        'url': '/rest/content/banner/list'

        , 'columns': [
            {'title': '노출구분', 'data': 'banner_col1'},
            {'title': '배너구분', 'data': 'banner_col2', 'width':'100px'},
            {'title': '이미지', 'data': 'banner_col3', 'width':'200px', 'render': function (data, type, row, meta) {

                return '<a href="javascript:;">' + data + '</a>'

            }},
            {'title': '배너 제목', 'data': 'banner_col4', 'width':'100px', 'render': function (data, type, row, meta) {
                return convertToDate(data);

            }},
            {'title': '노출기간', 'data': 'banner_col5', 'width':'100px'},
            {'title': '이미지등록여부', 'data': 'banner_col6', 'width':'100px', 'render': function (data, type, row, meta) {
                return convertToDate(data);

            }},
            {'title': '성별', 'data': 'banner_col7', 'defaultContent': '로그아웃', 'width':'100px'},
            {'title': '노출', 'data': 'banner_col8', 'defaultContent': '로그아웃', 'width':'100px'},
            {'title': '노출여부', 'data': 'banner_col9', 'defaultContent': '로그아웃', 'width':'100px'},
            {'title': '노출', 'data': 'banner_col10', 'defaultContent': '로그아웃', 'width':'100px'},
            {'title': '클릭', 'data': 'banner_col11', 'defaultContent': '로그아웃', 'width':'100px'},
            {'title': '남', 'data': 'banner_col12', 'defaultContent': '로그아웃', 'width':'100px'},
            {'title': '여', 'data': 'banner_col13', 'defaultContent': '로그아웃', 'width':'100px'},
            {'title': '등록자명', 'data': 'banner_col14', 'defaultContent': '로그아웃', 'width':'100px'},

        ]
        , 'comments': '<div>• 배너를 등록하고 관리하는 페이지 입니다.</div><div>• 모든 정보 완료 후 꼭!! 게시 여부와 게시 페이지를 지정한 후 [등록완료]버튼을 클릭해야 적용이 완료됩니다.</div>'
    }
}