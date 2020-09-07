<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="wrapper">
    <div id="page-wrapper">
        <!-- serachBox -->
        <div class="row col-lg-12 form-inline">
            <div class="widget widget-table searchBoxArea">
                <div class="widget-header searchBoxRow">
                    <h3 class="title"><i class="fa fa-search"></i><span id="title"/></h3>
                    <div>
                        <span id="searchFormRadio"></span>
                        <div class="input-group date" id="rangeDatepicker">
                            <label for="displayDate" class="input-group-addon">
                                <span><i class="fa fa-calendar"></i></span>
                            </label>
                            <input type="text" name="displayDate" id="displayDate" class="form-control" />
                        </div>
                        <input type="hidden" name="startDate" id="startDate">
                        <input type="hidden" name="endDate" id="endDate" />

                        <%--<input name="startDate" id="startDate">--%>
                        <%--<input name="endDate" id="endDate" />--%>

                        <label><input type="text" class="form-control" id="txt_search" placeholder="검색할 정보를 입력하세요"></label>
                        <button type="button" class="btn btn-success" id="bt_search">검색</button>
                        <a href="javascript://" class="_prevSearch">[이전]</a>
                        <a href="javascript://" class="_todaySearch">[오늘]</a>
                        <a href="javascript://" class="_nextSearch">[다음]</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- //serachBox -->
        <!-- tab -->
        <div class="row col-lg-12 form-inline">
            <jsp:include page="boardAdmTab.jsp"/>
        </div>
        <!-- //tab -->
    </div> <!-- //page-wrapper -->
</div> <!-- //wrapper -->

<script type="text/javascript" src="/js/code/content/contentCodeList.js?${dummyData}"></script>
<script type="text/javascript">

    var dateTime = new Date();
    dateTime = moment(dateTime).format("YYYY.MM.DD");
    setTimeDate(dateTime);
    var _searchFormRadio ="";
    $(document).ready(function() {
        $("#searchFormRadio").html(util.getCommonCodeRadio(2, searchFormRadio));

        $("#displayDate").statsDaterangepicker(
            function(start, end, t1) {
                $("#startDate").val(start.format('YYYY.MM.DD'));
                $("#endDate").val(end.format('YYYY.MM.DD'));
            }
        );
    });

    $(document).on('change', 'input[name="searchFormRadio"]', function(){
        radioChange();
    });

    function radioChange(){
        _searchFormRadio = $('input[name="searchFormRadio"]:checked').val();
        if(_searchFormRadio == 2){
            setTimeDate(dateTime);
        }
        setStartDay();
    }

    $(document).on('click', '._prevSearch', function(){
        searchDate('prev');
    });

    $(document).on('click', '._nextSearch', function(){
        searchDate('next');
    });

    $(document).on('click', '._todaySearch', function(){
        $("input:radio[name='searchFormRadio']:radio[value='2']").prop('checked', true);
        _searchFormRadio = $('input[name="searchFormRadio"]:checked').val();
        setTimeDate(dateTime);
        setStartDay();
    });

    function setTimeDate(dateTime){
        $("#startDate").val(dateTime);
        $("#endDate").val(dateTime);
        $("#displayDate").val(dateTime + " - " + dateTime);
    }

    function searchDate(dateType){
        if(dateType == 'prev'){
            setDay(-1);
        }else if(dateType == 'next'){
            setDay(1);
        }
    }

    function setDay(days){
        $("#startDate").val(moment($("#startDate").val()).add('days', days).format('YYYY.MM.DD'));
        $("#endDate").val(moment($("#endDate").val()).add('days', days).format('YYYY.MM.DD'));

        $("#displayDate").val($("#startDate").val() + " - " + $("#endDate").val());

        $("#bt_search").click();
    }
    function setStartDay(){
        var date = new Date();
        $("#endDate").val(dateTime);

        if(_searchFormRadio == 1) {     // 일주일 전
            sDate = new Date(Date.parse(date) - 7 * 1000 * 60 * 60 * 24);           // 일주일 전
            sDate = date.getFullYear() +"."+ common.lpad(sDate.getMonth() + 1,2,"0") +"."+ common.lpad(sDate.getDate(),2,"0");      // 일주일전 (getDate에서, 7/32 경우가 있어, +1지웠습니다)
            $("#startDate").val(sDate);
        }else if(_searchFormRadio == 0) {       // 한달전

            var setMonthDate;
            var cal = common.lpad(date.getMonth(),2,"0") + "." + common.lpad(new Date(date.getFullYear(), date.getMonth(), 0).getDate(),2,"0");

            if(common.lpad(date.getMonth(),2,"0") +"."+ common.lpad(date.getDate(),2,"0") > cal) {
                setMonthDate = cal;
            } else {
                setMonthDate = common.lpad(date.getMonth(),2,"0") +"."+ common.lpad(date.getDate(),2,"0");
            }

            sDate = date.getFullYear() + "." + setMonthDate;
            $('#startDate').val(sDate);
        }
        $("#displayDate").val($("#startDate").val() + " - " + $("#endDate").val());

        $("#bt_search").click();
    }

    function handlebarsPaging(targetId, pagingInfo) {
        if(targetId == "notice_paginate_top" || targetId == "notice_paginate") {
            noticePagingInfo = pagingInfo;
            noticeList(pagingInfo.pageNo);
        }else if(targetId == "story_paginate_top" || targetId == "story_paginate"){
            StoryPagingInfo = pagingInfo;
            storyList(pagingInfo.pageNo);
        } else if(targetId == "fanBoard_paginate_top" || targetId == "fanBoard_paginate") {
            fanBoardPagingInfo = pagingInfo;
            fanBoardList(pagingInfo.pageNo);
        } else if(targetId == "fanBoard_paginate_top" || targetId == "fanBoard_paginate") {
            fanBoardPagingInfo = pagingInfo;
            fanBoardList(pagingInfo.pageNo);
        } else if(targetId == "list_info_paginate_top" || targetId == "list_info_paginate") {
            shotListPagingInfo = pagingInfo;
            profileMsgList(pagingInfo.pageNo);
        }
    }
</script>