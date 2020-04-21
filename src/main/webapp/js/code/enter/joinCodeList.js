var DATE_SEARCH_TYPE = function(slctType, dateType, addValue, format){
    this.slctType = slctType;
    this.dateType = dateType;
    this.addValue = addValue;
    this.format = format;
};

var stat_searchType = [
    new DATE_SEARCH_TYPE('0', 'days', 1, 'YYYY.MM.DD')
    , new DATE_SEARCH_TYPE('1', 'months', 1, 'YYYY년 MM월')
    , new DATE_SEARCH_TYPE('2', 'years', 1, 'YYYY년')
]

/** =------ Declaration ---------- */
var join_slctType = [
    new COMMON_CODE(null, 'slctType', '검색 조건')
    , new COMMON_CODE('time', '0', '시간별')
    , new COMMON_CODE('day', '1', '일별')
    , new COMMON_CODE('month', '2', '월별')
];