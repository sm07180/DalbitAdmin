/**
 * 공통 자바스크립트 유틸
 */
var memberUtil = {};

memberUtil.convertEditHistory = function(text){

    if(common.isEmpty(text)){
        return '';
    }

    var result = '';
    var textArr = text.split(' ');
    textArr.forEach(function(txt){
        if(-1 < txt.indexOf('/profile_') || -1 < txt.indexOf('/bg_')) {
            result += ' ' + common.replace(txt, txt, memberUtil.profileImageAppender(txt));
        }else{
            if(txt != null){
                result += ' ' + txt;
            }
        }
    })

    return result;
}

memberUtil.profileImageAppender = function(text){
    var returnText = PHOTO_SERVER_URL + text;
    var image = '<img src="'+returnText+'" class="thumbnail fullSize_background" style="width:68px;height:68px;" />'
    return image;
}