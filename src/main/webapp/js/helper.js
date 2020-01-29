
/**
 * Number Add Comma
 * 숫자 콤마 추가
 */
Handlebars.registerHelper("addComma", function (value) {
    var regExp = /\B(?=(\d{3})+(?!\d))/g

    return value.toString().replace(regExp, ",");
})


/**
 * Number Remove Comma
 * 숫자 콤마 제거
 */
Handlebars.registerHelper("removeComma", function (value) {
    var regExp = /,/gi;

    return value.toString().replace(regExp, "");
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
    if(isEmpty(date)){
        //ToDo 날짜 Default 설정 필요
        return "-";
    }
    if(isEmpty(format)){
        format = "YYYY.MM.DD";
    }
    return moment(date).format(format);
})



Handlebars.registerHelper("dateToNumber", function (value) {
    var regExp = /\d/gi;

    return value.toString().replace(regExp, "");
})