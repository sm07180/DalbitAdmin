Handlebars.registerHelper("vatMinus", function(lvalue) {
    return common.vatMinus(lvalue);
});

Handlebars.registerHelper("payRate", function(lvalue,rvalue) {
    return common.payRate(lvalue, rvalue);
});

Handlebars.registerHelper("average", function(lvalue,rvalue) {
    return common.average(lvalue, rvalue);
});