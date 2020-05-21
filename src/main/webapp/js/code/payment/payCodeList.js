var payStatus = [
    new COMMON_CODE(null, 'searchPayStatus', '결제상태')
    , new COMMON_CODE('all', '-1', '구분(전체)')
    , new COMMON_CODE('pay', '1', '결제완료')
    , new COMMON_CODE('cancel', '2', '취소완료')
    , new COMMON_CODE('block', '3', '처리불가')
];

var payPlatform = [
    new COMMON_CODE(null, 'ostype', '검색구분')
    , new COMMON_CODE('all', '-1', 'OS구분 (전체)')
    , new COMMON_CODE('android', '1', 'AOS')
    , new COMMON_CODE('ios', '2', 'IOS')
    , new COMMON_CODE('web', '3', 'WEB')
]