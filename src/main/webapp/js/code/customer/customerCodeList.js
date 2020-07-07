
/** =------ Declaration ---------- */
var declaration_searchType = [
    new COMMON_CODE(null, 'searchType', '검색 조건')
    , new COMMON_CODE('all', '-1', '검색 조건(전체)')
    , new COMMON_CODE('memno', '1', '회원번호')
    , new COMMON_CODE('memid', '2', 'UserID')
    , new COMMON_CODE('memnick', '3', 'User닉네임')
    , new COMMON_CODE('phone', '4', '연락처')
];

var declaration_slctType = [
    new COMMON_CODE(null, 'slctType', '제재 조치')
    , new COMMON_CODE('all', '-1', '제재 조치(전체)')
    , new COMMON_CODE('not', '0', '미처리')
    , new COMMON_CODE('continue', '1', '정상')
    , new COMMON_CODE('warning', '2', '경고')
    , new COMMON_CODE('stop1', '3', '1일정지')
    , new COMMON_CODE('stop3', '4', '3일정지')
    , new COMMON_CODE('stop7', '5', '7일정지')
    , new COMMON_CODE('withdrawal', '6', '영구정지')
    , new COMMON_CODE('forcedOut', '7', '강제탈퇴')
];

var declaration_opCode = [
    new COMMON_CODE(null, 'slctType', '제재 조치')
    , new COMMON_CODE('all', '-1', '제재 조치(전체)')
    , new COMMON_CODE('not', '0', '미처리')
    , new COMMON_CODE('continue', '1', '정상')
    , new COMMON_CODE('warning', '2', '경고')
    , new COMMON_CODE('stop1', '3', '1일정지')
    , new COMMON_CODE('stop3', '4', '3일정지')
    , new COMMON_CODE('stop7', '5', '7일정지')
    , new COMMON_CODE('withdrawal', '6', '영구정지')
];

var declaration_reason = [
    new COMMON_CODE(null, 'slctReason', '신고 구분')
    , new COMMON_CODE('all', '-1', '신고 구분(전체)')
    , new COMMON_CODE('profile', '1', '프로필사진')
    , new COMMON_CODE('obs', '2', '음란성')
    , new COMMON_CODE('adv', '3', '광고 및 상업성')
    , new COMMON_CODE('abuse', '4', '욕설 및 비방성')
    , new COMMON_CODE('etc', '5', '기타')
    , new COMMON_CODE('admin', '98', '관리자신고')
];

var block_scope = [
    new COMMON_CODE(null, 'blockScope', '조치 범위')
    , new COMMON_CODE('mem_no', 'mem_no', '아이디(변경x)')
    , new COMMON_CODE('deviceUuid', '1', '디바이스 아이디')
    , new COMMON_CODE('ip', '2', 'ip')
]

var declaration_status = [
    new COMMON_CODE(null, 'status', '처리구분')
    , new COMMON_CODE('all', '-1', '전체')
    , new COMMON_CODE('off', '0', '미처리')
    , new COMMON_CODE('on', '1', '처리완료')
];

var declaration_Message = [
  new COMMON_CODE(null, 'declaration_Message', '조치메시지')
    ,new COMMON_CODE('msg1', '1', '음란물 유포행위')
    ,new COMMON_CODE('msg2', '2', '부계정을 이용한 어뷰징')
    ,new COMMON_CODE('msg3', '3', '불법 유포 및 홍보')
    ,new COMMON_CODE('msg4', '4', '청소년 정서에 저해')
    ,new COMMON_CODE('msg5', '5', '타인의 개인정보 복제/유포')
    ,new COMMON_CODE('msg6', '6', '범법행위 정보의 공유 및 위반행위 유도 조장')
    ,new COMMON_CODE('msg7', '7', '지나친 욕설과 부적절한 언어, 혐오 폭력성을 포함한 부적절한 내용')
    ,new COMMON_CODE('msg7', '8', '타인 또는 장애인 비하')
    ,new COMMON_CODE('msg7', '9', '지역/종교/인종차별 및 정치적 선동')
    ,new COMMON_CODE('msg7', '10', '고의적 서비스 운영방해')
    ,new COMMON_CODE('msg7', '11', '서비스 내 현금 거래')
    ,new COMMON_CODE('msg7', '12', '채팅 도배 행위')
    ,new COMMON_CODE('msg7', '13', '결제 도용 및 악용을 통해 부당이익을 취하는 행위')
    ,new COMMON_CODE('msg7', '14', '단체적인 행동으로 타인을 압박/협박/고통등을 주는 경우')
    ,new COMMON_CODE('msg99', '99', '기타 운영자 직접작성')
];

