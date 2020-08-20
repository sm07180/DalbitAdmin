/** =------ Notice ---------- */
var notice_searchType = [
    new COMMON_CODE(null, 'searchType', '검색구분')
    , new COMMON_CODE('all', '-1', '전체')
    , new COMMON_CODE('title', '1', '공지제목')
    , new COMMON_CODE('content', '2', '내용')
    , new COMMON_CODE('opName', '3', '작성자')
];

var notice_slctType = [
    new COMMON_CODE(null, 'slctType', '공지구분')
    , new COMMON_CODE('all', '-1', '전체')
    , new COMMON_CODE('notice', '1', '일반공지')
    , new COMMON_CODE('notice', '', '긴급공지(개발필요)')
    , new COMMON_CODE('event', '2', '이벤트')
    , new COMMON_CODE('check', '3', '정기점검')
    , new COMMON_CODE('update', '4', '업데이트')
    , new COMMON_CODE('news', '5', '언론보도')
];


/** =------ PushMessage ---------- */
var push_searchType = [
    new COMMON_CODE(null, 'searchType', '검색구분')
    , new COMMON_CODE('all', '-1', '검색구분(전체)')
    , new COMMON_CODE('title', '1', '메시지 제목')
    , new COMMON_CODE('content', '2', '메시지 내용')
    , new COMMON_CODE('opname', '3', '발신자')
];

var push_sendType = [
    new COMMON_CODE(null, 'send_type', '발송형태')
    , new COMMON_CODE('all', '-1', '발송형태(전체)')
    , new COMMON_CODE('push/noti', '11', 'PUSH/알림')
    , new COMMON_CODE('push', '10', 'PUSH')
    , new COMMON_CODE('noti', '01', '알림')
];

var push_snedStatus = [
    new COMMON_CODE(null, 'snedStatus', '발송상태')
    , new COMMON_CODE('ready', '0', '발송대기')
    , new COMMON_CODE('send', '1', '발송완료')
    , new COMMON_CODE('error', '2', '발송실패')
];

var push_platform = [
    new COMMON_CODE(null, 'platform', '노출 OS구분')
    , new COMMON_CODE('all', '-1', '전체')
    , new COMMON_CODE('pc', '1', 'PC')
    , new COMMON_CODE('android', '2', 'Android')
    , new COMMON_CODE('ios', '3', 'IOS')
];

var push_messageType = [
    new COMMON_CODE(null, 'messageType', '메시지 구분')
    , new COMMON_CODE('notice', '0', '일반공지')
    , new COMMON_CODE('notice', '1', '긴급공지')
    , new COMMON_CODE('event', '2', '이벤트')
    , new COMMON_CODE('check', '3', '정기점검')
    , new COMMON_CODE('update', '4', '업데이트')
    , new COMMON_CODE('etc', '99', '기타')
];

var push_slctPush = [
    new COMMON_CODE(null, 'slctPush', '푸시타입')
    , new COMMON_CODE('mystar', '0', '마이스타')
    , new COMMON_CODE('receive', '1', '선물 받은 달')
    , new COMMON_CODE('fan', '2', '팬')
    , new COMMON_CODE('comment', '3', '댓글')
    , new COMMON_CODE('dalbit', '4', '달빛 라이브')
    , new COMMON_CODE('event', '5', '이벤트 및 마케팅 정보')
];

