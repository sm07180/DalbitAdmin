var testDalByeolDataTableSource = {
    'dalSendList': {
        'url': '/rest/administrate/testDalByeol/dal/send/list'
        , 'columns': [
            {'title': '사용 구분', 'data' : 'item_type', 'width':'80px','render':function (data, type, row, meta) {
                    if(data == "7"){
                        return "(클립) 선물";
                    }else if(data == "1"){
                        return "(방송방) 선물";
                    }else if(data == "2"){
                        return "(방송방) 부스터";
                    }else{
                        return "직접선물";
                    }
                }},
            {'title': '제목<br/>대상 회원 번호', 'data' : 'title', 'width':'80px','render':function (data, type, row, meta) {
                    if(row.item_type == "7"){
                        return '<a href="javascript://" class="_openClipInfoPop" data-clipNo="' + row.room_no + '">' + data + '</a><br>' + util.memNoLink(row.mem_no, row.mem_no);
                    }else{
                        return util.roomNoLink(data, row.room_no) + '<br/>' + util.memNoLink(row.mem_no, row.mem_no);
                    }
                }},
            {'title': '이미지', 'data' : 'item_thumbnail', 'width':'60px','render':function (data, type, row, meta) {
                    if(data == ""){
                        return '<img class="fullSize_background thumbnail" src="https://image.dalbitlive.com/ani/thumbs/moon_thumb.jpg" width="50px" height="50px"/>';
                    }else{
                        return '<img class="fullSize_background thumbnail" src="'+ data +'" width="50px" height="50px"/>';
                    }
                }},
            {'title': '아이템명', 'data' : 'itemName', 'width':'60px','render' : function(data){
                    if(data == ""){
                        return "달";
                    }else{
                        return data;
                    }
                }},
            {'title': '달 수', 'data' : 'ruby', 'width':'50px','render':function (data, type, row, meta) {
                    return common.addComma(data) + " 달";
                }},
            {'title': '비밀여부', 'data' : 'secret', 'width':'60px','render':function (data, type, row, meta) {
                    if(data == "1"){
                        return "비밀선물";
                    }
                    return "";
                }},
            {'title': '일시', 'data' : 'giftDate', 'width':'80px'},
        ]
        , 'comments': ''
        , 'createdRow' : function( row, data, dataIndex ) {
            if(data.inner == 1){    // 테스트계정 row 색상 표시
                $(row).addClass("bg-testMember");
            }
        }
    },

    'byeolSendList': {
        'url': '/rest/administrate/testDalByeol/byeol/send/list'
        , 'columns': [
            {'title': '사용 구분', 'data' : 'itemName', 'width':'80px','render':function (data, type, row, meta) {
                    return data;
                }},
            {'title': '별 사용 수', 'data' : 'gold', 'width':'50px','render':function (data, type, row, meta) {
                    return common.addComma(data) + " 별";
                }},
            {'title': '일시', 'data' : 'giftDate', 'width':'80px'},
        ]
        , 'comments': ''
        , 'createdRow' : function( row, data, dataIndex ) {
            if(data.inner == 1){    // 테스트계정 row 색상 표시
                $(row).addClass("bg-testMember");
            }
        }
    },
}