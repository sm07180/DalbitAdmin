var ItemDataTableSource = {
    'charge': {
        'url': '/rest/content/item/charge/list'

        , 'columns': [
            {'title': '플랫폼', 'data': 'platform', 'defaultContent': 'null.....', 'render': function (data, type, row, meta) {
                    var arrCode = data.split("");
                    if(arrCode.length < 3){
                        return data;
                    }
    
                    var result = "";
                    if(arrCode[0] == "1"){
                        result += "/ PC(WEB) "
                    }
    
                    if(arrCode[1] == "1"){
                        result += "/ Mobile-Android "
                    }
    
                    if(arrCode[2] == "1"){
                        result += "/ Mobile-IOS "
                    }
    
                    if(!common.isEmpty(result)){
                        result = result.substring(1);
                    }
    
                    return result;

            }},
            {'title': '코드', 'data': 'item_code', 'defaultContent': 'null.....', 'render': function (data, type, row, meta) {
                    return data;

            }},
            {'title': '이미지', 'data': 'item_thumbnail', 'defaultContent': 'null.....', 'render': function (data, type, row, meta) {
                    if(common.isEmpty(data)){
                        return "";
                    }

                    // return '<img src="'+data+'?45x45" style="width: 45px; height: 45px;" data-toggle="modal" data-target="#imgModal" onclick="fullSize(this.src);" />'
                    return '<a href="javascript:;"><img src="'  + data + '" style="width: 45px; height: 45px;" data-toggle="modal" data-target="#imgModal" onclick="fullSize(this.src);" /></a>'

            }},
            {'title': '아이템 명', 'data': 'item_name', 'defaultContent': '-', 'render': function (data, type, row, meta) {
                return data;

            }},
            {'title': '타입', 'data': 'item_type', 'defaultContent': '-', 'render': function (data, type, row, meta) {
                    var arrCode = data.split("");
                    if(arrCode.length < 3){
                        return data;
                    }

                    var result = "";
                    if(arrCode[0] == "1"){
                        result += "/ 신규 "
                    }

                    if(arrCode[1] == "1"){
                        result += "/ 인기 "
                    }

                    if(arrCode[2] == "1"){
                        result += "/ 한정 "
                    }

                    if(!common.isEmpty(result)){
                        result = result.substring(1);
                    }

                    return result;
            }},
            {'title': '수량', 'data': 'dal', 'defaultContent': '-', 'render': function (data, type, row, meta) {
                    return data;
            }},
            {'title': '가격', 'data': 'item_price', 'defaultContent': '-', 'render': function (data, type, row, meta) {
                    return data;
            }},
            {'title': 'IOS 가격', 'data': 'item_price_ios', 'defaultContent': '-', 'render': function (data, type, row, meta) {
                    return data;
            }},
            {'title': '할인율', 'data': 'discount_rate', 'defaultContent': '-', 'render': function (data, type, row, meta) {
                    return data + "%";
            }},
            {'title': '설명', 'data': 'desc', 'defaultContent': '-', 'render': function (data, type, row, meta) {
                    return data;
            }},
            {'title': '게시상태', 'data': 'view_yn', 'defaultContent': '-', 'render': function (data, type, row, meta) {
                    if(data == "1"){
                        return "ON";
                    }

                    if(data == "0"){
                        return "OFF";
                    }
            }},
            {'title': '등록/수정일', 'data': 'lastUpdDateFormat', 'defaultContent': '-', 'render': function (data, type, row, meta) {
                return data;

            }},
            {'title': '구매', 'data': 'purchase_count', 'defaultContent': '-', 'render': function (data, type, row, meta) {
                    return data;
            }},
            {'title': '등록자명', 'data': 'op_name', 'defaultContent': '-', 'render': function (data, type, row, meta) {
                    return data;
            }}
        ]
        , 'comments': '<div>• 스토어 페이지에서 구매 또는 선물할 수 있는 아이템을 등록 및 관리하는 페이지입니다.</div>'
    },


    'exchange': {
        'url': '/rest/content/item/exchange/list'

        , 'columns': [
            {'title': '코드', 'data': 'item_code', 'defaultContent': '-', 'render': function (data, type, row, meta) {
                    return data;

                }},
            {'title': '이미지', 'data': 'item_thumbnail', 'defaultContent': '-', 'render': function (data, type, row, meta) {
                    return '<a href="javascript:;"><img src="'  + data + '" style="width: 45px; height: 45px;" data-toggle="modal" data-target="#imgModal" onclick="fullSize(this.src);" /></a>'

                }},
            {'title': '아이템명', 'data': 'item_name', 'defaultContent': '-', 'render': function (data, type, row, meta) {
                    return data;

                }},
            {'title': '타입', 'data': 'item_type', 'defaultContent': '-', 'render': function (data, type, row, meta) {
                    var arrCode = data.split("");
                    if(arrCode.length < 3){
                        return data;
                    }

                    var result = "";
                    if(arrCode[0] == "1"){
                        result += "/ 신규 "
                    }

                    if(arrCode[1] == "1"){
                        result += "/ 인기 "
                    }

                    if(arrCode[2] == "1"){
                        result += "/ 한정 "
                    }

                    if(!common.isEmpty(result)){
                        result = result.substring(1);
                    }

                    return result;
                }},
            {'title': '수량', 'data': 'dal', 'defaultContent': '0', 'render': function (data, type, row, meta) {
                    return data;
                }},
            {'title': '가격', 'data': 'item_price', 'defaultContent': '0', 'render': function (data, type, row, meta) {
                    return data + " (별)";
                }},
            {'title': '설명', 'data': 'desc', 'defaultContent': '-', 'render': function (data, type, row, meta) {
                    return data;
                }},
            {'title': '게시상태', 'data': 'view_yn', 'defaultContent': '-', 'render': function (data, type, row, meta) {
                    if(data == "1"){
                        return "ON";
                    }

                    if(data == "0"){
                        return "OFF";
                    }
                }},
            {'title': '등록/수정일', 'data': 'lastupdDate', 'defaultContent': '-', 'render': function (data, type, row, meta) {
                        return data;
                }},
            {'title': '구매', 'data': 'purchase_count', 'defaultContent': '-', 'render': function (data, type, row, meta) {
                    return data;
                }},
            {'title': '등록자', 'data': 'op_name', 'defaultContent': '-'}
        ]
        , 'comments': '<div>• 스토어 페이지에서 별을 달로 교환 할 수 있는 아이템을 등록 및 관리하는 페이지입니다.</div>'
    },

    'gift': {
        'url': '/rest/content/item/gift/list'

        , 'columns': [
            {'title': '사용영역', 'data': 'event_col1', 'defaultContent': 'null.....', 'render': function (data, type, row, meta) {
                    //TODO 코드에 맞게 변경 필요
                    return data;

                }},
            {'title': '파일등록 필드', 'data': 'item_col3', 'defaultContent': 'null.....', 'render': function (data, type, row, meta) {
                    return data;
                }},
            {'title': '플레이타임', 'data': 'item_col3', 'defaultContent': 'null.....', 'render': function (data, type, row, meta) {
                    return data;

                }},
            {'title': '코드', 'data': 'item_col3', 'defaultContent': 'null.....', 'render': function (data, type, row, meta) {
                    return data;
                }},
            {'title': '이미지', 'data': 'item_col3', 'defaultContent': 'null.....', 'render': function (data, type, row, meta) {
                    //TODO 썸네일 표시
                    return '<a href="javascript:;"><img src="'  + data + '" style="width: 45px; height: 45px;" data-toggle="modal" data-target="#imgModal" onclick="fullSize(this.src);" /></a>'

                }},
            {'title': '아이템명', 'data': 'item_col3', 'defaultContent': 'null.....', 'render': function (data, type, row, meta) {
                    return data;
                }},
            {'title': '타입', 'data': 'item_col3', 'defaultContent': 'null.....', 'render': function (data, type, row, meta) {
                    var arrCode = data.split("");
                    if(arrCode.length < 3){
                        return data;
                    }

                    var result = "";
                    if(arrCode[0] == "1"){
                        result += "/ 신규 "
                    }

                    if(arrCode[1] == "1"){
                        result += "/ 인기 "
                    }

                    if(arrCode[2] == "1"){
                        result += "/ 한정 "
                    }

                    if(!common.isEmpty(result)){
                        result = result.substring(1);
                    }

                    return result;
                }},
            {'title': '수량', 'data': 'item_col3', 'defaultContent': 'null.....', 'render': function (data, type, row, meta) {
                    return data;
                }},
            {'title': '가격', 'data': 'item_col3', 'defaultContent': 'null.....', 'render': function (data, type, row, meta) {
                    return data;
                }},
            {'title': 'IOS 가격', 'data': 'item_col3', 'defaultContent': 'null.....', 'render': function (data, type, row, meta) {
                    return data;
                }},
            {'title': '설명', 'data': 'item_col3', 'defaultContent': 'null.....', 'render': function (data, type, row, meta) {
                    return data;
                }},
            {'title': '등록/수정일', 'data': 'item_col5', 'defaultContent': 'null.....', 'render': function (data, type, row, meta) {
                    //TODO 일자에 맞게 변경 필요
                    return common.convertToDate(data) + " ~ " + common.convertToDate(data);
                    //     return data;

                }},
            {'title': '선물현황', 'data': 'item_col3', 'defaultContent': 'null.....', 'render': function (data, type, row, meta) {
                    return data + "명";
                }},
            {'title': '등록자', 'data': 'item_col14', 'defaultContent': '장근원'}
        ]
        , 'comments': '<div>• 방송 중 DJ 또는 게스트에게 선물할 수 있는 아이템을 등록 및 관리할 수 있습니다.</div>' +
                            '<div> ※ 선물아이템 영역 : 기본, 1번-파티클, 2번-콤보, 3번-상단, 4번-우측, 5번-전체</div>'
    },
}
