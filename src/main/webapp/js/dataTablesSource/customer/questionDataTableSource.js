/**
 * ========= DataTable Source =============
 * key:{
 *      'url': ajax호출 URL (필수)
 *      ','columns': [       (필수)
 *          {'title': 필드헤더명, 'data': 출력데이터변수명, 'defaultContent': 값이 없을 경우 Default값}
 *      ]
 * }
 *
 **/

var questionDataTableSource = {
    'questList': {
        'url': '/rest/customer/question/list'
        , 'columns': [
            {'title': '문의유형', 'data': 'slct_type','width':'80px','render': function (data, type, row, meta) {
                    return util.getCommonCodeLabel(data, question_type);
                }},
            {'title': '플랫폼', 'data': 'platform','width':'60px'},
            {'title': 'Browser', 'data': 'browser','width':'70px'},
            {'title': '문의자UserId', 'data': 'mem_userid','width':'80px','render': function (data, type, row, meta) {
                    var tmp = util.memNoLink(data, row.mem_no);
                    tmp = tmp + '<br/>' +  row.mem_level +" / "+ row.mem_grade;
                    return tmp;
                }},
            {'title': '문의자닉네임', 'data': 'mem_nick','width':'100px','render':function (data,type,row,meta){
                    if(common.isEmpty(data)){
                        return '탈퇴회원';
                    }else{
                        return data;
                    }            
                }},
            {'title': '성별', 'data': 'mem_sex', 'width':'70px', 'render': function (data, type, row, meta) {
                    return common.sexIcon(data);
                }},
            {'title': '문의', 'data': 'totalQnaCnt','width':'60px','render':function (data,type,row,meta){
                    return common.addComma(data) + " 건";
                }},
            {'title': '처리', 'data': 'totalOpCnt','width':'60px','render':function (data,type,row,meta){
                    return common.addComma(data) + " 건";
                }},

            {'title': '문의제목', 'data': 'question_title','width':'250px','render': function (data, type, row, meta) {
                    return '<a href="javascript://" class="getQuestDetail" onclick="javascript:getQuestDetail('+meta.row+');">'+data+'</a>'
                }},
            {'title': '접수일시', 'data': 'writeDateFormat','width':'120px'},
            {'title': '처리일시', 'data': 'opDateFormat','width':'120px'},
            {'title': '첨부파일', 'data': 'add_file','width':'60px', 'render' : function(data, type, row, meta){
                    var fileCnt = common.isEmpty(data) ? 0 : data.split(",").length;
                    return fileCnt +'건';
                }},
            {'title': '처리상태', 'data': 'state','width':'60px','render' : function(data){
                    return util.getCommonCodeLabel(data, question_status);
                }},
            {'title': '알림', 'data': 'memNo','width':'60px'},
            {'title': '처리자', 'data': 'op_name','width':'80px'},
        ]
        , 'comments': 'ㆍ1:1 문의 처리 및 상세정보 확인 후 해당 정보를 확인 및 답변, 수정할 수 있습니다.'
    },

}
