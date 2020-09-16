var search_osType = [
    new COMMON_CODE(null, 'ostype', 'os구분')
    , new COMMON_CODE('all', '', 'os구분')
    , new COMMON_CODE('android', '1', '안드로이드')
    , new COMMON_CODE('ios', '2', 'IOS')
    , new COMMON_CODE('pc', 'pc', 'PC')
    , new COMMON_CODE('mobile', 'mobile', 'MOBILE')
    , new COMMON_CODE('api', 'API', 'API')
    , new COMMON_CODE('server', 'server', 'SERVER')
    , new COMMON_CODE('photo', '7', 'Photo')
    , new COMMON_CODE('pay', 'Pay', 'Pay')
];

var search_searchType = [
    new COMMON_CODE(null, 'searchType', '검색구분')
    , new COMMON_CODE('all', '', '검색구분')
    , new COMMON_CODE('mem_no', 'mem_no', 'mem_no')
    , new COMMON_CODE('description', 'description', 'description')
    , new COMMON_CODE('ctype', 'ctype', 'ctype')
];


var search_alarmTalk_seachType = [
    new COMMON_CODE(null, 'searchType', '검색구분')
    , new COMMON_CODE('all', '', '검색구분')
    , new COMMON_CODE('emp_no', 'emp_no', '직원번호')
    , new COMMON_CODE('msg', 'msg', '내용')
];

var search_alarmTalk_status = [
    new COMMON_CODE(null, 'result_code', '발송상태')
    , new COMMON_CODE('all', '', '전체')
    , new COMMON_CODE('req', '0', '요청')
    , new COMMON_CODE('success', '1', '성공')
    , new COMMON_CODE('fail', '-1', '실패')
];