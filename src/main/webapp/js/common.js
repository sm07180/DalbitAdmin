/* Null 체크 */
function isEmpty(value){
    if(typeof value === 'function'){
        return false;
    }
    return (value == null || value.length === 0);
}

/* 문자열이 빈 문자열인지 체크하여 기본 문자열로 리턴한다. */
function nvl(str, defaultStr){
    return !str ? defaultStr : str;
}


/* Date Type 체크 */
function isDate(value){
    var date = new Date(value);
    return !isEmpty(date);
}

/* Date to Number 변환 ex.) 2019-05-13 ==> 20190513 */
function dateToNumber(date){
    if(isEmpty(date)){
        dalbitLog("[dateToNumber] 데이터가 Null 입니다. (" + date + ")" )
        return "-";
    }

    if(isDate(date)){
        dalbitLog("[dateToNumber] Date 형식이 아닙니다. (" + date + ")" )
        return "-";
    }

    var regExp = /\d/gi;
    return date.toString().replace(regExp, "");
}



function getMaxDay(year, month){
    var date = new Date(year, month, 0);

    if(isEmpty(date)) return 0;

    return date.getDate();
}

function addComma(value){
    var regExp = /\B(?=(\d{3})+(?!\d))/g

    return value.toString().replace(regExp, ",");
}

function removeComma(value){
    var regExp = /,/gi;

    return value.toString().replace(regExp, "");
}

function convertToDate(date, format){
    if(isEmpty(date)){
        return "-";
    }
    if(isEmpty(format)){
        format = "YYYY.MM.DD HH:MM";
    }
    return moment(date).format(format);
}

function getAge(birthYear){
    return Number(moment().format("YYYY")) + 1 - Number(birthYear);
}

function convertSort(value){
    return isEmpty(value) ? null : (value === 'asc') ? 0 : 1;
}

function getValue(value){
    return typeof(value) == 'function' ? value() : value;
}


function replace(value, from, to){
    var string = getValue(value);
    var from = getValue(from);
    var to = getValue(to);

    return string.replace(new RegExp(from, 'gi'), to);
}

function formatDate(date, stringFormat){
    var format = getValue(stringFormat);
    format = (format.length) ? format : 'YYYY.MM.DD';
    return moment(getValue(date)).format(format);
}

function replaceHtml(text){
    if(!isEmpty(text)){
        console.log(text);
        text = replace(text, "&lt;", "<");
        text = replace(text, "&gt;", ">");
        return text;
    }
}

function equals(val1, val2, opt) {
    if (arguments.length < 3)
        throw new Error("equal은 2개의 인자가 필요합니다.");

    var v1 = util.getValue(val1);
    var v2 = util.getValue(val2);

    return (v1 != v2) ? opt.inverse(this) : opt.fn(this);
}