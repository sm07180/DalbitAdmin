var EventDataTableSource = {
    'event': {
        'url': '/rest/content/event/list'
        , 'columns': [
            {'title': '진행여부', 'data': 'state'},
            {'title': '구분', 'data': 'platform', 'render': function (data, type, row, meta) {
                var arrCode = data.toString().split("");
                if(arrCode.length < 3)
                    return data;
                var result = "";
                if(arrCode[0] == "1")
                    result += "/ PC(WEB) "
                if(arrCode[1] == "1")
                    result += "/ Mobile-Android "
                if(arrCode[2] == "1")
                    result += "/ Mobile-IOS "
                if(!common.isEmpty(result)){
                    result = result.substring(1);
                }
                return result;
            }},
            {'title': '이미지', 'data': 'thumb_img_url', 'render': function (data, type, row, meta) {
                return '<img src="' + data + '" style="width: 45px; height: 45px;" data-toggle="modal" data-target="#imgModal" onclick="fullSize(this.src);" />'
            }},
            {'title': '이벤트 제목', 'data': 'event_title', 'render': function (data, type, row, meta) {
                    return '<a href="javascript://" class="getEventDetail" onclick="javascript:fnc_eventList.getEventDetail_info('+meta.row+');">' + data + '</a>'
                }},
            {'title': '이벤트 기간', 'data': 'startDatetimeFormat', 'render': function (data, type, row, meta) {
                var tmp = data + " ~ " + row.endDatetimeFormat;
                return tmp;
            }},
            {'title': '노출 기간', 'data': 'viewStartDatetimeFormat', 'render': function (data, type, row, meta) {
                var tmp = data + " ~ " + row.viewEndDatetimeFormat;
                return tmp;
            }},
            {'title': '조회수', 'data': 'event_col10', 'defaultContent': '0'},
            {'title': '총 응모자', 'data': 'event_col11', 'defaultContent': '0'},
            {'title': '남', 'data': 'event_col12', 'defaultContent': '0'},
            {'title': '여', 'data': 'event_col13', 'defaultContent': '0'},
            {'title': '등록자명', 'data': 'op_name'}
        ]
        , 'comments': '<div>• 이벤트 기간을 기준으로 이벤트 기간 마감 1초전까지의 리스트입니다.</div><div>• [등록 ]버튼 클릭 시 이벤트 상세정보 입력 페이지를 제공하고 , 선택 시 해당 이벤트 상세페이지를 확인 및 관리할 수 있습니다.</div><div>• 이벤트 제목 클릭 시 미리보기가 가능합니다.</div>'
    },


    'endEvent': {
        'url': '/rest/content/event/list'
        , 'columns': [
            {'title': '진행여부', 'data': 'state'},
            {'title': '구분', 'data': 'platform', 'render': function (data, type, row, meta) {
                    var arrCode = data.toString().split("");
                    if(arrCode.length < 3)
                        return data;
                    var result = "";
                    if(arrCode[0] == "1")
                        result += "/ PC(WEB) "
                    if(arrCode[1] == "1")
                        result += "/ Mobile-Android "
                    if(arrCode[2] == "1")
                        result += "/ Mobile-IOS "
                    if(!common.isEmpty(result)){
                        result = result.substring(1);
                    }
                    return result;
                }},
            {'title': '이미지', 'data': 'thumb_img_url', 'render': function (data, type, row, meta) {
                    return '<img src="' + data + '" style="width: 45px; height: 45px;" data-toggle="modal" data-target="#imgModal" onclick="fullSize(this.src);" />'
                }},
            {'title': '이벤트 제목', 'data': 'event_title', 'render': function (data, type, row, meta) {
                    return '<a href="javascript://" class="getEventDetail" onclick="javascript:fnc_pastEventList.getEventDetail_info('+meta.row+');">' + data + '</a>'
                }},
            {'title': '이벤트 기간', 'data': 'startDatetimeFormat', 'render': function (data, type, row, meta) {
                    var tmp = data + " ~ " + row.endDatetimeFormat;
                    return tmp;
                }},
            {'title': '노출 기간', 'data': 'viewStartDatetimeFormat', 'render': function (data, type, row, meta) {
                    var tmp = data + " ~ " + row.viewEndDatetimeFormat;
                    return tmp;
                }},
            {'title': '조회수', 'data': 'event_col10', 'defaultContent': '0'},
            {'title': '총 응모자', 'data': 'event_col11', 'defaultContent': '0'},
            {'title': '남', 'data': 'event_col12', 'defaultContent': '0'},
            {'title': '여', 'data': 'event_col13', 'defaultContent': '0'},
            {'title': '당첨자', 'data': 'event_col14', 'defaultContent': '0'},
            {'title': '등록자명', 'data': 'op_name'}
        ]
        , 'comments': '<div>• 이벤트 기간을 기준으로 이벤트 기간 마감 1초전까지의 리스트입니다.</div><div>• [등록 ]버튼 클릭 시 이벤트 상세정보 입력 페이지를 제공하고 , 선택 시 해당 이벤트 상세페이지를 확인 및 관리할 수 있습니다.</div><div>• 이벤트 제목 클릭 시 미리보기가 가능합니다.</div>'
    },

    'report': {
        'url': '/rest/content/event/memberList'
        , 'columns': [
            {'title': '당첨 여부', 'data': 'is_win', 'render': function (data) {
                    if(data == 1){
                        return "선정";
                    }else{
                        return "대기중";
                    }
                }},
            {'title': '선정번호', 'data': 'order', 'defaultContent': ''},
            {'title': '참여자 User ID', 'data': 'mem_userid', 'render': function (data, type, row, meta) {
                    return util.memNoLink(data, row.mem_no);
                }},
            {'title': '참여자 닉네임', 'data': 'mem_nick'},
            {'title': '성별', 'data': 'mem_sex'},
            {'title': '연락처', 'data': 'mem_phone'},
            {'title': '응모횟수', 'data': 'applyCnt', 'render': function (data, type, row, meta) {
                    return '<a href="javascript:" onclick="fnc_eventReport.setModalData('+meta.row+')">' + data + ' 건' + '</a>'
                }},
            {'title': '당첨경험', 'data': 'winCnt', 'render': function (data) {
                    return data + ' 건'

                }},
            {'title': '누적 선물', 'data': 'giftCnt', 'render': function (data) {
                    return data + ' 개'

                }},
            {'title': '누적 방송', 'data': 'broadCnt', 'render': function (data) {
                    return data + ' 건'

                }},
            {'title': '누적 청취', 'data': 'listenCnt', 'render': function (data) {
                    return data + ' 건'

                }}

        ]
        , 'comments': '<div>•이벤트에 응모한 응모자 리스트입니다.</div>'
                        + '<div>•선택 후 [선택 당첨]을 선택하시면 당첨여부가 “대기중 > 선정 ”으로 변경됩니다.</div>'
                        + '<div>•선택된 당첨자 수는 우측 상단 “당첨자 남자 /여자 ” 수를 확인세요.</div>'
                        + '<div>•당첨자를 바로 공지하시려면 하단 [바로 공지하기]를 선택하면 사이트공지 작성페이지에 해당 이벤트 정보가 적용되어 빠른 당첨자 공지가 가능합니다.</div>'
    }

}
