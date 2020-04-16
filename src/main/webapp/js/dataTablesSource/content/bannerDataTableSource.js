var BannerDataTableSource = {
    'list': {
        'url': '/rest/content/banner/list'

        , 'columns': [
            {'title': '노출구분', 'data': 'view_type', 'render': function (data, type, row, meta) {
                    return util.getCommonCodeLabel(data, banner_loginType);
                }},
            {'title': '배너구분', 'data': 'position', 'render': function (data, type, row, meta) {
                    return util.getCommonCodeLabel(data, banner_bannerType);
                }},
            {'title': '이미지', 'data': 'thumb_img_url', 'render': function (data, type, row, meta) {
                    if(common.isEmpty(data)){
                        return "";
                    }

                    // return '<img src="'+data+'?45x45" style="width: 45px; height: 45px;" data-toggle="modal" data-target="#imgModal" onclick="fullSize(this.src);" />'
                    return '<a href="javascript:;"><img src="'  + data + '" style="width: 45px; height: 45px;" data-toggle="modal" data-target="#imgModal" onclick="fullSize(this.src);" /></a>'

                }},
            {'title': '배너 제목', 'data': 'title', 'render': function (data, type, row, meta) {
                    return '<a href="javascript://" class="_getNoticeDetail" data-idx="'+meta.row+'">' + data + '</a>'
                }},
            {'title': '노출기간', 'data': 'term_type', 'render': function (data, type, row, meta) {
                    if(data == "0"){
                        return "상시";
                    }

                    return common.convertToDate(row.start_datetime) + " ~ " + common.convertToDate(row.end_datetime);

                }},
            {'title': '이미지등록여부', 'data': '', 'render': function (data, type, row, meta) {
                var text = "";
                if(common.isEmpty(row.pc_img_url)){
                    text += "PC : X<br />";
                }else{
                    text += "PC : O<br />";
                }

                if(common.isEmpty(row.mobile_img_url)){
                    text += "Mobile : X";
                }else{
                    text += "Mobile : O";
                }
                return text;

            }},
            {'title': '성별', 'data': 'sex', 'render': function (data, type, row, meta) {
                    return util.getCommonCodeLabel(data, gender);
                }},
            {'title': '노출', 'data': 'view_type', 'render': function (data, type, row, meta) {
                    return util.getCommonCodeLabel(data, banner_loginType);
                }},
            {'title': '게시여부', 'data': 'is_view', 'render': function (data, type, row, meta) {
                    return util.getCommonCodeLabel(data, content_viewOn);
                }},
            {'title': '노출', 'data': 'banner_col10', 'defaultContent': '0'},
            {'title': '클릭', 'data': 'banner_col11', 'defaultContent': '0'},
            {'title': '남', 'data': 'banner_col12', 'defaultContent': '0'},
            {'title': '여', 'data': 'banner_col13', 'defaultContent': '0'},
            {'title': '등록자명', 'data': 'opName', 'defaultContent': '-'},

        ]
        , 'comments': '<div>• 배너를 등록하고 관리하는 페이지 입니다.</div><div>• 배너를 검색하시려면 ,배너제목을 입력하세요.</div><div>• 모든 정보 완료 후 꼭!! 게시 여부와 게시 페이지를 지정한 후 [등록완료 ]버튼을 클릭해야 적용이 완료됩니다.</div>'
    },
    'statisticsList': {
        'url': '/rest/content/banner/statistics'

        , 'columns': [
            {'title': 'ON 배너', 'data': 'banner_col1', 'defaultContent': '0', 'width':'100px', 'render': function (data, type, row, meta) {
                return data + '건'
            }},
            {'title': 'ON 배너 클릭', 'data': 'banner_col2', 'defaultContent': '0', 'width':'100px', 'render': function (data, type, row, meta) {
                return data + '건 (00%)'
            }},
            {'title': '남', 'data': 'banner_col3', 'defaultContent': '0', 'width':'100px', 'render': function (data, type, row, meta) {
                return data + '명'
            }},
            {'title': '여', 'data': 'banner_col5', 'defaultContent': '0', 'width':'100px', 'render': function (data, type, row, meta) {
                return data + '명'
            }}
        ]
    }
}
