
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
                        <span id="selJoinDate"></span>
                        <div class="input-group date" id="seldate">
                            <input type="text" class="form-control" id="txt_selDate"><span class="input-group-addon"><i class="glyphicon glyphicon-calendar" disabled="true"></i></span>
                        </div>
                        <button type="button" id="bt_search" class="btn btn-success">검색</button>
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

<script type="text/javascript" src="/js/code/member/memberCodeList.js"></script>

<script>

    var date = new Date();
    var sDate;
    var eDate;

    $(document).ready(function() {
        $("#selJoinDate").html(util.getCommonCodeRadio(3, joinDate));

        $('#seldate').datetimepicker({
            format: 'L',
            maxDate:new Date(),
            format: "YYYY-MM-DD",
        });

        sDate = date.getFullYear() + common.lpad(date.getMonth() + 1,2,"0") + common.lpad(date.getDate(),2,"0");        //오늘
        getUserInfo();
        <!-- 버튼 -->
        $('#bt_search').click( function() {       //검색
            getUserInfo();
        });
        <!-- 버튼 끝 -->
    });
    $('#selJoinDate').change(function() {
        sDate = "";
        eDate = "";

        eDate = date.getFullYear() + common.lpad(date.getMonth() + 1,2,"0") + common.lpad(date.getDate(),2,"0");         // 오늘
        if($('input[name="joinDate"]:checked').val() == "0"){               // 월
            sDate = date.getFullYear() + common.lpad(date.getMonth(),2,"0") + common.lpad(date.getDate(),2,"0");        // 한달전
        }else if($('input[name="joinDate"]:checked').val() == "1"){               // 주
            sDate = new Date(Date.parse(date) - 7 * 1000 * 60 * 60 * 24);           // 일주일 전
            sDate = date.getFullYear() + common.lpad(sDate.getMonth() + 1,2,"0") + common.lpad(sDate.getDate()+1,2,"0");      // 일주일전
        }else if($('input[name="joinDate"]:checked').val() == "2"){               // 전일
            eDate = date.getFullYear() + common.lpad(date.getMonth() + 1,2,"0") + common.lpad(date.getDate(),2,"0");      // 어제
            sDate = date.getFullYear() + common.lpad(date.getMonth() + 1,2,"0") + common.lpad(date.getDate()-1,2,"0");      //어제
        }else if($('input[name="joinDate"]:checked').val() == "3"){               // 당일
            sDate = date.getFullYear() + common.lpad(date.getMonth() + 1,2,"0") + common.lpad(date.getDate(),2,"0");        //오늘
        }else if($('input[name="joinDate"]:checked').val() == "4") {               // 선택
            $("#txt_selDate").val(date.getFullYear() +"-"+ common.lpad(date.getMonth() + 1,2,"0") +"-"+ common.lpad(date.getDate(),2,"0"))
        }
        getUserInfo();
    });

    var tmp_memWithdrawal;
    var tmp_period;
    var tmp_sDate;
    var tmp_eDate;

    var memWithdrawal = "0";
    var dtList_info;
    var dtList_info_data = function ( data ) {
        data.memWithdrawal = memWithdrawal;
        data.period = $('input[name="joinDate"]:checked').val();
        if($('input[name="joinDate"]:checked').val() != "4" && $('input[name="joinDate"]:checked').val() != "3") {               // 선택
            data.sDate = sDate;
            data.eDate = eDate;
        }else if($('input[name="joinDate"]:checked').val() == "3" ){
            data.sDate = sDate;
        }else if($('input[name="joinDate"]:checked').val() == "4" ){
            data.sDate = $("#txt_selDate").val().replace(/-/gi, "");
        }

        console.log("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
        console.log(data);
    };
    dtList_info = new DalbitDataTable($("#tb_memberList"), dtList_info_data, MemberDataTableSource.joinList);
    dtList_info.useCheckBox(false);
    dtList_info.useIndex(true);
    dtList_info.useInitReload(false);
    dtList_info.setPageLength(100);
    dtList_info.createDataTable(joinListSummary);

    var dtList_info2;
    var dtList_info_data2 = function ( data ) {
        data.memWithdrawal = memWithdrawal;
        data.period = $('input[name="joinDate"]:checked').val();
        if($('input[name="joinDate"]:checked').val() != "4") {               // 선택
            data.sDate = sDate;
            data.eDate = eDate;
        }else if($('input[name="joinDate"]:checked').val() == "3" ){
            data.sDate = sDate;
        }else if($('input[name="joinDate"]:checked').val() == "4" ){
            data.sDate = $("#txt_selDate").val().replace(/-/gi, "");
        }
    };
    dtList_info2 = new DalbitDataTable($("#tb_withdrawalList"), dtList_info_data2, MemberDataTableSource.withdrawalList);
    dtList_info.useCheckBox(false);
    dtList_info2.useIndex(true);
    dtList_info2.useInitReload(false);
    dtList_info.setPageLength(100);
    dtList_info2.createDataTable(withdrawalListSummary);

    var excel = '<button class="btn btn-default btn-sm print-btn pull-right" type="button" id="excelDownBtn"><i class="fa fa-print"></i>Excel Down</button>';
    $("#memberList").find(".footer-right").append(excel);

    var withdrawal_excel = '<button class="btn btn-default btn-sm print-btn pull-right" type="button" id="withdrawal_excelDownBtn"><i class="fa fa-print"></i>Excel Down</button>';
    $("#withdrawalList").find(".footer-right").append(withdrawal_excel);

    function getUserInfo() {                 // 검색
        if(memWithdrawal == "0"){
            dtList_info.reload(joinListSummary);
        }else{
            dtList_info2.reload(withdrawalListSummary);
        }
        tmp_memWithdrawal = memWithdrawal;
        tmp_period = $('input[name="joinDate"]:checked').val();
        if($('input[name="joinDate"]:checked').val() != "4" && $('input[name="joinDate"]:checked').val() != "3") {               // 선택
            tmp_sDate = sDate;
            tmp_eDate = eDate;
        }else if($('input[name="joinDate"]:checked').val() == "3" ){
            tmp_sDate = sDate;
        }else if($('input[name="joinDate"]:checked').val() == "4" ){
            tmp_sDate = $("#txt_selDate").val().replace(/-/gi, "");
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
        formData.append("period", tmp_period);
        formData.append("sDate", tmp_sDate);
        formData.append("eDate", tmp_eDate);
        util.excelDownload($(this), "/rest/member/join/listExcel", formData);
    });

    $('#withdrawal_excelDownBtn').on('click', function(){
        var formElement = document.querySelector("form");
        var formData = new FormData(formElement);
        formData.append("period", tmp_period);
        formData.append("sDate", tmp_sDate);
        formData.append("eDate", tmp_eDate);
        util.excelDownload($(this), "/rest/member/join/withdrawalListExcel", formData);
    });
    /*==================================*/
</script>


<!-- summary -->
<script id="joinList_tableSummary" type="text/x-handlebars-template">
    <table class="table table-bordered table-summary pull-right">
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
    <table class="table table-bordered table-summary pull-right">
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