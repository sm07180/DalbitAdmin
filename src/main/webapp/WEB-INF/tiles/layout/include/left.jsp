<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="cfn" uri="/WEB-INF/tld/comFunction.tld" %>

<c:set var="url" value="${requestScope['javax.servlet.forward.request_uri']}" />
<c:set var="param" value="${requestScope['javax.servlet.forward.query_string']}" />
<c:set var="param_menu" value="${param.menu}" />

<script type="text/javascript" src="/js/inforexApi.js?${dummyData}"></script>
<script type="text/javascript">
    $(document).on('keyup keydown keypress', '#menuSearch', function(e){
       var searchText = $("#menuSearch").val().toLowerCase();

       $('._searched').removeClass('_searched');

       //2뎁스 처리
       $('.sub-menu').each(function(){
          $(this).find('._dalbit').each(function(){
              if(-1 < $(this).text().toLowerCase().indexOf(searchText)){
                  $(this).parent().addClass('_searched').show();
                  $(this).closest('ul').parent().find('._dalbit:eq(0)').addClass('_searched');
              }else{
                  $(this).parent().hide();
              }
          });
       });

       //1뎁스 처리
       $("li.menu1 > ._dalbit").each(function(){
           if(-1 < $(this).text().toLowerCase().indexOf(searchText)){
               $(this).parent().addClass('_searched').show();
           }else{
               var menu1 = $(this).closest('li');
               if(!menu1.parent().hasClass('_searched')){
                   $(this).hide();
               }
           }
        });

       $('._searched').each(function(){
           $(this).show();
       });
    });
</script>
<!-- left sidebar -->
<div id="left-sidebar" class="left-sidebar _leftFixed">
    <!-- main-nav -->
    <div class="sidebar-scroll" style="overflow:auto;">
        <nav class="main-nav">
            <ul class="main-menu">

                <li>
                    <input type="text" value="" class="form-control" id="menuSearch" placeholder="메뉴검색" />
                </li>

                <c:forEach var="menu" items="${cfn:getMenuList()}" varStatus="status">

                    <c:if test="${menu.mobile_yn eq 'N'}">

                        <c:set var="isContainSubmenu" value="${0 < fn:length(menu.twoDepth)}" />
                        <c:set var="isSubmenuView" value="false" />

                        <c:if test="${url.equals(menu.menu_url)}">
                            <c:set var="isSubmenuView" value="true" />
                        </c:if>
                        <c:forEach var="subMenu" items="${menu.twoDepth}">
                            <c:if test="${url.equals(subMenu.menu_url)}">
                                <c:set var="isSubmenuView" value="true" />
                            </c:if>
                        </c:forEach>

                        <li class="menu1 ${menu.menu_url eq '/main' ? '_mainMenu' : ''}
                                   ${isContainSubmenu ? '' : 'page'}
                                   ${menu.is_comming_soon eq 1 ? '_commingSoon' : ''}
                                   ${isSubmenuView ? 'active': ''}
                                  "
                        >

                                <%--<a href="${0 < fn:length(menu.menu_url) ? menu.menu_url: 'javascript://'}" target="${menu.is_pop eq 1 ? '_black' : ''}" class="${isContainSubmenu ? 'js-sub-menu-toggle' : ''}">--%>
                            <a href="${menu.is_pop eq 1 ? menu.menu_url : 'javascript://'}" data-url="${0 < fn:length(menu.menu_url) ? menu.menu_url: ''}"
                               target="${menu.is_pop eq 1 ? '_black' : ''}"
                               class="${isContainSubmenu ? 'js-sub-menu-toggle' : ''} _dalbit">

                                <i class="fa ${menu.icon}"></i><span class="text">${menu.menu_name}</span>
                                <c:if test="${isContainSubmenu}">
                                    <%--<i class="toggle-icon fa fa-angle-${isSubmenuView ? 'down': 'left'}"></i>--%>
                                    <i class="toggle-icon fa fa-angle-${isSubmenuView ? 'down': 'down'}"></i>
                                </c:if>
                            </a>

                            <c:if test="${isContainSubmenu}">
                                <%--<ul class="sub-menu" style="${isSubmenuView ? 'display:block;': ''}">--%>
                                <ul class="sub-menu" style="${isSubmenuView ? 'display:block;': 'display:block;'}">
                                    <c:forEach var="twoDepth" items="${menu.twoDepth}">
                                        <li class="${not empty url and url.equals(twoDepth.menu_url) ? 'active': ''}">
                                            <a href="${twoDepth.is_pop eq 1 ? twoDepth.menu_url : 'javascript://'}" data-url="${0 == fn:length(twoDepth.menu_url) ? '' : twoDepth.menu_url}"
                                               target="${twoDepth.is_pop eq 1 ? '_black' : ''}"
                                               class="${twoDepth.is_comming_soon eq 1 ? '_commingSoon' : ''} ${twoDepth.is_use eq 2 ? '_inforex' : '_dalbit'}">
                                                <i class="fa ${twoDepth.icon}"></i><span class="text">${twoDepth.menu_name}</span>
                                            </a>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </c:if>
                        </li>
                    </c:if>
                </c:forEach>

                <c:forEach var="menu" items='${sessionScope.InforexMenuInfo}'>
                    <c:if test="${menu.depth eq 1}">
                        <li>
                            <a href="javascript://" class="js-sub-menu-toggle">
                                <span class="text">${menu.name}</span>
                                <i class="toggle-icon fa fa-angle-left"></i>
                            </a>
                            <c:forEach var="menu2" items='${sessionScope.InforexMenuInfo}'>
                                <c:if test="${menu2.depth eq 2 && menu.id eq menu2.id}">
                                    <ul class="sub-menu">
                                        <li>
                                            <a href="javascript://" data-url="${menu2.url}" class="_inforex">
                                                <span class="text">${menu2.name}</span>
                                            </a>
                                        </li>
                                    </ul>
                                </c:if>
                            </c:forEach>
                        </li>
                    </c:if>
                </c:forEach>
            </ul>
        </nav>
        <!-- /main-nav -->
    </div>
