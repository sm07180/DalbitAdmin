var levelDataTableSource = {
    'levelList': {
        'url': '/rest/status/level/list'

        , 'columns': [
            {'title': 'level', 'data' : 'level', 'width':'80px'}
            ,{'title': 'Exp(%)', 'data' : 'memExp', 'width':'80px', 'render': function (data, type, row, meta) {
                    return data + "(" + Number(row.expPro).toFixed(2) + "%)";
                }}
            ,{'title': '다음Level<br/>Exp(수치)', 'data' : 'nextLevelExp', 'width':'80px'}
            ,{'title': '레벨등급', 'data' : 'grade', 'width':'80px'}
            ,{'title': 'UserID', 'data' : 'mem_userid', 'width':'80px', 'render': function (data, type, row, meta) {
                    return util.memNoLink(data, row.mem_no);
                }}
            ,{'title': '닉네임', 'data' : 'mem_nick', 'width':'80px'}
            ,{'title': '성별(나이)', 'data' : 'mem_sex', 'width':'80px','render' : function(data, type, row, meta) {
                    return common.sexIcon(data) + "(" + row.age.split('.')[0] + "세)";
                }}
            ,{'title': '태그', 'data' : '', 'width':'80px', 'render': function (data, type, row, meta) {
                    var tmp = "";
                    if(row.newdj_badge == "1"){
                        tmp = tmp + '<span class ="label" style="background-color:#d9c811">' + "신입" + '</span><br/>';
                    }
                    if(row.specialdj_badge == "1"){
                        tmp = tmp + '<span class ="label" style="background-color:red">' + "스페셜DJ" + '</span><br/>';
                    }
                    if(row.badge_value != "" && row.badge_value != null){
                        if(row.badge_value == 1){
                            tmp = tmp + '<span class ="label" style="background-color:#006ad9">' + "회장" + '</span><br/>';
                        }else if(row.badge_value == 2){
                            tmp = tmp + '<span class ="label" style="background-color:#d97c07">' + "부회장" + '</span><br/>';
                        }else if(row.badge_value == 3){
                            tmp = tmp + '<span class ="label" style="background-color:#0ed900">' + "사장" + '</span><br/>';
                        }
                    }
                    return tmp;
                }}
            ,{'title': '최근방송일시', 'data' : 'broadDate', 'width':'80px'}
            ,{'title': '최근청취일시', 'data' : 'listenDate', 'width':'80px'}
            ,{'title': '보유달', 'data' : 'dal', 'width':'80px','render' : function(data){
                    return common.addComma(data) + "개"
                }}
            ,{'title': '보유별', 'data' : 'byeol', 'width':'80px','render' : function(data){
                    return common.addComma(data) + "개"
                }}
        ]
    },
}