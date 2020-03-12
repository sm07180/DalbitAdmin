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

var timeHour = [
    new COMMON_CODE(null, 'timeHour', '시')
    , new COMMON_CODE('00', '00', '00')
    , new COMMON_CODE('01', '01', '01')
    , new COMMON_CODE('02', '02', '02')
    , new COMMON_CODE('03', '03', '03')
    , new COMMON_CODE('04', '04', '04')
    , new COMMON_CODE('05', '05', '05')
    , new COMMON_CODE('06', '06', '06')
    , new COMMON_CODE('07', '07', '07')
    , new COMMON_CODE('08', '08', '08')
    , new COMMON_CODE('09', '09', '09')
    , new COMMON_CODE('10', '10', '10')
    , new COMMON_CODE('11', '11', '11')
    , new COMMON_CODE('12', '12', '12')
    , new COMMON_CODE('13', '13', '13')
    , new COMMON_CODE('14', '14', '14')
    , new COMMON_CODE('15', '15', '15')
    , new COMMON_CODE('16', '16', '16')
    , new COMMON_CODE('17', '17', '17')
    , new COMMON_CODE('18', '18', '18')
    , new COMMON_CODE('19', '19', '19')
    , new COMMON_CODE('20', '20', '20')
    , new COMMON_CODE('21', '21', '21')
    , new COMMON_CODE('22', '22', '22')
    , new COMMON_CODE('23', '23', '23')
];

var timeMinute = [
    new COMMON_CODE(null, 'timeMinute', '분')
    , new COMMON_CODE('00', '00', '00')
    , new COMMON_CODE('01', '01', '01')
    , new COMMON_CODE('02', '02', '02')
    , new COMMON_CODE('03', '03', '03')
    , new COMMON_CODE('04', '04', '04')
    , new COMMON_CODE('05', '05', '05')
    , new COMMON_CODE('06', '06', '06')
    , new COMMON_CODE('07', '07', '07')
    , new COMMON_CODE('08', '08', '08')
    , new COMMON_CODE('09', '09', '09')
    , new COMMON_CODE('10', '10', '10')
    , new COMMON_CODE('11', '11', '11')
    , new COMMON_CODE('12', '12', '12')
    , new COMMON_CODE('13', '13', '13')
    , new COMMON_CODE('14', '14', '14')
    , new COMMON_CODE('15', '15', '15')
    , new COMMON_CODE('16', '16', '16')
    , new COMMON_CODE('17', '17', '17')
    , new COMMON_CODE('18', '18', '18')
    , new COMMON_CODE('19', '19', '19')
    , new COMMON_CODE('20', '20', '20')
    , new COMMON_CODE('21', '21', '21')
    , new COMMON_CODE('22', '22', '22')
    , new COMMON_CODE('23', '23', '23')
    , new COMMON_CODE('24', '24', '24')
    , new COMMON_CODE('25', '25', '25')
    , new COMMON_CODE('26', '26', '26')
    , new COMMON_CODE('27', '27', '27')
    , new COMMON_CODE('28', '28', '28')
    , new COMMON_CODE('29', '29', '29')
    , new COMMON_CODE('30', '30', '30')
    , new COMMON_CODE('31', '31', '31')
    , new COMMON_CODE('32', '32', '32')
    , new COMMON_CODE('33', '33', '33')
    , new COMMON_CODE('34', '34', '34')
    , new COMMON_CODE('35', '35', '35')
    , new COMMON_CODE('36', '36', '36')
    , new COMMON_CODE('37', '37', '37')
    , new COMMON_CODE('38', '38', '38')
    , new COMMON_CODE('39', '39', '39')
    , new COMMON_CODE('40', '40', '40')
    , new COMMON_CODE('41', '41', '41')
    , new COMMON_CODE('42', '42', '42')
    , new COMMON_CODE('43', '43', '43')
    , new COMMON_CODE('44', '44', '44')
    , new COMMON_CODE('45', '45', '45')
    , new COMMON_CODE('46', '46', '46')
    , new COMMON_CODE('47', '47', '47')
    , new COMMON_CODE('48', '48', '48')
    , new COMMON_CODE('49', '49', '49')
    , new COMMON_CODE('50', '50', '50')
    , new COMMON_CODE('51', '51', '51')
    , new COMMON_CODE('52', '52', '52')
    , new COMMON_CODE('53', '53', '53')
    , new COMMON_CODE('54', '54', '54')
    , new COMMON_CODE('55', '55', '55')
    , new COMMON_CODE('56', '56', '56')
    , new COMMON_CODE('57', '57', '57')
    , new COMMON_CODE('58', '58', '58')
    , new COMMON_CODE('59', '59', '59')
];