var push_slctPush2 = [
    new COMMON_CODE(null, 'slctPush', '푸시타입')
    , new COMMON_CODE('room', '1', '방송방')       								// [room_no]
    , new COMMON_CODE('main', '2', '메인')
//    , new COMMON_CODE('incast', '4', '등록 된 캐스트')
//     , new COMMON_CODE('spdj', '5', '스페셜 DJ 선정 페이지')          // 이상훈과장 요청으로 제거  전유신 2020.07.28
    , new COMMON_CODE('event', '6', '이벤트 페이지')           					// [board_idx]
    , new COMMON_CODE('notice', '7', '공지사항 페이지')                       	// [board_idx]
    , new COMMON_CODE('fan', '31', '팬보드/댓글')								// [mem_no]
    , new COMMON_CODE('wallet', '32', '내지갑(달)')						// [mem_no]
//    , new COMMON_CODE('cast', '33', '마이페이지>캐스트>캐스트 정보 변경 페이지')
    , new COMMON_CODE('noti', '34', '알림')
    , new COMMON_CODE('mypage', '35', '마이페이지')							// [mem_no]
    , new COMMON_CODE('djpage', '36', '대상 프로필')              		// [mem_no]
    , new COMMON_CODE('question', '37', '1:1문의')
    , new COMMON_CODE('broadnoti', '38', '방송공지')
    // , new COMMON_CODE('41', '41', '랭킹 > DJ > 일간')
    // , new COMMON_CODE('42', '42', '랭킹 > DJ > 주간')
    // , new COMMON_CODE('43', '43', '랭킹 > FAN > 일간')
    // , new COMMON_CODE('44', '44', '랭킹 > FAN > 주간')
    , new COMMON_CODE('input', '50', '직접입력')
];

var push_slctPush3 = [
    new COMMON_CODE(null, 'slctPush', '푸시타입')
    , new COMMON_CODE('room', '1', '방송방')
    , new COMMON_CODE('main', '2', '메인')
    , new COMMON_CODE('incast', '4', '캐스트')
    , new COMMON_CODE('spdj', '5', '스페셜 DJ')
    , new COMMON_CODE('event', '6', '이벤트')
    , new COMMON_CODE('notice', '7', '공지사항')
    , new COMMON_CODE('fan', '31', '팬보드/댓글')
    , new COMMON_CODE('wallet', '32', '내지갑')
    , new COMMON_CODE('cast', '33', '캐스트 수정')
    , new COMMON_CODE('noti', '34', '알림')
    , new COMMON_CODE('mypage', '35', '마이페이지')
    , new COMMON_CODE('djpage', '36', '레벨업')
    , new COMMON_CODE('question', '37', '1:1문의')
    , new COMMON_CODE('broadnoti', '38', '방송공지')
    , new COMMON_CODE('41', '41', 'DJ랭킹(일간)')
    , new COMMON_CODE('42', '42', 'DJ랭킹(주간)')
    , new COMMON_CODE('43', '43', 'FAN랭킹(일간)')
    , new COMMON_CODE('44', '44', 'FAN랭킹(주간)')
    , new COMMON_CODE('input', '50', '직접입력')
];

var push_isDirect = [
    new COMMON_CODE(null, 'sendType', '발송 구분')
    , new COMMON_CODE('instant', '0', '즉시발송')
    , new COMMON_CODE('reservation', '1', '예약발송')
];


var push_push_slct = [
    new COMMON_CODE(null, 'push_slct', '카테고리')
    , new COMMON_CODE('all', '-1', '카테고리(전체)')
    , new COMMON_CODE('11', '11', '방송 시작')
    , new COMMON_CODE('12', '12', 'DJ 레벨 업(사용안함)')
    , new COMMON_CODE('13', '13', '캐스트 등록, 좋아요')
    , new COMMON_CODE('14', '14', '방송 시작 10분 후')
    , new COMMON_CODE('15', '15', '회원 선물 수신')
    , new COMMON_CODE('16', '16', '팬 등록')
    , new COMMON_CODE('17', '17', '팬 보드 등록')
    , new COMMON_CODE('18', '18', '방송공지 등록')
    , new COMMON_CODE('19', '19', '생일 축하')
    , new COMMON_CODE('20', '20', 'DJ/FAN 랭킹 알림')
    , new COMMON_CODE('51', '51', '미접속 대상 알림')
    , new COMMON_CODE('52', '52', '이벤트 알림')
    , new COMMON_CODE('53', '53', '긴급공지')
    , new COMMON_CODE('54', '54', '사용자 경고')
    , new COMMON_CODE('55', '55', '경고 해제')
    , new COMMON_CODE('56', '56', '이용정지 해제')
    , new COMMON_CODE('57', '57', '사용자 정보 초기화')
    , new COMMON_CODE('58', '58', '캐스트 정보 초기화')
    , new COMMON_CODE('59', '59', '스페셜 DJ 선정')
    , new COMMON_CODE('60', '60', '1:1 문의 답변')
    , new COMMON_CODE('61', '61', '운영자 선물 수신')
    , new COMMON_CODE('62', '62', '환전 완료')
    , new COMMON_CODE('63', '63', '환전 불가')
    , new COMMON_CODE('92', '92', '운영자(회원 + 비회원)')
    , new COMMON_CODE('93', '93', '운영자(회원)')
    , new COMMON_CODE('94', '94', '운영자(비회원)')
    , new COMMON_CODE('95', '95', '운영자(테스트계정)')
    , new COMMON_CODE('96', '96', '운영자(지정회원)')
];


