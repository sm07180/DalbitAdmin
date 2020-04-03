/**
 * 공통 자바스크립트 유틸
 */
var util = {};

/* 새창 띄우기 */
util.windowOpen = function(data, width, height, name){
    var url = '';
    if (typeof (data) == 'object') {
        url = data.url;
        width = data.width;
        height = data.height;
        name = data.name;
    } else {
        url = data;
    }
    name = name || 'popup';

    var left = (screen.width / 2) - (width / 2);
    var top = (screen.height / 2) - (height / 2);

    window.open(url, name, 'width=' + width + ' height=' + height + ' scrollbars=yes left=' + left + 'top=' + top);
}
// /*ajax 호출 모듈*/
// getAjaxData(dst_id, dst_url, dst_params, successFunc, errorFunc) {
//     var common = this;
//     $.ajax({
//         type: 'POST',
//         url: dst_url,
//         dataType: 'json',
//         data: dst_params,
//         async: true,
//     }).done(function (data) {
//         if (successFunc != null) successFunc(dst_id, data);
//     }).fail(function (data, textStatus, jqXHR) {
//         try {
//             if (errorFunc != null) {
//                 errorFunc(data, textStatus, jqXHR);
//             } else {
//                 common.commonAjaxError(data, textStatus, jqXHR);
//             }
//         } catch (e) {
//             // function call fail skip
//             alert(e);
//             //showAlert('A', e);
//         }
//     });
// },

    /*ajax 호출 모듈*/
util.getAjaxData = function(dst_id, dst_url, dst_params, successFunc, errorFunc, option) {
    var commonUtil = this;
    var isEmptyOption = common.isEmpty(option)

    $.ajax({
        beforeSend : function(xhr){

        },
        header: {

        },
        type: isEmptyOption ? 'POST' : common.isEmpty(option.type) ? 'POST' : option.type,
        url: dst_url,
        dataType: isEmptyOption ? 'json' : common.isEmpty(option.dataType) ? 'json' : option.dataType,
        data: dst_params,
        async: true,
        xhrFields: {
            withCredentials: true
        },
        crossDomain: true
    }).done(function (data) {
        if (successFunc != null) successFunc(dst_id, data, dst_params);
    }).fail(function (data, textStatus, jqXHR) {
        try {
            if (errorFunc != null) {
                errorFunc(data, textStatus, jqXHR);
            } else {
                commonUtil.commonAjaxError(data, textStatus, jqXHR);
            }
        } catch (e) {
            // function call fail skip
            alert(e);
            //showAlert('A', e);
        }
    });
}

util.commonAjaxError = function(data, textStatus, jqXHR) {
    try {
        console.log(data);
        if (0 < data.responseText.indexOf('로그인')) {
            //alert('세션이 만료되어 로그인 페이지로 이동합니다.');
            //location.href = '/login';
        }
    } catch (e) {

    }
}

/*파일 업로드 호출 모듈*/
util.fileUpdate = function(dst_url, dst_params, successFunc, errorFunc) {
    $.ajax({
        type: "POST",
        enctype: 'multipart/form-data',
        url: dst_url,
        data: dst_params,
        processData: false,
        contentType: false,
        cache: false,
        timeout: 600000,
    }).done(function (data) {
        if (successFunc != null) successFunc(data);
    }).fail(function (data, textStatus, jqXHR) {
        try {
            if (errorFunc != null) errorFunc(data, textStatus, jqXHR);
        } catch (e) {
            // function call fail skip
            alert(e);
            //showAlert('A', e);
        }
    });
},

util.changeLoadingBtn = function(btn, status, text) {
    var text = common.isEmpty(text) ? "Loading..." : text;

    if (status == 'loading' || status == 'start') {
        btn.data('afterText', btn.html());
        btn.empty().append('<i class="fa fa-refresh fa-spin"></i> ' + text);
        btn.prop('disabled', true);
    }

    if (status == 'reset' || status == 'stop') {
        btn.empty().append(btn.data('afterText'));
        btn.prop('disabled', false);
    }
},

