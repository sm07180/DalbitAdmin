/**
 * 공통 자바스크립트 함수
 */
inforexApi = {};

inforexApi.callInforexMenuApi = function() {
    var url = 'http://admin.inforex.co.kr/dalbit/getCommonMenu.php';
    var data = new Object();
    data.url = url;

    var option = {
        type : 'GET'
        , dataType : 'json'
    };
    util.getAjaxData("menu", url, null, inforexApi.menuSuccess, null, option);
}

inforexApi.menuSuccess = function(dst_id, data){
    var menuInfo = [];
    $.each(data, function(key, value){
        var menuId = Math.floor(Math.random() * 1000000000);
        //console.log('key:' + key + ' / ' + 'value:' + value);
        if(value == '[object Object]'){
            if(key != '인포렉스'){
                menuInfo.push(new INFOREX_MENU(menuId, 1, key, null));
            }

            $.each(data[key], function(key2, value2){
                if(value2 == '[object Object]'){

                    var menuId2 = Math.floor(Math.random() * 1000000000);

                    //console.log('2뎁스 object'+ key2 + "/" + value2);
                    menuInfo.push(new INFOREX_MENU(menuId2, 1, key2, null));
                    $.each(data[key][key2], function(key3, value3){
                        //비상연락망 default '콘텐츠사업부'로 세팅
                        if(value3 == 'http://admin.inforex.co.kr/mng_common/inforex/staff/unusualcall.html'){
                            value3 += '?wdivi=4000';
                        }

                        //자리배치도 default '서울'로 세팅
                        if(value3 == 'http://admin.inforex.co.kr/mng_common/board/company/board.html?brd_category=seatquarter'){
                            value3 += '&doc_no=320';
                        }
                        menuInfo.push(new INFOREX_MENU(menuId2, 2, key3, value3));
                    });

                }else{
                    //console.log('2뎁스 추가' + key2 + "/" + value2);
                    menuInfo.push(new INFOREX_MENU(menuId, 2, key2, value2));
                }
            });
        }
    });

    util.getAjaxData("menu", "/rest/main/inforex/menu", {data : JSON.stringify(menuInfo)}, inforexApi.menuSave);
}

inforexApi.menuSave = function(dst_id, data){
    if(0 < location.href.indexOf("/login")){
        location.href="/index.html";
    }

    appendMenuData(data);
}