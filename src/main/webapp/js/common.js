/**
 * 공통 자바스크립트 함수
 */
common = {};

common.isEmpty = function(value){
    if(typeof value === 'function'){
        return false;
    }
    return (value == null || value.length === 0);
}

/* 문자열이 빈 문자열인지 체크하여 기본 문자열로 리턴한다. */
common.nvl = function(str, defaultStr){
    return !str ? defaultStr : str;
}


/* Date Type 체크 */
common.isDate = function(value){
    var date = new Date(value);
    return !this.isEmpty(date);
}

/* Date to Number 변환 ex.) 2019-05-13 ==> 20190513 */
common.dateToNumber = function(date){
    if(this.isEmpty(date)){
        dalbitLog("[dateToNumber] 데이터가 Null 입니다. (" + date + ")" )
        return "-";
    }

    if(this.isDate(date)){
        dalbitLog("[dateToNumber] Date 형식이 아닙니다. (" + date + ")" )
        return "-";
    }

    var regExp = /\d/gi;
    return date.toString().replace(regExp, "");
}

common.getMaxDay = function(year, month){
    var date = new Date(year, month, 0);

    if(this.isEmpty(date)) return 0;

    return date.getDate();
}

common.addComma = function(value){
    if(common.isEmpty(value)){
        return 0;
    }
    var regExp = /\B(?=(\d{3})+(?!\d))/g
    return value.toString().replace(regExp, ",");
}

common.removeComma = function(value){
    if(common.isEmpty(value)){
        return 0;
    }
    var regExp = /,/gi;
    return value.toString().replace(regExp, "");
}

common.convertToDate = function(date, format){
    if(this.isEmpty(date)){
        return "-";
    }else if(date.length == 14 || 0 < Number(date)){
        var regExp = /(\d{8})(\d{6})/;
        date = date.toString().replace(regExp, '$1 $2');
    }
    if(this.isEmpty(format)){
        format = "YYYY.MM.DD HH:mm:ss";
    }
    return moment(date).format(format);
}

common.getAge = function(birthYear){
    return Number(moment().format("YYYY")) + 1 - Number(birthYear);
}

common.convertSort = function(value){
    return this.isEmpty(value) ? null : (value === 'asc') ? 0 : 1;
}

common.getValue = function(value){
    return typeof(value) == 'function' ? value() : value;
}

common.replace = function(value, from, to){
    var string = this.getValue(value);
    var from = this.getValue(from);
    var to = this.getValue(to);

    return string.replace(new RegExp(from, 'gi'), to);
}

common.formatDate = function(date, stringFormat){
    var format = this.getValue(stringFormat);
    format = (format.length) ? format : 'YYYY.MM.DD';
    return moment(this.getValue(date)).format(format);
}

common.replaceHtml = function(text){
        if(!common.isEmpty(text)){
            text = text.replace(/\\n/g, '');
            text = this.replace(text, "&lt;", "<");
            text = this.replace(text, "&gt;", ">");
            text = this.replace(text, "&amp;", "&");
            return text;
        }
}

common.equal = function(val1, val2, opt) {
    if (arguments.length < 3)
        throw new Error("equal은 2개의 인자가 필요합니다.");

    var v1 = this.getValue(val1);
    var v2 = this.getValue(val2);

    return (v1 != v2) ? opt.inverse(this) : opt.fn(this);
}

common.fillzero = function(obj, len) {
    var objLen = obj.toString().length;

    while (objLen < len){
        obj = "0" + obj;
        objLen++;
    }

    return obj;
}

common.lpad = function(s, padLength, padString){
    s = String(s);
    while(s.length < padLength)
        s = padString + s;
    return s;
}

common.rpad = function(s, padLength, padString){
    s = String(s);
    while(s.length < padLength)
        s = s + padString;
    return s;
}

common.timeStamp = function(time){
    time = parseInt(time);
    var hours = common.lpad(Math.floor(time / 3600),2,"0");
    var minutes = common.lpad(Math.floor((time - (hours * 3600)) /60),2,"0");
    var seconds = common.lpad(time - (hours * 3600) - (minutes * 60),2,"0");
    var time = hours  + ":" + minutes + ":" + seconds;
    return time ;
}

common.profileImage = function(PHOTO_SERVER_URL, path, gender){
    var image;
    if(common.isEmpty(path)){
        if (gender == "n") {
            image = PHOTO_SERVER_URL + "/profile_3/profile_" + gender + "_200327.png";
        } else {
            image = PHOTO_SERVER_URL + "/profile_3/profile_" + gender + "_200327.jpg";
        }
    }else{
        image = PHOTO_SERVER_URL + path;
    }
    return image ;
}
common.replaceEnter = function(text){
    if(!common.isEmpty(text)){
        text = text.replace(/\\n/g, "<br/>")
        return text;
    }
}

common.viewImage = function(path){
    return PHOTO_SERVER_URL + path;
}

