
/**
 * Number Add Comma
 * 숫자 콤마 추가
 */
Handlebars.registerHelper("addComma", function (value) {
    return common.addComma(value);
})


/**
 * Number Remove Comma
 * 숫자 콤마 제거
 */
Handlebars.registerHelper("removeComma", function (value) {
    return common.removeComma(value);
})


/**
 * Number Convert To Date
 * 숫자를 날짜로 변환
 *
 *  # Format
 *   ex.) YYYY-MM-DD HH:mm:ss:SSS
 *
 */
Handlebars.registerHelper("convertToDate", function (date, format) {
    if(common.isEmpty(date)){
        //ToDo 날짜 Default 설정 필요
        return "-";
    }
    if(common.isEmpty(format)){
        format = "YYYY.MM.DD";
    }
    return moment(date).format(format);
})


/**
 * Date 구분자 제거
 *
 */
Handlebars.registerHelper("dateToNumber", function (value) {
    var regExp = /\d/gi;

    return value.toString().replace(regExp, "");
})


/**
 * if
 *
 * ex.)
 * {{#dalbit_if value1 "==" "test1"}}
 *      true code      {{! value1 == "test1" }}
 * {{else}}
 *      false code      {{! value1 != "test1" }}
 * {{/dalbit_if}}
 *
 */
Handlebars.registerHelper("dalbit_if", function(v1, operator, v2, options){
    switch (operator) {
        case '==':
            return (v1 == v2) ? options.fn(this) : options.inverse(this);
        case '===':
            return (v1 === v2) ? options.fn(this) : options.inverse(this);
        case '!=':
            return (v1 != v2) ? options.fn(this) : options.inverse(this);
        case '!==':
            return (v1 !== v2) ? options.fn(this) : options.inverse(this);
        case '<':
            return (v1 < v2) ? options.fn(this) : options.inverse(this);
        case '<=':
            return (v1 <= v2) ? options.fn(this) : options.inverse(this);
        case '>':
            return (v1 > v2) ? options.fn(this) : options.inverse(this);
        case '>=':
            return (v1 >= v2) ? options.fn(this) : options.inverse(this);
        default:
            return options.inverse(this);
    }
})


/**
 *  테이블 목록 index
 */
Handlebars.registerHelper("index", function(index, no)
{
    return common.isEmpty(index) ? no : parseInt(index) + 1;
});

Handlebars.registerHelper("getCommonCodeSelect", function(value, targetCode, isExcludeAllYn)
{
    return util.getCommonCodeSelect(value, targetCode, isExcludeAllYn);
});

Handlebars.registerHelper("getCommonCodeRadio", function(value, targetCode, isExcludeAllYn, name)
{
    return util.getCommonCodeRadio(value, targetCode, isExcludeAllYn, name);
});

Handlebars.registerHelper("getCommonCodeCheck", function(value, targetCode, isExcludeAllYn, name)
{
    return util.getCommonCodeCheck(value, targetCode, isExcludeAllYn, name);
});

Handlebars.registerHelper("getCommonCodeLabel", function(value, targetCode)
{
    return util.getCommonCodeLabel(value, targetCode);
});

Handlebars.registerHelper("replaceHtml", function(value)
{
    return common.replaceHtml(value);
});

Handlebars.registerHelper("equal", function (value, value2, opt){
    return common.equal(value, value2, opt);
});

Handlebars.registerHelper("getOnOffSwitch", function(value){
   return util.getOnOffSwitch(value);
});

Handlebars.registerHelper("renderImage", function(value){
    return IMAGE_SERVER_URL + value;
});

Handlebars.registerHelper("timeStamp", function(value) {
   return common.timeStamp(value);
});

Handlebars.registerHelper("replaceEnter", function(value) {
   return common.replaceEnter(value);
});

Handlebars.registerHelper("viewImage", function(value) {
    return common.viewImage(value);
});

Handlebars.registerHelper("isEmptyData", function() {
    return common.isEmptyData();
});