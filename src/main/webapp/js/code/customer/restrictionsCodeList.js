var restrictions_searchType = [
    new COMMON_CODE(null, 'searchType', '정지/강퇴조회조건')
    , new COMMON_CODE('all', '-1', '회원정보구분(전체)')
    , new COMMON_CODE('memno', '1', '회원번호')
    , new COMMON_CODE('memname', '2', '이름')      //휴대폰 인증 적용후
    , new COMMON_CODE('memid', '3', 'UserID')
    , new COMMON_CODE('memnick', '4', '닉네임')
    , new COMMON_CODE('memphone', '5', '연락처')
    , new COMMON_CODE('mobileId', '6', 'MobileID')
    , new COMMON_CODE('ip', '9', 'IP')
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


var restrictions_searchTarget = [
    new COMMON_CODE(null, 'searchTarget', '대상')
    , new COMMON_CODE('all', '-1', '대상(전체)')
    , new COMMON_CODE('1', '1', '회원')
    , new COMMON_CODE('2', '2', 'DJ')
];

var restrictions_selectYn = [
    new COMMON_CODE(null, 'selectYn', '본인인증')
    , new COMMON_CODE('all', '', '본인인증(전체)')
    , new COMMON_CODE('y', 'y', '본인인증(Y)')
    , new COMMON_CODE('n', 'n', '본인인증(N)')
];