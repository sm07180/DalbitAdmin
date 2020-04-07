var mem_state = [
    new COMMON_CODE('', 'mem_state', '회원상태')
    , new COMMON_CODE('1', '1', '정상')
    , new COMMON_CODE('2', '2', '정지')
    , new COMMON_CODE('4', '4', '탈퇴')
    , new COMMON_CODE('5', '5', '영구정지')
];

var broadCast_summary = [
    new COMMON_CODE('', 'totalListenerCnt', '총 청취자')
    , new COMMON_CODE('', 'totalGiftCnt', '총 선물 주고/받음')
    , new COMMON_CODE('', 'totalByeol', '총 받은 별')
    , new COMMON_CODE('', 'totalGood', '총 받은 좋아요')
    , new COMMON_CODE('', 'totalBooster', '총 받은 부스터')
];

var listen_summary = [
    new COMMON_CODE('', 'totalforcedCnt', '총 강제퇴장')
    , new COMMON_CODE('', 'totalByeol', '총 보낸 별')
    , new COMMON_CODE('', 'totalGood', '총 좋아요')
    , new COMMON_CODE('', 'totalBooster', '총 부스터')
];

var pay = [
    new COMMON_CODE(null, 'pay', '단계')
    ,new COMMON_CODE('all',  '-1','전체')
    ,new COMMON_CODE('pay',  '0','결제')
    ,new COMMON_CODE('cancel', '1','취소')
    ,new COMMON_CODE('Impossible', '2','불가')
];

var gift = [
    new COMMON_CODE(null, 'gift', '선물구분')
    ,new COMMON_CODE('all',  '-1','전체')
    ,new COMMON_CODE('present',  '0','보낸선물')
    ,new COMMON_CODE('gift', '1','받은선물')
    ,new COMMON_CODE('event', '2','이벤트-받은선물')
    ,new COMMON_CODE('change', '3','교환')
];

var question = [
    new COMMON_CODE(null, 'question', '문의구분')
    ,new COMMON_CODE('all',  '-1','전체')
    ,new COMMON_CODE('one',  '0','1:1문의')
    ,new COMMON_CODE('call', '1','전화')
    ,new COMMON_CODE('email', '2','메일')
];

var member_declaration_slctType = [
    new COMMON_CODE(null, 'slctType', '제재 조치')
    , new COMMON_CODE('warning', '2', '경고')
    , new COMMON_CODE('stop1', '3', '1일정지')
    , new COMMON_CODE('stop3', '4', '3일정지')
    , new COMMON_CODE('stop7', '5', '7일정지')
    , new COMMON_CODE('stop15', '6', '강제탈퇴')
    , new COMMON_CODE('withdrawal', '7', '영구정지')
];

var declaration_summary = [
    new COMMON_CODE('','cnt','미처리 건')
    ,new COMMON_CODE('','cnt','누적 처리 건')
    ,new COMMON_CODE('','cnt','제재 조치')
    ,new COMMON_CODE('','cnt','전화문의/처리')
];