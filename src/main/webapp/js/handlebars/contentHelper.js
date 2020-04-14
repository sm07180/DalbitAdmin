Handlebars.registerHelper("openTr", function (index, rowCnt, options) {
    var idx = index + 1;
    return (idx % rowCnt == 1) ? options.fn(this) : options.inverse(this);
});

Handlebars.registerHelper("closeTr", function (index, rowCnt, isLast, options) {
    var idx = index + 1;
    return (idx % rowCnt == 0) || isLast ? options.fn(this) : options.inverse(this);
});