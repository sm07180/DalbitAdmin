var ui = {};

/*검색결과 영역이 접혀 있을 시 열기*/
ui.toggleSearchList = function(){
    var toggleIcon = $('#_searchToggleIcon');
    if (toggleIcon.hasClass('fa-chevron-down')) {
        toggleIcon.click();
    }
}

/*검색결과에 따라 선택삭제 or excel 버튼 컨트롤*/
ui.toogleSearchListFooter = function(searchCnt){
    var target = $("#_searchToggleIcon").closest('.widget').find('.widget-footer');
    0 < searchCnt ? target.show() : target.hide();
}



