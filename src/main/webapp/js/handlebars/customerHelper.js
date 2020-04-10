Handlebars.registerHelper("questionGroupName", function (value) {

    var questionGroupName = '';
    question_slctType.forEach(function(relation){
        if(Number(relation.value) == value){
            questionGroupName = relation.code;
        }
    });
    return questionGroupName;
});