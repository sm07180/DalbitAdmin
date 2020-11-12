var EventRouletteDataTableSource = {
    'applyList' : {
        'url' : '/rest/content/event/roulette/selectApplyList'
        , 'columns': [
            {'title': '프로필 사진', 'data' : 'image_profile', 'render' : function(data, type, row) {
                    return '<img class="thumbnail fullSize_background" src="' + common.profileImage(PHOTO_SERVER_URL, data, row.mem_sex) + '" width="65px" height="65px" />';
                }},
            {'title': '회원번호', 'data' : 'mem_no', 'render' : function(data, type, row, meta) {
                    return util.memNoLink(data, row.mem_no);
                }},
            {'title': 'UserId', 'data' : 'mem_userid', 'render' : function(data, type, row, meta) {
                    return data;
                }},
            {'title': '닉네임', 'data' : 'mem_nick', 'render' : function(data) {
                    return data;
                }},
            {'title': '성별', 'data' : 'mem_sex', 'render' : function(data) {
                    return common.sexIcon(data);
                }},
            {'title': '참여일시', 'data' : 'apply_date', 'render' : function(data) {
                    return data;
                }},
            {'title': '접수일시', 'data' : 'win_date', 'render' : function(data) {
                if(common.isEmpty(data)){
                    return '-';
                }
                return data;
                }},
            {'title': '받은 달', 'data' : 'item_no', 'render' : function(data) {
                    if(data == 1){
                        return '없음';
                    }else if(data == 2){
                        return '1';
                    }else if(data == 3){
                        return '3';
                    }else {
                        return '없음';
                    }
                }},
            {'title': '기프티콘', 'data' : 'item_no', 'render' : function(data) {
                    if(-1 < '|1|2|3|'.indexOf(data)){
                        return '없음';
                    }else if(data == 4 || data == 14 || data == 24){
                        return "A";
                    }else if(data == 5 || data == 15 || data == 25){
                        return "B";
                    }else if(data == 6 || data == 26 || data == 26){
                        return "C";
                    }else if(data == 7 || data == 27 || data == 27){
                        return "D";
                    }else if(data == 8 || data == 28 || data == 28){
                        return "E";
                    }
                }},
            {'title': '휴대폰 번호', 'data' : 'phone', 'render' : function(data) {
                    return common.phoneNumHyphen(data);
                }},
        ]
    },
}
