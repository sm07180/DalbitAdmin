Handlebars.registerHelper("relationName", function (value) {

    var relationName = '';
    testId_relation.forEach(function(relation){
        if(Number(relation.value) == value){
            relationName = relation.code;
        }
    });
    return relationName;
});

Handlebars.registerHelper("stateName", function (value) {

    var relationName = '';
    declaration_slctType.forEach(function(relation){
        if(Number(relation.value) == value){
            relationName = relation.code;
        }
    });
    return relationName;
});