var special_searchType = [
    new COMMON_CODE(null, 'searchType', '검색구분')
    , new COMMON_CODE('all', '-1', '전체')
    , new COMMON_CODE('userNo', '1', '회원번호')
    , new COMMON_CODE('userId', '2', 'User ID')
    , new COMMON_CODE('userNick', '3', 'User 닉네임')
    , new COMMON_CODE('phone', '4', '연락처')
    , new COMMON_CODE('broad', '5', '방송제목')
];

/** =------ Ranking / Live ---------- */
var searchType = [
    new COMMON_CODE(null, 'searchType', '사용자정보구분')
    , new COMMON_CODE('all', '9999', '사용자정보구분(전체)')
    , new COMMON_CODE('userNo', '1', '회원번호')
    , new COMMON_CODE('userId', '2', 'User ID')
    , new COMMON_CODE('userNick', '3', 'User 닉네임')
    , new COMMON_CODE('phone', '4', '연락처')
];


/** =------ special ---------- */
var special_state = [
    new COMMON_CODE(null, 'stateType', '상태구분')
    , new COMMON_CODE('wait', '1', '대기')
    , new COMMON_CODE('ok', '2', '완료')
    , new COMMON_CODE('reject', '3', '거부')
];

var special_isForce= [
    new COMMON_CODE(null, 'isForce', '관리자 등록여부')
    , new COMMON_CODE('no', '0', 'N')
    , new COMMON_CODE('yes', '1', 'Y')
];
