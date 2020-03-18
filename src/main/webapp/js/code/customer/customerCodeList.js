
/** =------ Declaration ---------- */
var declaration_searchType = [
    new COMMON_CODE(null, 'searchType', '검색 조건')
    , new COMMON_CODE('all', '-1', '전체')
    , new COMMON_CODE('memno', '1', '회원번호')
    , new COMMON_CODE('memid', '2', 'UserID')
    , new COMMON_CODE('memnick', '3', '닉네임')
];

var declaration_reason = [
    new COMMON_CODE(null, 'slctReason', '신고 구분')
    , new COMMON_CODE('all', '-1', '전체')
    , new COMMON_CODE('profile', '1', '프로필사진')
    , new COMMON_CODE('obs', '2', '음란성')
    , new COMMON_CODE('adv', '3', '광고 및 상업성')
    , new COMMON_CODE('abuse', '4', '욕설 및 비방성')
    , new COMMON_CODE('etc', '99', '기타')
];

var declaration_status = [
    new COMMON_CODE(null, 'status', '처리구분')
    , new COMMON_CODE('all', '-1', '전체')
    , new COMMON_CODE('off', '0', '미처리')
    , new COMMON_CODE('on', '1', '처리완료')
];

var declaration_slctType = [
    new COMMON_CODE(null, 'slctType', '제재 조치')
    , new COMMON_CODE('all', '-1', '전체')
    , new COMMON_CODE('not', '0', '미처리')
    , new COMMON_CODE('continue', '1', '정상')
    , new COMMON_CODE('warning', '2', '경고')
    , new COMMON_CODE('stop1', '3', '1일정지')
    , new COMMON_CODE('stop3', '4', '3일정지')
    , new COMMON_CODE('stop7', '5', '7일정지')
    , new COMMON_CODE('stop15', '6', '강제탈퇴')
    , new COMMON_CODE('withdrawal', '7', '영구정지')
];
