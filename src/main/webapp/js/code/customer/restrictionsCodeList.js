var restrictions_searchType1 = [
    new COMMON_CODE(null, 'searchType', '정지/강퇴조회조건')
    , new COMMON_CODE('all', '-1', '회원정보구분(전체)')
    , new COMMON_CODE('1', '1', '회원번호')
    , new COMMON_CODE('2', '2', '닉네임')
    , new COMMON_CODE('3', '3', '연락처')
];

var restrictions_searchType2 = [
    new COMMON_CODE(null, 'searchType', '정지/강퇴조회조건')
    , new COMMON_CODE('all', '-1', '회원정보구분(전체)')
    , new COMMON_CODE('1', '1', '회원번호')
    , new COMMON_CODE('2', '2', 'UserID')
    , new COMMON_CODE('3', '3', '닉네임')
    , new COMMON_CODE('4', '4', '연락처')
    , new COMMON_CODE('5', '5', 'IP')
    , new COMMON_CODE('6', '6', 'DJ 회원번호')
    , new COMMON_CODE('7', '7', 'DJ UserID')
    , new COMMON_CODE('8', '8', 'DJ 닉네임')
];


var restrictions_searchOpCode = [
    new COMMON_CODE(null, 'opCode', '회원상태')
    , new COMMON_CODE('all', '-1', '회원상태(전체)')
    , new COMMON_CODE('2', '2', '경고')
    , new COMMON_CODE('3', '3', '1일정지')
    , new COMMON_CODE('4', '4', '3일정지')
    , new COMMON_CODE('5', '5', '7일정지')
    , new COMMON_CODE('6', '6', '영구정지')
];