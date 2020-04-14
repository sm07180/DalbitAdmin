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
    }
    if(this.isEmpty(format)){
        format = "YYYY.MM.DD HH:mm";
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
            text = text.replace('\\', "'");
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
    var hours = Math.floor(time / 3600);
    var minutes = Math.floor((time - (hours * 3600)) /60);
    var seconds = time - (hours * 3600) - (minutes * 60);
    var time = hours  + ":" + minutes + ":" + seconds;
    return time ;
}

common.profileImage = function(IMAGE_SERVER_URL, path, gender){
    var image;
    if(common.isEmpty(path)){
        if (gender == "n") {
            image = IMAGE_SERVER_URL + "/profile_3/profile_" + gender + "_200327.png";
        } else {
            image = IMAGE_SERVER_URL + "/profile_3/profile_" + gender + "_200327.jpg";
        }
    }else{
        image = IMAGE_SERVER_URL + path;
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
    return IMAGE_SERVER_URL + path;
}

common.isEmptyData = function(){
    return COMMON_MESSAGE.isEmptyData;
}

common.isSmall = function(value, target, opt){
    console.log(value);
    console.log(target);
    return 0 < target - value ? opt.fn(this) : opt.inverse(this);;
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

