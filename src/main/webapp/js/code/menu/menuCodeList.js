
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

var special_searchType = [
    new COMMON_CODE(null, 'searchType', '사용자정보구분')
    , new COMMON_CODE('all', '-1', '전체')
    , new COMMON_CODE('userNo', '1', '회원번호')
    , new COMMON_CODE('userId', '2', 'User ID')
    , new COMMON_CODE('userNick', '3', 'User 닉네임')
    , new COMMON_CODE('phone', '4', '연락처')
];

var special_selectYears = [
    new COMMON_CODE(null, 'select_year', '년')
    , new COMMON_CODE('2021', '2021', '2021년')
    , new COMMON_CODE('2020', '2020', '2020년')
    , new COMMON_CODE('2019', '2019', '2019년')
];

var special_selectMonths = [
    new COMMON_CODE(null, 'select_month', '월')
    , new COMMON_CODE('12', '12', '12월')
    , new COMMON_CODE('11', '11', '11월')
    , new COMMON_CODE('10', '10', '10월')
    , new COMMON_CODE('9', '09', '9월')
    , new COMMON_CODE('8', '08', '8월')
    , new COMMON_CODE('7', '07', '7월')
    , new COMMON_CODE('6', '06', '6월')
    , new COMMON_CODE('5', '05', '5월')
    , new COMMON_CODE('4', '04', '4월')
    , new COMMON_CODE('3', '03', '3월')
    , new COMMON_CODE('2', '02', '2월')
    , new COMMON_CODE('1', '01', '1월')
];
