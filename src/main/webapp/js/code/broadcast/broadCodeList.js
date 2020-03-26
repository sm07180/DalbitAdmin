var subject_type = [
    new COMMON_CODE(null, 'subject_type', '방송 주제')
    ,new COMMON_CODE('00', '00', '일상/챗')
    ,new COMMON_CODE('01', '01', '노래/연주')
    ,new COMMON_CODE('02', '02', '고민/사연')
    ,new COMMON_CODE('03', '03', '책/힐링')
    ,new COMMON_CODE('04', '04', '연애/오락')
    ,new COMMON_CODE('05', '05', 'ASMR')
    ,new COMMON_CODE('06', '06', '노래방')
    ,new COMMON_CODE('07', '07', '성우')
    ,new COMMON_CODE('08', '08', '스터디')
    ,new COMMON_CODE('09', '09', '공포')
    ,new COMMON_CODE('10', '10', '먹방/요리')
    ,new COMMON_CODE('99', '99', '기타')
];

var entryType = [
    new COMMON_CODE(null, 'entryType', '입장제한')
    , new COMMON_CODE('all', '0', '전체')
    , new COMMON_CODE('fan', '1', '팬만입장')
    , new COMMON_CODE('entry', '2', '20세이상')
];

var searchRadio = [
    new COMMON_CODE(null, 'searchRadio', '검색Radio')
    , new COMMON_CODE('member', '1', '회원')
    , new COMMON_CODE('broad', '2', '방송')
];

var freezing = [
    new COMMON_CODE(null, 'freezing', '얼리기')
    , new COMMON_CODE('freezing', '1', '얼리기')
    , new COMMON_CODE('release', '0', '해제')
];

var forcedExit = [
    new COMMON_CODE(null, 'forcedExit', '방강제종료')
    , new COMMON_CODE('maintain', '0', '유지')
    , new COMMON_CODE('forcedExit', '1', '강제종료')
];

var searchType_broad = [
    new COMMON_CODE(null, 'searchType_broad', '사용자정보구분')
    , new COMMON_CODE('all', '0', '전체')
    , new COMMON_CODE('memno', '1', '회원번호')
    , new COMMON_CODE('memid', '2', 'UserID')
    , new COMMON_CODE('memnick', '3', '닉네임')
    , new COMMON_CODE('memphone', '4', '연락처')
    , new COMMON_CODE('memname', '5', '이름')
];

var searchBroad_broad = [
    new COMMON_CODE(null, 'searchBroad_broad', '방송정보검색')
    , new COMMON_CODE('all', '-1', '전체')
    , new COMMON_CODE('broadTitle', '1', '방송제목')
    , new COMMON_CODE('welcomMsg', '2', '인사말')
    , new COMMON_CODE('broadNotie', '3', '방송중공지')
];

var state = [
    new COMMON_CODE(null, 'state', '상태')
    , new COMMON_CODE('all', '-1', '전체')
    , new COMMON_CODE('0', '0', '청취중')
    , new COMMON_CODE('1', '1', '퇴장')
    , new COMMON_CODE('2', '2', '강제퇴장')
];




// ------------------------- table -----------------------------
var live_summary = [
    new COMMON_CODE('', 'totalListenerCnt', '총 청취자')
    , new COMMON_CODE('', 'totalGiftCnt', '총 선물')
    , new COMMON_CODE('', 'totalGoodCnt', '총 좋아요')
    , new COMMON_CODE('', 'totalBoosterCnt', '총 청취자 부스터')
    , new COMMON_CODE('', 'totalForcedCnt', '총 강제퇴장')
];

var listen_summary = [
    new COMMON_CODE('','listenerCnt','청취자 수')
    ,new COMMON_CODE('','guest','게스트ID')
    ,new COMMON_CODE('','managerCnt','매니저 수')
    ,new COMMON_CODE('','forcedCnt','강제퇴장 수')
    ,new COMMON_CODE('','totalGoodCnt','좋아요 수')
    ,new COMMON_CODE('','totalBoosterCnt','부스터 수')
    ,new COMMON_CODE('','totalGiftCnt','선물 수')
];

var like_summary = [
    new COMMON_CODE('','goodCnt','좋아요')
    ,new COMMON_CODE('','boosterCnt','청취자 부스터')
];

var gift_summary = [
    new COMMON_CODE('','giftCnt','방송 중 선물')
    ,new COMMON_CODE('','male','남자')
    ,new COMMON_CODE('','female','여자')
    ,new COMMON_CODE('','none','미지정')
];

var story_summary = [
    new COMMON_CODE('','storyCnt','방송 중 사연')
    ,new COMMON_CODE('','male','남자')
    ,new COMMON_CODE('','female','여자')
    ,new COMMON_CODE('','none','미지정')
];

