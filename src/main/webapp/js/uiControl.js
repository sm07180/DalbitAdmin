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

/*인포렉스 메뉴를 클릭 했을 시*/
ui.loadInforexAdminPage = function(menu){

    //iframe 세팅
    var html = '<iframe src="'+$(menu).data('url')+'" style="\n';
        html += 'width: 100%;';
        html += 'height: '+$("#left-sidebar").height()+'px;';
        html += 'border: 0px;">';
        html += '</iframe>';

    $('#page-wrapper').empty().append(html);

    //이전 메뉴 비활성화/ 클릭한 메뉴 활성화 처리
    $('ul.sub-menu li.active, .main-menu li.page.active').removeClass('active');
    $(menu).parent().addClass('active');
}

ui.topScroll = function(){
    //window.scrollTo(0,0);
    $('html').animate({scrollTop : 0}, 100);
}

ui.checkBoxInit = function(tableId){

    $("#"+tableId+"-select-all").remove();

    $(document).on('click', '#'+tableId+' .dt-body-center input[type="checkbox"]', function() {
        if($(this).prop('checked')){
            $('#'+tableId+' .dt-body-center input[type="checkbox"]').removeAttr('checked');
            $(this).prop('checked', 'checked');
        }
    });
}

