
/** =------ Declaration ---------- */
var declaration_searchType = [
    new COMMON_CODE(null, 'searchType', '검색 조건')
    , new COMMON_CODE('all', '-1', '전체')
    , new COMMON_CODE('memno', '1', '회원번호')
    , new COMMON_CODE('memid', '2', 'UserID')
    , new COMMON_CODE('memnick', '3', 'User닉네임')
    , new COMMON_CODE('phone', '4', '연락처')
];

var declaration_slctType = [
    new COMMON_CODE(null, 'slctType', '제재 조치')
    , new COMMON_CODE('all', '-1', '전체')
    , new COMMON_CODE('not', '0', '미처리')
    , new COMMON_CODE('continue', '1', '정상')
    , new COMMON_CODE('warning', '2', '경고')
    , new COMMON_CODE('stop1', '3', '1일정지')
    , new COMMON_CODE('stop3', '4', '3일정지')
    , new COMMON_CODE('stop7', '5', '7일정지')
    , new COMMON_CODE('stop15', '7', '강제탈퇴')
    , new COMMON_CODE('withdrawal', '6', '영구정지')
];

var declaration_reason = [
    new COMMON_CODE(null, 'slctReason', '신고 구분')
    , new COMMON_CODE('all', '-1', '전체')
    , new COMMON_CODE('background', '1', '방송방배경')
    , new COMMON_CODE('profile', '2', '프로필사진')
    , new COMMON_CODE('obs', '3', '음란성')
    , new COMMON_CODE('adv', '4', '광고 및 상업성')
    , new COMMON_CODE('abuse', '5', '욕설 및 비방성')
    , new COMMON_CODE('admin', '98', '관리자신고')
    , new COMMON_CODE('profile', '99', '기타')

];

var declaration_status = [
    new COMMON_CODE(null, 'status', '처리구분')
    , new COMMON_CODE('all', '-1', '전체')
    , new COMMON_CODE('off', '0', '미처리')
    , new COMMON_CODE('on', '1', '처리완료')
];

var declaration_Message = [
  new COMMON_CODE(null, 'declaration_Message', '조치메시지')
    , new COMMON_CODE('msg1', '1', '성 매매를 하거나 이를 홍보하는 행위')
    , new COMMON_CODE('msg2', '2', '게임물 내 도박/프리서버/유료 대리랭크를 하거나 이를 홍보하는 행위')
    , new COMMON_CODE('msg3', '3', '타인의 개인정보를 유포하는 행위')
    , new COMMON_CODE('msg4', '4', '저작권침해 (게시물 복제*전송에 대한 신고의 건)')
    , new COMMON_CODE('msg5', '5', '방송방 내 음란물 게시')
    , new COMMON_CODE('msg6', '6', '범법 행위에 관한 정보를 공유하거나, 법령에 위반 되는 행위를 유도, 조장하는 행위')
    , new COMMON_CODE('msg7', '7', '위 항목 외 위법 행위')
    , new COMMON_CODE('msg99', '99', '기타 운영자 직접작성')
];

var declaration_send = [
    new COMMON_CODE(null, 'declaration_sendNoti', '보내기 구분')
    , new COMMON_CODE('yes', '1', '알림 발송함')
    , new COMMON_CODE('no', '0', '알림 발송 안함')
];

/** =------ Sms ---------- */

var sms_code = [
  new COMMON_CODE(null, 'vxml_file', 'sms구분')
  , new COMMON_CODE('all', '-1', '전체')
  , new COMMON_CODE('join', '0', '회원가입')
  , new COMMON_CODE('change', '1', '비밀번호 변경')
    , new COMMON_CODE('etc', '', '기타')
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