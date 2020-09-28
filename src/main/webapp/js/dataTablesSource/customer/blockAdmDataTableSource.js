var blockAdmDataTableSource = {
    'blockAdmList': {
        'url': '/rest/customer/blockAdm/list'

        , 'columns': [
            {'title': '차단 유형', 'data': 'block_type', 'render' : function(data) {
                return util.getCommonCodeLabel(data, block_blockType);
                }}
            , {'title': '차단 내역', 'data': 'block_text', 'render': function(data, type, row) {
                if(row.block_type == 3){
                    return '<a href="javascript://" class="_openMemberPop" data-memno="'+data+'">' + data + '</a>';
                }else{
                    return data;
                }
                }}
            , {'title' : '상세', 'data':'data','render': function (data,type,row){
                return '<button type="button" class="btn btn-default btn-sm _blockDetail" data-idx="'+row.idx+'" ' +
                'data-reportidx="'+row.report_idx +'" data-block_type="'+row.block_type+'" data-block_text="'+row.block_text+'">상세</button>'
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
            , {'title': '직접등록여부', 'data': '', 'render': function(data, type, row) {
                if(!common.isEmpty(row.report_idx)) {
                    return 'N';
                } else {
                    return 'Y';
                }
                }}
        ]
    },


    'blockHistList': {
        'url': '/rest/customer/blockAdm/histList'

        , 'columns': [
            {'title': '수정 내용', 'data': 'edit_contents'}
            , {'title': '수정 타입', 'data': 'edit_type', 'render' : function(data) {
                return util.getCommonCodeLabel(data, blockHist_reviseType);
                }}
            , {'title': '등록 일시', 'data': 'last_upd_date', 'render' : function(data) {
                return common.convertToDate(data);
                }}
            , {'title': '등록자', 'data': 'op_name'}
        ]
    }
};