</div>
<!-- end left sidebar -->

<script type="text/javascript">

    $(function(){
        ui.leftActiveFocus();

        if(common.isEmpty('${sessionScope.InforexMenuInfo}')){
            try{
                inforexApi.callInforexMenuApi();
            }catch (e) {
                console.log('인포렉스 메뉴 가져오기 실패');
            }

        }
    });

    function appendMenuData(response){
        if(common.isEmpty('${sessionScope.InforexMenuInfo}')) {
            var template = $('#tmp_inforexMenu').html();
            var templateScript = Handlebars.compile(template);
            var detailContext = response.data;
            var html = templateScript(detailContext);
            $('#left-sidebar > div > nav > ul > li:last').after(html);
        }
    }

    $('._commingSoon').on('click', function(e){
        <c:if test="${fn:contains('/dev/', cfn:getActiveProfile())}">
        e.preventDefault();
        alert('준비중입니다.');
        </c:if>
    });

    $('._commingSoon').find('span').css({
        'color' : 'gray',
        'font-weight' : 'bold'
    }).append(' - 준비중');

    $(document).on('click', '._inforex', function(){
        ui.loadInforexAdminPage($(this));
    });

    $(document).on('click', '._dalbit', function(){
        ui.loadBaseAdminPage($(this));
    });

    $('.main-menu li:first').before($('._mainMenu'));

    window.onpopstate = function(event) {
        var menuArr = (history.state == null || history.state.menuArr == null) ? [] : history.state.menuArr;
        if(0 == menuArr.length){
            location.href='/index';
        }else{
            var menuCnt = history.state.menuArr.length;

            var menu = $('._dalbit[data-url="'+history.state.menuArr[menuCnt - 1]+'"], ._inforex[data-url="'+history.state.menuArr[menuCnt - 1]+'"]');
            if(menu.hasClass('_inforex')){
                ui.loadInforexAdminPage($('._inforex[data-url="'+history.state.menuArr[menuCnt - 1]+'"]'), true);
            }else{
                ui.loadBaseAdminPage($('._dalbit[data-url="'+history.state.menuArr[menuCnt - 1]+'"]'), true);
            }

            menuArr.length = menuCnt-1
        }
    }

</script>

<script type="text/x-handlebars-template" id="tmp_inforexMenu">
    {{#each this as |menu|}}
        {{#equal menu.depth 1}}
            <li>
                <a href="javascript://" class="js-sub-menu-toggle">
                    <span class="text">{{menu.name}}</span>
                    <i class="toggle-icon fa fa-angle-left"></i>
                </a>

                {{#each @root as |menu2|}}
                    {{#equal menu2.depth 2}}
                        {{#equal menu.id menu2.id}}
                            <ul class="sub-menu">
                                <li>
                                    <a href="javascript://" data-url="{{menu2.url}}" class="_inforex">
                                        <span class="text">{{menu2.name}}</span>
                                    </a>
                                </li>
                            </ul>
                        {{/equal}}
                    {{/equal}}
                {{/each}}
            </li>
        {{/equal}}
    {{/each}}
</script>