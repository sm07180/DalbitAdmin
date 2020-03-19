/* Null 체크 */
var common = {
    isEmpty(value){
        if(typeof value === 'function'){
            return false;
        }
        return (value == null || value.length === 0);
    },

    /* 문자열이 빈 문자열인지 체크하여 기본 문자열로 리턴한다. */
    nvl(str, defaultStr){
        return !str ? defaultStr : str;
    },


    /* Date Type 체크 */
    isDate(value){
        var date = new Date(value);
        return !this.isEmpty(date);
    },

    /* Date to Number 변환 ex.) 2019-05-13 ==> 20190513 */
    dateToNumber(date){
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
    },

    getMaxDay(year, month){
        var date = new Date(year, month, 0);

        if(this.isEmpty(date)) return 0;

        return date.getDate();
    },

    addComma(value){
        var regExp = /\B(?=(\d{3})+(?!\d))/g

        return value.toString().replace(regExp, ",");
    },

    removeComma(value){
        var regExp = /,/gi;

        return value.toString().replace(regExp, "");
    },

    convertToDate(date, format){
        if(this.isEmpty(date)){
            return "-";
        }
        if(this.isEmpty(format)){
            format = "YYYY.MM.DD HH:MM";
        }
        return moment(date).format(format);
    },

    getAge(birthYear){
        return Number(moment().format("YYYY")) + 1 - Number(birthYear);
    },

    convertSort(value){
        return this.isEmpty(value) ? null : (value === 'asc') ? 0 : 1;
    },

    getValue(value){
        return typeof(value) == 'function' ? value() : value;
    },

    replace(value, from, to){
        var string = this.getValue(value);
        var from = this.getValue(from);
        var to = this.getValue(to);

        return string.replace(new RegExp(from, 'gi'), to);
    },

    formatDate(date, stringFormat){
        var format = this.getValue(stringFormat);
        format = (format.length) ? format : 'YYYY.MM.DD';
        return moment(this.getValue(date)).format(format);
    },

    replaceHtml(text){
            if(!common.isEmpty(text)){
                console.log(text);
                text = text.replace('\\', "'");
                text = this.replace(text, "&lt;", "<");
                text = this.replace(text, "&gt;", ">");
                text = this.replace(text, "&amp;", "&");
                return text;
            }
    },

    equal(val1, val2, opt) {
        if (arguments.length < 3)
            throw new Error("equal은 2개의 인자가 필요합니다.");

        var v1 = this.getValue(val1);
        var v2 = this.getValue(val2);

        return (v1 != v2) ? opt.inverse(this) : opt.fn(this);
    },

    fillzero(obj, len) {
        var objLen = obj.toString().length;

        while (objLen < len){
            obj = "0" + obj;
            objLen++;
        }

        return obj;
    },
}
