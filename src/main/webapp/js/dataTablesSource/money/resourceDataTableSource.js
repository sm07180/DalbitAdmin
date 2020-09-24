var resourceDataTableSource = {
    'dalInc_payDetail': {
        'url': '/rest/money/resource/dal/pay/detail/list'
        , 'columns': [
            {'title': '회원번호 <br /> 닉네임', 'data' : 'memNo', 'width':'80px','render':function (data, type, row, meta) {
                    return util.memNoLink(data, data) + '<br/>' + row.memNick;
                }},
            {'title': '성별', 'data' : 'memSex', 'width':'80px','render':function (data, type, row, meta) {
                    return common.sexIcon(data, row.memBirthYear);
                }},
            {'title': '달수', 'data' : 'payDalCnt', 'width':'80px','render':function (data, type, row, meta) {
                    return common.addComma(data) + " 달";
                }},
            {'title': '결제금액', 'data' : 'payAmt', 'width':'80px','render':function (data, type, row, meta) {
                    return common.addComma(data) + " 원";
                }},
            {'title': '결제수단', 'data' : 'payWay', 'width':'80px'},
            {'title': '일시', 'data' : 'payDate', 'width':'80px'},
        ]
        , 'comments': ''
        , 'createdRow' : function( row, data, dataIndex ) {
            if(data.inner == 1){    // 테스트계정 row 색상 표시
                $(row).addClass("bg-testMember");
            }
        }
    },

    'dalInc_giftDirect': {
        'url': '/rest/money/resource/dal/direct/list'
        , 'columns': [
            {'title': '보낸 회원번호 <br /> 닉네임', 'data' : 'memNo', 'width':'80px','render':function (data, type, row, meta) {
                    return util.memNoLink(data, data) + '<br/>' + row.memNick;
                }},
            {'title': '성별', 'data' : 'memSex', 'width':'60px','render':function (data, type, row, meta) {
                    return common.sexIcon(data, row.memBirthYear, true);
                }},
            {'title': '받은 회원번호 <br /> 닉네임', 'data' : 'recvMemNo', 'width':'80px','render':function (data, type, row, meta) {
                    return util.memNoLink(data, data) + '<br/>' + row.recvMemNick;
                }},
            {'title': '성별', 'data' : 'recvMemSex', 'width':'60px','render':function (data, type, row, meta) {
                    return common.sexIcon(data, row.recvMemBirthYear, true);
                }},
            {'title': '이미지', 'data' : 'itemThumbnail', 'width':'60px','render':function (data, type, row, meta) {
                    return '<img class="fullSize_background _webpImage" src="'+ data +'" width="50px" height="50px" data-webpImage="' + row.webpImage+ '"/>';
                }},
            {'title': '아이템명', 'data' : 'itemName', 'width':'60px'},
            {'title': '달 수', 'data' : 'dalCnt', 'width':'50px','render':function (data, type, row, meta) {
                    return common.addComma(data) + " 달";
                }},
            {'title': '결제금액', 'data' : 'dalAmtCnt', 'width':'50px','render':function (data, type, row, meta) {
                    return common.addComma(data);
                }},
            {'title': '비밀여부', 'secret' : 'payAmt', 'width':'60px','render':function (data, type, row, meta) {
                    if(data == "1"){
                        return "비밀선물";
                    }
                    return "";
                }},
            {'title': '일시', 'data' : 'lastUpdDate', 'width':'80px'},
        ]
        , 'comments': ''
        , 'createdRow' : function( row, data, dataIndex ) {
            if(data.inner == 1){    // 테스트계정 row 색상 표시
                $(row).addClass("bg-testMember");
            }
        }
    },

    'dalInc_dalChange': {
        'url': '/rest/money/resource/dal/pay/detail/list'
        , 'columns': [
            {'title': '회원번호 <br /> 닉네임', 'data' : 'memNo', 'width':'80px','render':function (data, type, row, meta) {
                    return util.memNoLink(data, data) + '<br/>' + row.memNick;
                }},
            {'title': '성별', 'data' : 'memSex', 'width':'80px','render':function (data, type, row, meta) {
                    return common.sexIcon(data, row.memBirthYear);
                }},
            {'title': '교환별수', 'data' : 'byeolCnt', 'width':'80px','render':function (data, type, row, meta) {
                    return common.addComma(data) + " 별";
                }},
            {'title': '교환후 달수', 'data' : 'dalCnt', 'width':'80px','render':function (data, type, row, meta) {
                    return common.addComma(data) + " 달";
                }},
            {'title': '일시', 'data' : 'lastUpdDate', 'width':'80px'},
        ]
        , 'comments': ''
        , 'createdRow' : function( row, data, dataIndex ) {
            if(data.inner == 1){    // 테스트계정 row 색상 표시
                $(row).addClass("bg-testMember");
            }
        }
    },

    'dalInc_joinReward': {
        'url': '/rest/money/resource/dal/pay/detail/list'
        , 'columns': [
            {'title': '회원번호 <br /> 닉네임', 'data' : 'memNo', 'width':'80px','render':function (data, type, row, meta) {
                    return util.memNoLink(data, data) + '<br/>' + row.memNick;
                }},
            {'title': '성별', 'data' : 'memSex', 'width':'80px','render':function (data, type, row, meta) {
                    return common.sexIcon(data, row.memBirthYear);
                }},
            {'title': '달수', 'data' : 'dalCnt', 'width':'80px','render':function (data, type, row, meta) {
                    return common.addComma(data) + " 달";
                }},
            {'title': '보상상세', 'data' : 'rewardType', 'width':'80px'},
            {'title': '일시', 'data' : 'lastUpdDate', 'width':'80px'},
        ]
        , 'comments': ''
        , 'createdRow' : function( row, data, dataIndex ) {
            if(data.inner == 1){    // 테스트계정 row 색상 표시
                $(row).addClass("bg-testMember");
            }
        }
    },

    'dalDec_gift': {
        'url': '/rest/money/resource/dal/direct/list'
        , 'columns': [
            {'title': '보낸 회원번호 <br /> 닉네임', 'data' : 'memNo', 'width':'80px','render':function (data, type, row, meta) {
                    return util.memNoLink(data, data) + '<br/>' + row.memNick;
                }},
            {'title': '성별', 'data' : 'memSex', 'width':'60px','render':function (data, type, row, meta) {
                    return common.sexIcon(data, row.memBirthYear, true);
                }},
            {'title': '받은 회원번호 <br /> 닉네임', 'data' : 'recvMemNo', 'width':'80px','render':function (data, type, row, meta) {
                    return util.memNoLink(data, data) + '<br/>' + row.recvMemNick;
                }},
            {'title': '성별', 'data' : 'recvMemSex', 'width':'60px','render':function (data, type, row, meta) {
                    return common.sexIcon(data, row.recvMemBirthYear, true);
                }},
            {'title': '이미지', 'data' : 'itemThumbnail', 'width':'60px','render':function (data, type, row, meta) {
                    return '<img class="fullSize_background _webpImage" src="'+ data +'" width="50px" height="50px" data-webpImage="' + row.webpImage+ '"/>';
                }},
            {'title': '아이템명', 'data' : 'itemName', 'width':'60px'},
            {'title': '선물 수', 'data' : 'itemCnt', 'width':'50px','render':function (data, type, row, meta) {
                    return common.addComma(data) + " 달";
                }},
            {'title': '비밀여부', 'secret' : 'payAmt', 'width':'60px','render':function (data, type, row, meta) {
                    if(data == "1"){
                        return "비밀선물";
                    }
                    return "";
                }},
            {'title': '선물 달', 'data' : 'dalCnt', 'width':'50px','render':function (data, type, row, meta) {
                    return common.addComma(data);
                }},
            {'title': '일시', 'data' : 'lastUpdDate', 'width':'80px'},
        ]
        , 'comments': ''
        , 'createdRow' : function( row, data, dataIndex ) {
            if(data.inner == 1){    // 테스트계정 row 색상 표시
                $(row).addClass("bg-testMember");
            }
        }
    },

    'dalDec_payDetail': {
        'url': '/rest/money/resource/dal/pay/detail/list'
        , 'columns': [
            {'title': '회원번호 <br /> 닉네임', 'data' : 'memNo', 'width':'80px','render':function (data, type, row, meta) {
                    return util.memNoLink(data, data) + '<br/>' + row.memNick;
                }},
            {'title': '성별', 'data' : 'memSex', 'width':'80px','render':function (data, type, row, meta) {
                    return common.sexIcon(data, row.memBirthYear);
                }},
            {'title': '달 수', 'data' : 'payDalCnt', 'width':'80px','render':function (data, type, row, meta) {
                    return common.addComma(data) + "달";
                }},
            {'title': '취소금액', 'data' : 'payAmt', 'width':'80px','render':function (data, type, row, meta) {
                    return common.addComma(data) + "원";
                }},
            {'title': '일시', 'data' : 'payDate', 'width':'80px'},
        ]
        , 'comments': ''
        , 'createdRow' : function( row, data, dataIndex ) {
            if(data.inner == 1){    // 테스트계정 row 색상 표시
                $(row).addClass("bg-testMember");
            }
        }
    },

    'dalDec_memState': {
        'url': '/rest/money/resource/dal/member/state/list'
        , 'columns': [
            {'title': '회원번호 <br /> 닉네임', 'data' : 'memNo', 'width':'80px','render':function (data, type, row, meta) {
                    return util.memNoLink(data, data) + '<br/>' + row.memNick;
                }},
            {'title': '성별', 'data' : 'memSex', 'width':'80px','render':function (data, type, row, meta) {
                    return common.sexIcon(data, row.memBirthYear);
                }},
            {'title': '보유 달', 'data' : 'dalCnt', 'width':'80px','render':function (data, type, row, meta) {
                    return common.addComma(data) + " 달";
                }},
            {'title': '보유 별', 'data' : 'byeolCnt', 'width':'80px','render':function (data, type, row, meta) {
                    return common.addComma(data) + " 별";
                }},
            {'title': '상태', 'data' : 'memState', 'width':'80px'},
            {'title': '일시', 'data' : 'lastUpdDate', 'width':'80px'},
        ]
        , 'comments': ''
        , 'createdRow' : function( row, data, dataIndex ) {
            if(data.inner == 1){    // 테스트계정 row 색상 표시
                $(row).addClass("bg-testMember");
            }
        }
    },
}