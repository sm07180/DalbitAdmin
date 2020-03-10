class COMMON_CODE{
    constructor(type, value, code){
        this.type = type;
        this.value = value;
        this.code = code;
    }
};


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
    , new COMMON_CODE('off', '2', 'OFF')
];

var onlyOnOff = [
    new COMMON_CODE(null, 'onlyOnOff', '게시구분')
    , new COMMON_CODE('on', '1', 'ON')
    , new COMMON_CODE('off', '0', 'OFF')
];