var blockAdmDataTableSource = {
    'blockAdmList': {
        'url': '/rest/customer/blockAdm/list'

        ,'columns': [
            {'title': '차단 유형', 'data': 'block_type', 'render' : function(data) {
                return util.getCommonCodeLabel(data, block_blockType);
                }}
            , {'title': '차단 내역', 'data': 'block_text', 'render': function(data, type, row) {
                return '<a href="javascript://" class="_blockDetail" data-reportidx="'+row.report_idx +'">' + data + '</a>';
                }}
            , {'title': '제재 종류', 'data': 'block_day', 'render' : function(data) {
                return util.getCommonCodeLabel(data, block_blockDay);
                }}
            , {'title': '차단 종료일', 'data': 'block_end_date', 'render' : function(data) {
                return common.convertToDate(data);
                }}
            , {'title': '차단 일시', 'data': 'last_upd_date', 'render' : function(data) {
                return common.convertToDate(data);
                }}
            , {'title': '등록자', 'data': 'op_name'}
        ]
    },
};