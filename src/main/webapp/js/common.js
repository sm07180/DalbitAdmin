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

