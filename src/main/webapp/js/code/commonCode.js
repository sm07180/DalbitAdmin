class COMMON_CODE{
    constructor(type, value, code){
        this.type = type;
        this.value = value;
        this.code = code;
    }
};

var meminfo = [
    new COMMON_CODE(null, 'meminfo', '사용자정보구분')
    , new COMMON_CODE('all', '', '전체')
    , new COMMON_CODE('memid', '2', 'UserID')
    , new COMMON_CODE('memnick', '3', 'User닉네임')
    , new COMMON_CODE('memphone', '4', '연락처')
    , new COMMON_CODE('memname', '5', '이름')
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

var gender = [
    new COMMON_CODE(null, 'gender', '성별구분')
    , new COMMON_CODE('all', '1', '전체')
    , new COMMON_CODE('man', '2', '남자')
    , new COMMON_CODE('female', '3', '여자')
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


var timeHour = getTimeHour();

function getTimeHour() {

    var timeHour = [new COMMON_CODE(null, 'timeHour', '시')];

    for (var i = 0; i < 24; i++) {
        var value = fillzero(i, 2);
        timeHour.push(new COMMON_CODE(value, value, value));
    }

    return timeHour;
}

var timeMinute = getTimeMinute();

function getTimeMinute() {

    var timeMinute = [new COMMON_CODE(null, 'timeMinute', '분')];

    for(var i=0; i<60; i++){
        var value = fillzero(i, 2);
        timeMinute.push(new COMMON_CODE(value, value, value));
    }

    return timeMinute;
}
