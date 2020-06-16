/**
 * 공통 자바스크립트 유틸
 */
var memberUtil = {};

memberUtil.convertEditHistory = function(text){

    if(common.isEmpty(text)){
        return '';
    }

    var result = text;
    var textArr = text.split(' ');
    textArr.forEach(function(txt){
        var imageUrl = memberUtil.profileImageAppender(txt);
        result = common.replace(text, txt, imageUrl)
    })

    return result;
}

memberUtil.profileImageAppender = function(text){
    var lowerText = text.toLowerCase();
    var returnText = text;
    if(-1 < lowerText.indexOf('/profile')){
        returnText = PHOTO_SERVER_URL + text;
        var image = '<img src="'+returnText+'" class="thumbnail fullSize_background" style="width:68px;height:68px;" />'
        return image;
    }
    return text;
}