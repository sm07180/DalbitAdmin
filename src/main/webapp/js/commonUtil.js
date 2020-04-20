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
        if (successFunc != null){
            dalbitLog("[ajax 통신 결과]url : " + dst_url);
            dalbitLog(data);
            successFunc(dst_id, data, dst_params);
        }
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

util.getCommonCodeHorizontalCheck = function(code, targetCode, isExcludeAllYn, name) {
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
                html += '</label>';
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

util.getCommonCodeLabelAndHidden = function(code, targetCode, name) {
    targetCode = eval(targetCode);
    if (!common.isEmpty(targetCode)) {
        var html = "";
        var header = targetCode[0];
        var checkName = common.isEmpty(name) ? header.value : name;
        targetCode.forEach(function (value) {
            if (!common.isEmpty(value.type)) {
                if (code == value.value) {
                    html = '<lable>' + value.code + '</lable>';
                    html += '<input type="hidden" id="' + checkName + value.value + '" name="' + checkName + '" value="' + value.value + '"/>';
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
            return '<i class="fa fa-phone" style="color: #8556F6;' + "font-size: " + size + 'px"></i>';
        }else if (value == "f"){
            return '<i class="fa fa-facebook-square" style="color: #0064ff;' + "font-size: " + size + 'px"></i>';
        }else if (value == "g"){
            return '<i class="fa fa-google" style="color: #ff0004;' + "font-size: " + size + 'px"></i>';
        }else if (value == "k"){        // 아이콘 추가 해야됨
            return '<img src="../../img/icon/kakao.png" style="width: ' + size +'px;height:' + size +'px">';
        }else if (value == "n"){        // 아이콘 추가 해야됨
            return '<img src="../../img/icon/naver.png" style="width: ' + size +'px;height:' + size +'px">';
        }
    }else{
        if(value == "p"){
            return '<i class="fa fa-phone" style="color: #8556F6;"></i>';
        }else if (value == "f"){
            return '<i class="fa fa-facebook-square" style="color: #0064ff;"></i>';
        }else if (value == "g"){
            return '<i class="fa fa-google" style="color: #ff0004;"></i>';
        }else if (value == "k"){        // 아이콘 추가 해야됨
            return '<img src="../../img/icon/kakao.png">';
        }else if (value == "n"){        // 아이콘 추가 해야됨
            return '<img src="../../img/icon/naver.png">';
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
        html+=              '<div class="modal-header no-padding">'
        html+=                  '<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>'
        html+=              '</div>'
        html+=              '<div class="modal-body no-padding">'
        html+=                  '<img id="image_full_size" src="'+ url + '" alt="your image" style="max-width: 1000px;max-height: 1000px;">'
        html+=              '</div>'
        html+=          '</div>'
        html+=      '</div>'
        html+= '</div>'
    return html;
}

util.renderPagingNavigation = function(targetId, pagingInfo){

    if(0 < pagingInfo.totalCnt) {
        var totalPage;
        var startPage;
        var endPage;

        if(pagingInfo.totalCnt < pagingInfo.pageCnt){
            totalPage = 1;
        }else if(pagingInfo.totalCnt % pagingInfo.pageCnt == 0){
            totalPage = Math.floor(pagingInfo.totalCnt / pagingInfo.pageCnt);
        }else{
            totalPage = Math.floor(pagingInfo.totalCnt / pagingInfo.pageCnt) + 1;
        }

        if(totalPage <= 10){
            startPage = 1;
            endPage = totalPage;
        }else{
            startPage = Math.floor((pagingInfo.pageNo-1) / 10) * 10 + 1;
            endPage = startPage + 10 - 1;
            if(totalPage < endPage){
                endPage = totalPage;
            }
        }

        var pagingPrefix = '<ul class="pagination borderless handlebarsPaging">';
        pagingPrefix += '<li class="paginate_button first '+ (pagingInfo.pageNo == 1 ? 'disabled' : '')+'" aria-controls="list_info" tabindex="0" id="list_info_first" data-index="1"><a href="#">처음</a></li>';
        pagingPrefix += '<li class="paginate_button previous '+ (pagingInfo.pageNo == 1 ? 'disabled' : '')+'" aria-controls="list_info" tabindex="0" id="list_info_previous"><a href="#">이전</a></li>';

        var pagingContent = '';
        for (var i = startPage; i <= endPage; i++) {
            pagingContent += '<li class="paginate_button ' + (i == pagingInfo.pageNo ? 'active' : '') +'" aria-controls="list_info" tabindex="0" data-index="'+i+'"><a href="javascript://">' + i + '</a></li>';
        }

        var isEndPage = Math.floor(pagingInfo.totalCnt/pagingInfo.pageCnt) + (pagingInfo.totalCnt % pagingInfo.pageCnt == 0 ? 0 : 1);
        var pagingSurfix = '<li class="paginate_button next '+ (endPage <= 1 || isEndPage == pagingInfo.pageNo ? 'disabled' : '') +'" aria-controls="list_info" tabindex="0" id="list_info_next"><a href="#">다음</a></li>';
        pagingSurfix += '<li class="paginate_button last '+ (endPage <= 1 || isEndPage == pagingInfo.pageNo ? 'disabled' : '') +'" aria-controls="list_info" tabindex="0" id="list_info_last" data-index="'+ isEndPage +'"><a href="#">마지막</a></li>';
        pagingSurfix += '</ul>';

        var paging = pagingPrefix + pagingContent + pagingSurfix;

        $("#" + targetId).html(paging);
    }


    $("#"+targetId).find('.handlebarsPaging li.paginate_button').on('click', function(){

        var currentPage = Number($('#list_info_paginate').find('.handlebarsPaging li.paginate_button.active').data('index'));

        var me = $(this);
        if(me.hasClass('previous')) {
            pagingInfo.pageNo = currentPage - 1;
        }else if(me.hasClass('next')){
            pagingInfo.pageNo = currentPage + 1;
        }else{
            pagingInfo.pageNo = $(this).data('index');
        }

        //한 페이지에 여러개의 페이징이 있을 경우 구분하기위해 targetId를 같이 보낸다.
        handlebarsPaging(targetId, pagingInfo);
    });
}