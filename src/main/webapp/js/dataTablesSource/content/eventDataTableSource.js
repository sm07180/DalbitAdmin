var EventDataTableSource = {
    'event': {
        'url': '/rest/content/event/event'

        , 'columns': [
            {'title': '진행여부', 'data': 'event_col1', 'defaultContent': 'null.....', 'render': function (data, type, row, meta) {
                //TODO 코드에 맞게 변경 필요
                return data;

            }},
            {'title': '구분', 'data': 'event_col2', 'defaultContent': 'null.....', 'render': function (data, type, row, meta) {
                //TODO 코드에 맞게 변경 필요
                return data;

            }},
            {'title': '이미지', 'data': 'event_col3', 'defaultContent': 'null.....', 'render': function (data, type, row, meta) {
                //TODO 썸네일 표시
                return '<a href="javascript:;">' + data + '</a>'

            }},
            {'title': '이벤트 제목', 'data': 'event_col4', 'defaultContent': 'null.....', 'render': function (data, type, row, meta) {
                return '<a href="javascript:;">' + data + '</a>'

            }},
            {'title': '이벤트 기간', 'data': 'event_col5', 'defaultContent': 'null.....', 'render': function (data, type, row, meta) {
                //TODO 일자에 맞게 변경 필요
                return common.convertToDate(data) + " ~ " + common.convertToDate(data);
                //     return data;

            }},
            {'title': '노출 기간', 'data': 'event_col6', 'defaultContent': 'null.....', 'render': function (data, type, row, meta) {
                //TODO 일자에 맞게 변경 필요
                return common.convertToDate(data) + " ~ " + common.convertToDate(data);
                    // return data;
            }},
            {'title': '클릭', 'data': 'event_col10', 'defaultContent': '0'},
            {'title': '총 참여자', 'data': 'event_col11', 'defaultContent': '0'},
            {'title': '남', 'data': 'event_col12', 'defaultContent': '0'},
            {'title': '여', 'data': 'event_col13', 'defaultContent': '0'},
            {'title': '등록자명', 'data': 'event_col14', 'defaultContent': '장근원'}
        ]
        , 'comments': '<div>• 이벤트 기간을 기준으로 이벤트 기간 마감 1초전까지의 리스트입니다.</div><div>• [등록 ]버튼 클릭 시 이벤트 상세정보 입력 페이지를 제공하고 , 선택 시 해당 이벤트 상세페이지를 확인 및 관리할 수 있습니다.</div><div>• 이벤트 제목 클릭 시 미리보기가 가능합니다.</div>'
    },

    'pastEvent': {
        'url': '/rest/content/event/pastevent'

        , 'columns': [
            {'title': '진행여부', 'data': 'event_col1', 'defaultContent': 'null.....', 'render': function (data, type, row, meta) {
                    //TODO 코드에 맞게 변경 필요
                    return data;

                }},
            {'title': '구분', 'data': 'event_col2', 'defaultContent': 'null.....', 'render': function (data, type, row, meta) {
                    //TODO 코드에 맞게 변경 필요
                    return data;

                }},
            {'title': '이미지', 'data': 'event_col3', 'defaultContent': 'null.....', 'render': function (data, type, row, meta) {
                    //TODO 썸네일 표시
                    return '<a href="javascript:;">' + data + '</a>'

                }},
            {'title': '이벤트 제목', 'data': 'event_col4', 'defaultContent': 'null.....', 'render': function (data, type, row, meta) {
                    return '<a href="javascript:;">' + data + '</a>'

                }},
            {'title': '이벤트 기간', 'data': 'event_col5', 'defaultContent': 'null.....', 'render': function (data, type, row, meta) {
                    //TODO 일자에 맞게 변경 필요
                    return common.convertToDate(data) + " ~ " + common.convertToDate(data);

                }},
            {'title': '노출 기간', 'data': 'event_col6', 'defaultContent': 'null.....', 'render': function (data, type, row, meta) {
                    //TODO 일자에 맞게 변경 필요
                    return common.convertToDate(data) + " ~ " + common.convertToDate(data);

                }},
            {'title': '조회수', 'data': 'event_col10', 'defaultContent': '0'},
            {'title': '총 응모자', 'data': 'event_col11', 'defaultContent': '0'},
            {'title': '당첨자', 'data': 'event_col13', 'defaultContent': '0'},
            {'title': '남', 'data': 'event_col12', 'defaultContent': '0'},
            {'title': '여', 'data': 'event_col13', 'defaultContent': '0'},
            {'title': '등록자명', 'data': 'event_col14', 'defaultContent': '장근원'}

        ]
        , 'comments': '<div>• 이벤트 기간을 기준으로 이벤트 기간 마감 1초전까지의 리스트입니다.</div><div>• [등록 ]버튼 클릭 시 이벤트 상세정보 입력 페이지를 제공하고 , 선택 시 해당 이벤트 상세페이지를 확인 및 관리할 수 있습니다.</div><div>• 이벤트 제목 클릭 시 미리보기가 가능합니다.</div>'
    }
}
