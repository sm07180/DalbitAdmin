var search_exchange_years = [
    new COMMON_CODE(null, 'search_year', '년')
    , new COMMON_CODE('2021', '2021', '2021년')
    , new COMMON_CODE('2020', '2020', '2020년')
    , new COMMON_CODE('2019', '2019', '2019년')
];

var search_exchange_months = [
    new COMMON_CODE(null, 'search_month', '월')
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

var search_exchange_type = [
    new COMMON_CODE(null, 'search_type', '검색조건')
    , new COMMON_CODE('all', '', '검색조건')
    , new COMMON_CODE('mem_no', 'mem_no', '회원번호')
    , new COMMON_CODE('mem_id', 'user_id', 'User ID')
    , new COMMON_CODE('mem_nick', 'mem_nick', 'User 닉네임')
    , new COMMON_CODE('mem_phone', 'mem_phone', '연락처')
]

var search_exchange_state = [
    new COMMON_CODE(null, 'search_state', '처리상태')
    , new COMMON_CODE('all', '', '처리상태')
    , new COMMON_CODE('wait', '0', '미처리')
    , new COMMON_CODE('ok', '1', '완료')
    , new COMMON_CODE('reject', '2', '불가')
]