Handlebars.registerHelper("confirmName", function (confirm) {

    if(common.isEmpty(confirm)){
        return confirm;
    }else if(confirm == 0){
        return '미승인'
    }else if(confirm == 1){
        return '승인완료'
    }else if(confirm == 2){
        return '승인거부'
    }
});

Handlebars.registerHelper("stateName", function (state) {

    if(common.isEmpty(state)){
        return state;
    }else if(state == 0){
        return '미처리'
    }else if(state == 1){
        return '완료'
    }else if(state == 2){
        return '불가'
    }
    
});