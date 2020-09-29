<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
</style>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="widget-content">
            <ul class="nav nav-tabs nav-tabs-custom-colored" role="tablist" id="tablist_con">
                <li><a href="#total" role="tab" data-toggle="tab" id="tab_payTime">시간대별</a></li>
                <li class="active"><a href="#history" role="tab" data-toggle="tab" id="tab_payHistory">일간결제</a></li>
                <li><a href="#month" role="tab" data-toggle="tab" id="tab_payMonth">월간결제</a></li>
                <li><a href="#year" role="tab" data-toggle="tab" id="tab_payYear">연간결제</a></li>
                <li><a href="#try" role="tab" data-toggle="tab" id="tab_payTry">결제 성공/시도</a></li>
                <li><a href="#cancel" role="tab" data-toggle="tab" id="tab_payCancel">결제 취소</a></li>
                <li><a href="#member" role="tab" data-toggle="tab" id="tab_payAge">결제 회원별</a></li>
                <li><a href="#way" role="tab" data-toggle="tab" id="tab_payWay">결제 수단별</a></li>
                <li><a href="#product" role="tab" data-toggle="tab" id="tab_payCode">결제 상품별</a></li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane fade" id="total"><jsp:include page="payTime.jsp"/></div>              <!-- 총계 -->
                <div class="tab-pane fade in active" id="history"><jsp:include page="history.jsp"/></div>          <!-- 결제 내역 -->
                <div class="tab-pane fade" id="month"><jsp:include page="payMonth.jsp"/></div>          <!-- 결제 내역 -->
                <div class="tab-pane fade" id="year"><jsp:include page="payYear.jsp"/></div>          <!-- 결제 내역 -->
                <div class="tab-pane fade" id="try"><jsp:include page="try.jsp"/></div>            <!-- 결제 취소 -->
                <div class="tab-pane fade" id="cancel"><jsp:include page="cancel.jsp"/></div>            <!-- 결제 취소 -->
                <div class="tab-pane fade" id="member"><jsp:include page="age.jsp"/></div>            <!-- 결제 회원별 -->
                <div class="tab-pane fade" id="way"><jsp:include page="way.jsp"/></div>                  <!-- 결제 수단별 -->
                <div class="tab-pane fade" id="product"><jsp:include page="code.jsp"/></div>          <!-- 결제 상품별 -->
            </div>
        </div>
    </div>
    <!-- /#page-wrapper -->
</div>
<!-- /#wrapper -->

<script type="text/javascript">
    var tabId = "tab_payHistory";
    var _searchText = 0;
    $("#tablist_con li a").on('click', function(){
        tabId = $(this).prop('id');
        $("#slctTypeArea").hide();
        $("#txt_search").hide();

        _searchText = 0;
        if(tabId == 'tab_payTime' || tabId == 'tab_payTry' || tabId == 'tab_payHistory' || tabId == 'tab_payCancel'){
            _datePicker = 0;
            if(tabId == 'tab_payHistory' || tabId == 'tab_payCancel'){
                _searchText = 1;
            }
        }else if(tabId == 'tab_payMonth'){
            _datePicker = 1;
        }else if(tabId == 'tab_payYear'){
            _datePicker = 2;
        }else if(tabId == 'tab_payAge' || tabId == 'tab_payWay' || tabId == 'tab_payCode'){
            if($('input[name="slctType"]:checked').val() == 0){
                _datePicker = 0;
            }else if($('input[name="slctType"]:checked').val() == 1){
                _datePicker = 1;
            }else{
                _datePicker = 2;
            }
            $("#slctTypeArea").show();
        }
        clickTab = true;
        changeDatepicker();
        if(tabId == 'tab_payTime'){
            getPayTimeList();
        }else if(tabId == 'tab_payHistory'){
            getStatPayInfo();
        }else if(tabId == 'tab_payMonth'){
            getPayMonthList();
        }else if(tabId == 'tab_payYear'){
            getPayYearList();
        }else if(tabId == 'tab_payTry'){
            getPayTryList();
        }else if(tabId == 'tab_payAge'){
            getPayAgeList();
        }else if(tabId == 'tab_payWay'){
            getPayWayList();
        }else if(tabId == 'tab_payCode'){
            getPayCodeList();
        }else if(tabId == 'tab_payCancel'){
            getPayCancelList();
        }
    });

    $("#bt_search").on('click', function(){
        if(tabId == 'tab_payTime'){
            getPayTimeList();
        }else if(tabId == 'tab_payHistory'){
            tmp_ostype = -1;
            tmp_innerType = 0;
            tmp_payWay = "all";

            getStatPayInfo();
        }else if(tabId == 'tab_payMonth'){
            getPayMonthList();
        }else if(tabId == 'tab_payYear'){
            getPayYearList();
        }else if(tabId == 'tab_payTry'){
            getPayTryList();
        }else if(tabId == 'tab_payAge'){
            getPayAgeList();
        }else if(tabId == 'tab_payWay'){
            getPayWayList();
        }else if(tabId == 'tab_payCode'){
            getPayCodeList();
        }else if(tabId == 'tab_payCancel'){
            getPayCancelList();
        }
    });
</script>