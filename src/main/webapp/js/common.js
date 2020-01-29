/*로그 찍기*/
function dalbitLog(data){
    //todo - local, dev에서만 작동하도록 설정
    console.log(data);
}

/*ajax 호출 모듈*/
function getAjaxData(dst_id, dst_url, dst_params, successFunc, errorFunc){
    $.ajax({
        type : 'POST',
        url : dst_url,
        dataType : 'json',
        data : dst_params,
        async: true,
    }).done(function(data) {
        if (successFunc != null) successFunc(dst_id, data);
    }).fail(function(data, textStatus, jqXHR) {
        try {
            if (errorFunc != null) errorFunc(data, textStatus, jqXHR);
        } catch (e) {
            // function call fail skip
            //alert(e);
            showAlert('A', e);
        }
    });
}

/* Null 체크 */
function isEmpty(value){
    return !value ? true : false;
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
