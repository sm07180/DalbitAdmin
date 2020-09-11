var EventDataTableSource = {
    'eventList' : {
        'url' : '/rest/content/event/management/list'
        , 'columns': [
            {'title': '이벤트 상태', 'data' : 'state', 'render' : function(data) {
                return util.getCommonCodeLabel(data, event_stateSlct);
                }},
            {'title': '이벤트 제목', 'data' : 'title', 'render' : function(data, type, row, meta) {
                return '<a href="javascript://" class="_getEventDetail" data-eventidx="'+ row.eventIdx +'">' + data + '</a>'
                }},
            {'title': '이벤트 기간', 'data' : 'alwaysYn', 'render' : function(data, type, row, meta) {
                var startDate = common.convertToDate(row.startDate).split(" ")[0];
                var endDate = common.convertToDate(row.endDate).split(" ")[0];
                if(data == 0) {
                    return startDate + " ~ " + endDate;
                } else if(data == 1) {
                    return util.getCommonCodeLabel(data, event_alwaysYn);
                }
                }},
            {'title': '노출 여부', 'data' : 'viewYn', 'render' : function(data) {
                return util.getCommonCodeLabel(data, event_viewYn);
                }},
            {'title': '응모자 수', 'data' : 'applyCnt', 'render' : function(data) {
                if(data == null) {
                    return '-';
                } else {
                    return common.addComma(data);
                }
                }},
            {'title': '당첨자 선정', 'data' : 'winnerYn', 'render' : function(data) {
                return util.getCommonCodeLabel(data, event_winnerYn);
                }},
            {'title': '당첨자 발표', 'data' : 'announceYn', 'render' : function(data) {
                return util.getCommonCodeLabel(data, event_announceYn);
                }},
            {'title': '최종 수정일', 'data' : 'lastUpdDate', 'render' : function(data) {
                return common.convertToDate(data);
                }},
            {'title': '최종 수정자', 'data' : 'lastOpName'},
        ]
    },

    'eventPrize' : {
        'url' : '/rest/content/event/management/prize/list'
        , 'columns': [
            {'title': '등수', 'data' : 'prizeRank', 'render' : function(data) {
                return common.addComma(data);
                }},
            {'title': '당첨 인원', 'data' : 'prizeCnt', 'render' : function(data) {
                return common.addComma(data);
                }},
            {'title': '경품명', 'data' : 'prizeName', 'render' : function(data, type, row, meta) {
                return '<a href="javascript://" class="_getPrizeDetail" data-eventidx="'+ row.eventIdx +'" data-prizeidx="'+ row.prizeIdx +'">' + data + '</a>'
                }},
            {'title': '경품 구분', 'data' : 'prizeSlct', 'render' : function(data) {
                return util.getCommonCodeLabel(data, event_prizeReceive);
                }},
            {'title': '금액', 'data' : 'giveAmt', 'render' : function(data, type, row, meta) {
                if(row.prizeSlct == 1) {
                    return common.addComma(data);
                } else {
                    return '-';
                }
                }},
            {'title': '제세공과금', 'data' : 'taxAmt', 'render' : function(data, type, row, meta) {
                    if(row.prizeSlct == 1) {
                        return common.addComma(data);
                    } else {
                        return '-';
                    }
                }},
            {'title': '달/별 수', 'data' : 'dalByeol', 'render' : function(data, type, row, meta) {
                    if(row.prizeSlct == 1) {
                        return '-';
                    } else {
                        return common.addComma(data);
                    }
                }},
            {'title': '달로 받기', 'data' : 'receiveDal', 'render' : function(data, type, row, meta) {
                    if(row.prizeSlct == 1) {
                        return common.addComma(data);
                    } else {
                        return '-';
                    }
                }},
            {'title': '최종 수정일', 'data' : 'lastUpdDate', 'render' : function(data) {
                return common.convertToDate(data);
                }},
            {'title': '최종 수정자', 'data' : 'lastOpName'},
        ]
    },

    'eventWinnerApplicant' : {
        'url' : '/rest/content/event/management/winner/applicant'
        , 'columns': [
            {'title': '회원번호', 'data' : 'mem_no', 'render' : function(data, type, row, meta){
                return util.memNoLink(data, row.mem_no);
            }},
            {'title': '닉네임', 'data' : 'nickName'},
            {'title': '응모 횟수', 'data' : 'applyCnt', 'render' : function(data) {
                return common.addComma(data);
                }},
            {'title': '결제 금액', 'data' : 'payAmt', 'render' : function(data) {
                return common.addComma(data);
                }},
            {'title': '방송 시간', 'data' : 'airTime', 'render' : function(data) {
                return common.addComma(data);
                }},
            {'title': '좋아요', 'data' : 'goodCnt', 'render' : function(data) {
                return common.addComma(data);
                }},
            {'title': '경험치', 'data' : 'expCnt', 'render' : function(data) {
                return common.addComma(data);
                }},
            {'title': '받은 선물', 'data' : 'giftedCnt', 'render' : function(data) {
                return common.addComma(data);
                }},
            {'title': '보낸 선물', 'data' : 'giftCnt', 'render' : function(data) {
                return common.addComma(data);
                }},
            {'title': '팬 수', 'data' : 'fanCnt', 'render' : function(data) {
                return common.addComma(data);
                }},
            {'title': '당첨 여부', 'data' : 'prizeWin', 'render' : function(data) {
                return util.getCommonCodeLabel(data, event_winnerWinSlct);
                }},
            {'title': '등수', 'data' : 'prizeRank', 'render' : function(data) {
                return common.addComma(data);
                }},
            {'title': '응모일시', 'data' : 'applyDate', 'render' : function(data) {
                return common.convertToDate(data);
                }},
            {'title': '상세 정보', 'data' : 'add_idx', 'render': function(data, type, row, meta) {
                return '<a href="javascript://" class="_getAddInfoDetail" data-addidx="' + data + '" data-applyidx="' + row.applyIdx + '" data-memno="' + row.mem_no + '">상세 정보</a>';
                }},
        ]
    },

    'eventWinner' : {
        'url' : '/rest/content/event/management/winner/list'
        , 'columns': [
            {'title': '등수', 'data' : 'prizeRank', 'render' : function(data) {
                return common.addComma(data);
                }},
            {'title': '당첨 인원', 'data' : 'prizeCnt', 'render' : function(data) {
                return common.addComma(data);
                }},
            {'title': '경품명', 'data' : 'prizeName'},
            {'title': '회원번호', 'data' : 'mem_no', 'render': function(data, type, row, meta) {
                return util.memNoLink(data, row.mem_no)
                    + '<a href="javascript://" style="display:none;" class="_getWinnerDetail" data-memno="'+ row.mem_no +'" data-winneridx="'+ row.winnerIdx +'"></a>'
                }},
            {'title': '닉네임', 'data' : 'nickName'},
            {'title': '본인인증 여부', 'data' : 'certificationYn', 'render' : function(data) {
                return util.getCommonCodeLabel(data, event_winnerCertificationYn);
                }},
            {'title': '미성년자 여부', 'data' : 'minorYn', 'render' : function(data) {
                return util.getCommonCodeLabel(data, event_minorYn);
                }},
            {'title': '수령방법', 'data' : 'receiveWay', 'render' : function(data) {
                return util.getCommonCodeLabel(data, event_receiveWay);
                }},
            {'title': '추가 정보', 'data' : 'addInfo', 'render' : function(data) {
                return util.getCommonCodeLabel(data, event_addInfoYn);
                }},
            {'title': '입금 확인', 'data' : 'depositConfirm', 'render' : function(data) {
                return util.getCommonCodeLabel(data, event_depositYn);
                }},
            {'title': '상세 정보', 'data' : 'addIdx', 'render': function(data, type, row, meta) {
                return '<a href="javascript://" class="_getWinnerAddInfoDetail" data-addidx="' + data + '" data-winneridx="' + row.winnerIdx + '" data-memno="' + row.mem_no + '">상세 정보</a>';
                }},
        ]
    },

    'event': {
        'url': '/rest/content/event/list'
        , 'columns': [
            {'title': '이벤트 상태', 'data': 'state'},
            {'title': '이벤트 제목', 'data': 'platform', 'render': function (data, type, row, meta) {
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
            {'title': '이벤트 기간', 'data': 'thumb_img_url', 'render': function (data, type, row, meta) {
                return '<img class="thumbnail" src="' + data + '" style="width: 45px; height: 45px;" onclick="eventList_fullSize(this.src);" />'
            }},
            {'title': '노출 여부', 'data': 'event_title', 'render': function (data, type, row, meta) {
                    return '<a href="javascript://" class="getEventDetail" onclick="javascript:fnc_eventList.getEventDetail_info('+meta.row+');">' + data + '</a>'
                }},
            {'title': '응모자 수', 'data': 'startDatetimeFormat', 'render': function (data, type, row, meta) {
                var tmp = data + " ~ " + row.endDatetimeFormat;
                return tmp;
            }},
            {'title': '당첨자 발표', 'data': 'viewStartDatetimeFormat', 'render': function (data, type, row, meta) {
                var tmp = data + " ~ " + row.viewEndDatetimeFormat;
                return tmp;
            }},
            {'title': '최종 수정일', 'data': 'event_col10', 'defaultContent': '0'},
            {'title': '최종 수정자', 'data': 'mem_cnt', 'render': function (data) {
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
            {'title': '참여자 회원번호', 'data': 'mem_no', 'render': function (data, type, row, meta) {
                    return util.memNoLink(data, row.mem_no);
                }},
            {'title': '참여자 닉네임', 'data': 'mem_nick'},
            {'title': '성별', 'data': 'mem_sex', 'render': function (data, type, row, meta) {
                    return common.sexIcon(data, row.mem_birth_year);
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
            {'title': '회원번호', 'width':'80px', 'data': 'write_mem_no', 'render': function (data, type, row, meta) {
                    var result = '<a href="javascript://" class="_openMemberPop" data-memNo="' + row.write_mem_no + '">' + row.write_mem_no + '</a>' +
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
            , {'title': '참여 일시', 'data': 'last_upd_date', 'render': function(data) {
                return common.convertToDate(data);
                }}
            , {'title': '경험치', 'data': 'reward_exp'}
            , {'title': '받은 달', 'data': 'reward_dal'}
            , {'title': 'device UUID', 'data': 'device_uuid'}
        ]
    },

    'giftconList': {
        'url': '/rest/content/event/attendance/giftconList'
        , 'columns': [
            {'title': '품목', 'data': 'gifticon_type', 'render': function(data) {
                    return util.getCommonCodeLabel(data, event_giftcon_type);
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
            , {'title': '휴대폰 번호', 'data': 'phone', 'render': function(data) {
                    return common.phoneNumHyphen(data);
                }}
            , {'title': '당첨 일시', 'data': 'win_date', 'render': function(data) {
                    return data;
                }}
            , {'title': '접수 일시', 'data': 'phone_date', 'render': function(data) {
                    if(common.isEmpty(data)){
                        return '-';
                    }
                    return data;
                }}
        ]
    }
}
