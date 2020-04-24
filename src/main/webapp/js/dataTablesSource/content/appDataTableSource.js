var AppDataTableSource = {
    'appInfo': {
        'url': '/rest/content/app/list'

        , 'columns': [
            {'title': '플랫폼', 'data': 'os', 'render' : function(data, type, row) {
                return '<a href="javascript://" class="_appDetail" data-idx="' + row.idx + '">'  + util.getCommonCodeLabel(data, content_radioApp) + '</a>'
                }}
            , {'title': 'version', 'data' : 'version'}
            , {'title': '빌드번호', 'data': 'build_no'}
            , {'title': '최소 업데이트 빌드번호', 'data': 'upBuild_no'}
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