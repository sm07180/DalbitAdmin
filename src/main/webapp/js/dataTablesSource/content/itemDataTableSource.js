var ItemDataTableSource = {
    'charge': {
        'url': '/rest/content/item/charge'

        , 'columns': [
            {'title': '플랫폼', 'data': 'event_col1', 'defaultContent': 'null.....', 'render': function (data, type, row, meta) {
                //TODO 코드에 맞게 변경 필요
                return data;

            }},
            {'title': '코드', 'data': 'item_col2', 'defaultContent': 'null.....', 'render': function (data, type, row, meta) {
                //TODO 코드에 맞게 변경 필요
                return data;

            }},
            {'title': '이미지', 'data': 'item_col3', 'defaultContent': 'null.....', 'render': function (data, type, row, meta) {
                //TODO 썸네일 표시
                return '<img src="https://devphoto2.dalbitcast.com/content-test_0/20604729600/20200324141306155465.png" style="width: 45px; height: 45px;" data-toggle="modal" data-target="#imgModal" onclick="fullSize(this.src);" />'

            }},
            {'title': '아이템 명', 'data': 'item_col3', 'defaultContent': 'null.....', 'render': function (data, type, row, meta) {
                return data;

            }},
            {'title': '타입', 'data': 'item_col3', 'defaultContent': 'null.....', 'render': function (data, type, row, meta) {
                    //TODO 코드에 맞게 변경 필요
                    return data;
            }},
            {'title': '수량', 'data': 'item_col3', 'defaultContent': 'null.....', 'render': function (data, type, row, meta) {
                    //TODO 코드에 맞게 변경 필요
                    return data;
            }},
            {'title': '가격', 'data': 'item_col3', 'defaultContent': 'null.....', 'render': function (data, type, row, meta) {
                    //TODO 코드에 맞게 변경 필요
                    return data;
            }},
            {'title': 'IOS 가격', 'data': 'item_col3', 'defaultContent': 'null.....', 'render': function (data, type, row, meta) {
                    //TODO 코드에 맞게 변경 필요
                    return data;
            }},
            {'title': '할인율', 'data': 'item_col3', 'defaultContent': 'null.....', 'render': function (data, type, row, meta) {
                    return data + "%";
            }},
            {'title': '설명', 'data': 'item_col3', 'defaultContent': 'null.....', 'render': function (data, type, row, meta) {
                    return data;
            }},
            {'title': '게시상태', 'data': 'item_col3', 'defaultContent': 'null.....', 'render': function (data, type, row, meta) {
                    return data;
            }},
            {'title': '등록/수정일', 'data': 'item_col5', 'defaultContent': 'null.....', 'render': function (data, type, row, meta) {
                //TODO 일자에 맞게 변경 필요
                return common.convertToDate(data) + " ~ " + common.convertToDate(data);
                //     return data;

            }},
            {'title': '구매', 'data': 'item_col3', 'defaultContent': 'null.....', 'render': function (data, type, row, meta) {
                    return data + "명";
            }},
            {'title': '등록자명', 'data': 'item_col14', 'defaultContent': '장근원'}
        ]
        , 'comments': '<div>• 스토어 페이지에서 구매 또는 선물할 수 있는 아이템을 등록 및 관리하는 페이지입니다.</div>'
    },
}
