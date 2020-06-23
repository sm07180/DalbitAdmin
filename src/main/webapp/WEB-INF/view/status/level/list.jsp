<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="wrapper">
    <div id="page-wrapper">
        <!-- serachBox -->
        <form id="searchForm">
            <div class="col-lg-12 form-inline no-padding">
                <div class="widget widget-table searchBoxArea">
                    <div class="widget-header searchBoxRow">
                        <h3 class="title"><i class="fa fa-search"></i> 레벨 분포 검색</h3>
                        <div>
                            <%--<span id="searchFormRadio"></span>--%>
                            <%--<div class="input-group date" id="rangeDatepicker">--%>
                                <%--<label for="displayDate" class="input-group-addon">--%>
                                    <%--<span><i class="fa fa-calendar"></i></span>--%>
                                <%--</label>--%>
                                <%--<input type="text" name="displayDate" id="displayDate" class="form-control" />--%>
                            <%--</div>--%>

                            <%--<input type="hidden" name="startDate" id="startDate">--%>
                            <%--<input type="hidden" name="endDate" id="endDate" />--%>

                            <%--<input name="startDate" id="startDate">--%>
                            <%--<input name="endDate" id="endDate" />--%>


                            <label><input type="text" class="form-control" id="txt_search" name="txt_search"></label>
                            <button type="button" class="btn btn-success" id="bt_search">검색</button>
                            <%--<a href="javascript://" class="_prevSearch">[이전]</a>--%>
                            <%--<a href="javascript://" class="_todaySearch">[오늘]</a>--%>
                            <%--<a href="javascript://" class="_nextSearch">[다음]</a>--%>
                        </div>
                    </div>
                </div>
            </div>
            <!-- //serachBox -->
        </form>
        <div>
            <div class="col-md-12 no-padding mb10">
                <div class="pull-right">
                    <span id="level_summaryArea"></span>
                </div>
            </div>
            <div class="col-md-12 no-padding">
                <div class="pull-right">
                    <span id="level_summaryArea2"></span>
                </div>
            </div>

            <div class="col-md-12 no-padding">
                <label id="level" onchange="sel_change_levelInnerArea();"></label>
                <table id="list_info" class="table table-sorting table-hover table-bordered">
                    <thead></thead>
                    <tbody></tbody>
                </table>
            <%--<button class="btn btn-default btn-sm print-btn pull-right" type="button" id="excelDownBtn"><i class="fa fa-print"></i>Excel Down</button>--%>
            </div>
        </div>
    </div> <!-- //page-wrapper -->
</div> <!-- //wrapper -->

<script src="/js/dataTablesSource/status/levelDataTableSource.js?${dummyData}"></script>

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
        getLevelList();
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

        getMemLevelSearch();
    }
    function setStartDay(){
        var date = new Date();
        $("#endDate").val(dateTime);

        if(_searchFormRadio == 1) {     // 일주일 전
            sDate = new Date(Date.parse(date) - 7 * 1000 * 60 * 60 * 24);           // 일주일 전
            sDate = date.getFullYear() +"."+ common.lpad(sDate.getMonth() + 1,2,"0") +"."+ common.lpad(sDate.getDate()+1,2,"0");      // 일주일전
            $("#startDate").val(sDate);
        }else if(_searchFormRadio == 0) {       // 한달전
            $("#startDate").val(date.getFullYear() +"."+ common.lpad(date.getMonth(),2,"0") +"."+ common.lpad(date.getDate(),2,"0"));        // 한달전
        }
        $("#displayDate").val($("#startDate").val() + " - " + $("#endDate").val());

        getMemLevelSearch();
    }

    $('input[id="txt_search"]').keydown(function() {
        if (event.keyCode === 13) {
            getMemLevelSearch();
        };
    });

    $('#bt_search').click( function() {       //검색
        getMemLevelSearch();
    });

    init();

    function init(){
        txt_search = $('#txt_search').val();
        sDate = $("#startDate").val();
        eDate = $("#endDate").val();
    }

    function getMemLevelSearch(){
        sDate = $("#startDate").val();
        eDate = $("#endDate").val();

        txt_search = $('#txt_search').val();
        dtList_info.reload(level_listSummary);
    }

    var tmp_level = "";
    var dtList_info;
    function getLevelList() {
        var dtList_info_data = function(data) {
            data.searchText = txt_search;                        // 검색명
            data.sDate = sDate;
            data.eDate = eDate;
            data.level = tmp_level;
        };
        dtList_info = new DalbitDataTable($("#list_info"), dtList_info_data, levelDataTableSource.levelList);
        dtList_info.useCheckBox(false);
        dtList_info.useIndex(true);
        dtList_info.setPageLength(100);
        dtList_info.createDataTable(level_listSummary);
        dtList_info.reload();

        $("#level").html(util.getCommonCodeSelect('', level));

    }

    function level_listSummary(json){
        console.log(json);
        var template = $("#level_tableSummary").html();
        var templateScript = Handlebars.compile(template);
        var data = {
            content : json.summary
            , length : json.recordsTotal
        };
        var html = templateScript(data);
        $("#level_summaryArea").html(html);

    }

    function sel_change_levelInnerArea(){
        tmp_level = $("select[name='level']").val();
        dtList_info.reload(level_listSummary);
    }

    var _level10;
    $(document).on('click', '._levelClick', function(){
        _level10 = $(this).data('level');
        var data = {};
        data.level = $(this).data('level');

        util.getAjaxData("summary", "/rest/status/level/summary",data, level_summary_success);
    });

    function level_summary_success(dst_id, response) {
        dalbitLog(response);

        var template = $("#level_tableSummary2").html();
        var templateScript = Handlebars.compile(template);
        var data = {
            content : response.summary
        };
        var html = templateScript(data);
        $("#level_summaryArea2").html(html);
        if(_level10 != 10){
            $("#tr_level0").addClass('hide');
            $("#td_level0").addClass('hide');
        }else{
            $("#tr_level0").removeClass('hide');
            $("#td_level0").removeClass('hide');
        }

        if(_level10 != 10) {
            var header = 10;
            for (var i = _level10; i > (_level10 - 10); i--) {
                $("#tableHeader tr:eq(0) th:eq(" + header + ")").html(i + "Lv");
                header--;
            }
        }
    }
    // /*=============엑셀==================*/
    // $('#excelDownBtn').on('click', function(){
    //     var formElement = document.querySelector("form");
    //     var formData = new FormData(formElement);
    //     formData.append("searchText", txt_search);
    //     formData.append("period", tmp_period);
    //     formData.append("sDate", sDate);
    //     formData.append("eDate", eDate);
    //     formData.append("ostype", tmp_ostype);
    //     formData.append("searchPayStatus", tmp_searchPayStatus);
    //     formData.append("innerType", tmp_innerType);
    //     formData.append("payWay", tmp_payWay);
    //
    //     util.excelDownload($(this), "/rest/payment/pay/listExcel", formData);
    //
    // });


