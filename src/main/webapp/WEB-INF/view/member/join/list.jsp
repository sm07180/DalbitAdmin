
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="wrapper">
    <div id="page-wrapper">
        <!-- serachBox -->
        <form id="searchForm">
        <div class="row col-lg-12 form-inline">
            <div class="widget widget-table searchBoxArea">
                <div class="widget-header searchBoxRow">
                    <h3 class="title"><i class="fa fa-search"></i> 회원 검색</h3>
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


                        <label><input type="text" class="form-control" id="txt_search" name="txt_search"></label>
                        <button type="button" class="btn btn-success" id="bt_search">검색</button>
                        <a href="javascript://" class="_prevSearch">[이전]</a>
                        <a href="javascript://" class="_todaySearch">[오늘]</a>
                        <a href="javascript://" class="_nextSearch">[다음]</a>

                        <%--<button type="button" class="btn btn-primary" id="bt_search_special">600달 이상 보유 회원</button>--%>
                        <label class="control-inline fancy-checkbox custom-color-green">
                            <input type="checkbox" name="search_testId" id="search_testId" value="1" checked="true">
                            <span>테스트 아이디 제외</span>
                        </label>

                        <label class="control-inline fancy-checkbox custom-color-green">
                            <input type="checkbox" name="search_joinPath" id="search_joinPath" value="1">
                            <span>광고유입</span>
                        </label>
                    </div>
                </div>
            </div>
        </div>
        </form>
        <!-- //serachBox -->
        <!-- DATA TABLE -->
        <ul class="nav nav-tabs nav-tabs-custom-colored mt5">
            <li class="active"><a href="#memberList" role="tab" data-toggle="tab" onclick="memberList();">가입정보</a></li>
            <li><a href="#withdrawalList" role="tab" data-toggle="tab" id="tab_withdrawalList" onclick="withdrawalList();">탈퇴정보</a></li>
        </ul>
        <div class="row col-lg-12 form-inline">
            <div class="tab-content no-padding">
                <div class="tab-pane fade in active " id="memberList">       <!-- 회원 -->
                    <div class="widget-content">
                        <span id="joinList_summaryArea"></span>
                        <table id="tb_memberList" class="table table-sorting table-hover table-bordered">
                            <thead></thead>
                            <tbody></tbody>
                        </table>
                    </div>
                </div>
                <div class="tab-pane fade" id="withdrawalList">       <!-- 회원 -->
                    <div class="widget-content">
                        <span id="withdrawalList_summaryArea"></span>
                        <table id="tb_withdrawalList" class="table table-sorting table-hover table-bordered">
                            <thead></thead>
                            <tbody></tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <!-- DATA TABLE END -->
    </div>
</div>

<script type="text/javascript" src="/js/code/member/memberCodeList.js?${dummyData}"></script>

