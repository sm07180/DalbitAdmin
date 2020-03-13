
/** =------ Declaration ---------- */

var declaration_reason = [
    new COMMON_CODE(null, 'reason', '신고구분')
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

var report_radio = [
    new COMMON_CODE(null, 'op_code', '조치내역')
    , new COMMON_CODE('not', '0', '미처리')
    , new COMMON_CODE('continue', '1', '유지')
    , new COMMON_CODE('warning', '2', '경고')
    , new COMMON_CODE('stop1', '3', '1일정지')
    , new COMMON_CODE('stop3', '4', '3일정지')
    // , new COMMON_CODE('stop5', '5', '5일정지')
    , new COMMON_CODE('stop7', '6', '7일정지')
    , new COMMON_CODE('stop15', '7', '15일정지')
    , new COMMON_CODE('stop30', '8', '30일정지')
    , new COMMON_CODE('withdrawal', '9', '강제탈퇴')
];
