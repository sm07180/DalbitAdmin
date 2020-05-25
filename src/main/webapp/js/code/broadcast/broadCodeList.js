var subject_type = [
    new COMMON_CODE(null, 'subject_type', '방송 주제')
    , new COMMON_CODE('00', '00', '일상')
    , new COMMON_CODE('01', '01', '수다/챗')
    , new COMMON_CODE('02', '02', '노래/연주')
    , new COMMON_CODE('03', '03', '노래방')
    , new COMMON_CODE('04', '04', '책/스토리')
    , new COMMON_CODE('05', '05', '여행')
    , new COMMON_CODE('06', '06', '힐링')
    , new COMMON_CODE('07', '07', '고민/사연')
    , new COMMON_CODE('08', '08', '사랑/우정')
    , new COMMON_CODE('09', '09', 'ASMR')
    , new COMMON_CODE('10', '10', '유머')
    , new COMMON_CODE('11', '11', '스터디')
    , new COMMON_CODE('13', '13', '성우')
    , new COMMON_CODE('14', '14', '연애/오락')
    , new COMMON_CODE('15', '15', '먹방/요리')
    , new COMMON_CODE('16', '16', '건강/스포츠')
    , new COMMON_CODE('17', '17', '게임')
    , new COMMON_CODE('19', '19', '드라마/영화')
    , new COMMON_CODE('20', '20', '외국어')
    , new COMMON_CODE('21', '21', '판매/영업')
    , new COMMON_CODE('99', '99', '기타')
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
    , new COMMON_CODE('all', '0', '전체   ▼')
    , new COMMON_CODE('memno', '1', '회원번호')
    , new COMMON_CODE('memid', '2', 'UserID')
    , new COMMON_CODE('memnick', '3', '닉네임')
    , new COMMON_CODE('memphone', '4', '연락처')
    , new COMMON_CODE('memname', '5', '이름')
];

var searchBroad_broad = [
    new COMMON_CODE(null, 'searchBroad_broad', '방송정보검색')
    , new COMMON_CODE('all', '-1', '전체 ▼')
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
    , new COMMON_CODE('3', '3', '접속이상')
];

var djOs = [
    new COMMON_CODE(null, 'djOs', 'djOs')
    , new COMMON_CODE('0', '1', 'android')
    , new COMMON_CODE('1', '2', 'ios')
    , new COMMON_CODE('2', '3', 'PC')
];

var room_state = [
    new COMMON_CODE(null, 'room_state', '방송상태')
    , new COMMON_CODE('0', '0', 'Ant끊김')
    , new COMMON_CODE('1', '1', '방송중(Mic On)')
    , new COMMON_CODE('2', '2', '방송준비중(Mic Off)')
    , new COMMON_CODE('3', '3', '통화중')
    , new COMMON_CODE('4', '4', '방송종료')
    , new COMMON_CODE('5', '5', 'DJ비정상종료')
];

var searchRoom_state = [
    new COMMON_CODE(null, 'searchRoom_state', '방송상태')
    , new COMMON_CODE('-1', '-1', '전체')
    , new COMMON_CODE('0', '1', '진행중')
    , new COMMON_CODE('4', '2', '종료')
];


// ------------------------- table -----------------------------
var listen_summary = [
    new COMMON_CODE('','listenerCnt','청취자 수')
    // ,new COMMON_CODE('','noMemCnt','비회원 참여 수')
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


var chat_summary = [
    new COMMON_CODE('','chatCnt','채팅참여자')
    ,new COMMON_CODE('','djCnt','달D')
    ,new COMMON_CODE('','listenerCnt',': 청취자')
    ,new COMMON_CODE('','guest',': 게스트')
    ,new COMMON_CODE('','managerCnt',': 매니저')
    ,new COMMON_CODE('','forcedCnt','강제퇴장자')
];

var broadcast_state = [
    new COMMON_CODE('','state','방송방상태')
    ,new COMMON_CODE('0','0','미디어서버비정상')
    ,new COMMON_CODE('1','1','방송중')
    ,new COMMON_CODE('2','2','mic off')
    ,new COMMON_CODE('3','3','통화중')
    ,new COMMON_CODE('4','4','방송종료')
    ,new COMMON_CODE('5','5','DJ비정상종료')
    ,new COMMON_CODE('6','6','방송준비중')
]

var broadcast_state_icon = [
    new COMMON_CODE('','state','방송방상태')
    ,new COMMON_CODE('1','1','<i class="fa fa-play-circle fa-2x"></i>')
    ,new COMMON_CODE('2','2','<i class="fa fa-microphone-slash fa-2x"></i>')
    ,new COMMON_CODE('3','3','<i class="fa fa-phone-volume fa-2x"></i>')
    ,new COMMON_CODE('4','4','<i class="fa fa-stop-circle fa-2x"></i>')
    ,new COMMON_CODE('5','5','<i class="fa fa-exclamation-triangle fa-2x"></i>')
]

//----------------massage---------------------

var entryType_Message = [
    new COMMON_CODE(null, 'entry_message', '조치메시지')
    , new COMMON_CODE('msg1', '1', '회원에 의한 요청 시')
    , new COMMON_CODE('msg2', '2', '연령에 맞지 않은 방송방 처리 시')
    , new COMMON_CODE('msg3', '3', '방송DJ의 컨트롤 불가 사항 시')
    , new COMMON_CODE('msg99', '99', '기타 운영자 직접작성')
];

var freezeMsg_Message = [
    new COMMON_CODE(null, 'entry_message', '조치메시지')
    , new COMMON_CODE('msg1', '1', '회원에 의한 요청 시')
    , new COMMON_CODE('msg2', '2', '도배성 글에 대한 처리 시')
    , new COMMON_CODE('msg3', '3', '방송DJ의 컨트롤 불가 사항 시')
    , new COMMON_CODE('msg99', '99', '기타 운영자 직접작성')
];

var forceExit_Message = [
    new COMMON_CODE(null, 'entry_message', '조치메시지')
    ,new COMMON_CODE('msg1', '1', '성 매매를 하거나 이를 홍보하는 행위')
    ,new COMMON_CODE('msg2', '2', '게임물 내 도박/프리서버/유료 대리랭크를 하거나 이를 홍보하는 행위')
    ,new COMMON_CODE('msg3', '3', '타인의 개인정보를 유포하는 행위')
    ,new COMMON_CODE('msg4', '4', '저작권침해 (게시물 복제*전송에 대한 신고의 건)')
    ,new COMMON_CODE('msg5', '5', '방송방 내 음란물 게시')
    ,new COMMON_CODE('msg6', '6', '범법 행위에 관한 정보를 공유하거나, 법령에 위반 되는 행위를 유도, 조장하는 행위')
    ,new COMMON_CODE('msg7', '7', '위 항목 외 위법 행위')
    ,new COMMON_CODE('msg99', '99', '기타 운영자 직접작성')
];

