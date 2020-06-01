var joinDate = [
    new COMMON_CODE('', 'joinDate', '날짜선택')
    , new COMMON_CODE('0', '0', '월별')
    , new COMMON_CODE('1', '1', '주별')
    , new COMMON_CODE('2', '2', '전일')
    , new COMMON_CODE('3', '3', '당일')
    , new COMMON_CODE('4', '4', '날짜선택')
];


var mem_state = [
    new COMMON_CODE('', 'mem_state', '회원상태')
    , new COMMON_CODE('1', '1', '정상')
    , new COMMON_CODE('2', '2', '경고')
    , new COMMON_CODE('2', '3', '정지')
    , new COMMON_CODE('5', '5', '영구정지')
    , new COMMON_CODE('4', '4', '탈퇴')
];

var broadCast_summary = [
    new COMMON_CODE('', 'totalListenerCnt', '총 청취자')
    , new COMMON_CODE('', 'totalGiftCnt', '총 선물 주고/받음')
    , new COMMON_CODE('', 'totalByeol', '총 받은 별')
    , new COMMON_CODE('', 'totalGood', '총 받은 좋아요')
    , new COMMON_CODE('', 'totalBooster', '총 받은 부스터')
];

var member_listen_summary = [
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
    ,new COMMON_CODE('all',  '-1','구분(전체)')
    ,new COMMON_CODE('present',  '0','보낸선물')
    ,new COMMON_CODE('gift', '1','받은선물')
];
var gift_dalbyeol = [
    new COMMON_CODE(null, 'gift_dalbyeol', '아이템구분')
    ,new COMMON_CODE('all',  '-1','아이템명(전체)')
    ,new COMMON_CODE('dal',  '0','달')
    ,new COMMON_CODE('byeol', '1','별')
];
var gift_date = [
    new COMMON_CODE(null, 'gift_date', '날짜 구분')
    ,new COMMON_CODE('all', '-1','전체')
    ,new COMMON_CODE('day', '0','일별')
    ,new COMMON_CODE('month', '1','월별')
]

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
    , new COMMON_CODE('withdrawal', '6', '영구정지')
    , new COMMON_CODE('stop15', '7', '강제탈퇴')
];

var declaration_summary = [
    new COMMON_CODE('','cnt','미처리 건')
    ,new COMMON_CODE('','cnt','누적 처리 건')
    ,new COMMON_CODE('','cnt','제재 조치')
    ,new COMMON_CODE('','cnt','강제탈퇴')
    ,new COMMON_CODE('','cnt','영구정지')
];

var testId = [
    new COMMON_CODE('','testId','테스트아이디여부')
    ,new COMMON_CODE('-1','-1','전체')
    ,new COMMON_CODE('0','0','Test-ID 제외')
];

var testId_withdrawal = [
    new COMMON_CODE('','testId_withdrawal','테스트아이디여부')
    ,new COMMON_CODE('-1','-1','전체')
    ,new COMMON_CODE('0','0','Test-ID 제외')
];

var pointEditStory = [
    new COMMON_CODE('','pointEditStory','달/별수정사유')
    ,new COMMON_CODE('-1','-1','지급사유 선택')
    ,new COMMON_CODE('0','0','소실금액 복구')
    ,new COMMON_CODE('1','1','직원 테스트')
    ,new COMMON_CODE('2','2','이벤트 지급')
    ,new COMMON_CODE('3','3','스페셜DJ 혜택')
];

var memJoinDateSort = [
    new COMMON_CODE('','memJoinDateSort','가입일시정렬')
    ,new COMMON_CODE('-1','-1','가입일시')
    ,new COMMON_CODE('0','0','오름차순')
    ,new COMMON_CODE('1','1','내림차순')
];

var memNickSort = [
    new COMMON_CODE('','memNickSort','닉네임정렬')
    ,new COMMON_CODE('-1','-1','닉네임')
    ,new COMMON_CODE('0','0','오름차순')
    ,new COMMON_CODE('1','1','내림차순')
];

var memLoginIdSort = [
    new COMMON_CODE('','memLoginIdSort','로그인ID정렬')
    ,new COMMON_CODE('-1','-1','로그인ID')
    ,new COMMON_CODE('0','0','오름차순')
    ,new COMMON_CODE('1','1','내림차순')
];

var memIpSort = [
    new COMMON_CODE('','memIpSort','IP정렬')
    ,new COMMON_CODE('-1','-1','IP')
    ,new COMMON_CODE('0','0','오름차순')
    ,new COMMON_CODE('1','1','내림차순')
];





// ------------------------- table -----------------------------
var mem_gift_summary = [
    new COMMON_CODE('', 'total_charge_dal', '누적 충전 보낸 달')
    , new COMMON_CODE('', 'total_charge_dal', '누적 충전 받은 달')
    , new COMMON_CODE('', 'total_charge_byeol', '누적 충전 별')
    // , new COMMON_CODE('', 'most_gift_mem', '보낸 선물 최다 회원')
    // , new COMMON_CODE('', 'most_received_mem', '받은 선물 최다 회원')
];
var mem_received_summary = [
    new COMMON_CODE('', 'total_exchange', '누적 교환 수')
    , new COMMON_CODE('', 'dal10', '달 10')
    , new COMMON_CODE('', 'dal30', '달 30')
    , new COMMON_CODE('', 'dal100', '달 100')
    , new COMMON_CODE('', 'dal500', '달 500')
    , new COMMON_CODE('', 'dal1000', '달 1,000')
    , new COMMON_CODE('', 'dal3000', '달 3,000')
];