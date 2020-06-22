var specialDataTableSource = {
    'reqSpecialList': {
        'url': '/rest/menu/special/reqDalList'
        , 'columns': [
            {'title': '회원번호', 'data': 'mem_no', 'width' : '10%', 'render': function(data, type, row) {
                    return '<a href="javascript://" class="_openMemberPop" data-memno="' + row.mem_no + '">' + data + '</a>'
                }}
            , {'title': '프로필', 'width': '65px', 'data': 'image_profile', 'render': function(data, type, row) {
                    var image = 'https://devphoto2.dalbitlive.com/profile_3/profile_' + row.mem_sex + '_200327.jpg';
                    if(!data == ''){
                        image = PHOTO_SERVER_URL + data;
                    }
                    return '<img class="thumbnail fullSize_background" src="'+ image +'" style="width: 65px;height: 65px" />';
                }}
            , {'title': '닉네임', 'width': '10%', 'data': 'mem_nick'}
            , {'title': '성별', 'data': 'mem_sex', 'width':'5%', 'render': function (data, type, row, meta) {
                    return common.sexIcon(data);
                }}
            , {'title': '신청일', 'data': 'reg_date', 'render': function(data, type, row) {
                    return common.convertToDate(data, 'YYYY-MM-DD HH:mm:ss');
                }}
            , {'title': '이름', 'width': '10%', 'data': 'mem_name', 'render': function(data, type, row){
                   return '<a href="javascript://" class="_reqDalDetail" data-idx="' + row.idx + '">' + data + '</a>'
                }}
            , {'title': '연락처', 'data': 'mem_phone', 'width':'10%', 'render': function(data){
                    return common.phoneNumHyphen(data)
                }}
            , {'title': '주요방송시간1', 'data': 'broadcast_time1'}
            , {'title': '주요방송시간2', 'data': 'broadcast_time2'}
            , {'title': '상태', 'data': 'state',  'width': '10%','render': function(data) {
                    return util.getCommonCodeLabel(data, special_state);
                }}
            , {'title': '처리자', 'data': 'op_name'}
            , {'title': '처리 일시', 'data': 'last_upd_date', 'render': function(data, type, row) {
                    return common.convertToDate(data, 'YYYY-MM-DD HH:mm:ss');
                }}
        ]
        // , 'comments': ''
    },

    'specialList': {
        'url': '/rest/menu/special/dalList'
        , 'columns': [
            {'title': '회원번호', 'data': 'mem_no', 'render': function(data, type, row) {
                return '<a href="javascript://" class="_openMemberPop" data-memno="' + row.mem_no + '">' + data + '</a>' +
                    '<a href="javascript://" style="display:none;" class="_dalDetail" data-reqidx="' + row.req_idx + '"></a>'
                }}
            , {'title': '등록일', 'data': 'reg_date', 'render': function(data, type, row) {
                    return common.convertToDate(data, 'YYYY-MM-DD HH:mm:ss');
                }}
            , {'title': '관리자 등록여부', 'data': 'is_force', 'render': function(data, type, row) {
                    return util.getCommonCodeLabel(data, special_isForce);
                }}
            , {'title': '순서', 'data': 'order'}
            , {'title': '등록자', 'data': 'op_name'}
        ]
        // , 'comments': ''
    },

    'modalSpecialList': {
        'url': '/rest/member/member/list'
        , 'columns': [
            {'title': 'memNo', 'data': 'mem_no' , 'visible' : false},
            {'title': 'UserID', 'data': 'mem_userid','width':'50px'},
            {'title': '닉네임', 'data': 'mem_nick','width':'100px'},
            {'title': '연락처', 'data': 'mem_phone','width':'50px'},
            {'title': '스페셜DJ등록하기', 'data': '','defaultContent': '', 'render': function (data, type, row, meta) {
                    return '<a onclick="javascript:setModalMemeberData('+meta.row+')" data-dismiss="modal">' + "[등록하기]" + '</a>'
                },'width':'60px'},
        ]
    },
};