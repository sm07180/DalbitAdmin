<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="cfn" uri="/WEB-INF/tld/comFunction.tld" %>
<div id="wrapper">
    <div id="page-wrapper">
        <div class="container-fluid">
            <!-- serachBox -->
            <form id="searchForm">
                <div class="row col-lg-12 form-inline">
                    <%--<input type="hidden" name="pageStart" id="pageStart">
                    <input type="hidden" name="pageCnt" id="pageCnt">--%>
                    <div class="widget widget-table searchBoxArea">
                        <div class="widget-header searchBoxRow">
                            <h3 class="title"><i class="fa fa-search"></i> 교환 이력</h3>
                            <div>
                                <span id="searchYearArea"></span>
                                <span id="searchMonthArea"></span>
                                <span id="searchStateArea"></span>

                                <span id="searchTypeArea" class="ml10"></span>
                                <label><input type="text" class="form-control" id="search_value" name="search_value"></label>
                                <button type="button" class="btn btn-success" id="bt_search">검색</button>

                                <%--<button type="button" class="btn btn-primary" id="bt_search_special">600달 이상 보유 회원</button>--%>
                                <label class="control-inline fancy-checkbox custom-color-green">
                                    <input type="checkbox" name="search_testId" id="search_testId" value="1" checked="true">
                                    <span>테스트 아이디 제외</span>
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            <!-- //serachBox -->
            <div>
                <jsp:include page="changeList.jsp"/>
            </div>
        </div>
    </div>
</div>

<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#detailView" id="showModal" style="display:none;">레이어팝업오픈버튼</button>

<div class="modal fade" id="detailView" tabindex="-1" role="dialog" aria-labelledby="detailViewLabel" aria-hidden="true"></div>

<form name="excelForm" id="excelForm"></form>

<script type="text/javascript" src="/js/lib/jquery.table2excel.js"></script>
<script type="text/javascript" src="/js/code/money/exchangeCodeList.js?${dummyData}"></script>
<script type="text/javascript" src="/js/code/member/memberCodeList.js?${dummyData}"></script>
<script type="text/javascript" src="/js/handlebars/moneyHelper.js?${dummyData}"></script>
<script type="text/javascript">

    $(function(){

        $("#searchYearArea").html(util.getCommonCodeSelect(moment(new Date()).format('YYYY'), search_exchange_years));
        $("#searchMonthArea").html(util.getCommonCodeSelect(moment(new Date()).format('MM'), search_exchange_months));
        $("#searchTypeArea").html(util.getCommonCodeSelect('', search_exchange_type));

        $('#searchTestIdArea').html(util.getCommonCodeRadio(-1, testId));
        getList();
    });

    function getParameter(){
        return data = {
            search_year : $("#search_year").val()
            , search_month : $("#search_month").val()
            , search_type : $("#search_type").val()
            , search_value : $("#search_value").val()
            , search_testId : $('input[name="search_testId"]').prop('checked') ? 1 : 0
            , pageStart : itemPagingInfo.pageNo
            , pageCnt : itemPagingInfo.pageCnt
        };
    }

    function getList(){
        util.getAjaxData("select", "/rest/money/item/list", getParameter(), fn_succ_list);
    }

    $('#bt_search').on('click', function(){
        itemPagingInfo.pageNo = 1;
        getList();
    });

    $('input[id="search_value"]').on('keydown', function(e) {    // textBox 처리
        if(e.keyCode == 13) {
            itemPagingInfo.pageNo = 1;
            getList();
        };
    });

    $('._tab').on('click', function(){
        $('._tab').removeClass('active');
        $(this).addClass('active');

        itemPagingInfo.pageNo = 1;
        getList();
    });

    $('input[name="search_testId"]').on('change', function(){
        itemPagingInfo.pageNo = 1;
        getList();
    });


</script>
