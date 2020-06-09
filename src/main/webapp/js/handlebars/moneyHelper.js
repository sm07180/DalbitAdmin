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

Handlebars.registerHelper("convertJumin", function (value) {

    if(common.isEmpty(value)) {
        return '-';
    }
    var regExp = /(\d{6})(\d{7})/
    return value.toString().replace(regExp, '$1-$2');

});

Handlebars.registerHelper("workdayCheck", function (limitDay, regDate, opt) {

    if(limitDay == ''){
        return opt.fn(this);
    }
    return moment(regDate).format('YYYYMMDD') < limitDay ? opt.fn(this) : opt.inverse(this);
});

Handlebars.registerHelper("specialBenefit", function (star, isSpecial) {

    if(common.isEmpty(isSpecial) || isSpecial == 0){
        return 0;
    }

    var benefit = star * 60 * 0.05;
    console.log(benefit);

    return common.addComma(benefit);
});

Handlebars.registerHelper("exchangeAmt", function (star, isSpecial) {

    var cashBasic = Number(star * 60);
    var specialBenefit = 0;

    if(!common.isEmpty(isSpecial) && isSpecial != 0){
        specialBenefit = Number(star * 60 * 0.05);
    }

    var sum = Number(cashBasic + specialBenefit);
    console.log("sum");
    console.log(sum);

    var incomeTax = Number(Math.floor(sum * 0.003)) * 10;
    console.log("incomeTax");
    console.log(incomeTax);

    var residentTax = Number(Math.floor(incomeTax * 0.001)) * 10;
    console.log("residentTax");
    console.log(residentTax);

    var total = Number(sum - incomeTax - residentTax);
    console.log("total");
    console.log(total);


    return common.addComma(total);
});