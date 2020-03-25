class INFOREX_MENU{
    constructor(depth, name, url){
        this.depth = depth;
        this.name = name;
        this.url = url;
    }
};

class COMMON_CODE{
    constructor(type, value, code){
        this.type = type;
        this.value = value;
        this.code = code;
    }
};

var searchType = [
    new COMMON_CODE(null, 'searchType', '사용자정보구분')
    , new COMMON_CODE('all', '-1', '전체')
    , new COMMON_CODE('memno', '1', '회원번호')
    , new COMMON_CODE('memname', '2', '이름')      //휴대폰 인증 적용후
    , new COMMON_CODE('memid', '3', 'UserID')
    , new COMMON_CODE('memnick', '4', '닉네임')
    , new COMMON_CODE('memphone', '5', '연락처')
];

var search_platform = [
    new COMMON_CODE(null, 'platform', '플랫폼구분')
    , new COMMON_CODE('all', '', '전체')
    , new COMMON_CODE('pc', '2', 'PC')
    , new COMMON_CODE('android', '3', 'Android')
    , new COMMON_CODE('ios', '4', 'IOS')
    , new COMMON_CODE('mobile', '5', 'Web-Mobile')
];

var platform = [
    new COMMON_CODE(null, 'platform', '플랫폼구분')
    , new COMMON_CODE('all', '1', '전체')
    , new COMMON_CODE('pc', '2', 'PC')
    , new COMMON_CODE('android', '3', 'Android')
    , new COMMON_CODE('ios', '4', 'IOS')
    , new COMMON_CODE('mobile', '5', 'Web-Mobile')
];

var platformGroup = [
    new COMMON_CODE(null, 'platformGroup', '플랫폼그룹구분')
    , new COMMON_CODE('all', '1', '전체')
    , new COMMON_CODE('pc', '2', 'PC')
    , new COMMON_CODE('mobile', '3', 'Mobile')
    , new COMMON_CODE('pc-mobile', '4', 'PC/Mobile')
];

var progressStatus = [
    new COMMON_CODE(null, 'progressStatus', '진행여부')
    , new COMMON_CODE('all', '1', '전체')
    , new COMMON_CODE('wait', '2', '대기중')
    , new COMMON_CODE('proceeding', '3', '진행중')
    , new COMMON_CODE('end', '4', '마감')
];

var gender = [
    new COMMON_CODE(null, 'gender', '성별구분')
    , new COMMON_CODE('all', '1', '전체')
    , new COMMON_CODE('man', '2', '남자')
    , new COMMON_CODE('female', '3', '여자')
    , new COMMON_CODE('unknown', '4', '알수없음')
];

var viewOn = [
    new COMMON_CODE(null, 'viewOn', '게시구분')
    , new COMMON_CODE('all', '-1', '전체')
    , new COMMON_CODE('on', '1', 'ON')
    , new COMMON_CODE('off', '0', 'OFF')
];

var viewType = [
    new COMMON_CODE(null, 'viewType', '링크표시구분')
    , new COMMON_CODE('new', '1', '새 창 열기')
    , new COMMON_CODE('link', '2', '링크이동')
];
var level = [
    new COMMON_CODE(null, 'level', '레벨')
    ,new COMMON_CODE('0', '0', '0레벨')
    ,new COMMON_CODE('1', '1', '1레벨')
    ,new COMMON_CODE('2', '2', '2레벨')
    ,new COMMON_CODE('3', '3', '3레벨')
    ,new COMMON_CODE('4', '4', '4레벨')
    ,new COMMON_CODE('5', '5', '5레벨')
    ,new COMMON_CODE('6', '6', '6레벨')
    ,new COMMON_CODE('7', '7', '7레벨')
    ,new COMMON_CODE('8', '8', '8레벨')
    ,new COMMON_CODE('9', '9', '9레벨')
];
var grade = [
    new COMMON_CODE(null, 'grade', '단계')
    ,new COMMON_CODE('0',  '0 단계','0 단계')
    ,new COMMON_CODE('6',  '1 단계','1 단계')
    ,new COMMON_CODE('11', '2 단계','2 단계')
    ,new COMMON_CODE('15', '3 단계','3 단계')
];

var browser = [
    new COMMON_CODE(null, 'browser', 'Browser ')
    ,new COMMON_CODE('all',  '-1','전체')
    ,new COMMON_CODE('c',  '0','chrome')
    ,new COMMON_CODE('i', '1','Internet Explorer')
    ,new COMMON_CODE('f', '2','Firefox')
];

var question_type = [
    new COMMON_CODE(null, 'question_type', '문의유형')
    ,new COMMON_CODE('all','-1','전체')
    ,new COMMON_CODE('meminfo','0','회원정보')
    ,new COMMON_CODE('broad','1','방송하기')
    ,new COMMON_CODE('listen','2','청취하기')
    ,new COMMON_CODE('pay','3','결제')
    ,new COMMON_CODE('suggestion','4','건의하기')
    ,new COMMON_CODE('error','5','장애/버그')
    ,new COMMON_CODE('gift','6','선물/아이템')
    ,new COMMON_CODE('etc','7','기타')
];

var timeHour = getTimeHour();

function getTimeHour() {

    var timeHour = [new COMMON_CODE(null, 'timeHour', '시')];

    for (var i = 0; i < 24; i++) {
        var value = common.fillzero(i, 2);
        timeHour.push(new COMMON_CODE(value, value, value));
    }

    return timeHour;
}

var timeMinute = getTimeMinute();

function getTimeMinute() {

    var timeMinute = [new COMMON_CODE(null, 'timeMinute', '분')];

    for(var i=0; i<60; i++){
        var value = common.fillzero(i, 2);
        timeMinute.push(new COMMON_CODE(value, value, value));
    }

    return timeMinute;
}
