var PAGING_INFO = function(totalCnt, pageNo, pageCnt){
    this.totalCnt = common.isEmpty(totalCnt) ? 0 : totalCnt;
    this.pageNo = common.isEmpty(pageNo) ? 1 : pageNo;
    this.pageCnt = common.isEmpty(pageCnt) ? 10 : pageCnt;
};

var INFOREX_MENU = function(id, depth, name, url){
    this.id = id;
    this.depth = depth;
    this.name = name;
    this.url = url;
};

var COMMON_CODE = function(type, value, code){
    this.type = type;
    this.value = value;
    this.code = code;
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
    , new COMMON_CODE('PC', 'PC', 'PC')
    , new COMMON_CODE('Android', 'Android', 'Android')
    , new COMMON_CODE('IOS', 'IOS', 'IOS')
    , new COMMON_CODE('Web-Mobile', 'Web-Mobile', 'Web-Mobile')
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

var os_type = [
    new COMMON_CODE(null, 'os_type', 'OS타입')
    , new COMMON_CODE('1', '1', 'Android')
    , new COMMON_CODE('2', '2', 'IOS')
    , new COMMON_CODE('3', '3', 'PC')
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
    // , new COMMON_CODE('unknown', '-1', '알수없음')
];

var memSex = [
    new COMMON_CODE(null, 'memSex', '성별구분')
    , new COMMON_CODE('man', 'm', '남자')
    , new COMMON_CODE('female', 'f', '여자')
    , new COMMON_CODE('unknown', 'n', '알수없음')
];

var viewOn = [
    new COMMON_CODE(null, 'viewOn', '게시구분')
    , new COMMON_CODE('all', '-1', '전체')
    , new COMMON_CODE('on', '1', 'ON')
    , new COMMON_CODE('off', '0', 'OFF')
];

var viewType = [
    new COMMON_CODE(null, 'viewType', '링크표시구분')
    , new COMMON_CODE('link', '0', '링크이동')
    , new COMMON_CODE('new', '1', '새 창 열기')
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
    ,new COMMON_CODE('10', '10', '10레벨')
    ,new COMMON_CODE('11', '11', '11레벨')
    ,new COMMON_CODE('12', '12', '12레벨')
    ,new COMMON_CODE('13', '13', '13레벨')
    ,new COMMON_CODE('14', '14', '14레벨')
    ,new COMMON_CODE('15', '15', '15레벨')
    ,new COMMON_CODE('16', '16', '16레벨')
    ,new COMMON_CODE('17', '17', '17레벨')
    ,new COMMON_CODE('18', '18', '18레벨')
    ,new COMMON_CODE('19', '19', '19레벨')
    ,new COMMON_CODE('20', '20', '20레벨')
    ,new COMMON_CODE('21', '21', '21레벨')
    ,new COMMON_CODE('22', '22', '22레벨')
    ,new COMMON_CODE('23', '23', '23레벨')
    ,new COMMON_CODE('24', '24', '24레벨')
    ,new COMMON_CODE('25', '25', '25레벨')
    ,new COMMON_CODE('26', '26', '26레벨')
    ,new COMMON_CODE('27', '27', '27레벨')
    ,new COMMON_CODE('28', '28', '28레벨')
    ,new COMMON_CODE('29', '29', '29레벨')
    ,new COMMON_CODE('30', '30', '30레벨')
    ,new COMMON_CODE('31', '31', '31레벨')
    ,new COMMON_CODE('32', '32', '32레벨')
    ,new COMMON_CODE('33', '33', '33레벨')
    ,new COMMON_CODE('34', '34', '34레벨')
    ,new COMMON_CODE('35', '35', '35레벨')
    ,new COMMON_CODE('36', '36', '36레벨')
    ,new COMMON_CODE('37', '37', '37레벨')
    ,new COMMON_CODE('38', '38', '38레벨')
    ,new COMMON_CODE('39', '39', '39레벨')
    ,new COMMON_CODE('40', '40', '40레벨')
    ,new COMMON_CODE('41', '41', '41레벨')
    ,new COMMON_CODE('42', '42', '42레벨')
    ,new COMMON_CODE('43', '43', '43레벨')
    ,new COMMON_CODE('44', '44', '44레벨')
    ,new COMMON_CODE('45', '45', '45레벨')
    ,new COMMON_CODE('46', '46', '46레벨')
    ,new COMMON_CODE('47', '47', '47레벨')
    ,new COMMON_CODE('48', '48', '48레벨')
    ,new COMMON_CODE('49', '49', '49레벨')
    ,new COMMON_CODE('50', '50', '50레벨')
];

var grade = [
    new COMMON_CODE(null, 'grade', '단계')
    ,new COMMON_CODE('0','0','0')
    ,new COMMON_CODE('2','씨앗','씨앗')
    ,new COMMON_CODE('4','새싹','새싹')
    ,new COMMON_CODE('6','풀','풀')
    ,new COMMON_CODE('8','줄기','줄기')
    ,new COMMON_CODE('10','당근','당근')
    ,new COMMON_CODE('12','나무당근','나무당근')
    ,new COMMON_CODE('14','쇠당근','쇠당근')
    ,new COMMON_CODE('16','동당근','동당근')
    ,new COMMON_CODE('18','은당근','은당근')
    ,new COMMON_CODE('20','황금당근','황금당근')
    ,new COMMON_CODE('22','나무메달','나무메달')
    ,new COMMON_CODE('24','쇠메달','쇠메달')
    ,new COMMON_CODE('26','동메달','동메달')
    ,new COMMON_CODE('28','은메달','은메달')
    ,new COMMON_CODE('30','황금데달','황금데달')
    ,new COMMON_CODE('32','나무트로피','나무트로피')
    ,new COMMON_CODE('34','쇠트로피','쇠트로피')
    ,new COMMON_CODE('36','동트로피','동트로피')
    ,new COMMON_CODE('38','은트로피','은트로피')
    ,new COMMON_CODE('40','황금트로피','황금트로피')
    ,new COMMON_CODE('42','나무왕관','나무왕관')
    ,new COMMON_CODE('44','쇠왕관','쇠왕관')
    ,new COMMON_CODE('46','동왕관','동왕관')
    ,new COMMON_CODE('48','은왕관','은왕관')
    ,new COMMON_CODE('50','황금왕관','황금왕관')
];

var browser = [
    new COMMON_CODE(null, 'browser', 'Browser ')
    ,new COMMON_CODE('all',  '-1','전체')
    ,new COMMON_CODE('c',  '0','chrome')
    ,new COMMON_CODE('i', '1','Internet Explorer')
    ,new COMMON_CODE('f', '2','Firefox')
];

var search_browser = [
    new COMMON_CODE(null, 'browser', 'Browser ')
    ,new COMMON_CODE('all',  '','전체')
    ,new COMMON_CODE('c',  'chrome','chrome')
    ,new COMMON_CODE('i', 'Internet Explorer','Internet Explorer')
    ,new COMMON_CODE('f', 'Firefox','Firefox')
];

var question_type = [
    new COMMON_CODE(null, 'question_type', '문의유형')
    ,new COMMON_CODE('all','-1','전체')
    ,new COMMON_CODE('meminfo','1','회원정보')
    ,new COMMON_CODE('broad','2','방송하기')
    ,new COMMON_CODE('listen','3','청취하기')
    ,new COMMON_CODE('pay','4','결제')
    ,new COMMON_CODE('suggestion','5','건의하기')
    ,new COMMON_CODE('error','6','장애/버그')
    ,new COMMON_CODE('gift','7','선물/아이템')
    ,new COMMON_CODE('etc','99','기타')
];

var broadcastSubjectType = [
    new COMMON_CODE(null, 'subject_type', '방송주제')
    , new COMMON_CODE('all', '', '전체')
    , new COMMON_CODE('all', '00', '일상/챗')
    , new COMMON_CODE('memno', '01', '노래/연주')
    , new COMMON_CODE('memname', '02', '고민/사연')
    , new COMMON_CODE('memid', '03', '책/힐링')
    , new COMMON_CODE('memnick', '04', '연애/오락')
    , new COMMON_CODE('memphone', '05', 'ASMR')
    , new COMMON_CODE('memphone', '06', '노래방')
    , new COMMON_CODE('memphone', '07', '성우')
    , new COMMON_CODE('memphone', '08', '스터디')
    , new COMMON_CODE('memphone', '09', '공포')
    , new COMMON_CODE('memphone', '10', '먹방/요리')
    , new COMMON_CODE('11', '11', '건강/스포츠')
    , new COMMON_CODE('memphone', '99', '기타')
]

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

