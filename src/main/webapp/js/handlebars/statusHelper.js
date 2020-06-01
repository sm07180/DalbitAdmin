Handlebars.registerHelper("vatMinus", function(lvalue) {
    if(lvalue == 0){
        return 0;
    }
    return common.addComma(lvalue - (lvalue * 0.1));
});

Handlebars.registerHelper("payRate", function(lvalue,rvalue) {
    if(rvalue == 0){
        return 0;
    }
    var tmp = (lvalue * 100)/rvalue;
    return common.addComma(tmp.toFixed(1));
});

Handlebars.registerHelper("average", function(lvalue,rvalue) {
    if(rvalue == 0 || common.isEmpty(rvalue)){
        return 0;
    }
    var tmp = rvalue/lvalue;
    return tmp.toFixed(1);
});