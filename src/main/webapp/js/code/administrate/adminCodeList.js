var faq_searchType = [
    new COMMON_CODE(null, 'searchType', '검색구분')
    , new COMMON_CODE('all', '-1', '전체')
    , new COMMON_CODE('title', '1', '질문')
    , new COMMON_CODE('content', '2', '답변')
    , new COMMON_CODE('opName', '3', '작성자')
];

var faq_slctType = [
    new COMMON_CODE(null, 'slctType', 'FAQ구분')
    , new COMMON_CODE('all', '-1', '전체')
    , new COMMON_CODE('notice', '1', '일반')
    , new COMMON_CODE('event', '2', '방송')
    , new COMMON_CODE('check', '3', '결제')
    , new COMMON_CODE('update', '4', '기타')
];

var testId_relation = [
    new COMMON_CODE(null, 'relation', '관계')
    , new COMMON_CODE('all', '', '관계 선택')
    , new COMMON_CODE('me', '1', '본인')
    , new COMMON_CODE('family', '2', '가족')
    , new COMMON_CODE('friend', '3', '친구')
    , new COMMON_CODE('kindred', '4', '친척')
    , new COMMON_CODE('company', '5', '업체')
    , new COMMON_CODE('etc', '6', '기타')
];

var testId_userInfo = [
    new COMMON_CODE(null, 'userInfo', '회원정보')
    , new COMMON_CODE('all', '', '회원정보 선택')
    , new COMMON_CODE('mem_phone', '1', '회원연락처')
    , new COMMON_CODE('mem_no', '2', '회원번호')
    , new COMMON_CODE('mem_id', '3', 'User ID')
    , new COMMON_CODE('mem_nick', '4', 'User 닉네임')
];