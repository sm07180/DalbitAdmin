<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="wrapper">
    <div id="page-wrapper">
        <!-- serachBox -->
        <form id="searchForm">
            <div class="col-lg-7 form-inline no-padding">
                <div class="widget widget-table searchBoxArea">
                    <div class="widget-header searchBoxRow">
                        <h3 class="title"><i class="fa fa-search"></i> 검색</h3>
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
                        </div>
                    </div>
                </div>
            </div>

             <div class="col-md-5 no-padding pull-right">
                <table class="pull-right _tableHeight" style="text-align: left;width: 670px;border: 1px solid black" data-height="23px">
                    <colgroup>
                        <col width="8%"><col width="48%"><col width="8%"><col width="36%">
                    </colgroup>
                    <tr>
                        <td rowspan="3" style="text-align: left" class="font-bold"><span style="font-size: 9px">결제상태</span></td>
                        <td style="text-align: left"><span style="font-size: 11px"><span style="color: blue" class="font-bold">Y (성공)</span> : 결제 성공</span></td>
                        <td rowspan="3"  style="text-align: left" class="font-bold"><span style="font-size: 11px">취소상태</td>
                        <td style="text-align: left"><span style="font-size: 11px"><span style="color: blue" class="font-bold">O (성공)</span> : 취소 성공</span></td>
                    </tr>
                    <tr>
                        <td style="text-align: left"><span style="font-size: 11px"><span style="color: black" class="font-bold">N (시도)</span> : 결제 시도를 했으나 창을 닫거나 멈춘경우</span></td>
                        <td style="text-align: left"><span style="font-size: 11px"><span style="color: red" class="font-bold">X (불가)</span> : 취소 불가</span></td>
                    </tr>
                    <tr>
                        <td style="text-align: left"><span style="font-size: 11px"><span style="color: red" class="font-bold">F (실패)</span> : 결제창까지 이르렀으나 완료 실패</span></td>
                        <td style="text-align: left"><span style="font-size: 11px"><span style="color: black" class="font-bold">F (실패)</span> : 취소 시도후 사유로 인한 실패</span></td>
                    </tr>
                </table>
            </div>

            <!-- //serachBox -->
        </form>
        <div id="payList"><jsp:include page="./payList.jsp"/></div>

    </div> <!-- //page-wrapper -->
</div> <!-- //wrapper -->

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
        init();
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

        getPaySearch();
    }
    function setStartDay(){
        var date = new Date();
        $("#endDate").val(dateTime);

        if(_searchFormRadio == 1) {     // 일주일 전
            sDate = new Date(Date.parse(date) - 7 * 1000 * 60 * 60 * 24);           // 일주일 전
            sDate = date.getFullYear() +"."+ common.lpad(sDate.getMonth() + 1,2,"0") +"."+ common.lpad(sDate.getDate()+1,2,"0");      // 일주일전
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

        getPaySearch();
    }

    $('input[id="txt_search"]').keydown(function() {
        if (event.keyCode === 13) {
            getPaySearch();
        };
    });

    $('#bt_search').click( function() {       //검색
        getPaySearch();
    });

    function init(){
        txt_search = $('#txt_search').val();
        sDate = $("#startDate").val();
        eDate = $("#endDate").val();
        memberDataType = 99;
        getPayList("payment");
    }

    function getPaySearch(){
        sDate = $("#startDate").val();
        eDate = $("#endDate").val();

        txt_search = $('#txt_search').val();
        tmp_sDate = sDate;
        tmp_eDate = eDate;
        memberDataType = 99;
        dtList_info_pay.reload(pay_listSummary);
    }

</script>