<script>
    var dateTime = new Date();
    dateTime = moment(dateTime).format("YYYY.MM.DD");
    setTimeDate(dateTime);

    var sDate;
    var eDate;
    var _searchFormRadio ="";
    $(function(){
        $("#searchFormRadio").html(util.getCommonCodeRadio(2, searchFormRadio));

        $("#displayDate").statsDaterangepicker(
            function(start, end, t1) {
                $("#startDate").val(start.format('YYYY.MM.DD'));
                $("#endDate").val(end.format('YYYY.MM.DD'));
            }
        );
        getUserInfo();

        $('input[id="txt_search"]').keydown(function() {
            if (event.keyCode === 13) {
                getUserInfo();
            };
        });
        <!-- 버튼 -->
        $('#bt_search').click( function() {       //검색
            getUserInfo();
        });

        $("#search_joinPath").on('change', function(){
            if($(this).prop('checked')){
                tmp_joinPath = 1;
            }else{
                tmp_joinPath = 0;
            }
            getUserInfo();
        });
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

        getUserInfo();
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

        getUserInfo();
    }

    var tmp_memWithdrawal;
    var tmp_period;
    var tmp_sDate;
    var tmp_eDate;

    var memWithdrawal = "0";
    var dtList_info;

    var _testid = -1;
    var tmp_searchText;
    var tmp_joinPath = 0;

    var _memJoinDateSort = -1;
    var _memNickSort = -1;
    var _memLoginIdSort = -1;
    var _memIpSort = -1;
    var _memJoinDateSort_withdrawal = -1;
    var _memNickSort_withdrawal = -1;
    var _memLoginIdSort_withdrawal = -1;
    var _memIpSort_withdrawal = -1;

    var dtList_info_data = function ( data ) {
        data.searchText = tmp_searchText;                        // 검색명
        data.testid = _testid;
        data.memWithdrawal = memWithdrawal;
        data.memJoinDateSort = _memJoinDateSort;
        data.memNickSort = _memNickSort;
        data.memLoginIdSort = _memLoginIdSort;
        data.memIpSort = _memIpSort;
        data.memJoinPath = tmp_joinPath;

        data.sDate = tmp_sDate;
        data.eDate = tmp_eDate;
    };
    dtList_info = new DalbitDataTable($("#tb_memberList"), dtList_info_data, MemberDataTableSource.joinList);
    dtList_info.useCheckBox(false);
    dtList_info.useIndex(true);
    dtList_info.useInitReload(false);
    dtList_info.setPageLength(100);
    dtList_info.createDataTable(joinListSummary);

    var dtList_info2;
    var dtList_info_data2 = function ( data ) {
        data.searchText = tmp_searchText;                        // 검색명
        data.testid = _testid;
        data.memWithdrawal = memWithdrawal;
        data.memJoinDateSort_withdrawal = _memJoinDateSort_withdrawal;
        data.memNickSort_withdrawal = _memNickSort_withdrawal;
        data.memLoginIdSort_withdrawal = _memLoginIdSort_withdrawal;
        data.memIpSort_withdrawal = _memIpSort_withdrawal;
        data.memJoinPath = tmp_joinPath;
        data.sDate = tmp_sDate;
        data.eDate = tmp_eDate;
    };
    dtList_info2 = new DalbitDataTable($("#tb_withdrawalList"), dtList_info_data2, MemberDataTableSource.withdrawalList);
    dtList_info2.useCheckBox(false);
    dtList_info2.useIndex(true);
    dtList_info2.useInitReload(false);
    dtList_info2.setPageLength(100);
    dtList_info2.createDataTable(withdrawalListSummary);

    var testid = '<br/><br/><span id="memJoinDateSort" onchange="joinSort();"></span>' +
                '<span id="memNickSort" onchange="joinSort();"></span>' +
                '<span id="memLoginIdSort" onchange="joinSort();"></span>' +
                '<span id="memIpSort" onchange="joinSort();"></span></div>';
    $("#memberList").find(".top-left").append(testid);
    $("#memJoinDateSort").html(util.getCommonCodeSelect(-1, memJoinDateSort));
    $("#memNickSort").html(util.getCommonCodeSelect(-1, memNickSort));
    $("#memLoginIdSort").html(util.getCommonCodeSelect(-1, memLoginIdSort));
    $("#memIpSort").html(util.getCommonCodeSelect(-1, memIpSort));


    var excel = '<button class="btn btn-default btn-sm print-btn pull-right" type="button" id="excelDownBtn"><i class="fa fa-print"></i>Excel Down</button>';
    $("#memberList").find(".footer-right").append(excel);

    var testid_withdrawal = '<br/><br/><span id="memJoinDateSort_withdrawal" onchange="withdrawalSort();"></span>' +
                            '<span id="memNickSort_withdrawal" onchange="withdrawalSort();"></span>' +
                            '<span id="memLoginIdSort_withdrawal" onchange="withdrawalSort();"></span>' +
                            '<span id="memIpSort_withdrawal" onchange="withdrawalSort();"></span></div>';
    $("#withdrawalList").find(".top-left").append(testid_withdrawal);
    $("#testId_withdrawal").html(util.getCommonCodeRadio(-1, testId_withdrawal));
    $("#memNickSort_withdrawal").html(util.getCommonCodeSelect(-1, memNickSort));
    $("#memLoginIdSort_withdrawal").html(util.getCommonCodeSelect(-1, memLoginIdSort));
    $("#memIpSort_withdrawal").html(util.getCommonCodeSelect(-1, memIpSort));

    var withdrawal_excel = '<button class="btn btn-default btn-sm print-btn pull-right" type="button" id="withdrawal_excelDownBtn"><i class="fa fa-print"></i>Excel Down</button>';
    $("#withdrawalList").find(".footer-right").append(withdrawal_excel);

    function getUserInfo() {                 // 검색
        _testid = $('input[name="search_testId"]').prop('checked') ? 1 : -1;
        tmp_searchText = $('#txt_search').val();
        tmp_memWithdrawal = memWithdrawal;
        tmp_sDate = $("#startDate").val();
        tmp_eDate = $("#endDate").val();
        if(memWithdrawal == "0"){
            dtList_info.reload(joinListSummary);
        }else{
            dtList_info2.reload(withdrawalListSummary);
        }
    }
    function memberList(){
        memWithdrawal = "0";
        getUserInfo();
    }
    function withdrawalList(){
        memWithdrawal = "1";
        getUserInfo();
    }

    // 가입 --------------------
    function joinSort(){
        _memJoinDateSort = $("#memJoinDateSort").find("select[name='memJoinDateSort']").val();
        _memNickSort = $("#memNickSort").find("select[name='memNickSort']").val();
        _memLoginIdSort = $("#memLoginIdSort").find("select[name='memLoginIdSort']").val();
        _memIpSort = $("#memIpSort").find("select[name='memIpSort']").val();

        getUserInfo();
    };

    $(".searchBoxRow").find("select").change( function() {
        var me = $(this);
        $(".searchBoxRow").find("select").each( function (){
            if(me.attr("name")!==$(this).attr("name")){
                $(this).val("-1");
            }
        });
    });

    function withdrawalSort(){
        _memJoinDateSort_withdrawal = $("#memJoinDateSort_withdrawal").find("select[name='memJoinDateSort']").val();
        _memNickSort_withdrawal = $("#memNickSort_withdrawal").find("select[name='memNickSort']").val();
        _memLoginIdSort_withdrawal = $("#memLoginIdSort_withdrawal").find("select[name='memLoginIdSort']").val();
        _memIpSort_withdrawal = $("#memIpSort_withdrawal").find("select[name='memIpSort']").val();

        getUserInfo();
    }

    function joinListSummary(json){
        var template = $("#joinList_tableSummary").html();
        var templateScript = Handlebars.compile(template);
        var data = {
            content : json.summary
            , length : json.recordsTotal
        }
        var html = templateScript(data);
        $("#joinList_summaryArea").html(html);
    }

    function withdrawalListSummary(json){
        var template = $("#withdrawalList_tableSummary").html();
        var templateScript = Handlebars.compile(template);
        var data = {
            content : json.summary
            , length : json.recordsTotal
        }
        var html = templateScript(data);
        $("#withdrawalList_summaryArea").html(html);
    }

    /*=============엑셀==================*/
    $('#excelDownBtn').on('click', function(){
        var formElement = document.querySelector("form");
        var formData = new FormData(formElement);
        formData.append("searchText", tmp_searchText);
        formData.append("testid", _testid);
        formData.append("memWithdrawal", memWithdrawal);
        formData.append("sDate", tmp_sDate);
        formData.append("eDate", tmp_eDate);
        formData.append("memJoinDateSort", _memJoinDateSort);
        formData.append("memNickSort", _memNickSort);
        formData.append("memLoginIdSort", _memLoginIdSort);
        formData.append("memIpSort", _memIpSort);
        formData.append("memJoinPath", tmp_joinPath);

        util.excelDownload($(this), "/rest/member/join/listExcel", formData);
    });

    $('#withdrawal_excelDownBtn').on('click', function(){
        var formElement = document.querySelector("form");
        var formData = new FormData(formElement);
        formData.append("searchText", tmp_searchText);
        formData.append("testid", _testid);
        formData.append("memWithdrawal", memWithdrawal);
        formData.append("sDate", tmp_sDate);
        formData.append("eDate", tmp_eDate);
        formData.append("memJoinDateSort_withdrawal", _memJoinDateSort_withdrawal);
        formData.append("memNickSort_withdrawal", _memNickSort_withdrawal);
        formData.append("memLoginIdSort_withdrawal", _memLoginIdSort_withdrawal);
        formData.append("memIpSort_withdrawal", _memIpSort_withdrawal);
        formData.append("memJoinPath", tmp_joinPath);
        util.excelDownload($(this), "/rest/member/join/withdrawalListExcel", formData);
    });
    /*==================================*/
</script>


<!-- summary -->
<script id="joinList_tableSummary" type="text/x-handlebars-template">
    <table class="table table-bordered table-summary pull-right" style="margin-right: 0px;">
        <thead>
        <tr class="align-middle">
            <th colspan="2" rowspan="2">총 가입자 수</th>
            <th colspan="6">가입플랫폼 별 수</th>
        </tr>
        <tr>
            <th>휴대폰</th>
            <th>Facebook</th>
            <th>Google</th>
            <th>Kakao</th>
            <th>Naver</th>
            <th>Apple</th>
        </tr>
        </thead>
        <tbody>
        <td colspan="2">{{content.allCnt}}명</td>
        <td>{{content.slctPhonCnt}}명</td>
        <td>{{content.slctFaceCnt}}명</td>
        <td>{{content.slctGoogleCnt}}명</td>
        <td>{{content.slctKakaoCnt}}명</td>
        <td>{{content.slctNaverCnt}}명</td>
        <td>{{content.slctAppleCnt}}명</td>
        </tbody>
    </table>
</script>

<script id="withdrawalList_tableSummary" type="text/x-handlebars-template">
    <table class="table table-bordered table-summary pull-right" style="margin-right: 0px;">
        <thead>
        <tr class="align-middle">
            <th colspan="2" rowspan="2">총 가입자 수</th>
            <th colspan="6">가입플랫폼</th>
        </tr>
        <tr>
            <th>휴대폰</th>
            <th>Facebook</th>
            <th>Google</th>
            <th>Kakao</th>
            <th>Naver</th>
            <th>Apple</th>
        </tr>
        </thead>
        <tbody>
        <td colspan="2">{{content.allCnt}}명</td>
        <td>{{content.slctPhonCnt}}명</td>
        <td>{{content.slctFaceCnt}}명</td>
        <td>{{content.slctGoogleCnt}}명</td>
        <td>{{content.slctKakaoCnt}}명</td>
        <td>{{content.slctNaverCnt}}명</td>
        <td>{{content.slctAppleCnt}}명</td>
        </tbody>
    </table>
</script>