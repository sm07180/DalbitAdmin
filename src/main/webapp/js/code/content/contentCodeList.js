var notice_searchType = [
    new COMMON_CODE(null, 'searchType', '검색구분')
    , new COMMON_CODE('all', '-1', '전체')
    , new COMMON_CODE('title', '1', '제목')
    , new COMMON_CODE('content', '2', '내용')
    , new COMMON_CODE('opName', '3', '작성자')
];

var notice_slctType = [
    new COMMON_CODE(null, 'slctType', '공지구분')
    , new COMMON_CODE('all', '-1', '전체')
    , new COMMON_CODE('notice', '1', '공지')
    , new COMMON_CODE('event', '2', '이벤트')
    , new COMMON_CODE('check', '3', '정기점검')
    , new COMMON_CODE('update', '4', '업데이트')
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

var push_osType = [
    new COMMON_CODE(null, 'osType', '노출 OS구분')
    , new COMMON_CODE('all', '-1', '전체')
    , new COMMON_CODE('pc', '1', 'PC')
    , new COMMON_CODE('android', '2', 'Android')
    , new COMMON_CODE('ios', '3', 'IOS')
];

var push_messageType = [
    new COMMON_CODE(null, 'messageType', '메세지 구분')
    , new COMMON_CODE('notice', '1', '일반공지')
    , new COMMON_CODE('notice', '2', '긴급공지')
    , new COMMON_CODE('event', '3', '이벤트')
    , new COMMON_CODE('check', '4', '정기점검')
    , new COMMON_CODE('update', '5', '업데이트')
    , new COMMON_CODE('etc', '6', '기타')
];

var push_sendType = [
    new COMMON_CODE(null, 'sendType', '발송 구분')
    , new COMMON_CODE('instant', '0', '즉시발송')
    , new COMMON_CODE('reservation', '1', '예약발송')
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
    , new COMMON_CODE('gnb', '1', 'GNB')
    , new COMMON_CODE('expand', '2', '펼침')
    , new COMMON_CODE('popup', '3', '팝업')
    , new COMMON_CODE('notice', '4', '공지사항')
    , new COMMON_CODE('etc', '5', '???(추후추가)')
];

var banner_bannerType_noAll = [
    new COMMON_CODE(null, 'bannerType', '배너구분')
    , new COMMON_CODE('gnb', '1', 'GNB')
    , new COMMON_CODE('expand', '2', '펼침')
    , new COMMON_CODE('popup', '3', '팝업')
    , new COMMON_CODE('mypage', '3', 'MyPage')
];

var banner_loginType = [
    new COMMON_CODE(null, 'loginType', '로그인구분')
    , new COMMON_CODE('all', '-1', '전체')
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
    , new COMMON_CODE('itemName', '1', '상품명')
    , new COMMON_CODE('code', '2', '코드')
];

var item_discount = [
    new COMMON_CODE(null, 'discount', '할인율')
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
    , new COMMON_CODE('etc', '-1', '기타 <input id="inputDiscountEtc" style="width:40px;"/>%')
];

var item_itemType = [
    new COMMON_CODE(null, 'itemType', '아이템 타입')
    , new COMMON_CODE('new', '1', '신규')
    , new COMMON_CODE('best', '2', '인기')
    , new COMMON_CODE('limit', '3', '한정')
];


/** =------ Util ---------- */

var content_viewOn = [
    new COMMON_CODE(null, 'viewOn', '게시구분')
    , new COMMON_CODE('on', '1', 'ON')
    , new COMMON_CODE('off', '2', 'OFF')
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
    , new COMMON_CODE('all', '', '전체')
    , new COMMON_CODE('pc', '1', 'PC/Android')
    , new COMMON_CODE('ios', '2', 'IOS')
];