/**
 * 공통 자바스크립트 유틸
 */
var statUtil = {};

statUtil.getCurrentDate = function(format){
    if(common.isEmpty(format)){
        format = "YYYY.MM.DD"
    }
    var dateTime = new Date();
    return moment(dateTime).format(format);
}

statUtil.getStatTimeDate = function(value, codes, slctType, isPrev){

    var code = new Object();
    $.each(codes, function(index, getCode) {
        if(getCode.slctType == slctType){
            code = getCode;
        }
    });

    var addDate = isPrev ? - code.addValue : code.addValue;
    return moment(value).add(code.dateType, addDate).format(code.format);
}