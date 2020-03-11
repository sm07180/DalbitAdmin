/*이벤트 바인딩*/
$(document).on('click', '._openPop', function(){
    windowOpen($(this).data());
});

/*회원정보보기 팝업*/
$(document).on('click', '._openMemberPop', function(){
    var url = "/member/member/popup/memberPopup?memNo="+$(this).data('memno');
    windowOpen(url, 1500, 800, 'memberInfo');
});

/*방송정보보기 팝업*/
$(document).on('click', '._openBroadcastPop', function(){
    var url = "/broadcast/broadcast/popup/broadcastPopup?roomNo="+$(this).data('roomno')+"&state="+$(this).data('state');
    windowOpen(url, 1500, 800, 'broadcastInfo');
});

/* 새창 띄우기 */
function windowOpen(data, width, height, name){
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
            if (errorFunc != null){
                errorFunc(data, textStatus, jqXHR);
            }else{
                commonAjaxError(data, textStatus, jqXHR);
            }
        } catch (e) {
            // function call fail skip
            alert(e);
            //showAlert('A', e);
        }
    });
}

function commonAjaxError(data, textStatus, jqXHR){
    try{
        if(0 < data.responseText.indexOf('로그인')){
            alert('세션이 만료되어 로그인 페이지로 이동합니다.');
            location.href = '/login';
        }
    }catch (e) {

    }
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
    //btn.button('loading');

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
                // btn.button('reset');
            }, 500)
        },
        failCallback: function (responseHtml, url) {
            dalbitLog(responseHtml)
            dalbitLog(url)
            setTimeout(function () {
                // btn.button('reset');
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

/* 이미지 팝업 */
function imagePopup(obj){
    var url = obj.src;
    var title = obj.id;
    var option = "width=" + (obj.width + 20) + ", height=" + (obj.height + 20) + ",fullscreen=yes";

    window.open(url, title, option);
}

function memNoLink(display, memNo){
    var template = '<a href="javascript://" class="_openMemberPop" data-memNo="' + memNo + '">'+ display +'</a>';
    return template;
}

function roomNoLink(display, roomNo, state){
    var template = '<a href="javascript://" class="_openBroadcastPop" data-roomNo="' + roomNo + '" data-state="' + state + '">'+ display +'</a>';
    return template;
}

function getCommonCodeSelect(code, targetCode, isExcludeAllYn){
    targetCode = eval(targetCode);
    if(!isEmpty(targetCode)){

        var header = targetCode[0];
        var html = '<select id="' + header.value + '" name="' + header.value + '" class="form-control searchType">';
        targetCode.forEach(function(value){
            if(!isEmpty(value.type)){

                if(isExcludeAllYn == 'Y' && value.type == 'all'){
                    return;
                }

                html += '<option value="'+ value.value +'" '+ (value.value == code ? 'selected="selected"' : '')+'>'+ value.code +'</option>';
            }
        });
        html += '</select>'
        return html;
    }
}

function getCommonCodeRadio(code, targetCode, isExcludeAllYn){
    targetCode = eval(targetCode);
    if(!isEmpty(targetCode)){

        var header = targetCode[0];
        var html = '';
        var radioId = header.value;
        targetCode.forEach(function(value){
            if(!isEmpty(value.type)){

                if(isExcludeAllYn == 'Y' && value.type == 'all'){
                    return;
                }
                html += '<label class="control-inline fancy-radio custom-color-green">';
                html += '<input type="radio" value="'+ value.value +'" id="'+radioId + value.value +'" name="'+radioId+'" class="form-control" '+ (value.value == code ? 'checked="checked"' : '')+'/>';
                html += '<span><i></i>'+ value.code +'</span>'
                html += '</label>';
            }
        });
        return html;
    }
}

function getCommonCodeLabel(code, targetCode){
    targetCode = eval(targetCode);
    if(!isEmpty(targetCode)){
        var html = "";
        targetCode.forEach(function(value){
            if(!isEmpty(value.type)) {
                if (code == value.value) {
                    html = '<lable>' + value.code + '</lable>';
                }
            }
        });
        return html;
    }
}

function editorInit(){
    var targetEditor = $('.summernote');

    targetEditor.summernote({
        height: 300,
        focus: true,
        // onpaste: function() {
        //     alert('You have pasted something to the editor');
        // },
        callbacks: { // 콜백을 사용
            // 이미지를 업로드할 경우 이벤트를 발생
            onImageUpload: function(files, editor, welEditable) {
                console.log("[onImageUpload]")

                var formData = new FormData();
                formData.append("file",files[0]);
                //TODO  업로드 타입은 상황에 맞게 수정 부탁드립니다.
                formData.append("uploadType","bg");
                fileUpdate(IMAGE_SERVER_URL + "/upload",formData, function (data) {
                    var json = jQuery.parseJSON(data);
                    console.log(json);
                    if(json.code != "0"){
                        alert(json.message);
                        return;
                    }

                    // UPLOAD IMAGE URL 적용
                    var imgURL = json.data.url;
                    targetEditor.summernote('editor.insertImage', imgURL);
                });
            }
        }
    });
}