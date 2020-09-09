var ClipHistoryDataTableSource = {
    'list': {
        'url': '/rest/clip/history/list'

        , 'columns': [
            {'title': '클립번호', 'width':'80px', 'data': 'castNo', 'render': function (data, type, row, meta) {
                    return data;
                }},
			{'title': '플랫폼', 'width':'40px', 'data': 'osType', 'render': function (data, type, row, meta) {
                    return util.getCommonCodeLabel(data, clip_platformType);
                }},
			{'title': '주제', 'width':'60px', 'data': 'subjectName', 'render': function (data, type, row, meta) {
                    return data;
                }},
			{'title': '제목', 'width':'180px', 'data': 'title', 'render': function (data, type, row, meta) {
                    return data;
                }},
			{'title': '이미지', 'width':'50px', 'data': 'imageBackground', 'render': function (data, type, row, meta) {
                    if(common.isEmpty(data)){
                        return "";
                    }
                    return '<img class="thumbnail fullSize_background" src="'+ PHOTO_SERVER_URL + data +'" width="50px" max-height="50px" />';

                    // return data;
                }},
			{'title': '[듣기]<br>녹음시간', 'width':'50px', 'data': 'filePath', 'render': function (data, type, row, meta) {

                    return '<a class="_openClipPlayerPop" id="' + "play_" + row.castNo + '" data-clipNo="' + row.castNo + '" data-clipPath="' + data + '" href="javascript:;" onclick="eventPlay(' + row.castNo + ')">[ <i class="fa fa-play"></i> 듣기]</a><br>' + row.filePlay;
                    // return '<audio class="clipPlayer" id="player_' + row.castNo + '" onended="playEnd(' + row.castNo + ')"><source src="'+ PHOTO_SERVER_URL + row.filePath +'"></audio><a id="' + "play_" + row.castNo + '" data-castNo="' + row.castNo + '" href="javascript:;" onclick="eventPlay($(this))">[ <i class="fa fa-play"></i> ]</a><br>' + row.filePlay;
                }},
			{'title': '회원번호', 'width':'70px', 'data': 'memNo', 'render': function (data, type, row, meta) {
                    return '<a href="javascript://" class="_openMemberPop" data-memno="' + data + '">' + data + '</a>'
                }},
			{'title': '닉네임', 'width':'130px', 'data': 'memNick', 'render': function (data, type, row, meta) {
                    return data;
                }},
			{'title': '성별(나이)', 'width':'70px', 'data': 'memSex', 'render': function (data, type, row, meta) {
                    return common.sexIcon(data,row.memBirthYear);
                }},
			{'title': '등록일시', 'width':'70px', 'data': 'startDate', 'render': function (data, type, row, meta) {
                    return data;
                }},
			{'title': '공개<br>여부', 'width':'25px', 'data': 'typeOpen', 'render': function (data, type, row, meta) {
                    return util.getCommonCodeLabel(data, clip_typeOpen);
                }},
			{'title': '청취수', 'width':'50px', 'data': 'countPlay', 'render': function (data, type, row, meta) {
                    return common.addComma(data);
                }},
			{'title': '좋아요 수', 'width':'50px', 'data': 'countGood', 'render': function (data, type, row, meta) {
                    return common.addComma(data);
                }},
			{'title': '받은<br>선물 수', 'width':'50px', 'data': 'countGift', 'render': function (data, type, row, meta) {
                    return common.addComma(data);
                }},
			{'title': '받은<br>선물 별', 'width':'55px', 'data': 'countByeol', 'render': function (data, type, row, meta) {
                    return common.addComma(data);
                }},
			{'title': '댓글', 'width':'45px', 'data': 'replyCnt', 'render': function (data, type, row, meta) {
                    return data + ' <a href="javascript://" class="_selectReply" data-reply="' + data +  '" data-cast_no="' + row.castNo +'">[댓글]</a>';
                }},
			{'title': '숨기기', 'width':'45px', 'data': 'hide', 'render': function (data, type, row, meta) {
                    if(row.state == 4){
                        return "-";
                    }

                    if(data == 0){
                        return '<a href="javascript:;" onclick="updateClipHide(' + row.castNo + ', 1)">[숨기기]</a>';
                    }else{
                        return '<a href="javascript:;" onclick="updateClipHide(' + row.castNo + ', 0)">[해제]</a>';
                    }
                }},
            {'title': '삭제', 'width':'45px', 'data': 'state', 'render': function (data, type, row, meta) {
                    if(data == 4){
                        return "-";
                    }else{
                        return '<a href="javascript:;" onclick="deleteClip(' + row.castNo + ')">[삭제]</a>';
                    }
                }},
			{'title': '상태', 'width':'45px', 'data': 'state', 'render': function (data, type, row, meta) {
                    if(data != 4 && row.hide == 1){
                        return util.getCommonCodeLabel(data, clip_hide);
                    }

                    return util.getCommonCodeLabel(data, clip_stateType);
                }},
        ],

        'createdRow' : function( row, data, dataIndex ) {
            if(data.inner == 1){    // 테스트계정 row 색상 표시
                $(row).css('background-color','#dae3f3');
            }
        }
    },




    'listenList': {
        'url': '/rest/clip/history/listen/list'

        , 'columns': [
            {'title': '청취일시', 'width':'70px', 'data': 'listenDate', 'render': function (data, type, row, meta) {
                    return data;
                }},
            {'title': '청취자', 'width':'70px', 'data': 'listenMemNo', 'render': function (data, type, row, meta) {
                    return '<a href="javascript://" class="_openMemberPop" data-memno="' + data + '">' + data + '</a><br>' + row.listenMemNick;
                }},
            {'title': '성별(나이)', 'width':'70px', 'data': 'listenMemSex', 'render': function (data, type, row, meta) {
                    return common.sexIcon(data,row.listenMemBirthYear);
                }},
            {'title': '청취자IP', 'width':'70px', 'data': 'listenMemIp', 'render': function (data, type, row, meta) {
                    return data;
                }},
            {'title': '클립번호', 'width':'70px', 'data': 'castNo', 'render': function (data, type, row, meta) {
                    return data;
                }},
            {'title': '플랫폼', 'width':'45px', 'data': 'osType', 'render': function (data, type, row, meta) {
                    return util.getCommonCodeLabel(data, clip_platformType);
                }},
            {'title': '주제', 'width':'60px', 'data': 'subjectName', 'render': function (data, type, row, meta) {
                    return data;
                }},
            {'title': '제목', 'width':'180px', 'data': 'title', 'render': function (data, type, row, meta) {
                    return data;
                }},
            {'title': '이미지', 'width':'50px', 'data': 'imageBackground', 'render': function (data, type, row, meta) {
                    if(common.isEmpty(data)){
                        return "";
                    }
                    return '<img class="thumbnail fullSize_background" src="'+ PHOTO_SERVER_URL + data +'" width="50px" max-height="50px" />';

                    // return data;
                }},
            {'title': '[듣기]<br>녹음시간', 'width':'50px', 'data': 'filePath', 'render': function (data, type, row, meta) {

                    return '<a class="_openClipPlayerPop" id="' + "play_" + row.castNo + '" data-clipNo="' + row.castNo + '" data-clipPath="' + data + '" href="javascript:;" onclick="eventPlay(' + row.castNo + ')">[ <i class="fa fa-play"></i> 듣기]</a><br>' + row.filePlay;
                    // return '<audio class="clipPlayer" id="player_' + row.castNo + '" onended="playEnd(' + row.castNo + ')"><source src="'+ PHOTO_SERVER_URL + row.filePath +'"></audio><a id="' + "play_" + row.castNo + '" data-castNo="' + row.castNo + '" href="javascript:;" onclick="eventPlay($(this))">[ <i class="fa fa-play"></i> ]</a><br>' + row.filePlay;
                }},
            {'title': '등록자', 'width':'70px', 'data': 'memNo', 'render': function (data, type, row, meta) {
                    return '<a href="javascript://" class="_openMemberPop" data-memno="' + data + '">' + data + '</a><br>' + row.memNick;
                }},
            {'title': '성별(나이)', 'width':'70px', 'data': 'memSex', 'render': function (data, type, row, meta) {
                    return common.sexIcon(data,row.memBirthYear);
                }},
            {'title': '등록일시', 'width':'70px', 'data': 'startDate', 'render': function (data, type, row, meta) {
                    return data;
                }},
            {'title': '보유달 수', 'width':'50px', 'data': 'dal', 'render': function (data, type, row, meta) {
                    return common.addComma(data);
                }},
            {'title': '청취수', 'width':'50px', 'data': 'countPlay', 'render': function (data, type, row, meta) {
                    return common.addComma(data);
                }},
            {'title': '좋아요 수', 'width':'50px', 'data': 'countGood', 'render': function (data, type, row, meta) {
                    return common.addComma(data);
                }},
        ],

        'createdRow' : function( row, data, dataIndex ) {
            if(data.inner == 1){    // 테스트계정 row 색상 표시
                $(row).css('background-color','#dae3f3');
            }
        }
    },


    'removeList': {
        'url': '/rest/clip/history/remove/list'

        , 'columns': [
            {'title': '클립번호', 'width':'70px', 'data': 'castNo', 'render': function (data, type, row, meta) {
                    return data;
                }},
            {'title': '공개<br>여부', 'width':'25px', 'data': 'typeOpen', 'render': function (data, type, row, meta) {
                    return util.getCommonCodeLabel(data, clip_typeOpen);
                }},
            {'title': '플랫폼', 'width':'45px', 'data': 'osType', 'render': function (data, type, row, meta) {
                    return util.getCommonCodeLabel(data, clip_platformType);
                }},
            {'title': '주제', 'width':'60px', 'data': 'subjectName', 'render': function (data, type, row, meta) {
                    return data;
                }},
            {'title': '제목', 'width':'180px', 'data': 'title', 'render': function (data, type, row, meta) {
                    return data;
                }},
            {'title': '이미지', 'width':'50px', 'data': 'imageBackground', 'render': function (data, type, row, meta) {
                    if(common.isEmpty(data)){
                        return "";
                    }
                    return '<img class="thumbnail fullSize_background" src="'+ PHOTO_SERVER_URL + data +'" width="50px" max-height="50px" />';

                    // return data;
                }},
            {'title': '[듣기]<br>녹음시간', 'width':'50px', 'data': 'filePath', 'render': function (data, type, row, meta) {

                    return '<a class="_openClipPlayerPop" id="' + "play_" + row.castNo + '" data-clipNo="' + row.castNo + '" data-clipPath="' + data + '" href="javascript:;" onclick="eventPlay(' + row.castNo + ')">[ <i class="fa fa-play"></i> 듣기]</a><br>' + row.filePlay;
                    // return '<audio class="clipPlayer" id="player_' + row.castNo + '" onended="playEnd(' + row.castNo + ')"><source src="'+ PHOTO_SERVER_URL + row.filePath +'"></audio><a id="' + "play_" + row.castNo + '" data-castNo="' + row.castNo + '" href="javascript:;" onclick="eventPlay($(this))">[ <i class="fa fa-play"></i> ]</a><br>' + row.filePlay;
                }},
            {'title': '회원번호', 'width':'70px', 'data': 'memNo', 'render': function (data, type, row, meta) {
                    return '<a href="javascript://" class="_openMemberPop" data-memno="' + data + '">' + data + '</a>'
                }},
            {'title': '닉네임', 'width':'130px', 'data': 'memNick', 'render': function (data, type, row, meta) {
                    return data;
                }},
            {'title': '성별(나이)', 'width':'70px', 'data': 'memSex', 'render': function (data, type, row, meta) {
                    return common.sexIcon(data,row.memBirthYear);
                }},
            {'title': '삭제일시', 'width':'70px', 'data': 'endDate', 'render': function (data, type, row, meta) {
                    return data;
                }},
            {'title': '보유달 수', 'width':'50px', 'data': 'dal', 'render': function (data, type, row, meta) {
                    return common.addComma(data);
                }},
            {'title': '청취수', 'width':'50px', 'data': 'countPlay', 'render': function (data, type, row, meta) {
                    return common.addComma(data);
                }},
            {'title': '좋아요 수', 'width':'50px', 'data': 'countGood', 'render': function (data, type, row, meta) {
                    return common.addComma(data);
                }},
            {'title': '삭제구분', 'width':'50px', 'data': 'opName', 'render': function (data, type, row, meta) {
                    return common.isEmpty(data) ? "본인" : data;
                }},
        ],

        'createdRow' : function( row, data, dataIndex ) {
            if(data.inner == 1){    // 테스트계정 row 색상 표시
                $(row).css('background-color','#dae3f3');
            }
        }
    },
}
