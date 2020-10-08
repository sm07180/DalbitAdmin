var ClipStatusDetailPopupDataTableSource = {
    'clipList': {
        'url': '/rest/clip/history/list'

        , 'columns': [
            {'title': '플랫폼', 'width':'40px', 'data': 'osType', 'render': function (data, type, row, meta) {
                    return util.getCommonCodeLabel(data, clip_platformType);
                }},
            {'title': '주제', 'width':'60px', 'data': 'subjectName', 'render': function (data, type, row, meta) {
                    return data;
                }},
            {'title': '클립', 'width':'140px', 'data': 'title', 'render': function (data, type, row, meta) {
                    return '<a href="javascript://" class="_openClipInfoPop" data-clipNo="' + row.castNo + '">' + row.castNo + '</a><br>' + data;
                }},
            {'title': '이미지', 'width':'50px', 'data': 'imageBackground', 'render': function (data, type, row, meta) {
                    if(common.isEmpty(data)){
                        return "";
                    }
                    return '<img class="thumbnail fullSize_background" src="'+ PHOTO_SERVER_URL + data +'" width="50px" max-height="50px" />';

                    // return data;
                }},
            {'title': '[듣기]<br>녹음시간', 'width':'50px', 'data': 'filePath', 'render': function (data, type, row, meta) {

                    return '<a class="_openClipPlayerPop" id="' + "play_" + row.castNo + '" data-clipNo="' + row.castNo + '" data-clipPath="' + data + '" href="javascript:;" >[ <i class="fa fa-play"></i> 듣기]</a><br>' + row.filePlay;
                    // return '<audio class="clipPlayer" id="player_' + row.castNo + '" onended="playEnd(' + row.castNo + ')"><source src="'+ PHOTO_SERVER_URL + row.filePath +'"></audio><a id="' + "play_" + row.castNo + '" data-castNo="' + row.castNo + '" href="javascript:;" onclick="eventPlay($(this))">[ <i class="fa fa-play"></i> ]</a><br>' + row.filePlay;
                }},
            {'title': '등록회원', 'width':'70px', 'data': 'memNo', 'render': function (data, type, row, meta) {
                    return '<a href="javascript://" class="_openMemberPop" data-memno="' + data + '">' + data + '</a><br>' + row.memNick;
                }},
            {'title': '성별(나이)', 'width':'70px', 'data': 'memSex', 'render': function (data, type, row, meta) {
                    return common.sexIcon(data,row.memBirthYear);
                }},
            {'title': '공개여부', 'width':'25px', 'data': 'typeOpen', 'render': function (data, type, row, meta) {
                    return util.getCommonCodeLabel(data, clip_typeOpen);
                }},
            {'title': '등록건 수', 'width':'50px', 'data': 'memInsertCnt', 'render': function (data, type, row, meta) {
                    return data + ' 건';
                }},
            {'title': '상태', 'width':'45px', 'data': 'state', 'render': function (data, type, row, meta) {
                    if(data == 4 || data == 5){
                        return '<span style="color:red;font-weight:bold">삭제</span>' + (common.isEmpty(row.delName) ? '' : '<br>(' + row.delName + ')');
                    }

                    if(row.hide == 1){
                        return util.getCommonCodeLabel(data, clip_hide) + (common.isEmpty(row.hideName) ? '' : '<br>(' + row.hideName + ')');
                    }

                    return util.getCommonCodeLabel(data, clip_stateType);
                }},
            {'title': '등록일시', 'width':'70px', 'data': 'startDate', 'render': function (data, type, row, meta) {
                    return data;
                }}
        ],

        'createdRow' : function( row, data, dataIndex ) {
            if(data.inner == 1){    // 테스트계정 row 색상 표시
                $(row).addClass("bg-testMember");
            }
        }
    },

    'clipRegList': {
        'url': '/rest/clip/history/reg/list'

        , 'columns': [
            // {'title': '플랫폼', 'width':'40px', 'data': 'osType', 'render': function (data, type, row, meta) {
            //         return util.getCommonCodeLabel(data, clip_platformType);
            //     }},
            // {'title': '주제', 'width':'60px', 'data': 'subjectName', 'render': function (data, type, row, meta) {
            //         return data;
            //     }},
            // {'title': '클립', 'width':'140px', 'data': 'title', 'render': function (data, type, row, meta) {
            //         return '<a href="javascript://" class="_openClipInfoPop" data-clipNo="' + row.castNo + '">' + row.castNo + '</a><br>' + data;
            //     }},
            // {'title': '이미지', 'width':'50px', 'data': 'imageBackground', 'render': function (data, type, row, meta) {
            //         if(common.isEmpty(data)){
            //             return "";
            //         }
            //         return '<img class="thumbnail fullSize_background" src="'+ PHOTO_SERVER_URL + data +'" width="50px" max-height="50px" />';
            //
            //         // return data;
            //     }},
            // {'title': '[듣기]<br>녹음시간', 'width':'50px', 'data': 'filePath', 'render': function (data, type, row, meta) {
            //
            //         return '<a class="_openClipPlayerPop" id="' + "play_" + row.castNo + '" data-clipNo="' + row.castNo + '" data-clipPath="' + data + '" href="javascript:;" >[ <i class="fa fa-play"></i> 듣기]</a><br>' + row.filePlay;
            //         // return '<audio class="clipPlayer" id="player_' + row.castNo + '" onended="playEnd(' + row.castNo + ')"><source src="'+ PHOTO_SERVER_URL + row.filePath +'"></audio><a id="' + "play_" + row.castNo + '" data-castNo="' + row.castNo + '" href="javascript:;" onclick="eventPlay($(this))">[ <i class="fa fa-play"></i> ]</a><br>' + row.filePlay;
            //     }},
            {'title': '등록회원', 'width':'70px', 'data': 'memNo', 'render': function (data, type, row, meta) {
                    return '<a href="javascript://" class="_openMemberPop" data-memno="' + data + '">' + data + '</a><br>' + row.memNick;
                }},
            {'title': '성별(나이)', 'width':'70px', 'data': 'memSex', 'render': function (data, type, row, meta) {
                    return common.sexIcon(data,row.memBirthYear);
                }},
            {'title': '공개여부', 'width':'25px', 'data': 'typeOpen', 'render': function (data, type, row, meta) {
                    return util.getCommonCodeLabel(data, clip_typeOpen);
                }},
            {'title': '등록건 수', 'width':'50px', 'data': 'memInsertCnt', 'render': function (data, type, row, meta) {
                    return data + ' 건';
                }},
            // {'title': '상태', 'width':'45px', 'data': 'state', 'render': function (data, type, row, meta) {
            //         if(data == 4 || data == 5){
            //             return '<span style="color:red;font-weight:bold">삭제</span>' + (common.isEmpty(row.delName) ? '' : '<br>(' + row.delName + ')');
            //         }
            //
            //         if(row.hide == 1){
            //             return util.getCommonCodeLabel(data, clip_hide) + (common.isEmpty(row.hideName) ? '' : '<br>(' + row.hideName + ')');
            //         }
            //
            //         return util.getCommonCodeLabel(data, clip_stateType);
            //     }},
            // {'title': '등록일시', 'width':'70px', 'data': 'startDate', 'render': function (data, type, row, meta) {
            //         return data;
            //     }}
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
                    return common.sexIcon(data,row.memBirthYear, true);
                }},
            {'title': '클립', 'width':'180px', 'data': 'title', 'render': function (data, type, row, meta) {
                    return '<a href="javascript://" class="_openClipInfoPop" data-clipNo="' + row.castNo + '">' + row.castNo + '</a><br>' + data;
                }},
            {'title': '이미지', 'width':'50px', 'data': 'imageBackground', 'render': function (data, type, row, meta) {
                    if(common.isEmpty(data)){
                        return "";
                    }
                    return '<img class="thumbnail fullSize_background" src="'+ PHOTO_SERVER_URL + data +'" width="50px" max-height="50px" />';

                    // return data;
                }},
            {'title': '선물받은회원', 'width':'70px', 'data': 'giftedMemNo', 'render': function (data, type, row, meta) {
                    return '<a href="javascript://" class="_openMemberPop" data-memno="' + data + '">' + data + '</a><br>' + row.giftedMemNick;
                }},
            {'title': '성별(나이)', 'width':'70px', 'data': 'giftedMemSex', 'render': function (data, type, row, meta) {
                    return common.sexIcon(data,row.giftedMemBirthYear, true);
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
            {'title': '선물 수', 'width':'50px', 'data': 'itemCnt', 'render': function (data, type, row, meta) {
                    return common.addComma(data) + " 개";
                }},
            {'title': '선물 달', 'width':'50px', 'data': 'ruby', 'render': function (data, type, row, meta) {
                    return common.addComma(data) + " 달";
                }},
            {'title': '일시', 'width':'70px', 'data': 'giftDate', 'render': function (data, type, row, meta) {
                    return data;
                }},
        ],

        'createdRow' : function( row, data, dataIndex ) {
            if(data.inner == 1){    // 테스트계정 row 색상 표시
                $(row).addClass("bg-testMember");
            }
        }
    },


    'playList': {
        'url': '/rest/clip/history/play/list'

        , 'columns': [
            // {'title': '플랫폼', 'width':'45px', 'data': 'osType', 'render': function (data, type, row, meta) {
            //         return util.getCommonCodeLabel(data, clip_platformType);
            //     }},
            // {'title': '주제', 'width':'60px', 'data': 'subjectName', 'render': function (data, type, row, meta) {
            //         return data;
            //     }},
            // {'title': '클립', 'width':'170px', 'data': 'title', 'render': function (data, type, row, meta) {
            //         return '<a href="javascript://" class="_openClipInfoPop" data-clipNo="' + row.castNo + '">' + row.castNo + '</a><br>' + data;
            //     }},
            // {'title': '이미지', 'width':'50px', 'data': 'imageBackground', 'render': function (data, type, row, meta) {
            //         if(common.isEmpty(data)){
            //             return "";
            //         }
            //         return '<img class="thumbnail fullSize_background" src="'+ PHOTO_SERVER_URL + data +'" width="50px" max-height="50px" />';
            //
            //         // return data;
            //     }},
            {'title': '청취회원', 'width':'70px', 'data': 'listenMemNo', 'render': function (data, type, row, meta) {
                    return '<a href="javascript://" class="_openMemberPop" data-memno="' + data + '">' + data + '</a><br>' + row.listenMemNick;
                }},
            {'title': '성별(나이)', 'width':'70px', 'data': 'listenMemSex', 'render': function (data, type, row, meta) {
                    return common.sexIcon(data,row.listenMemBirthYear, true);
                }},
            {'title': '청취수', 'width':'50px', 'data': 'listenPlayCnt', 'render': function (data, type, row, meta) {
                    return common.addComma(data);
                }},
            {'title': '청취일시', 'width':'70px', 'data': 'listenDate', 'render': function (data, type, row, meta) {
                    return data;
                }},
        ],

        'createdRow' : function( row, data, dataIndex ) {
            if(data.inner == 1){    // 테스트계정 row 색상 표시
                $(row).addClass("bg-testMember");
            }
        }
    },

}
