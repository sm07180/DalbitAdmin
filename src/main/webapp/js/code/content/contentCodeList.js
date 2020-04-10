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
    , new COMMON_CODE('update', '4', '기타')
];


/** =------ PushMessage ---------- */
var push_searchType = [
    new COMMON_CODE(null, 'searchType', '검색구분')
    , new COMMON_CODE('all', '-1', '전체')
    , new COMMON_CODE('title', '1', '메세지 제목')
    , new COMMON_CODE('content', '2', '메세지 내용')
];

var push_snedStatus = [
    new COMMON_CODE(null, 'snedStatus', '발송상태')
    , new COMMON_CODE('ready', '0', '발송대기')
    , new COMMON_CODE('error', '1', '발송실패')
    , new COMMON_CODE('send', '2', '발송완료')
];

var push_platform = [
    new COMMON_CODE(null, 'platform', '노출 OS구분')
    , new COMMON_CODE('all', '-1', '전체')
    , new COMMON_CODE('pc', '1', 'PC')
    , new COMMON_CODE('android', '2', 'Android')
    , new COMMON_CODE('ios', '3', 'IOS')
];

var push_messageType = [
    new COMMON_CODE(null, 'messageType', '메세지 구분')
    , new COMMON_CODE('notice', '7', '일반공지')
    , new COMMON_CODE('notice', '7', '긴급공지')
    , new COMMON_CODE('event', '7', '이벤트')
    , new COMMON_CODE('check', '7', '정기점검')
    , new COMMON_CODE('update', '7', '업데이트')
    , new COMMON_CODE('etc', '7', '기타')
];

var push_slctPush = [
    new COMMON_CODE(null, 'slctPush', '푸시타입')
    , new COMMON_CODE('mystar', '1', '마이스타')
    , new COMMON_CODE('receive', '2', '선물 받은 달')
    , new COMMON_CODE('fan', '3', '팬')
    , new COMMON_CODE('comment', '4', '댓글')
    , new COMMON_CODE('dalbit', '5', '달빛 라이브')
    , new COMMON_CODE('event', '6', '이벤트 및 마케팅 정보')
];

var push_sendType = [
    new COMMON_CODE(null, 'sendType', '발송 구분')
    , new COMMON_CODE('instant', '0', '즉시발송')
    , new COMMON_CODE('reservation', '1', '예약발송')
];

/** =------ Splash ---------- */
var splash_exposureType = [
    new COMMON_CODE(null, 'exposureType', '게시 기간')
    , new COMMON_CODE('immediately', '0', '즉시게시')
    , new COMMON_CODE('reservation', '1', '예약게시')
];


/** =------ Banner ---------- */
var banner_searchType = [
    new COMMON_CODE(null, 'searchType', '검색구분')
    , new COMMON_CODE('all', '-1', '전체')
    , new COMMON_CODE('title', '1', '메세지 제목')
    , new COMMON_CODE('content', '2', '메세지 내용')
];

var banner_bannerType = [
    new COMMON_CODE(null, 'bannerType', '배너구분')
    , new COMMON_CODE('all', '-1', '전체')
    , new COMMON_CODE('gnb', '0', 'GNB')
    , new COMMON_CODE('expand', '1', '펼침')
    , new COMMON_CODE('popup', '2', '팝업')
    , new COMMON_CODE('notice', '3', '고객센터')
    , new COMMON_CODE('notice', '4', '스토어')
    , new COMMON_CODE('etc', '99', '???(추후추가)')
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

/** =------ Event ---------- */
var event_searchType = [
    new COMMON_CODE(null, 'searchType', '검색구분')
    , new COMMON_CODE('all', '-1', '전체')
    , new COMMON_CODE('title', '1', '제목')
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
    , new COMMON_CODE('etc', '-1', '기타 <input id="inputDiscountEtc" style="width:40px;" onkeydown="common.inputFilterNumber(event)" maxlength="3">%')
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
    , new COMMON_CODE('all', '', '전체')
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