/** =------ Splash ---------- */
var splash_exposureType = [
    new COMMON_CODE(null, 'exposureType', '게시 기간')
    , new COMMON_CODE('immediately', '0', '즉시게시')
    , new COMMON_CODE('reservation', '1', '예약게시')
];

var search_event = [
    new COMMON_CODE(null, 'search_event', '이벤트')
    , new COMMON_CODE('all', '0', '전체')
    , new COMMON_CODE('title', '1', '이벤트제목')
];


/** =------ Banner ---------- */
var banner_searchType = [
    new COMMON_CODE(null, 'searchType', '검색구분')
    , new COMMON_CODE('all', '-1', '전체')
    , new COMMON_CODE('title', '1', '메시지 제목')
    , new COMMON_CODE('content', '2', '메시지 내용')
];

var banner_bannerType = [
    new COMMON_CODE(null, 'bannerType', '배너구분')
    , new COMMON_CODE('all', '-1', '전체')
    , new COMMON_CODE('gnb', '0', 'GNB')
    , new COMMON_CODE('top', '1', 'MainTop')
    /*, new COMMON_CODE('thumb', '2', 'Main 썸네일')*/
    , new COMMON_CODE('dj', '3', 'DJ랭킹')
    , new COMMON_CODE('store', '4', '스토어')
    , new COMMON_CODE('center', '5', '고객센터')
    , new COMMON_CODE('popup', '6', '팝업')
    , new COMMON_CODE('startPopup', '7', '시작팝업')
    , new COMMON_CODE('endPopup', '8', '종료팝업')
    , new COMMON_CODE('mainRankBottom', '9', 'Main Center')
];

var banner_loginType = [
    new COMMON_CODE(null, 'loginType', '로그인구분')
    , new COMMON_CODE('all', '0', '전체')
    , new COMMON_CODE('login', '1', '로그인')
    , new COMMON_CODE('nonlogin', '2', '비로그인')
];

var banner_frequency = [
    new COMMON_CODE(null, 'frequency', '노출빈도')
    , new COMMON_CODE('10', '10', '10%')
    , new COMMON_CODE('20', '20', '20%')
    , new COMMON_CODE('30', '30', '30%')
    , new COMMON_CODE('40', '40', '40%')
    , new COMMON_CODE('50', '50', '50%')
    , new COMMON_CODE('60', '60', '60%')
    , new COMMON_CODE('70', '70', '70%')
    , new COMMON_CODE('80', '80', '80%')
    , new COMMON_CODE('90', '90', '90%')
    , new COMMON_CODE('100', '100', '100%')
];

var banner_exposureType = [
    new COMMON_CODE(null, 'exposureType', '노출 기간')
    , new COMMON_CODE('always', '0', '상시')
    , new COMMON_CODE('choice', '1', '직접선택')
];

var banner_popupType = [
    new COMMON_CODE(null, 'popup_type', '팝업 구분')
    , new COMMON_CODE('image', '0', '이미지팝업')
    , new COMMON_CODE('text', '1', '텍스트팝업')
];

