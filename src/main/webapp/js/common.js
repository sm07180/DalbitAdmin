/*이벤트 바인딩*/
$(document).on('click', '._openPop', function(){
    windowOpen($(this).data());
});

/* 새창 띄우기 */
function windowOpen(data, width, height, name){
    console.log(data, width, height, name);
    var url = '';
    if(typeof(data) == 'object') {
        url = data.url;
        width = data.width;
        height = data.height;
        name = data.name;
    } else {
        url = data;
    }
    name = name || 'popup';

    var left = (screen.width/2)-(width/2);
    var top = (screen.height/2)-(height/2);

    window.open(url, name, 'width=' + width + ' height=' + height + ' scrollbars=yes left=' + left + 'top=' + top );
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
            alert(e);
            //showAlert('A', e);
        }
    });
}

/*파일 업로드 호출 모듈*/
function fileUpdate(dst_url, dst_params, successFunc, errorFunc){
    $.ajax({
        type: "POST",
        enctype: 'multipart/form-data',
        url: dst_url,
        data: dst_params,
        processData: false,
        contentType: false,
        cache: false,
        timeout: 600000,
    }).done(function(data) {
        if (successFunc != null) successFunc(data);
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


/* 이미지 팝업 */
function imagePopup(obj){
    var url = obj.src;
    var title = obj.id;
    var option = "width=" + (obj.width + 20) + ", height=" + (obj.height + 20) + ",fullscreen=yes";

    window.open(url, title, option);
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
        format = "YYYY.MM.DD HH:MM:SS";
    }
    return moment(date).format(format);
}