var appVersionDataTableSource = {
    'appVersionList': {
        'url': '/rest/status/appVersion/selectTotalList'

        , 'columns': [
            {'title' : '플랫폼', 'data' : 'platform', 'render' : function(data) {
                return util.getCommonCodeLabel(data, appVersion_platform);
                }}
            , {'title' : '버전', 'data' : 'appVersion'}
            , {'title' : '빌드번호', 'data' : 'buildVersion', 'render': function(data) {
                if(!common.isEmpty(data)) {
                    return data;
                } else {
                    return '-';
                }
                }}
            , {'title' : '사용자', 'data' : 'userCnt', 'render' : function(data) {
                if(data != 0) {
                    return common.addComma(data) + "명";
                } else {
                    return '-';
                }
                }}
            , {'title' : '업데이트 날짜', 'data' : 'reg_date', 'render' : function(data) {
                return common.convertToDate(data);
                }}
        ]
    },
};