var banner_cookieYn = [
    new COMMON_CODE(null, 'cookie_yn', '쿠키사용여부')
    , new COMMON_CODE('off', 'N', 'off')
    , new COMMON_CODE('on', 'Y', 'on')
];

/** =------ Event ---------- */
var event_searchType = [
    new COMMON_CODE(null, 'searchType', '검색구분')
    , new COMMON_CODE('all', '-1', '전체')
    , new COMMON_CODE('title', '1', '제목')
];

var event_isReply = [
    new COMMON_CODE(null, 'is_reply', '댓글사용여부')
    , new COMMON_CODE('no', '0', '사용안함')
    , new COMMON_CODE('yes', '1', '사용')
];

/** =------ Item ---------- */
var item_searchType = [
    new COMMON_CODE(null, 'searchType', '검색구분')
    , new COMMON_CODE('all', '-1', '전체')
    , new COMMON_CODE('code', '1', '코드')
    , new COMMON_CODE('itemName', '2', '상품명')
];

var item_discount = [
    new COMMON_CODE(null, 'discount_rate', '할인율')
    , new COMMON_CODE('0', '0', 'OFF')
    , new COMMON_CODE('10', '10', '10%')
    , new COMMON_CODE('20', '20', '20%')
    , new COMMON_CODE('30', '30', '30%')
    , new COMMON_CODE('40', '40', '40%')
    , new COMMON_CODE('50', '50', '50%')
    , new COMMON_CODE('60', '60', '60%')
    , new COMMON_CODE('70', '70', '70%')
    , new COMMON_CODE('80', '80', '80%')
    , new COMMON_CODE('90', '90', '90%')
    , new COMMON_CODE('100', '100', '100%(무료)')
    , new COMMON_CODE('etc', '-1', '기타 <input id="inputDiscountEtc" class="_trim" style="width:40px;" onkeydown="common.inputFilterNumber(event)" maxlength="3">%')
];

var item_itemType = [
    new COMMON_CODE(null, 'item_type', '아이템 타입')
    , new COMMON_CODE('new', '1', '신규')
    , new COMMON_CODE('best', '2', '인기')
    , new COMMON_CODE('limit', '3', '한정')
];

var item_itemSlct = [
    new COMMON_CODE(null, 'item_slct', '아이템 구분')
    , new COMMON_CODE('gift', '1', '방송방선물')
    , new COMMON_CODE('use', '2', '방송방사용')
    , new COMMON_CODE('dal', '3', '달 선물')
];

var item_useArea = [
    new COMMON_CODE(null, 'useArea', '사용영역')
    , new COMMON_CODE('default', '0', '기본')
    , new COMMON_CODE('particle', '1', '1번 영역(파티클)')
    , new COMMON_CODE('combo', '2', '2번 영역(콤보)')
    , new COMMON_CODE('top', '3', '3번 영역(상단)')
    , new COMMON_CODE('right', '4', '4번 영역(우측)')
    , new COMMON_CODE('topAll', '5', '5번 영역(상단전체)')
];

var item_fileField = [
    new COMMON_CODE(null, 'fileField', '파일등록필드')
    , new COMMON_CODE('webp/json', 'webp/json', 'Webp/Json')
    // , new COMMON_CODE('sticker', '2', 'sticker')
];


/** =------ Util ---------- */

var content_viewOn = [
    new COMMON_CODE(null, 'viewYn', '게시구분')
    , new COMMON_CODE('on', '1', 'ON')
    , new COMMON_CODE('off', '0', 'OFF')
];

var content_platform1 = [
    new COMMON_CODE(null, 'platform', '플랫폼구분')
    , new COMMON_CODE('all', '', '전체')
    , new COMMON_CODE('pc', '2', 'PC')
    , new COMMON_CODE('android', '3', 'Android')
    , new COMMON_CODE('ios', '4', 'IOS')
    , new COMMON_CODE('mobile', '5', 'Web-Mobile')
];

