var BannerDataTableSource = {
    'list': {
        'url': '/rest/content/banner/list'

        , 'columns': [
            {'title': '플랫폼', 'data': 'platform', 'render': function (data, type, row, meta) {
                    return util.getPlatformName(data);
                }},
            {'title': '배너구분', 'data': 'position', 'render': function (data, type, row, meta) {
                    return util.getCommonCodeLabel(data, banner_bannerType);
                }},
            {'title': '이미지', 'data': 'thumb_img_url', 'render': function (data, type, row, meta) {
                    var imgUrl = row.thumb_img_url;
                    if(!common.isEmpty(row.mobile_img_url) && common.isEmpty(imgUrl)){
                        imgUrl = row.mobile_img_url;
                    }else if(!common.isEmpty(row.pc_img_url) && common.isEmpty(imgUrl)){
                        imgUrl = row.pc_img_url;
                    }

                    if(common.isEmpty(imgUrl)){
                        return "";
                    }
                    return '<img class="thumbnail fullSize_background" src="'+ imgUrl +'" width="50px" max-height="50px" />';

                }},
            {'title': '배너 제목', 'data': 'title', 'render': function (data, type, row, meta) {
                    return '<a href="javascript://" class="_getNoticeDetail" data-idx="'+meta.row+'" data-banner-idx="'+row.banner_idx+'">' + data + '</a>'
                }},
            {'title': '노출기간', 'data': 'term_type', 'render': function (data, type, row, meta) {
                    if(data == "0"){
                        return "상시";
                    }

                    return common.convertToDate(row.start_datetime) + " ~<br />" + common.convertToDate(row.end_datetime);

                }},
            {'title': '게시여부', 'data': 'is_view', 'render': function (data, type, row, meta) {
                    //return util.getCommonCodeLabel(data, content_viewOn);
                    return util.renderOnOff(data);

                }},
            {'title': '이미지 등록', 'data': '', 'render': function (data, type, row, meta) {
                var text = "";
                if(common.isEmpty(row.pc_img_url)){
                    text += "PC : X";
                }else{
                    text += "PC : O";
                }

                text += '<br />'

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
            {'title': '로그인<br />구분', 'data': 'view_type', 'render': function (data, type, row, meta) {
                    return util.getCommonCodeLabel(data, banner_loginType);
                }},
            {'title': '노출상태', 'data': 'is_view', 'render': function (data, type, row, meta) {

                    if(data == 1){
                        if(row.start_datetime != ''){
                            var start = moment(row.start_datetime).format('YYYYMMDDHHmmss');
                            var end = moment(row.end_datetime).format('YYYYMMDDHHmmss');
                            var current = moment(new Date()).format('YYYYMMDDHHmmss');
                            if(start <= current && current <= end){
                                return util.renderOnOff(1);
                            }else{
                                return util.renderOnOff(2);
                            }
                        }
                        return util.renderOnOff(1);
                    }
                    return util.renderOnOff(2);
                }},
            /*수치 개발 안되어 주석처리 - [2020.08.04 양효진과장 요청]*/
            /*{'title': '노출', 'data': 'banner_col10', 'defaultContent': '0'},
            {'title': '클릭', 'data': 'banner_col11', 'defaultContent': '0'},
            {'title': '<label style="color: blue">남</label>', 'data': 'banner_col12', 'defaultContent': '0'},
            {'title': '<label style="color: red">여</label>', 'data': 'banner_col13', 'defaultContent': '0'},*/
            {'title': 'IOS 심사 중<br />노출여부', 'data': 'iosJudgeViewOn', 'defaultContent': '-', 'render': function (data, type, row, meta) {
                    return util.renderOnOff(data);
                }},
            {'title': '등록자명', 'data': 'opName', 'defaultContent': '-', 'render': function (data, type, row, meta) {
                    return data + '<br />' + row.reg_dateFormat;
                }},
            {'title': '수정자명', 'data': 'lastOpName', 'defaultContent': '-', 'render': function (data, type, row, meta) {
                    return data + '<br />' + row.lastUpdDateFormat;
                }},
            {'title': 'down', 'data': 'lastOpName', 'defaultContent': '-', 'render': function (data, type, row, meta) {
                    return '<button type="button" class="btn btn-info _down"><i class="toggle-icon fa fa-angle-down"></i></button>';
                }},
            {'title': 'up', 'data': 'lastOpName', 'defaultContent': '-', 'render': function (data, type, row, meta) {
                    return '<button type="button" class="btn btn-danger _up"><i class="toggle-icon fa fa-angle-up"></i></button>';
                }},

        ]
        , 'comments': '<div class="mt15">• 배너를 등록하고 관리하는 페이지 입니다.</div><div>• 배너를 검색하시려면 ,배너제목을 입력하세요.</div><div>• 모든 정보 완료 후 꼭!! 게시 여부와 게시 페이지를 지정한 후 [등록완료 ]버튼을 클릭해야 적용이 완료됩니다.</div>'
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
            {'title': '<label style="color: blue">남</label>', 'data': 'banner_col3', 'defaultContent': '0', 'width':'100px', 'render': function (data, type, row, meta) {
                return data + '명'
            }},
            {'title': '<label style="color: red">여</label>', 'data': 'banner_col5', 'defaultContent': '0', 'width':'100px', 'render': function (data, type, row, meta) {
                return data + '명'
            }}
        ]
    }
}
