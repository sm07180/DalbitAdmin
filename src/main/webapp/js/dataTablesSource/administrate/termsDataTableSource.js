var termsDataTableSource = {
    'termList': {
        'url': '/rest/administrate/terms/list'
        , 'columns': [
            {'title': '게시여부', 'data': 'view_on', 'render' : function(data){
                    if(data == 1)
                        return "ON";
                    else
                        return "OFF";
                }},
            {'title': '플랫폼', 'data': 'platform', 'render' : function(data, type, row, meta){
                    return util.getCommonCodeLabel(data, terms_platform) ;
                }},
            {'title': '구분', 'data': 'terms_type', 'render' : function(data, type, row, meta){
                    return util.getCommonCodeLabel(data, terms_type) ;
                }},
            {'title': '약관명', 'data': 'terms_title', 'render': function (data, type, row, meta) {
                    return '<a href="javascript://" class="getTermsDetail" onclick="javascript:getTermsDetail('+meta.row+');">' + data + '</a>'
                }},
            {'title': 'Version', 'data': 'version'},
            {'title': '등록일시', 'data': 'regDateFormat'},
            {'title': '등록자', 'data': 'op_name'},
            {'title': '수정일시', 'data': 'lastUpdDateFormat'},
            {'title': '수정자', 'data': 'last_op_name'},
        ]
    },
}