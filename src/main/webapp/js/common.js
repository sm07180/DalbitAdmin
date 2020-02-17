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
            alert(e);
            //showAlert('A', e);
        }
    });
}

/* Excell DownLoad 모듈*/
function excelDownload(btn, url, data, successFunc, errorFunc){
    btn.button('loading');

    var sendData = data;
    if(data instanceof FormData){
        sendData = {};
        data.forEach(function(value, key){
            sendData[key] = value;
        });
    }

    $.fileDownload(url,{
        httpMethod: "POST",
        data:sendData,
        successCallback: function (url) {
            dalbitLog(url);
            setTimeout(function () {
                btn.button('reset');
            }, 500)
        },
        failCallback: function (responseHtml, url) {
            dalbitLog(responseHtml)
            dalbitLog(url)
            setTimeout(function () {
                btn.button('reset');
            }, 500)
        }
    })
    .done(function(){
        if (successFunc != null) successFunc();
    })
    .fail(function(){
        if (errorFunc != null) errorFunc();
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
