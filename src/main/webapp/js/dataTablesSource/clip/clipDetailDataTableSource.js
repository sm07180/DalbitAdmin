var ClipDetailDataTableSource = {

    'listenList': {
        'url': '/rest/clip/history/listen/list'

        , 'columns': [
            {'title': '청취일시', 'width':'70px', 'data': 'listenDate', 'render': function (data, type, row, meta) {
                    return data;
                }},
            {'title': '청취회원', 'width':'70px', 'data': 'listenMemNo', 'render': function (data, type, row, meta) {
                    return '<a href="javascript://" class="_openMemberPop" data-memno="' + data + '">' + data + '</a><br>' + row.listenMemNick;
                }},
            {'title': '성별(나이)', 'width':'70px', 'data': 'listenMemSex', 'render': function (data, type, row, meta) {
                    return common.sexIcon(data,row.listenMemBirthYear);
                }},
            {'title': '청취회원IP', 'width':'70px', 'data': 'listenMemIp', 'render': function (data, type, row, meta) {
                    return data;
                }},
            {'title': '청취수', 'width':'50px', 'data': 'listenPlayCnt', 'render': function (data, type, row, meta) {
                    return common.addComma(data);
                }},
            {'title': '좋아요 수', 'width':'50px', 'data': 'listenGoodCnt', 'render': function (data, type, row, meta) {
                    return common.addComma(data);
                }},
        ],

        'createdRow' : function( row, data, dataIndex ) {
            if(data.inner == 1){    // 테스트계정 row 색상 표시
                $(row).addClass("bg-testMember");
            }
        }
    },


    'goodList': {
        'url': '/rest/clip/history/good/list'

        , 'columns': [
            {'title': '좋아요 일시', 'width':'70px', 'data': 'listenGoodDate', 'render': function (data, type, row, meta) {
                    return data;
                }},
            {'title': '청취회원', 'width':'70px', 'data': 'listenMemNo', 'render': function (data, type, row, meta) {
                    return '<a href="javascript://" class="_openMemberPop" data-memno="' + data + '">' + data + '</a><br>' + row.listenMemNick;
                }},
            {'title': '성별(나이)', 'width':'70px', 'data': 'listenMemSex', 'render': function (data, type, row, meta) {
                    return common.sexIcon(data,row.listenMemBirthYear);
                }},
            {'title': '청취수', 'width':'50px', 'data': 'listenPlayCnt', 'render': function (data, type, row, meta) {
                    return common.addComma(data);
                }},
        ],

        'createdRow' : function( row, data, dataIndex ) {
            if(data.inner == 1){    // 테스트계정 row 색상 표시
                $(row).addClass("bg-testMember");
            }
        }
    },


    'giftList': {
        'url': '/rest/clip/history/gift/list'

        ,  'columns': [
            {'title': '선물보낸회원', 'width':'70px', 'data': 'memNo', 'render': function (data, type, row, meta) {
                    return '<a href="javascript://" class="_openMemberPop" data-memno="' + data + '">' + data + '</a><br>' + row.memNick;
                }},
            {'title': '성별(나이)', 'width':'70px', 'data': 'memSex', 'render': function (data, type, row, meta) {
                    return common.sexIcon(data,row.memBirthYear);
                }},
            {'title': '선물받은일시', 'width':'70px', 'data': 'lastUpdDate', 'render': function (data, type, row, meta) {
                    return data;
                }},
            {'title': '이미지', 'width':'50px', 'data': 'itemThumbnail', 'render': function (data, type, row, meta) {
                    if(common.isEmpty(data)){
                        return "";
                    }
                    return '<img class="thumbnail fullSize_background" src="'+ data +'" width="50px" max-height="50px" />';

                    // return data;
                }},
            {'title': '선물명', 'width':'70px', 'data': 'itemName', 'render': function (data, type, row, meta) {
                    return data;
                }},
            {'title': '받은선물 개수', 'width':'50px', 'data': 'itemCnt', 'render': function (data, type, row, meta) {
                    return common.addComma(data);
                }},
            {'title': '받은선물 별 수', 'width':'50px', 'data': 'gold', 'render': function (data, type, row, meta) {
                    return common.addComma(data);
                }},
            {'title': '누적<br>받은선물 개수', 'width':'50px', 'data': 'itemTotalCnt', 'render': function (data, type, row, meta) {
                    return common.addComma(data);
                }},
            {'title': '누적<br>받은선물 별 수', 'width':'50px', 'data': 'goldTotalCnt', 'render': function (data, type, row, meta) {
                    return common.addComma(data);
                }}
        ],

        'createdRow' : function( row, data, dataIndex ) {
            if(data.inner == 1){    // 테스트계정 row 색상 표시
               $(row).addClass("bg-testMember");
            }
        }
    },


    'replyList': {
        'url': '/rest/clip/history/reply/detail/list'

        , 'columns': [
            {'title': '댓글 등록 일시', 'width':'70px', 'data': 'writeDate', 'render': function (data, type, row, meta) {
                    return data;
                }},
            {'title': '등록회원', 'width':'70px', 'data': 'writerMemNo', 'render': function (data, type, row, meta) {
                    return '<a href="javascript://" class="_openMemberPop" data-memno="' + data + '">' + data + '</a><br>' + row.memNick;
                }},
            {'title': '성별(나이)', 'width':'70px', 'data': 'memSex', 'render': function (data, type, row, meta) {
                    return common.sexIcon(data,row.memBirthYear);
                }},
            {'title': '누적 댓글 수', 'width':'70px', 'data': 'replyWriteCnt', 'render': function (data, type, row, meta) {
                    return common.addComma(data);
                }},
            {'title': '댓글 내용', 'width':'50px', 'data': 'contents', 'render': function (data, type, row, meta) {
                    return data;
                }},
            {'title': '상태', 'width':'45px', 'data': 'status', 'render': function (data, type, row, meta) {
                    return util.getCommonCodeLabel(data, clip_reply_stateType_clipDetail);
                }},
            {'title': '삭제', 'width':'45px', 'data': 'status', 'render': function (data, type, row, meta) {
                    if(data == 2){
                        return "-";
                    }else{
                        return '<a href="javascript:;" onclick="deleteClipReply(' + row.replyIdx + ')">[삭제]</a>';
                    }
                }},
        ],

        'createdRow' : function( row, data, dataIndex ) {
            if(data.inner == 1){    // 테스트계정 row 색상 표시
                $(row).addClass("bg-testMember");
            }
        }
    },


}