</script>

<script id="level_tableSummary" type="text/x-handlebars-template">
    <table class="table table-condensed table-dark-header table-bordered no-margin" style="width: 600px;">
        <colgroup>
            <col width="16.6%"/><col width="16.6%"/><col width="16.6%"/><col width="16.6%"/><col width="16.6%"/>
            <col width="16.6%"/>
        </colgroup>
        <thead>
            <tr>
                <th>사용자</th><th>10Lv</th><th>20Lv</th><th>30Lv</th><th>40Lv</th><th>50Lv</th>
            </tr>
        </thead>
        <tr class="font-bold">
            <td>{{addComma content.totalLevelCnt}}</td>
            <td><a href="javascript://" class="_levelClick" data-level = "10">{{addComma content.level10}}</a></td>
            <td><a href="javascript://" class="_levelClick" data-level = "20">{{addComma content.level20}}</a></td>
            <td><a href="javascript://" class="_levelClick" data-level = "30">{{addComma content.level30}}</a></td>
            <td><a href="javascript://" class="_levelClick" data-level = "40">{{addComma content.level40}}</a></td>
            <td><a href="javascript://" class="_levelClick" data-level = "50">{{addComma content.level50}}</a></td>
        </tr>
    </table>
</script>

<script id="level_tableSummary2" type="text/x-handlebars-template">
    <table class="table table-condensed table-dark-header table-bordered no-margin" style="width: 1000px;">
        <colgroup>
            <col width="8%"/><col width="8%"/><col width="8%"/><col width="8%"/><col width="8%"/><col width="8%"/>
            <col width="8%"/><col width="8%"/><col width="8%"/><col width="8%"/><col width="8%"/><col width="8%"/>
            <col width="8%"/><col width="8%"/>
        </colgroup>
        <thead id="tableHeader">
            <tr>
                <th id="tr_level0">0Lv</th>
                <th>1Lv</th>
                <th>2Lv</th>
                <th>3Lv</th>
                <th>4Lv</th>
                <th>5Lv</th>
                <th>6Lv</th>
                <th>7Lv</th>
                <th>8Lv</th>
                <th>9Lv</th>
                <th>10Lv</th>
                <th>총합</th>
            </tr>
        </thead>
        <tbody>
            <tr class="font-bold">
                <td id="td_level0">{{addComma content.level0}}</td>
                <td>{{addComma content.level1}}</td>
                <td>{{addComma content.level2}}</td>
                <td>{{addComma content.level3}}</td>
                <td>{{addComma content.level4}}</td>
                <td>{{addComma content.level5}}</td>
                <td>{{addComma content.level6}}</td>
                <td>{{addComma content.level7}}</td>
                <td>{{addComma content.level8}}</td>
                <td>{{addComma content.level9}}</td>
                <td>{{addComma content.level10}}</td>
                <td>{{addComma content.totalLevelCnt}}</td>
            </tr>
        </tbody>
    </table>
</script>