/* Excell DownLoad 모듈*/
util.excelDownload = function(btn, url, data, successFunc, errorFunc) {
    // btn.button('loading');
    util.changeLoadingBtn(btn, 'loading', 'DownLoading...');
    //btn.button('loading');

    var sendData = data;
    if (data instanceof FormData) {
        sendData = {};
        data.forEach(function (value, key) {
            sendData[key] = value;
        });
    }

    $.fileDownload(url, {
        httpMethod: "POST",
        data: sendData,
        successCallback: function (url) {
            dalbitLog(url);
            setTimeout(function () {
                // btn.button('reset');
                util.changeLoadingBtn(btn, 'reset');
            }, 500)
        },
        failCallback: function (responseHtml, url) {
            dalbitLog(responseHtml)
            dalbitLog(url)
            setTimeout(function () {
                // btn.button('reset');
                util.changeLoadingBtn(btn, 'reset');
            }, 500)
        }
    })
        .done(function () {
            if (successFunc != null) successFunc();
        })
        .fail(function () {
            if (errorFunc != null) errorFunc();
        });
},

/* 이미지 팝업 */
util.imagePopup = function(obj) {
    var url = obj.src;
    var title = obj.id;
    var option = "width=" + (obj.width + 20) + ", height=" + (obj.height + 20) + ",fullscreen=yes";

    window.open(url, title, option);
},

util.memNoLink = function(display, memNo) {
    var template = '<a href="javascript://" class="_openMemberPop" data-memNo="' + memNo + '">' + display + '</a>';
    return template;
},

util.roomNoLink = function(display, roomNo) {
    var template = '<a href="javascript://" class="_openBroadcastPop" data-roomNo="' + roomNo + '">' + display + '</a>';
    return template;
},

util.getCommonCodeSelect = function(code, targetCode, isExcludeAllYn, name) {
    targetCode = eval(targetCode);
    if (!common.isEmpty(targetCode)) {

        var header = targetCode[0];
        var selectName = common.isEmpty(name) ? header.value : name;
        var html = '<select id="' + selectName + '" name="' + selectName + '" class="form-control searchType">';
        targetCode.forEach(function (value) {
            if (!common.isEmpty(value.type)) {

                if (isExcludeAllYn == 'Y' && value.type == 'all') {
                    return;
                }

                html += '<option value="' + value.value + '" ' + (value.value == code ? 'selected="selected"' : '') + '>' + value.code + '</option>';
            }
        });
        html += '</select>'
        return html;
    }
},

util.getCommonCodeRadio = function(code, targetCode, isExcludeAllYn, name) {
    targetCode = eval(targetCode);
    if (!common.isEmpty(targetCode)) {

        var header = targetCode[0];
        var html = '';
        var radioName = common.isEmpty(name) ? header.value : name;
        targetCode.forEach(function (value) {
            if (!common.isEmpty(value.type)) {

                if (isExcludeAllYn == 'Y' && value.type == 'all') {
                    return;
                }
                html += '<label class="control-inline fancy-radio custom-color-green">';
                html += '<input type="radio" value="' + value.value + '" id="' + radioName + value.value + '" name="' + radioName + '" class="form-control" ' + (value.value == code ? 'checked="checked"' : '') + '/>';
                html += '<span><i></i>' + value.code + '</span>'
                html += '</label>';
            }
        });
        return html;
    }
},

util.getCommonCodeCheck = function(code, targetCode, isExcludeAllYn, name) {
    targetCode = eval(targetCode);
    if (!common.isEmpty(targetCode)) {

        var header = targetCode[0];
        var html = '';
        var checkName = common.isEmpty(name) ? header.value : name;
        targetCode.forEach(function (value) {
            if (!common.isEmpty(value.type)) {

                if (isExcludeAllYn == 'Y' && value.type == 'all') {
                    return;
                }
                html += '<label class="control-inline fancy-checkbox custom-color-green">';
                html += '<input type="checkbox" value="' + value.code + '" id="' + checkName + value.value + '" name="' + checkName + '" class="form-control" ' + (value.value == code ? 'checked="checked"' : '') + '/>';
                html += '<span><i></i>' + value.code + '</span>'
                html += '</label><br/>';
            }
        });
        return html;
    }
},

