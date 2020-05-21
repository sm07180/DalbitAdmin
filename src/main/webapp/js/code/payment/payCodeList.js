var payStatus = [
    new COMMON_CODE(null, 'searchPayStatus', '결제상태')
    , new COMMON_CODE('all', '', '구분(전체)')
    , new COMMON_CODE('pay', '1', '결제완료')
    , new COMMON_CODE('cancel', '2', '취소완료')
    , new COMMON_CODE('block', '3', '처리불가')
];

var payPlatform = [
    new COMMON_CODE(null, 'ostype', '검색구분')
    , new COMMON_CODE('all', '', '전체')
    , new COMMON_CODE('android', '1', '안드로이드')
    , new COMMON_CODE('ios', '2', 'IOS')
    , new COMMON_CODE('web', 'WEB', 'WEB')
]