var declaration_send = [
    new COMMON_CODE(null, 'declaration_sendNoti', '보내기 구분')
    , new COMMON_CODE('yes', '1', '알림 ON')
    , new COMMON_CODE('no', '0', '알림 OFF')
];

/** =------ Sms ---------- */

var sms_code = [
  new COMMON_CODE(null, 'vxml_file', 'sms구분')
  , new COMMON_CODE('all', '-1', 'SMS구분(전체)')
  , new COMMON_CODE('join', '0', '회원가입')
  , new COMMON_CODE('change', '1', '비밀번호 변경')
  , new COMMON_CODE('exchange_ok', '2', '환전완료')
  , new COMMON_CODE('exchange_cancel', '3', '환전불가')
    , new COMMON_CODE('exchange_cancel', '7', '어드민')
    , new COMMON_CODE('etc', '', '기타')
];

var sms_isDirect = [
    new COMMON_CODE(null, 'sendType', '발송 구분')
    , new COMMON_CODE('instant', '0', '즉시발송')
    , new COMMON_CODE('reservation', '1', '예약발송')
];

var sms_msgType = [
    new COMMON_CODE(null, 'msg_type', '발송형태')
    , new COMMON_CODE('sms', '0', 'SMS')
    , new COMMON_CODE('lms', '5', 'LMS')
];

var sms_slctType = [
    new COMMON_CODE(null, 'slctType', '검색 조건')
    , new COMMON_CODE('time', '0', '시간대별')
    , new COMMON_CODE('day', '1', '일자별')
    , new COMMON_CODE('month', '2', '월간별')
];

var sms_status = [
    new COMMON_CODE(null, 'status', '발송상태')
    , new COMMON_CODE('0', '0', '요청')
    , new COMMON_CODE('1', '1', '대기')
    , new COMMON_CODE('2', '2', '완료')
    , new COMMON_CODE('3', '3', '예약')
];


/** =------ Image ---------- */
var declaration_image_searchType = [
    new COMMON_CODE(null, 'searchType', '검색 조건')
    , new COMMON_CODE('all', '-1', '전체')
    , new COMMON_CODE('memno', '1', '회원번호')
    , new COMMON_CODE('memid', '3', 'UserID')
    , new COMMON_CODE('memnick', '4', '닉네임')
    , new COMMON_CODE('memphone', '5', '연락처')
    , new COMMON_CODE('roomNm', '6', '방송제목')
];

var declaration_image_Message = [
    new COMMON_CODE(null, 'declaration_Message', '조치메시지')
    , new COMMON_CODE('msg1','1','상대방에게 불쾌감을 유발하는 성적 표현 및 음란성 이미지')
    , new COMMON_CODE('msg2','2','게임물 내 도박/프리서버/유료 대리랭크를 하거나 이를 홍보하는 이미지')
    , new COMMON_CODE('msg3','3','타인의 개인정보를 유포하는 행위')
    , new COMMON_CODE('msg4','4','저작권침해 (게시물 복제*전송에 대한 신고의 건)')
    , new COMMON_CODE('msg5','5','방송방 내 음란물 게시')
    , new COMMON_CODE('msg6','6','청소년 보호정책에 위배되는 이미지')
    , new COMMON_CODE('msg7','7','의도적이고 선정적인 이미지')
    , new COMMON_CODE('msg99','99','기타')
];