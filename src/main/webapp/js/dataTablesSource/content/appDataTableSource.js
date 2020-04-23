var AppDataTableSource = {
    'appInfo': {
        'url': '/rest/content/app/list'

        , 'columns': [
            {'title': 'idx', 'data': 'idx'}
            , {'title': 'os', 'data': 'os', 'render' : function(data, type, row) {
                return '<a href="javascript://" class="_appDetail" data-idx="' + row.idx + '">'  + util.getCommonCodeLabel(data, content_radioApp) + '</a>' + ' (클릭 시 상세 보기)'
                }}
            , {'title': 'version', 'data' : 'version'}
            , {'title': '강제업데이트 여부', 'data': 'is_force', 'render' : function(data) {
                return util.getCommonCodeLabel(data, content_isForce);
                }}
            , {'title': '사용여부', 'data': 'is_use', 'render' : function(data) {
                return util.getCommonCodeLabel(data, content_isUse);
                }}
            , {'title': '등록일', 'data': 'reg_date', 'render' : function(data) {
                return common.convertToDate(data);
                }}
            , {'title': '등록자', 'data': 'opName'}
        ]
        , 'comments': ''
    },
};