common.isEmptyData = function(){
    return COMMON_MESSAGE.isEmptyData;
}

common.isSmall = function(value, target, opt){
    return 0 < target - value ? opt.fn(this) : opt.inverse(this);
}

//input 숫자 입력만 가능
common.inputFilterNumber = function (event) {
    var code = event.which;

    //숫자
    if((48 <= code && code <= 57)){
        return;
    }

    //NUM keyPad
    if((96 <= code && code <= 105)){
        return;
    }

    // 특수키 9 : TAB, 36 : HOME, 35 : END, 37 : LEFT, 39 : RIGHT, 8 : BACKSPACE, 46 : DELETE
    if (code === 9 || code === 36 || code === 35 || code === 37 ||
        code === 39 || code === 8 || code === 46) {
        return;
    }

    event.preventDefault();
}

common.stringToDateTime = function (strDate) {
    if(this.isEmpty(strDate) || strDate.length < 8){
        return strDate;
    }

    if(strDate.length == 8){
        return new Date(strDate.substring(0,4), strDate.substring(4,6)-1, strDate.substring(6,8));
    }

    if(strDate.length == 12){
        return new Date(strDate.substring(0,4), strDate.substring(4,6)-1, strDate.substring(6,8), strDate.substring(8,10), strDate.substring(10,12));
    }

    if(strDate.length == 15){
        return new Date(strDate.substring(0,4), strDate.substring(4,6)-1, strDate.substring(6,8), strDate.substring(8,10), strDate.substring(10,12), strDate.substring(12,15));
    }

}

common.upAndDownClass = function(value){
    var result = '';
    if(0 < Number(value)){
        result = '_up';
    }else if(Number(value) < 0){
        result = '_down';
    }
    return result;
}

common.upAndDownIcon = function(value){
    var result = '';
    if(0 < Number(value)){
        result = 'fa-caret-up';
    }else if(Number(value) < 0){
        result = 'fa-caret-down';
    }
    return result;
}

common.phoneNumHyphen = function(value) {
    if(common.isEmpty(value)) {
        return '-';
    }
    var regExp = /(\d{3})(\d{3,4})(\d{4})/
    return value.toString().replace(regExp, '$1-$2-$3');
}

common.cardNo = function(value){
    if(common.isEmpty(value)){
        return '-';
    }
    var regExp = /([0-9*]{4})([0-9*]{4})([0-9*]{4})([0-9*]{4})/
    return value.toString().replace(regExp, '$1-$2-$3-$4');
}

common.fontColor = function(value, minValue, fontColor){
    minValue = common.isEmpty(minValue) ? 0 : minValue;
    fontColor = common.isEmpty(fontColor) ? 'black' : fontColor;

    if(common.isEmpty(value) || value <= minValue){
        return value;
    }
    return "<span style='color:"+fontColor+";font-weight: bold;'>" + value + "</span>";
};

common.scrollTop = function(){
    $(window).scroll(function () {
        if ($(this).scrollTop() > 50) {
            $('#back-to-top').fadeIn();
        } else {
            $('#back-to-top').fadeOut();
        }
    });
    // scroll body to 0px on click
    $('#back-to-top').click(function () {
        $('#back-to-top').tooltip('hide');
        $('body,html').animate({
            scrollTop: 0
        }, 400);
        return false;
    });

    $('#back-to-top').tooltip('show');
};

common.getMemStateName = function(state){
    if(common.isEmpty(state)){
        return state;
    }

    if(state == '1'){
        return '정상'
    }else if(state == '2'){
        return '경고'
    }else if(state == '3'){
        return '정지'
    }else if(state == '5'){
        return '영구정지'
    }
}

// array sum
common.getListSum = function(value){
    var sumResult=0;
    for(var i=0;i<value.length;i++){
        sumResult += value[i];
    }
    return sumResult;
};

common.average = function(lvalue, rvalue) {
    if (rvalue == 0 || common.isEmpty(rvalue)) {
        return 0;
    }
    if (lvalue == 0 || common.isEmpty(lvalue)) {
        return 0;
    }
    var tmp = (lvalue / rvalue) * 100;
    return tmp.toFixed(1);
};

common.sexIcon = function(sex){
    var sex_lowercase = sex.toLowerCase();
    if(sex_lowercase == 'm'){
        return '<label class="font-bold" style="color: blue"><i class="fa fa-male"></i> 남성</label>';
    }else if(sex_lowercase == 'f'){
        return '<label class="font-bold" style="color: red"><i class="fa fa-female"></i> 여성</label>';
    }else{
        return '알수없음';
    }
};

common.vatMinus = function(lvalue) {
    if(lvalue == 0){
        return 0;
    }
    return common.addComma(lvalue - (lvalue * 0.1));
};

common.payRate = function(lvalue,rvalue) {
    if (rvalue == 0) {
        return 0;
    }
    var tmp = (lvalue * 100) / rvalue;
    return common.addComma(tmp.toFixed(1));
};