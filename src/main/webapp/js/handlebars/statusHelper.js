Handlebars.registerHelper("vatMinus", function(lvalue) {
    return common.vatMinus(lvalue);
});

Handlebars.registerHelper("payRate", function(lvalue,rvalue) {
    return common.payRate(lvalue, rvalue);
});

Handlebars.registerHelper("average", function(lvalue,rvalue, point) {
    return common.average(lvalue, rvalue, point);
});

Handlebars.registerHelper("division", function(lvalue,rvalue,dot) {
    return common.division(lvalue, rvalue, dot);
});

Handlebars.registerHelper("renderSlct", function(type,size) {
    return util.renderSlct(type,size);
});