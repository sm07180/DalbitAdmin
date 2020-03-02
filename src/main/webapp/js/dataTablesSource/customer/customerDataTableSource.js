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

var customerDataTableSource = {
    'DeclareList': {
        'url': '/rest/customer/declaration/list'

        ,'columns': [
            /*{'title': '플랫폼 구분', 'data': 'type', 'render': function (data) {
                    if(data == 1){
                        return "Android";
                    }else if(data == 2){
                        return "<a> IOS </a>";
                    }else{
                        return "PC";
                    }
                }}*/
            {'title': '플랫폼 구분', 'data' : 'memNo'}
            , {'title': '신고 구분', 'data' : 'memBirth'}
            ,{'title': '신고 UserID', 'data': 'memId',
                'render': function(data, type, row, meta) {return '<a href="javascript://" onclick="javascript:getDeclare_detail('+meta.row+');">' + data + '</a>'}}
                /* data는 데이터테이블에 들어가는 실제 데이터, row는 한 열, meta는 데이터의 메타정보*/
            ,{'title': '신고 대상 UserID', 'data': 'memId'}
            ,{'title': '접수 일시', 'data': 'memJoin'}
            ,{'title': '처리 일시', 'data': 'memJoin'}
            ,{'title': '처리 상태', 'data': 'memState'}
            ,{'title': '처리자', 'data': 'memPhone'}
        ]
        , 'comments' : '최신 신고자를 기준으로 상위 구성하고, 확인하고자 하는 회원 정보 내 선택을 클릭하면 상세정보 및 회원 신고조치를 처리할 수 있습니다.'
    },
}
