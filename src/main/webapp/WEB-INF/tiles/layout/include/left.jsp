<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="cfn" uri="/WEB-INF/tld/comFunction.tld" %>

<c:set var="url" value="${requestScope['javax.servlet.forward.request_uri']}" />
<c:set var="param" value="${requestScope['javax.servlet.forward.query_string']}" />
<c:set var="param_menu" value="${param.menu}" />

<script type="text/javascript" src="/js/inforexApi.js?${dummyData}"></script>
<!-- left sidebar -->
<div id="left-sidebar" class="left-sidebar _leftFixed">
    <!-- main-nav -->
    <div class="sidebar-scroll" style="height: 100%">
        <nav class="main-nav">
            <ul class="main-menu">

                <c:forEach var="menu" items="${cfn:getMenuList()}" varStatus="status">
                    <c:if test="${menu.menu_name eq '메인' or menu.menu_name eq '구글 Analytics'}">
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

                        <li class="${menu.menu_url eq '/main' ? '_mainMenu' : ''}
                                   ${isContainSubmenu ? '' : 'page'}
                                   ${menu.is_comming_soon eq 1 ? '_commingSoon' : ''}
                                   ${isSubmenuView ? 'active': ''}
                                  "
                            data-isread="${menu.is_read}" data-isinsert="${menu.is_insert}" data-isdelete="${menu.is_delete}"
                        >

                            <a href="${menu.menu_url}" target="${menu.is_pop eq 1 ? '_black' : ''}" class="${isContainSubmenu ? 'js-sub-menu-toggle' : ''}">

                                <i class="fa ${menu.icon}"></i><span class="text">${menu.menu_name}</span>
                                <c:if test="${isContainSubmenu}">
                                    <i class="toggle-icon fa fa-angle-${isSubmenuView ? 'down': 'left'}"></i>
                                </c:if>
                            </a>

                            <c:if test="${isContainSubmenu}">
                                <ul class="sub-menu" style="${isSubmenuView ? 'display:block;': ''}">
                                    <c:forEach var="twoDepth" items="${menu.twoDepth}">
                                        <li class="${fn:contains(url, twoDepth.menu_url) ? 'active': ''}">
                                            <a href="${twoDepth.menu_url}" class="${twoDepth.is_comming_soon eq 1 ? '_commingSoon' : ''}">
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

                <c:forEach var="menu" items="${cfn:getMenuList()}" varStatus="status">
                    <c:if test="${menu.menu_name ne '메인' and menu.menu_name ne '구글 Analytics'}">
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

                        <li class="${menu.menu_url eq '/main' ? '_mainMenu' : ''} ${isContainSubmenu ? '' : 'page'} ${menu.is_comming_soon eq 1 ? '_commingSoon' : ''} ${isSubmenuView ? 'active': ''}"
                            data-isread="${menu.is_read}" data-isinsert="${menu.is_insert}" data-isdelete="${menu.is_delete}"
                        >

                            <a href="${0 < fn:length(menu.menu_url) ? 'javascript://' : menu.menu_url}" class="${isContainSubmenu ? 'js-sub-menu-toggle' : ''}">
                                <i class="fa ${menu.icon}"></i><span class="text">${menu.menu_name}</span>
                                <c:if test="${isContainSubmenu}">
                                    <i class="toggle-icon fa fa-angle-${isSubmenuView ? 'down': 'left'}"></i>
                                </c:if>
                            </a>

                            <c:if test="${isContainSubmenu}">
                                <ul class="sub-menu" style="${isSubmenuView ? 'display:block;': ''}">
                                    <c:forEach var="twoDepth" items="${menu.twoDepth}">
                                        <li class="${url.equals(twoDepth.menu_url) ? 'active': ''}"
                                            data-isread="${twoDepth.is_read}" data-isinsert="${twoDepth.is_insert}" data-isdelete="${twoDepth.is_delete}"
                                        >
                                            <a href="${0 == fn:length(twoDepth.menu_url) ? 'javascript://' : twoDepth.menu_url}" class="${twoDepth.is_comming_soon eq 1 ? '_commingSoon' : ''}">
                                                <i class="fa ${twoDepth.icon}"></i><span class="text">${twoDepth.menu_name}</span>
                                            </a>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </c:if>
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
            inforexApi.callInforexMenuApi();
            //var menuAA = '${sessionScope.InforexMenuInfo}';

        }
    });

    function appendMenuData(response){
        if(common.isEmpty('${sessionScope.InforexMenuInfo}')) {
            console.log(response);
            var template = $('#tmp_inforexMenu').html();
            var templateScript = Handlebars.compile(template);
            var detailContext = response.data;
            var html = templateScript(detailContext);
            $('ul.main-menu li:eq(1)').after(html);
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
        console.log($(this));
        ui.loadInforexAdminPage($(this));
    });

    $('.main-menu li:first').before($('._mainMenu'));


    $(window).scroll(function(){
        var scrollTop = $(document).scrollTop()

        var leftMenu = $('._leftFixed');
        if (scrollTop < $('.clearfix').height()){
            leftMenu.css('top', '54px');
        } else {
            leftMenu.css('top', '0px');
        }
    });

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