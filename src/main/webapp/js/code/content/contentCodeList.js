var notice_searchType = [
    new COMMON_CODE(null, 'searchType', '검색구분')
    , new COMMON_CODE('all', '-1', '전체')
    , new COMMON_CODE('title', '1', '제목')
    , new COMMON_CODE('content', '2', '내용')
    , new COMMON_CODE('opName', '3', '작성자')
];

var notice_slctType = [
    new COMMON_CODE(null, 'slctType', '공지구분')
    , new COMMON_CODE('all', '-1', '전체')
    , new COMMON_CODE('notice', '1', '공지')
    , new COMMON_CODE('event', '2', '이벤트')
    , new COMMON_CODE('check', '3', '정기점검')
    , new COMMON_CODE('update', '4', '업데이트')
];

var notice_platform = [
    new COMMON_CODE(null, 'platform', '플랫폼구분')
    , new COMMON_CODE('all', '-1', '전체')
    , new COMMON_CODE('pc', '2', 'PC')
    , new COMMON_CODE('android', '3', 'Android')
    , new COMMON_CODE('ios', '4', 'IOS')
    , new COMMON_CODE('mobile', '5', 'Web-Mobile')
];

var notice_gender = [
    new COMMON_CODE(null, 'gender', '성별구분')
    , new COMMON_CODE('all', '1', '전체')
    , new COMMON_CODE('man', '2', '남자')
    , new COMMON_CODE('female', '3', '여자')
];

var notice_viewOn = [
    new COMMON_CODE(null, 'viewOn', '게시구분')
    , new COMMON_CODE('all', '-1', '전체')
    , new COMMON_CODE('on', '1', 'ON')
    , new COMMON_CODE('off', '2', 'OFF')
];