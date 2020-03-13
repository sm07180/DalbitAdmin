var MenuDataTableSource = {
    'recommend': {
        'url': '/rest/menu/recommend/list'
        , 'columns': [
            {'title': '순위', 'data': '' , 'defaultContent': '', 'width' : '100px', 'render': function (data, type, row, meta) {
                    return '<button type="button" class="btn btn-info _down"><i class="toggle-icon fa fa-angle-down"></i></button> ' +
                        '<button type="button" class="btn btn-danger _up"><i class="toggle-icon fa fa-angle-up"></i></button>'
                }},
            {'title': 'Main추천상태', 'data': '', 'defaultContent': ''},
            {'title': '레벨/등급', 'data': 'level', 'defaultContent': ''},
            {'title': '프로필이미지', 'data': 'image_profile', 'defaultContent': '', 'render' : function(data, type, row, meta){
                    return '<img src="'+ IMAGE_SERVER_URL + data+'" width="100px" height="100px" />';
                }},
            {'title': 'UserID', 'data': 'mem_id', 'defaultContent': '', 'render' : function(data, type, row, meta){
                    return util.memNoLink(data, row.mem_no);
                }},
            {'title': 'User닉네임', 'data': 'mem_nick', 'defaultContent': ''},
            {'title': '보유결제금액', 'data': 'gold', 'defaultContent': '', 'render' : function(data){
                    return common.addComma(data);
                }},
            {'title': '보낸선물수', 'data': 'item_cnt', 'defaultContent': '', 'render' : function(data){
                    return common.addComma(data);
                }},
            {'title': '방송방 당 평균 받은 선물', 'data': 'receive_average_cnt', 'defaultContent': '', 'render' : function(data){
                    return common.addComma(data);
                }},
            {'title': '누적방송횟수', 'data': 'broad_cnt', 'defaultContent': '', 'render' : function(data){
                    return common.addComma(data);
                }},
            {'title': '최초방송시작일', 'data': 'first_broad_date', 'defaultContent': '', 'render' : function(data){
                    return common.convertToDate(data);
                }},
            {'title': '최근방송일시', 'data': 'last_broad_date', 'defaultContent': '', 'render' : function(data){
                    return common.convertToDate(data);
                }},
        ]
        //, 'comments': '1) 추천/인기 DJ Main 노출 수는 10명입니다. 2) 추천/인기DJ를 변경하시려면 DJ를 검색하여 결과리스트에서 [리스트추가하기]를 한 후 추천중 상태로 변경하세요.'
    },

    'best': {
        'url': '/rest/menu/best/list'
        , 'columns': [
            {'title': '순위', 'data': '' , 'defaultContent': '', 'width' : '100px', 'render': function (data, type, row, meta) {
                    return '<button type="button" class="btn btn-info _down"><i class="toggle-icon fa fa-angle-down"></i></button> ' +
                        '<button type="button" class="btn btn-danger _up"><i class="toggle-icon fa fa-angle-up"></i></button>'
                }},
            {'title': 'Main추천상태', 'data': '', 'defaultContent': ''},
            {'title': '레벨/등급', 'data': 'level', 'defaultContent': ''},
            {'title': '프로필이미지', 'data': 'image_profile', 'defaultContent': '', 'render' : function(data, type, row, meta){
                    return '<img src="'+ IMAGE_SERVER_URL + data+'" width="100px" height="100px" />';
                }},
            {'title': 'UserID', 'data': 'mem_id', 'defaultContent': '', 'render' : function(data, type, row, meta){
                    return util.memNoLink(data, row.mem_no);
                }},
            {'title': 'User닉네임', 'data': 'mem_nick', 'defaultContent': ''},
            {'title': '보유결제금액', 'data': 'gold', 'defaultContent': '', 'render' : function(data){
                    return common.addComma(data);
                }},
            {'title': '보낸선물수', 'data': 'item_cnt', 'defaultContent': '', 'render' : function(data){
                    return common.addComma(data);
                }},
            {'title': '방송방 당 평균 받은 선물', 'data': 'receive_average_cnt', 'defaultContent': '', 'render' : function(data){
                    return common.addComma(data);
                }},
            {'title': '누적방송횟수', 'data': 'broad_cnt', 'defaultContent': '', 'render' : function(data){
                    return common.addComma(data);
                }},
            {'title': '최초방송시작일', 'data': 'first_broad_date', 'defaultContent': '', 'render' : function(data){
                    return common.convertToDate(data);
                }},
            {'title': '최근방송일시', 'data': 'last_broad_date', 'defaultContent': '', 'render' : function(data){
                    return common.convertToDate(data);
                }},
        ]
        //, 'comments': '1) 추천/인기 DJ Main 노출 수는 10명입니다. 2) 추천/인기DJ를 변경하시려면 DJ를 검색하여 결과리스트에서 [리스트추가하기]를 한 후 추천중 상태로 변경하세요.'
    },

    'rank_DJ': {
        'url': '/rest/menu/best/list'
        , 'columns': [
            {'title': '순위', 'data': '' , 'defaultContent': '', 'width' : '100px', 'render': function (data, type, row, meta) {
                    return '<button type="button" class="btn btn-info _down"><i class="toggle-icon fa fa-angle-down"></i></button> ' +
                        '<button type="button" class="btn btn-danger _up"><i class="toggle-icon fa fa-angle-up"></i></button>'
                }},
            {'title': 'Main추천상태', 'data': '', 'defaultContent': ''},
            {'title': '레벨/등급', 'data': 'level', 'defaultContent': ''},
            {'title': '프로필이미지', 'data': 'image_profile', 'defaultContent': '', 'render' : function(data, type, row, meta){
                    return '<img src="'+ IMAGE_SERVER_URL + data+'" width="100px" height="100px" />';
                }},
            {'title': 'UserID', 'data': 'mem_id', 'defaultContent': '', 'render' : function(data, type, row, meta){
                    return util.memNoLink(data, row.mem_no);
                }},
            {'title': 'User닉네임', 'data': 'mem_nick', 'defaultContent': ''},
            {'title': '보유결제금액', 'data': 'gold', 'defaultContent': '', 'render' : function(data){
                    return common.addComma(data);
                }},
            {'title': '보낸선물수', 'data': 'item_cnt', 'defaultContent': '', 'render' : function(data){
                    return common.addComma(data);
                }},
            {'title': '방송방 당 평균 받은 선물', 'data': 'receive_average_cnt', 'defaultContent': '', 'render' : function(data){
                    return common.addComma(data);
                }},
            {'title': '누적방송횟수', 'data': 'broad_cnt', 'defaultContent': '', 'render' : function(data){
                    return common.addComma(data);
                }},
            {'title': '최초방송시작일', 'data': 'first_broad_date', 'defaultContent': '', 'render' : function(data){
                    return common.convertToDate(data);
                }},
            {'title': '최근방송일시', 'data': 'last_broad_date', 'defaultContent': '', 'render' : function(data){
                    return common.convertToDate(data);
                }},
        ]
        //, 'comments': 'DJ/Fan랭킹 Main 노출 수는 1위부터 5위까지 총5명입니다.'
    }
}
