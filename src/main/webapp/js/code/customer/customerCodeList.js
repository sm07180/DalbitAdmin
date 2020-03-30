
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
    , new COMMON_CODE('stop15', '6', '강제탈퇴')
    , new COMMON_CODE('withdrawal', '7', '영구정지')
];

var declaration_reason = [
    new COMMON_CODE(null, 'slctReason', '신고 구분')
    , new COMMON_CODE('all', '-1', '전체')
    , new COMMON_CODE('profile', '1', '사진 및 이미지')
    , new COMMON_CODE('obs', '2', '음란성')
    , new COMMON_CODE('adv', '3', '광고 및 상업성')
    , new COMMON_CODE('abuse', '4', '욕설 및 비방성')
    , new COMMON_CODE('etc', '99', '기타')
];

var declaration_status = [
    new COMMON_CODE(null, 'status', '처리구분')
    , new COMMON_CODE('all', '-1', '전체')
    , new COMMON_CODE('off', '0', '미처리')
    , new COMMON_CODE('on', '1', '처리완료')
];

var declaration_Message = [
  new COMMON_CODE(null, 'message', '조치메시지')
    , new COMMON_CODE('msg1', '1', '성 매매를 하거나 이를 홍보하는 행위')
    , new COMMON_CODE('msg2', '2', '게임물 내 도박/프리서버/유료 대리랭크를 하거나 이를 홍보하는 행위')
    , new COMMON_CODE('msg3', '3', '타인의 개인정보를 유포하는 행위')
    , new COMMON_CODE('msg4', '4', '저작권침해 (게시물 복제*전송에 대한 신고의 건)')
    , new COMMON_CODE('msg5', '5', '방송방 내 음란물 게시')
    , new COMMON_CODE('msg6', '6', '범법 행위에 관한 정보를 공유하거나, 법령에 위반 되는 행위를 유도, 조장하는 행위')
    , new COMMON_CODE('msg7', '7', '위 항목 외 위법 행위')
    , new COMMON_CODE('msg8', '8', '기타 운영자 직접작성')
];
