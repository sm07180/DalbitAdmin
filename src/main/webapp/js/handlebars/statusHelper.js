Handlebars.registerHelper("vatMinus", function(lvalue) {
    return common.addComma(lvalue - (lvalue * 0.1));
});

Handlebars.registerHelper("payRate", function(lvalue,rvalue) {
    var tmp = (lvalue * 100)/rvalue;
    return common.addComma(tmp.toFixed(1));
});