util.getOnOffSwitch = function(data) {
    var html = '<div class="onoffswitch">';
    html += '<input type="checkbox" name="viewOn" id="detail_viewOn" class="onoffswitch-checkbox" ' + (data == 1 ? 'checked="checked"': '') +'>';
    html += '<label class="onoffswitch-label" for="detail_viewOn">';
    html += '<span class="onoffswitch-inner"></span>';
    html += '<span class="onoffswitch-switch"></span>';
    html += '</label>';
    html += '</div>';

    return html;
},

util.getCommonCodeLabel = function(code, targetCode) {
    targetCode = eval(targetCode);
    if (!common.isEmpty(targetCode)) {
        var html = "";
        targetCode.forEach(function (value) {
            if (!common.isEmpty(value.type)) {
                if (code == value.value) {
                    html = '<lable>' + value.code + '</lable>';
                }
            }
        });
        return html;
    }
},

util.renderOnOff = function(value){
    if(value == 1){
        return ' <i class="fa fa-circle"></i>' + " ON" ;
    }else{
        return ' <i class="fa fa-circle-o"></i>' + " OFF" ;
    }
},

util.renderSlct = function(value,size){
    if(size != "undefined"){
        if(value == "p"){
            return '<i class="fa fa-phone" style="color: #8556F6;' + "font-size: " + size + 'px"></i>'
        }else if (value == "f"){
            return '<i class="fa fa-facebook-square" style="color: #0064ff;' + "font-size: " + size + 'px"></i>'
        }else if (value == "g"){
            return '<i class="fa fa-google" style="color: #ff0004;' + "font-size: " + size + 'px"></i>'
        }else if (value == "k"){        // 아이콘 추가 해야됨
            return '<i class="fa fa-facebook-square" style="color: #fdff00;' + "font-size: " + size + 'px"></i>'
        }else if (value == "n"){        // 아이콘 추가 해야됨
            return '<i class="fa fa-facebook-square" style="color: #00ff37;' + "font-size: " + size + 'px"></i>'
        }
    }else{
        if(value == "p"){
            return '<i class="fa fa-phone" style="color: #8556F6;"></i>'
        }else if (value == "f"){
            return '<i class="fa fa-facebook-square" style="color: #0064ff;"></i>'
        }else if (value == "g"){
            return '<i class="fa fa-google" style="color: #ff0004;"></i>'
        }else if (value == "k"){        // 아이콘 추가 해야됨
            return '<i class="fa fa-facebook-square" style="color: #fdff00;"></i>'
        }else if (value == "n"){        // 아이콘 추가 해야됨
            return '<i class="fa fa-facebook-square" style="color: #00ff37;"></i>'
        }
    }
},

/*에디터 type:이미지 타입*/
util.editorInit = function(type) {
    var targetEditor = $('._editor');

    targetEditor.summernote({
        lang: 'ko-KR',
        height: '300px',
        focus: false,
        callbacks: { // 콜백을 사용
            // 이미지를 업로드할 경우 이벤트를 발생
            onImageUpload: function (files, editor, welEditable) {
                console.log("[onImageUpload]")

                var formData = new FormData();
                formData.append("file", files[0]);
                formData.append("uploadType", type);    //ex) type : notice-detail
                util.fileUpdate(IMAGE_SERVER_URL + "/upload", formData, function (data) {
                    var json = jQuery.parseJSON(data);
                    console.log(json);
                    if (json.code != "0") {
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
},
util.imageFullSize = function(modalId ,url){
    var html = '<div class="modal fade" id="'+ modalId +'" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">'
        html+=      '<div class="modal-dialog" style="max-width: 100%; width: auto; display: table;">'
        html+=          '<div class="modal-content">'
        html+=              '<div class="modal-header">'
        html+=                  '<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>'
        html+=              '</div>'
        html+=              '<div class="modal-body">'
        html+=                  '<img id="image_full_size" src="'+ url + '" alt="your image" style="max-width: 1000px;max-height: 1000px;">'
        html+=              '</div>'
        html+=              '<div class="modal-footer">'
        html+=              '</div>'
        html+=          '</div>'
        html+=      '</div>'
        html+= '</div>'
    return html;
}
