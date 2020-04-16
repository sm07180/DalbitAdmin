var AppDataTableSource = {
    'appInfo': {
        'url': '/rest/content/app/list'

        , 'columns': [
            {'title': 'idx', 'data': 'idx'}
            , {'title': 'os', 'data': 'os', 'render' : function(data) {
                if(data == 1) {
                    return '안드로이드'
                } else {
                    return 'IOS'
                }
                }}
            , {'title': 'version', 'data' : 'version'}
            , {'title': '강제업데이트 여부', 'data': 'is_force', 'render' : function(data, type, row) {
                return '<a href="javascript://" class="_appDetail" data-idx="' + row.idx + '">' + data + '</a>'
                }}
            , {'title': '사용함', 'data': 'is_use', 'render' : function(data) {
                if(data == 1) {
                    return '사용함'
                } else {
                    return '사용 안 함'
                }
                }}
            , {'title': '등록일', 'data': 'reg_date', 'render' : function(data) {
                return common.convertToDate(data);
                }}
        ]
        , 'comments': ''
    },
}