var content_platform2 = [
    new COMMON_CODE(null, 'platform', '플랫폼구분')
    , new COMMON_CODE('all', '-1', '전체')
    , new COMMON_CODE('pc', '1', 'PC')
    , new COMMON_CODE('android', '2', 'Android')
    , new COMMON_CODE('ios', '3', 'IOS')
];

var content_platform3 = [
    new COMMON_CODE(null, 'platform', '플랫폼구분')
    , new COMMON_CODE('all', '-1', '전체')
    , new COMMON_CODE('pc', '110', 'PC/Android')
    , new COMMON_CODE('ios', '001', 'IOS')
];

var content_platform4 = [
    new COMMON_CODE(null, 'platform', '플랫폼구분')
    , new COMMON_CODE('all', '0', '전체')
    , new COMMON_CODE('pc', '1', 'PC')
    , new COMMON_CODE('Mobile', '2', 'Mobile')
];

var content_platform5 = [
    new COMMON_CODE(null, 'platform', '플랫폼구분')
    , new COMMON_CODE('all', '0', '플랫폼(전체)')
    , new COMMON_CODE('android/ios', '111', 'Android/IOS')
    , new COMMON_CODE('android', '110', 'Android')
    , new COMMON_CODE('ios', '101', 'IOS')
];


/** =------ App ---------- */
var content_selectApp = [
    new COMMON_CODE(null, 'os', '앱구분')
    , new COMMON_CODE('all', '', '전체')
    , new COMMON_CODE('android', 1, 'AOS')
    , new COMMON_CODE('ios', 2, 'IOS')
];

var content_radioApp = [
    new COMMON_CODE(null, 'content_os', '앱구분')
    , new COMMON_CODE('android', 1, 'AOS')
    , new COMMON_CODE('ios', 2, 'IOS')
];

var content_isUse = [
    new COMMON_CODE(null, 'content_isUse', '사용여부')
    , new COMMON_CODE('no', 0, '사용 안 함')
    , new COMMON_CODE('yes', 1, '사용 함')
];

/** =------ Attendance ---------- */
var attendance_dayType = [
    new COMMON_CODE(null, 'the_day', '참여 구분')
    , new COMMON_CODE('all', '-1', '참여 구분(전체)')
    , new COMMON_CODE('more', '1', '더줘')
    , new COMMON_CODE('yes', '2', '출석')
];

var attendance_searchType = [
    new COMMON_CODE(null, 'searchType', '검색 조건')
    , new COMMON_CODE('all', '-1', '검색 조건(전체)')
    , new COMMON_CODE('memno', '1', '회원번호')
    , new COMMON_CODE('memid', '2', 'UserID')
    , new COMMON_CODE('memnick', '3', 'User닉네임')
];

/** =------ inssaticon ---------- */
var inssaticon_isUse = [
    new COMMON_CODE(null, 'isUse', '노출여부')
    , new COMMON_CODE('all', '-1', '노출여부(전체)')
    , new COMMON_CODE('0', '0', '비노출')
    , new COMMON_CODE('1', '1', '노출')
];

var inssaticon_category = [
    new COMMON_CODE(null, 'category', '카테고리')
    , new COMMON_CODE('all', '-1', '카테고리(전체)')
];

/** =------ boardAdm ---------- */

var fanBoard_status = [
  new COMMON_CODE(null, 'status', '게시글 상태')
    , new COMMON_CODE('1', 1, '정상')
    , new COMMON_CODE('2', 2, '삭제')
];

var event_giftcon_type = [
    new COMMON_CODE(null, 'gifticon_type', '품목')
    , new COMMON_CODE('all', '-1', '품목구분')
    , new COMMON_CODE('1', 1, '커피')
    , new COMMON_CODE('2', 2, '치킨')
]

/** =------ crew ---------- */

var crew_searchType = [
    new COMMON_CODE(null, 'searchType', '검색구분')
    , new COMMON_CODE('memno', '1', '회원번호')
    , new COMMON_CODE('memid', '2', 'UserID')
    , new COMMON_CODE('memnick', '3', '닉네임')
];