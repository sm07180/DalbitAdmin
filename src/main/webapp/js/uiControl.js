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

    //left menu
    var marginLeft = 240;

    //iframe 세팅
    var html = '<iframe src="'+$(menu).data('url')+'" style="';
        html += 'width: ' + ($("#main-content-wrapper").width() - marginLeft) + 'px;';
        html += 'margin-left: ' + marginLeft + 'px;';
        html += 'height: ' + $("#left-sidebar").height() + 'px;';
        html += 'border: 0px;">';
        html += '</iframe>';

    //$('#page-wrapper').empty().append(html);
    $('#main-content-wrapper').empty().append(html);

    //이전 메뉴 비활성화/ 클릭한 메뉴 활성화 처리
    $('ul.sub-menu li.active, .main-menu li.page.active').removeClass('active');
    $(menu).parent().addClass('active');
}

ui.loadBaseAdminPage = function(menu){

    var url = $(menu).data('url');
    if(url == ''){
        return false;
    }

    if(!0 == url.indexOf("http")){
        url = ADMIN_SERVER_URL + $(menu).data('url');
    }

    //left menu
    var marginLeft = 210;

    //iframe 세팅
    var html = '<iframe src="'+$(menu).data('url')+'" onload="ui.iframeBodyAutoResize(this)" style="';
    html += 'width: ' + ($("#main-content-wrapper").width() - marginLeft) + 'px;';
    html += 'margin-left: ' + marginLeft + 'px;';
    html += 'height: ' + ($("#left-sidebar").height() - 40) + 'px;';
    html += 'border: 0px;" id="iframePageContent">';
    html += '</iframe>';

    //$('#page-wrapper').empty().append(html);
    $('#main-content-wrapper').empty().append(html);

    //이전 메뉴 비활성화/ 클릭한 메뉴 활성화 처리
    $('ul.sub-menu li.active, .main-menu li.page.active').removeClass('active');
    $(menu).parent().addClass('active');
}

ui.iframeBodyAutoResize = function(iframe){

    /*var iframeHeight=
    (iframe).contentWindow.document.body.scrollHeight;
    (iframe).height=iframeHeight+20;

    console.log(iframeHeight);*/
    //$('body').height(iframeHeight + 20);

    var the_height= document.getElementById('iframePageContent').contentWindow.document.body.scrollHeight + 1000;

    //change the height of the iframe
    document.getElementById('iframePageContent').height= the_height;

    //document.getElementById('the_iframe').scrolling = "no";
    document.getElementById('iframePageContent').style.overflow = "hidden";

    console.log('iframeBodyAutoResize');

}

ui.topScroll = function(){
    //window.scrollTo(0,0);
    $('html').animate({scrollTop : 0}, 100);
}

/* 원하는 element로 이동 */
ui.scrollIntoView = function(elementId) {
    document.getElementById(elementId).scrollIntoView();
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

ui.unCheck = function(tableId) {
    $('#' + tableId + ' .dt-body-center input[type="checkbox"]').prop('checked', false);
}

ui.leftActiveFocus = function(){
    /*var menu = $('ul.main-menu li.active ul.sub-menu li.active').parent();
    if(0 < menu.length){
        $('._leftFixed').scrollTop(menu.offset().top);
    }*/

}

ui.imageLayerView = function(){
    var yOffset = 30;
    var height = 0;
    $(document).on("mouseover",".thumbnail",function(e){ //마우스 오버

        if(common.isEmpty($(this).attr("src"))){
            return;
        }
        $("body").append("<p id='preview'><img id='previewImage'  src='"+ $(this).attr("src") +"' width='300px' /></p>" ); //이미지
        $("#previewImage").load(function () {
            height = $(this).height();
        });
        $("#preview")
            .css("top",(e.pageY - (height / 2)) + "px")
            .css("left",(e.pageX + yOffset) + "px")
            .fadeIn("fast");
    });
    $(document).on("mousemove",".thumbnail",function(e){ //마우스 이동
        $("#preview")
            .css("top",(e.pageY - (height / 2)) + "px")
            .css("left",(e.pageX + yOffset) + "px");
    });
    $(document).on("mouseout",".thumbnail",function(){ //마우스 아웃
        $("#preview").remove();
    });
}
ui.imageLayerView();


$(document).on("click",".fullSize_background",function(){ //마우스 오버
    util.fullSize_background($(this).prop('src'));
});


$(document).on('click', '._openImagePop', function(){
    /*util.imagePopup($(this));*/
    var url = $(this).prop('src');
    var title = $(this).prop('src');
    var option = ''//"width=" + (obj.width + 20) + ", height=" + (obj.height + 20) + ",fullscreen=yes";

    window.open(url, title, option);
});