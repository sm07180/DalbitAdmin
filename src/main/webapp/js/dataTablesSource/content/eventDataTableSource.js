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
                    result += "/ PC(WEB) ";
                if(arrCode[1] == "1")
                    result += "/ Mobile-Android ";
                if(arrCode[2] == "1")
                    result += "/ Mobile-IOS ";
                if(!common.isEmpty(result)){
                    result = result.substring(1);
                }
                return result;
            }},
            {'title': '이미지', 'data': 'thumb_img_url', 'render': function (data, type, row, meta) {
                return '<img class="thumbnail" src="' + data + '" style="width: 45px; height: 45px;" onclick="eventList_fullSize(this.src);" />'
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
            {'title': '총 응모자', 'data': 'mem_cnt', 'render': function (data) {
                    return data + " 명";
                }},
            {'title': '<label style="color: blue">남</lable>', 'data': 'male_cnt', 'render': function (data) {
                    return data + " 명";
                }},
            {'title': '<label style="color: red">여</label>', 'data': 'female_cnt', 'render': function (data) {
                    return data + " 명";
                }},
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
                    return '<img class="thumbnail fullSize_background" src="' + data + '" style="width: 45px; height: 45px;" />'
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
            {'title': '총 응모자', 'data': 'mem_cnt', 'render': function (data) {
                    return data + " 명";
                }},
            {'title': '<label style="color: blue">남</label>', 'data': 'male_cnt', 'render': function (data) {
                    return data + " 명";
                }},
            {'title': '여', 'data': 'female_cnt', 'render': function (data) {
                    return data + " 명";
                }},
            {'title': '당첨자', 'data': 'win_cnt', 'render': function (data) {
                    return data + " 명";
                }},
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
            {'title': '성별', 'data': 'mem_sex', 'render': function (data, type, row, meta) {
                    return common.sexIcon(data);
                }},
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
    },

    'reply': {
        'url': '/rest/content/event/reply'
        , 'columns': [
            {'title': '회원 아이디', 'width':'80px', 'data': 'userId', 'render': function (data, type, row, meta) {
                    var result = '<a href="javascript://" class="_openMemberPop" data-memNo="' + row.write_mem_no + '">' + row.userId + '</a>' +
                        '<p class="no-margin">' + row.level +' / ' + row.grade + '</p>';
                    return result;
                }},
            {'title': '회원 닉네임', 'width':'100px', 'data': 'nickName'},
            {'title': '응모횟수', 'width':'30px', 'data': 'applyCnt', 'render':function (data,type,row, meta){
                    return data + "회";
                }},
            {'title': '댓글 내용', 'className':'al', 'data': 'contents', 'render':function (data, type, row, meta){
                    return data.replace(/\n/g, "<br/>")
                }},
            {'title': '작성일시', 'width':'120px', 'data': 'writeDate'},
            {'title': '수정일시', 'width':'120px', 'data': 'updateDate'},
            {'title': '수정자', 'width':'80px', 'data': 'op_name'}
        ]
        // , 'comments': '<div>•뿅</div>'
    },

    'attendance': {
        'url': '/rest/content/event/attendance/list'
        , 'columns': [
            {'title': '회원상태', 'data': 'mem_state', 'render': function(data) {
                return util.getCommonCodeLabel(data, mem_state);
                }}
            , {'title': '프로필'+ '<br/>' +'사진', 'data': 'image_profile', 'width': '65px', 'render': function(data, type, row) {
                return '<img class="thumbnail fullSize_background" src="' + common.profileImage(PHOTO_SERVER_URL, data, row.mem_sex) + '" width="65px" height="65px" />';
                }}
            , {'title': '회원번호', 'data': 'mem_no'}
            , {'title': 'UserID', 'data': 'mem_userid', 'render': function(data, type, row) {
                return '<a href="javascript://" class="_openMemberPop" data-memNo="' + row.mem_no + '">' + data + '</a>'
                }}
            , {'title': '닉네임', 'data': 'mem_nick'}
            , {'title': '성별', 'data': 'mem_sex', 'render': function(data) {
                return common.sexIcon(data);
                }}
            , {'title': '참여 구분', 'data': 'the_day', 'render': function(data) {
                if(data == 9) {
                    return '더줘';
                } else {
                    return '출석';
                }
                }}
            , {'title': '참여 일시', 'data': 'last_upd_date'}
            , {'title': '경험치', 'data': 'reward_exp'}
            , {'title': '받은 달', 'data': 'reward_dal'}
        ]
    }
}
